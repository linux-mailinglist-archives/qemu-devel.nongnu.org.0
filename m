Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AA3BC599
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:36:12 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cod-0007TN-63
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfM-0008QB-UK
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:51454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfL-0003CS-8U
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cf7-0004xe-LJ
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A055A2E8224
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:50 -0000
From: Launchpad Bug Tracker <1882241@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i82551
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor stefanha th-huth tim-tree-of-life
X-Launchpad-Bug-Reporter: timsoft (tim-tree-of-life)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159136023930.32294.17616621945608188739.malonedeb@gac.canonical.com>
Message-Id: <162554507046.7821.4786949561937916484.malone@loganberry.canonical.com>
Subject: [Bug 1882241] Re: file transfer over cifs to 64bit guest corrupts
 large files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 56151f173820bf0ca875505b19ef0bdb955e6092
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
Reply-To: Bug 1882241 <1882241@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882241

Title:
  file transfer over cifs to 64bit guest corrupts large files

Status in QEMU:
  Expired

Bug description:
  qemu 4.0 compiled fom source.
  vm called by
  qemu-system-x86_64 -cpu qemu64 -smp 4 -m 4G -drive file=3D/data/images/sl=
ack14.2_64bit_test.qcow2,format=3Dqcow2 -cdrom /mnt/smb1/slackware/iso/slac=
kware64-14.2-install-dvd.iso -boot c -net nic,macaddr=3D02:00:00:11:11:17,m=
odel=3Di82551 -net bridge,br=3Dbr0 -enable-kvm -k en-gb -display vnc=3D:3 -=
monitor telnet:localhost:7103,server,nowait,nodelay

  copying large files eg 2.4gb or reading them on a cifs mount in the guest=
 causes corruption every time. For smaller files 40-60mb corruption is more=
 than 50% of the time. tested by md5sum on cifs server, or on host machine =
vs. on guest vm.
  corruption is seen only with 64bit guest using cifs with i82551 emulated =
network device
  ie. 32bit guest using cifs with i82551 emulated network device gives no c=
orruption.

  changing the emulated device to vmxnet3 removes the data corruption
  (see below)

  qemu-system-x86_64 -cpu qemu64 -smp 4 -m 4G -drive
  file=3D/data/images/slack14.2_64bit_test.qcow2,format=3Dqcow2 -cdrom
  /mnt/smb1/slackware/iso/slackware64-14.2-install-dvd.iso -boot c -net
  nic,macaddr=3D02:00:00:11:11:17,model=3Dvmxnet3 -net bridge,br=3Dbr0
  -enable-kvm -k en-gb -display vnc=3D:3 -monitor
  telnet:localhost:7103,server,nowait,nodelay

  this corruption is repeatable. ie. I created new vm, call using top examp=
le, installed 64bit linux, mounted cifs share and copied 2.4gb file to /tmp=
 then run md5sum "filecopied"
  the md5sum is different every time. copy same file to the host, or to a 3=
2bit guest with the same virtual network device and bridge and md5sums are =
correct. The host pysical network adapter is
  lspci|grep Ether
  1e:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168=
/8411 PCI Express Gigabit Ethernet Controller (rev 11)

  physically connected via gigabit ethernet to cifs server (via gigabit
  switch)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882241/+subscriptions

