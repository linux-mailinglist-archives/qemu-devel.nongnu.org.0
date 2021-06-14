Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A13A6430
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:20:29 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskdo-0006sp-BB
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskam-0002Ei-GC
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:17:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:47093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskYq-0002Ab-7J
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:17:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so12545097wmq.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BW60v/kgjlKKSkuXDMpFKwiD3aZ/6hJ/OHE+wWzx3Hk=;
 b=QGYKrvZOb+RWWE8OGyDqgKnDDHafWRjX07j6phRqwz5mySV8waKGljlJlf2+7ZzBXw
 rrh4aGinB+SNYjPmxsG3qWP5TkEbG92rqcrQB2rU63aaL9QagC1vlJGduLQ3ZFQdDlq+
 YrV6NnI+Cbaa9doBqoetxS1QMhuxPyLUjt/GzihqJDp0Su1mkRe/ckYFoyKOjgyaVQnW
 GuAyqRLIKtfvlIJtyMd72d9LErRmVo2fsBjGIkh4HoVMzD4YAE3nsEJtp0ZVX/iM1YYL
 ochF+2YEfBXar5AHuKNvlq3CeRicOHPyAS/1hZhrRvtlyjEtMuBY9QkqpamiUrCT790H
 EAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BW60v/kgjlKKSkuXDMpFKwiD3aZ/6hJ/OHE+wWzx3Hk=;
 b=dPUAEKynkIX/epVQkq5Cb9CL8BizfVoCY1EHj+riPvYsYkw07LoZtDLKRPoGM+cTeH
 4TwlGMOQyO7NfEwoUsju/uzjbDi3oO968+Gl31bxdo1D+QICEs1KtbQKK926P1Am9dEt
 aLUy8VEy1fWizUKnMcC3iCkqo9l05XIoeOdLA11cdRZJwQjfacaCeYZRuHICLLTg2unt
 9M6rPBaHQN/uQRU6NDxn37HdLXiGU27s4m9uIKYPODIzBOctPZOxsCG2nihgdzrCxhiL
 fnuWTtA0FhNXXIIGMFrnLQfzL0WGT0ZaeUVv45UTYpp+QsK2VIGm9UoBn2nzu5HkghN7
 y90w==
X-Gm-Message-State: AOAM532I5CcEcD/ng7hC8bJp31PMOocC5qQ8TlLltFrn0px0JPW5xkLI
 fGBDyi8N1qVrhEaOCzchn98=
X-Google-Smtp-Source: ABdhPJzNdIykGJxNIvIngl5szy4aQFsEijSIiyuIF1MZpj6/qO4M6VuXtlo8+X93ArtXnvfGd8m9RA==
X-Received: by 2002:a1c:5f86:: with SMTP id
 t128mr32812151wmb.165.1623669318724; 
 Mon, 14 Jun 2021 04:15:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u20sm12642351wmq.24.2021.06.14.04.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:15:17 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Add jobs to build standalone machines
