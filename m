Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC13AB1A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:51:42 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpcb-0007RZ-GT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltpbB-0006lO-BQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:50:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltpb6-0004Cy-7y
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:50:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id m18so6238878wrv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HN3yoMfoaG1x5goUOqwcJ9nj+WFGI1sSzdrYNWG6YOU=;
 b=soMT0S3Xs3L/C31uZEyR3kJkJaJua0mUmwO21eEwVGkIP2D326F7Paz9eAbGzsPbDU
 3XiM/dbq0msH30hGyf0K5EKEmZIKmKhCzC3UQQ7Yei5KglNp9sy29r835yLr8IUVhl8D
 KF4Flm6P8j2IoVLZmTw6sLrfN8GH/gSgLdIjP1kvH230vvPROCm6y007r8eFAhBFSAMu
 V1f3BqXo+hYyhKnT2jbIi1JoJfztXqKMnxmMK1xy+DJUUKR0wbsBbtnHyq8vbF1hiCd/
 KVJOCBYWopGcRt9GDbduj9euvP710aEJvk9cVCRcTVCuP0ZRSCmcbLw70deyRCREJO5T
 YpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HN3yoMfoaG1x5goUOqwcJ9nj+WFGI1sSzdrYNWG6YOU=;
 b=IesFirUI9ycXanFns8IKeiJ0VFHRqquc/D4wNAAP3nuRoWtTPMobIWqkY/KAn6L2uV
 1HY7qlfRdqnR11BHMVPO1mjV0RJYVv0nAFak6yT4BKubT+bXuvIFXMBqZWkkwR6nt28u
 uK8a+akES2BorkRzhhdCRyOf32oypFDxXvsoLbXheGhn6EuPybAceuQBUWUIAPc5B/RR
 hRwNzZp61TXR+DsHZe41tk5Fvc618vOrXlMAPuESgL6/oyRshxMX3HVZldTPMVPiqdwU
 0CYFH8ZMJ1lTS8gzfJsIeAAwS0cza4GYJWTQqh0vhhm3MRBPs406uNsRF/L0krkcSShx
 DgwA==
X-Gm-Message-State: AOAM532EN/QCKR9ayirhytTu4vvgR3SQIn/FTIAvyAtqG3TRiGpzJnGU
 d5HhTIBv13mukh3DjQzLGG9/+w==
X-Google-Smtp-Source: ABdhPJxivdo7IE7wA2REOwpqsZqw4M/qr2IBS21Nhilzebs6k9nabivmwR6nLA8OuKOla7ltT6nQvg==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr4858985wru.341.1623927006384; 
 Thu, 17 Jun 2021 03:50:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm1582670wrp.51.2021.06.17.03.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 03:50:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CD911FF7E;
 Thu, 17 Jun 2021 11:50:04 +0100 (BST)
References: <20210525152924.4171401-1-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] gitlab-ci: Add jobs to build standalone machines
Date: Thu, 17 Jun 2021 11:42:39 +0100
In-reply-to: <20210525152924.4171401-1-f4bug@amsat.org>
Message-ID: <877disg3z7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 =?utf-8?Q?Daniel_P_=2E_Berran?= =?utf-8?Q?g=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The --without-default-devices configure option removes the
> 'default=3Dy' from Kconfig files. It is useful to test missing
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

Yet....

> The job is set to manual (there is no change in the current
> set of jobs), but can be started automatically by setting the
> QEMU_CI_STANDALONE_MACHINE_TESTING variable.

I'm wary of tests that don't get run automatically because it generally
means they won't be. However it also explodes the matrix with even more
builds so I can see the desire to avoid that.

