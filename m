Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FC2BB1C8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:53:20 +0100 (CET)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAb1-0006gt-Ha
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgATc-0007LR-7B
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgATa-0004wQ-44
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605894334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWkuWO3ydn24HHKVIf+rMK74SLVlYiAj1yA2Z9cisQk=;
 b=VExomH3o3K2AEgvDaNsSABWnxQPJziW1OlHeeCJVwXRm16ayEdFt3ifsHq7sy/DFRf0GvR
 YxOz7b9OfDEFVIr9RoI9oUcUnt8W2NYT87gn+9VhcEsE552ALhI4AeDQsSU4KbpeAUf16D
 6RaauSBplewBAl0UknK2BiE4dZ+3SoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-QT3xmLAmMPeMYPBKDhG-nw-1; Fri, 20 Nov 2020 12:45:32 -0500
X-MC-Unique: QT3xmLAmMPeMYPBKDhG-nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D33D11DDE9;
 Fri, 20 Nov 2020 17:45:30 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-143.gru2.redhat.com
 [10.97.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E1A35D6AD;
 Fri, 20 Nov 2020 17:45:26 +0000 (UTC)
Subject: Re: [PATCH v1 4/6] gitlab: move remaining x86 check-tcg targets to
 gitlab
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-5-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <30dcf280-c1df-04dc-4cad-b89e641314e4@redhat.com>
Date: Fri, 20 Nov 2020 14:45:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/17/20 2:36 PM, Alex Bennée wrote:
> The GCC check-tcg (user) test in particular was very prone to timing
> out on Travis. We only actually need to move the some-softmmu builds
> across as we already have coverage for linux-user.
>
> As --enable-debug-tcg does increase the run time somewhat as more
> debug is put in let's restrict that to just the plugins build. It's
> unlikely that a plugins enabled build is going to hide a sanity
> failure in core TCG code so let the plugin builds do the heavy lifting
> on checking TCG sanity so the non-plugin builds can run swiftly.
>
> Now the only remaining check-tcg builds on Travis are for the various
> non-x86 arches.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201110192316.26397-10-alex.bennee@linaro.org>
> ---
>   .gitlab-ci.yml | 17 +++++++++++++++++
>   .travis.yml    | 26 --------------------------
>   2 files changed, 17 insertions(+), 26 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9a8b375188..b406027a55 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -247,6 +247,15 @@ build-user:
>       CONFIGURE_ARGS: --disable-tools --disable-system
>       MAKE_CHECK_ARGS: check-tcg
>   
> +# Only build the softmmu targets we have check-tcg tests for
> +build-some-softmmu:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-tools --enable-debug-tcg
> +    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
> +    MAKE_CHECK_ARGS: check-tcg
> +
>   # Run check-tcg against linux-user (with plugins)
>   # we skip sparc64-linux-user until it has been fixed somewhat
>   # we skip cris-linux-user as it doesn't use the common run loop
> @@ -258,6 +267,14 @@ build-user-plugins:
>       MAKE_CHECK_ARGS: check-tcg
>     timeout: 1h 30m
>   
> +build-some-softmmu-plugins:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
> +    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
> +    MAKE_CHECK_ARGS: check-tcg
> +
>   build-clang:
>     <<: *native_build_job_definition
>     variables:
> diff --git a/.travis.yml b/.travis.yml
> index a3d78171ca..bac085f800 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -301,32 +301,6 @@ jobs:
>           - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
>   
>   
> -    # Run check-tcg against linux-user
> -    - name: "GCC check-tcg (user)"
> -      env:
> -        - CONFIG="--disable-system --enable-debug-tcg"
> -        - TEST_BUILD_CMD="make build-tcg"
> -        - TEST_CMD="make check-tcg"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> -
> -
> -    # Run check-tcg against softmmu targets
> -    - name: "GCC check-tcg (some-softmmu)"
> -      env:
> -        - CONFIG="--enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
> -        - TEST_BUILD_CMD="make build-tcg"
> -        - TEST_CMD="make check-tcg"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> -
> -
> -    # Run check-tcg against softmmu targets (with plugins)
> -    - name: "GCC plugins check-tcg (some-softmmu)"
> -      env:
> -        - CONFIG="--enable-plugins --enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
> -        - TEST_BUILD_CMD="make build-tcg"
> -        - TEST_CMD="make check-tcg"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> -
>       - name: "[aarch64] GCC check-tcg"
>         arch: arm64
>         dist: focal


