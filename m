Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F704C6593
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:22:31 +0100 (CET)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcEh-0004Mm-1w
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOcD7-0003Py-Kb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOcD2-0003nX-W7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646040040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mV00cQFeAzEdf1MAOS8mMi+Z50cMsM1e1rQywXdIkwo=;
 b=R4woqxjHaPCmuLEh5HMXiuk554PCo2CMd300bifMtTcBR1XNE/GuGMLg8+Eb1zJr2srOYP
 dZUGdP6k3WL7u4tH6FLI1SXz6IR3FiCC/HuI02dBt8xzYE37Ozmoc334itXPFHpuK0rN7t
 GkvQ+++wlFiHnAKNJ1fClpZPzp9i2PU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-hKpaEPh7PaWP6OFwy1nYqg-1; Mon, 28 Feb 2022 04:20:35 -0500
X-MC-Unique: hKpaEPh7PaWP6OFwy1nYqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932251854E2A;
 Mon, 28 Feb 2022 09:20:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAEF7AB7D;
 Mon, 28 Feb 2022 09:20:20 +0000 (UTC)
Date: Mon, 28 Feb 2022 09:20:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Message-ID: <YhyT0aOAF34FtEFR@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
 <38a14acc-ffbe-e61a-3186-44a57273427a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <38a14acc-ffbe-e61a-3186-44a57273427a@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fam@euphon.net, Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 qemu-arm@nongnu.org, David Hildenbrand <dhildenb@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 09:39:29AM +0100, Thomas Huth wrote:
