#!/usr/bin/env cwl-runner
#
# Authors: Andrew Lamb

cwlVersion: v1.0
class: CommandLineTool
baseCommand: 
- /usr/local/bin/trim_galore

hints:
  DockerRequirement:
    dockerPull: dukegcb/trim-galore

inputs:

- id: fastq1
  type: File
  inputBinding: 
    position: 1

- id: fastq2
  type: File?
  inputBinding: 
    position: 2
      
- id: paired
  type: boolean?
  inputBinding: 
    prefix: --paired

- id: no_report_file
  type: boolean
  default: true
  inputBinding: 
    prefix: --no_report_file


outputs:

  trimmed_fastq_array:
    type: File[]
    outputBinding:
      glob: "*"
