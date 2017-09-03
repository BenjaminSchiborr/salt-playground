# Set computer name to minion id
{% set h_name = salt['grains.get']('id') %}

set_name:
  system.computer_name:
    - name: {{ h_name }}