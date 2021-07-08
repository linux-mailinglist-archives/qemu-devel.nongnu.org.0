Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFA3BF4CD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:32:54 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LiX-0007lv-D4
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbt-0005XG-KG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:26:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:58042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbr-0003KD-Vz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:26:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1Lbn-0000mn-Q5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6CD1F2E80EA
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1892541@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: whpx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor luoyonggang th-huth
X-Launchpad-Bug-Reporter: Yonggang Luo (luoyonggang)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159803784913.1330.10602234543815325007.malonedeb@wampee.canonical.com>
Message-Id: <162571784137.7916.12679353151630001302.malone@loganberry.canonical.com>
Subject: [Bug 1892541] Re: qemu 5.1 on windows 10 with whpx can not install
 Windows 7 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 74eba8131c715b8b7291952af75837b8bfdf8e24
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
Reply-To: Bug 1892541 <1892541@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892541

Title:
  qemu 5.1 on windows 10 with whpx can not install Windows 7 guest

Status in QEMU:
  Expired

Bug description:
  Command install and start win7

  qemu-system-x86_64  -smbios type=3D1,uuid=3De77aacd6-0acb-4a5c-9a83-a80d0=
29b36f1 -smp 2,sockets=3D1,cores=3D2,maxcpus=3D2 -nodefaults -boot menu=3Do=
n,strict=3Don,reboot-timeout=3D1000 -m 8192 ^
  -readconfig pve-q35-4.0.cfg ^
  -device vmgenid,guid=3D6d4865f5-353e-4cf1-b8ca-f5abbd062736 -device usb-t=
ablet,id=3Dtablet,bus=3Dehci.0,port=3D1 -device VGA,id=3Dvga,bus=3Dpcie.0,a=
ddr=3D0x1 ^
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x3 ^
  -drive file=3Den_windows_7_ultimate_with_sp1_x64_dvd_u_677332.iso,if=3Dno=
ne,id=3Ddrive-ide2,media=3Dcdrom,aio=3Dthreads ^
  -device ide-cd,bus=3Dide.1,unit=3D0,drive=3Ddrive-ide2,id=3Dide2,bootinde=
x=3D200 -device ahci,id=3Dahci0,multifunction=3Don,bus=3Dpci.0,addr=3D0x7 ^
  -drive id=3Ddrive-sata0,if=3Dnone,file=3Dwin7.qcow2,format=3Dqcow2,cache=
=3Dnone,aio=3Dnative,detect-zeroes=3Don ^
  -device ide-hd,bus=3Dahci0.0,drive=3Ddrive-sata0,id=3Dsata0,bootindex=3D1=
00 ^
  -netdev type=3Dtap,id=3Dmynet0,ifname=3Dtap1,script=3Dno,downscript=3Dno ^
  -device e1000,netdev=3Dmynet0,mac=3D52:55:00:d1:55:10,bus=3Dpci.0,addr=3D=
0x12,id=3Dnet0,bootindex=3D300 ^
  -machine type=3Dq35,accel=3Dwhpx

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892541/+subscriptions

