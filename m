Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856244506CD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:25:45 +0100 (CET)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmcvY-0001jK-6U
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:25:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcsx-0000Bs-QQ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:23:06 -0500
Received: from [2a00:1450:4864:20::433] (port=42953
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcsu-0003An-UB
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:23:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so30985322wrd.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wNDNSWjByKFkWc+TKVnYOtDX1Gypl7cQhv7rds0bw04=;
 b=DK6fnM7XP22ZuJeW343DA0ViiPxrR9YKWeE+i1YENw8dSxTzXAC951AA0x0tpnS61k
 uPjjkVvP3S+u4LkHyYxOP3gfKyVJBTJRtTwczlByXVou+2/psEDfYSiyDyOa7lHqYhTT
 TvVifoSajX+uKZR0jVcKUvWzf9tjhrOqdHhu8X1+w26pu6bQhMEWN9hSVLbqLDdGaNjE
 5GUOXF55DeOS74jrlSvrN54NJuJ0O+2UNP7xQHfohIX6Uj/ChtRjwDuro2rr/bLSjVgW
 RwijWE2QdLiOv66ITFuu5LXdG5Ts5WAzkPW5zKkBbHwiddEQJqFxoZYg01NGpzAcnmGx
 Janw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wNDNSWjByKFkWc+TKVnYOtDX1Gypl7cQhv7rds0bw04=;
 b=rXUw6VntPDNAeQD68ajsWZLBwPYxEimcra3TXad0ke1MbBYurQ5dMhnMiy4BFnjVKw
 OoEWKElP1qwW7zbZt+shtJanEAbgRQFEPIpXpKVzFulqWRPkJhLWOiU02zgtZxi9EEe7
 vMIA2tXB90CzHvHCmY9logT4lP2rjVJckIFppYiLhp4GDBe6tS3vk0m+4fPmaDPMgS/Y
 8yVQ2NeugE1obpjvs7T4b1g1u9Z/1ihwrYeqj1Mg4S/39ctuC29YgJcO1/af3QCd1Qjk
 QmU9dFwIUszP91rCz0pkBxmOcoWEzzS5b7MgkloAfAgN0uRuxhYfU6rh1mrc/wUAogsF
 H9+A==
X-Gm-Message-State: AOAM532Qrs/ulvbIXcGT2TObvGBmgjECzcds0aoxGJKs+Onz7AvaOPB5
 wcO6bkbazp+0JgMZcFfTYRNVdQ==
X-Google-Smtp-Source: ABdhPJwqzigELzQlngYabp90mzi/ZrB4wNzFTZXRHMheqtPQxkY0TfKk2KxGaMIUNC4pyADtjgPFWQ==
X-Received: by 2002:adf:f352:: with SMTP id e18mr16535061wrp.39.1636986167812; 
 Mon, 15 Nov 2021 06:22:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y142sm11939443wmc.40.2021.11.15.06.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:22:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B10B61FF96;
 Mon, 15 Nov 2021 14:22:44 +0000 (GMT)
References: <20211115095608.2436223-1-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Split custom-runners.yml in one file per runner
Date: Mon, 15 Nov 2021 14:22:36 +0000
In-reply-to: <20211115095608.2436223-1-philmd@redhat.com>
Message-ID: <871r3hxzuz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> To ease maintenance, add the custom-runners/ directory and
> split custom-runners.yml in 3 files, all included by the
> current custom-runners.yml:
>  - ubuntu-18.04-s390x.yml
>  - ubuntu-20.04-aarch64.yml
>  - centos-stream-8-x86_64.yml
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Seems reasonable:

Queued to for-6.2/misc-fixes, thanks.

> ---
> Based-on: <20211111160501.862396-1-crosa@redhat.com>
> https://gitlab.com/stsquad/qemu/-/tree/for-6.2/misc-fixes
> ---
>  .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
>  .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
>  .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
>  .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
>  4 files changed, 268 insertions(+), 264 deletions(-)
>  create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>  create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
>  create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
>
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runner=
s.yml
> index 1f56297dfa1..056c374619b 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -13,267 +13,7 @@
>  variables:
>    GIT_STRATEGY: clone
>=20=20
> -# All ubuntu-18.04 jobs should run successfully in an environment
> -# setup by the scripts/ci/setup/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> -ubuntu-18.04-s390x-all-linux-static:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_18.04
> - - s390x
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> - - if: "$S390X_RUNNER_AVAILABLE"
> - script:
> - # --disable-libssh is needed because of https://bugs.launchpad.net/qemu=
/+bug/1838763
> - # --disable-glusterfs is needed because there's no static version of th=
ose libs in distro supplied packages
> - - mkdir build
> - - cd build
> - - ../configure --enable-debug --static --disable-system --disable-glust=
erfs --disable-libssh
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> - - make --output-sync -j`nproc` check-tcg V=3D1
> -
> -ubuntu-18.04-s390x-all:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_18.04
> - - s390x
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> - - if: "$S390X_RUNNER_AVAILABLE"
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -ubuntu-18.04-s390x-alldbg:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_18.04
> - - s390x
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$S390X_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --enable-debug --disable-libssh
> - - make clean
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -ubuntu-18.04-s390x-clang:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_18.04
> - - s390x
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$S390X_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh --cc=3Dclang --cxx=3Dclang++ --enable-s=
anitizers
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -ubuntu-18.04-s390x-tci:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_18.04
> - - s390x
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$S390X_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh --enable-tcg-interpreter
> - - make --output-sync -j`nproc`
> -
> -ubuntu-18.04-s390x-notcg:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_18.04
> - - s390x
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$S390X_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh --disable-tcg
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -# All ubuntu-20.04 jobs should run successfully in an environment
> -# setup by the scripts/ci/setup/qemu/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> -ubuntu-20.04-aarch64-all-linux-static:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_20.04
> - - aarch64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> - - if: "$AARCH64_RUNNER_AVAILABLE"
> - script:
> - # --disable-libssh is needed because of https://bugs.launchpad.net/qemu=
/+bug/1838763
> - # --disable-glusterfs is needed because there's no static version of th=
ose libs in distro supplied packages
> - - mkdir build
> - - cd build
> - - ../configure --enable-debug --static --disable-system --disable-glust=
erfs --disable-libssh
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> - - make --output-sync -j`nproc` check-tcg V=3D1
> -
> -ubuntu-20.04-aarch64-all:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_20.04
> - - aarch64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$AARCH64_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -ubuntu-20.04-aarch64-alldbg:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_20.04
> - - aarch64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> - - if: "$AARCH64_RUNNER_AVAILABLE"
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --enable-debug --disable-libssh
> - - make clean
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -ubuntu-20.04-aarch64-clang:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_20.04
> - - aarch64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$AARCH64_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh --cc=3Dclang-10 --cxx=3Dclang++-10 --en=
able-sanitizers
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -ubuntu-20.04-aarch64-tci:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_20.04
> - - aarch64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$AARCH64_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh --enable-tcg-interpreter
> - - make --output-sync -j`nproc`
> -
> -ubuntu-20.04-aarch64-notcg:
> - needs: []
> - stage: build
> - tags:
> - - ubuntu_20.04
> - - aarch64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> -   when: manual
> -   allow_failure: true
> - - if: "$AARCH64_RUNNER_AVAILABLE"
> -   when: manual
> -   allow_failure: true
> - script:
> - - mkdir build
> - - cd build
> - - ../configure --disable-libssh --disable-tcg
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=3D1
> -
> -centos-stream-8-x86_64:
> - allow_failure: true
> - needs: []
> - stage: build
> - tags:
> - - centos_stream_8
> - - x86_64
> - rules:
> - - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> - - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
> - artifacts:
> -   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> -   when: on_failure
> -   expire_in: 7 days
> -   paths:
> -     - build/tests/results/latest/results.xml
> -     - build/tests/results/latest/test-results
> -   reports:
> -     junit: build/tests/results/latest/results.xml
> - before_script:
> - - JOBS=3D$(expr $(nproc) + 1)
> - script:
> - - mkdir build
> - - cd build
> - - ../scripts/ci/org.centos/stream/8/x86_64/configure
> - - make -j"$JOBS"
> - - make NINJA=3D":" check
> - - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
> +include:
> +  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
> +  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
> +  - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
> diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gi=
tlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
> new file mode 100644
> index 00000000000..49aa703f55c
> --- /dev/null
> +++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
> @@ -0,0 +1,28 @@
> +centos-stream-8-x86_64:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - centos_stream_8
> + - x86_64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> + - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
> + artifacts:
> +   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +   when: on_failure
> +   expire_in: 7 days
> +   paths:
> +     - build/tests/results/latest/results.xml
> +     - build/tests/results/latest/test-results
> +   reports:
> +     junit: build/tests/results/latest/results.xml
> + before_script:
> + - JOBS=3D$(expr $(nproc) + 1)
> + script:
> + - mkdir build
> + - cd build
> + - ../scripts/ci/org.centos/stream/8/x86_64/configure
> + - make -j"$JOBS"
> + - make NINJA=3D":" check
> + - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab=
-ci.d/custom-runners/ubuntu-18.04-s390x.yml
> new file mode 100644
> index 00000000000..f39d874a1e1
> --- /dev/null
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
> @@ -0,0 +1,118 @@
> +# All ubuntu-18.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +
> +ubuntu-18.04-s390x-all-linux-static:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> + - if: "$S390X_RUNNER_AVAILABLE"
> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu=
/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of th=
ose libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glust=
erfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> + - make --output-sync -j`nproc` check-tcg V=3D1
> +
> +ubuntu-18.04-s390x-all:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> + - if: "$S390X_RUNNER_AVAILABLE"
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> +
> +ubuntu-18.04-s390x-alldbg:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$S390X_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --disable-libssh
> + - make clean
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> +
> +ubuntu-18.04-s390x-clang:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$S390X_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --cc=3Dclang --cxx=3Dclang++ --enable-s=
anitizers
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> +
> +ubuntu-18.04-s390x-tci:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$S390X_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --enable-tcg-interpreter
> + - make --output-sync -j`nproc`
> +
> +ubuntu-18.04-s390x-notcg:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$S390X_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --disable-tcg
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitl=
ab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> new file mode 100644
> index 00000000000..920e388bd05
> --- /dev/null
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> @@ -0,0 +1,118 @@
> +# All ubuntu-20.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/qemu/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +
> +ubuntu-20.04-aarch64-all-linux-static:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu=
/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of th=
ose libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glust=
erfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> + - make --output-sync -j`nproc` check-tcg V=3D1
> +
> +ubuntu-20.04-aarch64-all:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> +
> +ubuntu-20.04-aarch64-alldbg:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --disable-libssh
> + - make clean
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> +
> +ubuntu-20.04-aarch64-clang:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --cc=3Dclang-10 --cxx=3Dclang++-10 --en=
able-sanitizers
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> +
> +ubuntu-20.04-aarch64-tci:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --enable-tcg-interpreter
> + - make --output-sync -j`nproc`
> +
> +ubuntu-20.04-aarch64-notcg:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH=
 =3D~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --disable-tcg
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1


--=20
Alex Benn=C3=A9e

