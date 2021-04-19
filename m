Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA36364704
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:23:24 +0200 (CEST)
Received: from localhost ([::1]:46666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVkB-0004lV-86
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVie-0003iL-Ib
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:21:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYViY-000423-Tx
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:21:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so8146356wma.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nhtC/76H0BHuIt7mKrwIN7KtiS5ySHz8AreP3Crllyg=;
 b=X2wZWCFUfgNPFnTtM82j7KNrVYEdL+iGWKySgQ0oEXtvyuDRi1YaS2u0nMHKR3H/OH
 pgemDUIuD3nIg6VqeXe5W5sT3t5NPvT0NkJl79o1cRVHNiEEtHvD0jUdPjcD1DAZj4U7
 Nrrn5BcHLYoP1fo6najb53iWjBKD4GI3Qmm4K7p8pafnSSKAHLrxbvjl+ypEnCuJr9bo
 Qw51cFl1619gJdZtWf6fVtjT+IkCU/9bzC+Z9gE5dr2tonzXv5NlHdM6R2RPdsaDUepc
 CrpDQugULOQFbD5dNkzxOJEHCuBHu3mtaJx/xHMyd3TAD9TjZ6E/qnQt/hZ/0Xw0a9+h
 M+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nhtC/76H0BHuIt7mKrwIN7KtiS5ySHz8AreP3Crllyg=;
 b=Pn8HCNYtiak9oKsdsHstawxnDxR9hT/Kd1f//XReCHc/tvrDVSYQB7wOH2m/PaN3op
 I89u5SHikIVa1a78zySN/CsGaN+hHWsFR2O5K+7qMZv9mVtgtAGKD1RevS3bKYUeJ3H/
 uSHiiWfv7QAtKSvTtJ161FfS1oOxQhsU+pxplygjhRLNjC1EZratJE9msK381595V7tu
 P4jMgn2rp5j4c/Vrct91mt9wAR5FwsmbkGWNl9LeCoFkCxqEj9eZcVsCUOzAjCFbeNXF
 12tPnvK9ICoo6qFelrXF/8dFFItGjrcPCzIyMm7hkZZOgtg1rD7dftytyUFyTrKxcNSE
 y0/w==
X-Gm-Message-State: AOAM530zJZE3vWmJrtqNQjk+03hAIIZOFf+rpRJOCBUQXpu/o3Ja027K
 gcJHGn+JFyJtXtzNi7J8L/TilA==
X-Google-Smtp-Source: ABdhPJwVNQV+bmJAAQzvCu7OJzDOwkt6hA5EICktnj162A889pkkierIQYpTemK7ytxcv0GQRVWVkQ==
X-Received: by 2002:a1c:9d94:: with SMTP id
 g142mr22752863wme.154.1618845701293; 
 Mon, 19 Apr 2021 08:21:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r24sm7076908wmh.8.2021.04.19.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:21:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 036001FF7E;
 Mon, 19 Apr 2021 16:21:39 +0100 (BST)
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-11-f4bug@amsat.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 10/15] gitlab-ci: Extract all default build/test jobs to
 buildtest.yml
