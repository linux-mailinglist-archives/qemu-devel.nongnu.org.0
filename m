Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826A31B8DA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:17:37 +0100 (CET)
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcoq-0003U8-GR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBcY1-0003Cu-6j
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:00:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBcXy-0007If-Si
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613390410;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDply04e8Z6C0SbQndH0QOOZsR+C9gWr3bq56MP+oLU=;
 b=eMemAra3+rDWrD+pcC5qrnt2MLl/P5QRtIiOEdpz3lNQ6l+sLLtDwlVRjZy7M+2ohbHFSg
 8FIZiaZOx1mCn6RTLG9aBeFeg5YmKgmBMmjTJki4bWgGA6b3rSGIMh5FRU6POABfBqaSM1
 Y4+qvSNngf7B+S5UFBP5OI3XLgDAvts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-d7i6oTY8PC-10rPIChBz7w-1; Mon, 15 Feb 2021 07:00:05 -0500
X-MC-Unique: d7i6oTY8PC-10rPIChBz7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3B7F83DCC6;
 Mon, 15 Feb 2021 12:00:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BE915D9CA;
 Mon, 15 Feb 2021 12:00:00 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:59:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
Message-ID: <20210215115957.GG1542881@redhat.com>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-33-f4bug@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Fredrik Noring <noring@nocrew.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 14, 2021 at 06:59:02PM +0100, Philippe Mathieu-Daudé wrote:
> Add a Docker image providing cross toolchain for the MIPS R5900 CPU
> (used on the Sony PS2).
> 
> This image is based on Gentoo and the toolchain is built using crossdev.

Is there any way we can do this with a distro that isn't Gentoo
so that we can get a container build that is fast enough to be
useful for CI ?

> 
> Recipe from:
>   https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03944.html
> 
> Suggested-by: Fredrik Noring <noring@nocrew.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/docker/Makefile.include                 |  3 ++
>  .../gentoo-mipsr5900el-cross.docker           | 35 +++++++++++++++++++
>  .../crossdev.conf                             |  5 +++
>  3 files changed, 43 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker
>  create mode 100644 tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 93b29ad823e..3d6306c7728 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -146,6 +146,9 @@ docker-image-debian-riscv64-cross: docker-image-debian10
>  docker-image-debian-s390x-cross: docker-image-debian10
>  docker-image-debian-sh4-cross: docker-image-debian10
>  docker-image-debian-sparc64-cross: docker-image-debian10
> +docker-image-gentoo-mipsr5900el-cross: EXTRA_FILES:=$(addprefix \
> +			$(SRC_PATH)/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/,\
> +				crossdev.conf)
>  
>  docker-image-travis: NOUSER=1
>  
> diff --git a/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker
> new file mode 100644
> index 00000000000..88ada20623d
> --- /dev/null
> +++ b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker
> @@ -0,0 +1,35 @@
> +#
> +# Docker mipsel (r5900) cross-compiler target
> +#
> +# Using multi-stage builds, this image requires docker-17.05.0 or later.
> +# (See: https://github.com/gentoo/gentoo-docker-images)
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# name the portage image
> +FROM gentoo/portage:20201121 as portage
> +
> +# image is based on stage3-amd64
> +FROM gentoo/stage3:latest
> +
> +# copy the entire portage volume in
> +COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
> +
> +MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
> +
> +# set CROSSDEV_OVERLAY to /usr/local/portage-crossdev
> +RUN mkdir -p /usr/local/portage-crossdev/{profiles,metadata} && \
> +    echo 'crossdev' > /usr/local/portage-crossdev/profiles/repo_name && \
> +    echo 'masters = gentoo' > /usr/local/portage-crossdev/metadata/layout.conf && \
> +    chown -R portage:portage /usr/local/portage-crossdev && \
> +    mkdir -p /etc/portage/repos.conf
> +ADD crossdev.conf /etc/portage/repos.conf/crossdev.conf
> +
> +RUN emerge -qv \
> +        dev-vcs/git ">=dev-libs/glib-2.0" \
> +        sys-devel/crossdev \
> +        sys-libs/zlib dev-lang/python
> +
> +RUN crossdev -s4 -t mipsr5900el-unknown-linux-gnu
> +
> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsr5900el-unknown-linux-gnu-
> diff --git a/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
> new file mode 100644
> index 00000000000..b8fa368c1c3
> --- /dev/null
> +++ b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
> @@ -0,0 +1,5 @@
> +[crossdev]
> +location = /usr/local/portage-crossdev
> +priority = 10
> +masters = gentoo
> +auto-sync = no
> -- 
> 2.26.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


