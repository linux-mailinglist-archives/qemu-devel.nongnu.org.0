Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A72AE0A3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:25:59 +0100 (CET)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaDG-0008U5-7E
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaB0-0007Yu-US
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:23:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaAy-00074w-Lq
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605039815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAFNEoX1LQDU1P7d0UMZT44cLHQRuCm6CPMAVUv7MRQ=;
 b=B+KfLNYSq7G5BNVsAAHXA64lLcn5iBESXjsb6dBVei3YQ6SNmBwK2ZwQiIZl5IGpE8rt66
 hU+U9vTHmdC1PGU6lSFs4rfG80jZxJFUG4lafjUs3dG+4G+dOrre0mIYoSHpMbbGcqVK6D
 DMmBDllkR9F1zHTagZjgv/a64e3AXWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-YQ6cLvwOMdymsDyKmuSN1g-1; Tue, 10 Nov 2020 15:23:31 -0500
X-MC-Unique: YQ6cLvwOMdymsDyKmuSN1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBAFB106B26C;
 Tue, 10 Nov 2020 20:23:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5D7D5B4B6;
 Tue, 10 Nov 2020 20:23:28 +0000 (UTC)
Subject: Re: [PATCH v3 03/11] gitlab-ci: Replace YAML anchors by extends
 (native_build_job)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-4-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <fd53d82c-9144-244b-f749-4c1b47c9f85c@redhat.com>
Date: Tue, 10 Nov 2020 18:23:21 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108221925.2344515-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 8:19 PM, Philippe Mathieu-Daudé wrote:
> 'extends' is an alternative to using YAML anchors
> and is a little more flexible and readable. See:
> https://docs.gitlab.com/ee/ci/yaml/#extends
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

LGTM

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5763318d375..a96e7dd23e5 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -13,7 +13,7 @@ include:
>     - local: '/.gitlab-ci.d/containers.yml'
>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>   
> -.native_build_job_template: &native_build_job_definition
> +.native_build_job:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     before_script:
> @@ -68,7 +68,7 @@ include:
>       - du -chs ${CI_PROJECT_DIR}/avocado-cache
>   
>   build-system-ubuntu:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: ubuntu2004
>       TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
> @@ -99,7 +99,7 @@ acceptance-system-ubuntu:
>     <<: *acceptance_definition
>   
>   build-system-debian:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: debian-amd64
>       TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
> @@ -130,7 +130,7 @@ acceptance-system-debian:
>     <<: *acceptance_definition
>   
>   build-system-fedora:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: fedora
>       CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
> @@ -162,7 +162,7 @@ acceptance-system-fedora:
>     <<: *acceptance_definition
>   
>   build-system-centos:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: centos8
>       CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
> @@ -194,7 +194,7 @@ acceptance-system-centos:
>     <<: *acceptance_definition
>   
>   build-disabled:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: fedora
>       CONFIGURE_ARGS: --disable-attr --disable-avx2 --disable-bochs
> @@ -219,7 +219,7 @@ build-disabled:
>       MAKE_CHECK_ARGS: check-qtest SPEED=slow
>   
>   build-tcg-disabled:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: centos8
>     script:
> @@ -239,7 +239,7 @@ build-tcg-disabled:
>               260 261 262 263 264 270 272 273 277 279
>   
>   build-user:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: debian-all-test-cross
>       CONFIGURE_ARGS: --disable-tools --disable-system
> @@ -249,7 +249,7 @@ build-user:
>   # we skip sparc64-linux-user until it has been fixed somewhat
>   # we skip cris-linux-user as it doesn't use the common run loop
>   build-user-plugins:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: debian-all-test-cross
>       CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
> @@ -257,7 +257,7 @@ build-user-plugins:
>     timeout: 1h 30m
>   
>   build-clang:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: fedora
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++
> @@ -267,7 +267,7 @@ build-clang:
>   
>   # These targets are on the way out
>   build-deprecated:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: debian-all-test-cross
>       CONFIGURE_ARGS: --disable-docs --disable-tools
> @@ -292,7 +292,7 @@ check-deprecated:
>     allow_failure: true
>   
>   build-oss-fuzz:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: fedora
>     script:
> @@ -310,7 +310,7 @@ build-oss-fuzz:
>       - cd build-oss-fuzz && make check-qtest-i386 check-unit
>   
>   build-tci:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: fedora
>     script:
> @@ -335,7 +335,7 @@ build-tci:
>   # These jobs test old gcrypt and nettle from RHEL7
>   # which had some API differences.
>   build-crypto-old-nettle:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: centos7
>       TARGETS: x86_64-softmmu x86_64-linux-user
> @@ -356,7 +356,7 @@ check-crypto-old-nettle:
>   
>   
>   build-crypto-old-gcrypt:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: centos7
>       TARGETS: x86_64-softmmu x86_64-linux-user
> @@ -377,7 +377,7 @@ check-crypto-old-gcrypt:
>   
>   
>   build-crypto-only-gnutls:
> -  <<: *native_build_job_definition
> +  extends: .native_build_job
>     variables:
>       IMAGE: centos7
>       TARGETS: x86_64-softmmu x86_64-linux-user


