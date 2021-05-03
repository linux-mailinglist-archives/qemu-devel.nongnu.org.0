Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06C371926
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:21:15 +0200 (CEST)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbJq-0007Hx-Kf
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbId-00069H-Cj
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:19:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:59850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbIa-0004ks-TA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:19:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbIX-0001tU-3Z
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:19:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0C51F2E80F3
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:19:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:10:05 -0000
From: Thomas Huth <1342686@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glizda th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Piotr_Gli=C5=BAniewicz_=28glizda=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140716121553.1821.18365.malonedeb@gac.canonical.com>
Message-Id: <162005820581.10248.16948579646123183230.malone@gac.canonical.com>
Subject: [Bug 1342686] Re: Windows 95 setup hangs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 49eebc965736d13a553032c4f5685219e7baa985
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1342686 <1342686@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: Triaged =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1342686

Title:
  Windows 95 setup hangs

Status in QEMU:
  Incomplete

Bug description:
  Windows 95 (first version, not 95A or OSR2) setup hangs on QEMU version 2=
.0.0. It was compiled from the sources on Fedora 20. =

  Setup starts without problems, it goes through the first phase and then h=
angs on the "Getting ready to run Windows 95 for the first time..." screen =
(http://www.guidebookgallery.org/screenshots/win95#win95startupshutdownspla=
sh1correctaspect).

  Steps to reproduce:
  qemu-img create -f qcow2 win95.img 2G
  qemu -L . -machine isapc -cpu pentium -m 32 -vga std -soundhw sb16 -hda w=
in95.img -cdrom POLWIN95.ISO -fda BOOT95A.IMA -boot a
  after this select default options everywhere. When it asks to remove the =
boot floppy do "eject floppy0" and confirm.
  It displays the "Getting ready to run Windows 95 for the first time..." a=
nd hangs.

  The same behavior can be observed on 2.1.0-rc2. On 1.7.1 It hangs
  immediately after this screen, it hangs on displaying a underscore
  cursor.

  I managed to complete the setup on QEMU 1.6.2.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1342686/+subscriptions

