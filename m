Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7F2F2721
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:36:22 +0100 (CET)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBPp-0003jL-AO
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBJf-000605-8O
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:29:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:52890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBJd-0002Ki-AW
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:29:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBJc-00057C-1K
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:29:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 087F92E8139
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:29:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:22 -0000
From: Launchpad Bug Tracker <670769@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agraf alex14641 janitor th-huth
X-Launchpad-Bug-Reporter: Alex Davis (alex14641)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20101104050832.8354.57127.malonedeb@potassium.ubuntu.com>
Message-Id: <161042504230.10246.967350085460881089.malone@loganberry.canonical.com>
Subject: [Bug 670769] Re: CDROM size not updated when changing image files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: caddecd5d76975b048ebc16c72c6ac2cf47ecd8e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 670769 <670769@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/670769

Title:
  CDROM size not updated when changing image files

Status in QEMU:
  Expired

Bug description:
  I'm using qemu 13.0 with a plain Linux kernel using the ata_piix driver a=
s the guest, and an initrd that starts a shell. When changing the image in =
the monitor and reading from the CDROM in the guest, the size is not update=
d. I'm using LInux 2.6.32.24
  as the host and I've tested 2.6.32.24, 2.6.35, and 2.6.36 as guests.  Bot=
h host and guest are 64-bit. Here is the command used to start the guest us=
ing the initrd:

  ./x86_64-softmmu/qemu-system-x86_64 -cdrom /spare2/cd1.img -kernel
  /sources/linux-2.6.32.24-test/arch/x86/boot/bzImage -initrd
  /spare2/initrd.img -append 'root=3D/dev/ram0 rw' -cpu core2duo

  Additional info on this bug can be found here: http://marc.info/?l=3Dkvm&=
m=3D128746013906820&w=3D2. Note: this is how I discovered =

  the bug, using 32-bit Slackware install CDs.

  I'm attaching the initrd I used in my tests: I created two different-size=
d fake CDROM images by dd'ing from /dev/zero. In my tests,
  cd1.img is smaller that cd2.img. In the monitor I executed 'change ide1-c=
d0 /spare2/cd2.img' to load the new image. I checked =

  the size by cat'ing /sys/block/sr0/size in the guest after reading the CD=
ROM. Reading the CDROM was done by typing
  'dd if=3D/dev/sr0 of=3D/dev/null bs=3D512 count=3D3'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/670769/+subscriptions

