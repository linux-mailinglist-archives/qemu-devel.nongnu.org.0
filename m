Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B6C2B066B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:27:12 +0100 (CET)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCd5-0001dG-Jf
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCbE-0000i1-Uj
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:25:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:42032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCbD-00022E-1C
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:25:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdCbB-000773-P0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:25:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B75782E805D
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:25:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 13:12:10 -0000
From: Thomas Huth <1626596@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rm th-huth
X-Launchpad-Bug-Reporter: rm (rm)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160922144807.17427.95239.malonedeb@wampee.canonical.com>
Message-Id: <160518673044.28685.9751325605920202665.malone@chaenomeles.canonical.com>
Subject: [Bug 1626596] Re: Lockup with vhost network
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 50aadd03d1bc5071219d4fce0dbc9ccd520c837a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
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
Reply-To: Bug 1626596 <1626596@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1626596

Title:
  Lockup with vhost network

Status in QEMU:
  Incomplete

Bug description:
  After using Qemu in this configuration successfully for quite a while, I =
changed two things:
  - moved the VM from a 8-core 4GHz host to a slower 2-core 1.6 Ghz machine
  - upgraded qemu from 2.1 to 2.5

  and almost immediately (in a couple hours) got hit with a vhost-
  related lockup.

  QEMU command line is:

  qemu-system-x86_64 -enable-kvm -daemonize -monitor
  unix:./monitor,server,nowait -cpu host -M q35 -balloon virtio -device
  virtio-scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd -drive
  if=3Dnone,id=3Dhd,cache=3Dwriteback,aio=3Dnative,format=3Draw,file=3Dxxxx=
.img,discard=3Dunmap
  ,detect-zeroes=3Dunmap -device virtio-net-pci,netdev=3Dnet0,mac=3Dxxxx
  -netdev tap,vhost=3Don,id=3Dnet0,script=3Dxxxx.sh -usbdevice tablet -smp 2
  -m 512 -vnc xxxx:yz

  VM was running fine, except no network traffic was passed from/to it.
  Shutting down the VM, it hung at "Will now halt." The QEMU process was
  unkillable, so the only choice was to sysrq-b the entire box.

  dmesg with sysrq-w attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1626596/+subscriptions

