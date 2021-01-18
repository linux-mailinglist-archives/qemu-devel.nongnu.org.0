Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A22F98AE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 05:33:40 +0100 (CET)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1MEV-0000XZ-Sb
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 23:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1MC0-0007Oq-7Y
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 23:31:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:51380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1MBy-00064p-Jd
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 23:31:04 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1MBx-0003mv-DV
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:31:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5234B2E8145
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:31:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jan 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1565395@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor john-frankish th-huth
X-Launchpad-Bug-Reporter: John Frankish (john-frankish)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160403045416.18318.45266.malonedeb@chaenomeles.canonical.com>
Message-Id: <161094343663.15998.12830631611626011599.malone@loganberry.canonical.com>
Subject: [Bug 1565395] Re: qemu-2.4.1 fails when compiled against pulseaudio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 467bb8b326617e701f1107445befef7644934b9b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1565395

Title:
  qemu-2.4.1 fails when compiled against pulseaudio

Status in QEMU:
  Expired

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

