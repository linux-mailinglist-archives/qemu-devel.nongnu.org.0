Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C437F79C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:13:48 +0200 (CEST)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhADr-0006AN-TT
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhA6f-0000D4-5y
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:06:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhA6Z-0001sB-R3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:06:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhA6Y-000468-C7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:06:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 519F02E8060
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:06:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:00:05 -0000
From: Thomas Huth <1916775@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: whpx windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: abdurrahim-cakar ivanvx th-huth
X-Launchpad-Bug-Reporter: Abdurrahim (abdurrahim-cakar)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161418362907.7833.18159388399676261767.malonedeb@soybean.canonical.com>
Message-Id: <162090720553.17105.15465371324007992459.malone@soybean.canonical.com>
Subject: [Bug 1916775] Re: Guest freezes until there is a keyboard input on
 Windows version
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 1f658a9b2afac08290154531982693561bd4e3ba
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
Reply-To: Bug 1916775 <1916775@bugs.launchpad.net>
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

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916775

Title:
  Guest freezes until there is a keyboard input on Windows version

Status in QEMU:
  Incomplete

Bug description:
  I am using Qemu for Windows and when I try to run this for Windows
  guests then the guests are freezing and waiting for keyboard input and
  it continues to function after I press a key. I am using Windows10
  Home and below is the command I use to run the guest. I have suspected
  if this is caused by random entropy but even with mouse moving it
  gives same random locks and it continues to work as soon as I press a
  key so maybe its not about entropy at all,

  startwinguest.bat:
  qemu-system-x86_64 ^
  =C2=A0-name "win" ^
  =C2=A0-machine type=3Dq35,accel=3Dwhpx ^
  =C2=A0-cpu EPYC,hv_relaxed,hv_time,topoext   ^
  =C2=A0-nodefaults ^
  =C2=A0-usb ^
  =C2=A0-rtc base=3Dlocaltime,driftfix=3Dslew ^
  =C2=A0-smp 6,sockets=3D1,cores=3D3,threads=3D2 ^
  =C2=A0-m 8192 -mem-prealloc ^
  =C2=A0-soundhw hda ^
  =C2=A0-usbdevice tablet ^
  =C2=A0-netdev user,id=3Dmynet0,hostfwd=3Dtcp::3390-:3389 -device virtio-n=
et,netdev=3Dmynet0 ^
  =C2=A0-vga std ^
  =C2=A0-display gtk ^
  =C2=A0-boot d ^
  =C2=A0-device virtio-scsi-pci,id=3Dscsi0 ^
  =C2=A0-drive "file=3D%~dp0win10.qcow2,if=3Dnone,format=3Dqcow2,discard=3D=
unmap,aio=3Dthreads,cache=3Dwritethrough,id=3Dsomeid" ^
  =C2=A0-device scsi-hd,drive=3Dsomeid,bus=3Dscsi0.0 ^
  =C2=A0-drive "file=3DD:\Setups\OS\Windows\en_windows_server_2019_updated_=
dec_2020_x64_dvd_36e0f791.iso,media=3Dcdrom,index=3D1" ^
  =C2=A0-drive "file=3D%~dp0virtio-win-0.1.185.iso,media=3Dcdrom,index=3D2"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916775/+subscriptions

