Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C22C6B77
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:17:20 +0100 (CET)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiJ5-0007qo-BK
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiiHq-0007FU-GF
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiiHl-0002nk-7P
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606500956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbhmxRdJO2IMEabhgFm2NmnD9hAkvuefVXbqvHeTePU=;
 b=THuOQI4SIwufq3JBZmk249jvdHmud0RUSkcmvpfkxKqArOntujdm3xocPGtV2Fdo6QzjGU
 SITzHaQ+Z9aOw1SA8F/KxwJN3nbIKnydhZKvBAiRXM3ouUPDmuWeUcnUMMqgmjiGKqNJ6P
 DeUG+P5v1CBU1gevuBEhCmbtWfgCTzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-IBuELfpRNruwRcDqTXKzig-1; Fri, 27 Nov 2020 13:15:53 -0500
X-MC-Unique: IBuELfpRNruwRcDqTXKzig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 054E086ABD6;
 Fri, 27 Nov 2020 18:15:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-70.ams2.redhat.com [10.36.113.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E0D5C1C2;
 Fri, 27 Nov 2020 18:15:44 +0000 (UTC)
Subject: Re: [PATCH] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20201127181025.472458-1-thuth@redhat.com>
Message-ID: <00693af0-4d49-8e8a-65d8-64c0ad34c756@redhat.com>
Date: Fri, 27 Nov 2020 19:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127181025.472458-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.williamson@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2020 19.10, Thomas Huth wrote:
> After adding some missing packages, it's possible to check 32-bit
> builds and tests with the fedora-i386-cross container in the gitlab-CI,
> too.
> 
> While we're at it, update it to Fedora 31. Unfortunately the gcc
> from the later versions emits some very dubious format-truncation
> warnings, so Fedora 32 and 33 are currently unsuitable for this job.
> 
> I also had to remove the gnutls-devel package since linking then
> failed due to its dependency libtasn1 not being recognized (even
> if I explicitely installed it into the container).

In case anybody is interested, the failure can be seen here:

 https://gitlab.com/huth/qemu/-/jobs/876977206#L4799

... which is very strange, since in line 259, meson claimed to have found
libtasn1 ... anybody got an idea what's going wrong here?

 Thomas


> ---
>  Test runs can be seen here:
>   https://gitlab.com/huth/qemu/-/jobs/877519207
>  and here:
>   https://gitlab.com/huth/qemu/-/jobs/877519208
> 
>  .gitlab-ci.d/crossbuilds.yml                     | 16 ++++++++++++++--
>  .../docker/dockerfiles/fedora-i386-cross.docker  | 14 ++++++++++++--
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 03ebfabb3f..283c42b100 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -11,7 +11,7 @@
>          --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
>            mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
>            xtensa-softmmu"
> -    - make -j$(expr $(nproc) + 1) all check-build
> +    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>  
>  .cross_user_build_job_template: &cross_user_build_job_definition
>    stage: build
> @@ -21,7 +21,7 @@
>      - cd build
>      - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>        ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
> -    - make -j$(expr $(nproc) + 1) all check-build
> +    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>  
>  cross-armel-system:
>    <<: *cross_system_build_job_definition
> @@ -53,6 +53,18 @@ cross-arm64-user:
>    variables:
>      IMAGE: debian-arm64-cross
>  
> +cross-i386-system:
> +  <<: *cross_system_build_job_definition
> +  variables:
> +    IMAGE: fedora-i386-cross
> +    MAKE_CHECK_ARGS: check
> +
> +cross-i386-user:
> +  <<: *cross_user_build_job_definition
> +  variables:
> +    IMAGE: fedora-i386-cross
> +    MAKE_CHECK_ARGS: check
> +
>  cross-mips-system:
>    <<: *cross_system_build_job_definition
>    variables:
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
> index cd16cd1bfa..7824cc0da3 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -1,14 +1,24 @@
> -FROM fedora:30
> +FROM fedora:31
>  ENV PACKAGES \
> +    bzip2 \
> +    diffutils \
> +    findutils \
>      gcc \
> +    git \
> +    make \
> +    meson \
> +    ninja-build \
>      glib2-devel.i686 \
>      glibc-devel.i686 \
>      glibc-static.i686 \
> -    gnutls-devel.i686 \
>      nettle-devel.i686 \
> +    perl-Test-Harness \
>      pixman-devel.i686 \
>      zlib-devel.i686 \
>      libzstd-devel.i686
>  
> +ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32
> +ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
> +
>  RUN dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt
> 


