Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28445DCA8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:49:01 +0100 (CET)
Received: from localhost ([::1]:55236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqG3Y-0000qG-BT
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:49:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mqG0f-00075F-Jr
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 09:46:01 -0500
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:51068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mqG0b-000580-GE
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 09:46:01 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id B98D3433BE
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1637851544;
 bh=Zwgl6har0o07G9APYYMkNvewpwp6+10JrUBXaaMpyeI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=IsNrVx2YiP6fO7ZZB6Yzm2b5VtZTmg+XqqWiQuS299FoEuaebqVHy71uIMc5xotFr
 Uu/Rdqawe8c9BdEy2Aet0tmIf2sk29gjLi7zhD9VCm9q5tFF+2bs2c+dBn6fkH/X0+
 2jUSsB+EZhjsZmeVQT7EdorcgPJXhh0uo/WpYCVZ1Ly54Eqds7cEG1ZXQ1SciVBct1
 YGLuXeJ+8xmLJnVvDcqTuZx+JHXZxWd4OFd8sESHHIunhrpqvyDcc51lSJKQ8QgmON
 Ydg9ASdP0SkRq/vpbE+6u/xyJv8mSVvq9/YKRGJ3jO/mxTx/dyBymxKJttwvgEdote
 FGy/fc0+gO6LQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 301C42E816E
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 14:45:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Nov 2021 14:38:04 -0000
From: Paul White <1603636@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=None; component=None;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: intermediadc th-huth
X-Launchpad-Bug-Reporter: luigiburdo (intermediadc)
X-Launchpad-Bug-Modifier: Paul White (paulw2u)
References: <20160716103931.8137.62757.malonedeb@wampee.canonical.com>
Message-Id: <163785108581.1355.12178800659652342737.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1603636] Re: Guest has not initialized the display yet on ubuntu
 16.10 PPC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8374359a4078b88c107789f7620f3f25e1f1843c"; Instance="production"
X-Launchpad-Hash: aa7f2e404d9c66145fadccaee03c4ba8ecb37815
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1603636 <1603636@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: ubuntu
       Status: New =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1603636

Title:
  Guest has not initialized the display yet on ubuntu 16.10 PPC

Status in QEMU:
  Fix Released
Status in Ubuntu:
  Invalid

Bug description:
  Hi
  tested with all kind of configure, with all kind of machine types but i h=
ave the same issue ...=20
  on lastest quemo 2.6 "Guest has not initialized the display yet"
  note with lastest git repository the situation become worst because on i3=
86-softmmu i have the message but qemu exit alone because looklike there is=
 not a bios=20

  this is gdb of i386-softmmu

  (gdb) run
  Starting program: /home/amigaone/src/qemu/i386-softmmu/qemu-system-i386=20
  [Thread debugging using libthread_db enabled]
  Using host libthread_db library "/lib/powerpc-linux-gnu/libthread_db.so.1=
".
  [New Thread 0xf7f78b70 (LWP 25074)]
  [New Thread 0xf770bb70 (LWP 25075)]
  [New Thread 0xf6dfdb70 (LWP 25076)]
  [New Thread 0xf65fdb70 (LWP 25077)]
  [New Thread 0xf3337b70 (LWP 25078)]
  [New Thread 0xe4146b70 (LWP 25087)]
  qemu-system-i386: Trying to execute code outside RAM or ROM at 0x000a0000
  This usually means one of the following happened:

  (1) You told QEMU to execute a kernel for the wrong machine type, and it =
crashed on startup (eg trying to run a raspberry pi kernel on a versatilepb=
 QEMU machine)
  (2) You didn't give QEMU a kernel or BIOS filename at all, and QEMU execu=
ted a ROM full of no-op instructions until it fell off the end
  (3) Your guest kernel has a bug and crashed by jumping off into nowhere

  This is almost always one of the first two, so check your command line an=
d that you are using the right type of kernel for this machine.
  If you think option (3) is likely then you can try debugging your guest w=
