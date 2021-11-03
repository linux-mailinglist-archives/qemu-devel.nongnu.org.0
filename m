Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C3444686
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:02:50 +0100 (CET)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJez-0007PH-DJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miJdV-0005tl-0H
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miJdT-0008Ve-5B
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635958874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=T5YhDqafBjYBric3GNtpo/Y4I2JFQc418mySwR4h2zY=;
 b=AtWgvBc/Ek7w99+RxfrBu63qKVk4Xalgu2p8eSXv2WPcOHf/hO5YbyDrEKM1wUVFfuWBTS
 PnofPFFqMct0NVrJ2OTDmZ5AMf6WiTa9tNJu54K4Y45BrA3LpcJHOVQqBhXAyhcLFZ8EFG
 OJVJ4x6EuUFPlbPxV4jeahLL0Uzi0/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-5aU__mV5NnSJ5Q5uTTpL3A-1; Wed, 03 Nov 2021 13:01:07 -0400
X-MC-Unique: 5aU__mV5NnSJ5Q5uTTpL3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC62BED90A;
 Wed,  3 Nov 2021 17:00:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ED3C171FF;
 Wed,  3 Nov 2021 16:59:08 +0000 (UTC)
Date: Wed, 3 Nov 2021 16:59:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 6/6] docker: Add Fedora 35 container
Message-ID: <YYK/2WugmOrTA+62@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103144844.1285634-7-jsnow@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 10:48:44AM -0400, John Snow wrote:
> Or, more accurately, update our current Fedora container to Fedora 35,
> and then add a new fedora34 container and build test.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml               |  16 ++++
>  .gitlab-ci.d/container-core.yml          |   5 +
>  tests/docker/dockerfiles/fedora.docker   |   2 +-
>  tests/docker/dockerfiles/fedora34.docker | 117 +++++++++++++++++++++++

We already struggle with having too much work in the CI pipeline
and will be in trouble when they start enforcing CI limits.

With that in mind I'm not sure that having both Fedora versions
brings large enough benefit to justify the CI CPU time burnt.

If we did want both versions though, we should be consistent
with file naming - ie fedora35.dockre, not fedora.docker
to match fedora34.docker.

>  4 files changed, 139 insertions(+), 1 deletion(-)
>  create mode 100644 tests/docker/dockerfiles/fedora34.docker
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 5c378e35f9..9d9330b646 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -100,6 +100,22 @@ acceptance-system-debian:
>      IMAGE: debian-amd64
>      MAKE_CHECK_ARGS: check-acceptance
>  
> +build-system-fedora34:
> +  extends: .native_build_job_template
> +  needs:
> +    job: amd64-fedora34-container
> +  variables:
> +    IMAGE: fedora34
> +    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
> +             --enable-fdt=system --enable-slirp=system --enable-capstone=system
> +    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
> +      xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
>  build-system-fedora:
>    extends: .native_build_job_template
>    needs:
> diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
> index e8dd1f476a..96a71e88ff 100644
> --- a/.gitlab-ci.d/container-core.yml
> +++ b/.gitlab-ci.d/container-core.yml
> @@ -6,6 +6,11 @@ amd64-centos8-container:
>    variables:
>      NAME: centos8
>  
> +amd64-fedora34-container:
> +  extends: .container_job_template
> +  variables:
> +    NAME: fedora34
> +
>  amd64-fedora-container:
>    extends: .container_job_template
>    variables:
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 44d7f12110..24aca97cd7 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -1,4 +1,4 @@
> -FROM registry.fedoraproject.org/fedora:34
> +FROM registry.fedoraproject.org/fedora:35
>  
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora34.docker b/tests/docker/dockerfiles/fedora34.docker
> new file mode 100644
> index 0000000000..44d7f12110
> --- /dev/null
> +++ b/tests/docker/dockerfiles/fedora34.docker
> @@ -0,0 +1,117 @@
> +FROM registry.fedoraproject.org/fedora:34
> +
> +# Please keep this list sorted alphabetically
> +ENV PACKAGES \
> +    SDL2-devel \
> +    SDL2_image-devel \
> +    alsa-lib-devel \
> +    bc \
> +    brlapi-devel \
> +    bzip2 \
> +    bzip2-devel \
> +    ca-certificates \
> +    capstone-devel \
> +    ccache \
> +    clang \
> +    ctags \
> +    cyrus-sasl-devel \
> +    daxctl-devel \
> +    dbus-daemon \
> +    device-mapper-multipath-devel \
> +    diffutils \
> +    findutils \
> +    gcc \
> +    gcc-c++ \
> +    gcovr \
> +    genisoimage \
> +    gettext \
> +    git \
> +    glib2-devel \
> +    glibc-langpack-en \
> +    glibc-static \
> +    glusterfs-api-devel \
> +    gnutls-devel \
> +    gtk3-devel \
> +    hostname \
> +    jemalloc-devel \
> +    libaio-devel \
> +    libasan \
> +    libattr-devel \
> +    libbpf-devel \
> +    libcacard-devel \
> +    libcap-ng-devel \
> +    libcurl-devel \
> +    libdrm-devel \
> +    libepoxy-devel \
> +    libfdt-devel \
> +    libffi-devel \
> +    libgcrypt-devel \
> +    libiscsi-devel \
> +    libjpeg-devel \
> +    libnfs-devel \
> +    libpmem-devel \
> +    libpng-devel \
> +    librbd-devel \
> +    libseccomp-devel \
> +    libslirp-devel \
> +    libssh-devel \
> +    libtasn1-devel \
> +    libubsan \
> +    libudev-devel \
> +    liburing-devel \
> +    libusbx-devel \
> +    libxml2-devel \
> +    libzstd-devel \
> +    llvm \
> +    lttng-ust-devel \
> +    lzo-devel \
> +    make \
> +    mesa-libgbm-devel \
> +    meson \
> +    ncurses-devel \
> +    nettle-devel \
> +    ninja-build \
> +    nmap-ncat \
> +    numactl-devel \
> +    openssh-clients \
> +    pam-devel \
> +    perl-Test-Harness \
> +    perl-base \
> +    pixman-devel \
> +    pkgconfig \
> +    pulseaudio-libs-devel \
> +    python3 \
> +    python3-PyYAML \
> +    python3-numpy \
> +    python3-opencv \
> +    python3-pillow \
> +    python3-pip \
> +    python3-sphinx \
> +    python3-sphinx_rtd_theme \
> +    python3-virtualenv \
> +    rdma-core-devel \
> +    rpm \
> +    sed \
> +    snappy-devel \
> +    sparse \
> +    spice-protocol \
> +    spice-server-devel \
> +    systemd-devel \
> +    systemtap-sdt-devel \
> +    tar \
> +    tesseract \
> +    tesseract-langpack-eng \
> +    texinfo \
> +    usbredir-devel \
> +    util-linux \
> +    virglrenderer-devel \
> +    vte291-devel \
> +    which \
> +    xen-devel \
> +    xfsprogs-devel \
> +    zlib-devel
> +ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
> +
> +RUN dnf install -y $PACKAGES
> +RUN rpm -q $PACKAGES | sort > /packages.txt
> +ENV PATH $PATH:/usr/libexec/python3-sphinx/
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


