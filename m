Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAB2FB28F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:14:07 +0100 (CET)
Received: from localhost ([::1]:34374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1lDK-000734-LQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1lAW-0005iH-00
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:11:12 -0500
Received: from indium.canonical.com ([91.189.90.7]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1lAS-0004in-JM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:11:11 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1lAQ-0007xS-Hs
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 861EB2E8138
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 06:56:29 -0000
From: Thomas Huth <1811862@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: abbbi th-huth
X-Launchpad-Bug-Reporter: Michael Ablassmeier (abbbi)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154756723569.32460.9318945599039422988.malonedeb@wampee.canonical.com>
Message-Id: <161103938923.12323.8513540185185697625.malone@gac.canonical.com>
Subject: [Bug 1811862] Re: microcode version stays 0x1 even if -cpu host is
 used
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 6deaec124d3fda33180b2f4b73939d75f4609558
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
Reply-To: Bug 1811862 <1811862@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1811862

Title:
  microcode version stays 0x1 even if -cpu host is used

Status in QEMU:
  Incomplete

Bug description:
  The microcode version of my host cpu has the following version:

  grep microcode /proc/cpuinfo | head -1
  microcode       : 0x3d

  while trying to run ESXi in an nested VM, the boot bailed out with
  error message that at least microcode version 0x19 is needed. It =

  seems they have introduced such a check on certain CPU types.

  The VM in question is using the "host-passthrough" option in libvirt
  and the qemu command line reads as this:

  21172 ?        Sl     0:09 /usr/libexec/qemu-kvm -name guest=3Dhpe-env-
  client1,debug-threads=3Don -S -object
  secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-33
  -hpe-env-client1/master-key.aes -machine pc-i440fx-
  rhel7.6.0,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -cpu host <rest
  stripped>

  Running a regular Linux VM with `host-passthrough` shows that the
  microcode version is still reported as 0x1.

  Within the VM:

  [root@hpe-env-client1 ~]# cat /proc/cpuinfo =

  processor       : 0
  vendor_id       : GenuineIntel
  cpu family      : 6
  model           : 63
  model name      : Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz
  stepping        : 2
  microcode       : 0x1
  cpu MHz         : 2397.222

  =

  My impression is qemu should copy the hosts microcode version in this cas=
e?

  Running Qemu von RHEl8 beta here.

  [root@3parserver ~]# /usr/libexec/qemu-kvm --version
  QEMU emulator version 2.12.0 (qemu-kvm-2.12.0-41.el8+2104+3e32e6f8)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811862/+subscriptions

