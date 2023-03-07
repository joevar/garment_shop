{% macro send_alert_email(email_address, error_message) %}
    {% set subject = 'dbt build failed with warning/error' %}
    {% set body = error_message %}
    {% set recipient = email_address %}

    {% set outlook = module('pywin32').get_outlook() %}
    {% set message = outlook.CreateItem(0) %}

    {% do message.Subject.Add(subject) %}
    {% do message.To.Add(recipient) %}
    {% do message.Body.Add(body) %}

    {% do message.Send() %}
{% endmacro %}

