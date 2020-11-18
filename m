Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6A2B7B63
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:36:15 +0100 (CET)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKow-00046S-3u
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKil-0003vL-Hc
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:29:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKij-0005Fr-6l
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:29:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfKif-0000cE-Lb
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:29:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9624E2E812F
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:29:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 10:16:50 -0000
From: Thomas Huth <1565395@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: john-frankish th-huth
X-Launchpad-Bug-Reporter: John Frankish (john-frankish)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160403045416.18318.45266.malonedeb@chaenomeles.canonical.com>
Message-Id: <160569461020.15316.6642405156913589794.malone@soybean.canonical.com>
Subject: [Bug 1565395] Re: qemu-2.4.1 fails when compiled against pulseaudio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: d742ed31ab754c2575c24bb159913b69543b9cb1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 04:01:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1565395 <1565395@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1565395

Title:
  qemu-2.4.1 fails when compiled against pulseaudio

Status in QEMU:
  Incomplete

Bug description:
  If I compile qemu-2.4.1 like this:

  CC=3D"gcc -mtune=3Dgeneric -Os -pipe" CXX=3D"g++ -mtune=3Dgeneric -Os -pi=
pe
  -fno-exceptions -fno-rtti" ./configure --prefix=3D/usr/local
  --localstatedir=3D/var --libexecdir=3D/usr/local/lib/qemu
  --interp-prefix=3D/usr/local/share/qemu --disable-smartcard-nss
  --disable-curses --disable-brlapi --audio-drv-list=3D"oss alsa sdl"
  --target-list=3D"i386-softmmu i386-linux-user x86_64-softmmu
  x86_64-linux-user" --smbd=3D/usr/local/sbin/smbd

  find . -name config-host.mak -type f -exec sed -i 's/-O2//g' {} \;

  make

  ..it works fine.

  If I add pulseaudio dev files and use --audio-drv-list=3D"oss alsa sdl pa=
",
  then "qemu-system-x86_64 -blah-blah" opens a window, displays the bios
  message and stops. Strace shows qemu is not hung, but loops continually.

  The same happens with qemu-2.2.1 and qemu-2.5.0.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1565395/+subscriptions

