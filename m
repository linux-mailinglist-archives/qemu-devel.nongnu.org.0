Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CDD2F7DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:10:59 +0100 (CET)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PoY-0002bw-SU
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0PNR-0003Iu-MP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0PNO-0003jf-2r
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610718171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aSzsEw8NIOXoTQBJs7U+/XgIIMjlGXD7V+M5UQQVyQ=;
 b=ixwdYgb0fCOV/bm2Beb8LwrPVt1JTZ2p9ROUPhJiCl1uzTuvFOOhcpc4L8Dh1YeZhPhgIf
 y4h0jL71LSK461FYfqXdcxcKvAK/dBzulJzOdakwUGq0ZCPMRkYqwpXULTYNCdcgCT91xY
 8ZEtX3vlCptMcK0F6TdNqEuuL4WTZ9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-mt54tbJiNHi3-W1kZLxYaw-1; Fri, 15 Jan 2021 08:42:50 -0500
X-MC-Unique: mt54tbJiNHi3-W1kZLxYaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E30806661;
 Fri, 15 Jan 2021 13:42:48 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF10010023AF;
 Fri, 15 Jan 2021 13:42:44 +0000 (UTC)
Subject: Re: [PATCH v2 01/25] hw/usb/ccid: remove references to NSS
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-2-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <6f030493-74d0-42c0-38df-235aa17e9690@redhat.com>
Date: Fri, 15 Jan 2021 10:42:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/14/21 10:02 AM, Daniel P. Berrangé wrote:
> The NSS package was previously pre-requisite for building CCID related
> features, however, this became obsolete when the libcacard library was
> spun off to a separate project:
>
>      commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
>      Author: Marc-André Lureau <marcandre.lureau@redhat.com>
>      Date:   Sun Aug 30 11:48:40 2015 +0200
>
>          libcacard: use the standalone project
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .travis.yml                                | 14 +++++++-------
>   docs/ccid.txt                              | 15 +++++++--------
>   scripts/coverity-scan/coverity-scan.docker |  1 -
>   tests/docker/dockerfiles/centos7.docker    |  1 +
>   tests/docker/dockerfiles/centos8.docker    |  1 +
>   tests/docker/dockerfiles/fedora.docker     |  2 +-
>   tests/docker/dockerfiles/ubuntu.docker     |  1 -
>   tests/docker/dockerfiles/ubuntu1804.docker |  1 -
>   tests/docker/dockerfiles/ubuntu2004.docker |  1 -
>   9 files changed, 17 insertions(+), 20 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.travis.yml b/.travis.yml
> index f2a101936c..af6aeb68da 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -27,6 +27,7 @@ addons:
>         - libattr1-dev
>         - libbrlapi-dev
>         - libcap-ng-dev
> +      - libcacard-dev
>         - libgcc-7-dev
>         - libgnutls28-dev
>         - libgtk-3-dev
> @@ -34,7 +35,6 @@ addons:
>         - liblttng-ust-dev
>         - libncurses5-dev
>         - libnfs-dev
> -      - libnss3-dev
>         - libpixman-1-dev
>         - libpng-dev
>         - librados-dev
> @@ -222,6 +222,7 @@ jobs:
>               - libaio-dev
>               - libattr1-dev
>               - libbrlapi-dev
> +            - libcacard-dev
>               - libcap-ng-dev
>               - libgnutls28-dev
>               - libgtk-3-dev
> @@ -229,7 +230,6 @@ jobs:
>               - liblttng-ust-dev
>               - libnfs-dev
>               - libncurses5-dev
> -            - libnss3-dev
>               - libpixman-1-dev
>               - libpng-dev
>               - librados-dev
> @@ -263,6 +263,7 @@ jobs:
>             - libaio-dev
>             - libattr1-dev
>             - libbrlapi-dev
> +          - libcacard-dev
>             - libcap-ng-dev
>             - libgcrypt20-dev
>             - libgnutls28-dev
> @@ -271,7 +272,6 @@ jobs:
>             - liblttng-ust-dev
>             - libncurses5-dev
>             - libnfs-dev
> -          - libnss3-dev
>             - libpixman-1-dev
>             - libpng-dev
>             - librados-dev
> @@ -297,6 +297,7 @@ jobs:
>             - libaio-dev
>             - libattr1-dev
>             - libbrlapi-dev
> +          - libcacard-dev
>             - libcap-ng-dev
>             - libgcrypt20-dev
>             - libgnutls28-dev
> @@ -305,7 +306,6 @@ jobs:
>             - liblttng-ust-dev
>             - libncurses5-dev
>             - libnfs-dev
> -          - libnss3-dev
>             - libpixman-1-dev
>             - libpng-dev
>             - librados-dev
> @@ -330,6 +330,7 @@ jobs:
>             - libaio-dev
>             - libattr1-dev
>             - libbrlapi-dev
> +          - libcacard-dev
>             - libcap-ng-dev
>             - libgcrypt20-dev
>             - libgnutls28-dev
> @@ -338,7 +339,6 @@ jobs:
>             - liblttng-ust-dev
>             - libncurses5-dev
>             - libnfs-dev
> -          - libnss3-dev
>             - libpixman-1-dev
>             - libpng-dev
>             - librados-dev
> @@ -372,6 +372,7 @@ jobs:
>           apt_packages:
>             - libaio-dev
>             - libattr1-dev
> +          - libcacard-dev
>             - libcap-ng-dev
>             - libgnutls28-dev
>             - libiscsi-dev
> @@ -379,7 +380,6 @@ jobs:
>             - liblzo2-dev
>             - libncurses-dev
>             - libnfs-dev
> -          - libnss3-dev
>             - libpixman-1-dev
>             - libsdl2-dev
>             - libsdl2-image-dev
> @@ -415,6 +415,7 @@ jobs:
>             - libaio-dev
>             - libattr1-dev
>             - libbrlapi-dev
> +          - libcacard-dev
>             - libcap-ng-dev
>             - libgcrypt20-dev
>             - libgnutls28-dev
> @@ -423,7 +424,6 @@ jobs:
>             - liblttng-ust-dev
>             - libncurses5-dev
>             - libnfs-dev
> -          - libnss3-dev
>             - libpixman-1-dev
>             - libpng-dev
>             - librados-dev
> diff --git a/docs/ccid.txt b/docs/ccid.txt
> index c7fda6d07d..4866ee4abd 100644
> --- a/docs/ccid.txt
> +++ b/docs/ccid.txt
> @@ -34,15 +34,14 @@ reader and smart card (i.e. not backed by a physical device) using this device.
>   
>   2. Building
>   
> -The cryptographic functions and access to the physical card is done via NSS.
> -
> -Installing NSS:
> +The cryptographic functions and access to the physical card is done via the
> +libcacard library, whose development package must be installed prior to
> +building QEMU:
>   
>   In redhat/fedora:
> -    yum install nss-devel
> -In ubuntu/debian:
> -    apt-get install libnss3-dev
> -    (not tested on ubuntu)
> +    yum install libcacard-devel
> +In ubuntu:
> +    apt-get install libcacard-dev
>   
>   Configuring and building:
>       ./configure --enable-smartcard && make
> @@ -51,7 +50,7 @@ Configuring and building:
>   3. Using ccid-card-emulated with hardware
>   
>   Assuming you have a working smartcard on the host with the current
> -user, using NSS, qemu acts as another NSS client using ccid-card-emulated:
> +user, using libcacard, QEMU acts as another client using ccid-card-emulated:
>   
>       qemu -usb -device usb-ccid -device ccid-card-emulated
>   
> diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
> index 501ac67233..ecff6ac5b4 100644
> --- a/scripts/coverity-scan/coverity-scan.docker
> +++ b/scripts/coverity-scan/coverity-scan.docker
> @@ -93,7 +93,6 @@ ENV PACKAGES \
>       mingw64-SDL2 \
>       ncurses-devel \
>       nettle-devel \
> -    nss-devel \
>       numactl-devel \
>       perl \
>       perl-Test-Harness \
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> index 6f11af1989..d47c96135c 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -17,6 +17,7 @@ ENV PACKAGES \
>       glib2-devel \
>       gnutls-devel \
>       libaio-devel \
> +    libcacard-devel \
>       libepoxy-devel \
>       libfdt-devel \
>       libgcrypt-devel \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 64cb7a6eda..0c90c3d4d5 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -14,6 +14,7 @@ ENV PACKAGES \
>       git \
>       glib2-devel \
>       libaio-devel \
> +    libcacard-devel \
>       libepoxy-devel \
>       libgcrypt-devel \
>       lzo-devel \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 0b5053f2d0..19e7a3d28a 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -27,6 +27,7 @@ ENV PACKAGES \
>       libasan \
>       libattr-devel \
>       libblockdev-mpath-devel \
> +    libcacard-devel \
>       libcap-ng-devel \
>       libcurl-devel \
>       libepoxy-devel \
> @@ -77,7 +78,6 @@ ENV PACKAGES \
>       ncurses-devel \
>       nettle-devel \
>       ninja-build \
> -    nss-devel \
>       numactl-devel \
>       perl \
>       perl-Test-Harness \
> diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
> index b5ef7a8198..9dec1c4bc6 100644
> --- a/tests/docker/dockerfiles/ubuntu.docker
> +++ b/tests/docker/dockerfiles/ubuntu.docker
> @@ -39,7 +39,6 @@ ENV PACKAGES \
>       libncurses5-dev \
>       libncursesw5-dev \
>       libnfs-dev \
> -    libnss3-dev \
>       libnuma-dev \
>       libpixman-1-dev \
>       libpng-dev \
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 9b0a19ba5e..aacea8627a 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -26,7 +26,6 @@ ENV PACKAGES \
>       libncurses5-dev \
>       libncursesw5-dev \
>       libnfs-dev \
> -    libnss3-dev \
>       libnuma-dev \
>       libpixman-1-dev \
>       librados-dev \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index ae889d8482..52810d4e27 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -28,7 +28,6 @@ ENV PACKAGES flex bison \
>       libncurses5-dev \
>       libncursesw5-dev \
>       libnfs-dev \
> -    libnss3-dev \
>       libnuma-dev \
>       libpixman-1-dev \
>       librados-dev \