> On 25/02/2022 18.20, Alex Bennée wrote:
> > Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> > As a result we can drop debian-arm64-test-cross just for building
> > tests.
> 
> Good idea!
> 
> One comment below...
> 
> [...]
> > diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> > index 166e24df13..589510a7be 100644
> > --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> > @@ -1,32 +1,166 @@
> > +# THIS FILE WAS AUTO-GENERATED
> >   #
> > -# Docker arm64 cross-compiler target
> > +#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
> >   #
> > -# This docker target builds on the debian Buster base image.
> > -#
> > -FROM qemu/debian10
> > +# https://gitlab.com/libvirt/libvirt-ci
> > -# Add the foreign architecture we want and install dependencies
> > -RUN dpkg --add-architecture arm64
> > -RUN apt update && \
> > -    DEBIAN_FRONTEND=noninteractive eatmydata \
> > -    apt install -y --no-install-recommends \
> > -        crossbuild-essential-arm64
> > -RUN apt update && \
> > -    DEBIAN_FRONTEND=noninteractive eatmydata \
> > -    apt build-dep -yy -a arm64 --arch-only qemu
> > +FROM docker.io/library/debian:11-slim
> > -# Specify the cross prefix for this image (see tests/docker/common.rc)
> > -ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> > -ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
> > +RUN export DEBIAN_FRONTEND=noninteractive && \
> > +    apt-get update && \
> > +    apt-get install -y eatmydata && \
> > +    eatmydata apt-get dist-upgrade -y && \
> > +    eatmydata apt-get install --no-install-recommends -y \
> > +            bash \
> > +            bc \
> > +            bsdextrautils \
> > +            bzip2 \
> > +            ca-certificates \
> > +            ccache \
> > +            dbus \
> > +            debianutils \
> > +            diffutils \
> > +            exuberant-ctags \
> > +            findutils \
> > +            gcovr \
> > +            genisoimage \
> > +            gettext \
> > +            git \
> > +            hostname \
> > +            libpcre2-dev \
> > +            libspice-protocol-dev \
> > +            libtest-harness-perl \
> > +            llvm \
> > +            locales \
> > +            make \
> > +            meson \
> > +            ncat \
> > +            ninja-build \
> > +            openssh-client \
> > +            perl-base \
> > +            pkgconf \
> > +            python3 \
> > +            python3-numpy \
> > +            python3-opencv \
> > +            python3-pillow \
> > +            python3-pip \
> > +            python3-sphinx \
> > +            python3-sphinx-rtd-theme \
> > +            python3-venv \
> > +            python3-yaml \
> > +            rpm2cpio \
> > +            sed \
> > +            sparse \
> > +            tar \
> > +            tesseract-ocr \
> > +            tesseract-ocr-eng \
> > +            texinfo && \
> > +    eatmydata apt-get autoremove -y && \
> > +    eatmydata apt-get autoclean -y && \
> > +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > +    dpkg-reconfigure locales
> > -RUN apt update && \
> > -    DEBIAN_FRONTEND=noninteractive eatmydata \
> > -    apt install -y --no-install-recommends \
> > -        libbz2-dev:arm64 \
> > -        liblzo2-dev:arm64 \
> > -        librdmacm-dev:arm64 \
> > -        libsnappy-dev:arm64 \
> > -        libxen-dev:arm64
> > +ENV LANG "en_US.UTF-8"
> > +ENV MAKE "/usr/bin/make"
> > +ENV NINJA "/usr/bin/ninja"
> > +ENV PYTHON "/usr/bin/python3"
> > +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
> > -# nettle
> > -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
> > +RUN export DEBIAN_FRONTEND=noninteractive && \
> > +    dpkg --add-architecture arm64 && \
> > +    eatmydata apt-get update && \
> > +    eatmydata apt-get dist-upgrade -y && \
> > +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
> > +    eatmydata apt-get install --no-install-recommends -y \
> > +            g++-aarch64-linux-gnu \
> > +            gcc-aarch64-linux-gnu \
> > +            libaio-dev:arm64 \
> > +            libasan5:arm64 \
> > +            libasound2-dev:arm64 \
> > +            libattr1-dev:arm64 \
> > +            libbpf-dev:arm64 \
> > +            libbrlapi-dev:arm64 \
> > +            libbz2-dev:arm64 \
> > +            libc6-dev:arm64 \
> > +            libcacard-dev:arm64 \
> > +            libcap-ng-dev:arm64 \
> > +            libcapstone-dev:arm64 \
> > +            libcurl4-gnutls-dev:arm64 \
> > +            libdaxctl-dev:arm64 \
> > +            libdrm-dev:arm64 \
> > +            libepoxy-dev:arm64 \
> > +            libfdt-dev:arm64 \
> > +            libffi-dev:arm64 \
> > +            libfuse3-dev:arm64 \
> > +            libgbm-dev:arm64 \
> > +            libgcrypt20-dev:arm64 \
> > +            libglib2.0-dev:arm64 \
> > +            libglusterfs-dev:arm64 \
> > +            libgnutls28-dev:arm64 \
> > +            libgtk-3-dev:arm64 \
> > +            libibumad-dev:arm64 \
> > +            libibverbs-dev:arm64 \
> > +            libiscsi-dev:arm64 \
> > +            libjemalloc-dev:arm64 \
> > +            libjpeg62-turbo-dev:arm64 \
> > +            liblttng-ust-dev:arm64 \
> > +            liblzo2-dev:arm64 \
> > +            libncursesw5-dev:arm64 \
> > +            libnfs-dev:arm64 \
> > +            libnuma-dev:arm64 \
> > +            libpam0g-dev:arm64 \
> > +            libpixman-1-dev:arm64 \
> > +            libpng-dev:arm64 \
> > +            libpulse-dev:arm64 \
> > +            librbd-dev:arm64 \
> > +            librdmacm-dev:arm64 \
> > +            libsasl2-dev:arm64 \
> > +            libsdl2-dev:arm64 \
> > +            libsdl2-image-dev:arm64 \
> > +            libseccomp-dev:arm64 \
> > +            libselinux1-dev:arm64 \
> > +            libslirp-dev:arm64 \
> > +            libsnappy-dev:arm64 \
> > +            libspice-server-dev:arm64 \
> > +            libssh-gcrypt-dev:arm64 \
> > +            libsystemd-dev:arm64 \
> > +            libtasn1-6-dev:arm64 \
> > +            libubsan1:arm64 \
> > +            libudev-dev:arm64 \
> > +            liburing-dev:arm64 \
> > +            libusb-1.0-0-dev:arm64 \
> > +            libusbredirhost-dev:arm64 \
> > +            libvdeplug-dev:arm64 \
> > +            libvirglrenderer-dev:arm64 \
> > +            libvte-2.91-dev:arm64 \
> > +            libxen-dev:arm64 \
> > +            libzstd-dev:arm64 \
> > +            nettle-dev:arm64 \
> > +            systemtap-sdt-dev:arm64 \
> > +            xfslibs-dev:arm64 \
> > +            zlib1g-dev:arm64 && \
> > +    eatmydata apt-get autoremove -y && \
> > +    eatmydata apt-get autoclean -y && \
> > +    mkdir -p /usr/local/share/meson/cross && \
> > +    echo "[binaries]\n\
> > +c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
> 
> Is it really just "c =" or should this be "cc =" ?

I believe this really does want to be 'c', as in this is the path
for the 'c' programming language  in Meson.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


