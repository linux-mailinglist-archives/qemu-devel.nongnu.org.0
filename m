Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84630262EC3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 14:54:58 +0200 (CEST)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFzcn-0000nR-JE
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 08:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFzbb-0007xk-8q
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:53:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27389
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFzbY-0000g8-3N
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599656018;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UyJ1AJpNdcPkepS4vz0luT5rA7G5nfm/BE3ftAZ853A=;
 b=C29FkwHdtNZw7/95mSOAaTQITCJ2Adk5zdiK6ml9pUkXO1gylN6zBBk2+j1EOTzF+SL0bJ
 CdP5uEHFeQP9LICtoWBX12CaoxHCBihiL2omVq1DW7oJo1UG8NHSFe3YpWr+3LBe8kR63F
 tJbHA+F7B0Tm2GwOubN1G4mV6CMhPts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-Nhz9LSZsMk2YsRQ7t8hXtA-1; Wed, 09 Sep 2020 08:53:31 -0400
X-MC-Unique: Nhz9LSZsMk2YsRQ7t8hXtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2CC81008550;
 Wed,  9 Sep 2020 12:53:29 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89DF2838C1;
 Wed,  9 Sep 2020 12:53:23 +0000 (UTC)
Date: Wed, 9 Sep 2020 13:53:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH v2 06/21] ci: Enable msys2 ci in cirrus
Message-ID: <20200909125320.GX1011023@redhat.com>
References: <20200909094617.1582-1-luoyonggang@gmail.com>
 <20200909094617.1582-7-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200909094617.1582-7-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Max Reitz <mreitz@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 09, 2020 at 05:46:02PM +0800, Yonggang Luo wrote:
> Install msys2 in a proper way refer to https://github.com/cirruslabs/cirrus-ci-docs/issues/699
> The https://wiki.qemu.org/Hosts/W32#Native_builds_with_MSYS2 need to be updated.
> There is no need of --cross-prefix, open mingw64.exe instead of msys2.exe then we don't
> need the --cross-prefix, besides we using environment variable settings:
>     MSYS: winsymlinks:nativestrict
>     MSYSTEM: MINGW64
>     CHERE_INVOKING: 1
> to opening mingw64 native shell.
> We now running tests with make -i check to skip tests errors.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .cirrus.yml                         | 24 +++++++++++++++++++++
>  scripts/ci/windows/msys2-build.sh   | 28 ++++++++++++++++++++++++
>  scripts/ci/windows/msys2-install.sh | 33 +++++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 scripts/ci/windows/msys2-build.sh
>  create mode 100644 scripts/ci/windows/msys2-install.sh
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 3dd9fcff7f..49335e68c9 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -63,3 +63,27 @@ macos_xcode_task:
>                     --enable-werror --cc=clang || { cat config.log; exit 1; }
>      - gmake -j$(sysctl -n hw.ncpu)
>      - gmake check
> +
> +windows_msys2_task:
> +  windows_container:
> +    image: cirrusci/windowsservercore:cmake
> +    os_version: 2019
> +    cpu: 8
> +    memory: 8G
> +  env:
> +    MSYS: winsymlinks:nativestrict
> +    MSYSTEM: MINGW64
> +    CHERE_INVOKING: 1
> +  printenv_script:
> +    - C:\tools\msys64\usr\bin\bash.exe -lc 'printenv'
> +  install_script:
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "cd /c/tools && curl -O http://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "cd /c/tools && curl -O http://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig"
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "cd /c/tools && pacman -U --noconfirm msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "pacman -Sy --noconfirm"
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "pacman --needed --noconfirm -S bash pacman pacman-mirrors msys2-runtime"
> +    - taskkill /F /IM gpg-agent.exe
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Su"
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "sh scripts/ci/windows/msys2-install.sh"
> +  script:
> +    - C:\tools\msys64\usr\bin\bash.exe -lc "sh scripts/ci/windows/msys2-build.sh"
> diff --git a/scripts/ci/windows/msys2-build.sh b/scripts/ci/windows/msys2-build.sh
> new file mode 100644
> index 0000000000..d9d046b5b0
> --- /dev/null
> +++ b/scripts/ci/windows/msys2-build.sh
> @@ -0,0 +1,28 @@
> +mkdir build
> +cd build
> +../configure \
> +--python=python3 \
> +--ninja=ninja \
> +--enable-stack-protector \
> +--enable-guest-agent \
> +--disable-pie \
> +--enable-gnutls --enable-nettle \
> +--enable-sdl --enable-sdl-image --enable-gtk --disable-vte --enable-curses --enable-iconv \
> +--enable-vnc --enable-vnc-sasl --enable-vnc-jpeg --enable-vnc-png \
> +--enable-slirp=git \
> +--disable-brlapi --enable-curl \
> +--enable-fdt \
> +--disable-kvm --enable-hax --enable-whpx \
> +--enable-libnfs --enable-libusb --enable-live-block-migration --enable-usb-redir \
> +--enable-lzo --enable-snappy --enable-bzip2 --enable-zstd \
> +--enable-membarrier --enable-coroutine-pool \
> +--enable-libssh --enable-libxml2 \
> +--enable-jemalloc --enable-avx2 \
> +--enable-replication \
> +--enable-tools \
> +--enable-bochs --enable-cloop --enable-dmg --enable-qcow1 --enable-vdi --enable-vvfat --enable-qed --enable-parallels \
> +--enable-sheepdog \
> +--enable-capstone=git
> +
> +make -j$NUMBER_OF_PROCESSORS
> +make -i -j$NUMBER_OF_PROCESSORS check

This still needs the changes discussed in v1 to remove all the
configure args and move the commands into the main cirrus.yml


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


