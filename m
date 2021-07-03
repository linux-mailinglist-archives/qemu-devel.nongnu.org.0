Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512B3BA732
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 06:31:15 +0200 (CEST)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzXJB-0003JX-UV
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 00:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzXHU-0001Ia-MS
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 00:29:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:37062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzXHO-0008Sz-J5
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 00:29:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzXHL-0006PX-Oi
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 04:29:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A667A2E817D
 for <qemu-devel@nongnu.org>; Sat,  3 Jul 2021 04:29:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1342686@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glizda janitor th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Piotr_Gli=C5=BAniewicz_=28glizda=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20140716121553.1821.18365.malonedeb@gac.canonical.com>
Message-Id: <162528584269.29798.8392866603923647304.malone@loganberry.canonical.com>
Subject: [Bug 1342686] Re: Windows 95 setup hangs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 30334bb8596fcf65236d9c52510a8790b728d04a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1342686

Title:
  Windows 95 setup hangs

Status in QEMU:
  Expired

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

