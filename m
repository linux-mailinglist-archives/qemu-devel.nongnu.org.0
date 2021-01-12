Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B52F2D20
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:46:15 +0100 (CET)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHBl-0002dw-UA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kzGKq-0005PI-I3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:51:32 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:27691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kzGKo-0002Jf-7J
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610445085;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:From:Subject:Sender;
 bh=Hiz5p6VUDr5ClMtt0NTvIEdZk+0j3cDj82lDxUkoIGE=;
 b=qKL9pjiq0e501EuEMxw34VCuI25S4FllybbJCZshvRFVQlVNeKdxOnB3BOex6OiTF0
 R4b8bssot41E91EPMYyGw6L9tfW5luCe4OU7vXGl/Kru/z8oAd3o21YM/MC/F7LajE1j
 vbmAVlRxrd1KphkWGUX08eOtHjwVLACbB9ZETij5qvnhkQsebam7dyFWXmpB7f82wXJD
 BX1+4VCEz+vPCMuCcSPaTJuULKACfBH+bId1kYt5t7qyI2EEuD0sFJTN2wOkCuD/ao/z
 0GDyEk/AoFy8Rb73YLM0TaS9RVq18oq0SNCB2XyvjWL+f4nqGnpMnCUiZDqXEzS/L9pT
 Gv5A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTXuqX"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0C9pOOGk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <qemu-devel@nongnu.org>;
 Tue, 12 Jan 2021 10:51:24 +0100 (CET)
Date: Tue, 12 Jan 2021 10:51:10 +0100
From: Olaf Hering <olaf@aepfle.de>
To: qemu-devel@nongnu.org
Subject: virtfs-proxy-helper fails due to bogus libattr test
Message-ID: <20210112105110.2f0e4fbb.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qoeihNjiw6Y.+LNHs9d=wb."; protocol="application/pgp-signature"
Received-SPF: none client-ip=85.215.255.22; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/qoeihNjiw6Y.+LNHs9d=wb.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Depending on the build environment, the meson test to find a suitable libat=
tr fails. Something appends -O0 to CFLAGS.

I see no "-O0" in qemu.git. This is a regression, it worked in 553032db1744=
0f8de011390e5a1cfddd13751b0b.

Does anyone happen to know what is causing this?

Olaf

./configure --host=3Dx86_64-suse-linux-gnu --build=3Dx86_64-suse-linux-gnu =
--program-prefix=3D --disable-dependency-tracking --prefix=3D/usr --exec-pr=
efix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sbin --sysconfdir=3D/etc -=
-datadir=3D/usr/share --includedir=3D/usr/include --libdir=3D/usr/lib64 --l=
ibexecdir=3D/usr/libexec --localstatedir=3D/var --sharedstatedir=3D/var/lib=
 --mandir=3D/usr/share/man --infodir=3D/usr/share/info --disable-dependency=
-tracking --cc=3D/usr/bin/gcc-10 --host-cc=3D/usr/bin/gcc-10 --cxx=3D/usr/b=
in/g++-10 --docdir=3D/usr/share/doc/packages --firmwarepath=3D/usr/share/qe=
mu/firmware '--target-list=3Di386-softmmu x86_64-softmmu' '--audio-drv-list=
=3Dalsa pa' --iasl=3D/usr/bin/iasl --install=3D/usr/bin/install --objcc=3D/=
usr/bin/false --python=3D/usr/bin/python3 --ninja=3D/usr/bin/ninja --tls-pr=
iority=3DNORMAL --with-git=3D/usr/bin/false --with-suffix=3Dqemu --disable-=
docs --disable-gtk --disable-libnfs --disable-opengl --disable-rbd --disabl=
e-spice --disable-virglrenderer --disable-vte --enable-attr --disable-brlap=
i --disable-bsd-user --enable-bzip2 --enable-cap-ng --disable-capstone --di=
sable-cocoa --enable-coroutine-pool --disable-crypto-afalg --enable-curl --=
enable-curses --disable-debug-info --disable-debug-mutex --disable-debug-tc=
g --with-default-devices --enable-docs --disable-fdt --enable-gcrypt --enab=
le-gettext --disable-git-update --disable-glusterfs --enable-gnutls --enabl=
e-gtk --enable-guest-agent --disable-guest-agent-msi --disable-hax --disabl=
e-hvf --enable-iconv --disable-jemalloc --disable-keyring --enable-kvm --di=
sable-libdaxctl --disable-libiscsi --enable-libnfs --enable-libssh --enable=
-libusb --enable-libxml2 --enable-linux-aio --disable-linux-user --enable-l=
ive-block-migration --disable-lzo --disable-lzfse --disable-malloc-trim --d=
isable-membarrier --enable-modules --disable-mpath --disable-netmap --disab=
le-nettle --enable-numa --enable-opengl --enable-pie --enable-plugins --dis=
able-qom-cast-debug --enable-rbd --disable-rdma --enable-replication --enab=
le-rng-none --disable-safe-stack --disable-sanitizers --disable-sdl --disab=
le-sdl-image --disable-seccomp --disable-slirp --disable-smartcard --disabl=
e-snappy --disable-sparse --enable-spice --enable-stack-protector --disable=
-strip --enable-system --enable-tcg --disable-tcg-interpreter --disable-tcm=
alloc --enable-tools --disable-tpm --disable-tsan --disable-u2f --enable-us=
b-redir --disable-user --enable-vde --enable-vhost-crypto --enable-vhost-ne=
t --enable-vhost-scsi --enable-vhost-user --enable-vhost-user-fs --enable-v=
host-vsock --enable-virglrenderer --enable-virtfs --disable-virtiofsd --ena=
ble-vnc --disable-vnc-jpeg --enable-vnc-png --disable-vnc-sasl --enable-vte=
 --disable-werror --disable-whpx --enable-xen --enable-xen-pci-passthrough =
