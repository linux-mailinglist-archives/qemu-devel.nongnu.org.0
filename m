Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E765D377002
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:15:41 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGFY-0004Po-Tl
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGAs-0008JX-FS
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:10:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:54164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGAq-0001BY-M9
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:10:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGAp-0006vk-F5
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:10:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D4762E800F
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:10:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:02:20 -0000
From: Thomas Huth <1892541@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: whpx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luoyonggang th-huth
X-Launchpad-Bug-Reporter: Yonggang Luo (luoyonggang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159803784913.1330.10602234543815325007.malonedeb@wampee.canonical.com>
Message-Id: <162045374070.6114.12664082699570877107.malone@gac.canonical.com>
Subject: [Bug 1892541] Re: qemu 5.1 on windows 10 with whpx can not install
 Windows 7 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: fe6ca811a9e3fc149ce76cd73917b8e485dbfee2
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
Reply-To: Bug 1892541 <1892541@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: whpx

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892541

Title:
  qemu 5.1 on windows 10 with whpx can not install Windows 7 guest

Status in QEMU:
  Incomplete

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

