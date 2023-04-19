import logging
from opentelemetry import trace
from opentelemetry.exporter import syslog
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchExportSpanProcessor

# Set up the tracer and span processor
trace.set_tracer_provider(TracerProvider())
span_processor = BatchExportSpanProcessor(syslog.SyslogExporter(address="syslog_collector_ip:514"))
trace.get_tracer_provider().add_span_processor(span_processor)

# Set up the logger with the tracer
logger = logging.getLogger(__name__)
logger.addHandler(trace.get_tracer_provider().get_tracer(__name__).span_processor)

# Send a message to syslog
logger.warning('This is a syslog message sent from Python with OpenTelemetry')
