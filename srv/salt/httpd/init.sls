# Import JSON map file
{% import_json 'httpd/map.json' as osmap %}


# Filter the structured data (dictionary) using the 'os_family' grain
{% set httpd = salt['grains.filter_by'](osmap) %}

implement_httpd:
  pkg.installed:
    - name: {{ httpd.pkg }}

#http_conf:
#  file.managed:
#    - name: /etc/httpd/conf/httpd.conf
#    - source: salt://apache/httpd.conf

start_httpd:
  service.running:
    - name: {{ httpd.srv }}
    - enable: True
