Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65F302366
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:54:56 +0100 (CET)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3yaF-0002JY-81
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3yWr-0000qc-3h
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:51:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3yWg-0005KQ-QC
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611568272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx3lq74vokx8vqK2rIUl4KIwbJ6KeMR3IkimaMwVEFQ=;
 b=ag3sNVUNQeUKFxXGJ6EqLLkEXw++HBgKsjkl33V/SiMgBnMStmYgf7BQitNE+ZvSSrBc+A
 ts17kg/iWi8SeSzdWEt3bTgW9nCOFeDlj0I8F1ZbXWYOk4d8FU7oQZuqOF/rBF/A3WGb0b
 1H56q17peICQUX0FghunV9+SxCERppg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-X7kXpZyHOmiH7RGzqNj_KQ-1; Mon, 25 Jan 2021 04:51:07 -0500
X-MC-Unique: X7kXpZyHOmiH7RGzqNj_KQ-1
Received: by mail-ed1-f72.google.com with SMTP id j11so6283565edy.20
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 01:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vx3lq74vokx8vqK2rIUl4KIwbJ6KeMR3IkimaMwVEFQ=;
 b=fzano6nlUec972fbrtJmB/hiNzENydKKI6SlxBlzrZY8XppoAhKpBGbm8vRDQyPMjb
 fydm1qUX8cFd6wSqHQ9HrsiS+RlklDI1sPBCwrZM5BlXQuFDg2A0DA2oQNF7adei28GI
 aYNERG7ZwDy3AdJ5rE/hDbHikhOKo61BR7mtMBdkGTSznYSDGdqI8cMrbUnq2HriocrW
 K8UsnH7OUDc3ixhKAGid3P3yi2hzjrr16KjUpa/jRKg6RylK8RWgEbazNsNjfkJEHdav
 UJIQAy67jlccnui5os3gBo0twy7aCInhBAkn3bn7mcCiLGlFA1d6lgxk7KDVUwkTrJKe
 8ygQ==
X-Gm-Message-State: AOAM5321jRXfhUcBRKXrUPiFMWC8qlATY72VdgTIV9/E10wj3aVq8lhX
 iqploDlYX5QLjZ771qHLyaeSiEqjSEB+TCVG35cpw3MMQOlRXtXtcn2xVvp/lF+6qY0Jehv3/9A
 ld0Nn3piqoiSamxs=
X-Received: by 2002:a17:906:c18:: with SMTP id
 s24mr5249003ejf.419.1611568266592; 
 Mon, 25 Jan 2021 01:51:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJQSr8lfSBEpvDGOGLMMkuO0AIU5rtjw9C/qzVwvs/sW2TolOuMyh3zfj5wvWXos0xjXeFWg==
X-Received: by 2002:a17:906:c18:: with SMTP id
 s24mr5248991ejf.419.1611568266389; 
 Mon, 25 Jan 2021 01:51:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h12sm8192815ejf.95.2021.01.25.01.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 01:51:05 -0800 (PST)
Subject: Re: [PATCH v1] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210125090339.134019-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
Date: Mon, 25 Jan 2021 10:51:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125090339.134019-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 10:03, Thomas Huth wrote:
> Currently, our check-system-* jobs are recompiling the whole sources
> again. This happens due to the fact that the jobs are checking out
> the whole source tree and required submodules again, and only try
> to use the "build" directory with the binaries and object files
> as an artifact from the previous stage - which simply does not work
> anymore (with the current version of meson). Due to some changed
> time stamps, meson is always trying to rebuild the whole tree.
> 
> To fix this problem, we can use "meson test --no-rebuild" instead of
> make check" to avoid rebuilding all binaries every time. However, the
> iotests ("make check-block") are not run by "meson test", so we have
> to execute these manually now. But instead of adding them to the same
> job as "meson test", it's better to put them into a separate new job
> instead, to keep things nicely running in parallel in the CI.
> This saves ca. 15 - 20 minutes of precious CI cycles in each run.

The reason why we're not using "meson test" is that the reporting is 
(still) inferior to what you get from "make check", especially with 
respect to which tests are failing.  This is being tracked at 
https://github.com/mesonbuild/meson/issues/7830 and the last missing 
bits are at https://github.com/mesonbuild/meson/issues/8200 (after which 
we'll change the "meson test" command line to also include "meson test 
--verbose").

However, for CI this is a minor issue because we can let GitLab parse 
the XML testing logs.  Can you add something like this to the test jobs 
for v2?

+  artifacts:
+    when: always
+    paths:
+      - build/meson-logs/
+    reports:
+      junit: build/meson-logs/testlog.junit.xml

Another possibility could be to use "make check NINJA=:".  I am not sure 
if that works, but if it does it would be the smallest possible workaround.