ith the -d debug options; in particular -d guest_errors will cause the log =
to include a dump of the guest register state at this point.

  Execution cannot continue; stopping here.

  [Thread 0xe4146b70 (LWP 25087) exited]
  [Thread 0xf65fdb70 (LWP 25077) exited]
  [Thread 0xf6dfdb70 (LWP 25076) exited]
  [Thread 0xf770bb70 (LWP 25075) exited]
  [Thread 0xf7f78b70 (LWP 25074) exited]
  [Thread 0xf7f7c000 (LWP 25070) exited]
  [Inferior 1 (process 25070) exited with code 01]

 =20
  this is my ldd=20
  ldd ./qemu-system-i386=20
  	linux-vdso32.so.1 =3D>  (0x00100000)
  	libvirglrenderer.so.0 =3D> /usr/local/lib/libvirglrenderer.so.0 (0x0ff8a=
000)
  	libepoxy.so.0 =3D> /usr/lib/powerpc-linux-gnu/libepoxy.so.0 (0x0fe86000)
  	libgbm.so.1 =3D> /usr/local/lib/libgbm.so.1 (0x0fe55000)
  	libX11.so.6 =3D> /usr/lib/powerpc-linux-gnu/libX11.so.6 (0x0fcf2000)
  	libz.so.1 =3D> /lib/powerpc-linux-gnu/libz.so.1 (0x0fcb1000)
  	libcurl-gnutls.so.4 =3D> /usr/lib/powerpc-linux-gnu/libcurl-gnutls.so.4 =
(0x0fc10000)
  	libssh2.so.1 =3D> /usr/lib/powerpc-linux-gnu/libssh2.so.1 (0x0fbbf000)
  	libbz2.so.1.0 =3D> /lib/powerpc-linux-gnu/libbz2.so.1.0 (0x0fb7e000)
  	libpixman-1.so.0 =3D> /usr/lib/powerpc-linux-gnu/libpixman-1.so.0 (0x0fa=
dd000)
  	libutil.so.1 =3D> /lib/powerpc-linux-gnu/libutil.so.1 (0x0faac000)
  	libnuma.so.1 =3D> /usr/lib/powerpc-linux-gnu/libnuma.so.1 (0x0fa79000)
  	libncurses.so.5 =3D> /lib/powerpc-linux-gnu/libncurses.so.5 (0x0fa28000)
  	libtinfo.so.5 =3D> /lib/powerpc-linux-gnu/libtinfo.so.5 (0x0f9d7000)
  	libuuid.so.1 =3D> /lib/powerpc-linux-gnu/libuuid.so.1 (0x0f9a6000)
  	libpng16.so.16 =3D> /usr/lib/powerpc-linux-gnu/libpng16.so.16 (0x0f94500=
0)
  	libjpeg.so.8 =3D> /usr/lib/powerpc-linux-gnu/libjpeg.so.8 (0x0f8d4000)
  	libSDL2-2.0.so.0 =3D> /usr/local/lib/libSDL2-2.0.so.0 (0x0f77d000)
  	libnettle.so.6 =3D> /usr/lib/powerpc-linux-gnu/libnettle.so.6 (0x0f71c00=
0)
  	libgnutls.so.30 =3D> /usr/lib/powerpc-linux-gnu/libgnutls.so.30 (0x0f5ca=
000)
  	libgtk-x11-2.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libgtk-x11-2.0.so.0 =
(0x0f0e6000)
  	libgdk-x11-2.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libgdk-x11-2.0.so.0 =
(0x0f005000)
  	libcairo.so.2 =3D> /usr/lib/powerpc-linux-gnu/libcairo.so.2 (0x0eec3000)
  	libgdk_pixbuf-2.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libgdk_pixbuf-2.0=
.so.0 (0x0ee72000)
  	libgobject-2.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libgobject-2.0.so.0 =
(0x0edf1000)
  	libglib-2.0.so.0 =3D> /lib/powerpc-linux-gnu/libglib-2.0.so.0 (0x0eca000=
0)
  	libsnappy.so.1 =3D> /usr/lib/powerpc-linux-gnu/libsnappy.so.1 (0x0ec6f00=
0)
  	libusb-1.0.so.0 =3D> /lib/powerpc-linux-gnu/libusb-1.0.so.0 (0x0ec2e000)
  	librt.so.1 =3D> /lib/powerpc-linux-gnu/librt.so.1 (0x0ebfd000)
  	libm.so.6 =3D> /lib/powerpc-linux-gnu/libm.so.6 (0x0eb0c000)
  	libgcc_s.so.1 =3D> /lib/powerpc-linux-gnu/libgcc_s.so.1 (0x0eacb000)
  	libpthread.so.0 =3D> /lib/powerpc-linux-gnu/libpthread.so.0 (0x0ea88000)
  	libc.so.6 =3D> /lib/powerpc-linux-gnu/libc.so.6 (0x0e8d4000)
  	libdrm.so.2 =3D> /usr/lib/powerpc-linux-gnu/libdrm.so.2 (0x0e8a3000)
  	libdl.so.2 =3D> /lib/powerpc-linux-gnu/libdl.so.2 (0x0e872000)
  	libexpat.so.1 =3D> /lib/powerpc-linux-gnu/libexpat.so.1 (0x0e821000)
  	libxcb.so.1 =3D> /usr/lib/powerpc-linux-gnu/libxcb.so.1 (0x0e7e0000)
  	libidn.so.11 =3D> /lib/powerpc-linux-gnu/libidn.so.11 (0x0e77f000)
  	librtmp.so.1 =3D> /usr/lib/powerpc-linux-gnu/librtmp.so.1 (0x0e73e000)
  	libgssapi_krb5.so.2 =3D> /usr/lib/powerpc-linux-gnu/libgssapi_krb5.so.2 =