>
> [*] https://docs.gitlab.com/ee/ci/yaml/#trigger-child-pipeline-with-gener=
ated-configuration-file
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
> diff --git a/.gitlab-ci.d/standalone-jobs-template.yml b/.gitlab-ci.d/sta=
ndalone-jobs-template.yml
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
> +    - JOBS=3D$(expr $(nproc) + 1)
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
> +    - ../configure --enable-werror $CONFIGURE_ARGS --target-list=3D"$TAR=
GETS"
> +      || { cat config.log meson-logs/meson-log.txt && exit 1; }
> +    - QEMU_BINS=3D$(echo $(for target in $TARGETS; do echo qemu-system-$=
{target//-softmmu/}; done))
> +    - make -j"$JOBS" $QEMU_BINS
> +    - for binary in $QEMU_BINS ; do
> +        for machine in $(./$binary -M help | egrep -v "^(Supported|none)=
" | awk '{print $1}') ; do
> +            echo "=3D=3D=3D testing $machine with $binary =3D=3D=3D" ;
> +            echo q | ./$binary -M $machine -nodefaults -display none $TE=
STING_ARGS -monitor stdio -S || exit 1 ;
> +        done ;
> +      done
> diff --git a/.gitlab-ci.d/standalone-jobs.jsonnet b/.gitlab-ci.d/standalo=
ne-jobs.jsonnet
> new file mode 100644
> index 00000000000..6f403a51091
> --- /dev/null
> +++ b/.gitlab-ci.d/standalone-jobs.jsonnet
> @@ -0,0 +1,74 @@
> +local param_job(targets, configs, cmdline=3D"") =3D
> +  {
> +    extends: ".native_build_standalone_job_template",
> +
> +    variables: {
> +      TARGETS: targets,
> +      DEVICE_CONFIGS: configs,
> +      TESTING_ARGS: cmdline,
> +    }
> +  };

I'm reluctant to have a parallel configuration architecture here. If we
are going to test these then let's get the configure support in first.

> +
> +{
> +  include: { "local": "/.gitlab-ci.d/standalone-jobs-template.yml" },
> +
> +    "alpha dp264": param_job("alpha-softmmu", "CONFIG_DP264=3Dy"),
> +    "avr arduino": param_job("avr-softmmu", "CONFIG_ARDUINO=3Dy"),
> +    "hppa dino": param_job("hppa-softmmu", "CONFIG_DINO=3Dy"),
> +    "nios2 10m50": param_job("nios2-softmmu", "CONFIG_NIOS2_10M50=3Dy"),
> +    "nios2 nommu": param_job("nios2-softmmu", "CONFIG_NIOS2_GENERIC_NOMM=
U=3Dy"),
> +    "or1k sim": param_job("or1k-softmmu", "CONFIG_OR1K_SIM=3Dy"),
> +    "rx gdbsim": param_job("rx-softmmu", "CONFIG_RX_GDBSIM=3Dy", "-bios =
/dev/null"),
> +    "triboard": param_job("tricore-softmmu", "CONFIG_TRIBOARD=3Dy"),
> +    "xtensa sim": param_job("xtensaeb-softmmu", "CONFIG_XTENSA_SIM=3Dy C=
ONFIG_SEMIHOSTING=3Dy"),
> +    "xtensa virt": param_job("xtensa-softmmu", "CONFIG_XTENSA_VIRT=3Dy C=
ONFIG_SEMIHOSTING=3Dy"),

Do we really have a plethora of users running trimmed down custom
configurations that we need to defend each of these exotic build
combinations in the CI?

> +
> +  // i386
> +    "x86 isapc": param_job("i386-softmmu", "CONFIG_ISAPC=3Dy"),
> +    "x86 microvm": param_job("x86_64-softmmu", "CONFIG_MICROVM=3Dy"),

> +  // s390x
> +    "s390 ccw": param_job("s390x-softmmu", "CONFIG_S390_CCW_VIRTIO=3Dy"),

I think is possibly a valid use case.=20

<snip>
> +  // microblaze
> +    "mb zynqmp-pmu": param_job("microblaze-softmmu", "CONFIG_XLNX_ZYNQMP=
_PMU=3Dy"),
> +    "mb ml605": param_job("microblaze-softmmu", "CONFIG_PETALOGIX_ML605=
=3Dy"),
> +    "mb s3adsp1800": param_job("microblaze-softmmu", "CONFIG_PETALOGIX_S=
3ADSP1800=3Dy"),
> +
> +  // mips
> +    "mips jazz": param_job("mips64-softmmu", "CONFIG_FULOONG=3Dy"),
> +    "mips loongson3v": param_job("mips64-softmmu", "CONFIG_LOONGSON3V=3D=
y"),
> +    "mips malta": param_job("mips-softmmu mipsel-softmmu", "CONFIG_MALTA=
=3Dy", "-bios /dev/null"),
> +
> +  // riscv
> +    "riscv opentitan": param_job("riscv32-softmmu", "CONFIG_OPENTITAN=3D=
y"),

Again I'm not sure how many emulation targets really want to cut down to
a minimal configuration.

--=20
Alex Benn=C3=A9e

