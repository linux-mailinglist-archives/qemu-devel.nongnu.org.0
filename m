Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5A2F2EF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:27:31 +0100 (CET)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIlm-0000Qk-L1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kzIkf-0008Po-GG
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:26:21 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kzIkd-0004IY-6s
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ADh4cq7tXvEP2T1fkVrkau6/MW4f0Kw5UifbvfY74so=; b=ehfRURV155B6FTPa2XWgcfF08E
 ddkX2IAZgpRlCqrapuzkRp/aYbaGZ5nPsUILNH8Y2Qm2/ao1Hn5gFrNUT1sxlKFWnatmdbzR/DJ5e
 HApiQN11A4MyhJyCGyUNfo6cVDyqC6SrAxDI8/CABKddHYaH4dzBMMebR9bVe7ZlykoLWEfV8vMJ0
 Oe6go5MtKSbkjyWrgSi9CgN+qiCvyQ7qSzJ18hz8MZJD+frohZG9vag3ggnC4atjunCzvovHd8xHz
 1/O6D3xPGl4UKGDbPntep9oO/lcE8LWUQxbMHc8YEo4RtomZzfKe9J2DEppBpiwBS2NeiLwfyDnF0
 l31C/+o3E60ETGUncg84xShRE4yhicLgD//0+C+XsEL8af65VMadgzl15srYQAvS3R2V22wW4oPW9
 pyMmFrV6Xhj0Ks/CoFwItx0pThNr28QWaapLNVM557hclAyHSHPgXLw9PRnA4DxS88eweQM1swg5+
 jW+kdCA1m6jK/lM07Hsr6LqTOGxnyeyUuQC6wss1wJVBhLMOjtkF3bomH+sxBfLGttBL9TA2b4OLK
 cABD5iipvBBsD1Dn4Gir99JGdolVuy0RqeZVIY9Rge6X3woDlKYfX0jzaBkHP3RcxsBk87wqBC+S+
 9jrOedIf0dYHk5SwLs3gwK+yndOYtQo9QGqpPrUU4=;
To: qemu-devel@nongnu.org
Subject: Re: virtfs-proxy-helper fails due to bogus libattr test
Date: Tue, 12 Jan 2021 13:26:00 +0100
Message-ID: <2315616.PpvBb8DKss@silver>
In-Reply-To: <20210112105110.2f0e4fbb.olaf@aepfle.de>
References: <20210112105110.2f0e4fbb.olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Olaf Hering <olaf@aepfle.de>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Christian Schoenebeck <qemu_oss@crudebyte.com>
From: Christian Schoenebeck via <qemu-devel@nongnu.org>

On Dienstag, 12. Januar 2021 10:51:10 CET Olaf Hering wrote:
> Depending on the build environment, the meson test to find a suitable
> libattr fails. Something appends -O0 to CFLAGS.
> 
> I see no "-O0" in qemu.git. This is a regression, it worked in
> 553032db17440f8de011390e5a1cfddd13751b0b.
> 
> Does anyone happen to know what is causing this?

Putting Paolo in CC in case he's got some suspicion. I don't see something 
obvious right now.

Olaf, could you run a 'git bisect' to identify the relevant commit causing 
this?