(0x0e6cd000)
  	liblber-2.4.so.2 =3D> /usr/lib/powerpc-linux-gnu/liblber-2.4.so.2 (0x0e6=
9c000)
  	libldap_r-2.4.so.2 =3D> /usr/lib/powerpc-linux-gnu/libldap_r-2.4.so.2 (0=
x0e61a000)
  	libgcrypt.so.20 =3D> /lib/powerpc-linux-gnu/libgcrypt.so.20 (0x0e527000)
  	/lib/ld.so.1 (0x200a9000)
  	libsndio.so.6.1 =3D> /usr/lib/powerpc-linux-gnu/libsndio.so.6.1 (0x0e4f4=
000)
  	libp11-kit.so.0 =3D> /usr/lib/powerpc-linux-gnu/libp11-kit.so.0 (0x0e473=
000)
  	libtasn1.so.6 =3D> /usr/lib/powerpc-linux-gnu/libtasn1.so.6 (0x0e432000)
  	libhogweed.so.4 =3D> /usr/lib/powerpc-linux-gnu/libhogweed.so.4 (0x0e3d1=
000)
  	libgmp.so.10 =3D> /usr/lib/powerpc-linux-gnu/libgmp.so.10 (0x0e330000)
  	libgmodule-2.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libgmodule-2.0.so.0 =
(0x0e2ff000)
  	libpangocairo-1.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libpangocairo-1.0=
.so.0 (0x0e2ce000)
  	libXfixes.so.3 =3D> /usr/lib/powerpc-linux-gnu/libXfixes.so.3 (0x0e29d00=
0)
  	libatk-1.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libatk-1.0.so.0 (0x0e24c=
000)
  	libgio-2.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libgio-2.0.so.0 (0x0e05a=
000)
  	libpangoft2-1.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libpangoft2-1.0.so.=
0 (0x0e019000)
  	libpango-1.0.so.0 =3D> /usr/lib/powerpc-linux-gnu/libpango-1.0.so.0 (0x0=
dfa8000)
  	libfontconfig.so.1 =3D> /usr/lib/powerpc-linux-gnu/libfontconfig.so.1 (0=
x0df33000)
  	libXrender.so.1 =3D> /usr/lib/powerpc-linux-gnu/libXrender.so.1 (0x0df02=
000)
  	libXinerama.so.1 =3D> /usr/lib/powerpc-linux-gnu/libXinerama.so.1 (0x0de=
df000)
  	libXi.so.6 =3D> /usr/lib/powerpc-linux-gnu/libXi.so.6 (0x0de9e000)
  	libXrandr.so.2 =3D> /usr/lib/powerpc-linux-gnu/libXrandr.so.2 (0x0de6d00=
0)
  	libXcursor.so.1 =3D> /usr/lib/powerpc-linux-gnu/libXcursor.so.1 (0x0de42=
000)
  	libXcomposite.so.1 =3D> /usr/lib/powerpc-linux-gnu/libXcomposite.so.1 (0=
x0de1f000)
  	libXdamage.so.1 =3D> /usr/lib/powerpc-linux-gnu/libXdamage.so.1 (0x0ddfc=
000)
  	libXext.so.6 =3D> /usr/lib/powerpc-linux-gnu/libXext.so.6 (0x0ddc8000)
  	libfreetype.so.6 =3D> /usr/lib/powerpc-linux-gnu/libfreetype.so.6 (0x0dc=
f7000)
  	libxcb-shm.so.0 =3D> /usr/lib/powerpc-linux-gnu/libxcb-shm.so.0 (0x0dcc6=
000)
  	libxcb-render.so.0 =3D> /usr/lib/powerpc-linux-gnu/libxcb-render.so.0 (0=
x0dc95000)
  	libffi.so.6 =3D> /usr/lib/powerpc-linux-gnu/libffi.so.6 (0x0dc64000)
  	libpcre.so.3 =3D> /lib/powerpc-linux-gnu/libpcre.so.3 (0x0dbd3000)
  	libstdc++.so.6 =3D> /usr/lib/powerpc-linux-gnu/libstdc++.so.6 (0x0d9df00=
0)
  	libudev.so.1 =3D> /lib/powerpc-linux-gnu/libudev.so.1 (0x0d99d000)
  	libXau.so.6 =3D> /usr/lib/powerpc-linux-gnu/libXau.so.6 (0x0d979000)
  	libXdmcp.so.6 =3D> /usr/lib/powerpc-linux-gnu/libXdmcp.so.6 (0x0d948000)
  	libkrb5.so.3 =3D> /usr/lib/powerpc-linux-gnu/libkrb5.so.3 (0x0d857000)
  	libk5crypto.so.3 =3D> /usr/lib/powerpc-linux-gnu/libk5crypto.so.3 (0x0d8=
06000)
  	libcom_err.so.2 =3D> /lib/powerpc-linux-gnu/libcom_err.so.2 (0x0d7d5000)
  	libkrb5support.so.0 =3D> /usr/lib/powerpc-linux-gnu/libkrb5support.so.0 =
