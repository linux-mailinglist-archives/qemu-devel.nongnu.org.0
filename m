Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04584C65C0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:34:17 +0100 (CET)
Received: from localhost ([::1]:52094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcQ4-0006wR-7W
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOcLN-0005ZI-K4
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:29:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOcKt-00006Z-AL
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646040534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdFgyfcjFJL7uHjJh2hFC6j/gqcMm0zr52Fdpw7GRm4=;
 b=YQmuOlul/4xAOt40gy0i4zyl0KZ5xJDo9VVY8C3JXp6o0C9EPUKyZgXHf9fVPGbOuovC23
 Ge356izrOkbalaKFASapocApJavtEMRyQwvISiM/ZJ0hmaKa3JofaVrQkPU1PVJeBRbYht
 UW3szo5Lhb3Oi+tNd5Q03osi9h/Zfs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-bTi-LPoKN5qz57wu1p1AMw-1; Mon, 28 Feb 2022 04:28:49 -0500
X-MC-Unique: bTi-LPoKN5qz57wu1p1AMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA7F1854E26;
 Mon, 28 Feb 2022 09:28:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8647AB7C;
 Mon, 28 Feb 2022 09:28:31 +0000 (UTC)
Date: Mon, 28 Feb 2022 09:28:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Message-ID: <YhyVvAv0M8WwiK2A@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220225172021.3493923-5-alex.bennee@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$SUBJECT  =~ s/lci-tool/lcitool/

On Fri, Feb 25, 2022 at 05:20:07PM +0000, Alex Bennée wrote:
> Using lci-tool update debian-arm64-cross to a Debian 11 based system.

Likewise

> As a result we can drop debian-arm64-test-cross just for building
> tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220211160309.335014-5-alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/container-cross.yml              |  10 +-
>  tests/docker/Makefile.include                 |   3 -
>  .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
>  .../debian-arm64-test-cross.docker            |  13 --
>  tests/lcitool/refresh                         |  11 ++
>  tests/tcg/configure.sh                        |   2 +-
>  6 files changed, 173 insertions(+), 52 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
> 



> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    apt-get update && \
> +    apt-get install -y eatmydata && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            bash \

    ...snip native packages...

> +            texinfo && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y && \
> +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> +    dpkg-reconfigure locales
>  
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> -        libbz2-dev:arm64 \
> -        liblzo2-dev:arm64 \
> -        librdmacm-dev:arm64 \
> -        libsnappy-dev:arm64 \
> -        libxen-dev:arm64
> +ENV LANG "en_US.UTF-8"
> +ENV MAKE "/usr/bin/make"
> +ENV NINJA "/usr/bin/ninja"
> +ENV PYTHON "/usr/bin/python3"
> +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>  
> -# nettle
> -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    dpkg --add-architecture arm64 && \
> +    eatmydata apt-get update && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            g++-aarch64-linux-gnu \

  ...snip cross packages...

> +            zlib1g-dev:arm64 && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y && \
> +    mkdir -p /usr/local/share/meson/cross && \
> +    echo "[binaries]\n\
> +c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
> +ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
> +strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
> +pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
> +\n\
> +[host_machine]\n\
> +system = 'linux'\n\
> +cpu_family = 'aarch64'\n\
> +cpu = 'aarch64'\n\
> +endian = 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
> +    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
> +    mkdir -p /usr/libexec/ccache-wrappers && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-cc && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-g++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-gcc
> +
> +ENV ABI "aarch64-linux-gnu"
> +ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> +ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user

This cross dockerfile is a fully self-contained image.

Traditionally QEMU has had a split image for Debian cross targets,
where there is a base with common native packages, and then a
layer for the cross packages.

lcitool is capable of generating the image in this split format
using the arg

   --layers {all,native,foreign}

Personally I think it is simpler to just use the fully self
contained image, as it would simplify our gitlab pipeline
to only need 1 build stage for containers.  The cost is that
we'll not be sharing layers for native packages and more wall
clock time building since we're installing the same native
packages over & over.

I'm not saying to change your patch, I just wanted to point
out the possibility in case someone cares strongly about
keeping a split layer model for cross containers.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


