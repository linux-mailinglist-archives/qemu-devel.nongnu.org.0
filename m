Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB531E637
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 07:20:40 +0100 (CET)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcg3-0006Ic-LU
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 01:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCcec-0005re-Gi
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 01:19:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCcea-0000I0-Pa
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 01:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613629147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2i+5khURrnWuI3KKZLO9cdhXRKCtiFtQCY0lyfDyPY0=;
 b=Z0k6RHlHUBG7hhnbRwTCoGSygvy3MP0k9K1RLf0bzuyR1GW0KhRzgYBj5GERbulem9GzNo
 B5MId2eHZKNG/UO3qNl6yUct+yPMTDb3VSau0vX2H/0naGLQF/A/5hg+/MI2oylY4mjq4F
 hVcZvQJEhkevqrlJo4BVzWxMN1n/XQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-tfugwxwOP3qXbftaiRXOyw-1; Thu, 18 Feb 2021 01:19:05 -0500
X-MC-Unique: tfugwxwOP3qXbftaiRXOyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE528030C1;
 Thu, 18 Feb 2021 06:19:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B76219C46;
 Thu, 18 Feb 2021 06:19:02 +0000 (UTC)
Subject: Re: [PATCH v4 71/71] gitlab: Enable cross-i386 builds of TCI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-72-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f058698e-9c0f-b4d9-e4ea-6de775056f8d@redhat.com>
Date: Thu, 18 Feb 2021 07:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-72-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/02/2021 21.20, Richard Henderson wrote:
> We're currently only testing TCI with a 64-bit host -- also test
> with a 32-bit host.  Enable a selection of softmmu and user-only
> targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   .gitlab-ci.d/crossbuilds.yml                    | 17 ++++++++++++++---
>   .../docker/dockerfiles/fedora-i386-cross.docker |  1 +
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 66547b6683..99300f786b 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -6,7 +6,8 @@
>       - mkdir build
>       - cd build
>       - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> -      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS $ACCEL_CONFIGURE_OPTS

I'd maybe call it EXTRA_CONFIGURE_OPTS instead since it could also be used 
for other purposes later.

> +        --disable-user
>           --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
>             microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
>             ppc-softmmu sh4-softmmu xtensa-softmmu"
> @@ -27,7 +28,7 @@
>       - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>         ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
>           --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
> -    - make -j$(expr $(nproc) + 1) all check-build
> +    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>   
>   .cross_user_build_job:
>     stage: build
> @@ -36,7 +37,8 @@
>       - mkdir build
>       - cd build
>       - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> -      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS $ACCEL_CONFIGURE_OPTS
> +        --disable-system
>       - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>   
>   cross-armel-system:
> @@ -81,6 +83,15 @@ cross-i386-user:
>       IMAGE: fedora-i386-cross
>       MAKE_CHECK_ARGS: check
>   
> +cross-i386-tci:
> +  extends: .cross_accel_build_job
> +  timeout: 60m
> +  variables:
> +    IMAGE: fedora-i386-cross
> +    ACCEL: tcg-interpreter
> +    ACCEL_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
> +    MAKE_CHECK_ARGS: check

Don't you want to run "check-tcg" here, too? (IIRC it's not included in "check")

>   cross-mips-system:
>     extends: .cross_system_build_job
>     variables:
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
> index a6e411291b..aa66314c65 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -5,6 +5,7 @@ ENV PACKAGES \
>       findutils \
>       gcc \
>       git \
> +    libffi-devel.i686 \
>       libtasn1-devel.i686 \
>       libzstd-devel.i686 \
>       make \
> 

Anyway,
Acked-by: Thomas Huth <thuth@redhat.com>


