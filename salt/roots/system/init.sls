# Set computer name to minion id
{% set system = salt['grains.get']('id') %}

set_name:
  win_system.computer_name:
    - name: {{ system }}