To: qemu-devel@nongnu.org
References: <20210525152924.4171401-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eff862bc-ba84-b884-0843-9e2db754270c@amsat.org>
Date: Mon, 14 Jun 2021 13:15:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525152924.4171401-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 5/25/21 5:29 PM, Philippe Mathieu-Daudé wrote:
> The --without-default-devices configure option removes the
> 'default=y' from Kconfig files. It is useful to test missing
> Kconfig dependencies for users wanting to have QEMU (system)
> binaries with a particular subset of machines builtin.
> 
> If a machine can be built standalone, it can certainly be
> built as part of a set. So the best way to test for regressions
> is to test each machine individually.
> 
> As this is painful to test manually, add CI jobs to do it [*].
> Since all jobs follow the same template, to ease maintenance
> we generate the jobs using the jsonnet tool, which emit a YAML
> file filled with all our jobs.
> 
> Since there is no "--enable-my-config" option, we have to write
> the standalone config manually, overwritting each target .mak
> file in default-configs/devices/.
> 
> The job is set to manual (there is no change in the current
> set of jobs), but can be started automatically by setting the
> QEMU_CI_STANDALONE_MACHINE_TESTING variable.
> 
> [*] https://docs.gitlab.com/ee/ci/yaml/#trigger-child-pipeline-with-generated-configuration-file
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Example: https://gitlab.com/philmd/qemu/-/pipelines/309272883
> 
> Based-on: <20210525082556.4011380-1-f4bug@amsat.org>
> ---
>  .gitlab-ci.d/qemu-project.yml             |  1 +
>  .gitlab-ci.d/standalone-jobs-template.yml | 32 ++++++++++
>  .gitlab-ci.d/standalone-jobs.jsonnet      | 74 +++++++++++++++++++++++
>  .gitlab-ci.d/standalone-jobs.yml          | 27 +++++++++
>  .gitlab-ci.yml                            |  3 +
>  5 files changed, 137 insertions(+)
>  create mode 100644 .gitlab-ci.d/standalone-jobs-template.yml
>  create mode 100644 .gitlab-ci.d/standalone-jobs.jsonnet
>  create mode 100644 .gitlab-ci.d/standalone-jobs.yml
> 
> diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
> index 64cb2ba1da5..4018c48761c 100644
> --- a/.gitlab-ci.d/qemu-project.yml
> +++ b/.gitlab-ci.d/qemu-project.yml
> @@ -9,3 +9,4 @@ include:
>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>    - local: '/.gitlab-ci.d/buildtest.yml'
>    - local: '/.gitlab-ci.d/static_checks.yml'
> +  - local: '/.gitlab-ci.d/standalone-jobs.yml'
> diff --git a/.gitlab-ci.d/standalone-jobs-template.yml b/.gitlab-ci.d/standalone-jobs-template.yml
> new file mode 100644
> index 00000000000..23e60cb4069
> --- /dev/null
> +++ b/.gitlab-ci.d/standalone-jobs-template.yml
> @@ -0,0 +1,32 @@
> +.native_build_standalone_job_template:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  variables:
> +    IMAGE: fedora
> +    CONFIGURE_ARGS:
> +      --without-default-devices
> +      --disable-user
> +      --disable-tools
> +      --disable-docs
> +  before_script:
> +    - JOBS=$(expr $(nproc) + 1)
> +  script:
> +    - for target in $TARGETS ; do
> +        echo > default-configs/devices/${target}-softmmu.mak ;
> +        for line in $DEVICE_CONFIGS ; do
> +          echo "$line"
> +          echo "$line" > default-configs/devices/${target}-softmmu.mak ;
> +        done ;
> +      done
> +    - mkdir build
> +    - cd build
> +    - ../configure --enable-werror $CONFIGURE_ARGS --target-list="$TARGETS"
> +      || { cat config.log meson-logs/meson-log.txt && exit 1; }
> +    - QEMU_BINS=$(echo $(for target in $TARGETS; do echo qemu-system-${target//-softmmu/}; done))
> +    - make -j"$JOBS" $QEMU_BINS
> +    - for binary in $QEMU_BINS ; do
> +        for machine in $(./$binary -M help | egrep -v "^(Supported|none)" | awk '{print $1}') ; do
> +            echo "=== testing $machine with $binary ===" ;
> +            echo q | ./$binary -M $machine -nodefaults -display none $TESTING_ARGS -monitor stdio -S || exit 1 ;
> +        done ;
> +      done
> diff --git a/.gitlab-ci.d/standalone-jobs.jsonnet b/.gitlab-ci.d/standalone-jobs.jsonnet
> new file mode 100644
> index 00000000000..6f403a51091
> --- /dev/null
> +++ b/.gitlab-ci.d/standalone-jobs.jsonnet
> @@ -0,0 +1,74 @@
> +local param_job(targets, configs, cmdline="") =
> +  {
> +    extends: ".native_build_standalone_job_template",
> +
> +    variables: {
> +      TARGETS: targets,
> +      DEVICE_CONFIGS: configs,
> +      TESTING_ARGS: cmdline,
> +    }
> +  };
> +
> +{
> +  include: { "local": "/.gitlab-ci.d/standalone-jobs-template.yml" },
> +
> +  // alpha
> +    "alpha dp264": param_job("alpha-softmmu", "CONFIG_DP264=y"),
> +
> +  // arm
> +
> +  // avr
> +    "avr arduino": param_job("avr-softmmu", "CONFIG_ARDUINO=y"),
> +
> +  // cris
> +
> +  // hexagon
> +
> +  // hppa
> +    "hppa dino": param_job("hppa-softmmu", "CONFIG_DINO=y"),
> +
> +  // i386
> +    "x86 isapc": param_job("i386-softmmu", "CONFIG_ISAPC=y"),
> +    "x86 microvm": param_job("x86_64-softmmu", "CONFIG_MICROVM=y"),
> +
> +  // m68k
> +
> +  // microblaze
> +    "mb zynqmp-pmu": param_job("microblaze-softmmu", "CONFIG_XLNX_ZYNQMP_PMU=y"),
> +    "mb ml605": param_job("microblaze-softmmu", "CONFIG_PETALOGIX_ML605=y"),
> +    "mb s3adsp1800": param_job("microblaze-softmmu", "CONFIG_PETALOGIX_S3ADSP1800=y"),
> +
> +  // mips
> +    "mips jazz": param_job("mips64-softmmu", "CONFIG_FULOONG=y"),
> +    "mips loongson3v": param_job("mips64-softmmu", "CONFIG_LOONGSON3V=y"),
> +    "mips malta": param_job("mips-softmmu mipsel-softmmu", "CONFIG_MALTA=y", "-bios /dev/null"),
> +
> +  // nios2
> +    "nios2 10m50": param_job("nios2-softmmu", "CONFIG_NIOS2_10M50=y"),
> +    "nios2 nommu": param_job("nios2-softmmu", "CONFIG_NIOS2_GENERIC_NOMMU=y"),
> +
> +  // openrisc
> +    "or1k sim": param_job("or1k-softmmu", "CONFIG_OR1K_SIM=y"),
> +
> +  // ppc
> +
> +  // riscv
> +    "riscv opentitan": param_job("riscv32-softmmu", "CONFIG_OPENTITAN=y"),
> +
> +  // rx
> +    "rx gdbsim": param_job("rx-softmmu", "CONFIG_RX_GDBSIM=y", "-bios /dev/null"),
> +
> +  // s390x
> +    "s390 ccw": param_job("s390x-softmmu", "CONFIG_S390_CCW_VIRTIO=y"),
> +
> +  // sh4
> +
> +  // sparc
> +
> +  // tricore
> +    "triboard": param_job("tricore-softmmu", "CONFIG_TRIBOARD=y"),
> +
> +  // xtensa
> +    "xtensa sim": param_job("xtensaeb-softmmu", "CONFIG_XTENSA_SIM=y CONFIG_SEMIHOSTING=y"),
> +    "xtensa virt": param_job("xtensa-softmmu", "CONFIG_XTENSA_VIRT=y CONFIG_SEMIHOSTING=y"),
> +}
> diff --git a/.gitlab-ci.d/standalone-jobs.yml b/.gitlab-ci.d/standalone-jobs.yml
> new file mode 100644
> index 00000000000..b094173ff12
> --- /dev/null
> +++ b/.gitlab-ci.d/standalone-jobs.yml
> @@ -0,0 +1,27 @@
> +build-standalone-machines:
> +  stage: containers
> +  image: alpine:latest
> +  script:
> +    - apk add -U jsonnet
> +    - jsonnet .gitlab-ci.d/standalone-jobs.jsonnet > standalone-jobs-generated.yml
> +  artifacts:
> +    paths:
> +      - standalone-jobs-generated.yml
> +  rules:
> +    # Automatically add the jobs if QEMU_CI_STANDALONE_MACHINE_TESTING is set
> +    - if: '$QEMU_CI_STANDALONE_MACHINE_TESTING'
> +      when: on_success
> +    # Otherwise, set to manual (the jobs are created but not run).
> +    - when: manual
> +      allow_failure: true
> +
> +trigger-standalone-machines:
> +  stage: containers-layer2
> +  needs:
> +    - job: build-standalone-machines
> +    - job: amd64-fedora-container
> +  trigger:
> +    include:
> +      - artifact: standalone-jobs-generated.yml
> +        job: build-standalone-machines
> +    strategy: depend
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 830c5b7af97..8122b0fab3a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -35,6 +35,9 @@
>  #
>  # - QEMU_CI_AVOCADO_TESTING
>  #   If set, tests using the Avocado framework will be run
> +#
> +# - QEMU_CI_STANDALONE_MACHINE_TESTING
> +#   If set, jobs that build QEMU with a single machine will be added
>  
>  include:
>    - local: '/.gitlab-ci.d/qemu-project.yml'
> 