> 
> Olaf
> 
> ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu
> --program-prefix= --disable-dependency-tracking --prefix=/usr
> --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
> --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64
> --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib
> --mandir=/usr/share/man --infodir=/usr/share/info
> --disable-dependency-tracking --cc=/usr/bin/gcc-10
> --host-cc=/usr/bin/gcc-10 --cxx=/usr/bin/g++-10
> --docdir=/usr/share/doc/packages --firmwarepath=/usr/share/qemu/firmware
> '--target-list=i386-softmmu x86_64-softmmu' '--audio-drv-list=alsa pa'
> --iasl=/usr/bin/iasl --install=/usr/bin/install --objcc=/usr/bin/false
> --python=/usr/bin/python3 --ninja=/usr/bin/ninja --tls-priority=NORMAL
> --with-git=/usr/bin/false --with-suffix=qemu --disable-docs --disable-gtk
> --disable-libnfs --disable-opengl --disable-rbd --disable-spice
> --disable-virglrenderer --disable-vte --enable-attr --disable-brlapi
> --disable-bsd-user --enable-bzip2 --enable-cap-ng --disable-capstone
> --disable-cocoa --enable-coroutine-pool --disable-crypto-afalg
> --enable-curl --enable-curses --disable-debug-info --disable-debug-mutex
> --disable-debug-tcg --with-default-devices --enable-docs --disable-fdt
> --enable-gcrypt --enable-gettext --disable-git-update --disable-glusterfs
> --enable-gnutls --enable-gtk --enable-guest-agent --disable-guest-agent-msi
> --disable-hax --disable-hvf --enable-iconv --disable-jemalloc
> --disable-keyring --enable-kvm --disable-libdaxctl --disable-libiscsi
> --enable-libnfs --enable-libssh --enable-libusb --enable-libxml2
> --enable-linux-aio --disable-linux-user --enable-live-block-migration
> --disable-lzo --disable-lzfse --disable-malloc-trim --disable-membarrier
> --enable-modules --disable-mpath --disable-netmap --disable-nettle
> --enable-numa --enable-opengl --enable-pie --enable-plugins
> --disable-qom-cast-debug --enable-rbd --disable-rdma --enable-replication
> --enable-rng-none --disable-safe-stack --disable-sanitizers --disable-sdl
> --disable-sdl-image --disable-seccomp --disable-slirp --disable-smartcard
> --disable-snappy --disable-sparse --enable-spice --enable-stack-protector
> --disable-strip --enable-system --enable-tcg --disable-tcg-interpreter
> --disable-tcmalloc --enable-tools --disable-tpm --disable-tsan
> --disable-u2f --enable-usb-redir --disable-user --enable-vde
> --enable-vhost-crypto --enable-vhost-net --enable-vhost-scsi
> --enable-vhost-user --enable-vhost-user-fs --enable-vhost-vsock
> --enable-virglrenderer --enable-virtfs --disable-virtiofsd --enable-vnc
> --disable-vnc-jpeg --enable-vnc-png --disable-vnc-sasl --enable-vte
> --disable-werror --disable-whpx --enable-xen --enable-xen-pci-passthrough
> --enable-xfsctl ....
> [  223s] Run-time dependency libnfs found: YES 4.0.0
> [  223s] None of 'CC_LD' are defined in the environment, not changing global
> flags. [  223s] Running compile:
> [  223s] Working directory: 
> /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> vate/tmpg908fqs3 [  223s] Command line:  /usr/bin/gcc-10
> -I/usr/include/ncursesw
> /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> vate/tmpg908fqs3/testfile.c -o
> /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> vate/tmpg908fqs3/output.exe -pipe -O2 -Wall -D_FORTIFY_SOURCE=2
> -fstack-protector-strong -funwind-tables -fasynchronous-unwind-tables
> -fstack-clash-protection -Werror=return-type -g -D_FILE_OFFSET_BITS=64 -O0
> -std=gnu99 [  223s]
> [  223s] Code:
> [  223s]
> [  223s]   #include <stddef.h>
> [  223s]   #include <sys/types.h>
> [  223s]   #ifdef CONFIG_LIBATTR
> [  223s]   #include <attr/xattr.h>
> [  223s]   #else
> [  223s]   #include <sys/xattr.h>
> [  223s]   #endif
> [  223s]   int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL,
> NULL, NULL, 0, 0); return 0; } [  223s] Compiler stdout:
> [  223s]
> [  223s] Compiler stderr:
> [  223s]  In file included from /usr/include/sys/types.h:25,
> [  223s]                  from
> /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> vate/tmpg908fqs3/testfile.c:3: [  223s] /usr/include/features.h:397:4:
> warning: #warning _FORTIFY_SOURCE requires compiling with optimization (-O)
> [-Wcpp] [  223s]   397 | #  warning _FORTIFY_SOURCE requires compiling with
> optimization (-O) [  223s]       |    ^~~~~~~
> [  223s]
> [  223s] Dependency libseccomp skipped: feature seccomp disabled
> ....



