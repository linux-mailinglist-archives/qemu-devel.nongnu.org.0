Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA92F9CA6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:36:06 +0100 (CET)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RtF-00027L-Sy
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1RrY-0001Gy-MQ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1RrV-0006Ka-Q9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610966057;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=s+e7vZqKRgz+P9p93AaFif74eexCFytOYcwt/WFV9W4=;
 b=J+AIgnaZxPpdhgZqWKjKNKf15qaix+h3jCMf0fSIMfPJ7UdPl1qVL6b03ahyo2z1Qx+YFv
 QiYa8F+MQmsQ1VpaPTHa6VY05Y1+J5Ksh9CDjPfLgtpDtPdSrDTlGJ67M+vMZeIEy/K7p/
 NvCUqD0dAOLG7IRbLjyqeixQxU0xMMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-1QaHYPbaOiexR0QYRMrBGQ-1; Mon, 18 Jan 2021 05:34:01 -0500
X-MC-Unique: 1QaHYPbaOiexR0QYRMrBGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14EE6B811D;
 Mon, 18 Jan 2021 10:34:00 +0000 (UTC)
Received: from redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A7D5D9CD;
 Mon, 18 Jan 2021 10:33:47 +0000 (UTC)
Date: Mon, 18 Jan 2021 10:33:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 8/9] tests/docker: Add dockerfile for Alpine Linux
Message-ID: <20210118103345.GE1789637@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-9-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118063808.12471-9-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 02:38:07PM +0800, Jiaxun Yang wrote:
> Alpine Linux[1] is a security-oriented, lightweight Linux distribution
> based on musl libc and busybox.
> 
> It it popular among Docker guests and embedded applications.
> 
> Adding it to test against different libc.
> 
> [1]: https://alpinelinux.org/
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  tests/docker/dockerfiles/alpine.docker | 57 ++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/alpine.docker
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> new file mode 100644
> index 0000000000..5be5198d00
> --- /dev/null
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -0,0 +1,57 @@
> +
> +FROM alpine:edge
> +
> +RUN apk update
> +RUN apk upgrade
> +
> +# Please keep this list sorted alphabetically
> +ENV PACKAGES \
> +	alsa-lib-dev \
> +	bash \
> +	bison \

This shouldn't be required.

> +	build-base \

This seems to be a meta packae that pulls in other
misc toolchain packages. Please list the pieces we
need explicitly instead.

> +	coreutils \
> +	curl-dev \
> +	flex \

This shouldn't be needed.

> +	git \
> +	glib-dev \
> +	glib-static \
> +	gnutls-dev \
> +	gtk+3.0-dev \
> +	libaio-dev \
> +	libcap-dev \

Should not be required, as we use cap-ng.

> +	libcap-ng-dev \
> +	libjpeg-turbo-dev \
> +	libnfs-dev \
> +	libpng-dev \
> +	libseccomp-dev \
> +	libssh-dev \
> +	libusb-dev \
> +	libxml2-dev \
> +	linux-headers \

Is this really needed ? We don't install kernel-headers on other
distros AFAICT.

> +	lzo-dev \
> +	mesa-dev \
> +	mesa-egl \
> +	mesa-gbm \
> +	meson \
> +	ncurses-dev \
> +	ninja \
> +	paxmark \

What is this needed for ?

> +	perl \
> +	pulseaudio-dev \
> +	python3 \
> +	py3-sphinx \
> +	shadow \

Is this really needed ?

> +	snappy-dev \
> +	spice-dev \
> +	texinfo \
> +	usbredir-dev \
> +	util-linux-dev \
> +	vde2-dev \
> +	virglrenderer-dev \
> +	vte3-dev \
> +	xfsprogs-dev \
> +	zlib-dev \
> +	zlib-static
> +
> +RUN apk add $PACKAGES

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


