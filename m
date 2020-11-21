Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0832BBFE1
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:25:05 +0100 (CET)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTp2-0006sz-Tr
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTkr-0003VX-4S
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:20:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:55700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTkm-0002wE-AS
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:20:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgTkj-0003kt-L0
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9D6D82E813E
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:14:36 -0000
From: Thomas Huth <1756728@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aarno th-huth
X-Launchpad-Bug-Reporter: Alexandre ARNOUD (aarno)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152140081522.14638.12473231561144635050.malonedeb@chaenomeles.canonical.com>
Message-Id: <160596807650.16548.8205547687592957684.malone@chaenomeles.canonical.com>
Subject: [Bug 1756728] Re: virtio-scsi virtio-scsi-single and virtio-blk on
 raw image, games are not starting
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: c2f1258f71d0838e538efc1e30fc7323614710c3
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
Reply-To: Bug 1756728 <1756728@bugs.launchpad.net>
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
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1756728

Title:
  virtio-scsi virtio-scsi-single and virtio-blk on raw image, games are
  not starting

Status in QEMU:
  Incomplete

Bug description:
  Using virtio-scsi / vitro-scsi-single or vitro-blk on a ZFS/raw image,
  most Assassin's Creed (Origin especially) games are not starting
  (uPlay), it seems related to some check or commands applications are
  doing on the disk drive that fails to respond.

  Workaround has been found by creating a VHD volume, mounting it and
  installing games on it.

  On a side note, application like HDDScan, CrystalDiskInfo returns
  nothing regarding disk drives.

  Guest:
  Windows 10 (build 1709)

  Host:
  $ kvm --version
  QEMU emulator version 2.9.1 pve-qemu-kvm_2.9.1-9
  $ uname -a
  Linux xxxx 4.13.13-5-pve #1 SMP PVE 4.13.13-36 (Mon, 15 Jan 2018 12:36:49=
 +0100) x86_64 GNU/Linux

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1756728/+subscriptions