Date: Mon, 19 Apr 2021 16:11:26 +0100
In-reply-to: <20210418233448.1267991-11-f4bug@amsat.org>
Message-ID: <87a6pu9u65.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Extract the build/test jobs run by default on the mainstream
> CI into a new file (buildtest.yml) and their templates into
> (buildtest-template.yml), to be able to reuse the templates
> without having to run all these mainstream jobs by default.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml |  80 +++
>  .gitlab-ci.d/buildtest.yml          | 744 +++++++++++++++++++++++++
>  .gitlab-ci.yml                      | 824 +---------------------------
>  3 files changed, 825 insertions(+), 823 deletions(-)
>  create mode 100644 .gitlab-ci.d/buildtest-template.yml
>  create mode 100644 .gitlab-ci.d/buildtest.yml
>
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest=
-template.yml
> new file mode 100644
> index 00000000000..b24a153d904
> --- /dev/null
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -0,0 +1,80 @@
> +.native_build_job_template:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  before_script:
> +    - JOBS=3D$(expr $(nproc) + 1)
> +  script:
> +    - mkdir build
> +    - cd build
> +    - if test -n "$TARGETS";
> +      then
> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --ta=
rget-list=3D"$TARGETS" ;
> +      else
> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
> +      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
> +    - if test -n "$LD_JOBS";
> +      then
> +        meson configure . -Dbackend_max_links=3D"$LD_JOBS" ;
> +      fi || exit 1;
> +    - make -j"$JOBS"
> +    - if test -n "$MAKE_CHECK_ARGS";
> +      then
> +        make -j"$JOBS" $MAKE_CHECK_ARGS ;
> +      fi
> +
> +.native_test_job_template:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - scripts/git-submodule.sh update
> +        $(sed -n '/GIT_SUBMODULES=3D/ s/.*=3D// p' build/config-host.mak)
> +    - cd build
> +    - find . -type f -exec touch {} +
> +    # Avoid recompiling by hiding ninja with NINJA=3D":"
> +    - make NINJA=3D":" $MAKE_CHECK_ARGS
> +
> +.integration_test_job_template:
> +  cache:
> +    key: "${CI_JOB_NAME}-cache"
> +    paths:
> +      - ${CI_PROJECT_DIR}/avocado-cache
> +    policy: pull-push
> +  artifacts:
> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +    when: always
> +    expire_in: 2 days
> +    paths:
> +      - build/tests/results/latest/results.xml
> +      - build/tests/results/latest/test-results
> +    reports:
> +      junit: build/tests/results/latest/results.xml
> +  before_script:
> +    - mkdir -p ~/.config/avocado
> +    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
> +    - echo "cache_dirs =3D ['${CI_PROJECT_DIR}/avocado-cache']"
> +           >> ~/.config/avocado/avocado.conf
> +    - echo -e '[job.output.testlogs]\nstatuses =3D ["FAIL", "INTERRUPT"]'
> +           >> ~/.config/avocado/avocado.conf
> +    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
> +        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
> +      fi
> +    - export AVOCADO_ALLOW_UNTRUSTED_CODE=3D1
> +  after_script:
> +    - cd build
> +    - du -chs ${CI_PROJECT_DIR}/avocado-cache

I don't know if my suggestion further bellow requires moving the above:

> +build-system-alpine:
> +check-system-alpine:
> +acceptance-system-alpine:

Maybe these can be moved into buildtest-rolling? Or maybe buildtest-[unsupp=
orted|other]?

<snip>
<snip>

> +build-disabled:
> +build-tcg-disabled:

to buildtest-custom?


> +build-user-plugins:
> +build-some-softmmu-plugins:
> +clang-system:
> +clang-user:
> +build-cfi-aarch64:
> +check-cfi-aarch64:
> +acceptance-cfi-aarch64:
> +build-cfi-ppc64-s390x:
> +check-cfi-ppc64-s390x:
> +acceptance-cfi-ppc64-s390x:
> +build-cfi-x86_64:
> +check-cfi-x86_64:
> +acceptance-cfi-x86_64:
> +tsan-build:

to buildtest-developer? is CFI a dev feature or a distro feature?
Arguably they could be grouped together.

<snip>
> +# These targets are on the way out
> +build-deprecated:
> +check-deprecated:

buildtest-developer or even buildtest-deprecated?

<snip>
> +gprof-gcov:
> +build-oss-fuzz:

buildtest-developer?

> +build-tci:
> +build-coroutine-sigaltstack:

buildtest-custom?

<snip>
> +crypto-old-nettle:
> +crypto-old-gcrypt:

buildtest-custom or buildtest-legacy?

> +crypto-only-gnutls:
> +build-without-default-devices:
> +build-without-default-features:

buildtest-custom.

> +check-patch:
> +check-dco:

buildtest-developer or maybe their own pr-qa?

> +build-libvhost-user:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
> +  needs:
> +    job: amd64-fedora-container
> +  before_script:
> +    - dnf install -y meson ninja-build
> +  script:
> +    - mkdir subprojects/libvhost-user/build
> +    - cd subprojects/libvhost-user/build
> +    - meson
> +    - ninja

I dunno, buildtest-misc?

> +# No targets are built here, just tools, docs, and unit tests. This
> +# also feeds into the eventual documentation deployment steps later
> +build-tools-and-docs-debian:
> +pages:

Seems these could be under their own documentation section?

--=20
Alex Benn=C3=A9e

