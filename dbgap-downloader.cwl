class: CommandLineTool
cwlVersion: v1.2
$namespaces:
  sbg: 'https://sevenbridges.com'
id: dave/cwl-apps/dbgap-downloader/14
baseCommand:
  - echo
  - '"EXECUTING";'
  - bash
  - dbGAP_downloader.sh
inputs:
  - id: id
    type: string
  - id: address
    type: string
  - id: key
    type: File
    inputBinding:
      shellQuote: false
      position: 0
    label: decryption key
    doc: dbGAP project decryption key file
outputs:
  - id: output
    type: Directory?
    outputBinding:
      glob: dbgap_dl
      loadListing: deep_listing
  - id: output_decrypt
    type: Directory?
    outputBinding:
      glob: decrypt
      loadListing: deep_listing
label: dbGAP_Downloader
requirements:
  - class: ShellCommandRequirement
  - class: LoadListingRequirement
  - class: DockerRequirement
    dockerPull: >-
      images.sb.biodatacatalyst.nhlbi.nih.gov/dave/dbgap-downloader:20210624_jentest
  - class: InitialWorkDirRequirement
    listing:
      - entryname: aspera.sh
        entry: "#!/bin/bash          \r\n#from Josh Bis\r\n\r\nkey=$1\r\naddress=$2\r\nDIR= (echo $2 | cut -d \"/\" -f 4)\r\necho \"Value of key: '$key'\"\r\necho \"Value of address: '$address'\"\r\necho \"Value of dir: '$DIR'\"\r\n\r\n# download -- include key and ID\r\n/AsperaCLI/bin/ascp -QTr -l 300M -k 1 -i /Users/joshbis/Applications/AsperaCLI/etc/asperaweb_id_dsa.openssh -W $key $address /Users/joshbis/Desktop/dbg_down/\r\n\r\n\r\n/AsperaCLI/bin/ascp -QTr -l 300M -k 1 \\ \r\n-i “/home/dnanexus/.aspera/connect/etc/asperaweb_id_dsa.openssh” \\\r\n-W A09C12B2227B345B7A1C7EFA5C722420BC62D536CE4E84EA3925278D9699AA8D2D5C21A2693BC46F299D8620CEB02B9F9D \\\r\ndbtest@gap-upload.ncbi.nlm.nih.gov:data/instant/brodyj/82873 \\\r\n./\r\n\r\n\r\n\r\n\r\n# decrypt\r\n#/Applications/sratoolkit/bin/vdb-decrypt /Users/joshbis/Desktop/dbg_down/$DIR --ngc /Users/joshbis/Dropbox/prj_11260_D25582.ngc"
        writable: false
      - entryname: dbGAP_downloader.sh
        entry: >-
          echo "RUNNING SHELL SCRIPT"


          cd


          mkdir dbgap_dl

          mkdir decrypt


          /home/aspera/.aspera/connect/bin/ascp -QTr -l 300M -k 1 -i
          "/home/aspera/.aspera/connect/etc/asperaweb_id_dsa.openssh" \

          -W $(inputs.id) \

          $(inputs.address) \

          dbgap_dl


          wait


          ls



          ls dbgap_dl/[0-9][0-9][0-9][0-9][0-9]

          mv dbgap_dl/[0-9][0-9][0-9][0-9][0-9]/* decrypt/


          ls decrypt

          /home/aspera/sratoolkit.2.11.0-centos_linux64/bin/vdb-decrypt decrypt
          --ngc $(inputs.key.path)
        writable: false
  - class: InlineJavascriptRequirement
hints:
  - class: 'sbg:SaveLogs'
    value: '*.sh'
'sbg:projectName': CWL-Apps
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedBy': dave
    'sbg:modifiedOn': 1624561384
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedBy': dave
    'sbg:modifiedOn': 1624561835
    'sbg:revisionNotes': ''
  - 'sbg:revision': 2
    'sbg:modifiedBy': dave
    'sbg:modifiedOn': 1624562411
    'sbg:revisionNotes': ''
  - 'sbg:revision': 3
    'sbg:modifiedBy': dave
    'sbg:modifiedOn': 1624564533
    'sbg:revisionNotes': ''
  - 'sbg:revision': 4
    'sbg:modifiedBy': dave
    'sbg:modifiedOn': 1624564643
    'sbg:revisionNotes': ''
  - 'sbg:revision': 5
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624566298
    'sbg:revisionNotes': changed to home dir at start of shell script
  - 'sbg:revision': 6
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624566491
    'sbg:revisionNotes': changed dbGAP_downloader file to dbGAP_downloader.sh
  - 'sbg:revision': 7
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624567643
    'sbg:revisionNotes': 'debug info, trying to find why it doens''t find shell script'
  - 'sbg:revision': 8
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624574157
    'sbg:revisionNotes': 'attempting to add decryption. New Docker, shell script and params'
  - 'sbg:revision': 9
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624575078
    'sbg:revisionNotes': ''
  - 'sbg:revision': 10
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624575103
    'sbg:revisionNotes': fixed docker name
  - 'sbg:revision': 11
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624577576
    'sbg:revisionNotes': parens with input
  - 'sbg:revision': 12
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624578099
    'sbg:revisionNotes': 'changed to relative path, desperation has set in'
  - 'sbg:revision': 13
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624578928
    'sbg:revisionNotes': removed quotes from decrypt command
  - 'sbg:revision': 14
    'sbg:modifiedBy': brodyjen
    'sbg:modifiedOn': 1624579404
    'sbg:revisionNotes': fixed decrypt executable path
'sbg:image_url': null
'sbg:appVersion':
  - v1.2
'sbg:id': dave/cwl-apps/dbgap-downloader/14
'sbg:revision': 14
'sbg:revisionNotes': fixed decrypt executable path
'sbg:modifiedOn': 1624579404
'sbg:modifiedBy': brodyjen
'sbg:createdOn': 1624561384
'sbg:createdBy': dave
'sbg:project': dave/cwl-apps
'sbg:sbgMaintained': false
'sbg:validationErrors': []
'sbg:contributors':
  - brodyjen
  - dave
'sbg:latestRevision': 14
'sbg:publisher': sbg
'sbg:content_hash': aba5fdebc287e1138a6de90b6719c9fd12453dbc70a60aaaaa54265d13b20caae