(0x0d7a4000)
  	libresolv.so.2 =3D> /lib/powerpc-linux-gnu/libresolv.so.2 (0x0d761000)
  	libsasl2.so.2 =3D> /usr/lib/powerpc-linux-gnu/libsasl2.so.2 (0x0d720000)
  	libgssapi.so.3 =3D> /usr/lib/powerpc-linux-gnu/libgssapi.so.3 (0x0d6be00=
0)
  	libgpg-error.so.0 =3D> /lib/powerpc-linux-gnu/libgpg-error.so.0 (0x0d67d=
000)
  	libasound.so.2 =3D> /usr/lib/powerpc-linux-gnu/libasound.so.2 (0x0d54c00=
0)
  	libbsd.so.0 =3D> /lib/powerpc-linux-gnu/libbsd.so.0 (0x0d50b000)
  	libselinux.so.1 =3D> /lib/powerpc-linux-gnu/libselinux.so.1 (0x0d4b9000)
  	libharfbuzz.so.0 =3D> /usr/lib/powerpc-linux-gnu/libharfbuzz.so.0 (0x0d4=
08000)
  	libthai.so.0 =3D> /usr/lib/powerpc-linux-gnu/libthai.so.0 (0x0d3d7000)
  	libkeyutils.so.1 =3D> /lib/powerpc-linux-gnu/libkeyutils.so.1 (0x0d3a600=
0)
  	libheimntlm.so.0 =3D> /usr/lib/powerpc-linux-gnu/libheimntlm.so.0 (0x0d3=
75000)
  	libkrb5.so.26 =3D> /usr/lib/powerpc-linux-gnu/libkrb5.so.26 (0x0d2c3000)
  	libasn1.so.8 =3D> /usr/lib/powerpc-linux-gnu/libasn1.so.8 (0x0d201000)
  	libhcrypto.so.4 =3D> /usr/lib/powerpc-linux-gnu/libhcrypto.so.4 (0x0d19f=
000)
  	libroken.so.18 =3D> /usr/lib/powerpc-linux-gnu/libroken.so.18 (0x0d15e00=
0)
  	libgraphite2.so.3 =3D> /usr/lib/powerpc-linux-gnu/libgraphite2.so.3 (0x0=
d10d000)
  	libdatrie.so.1 =3D> /usr/lib/powerpc-linux-gnu/libdatrie.so.1 (0x0d0dc00=
0)
  	libwind.so.0 =3D> /usr/lib/powerpc-linux-gnu/libwind.so.0 (0x0d08b000)
  	libheimbase.so.1 =3D> /usr/lib/powerpc-linux-gnu/libheimbase.so.1 (0x0d0=
5a000)
  	libhx509.so.5 =3D> /usr/lib/powerpc-linux-gnu/libhx509.so.5 (0x0cfe8000)
  	libsqlite3.so.0 =3D> /usr/lib/powerpc-linux-gnu/libsqlite3.so.0 (0x0ceb6=
000)
  	libcrypt.so.1 =3D> /lib/powerpc-linux-gnu/libcrypt.so.1 (0x0ce5e000)

 =20
  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1603636/+subscriptions