Paolo

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   RFC -> v1: Added iotests
> 
>   .gitlab-ci.yml | 113 ++++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 94 insertions(+), 19 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b5..0834267a37 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -34,6 +34,26 @@ include:
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> +.native_meson_test_job:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - cd build
> +    - touch *
> +    - make git-submodule-update
> +    - if [ -x ../meson/meson.py ]; then
> +          ../meson/meson.py test --no-rebuild -t 5 $MESON_TEST_ARGS ;
> +      else
> +          meson test --no-rebuild -t 5 $MESON_TEST_ARGS ;
> +      fi
> +
> +.native_iotest_job:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - cd build/tests/qemu-iotests/
> +    - ./check -g auto -qcow2
> +
>   .native_test_job_template: &native_test_job_definition
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> @@ -83,17 +103,15 @@ build-system-alpine:
>     artifacts:
>       expire_in: 2 days
>       paths:
> -      - .git-submodule-status
>         - build
>   
>   check-system-alpine:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>     needs:
>       - job: build-system-alpine
>         artifacts: true
>     variables:
>       IMAGE: alpine
> -    MAKE_CHECK_ARGS: check
>   
>   acceptance-system-alpine:
>     <<: *native_test_job_definition
> @@ -118,13 +136,20 @@ build-system-ubuntu:
>         - build
>   
>   check-system-ubuntu:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-system-ubuntu
> +      artifacts: true
> +  variables:
> +    IMAGE: ubuntu2004
> +
> +iotest-ubuntu:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-system-ubuntu
>         artifacts: true
>     variables:
>       IMAGE: ubuntu2004
> -    MAKE_CHECK_ARGS: check
>   
>   acceptance-system-ubuntu:
>     <<: *native_test_job_definition
> @@ -149,13 +174,20 @@ build-system-debian:
>         - build
>   
>   check-system-debian:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-system-debian
> +      artifacts: true
> +  variables:
> +    IMAGE: debian-amd64
> +
> +iotest-debian:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-system-debian
>         artifacts: true
>     variables:
>       IMAGE: debian-amd64
> -    MAKE_CHECK_ARGS: check
>   
>   # No targets are built here, just tools, docs, and unit tests. This
>   # also feeds into the eventual documentation deployment steps later
> @@ -194,13 +226,20 @@ build-system-fedora:
>         - build
>   
>   check-system-fedora:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-system-fedora
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +
> +iotest-fedora:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-system-fedora
>         artifacts: true
>     variables:
>       IMAGE: fedora
> -    MAKE_CHECK_ARGS: check
>   
>   acceptance-system-fedora:
>     <<: *native_test_job_definition
> @@ -226,13 +265,20 @@ build-system-centos:
>         - build
>   
>   check-system-centos:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-system-centos
> +      artifacts: true
> +  variables:
> +    IMAGE: centos8
> +
> +iotest-centos:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-system-centos
>         artifacts: true
>     variables:
>       IMAGE: centos8
> -    MAKE_CHECK_ARGS: check
>   
>   acceptance-system-centos:
>     <<: *native_test_job_definition
> @@ -256,13 +302,20 @@ build-system-opensuse:
>         - build
>   
>   check-system-opensuse:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-system-opensuse
> +      artifacts: true
> +  variables:
> +    IMAGE: opensuse-leap
> +
> +iotest-opensuse:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-system-opensuse
>         artifacts: true
>     variables:
>       IMAGE: opensuse-leap
> -    MAKE_CHECK_ARGS: check
>   
>   acceptance-system-opensuse:
>      <<: *native_test_job_definition
> @@ -525,13 +578,20 @@ build-crypto-old-nettle:
>         - build
>   
>   check-crypto-old-nettle:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-crypto-old-nettle
> +      artifacts: true
> +  variables:
> +    IMAGE: centos7
> +
> +iotest-crypto-old-nettle:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-crypto-old-nettle
>         artifacts: true
>     variables:
>       IMAGE: centos7
> -    MAKE_CHECK_ARGS: check
>   
>   
>   build-crypto-old-gcrypt:
> @@ -546,13 +606,20 @@ build-crypto-old-gcrypt:
>         - build
>   
>   check-crypto-old-gcrypt:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
> +  needs:
> +    - job: build-crypto-old-gcrypt
> +      artifacts: true
> +  variables:
> +    IMAGE: centos7
> +
> +iotest-crypto-old-gcrypt:
> +  extends: .native_iotest_job
>     needs:
>       - job: build-crypto-old-gcrypt
>         artifacts: true
>     variables:
>       IMAGE: centos7
> -    MAKE_CHECK_ARGS: check
>   
>   
>   build-crypto-only-gnutls:
> @@ -567,13 +634,21 @@ build-crypto-only-gnutls:
>         - build
>   
>   check-crypto-only-gnutls:
> -  <<: *native_test_job_definition
> +  extends: .native_meson_test_job
>     needs:
>       - job: build-crypto-only-gnutls
>         artifacts: true
>     variables:
>       IMAGE: centos7
> -    MAKE_CHECK_ARGS: check
> +
> +iotest-crypto-only-gnutls:
> +  extends: .native_iotest_job
> +  needs:
> +    - job: build-crypto-only-gnutls
> +      artifacts: true
> +  variables:
> +    IMAGE: centos7
> +
>   
>   # We don't need to exercise every backend with every front-end
>   build-trace-multi-user:
> 