--enable-xfsctl
....
[  223s] Run-time dependency libnfs found: YES 4.0.0
[  223s] None of 'CC_LD' are defined in the environment, not changing globa=
l flags.
[  223s] Running compile:
[  223s] Working directory:  /home/abuild/rpmbuild/BUILD/qemu-20210111T1515=
35.b3f846c59d/build/meson-private/tmpg908fqs3
[  223s] Command line:  /usr/bin/gcc-10 -I/usr/include/ncursesw /home/abuil=
d/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-private/tmpg90=
8fqs3/testfile.c -o /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846=
c59d/build/meson-private/tmpg908fqs3/output.exe -pipe -O2 -Wall -D_FORTIFY_=
SOURCE=3D2 -fstack-protector-strong -funwind-tables -fasynchronous-unwind-t=
ables -fstack-clash-protection -Werror=3Dreturn-type -g -D_FILE_OFFSET_BITS=
=3D64 -O0 -std=3Dgnu99=20
[  223s]=20
[  223s] Code:
[  223s] =20
[  223s]   #include <stddef.h>
[  223s]   #include <sys/types.h>
[  223s]   #ifdef CONFIG_LIBATTR
[  223s]   #include <attr/xattr.h>
[  223s]   #else
[  223s]   #include <sys/xattr.h>
[  223s]   #endif
[  223s]   int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, N=
ULL, NULL, 0, 0); return 0; }
[  223s] Compiler stdout:
[  223s] =20
[  223s] Compiler stderr:
[  223s]  In file included from /usr/include/sys/types.h:25,
[  223s]                  from /home/abuild/rpmbuild/BUILD/qemu-20210111T15=
1535.b3f846c59d/build/meson-private/tmpg908fqs3/testfile.c:3:
[  223s] /usr/include/features.h:397:4: warning: #warning _FORTIFY_SOURCE r=
equires compiling with optimization (-O) [-Wcpp]
[  223s]   397 | #  warning _FORTIFY_SOURCE requires compiling with optimiz=
ation (-O)
[  223s]       |    ^~~~~~~
[  223s]=20
[  223s] Dependency libseccomp skipped: feature seccomp disabled
....

--Sig_/qoeihNjiw6Y.+LNHs9d=wb.
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/9cQ4ACgkQ86SN7mm1
DoBDMA/+KgfTa/dgI22xEGn5KOmYG12QZmtefow1QEej1DAQ8tiUbX9muNFKo508
gKh62W7ScTuI4tA8EVM3+7NACIiHVAAwZ/iqNfh/RTcuZSNfU9wKjnvhK6IQy33e
dlME9xol+zoeyyw8ZuBDksC6TvkZnq49sbgNsKjdmUst65X6CwfdVXa2aE9XPO+N
PNL215Ee+s2yoxBgCeLa7AAxe/hipCZu4mf0JzKdqZyoB/glufW795Z+caHYoxfg
+dE1BqldPdhlVn2z6RjL8H3RPhvCtvow1o3ojxkG7kfypeNhOsyYgI/Sc0rtkWTO
DQc6Yaoa+C0jkgU0BkD7aCxGh2I8iVNWK7s7zfrO7f30uKHsG6Cc55ej5/Hu05SA
juLWaLFy5V1/3aS+n0MUc4/S+RkinyK5wHrBZB9LniWsaOrGbJFZjbbb5bmp921r
G7fZyiOmOE+ifRZ7WLBEXBGef6VNLK2ZgxyZV3MwkCZ/FUSm4BC6SMyfpliZwmsD
8DgpIK3UavBTsXy3VD3yLmsX0cijAk0bgr9PVyUnfev/14QhSMn7x6UNsIXo/dCp
C4zXi8f8BwceuhBX+pJFRu4PlKRTluRFFWVkS1jcWG3ciIw85C3n7mzfEG9ZEFKP
axk4kJdpypRW51c444l6m8Jeo0XVR2FKfzE1XX0YtplzPa3toz8=
=PpmP
-----END PGP SIGNATURE-----

--Sig_/qoeihNjiw6Y.+LNHs9d=wb.--

