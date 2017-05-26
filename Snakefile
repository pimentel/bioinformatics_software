include: 'config.py'

KALLISTO = BASE + '/bin/kallisto'
BOWTIE2 = BASE + '/bin/bowtie2'
CUFFLINKS = BASE + '/bin/cufflinks'

rule all:
    input:
        KALLISTO,
        BOWTIE2,
        CUFFLINKS

rule install_kallisto:
    output:
        KALLISTO
    params:
        url = 'https://github.com/pachterlab/kallisto/releases/download/v0.43.1'
    run:
        suffix = 'kallisto_mac-v0.43.1.tar.gz' if OS == 'mac' else 'kallisto_linux-v0.43.1.tar.gz'
        shell('curl -L {params.url}/{suffix} --output {suffix}')
        shell('tar -xf {suffix}')
        shell('mv kallisto*/kallisto {BASE}/bin')
        shell('rm -rf kallisto*')

rule bowtie2:
    output:
        BOWTIE2
    params:
        url = 'https://github.com/BenLangmead/bowtie2/releases/download/v2.3.2'
    run:
        suffix = 'bowtie2-2.3.2-macos-x86_64.zip' if OS == 'mac' else 'bowtie2-2.3.2-linux-x86_64.zip'
        shell('curl -L {params.url}/{suffix} --output {suffix}')
        shell('unzip -q {suffix}')
        shell('mv bowtie2*/bowtie2* {BASE}/bin')
        shell('rm -rf bowtie2*')

rule cufflinks:
    output:
        CUFFLINKS
    params:
        url = 'http://cole-trapnell-lab.github.io/cufflinks/assets/downloads'
    run:
        suffix = 'cufflinks-2.2.1.OSX_x86_64.tar.gz' if OS == 'mac' else 'cufflinks-2.2.1.Linux_x86_64.tar.gz'

        shell('curl -L {params.url}/{suffix} --output {suffix}')
        shell('tar -xf {suffix}')
        shell('mv cufflinks*/cuff* cufflinks*/gffread cufflinks*/gtf_to_sam {BASE}/bin')
        shell('rm -rf cufflinks*')
