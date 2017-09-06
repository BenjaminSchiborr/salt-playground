# Set computer name to minion id
{% set c_name = salt['grains.get']('id') %}

set_name:
  system.computer_name:
    - name: {{ c_name }}