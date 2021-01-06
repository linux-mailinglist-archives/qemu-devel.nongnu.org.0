Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC62EC67E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 00:03:32 +0100 (CET)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxHpz-0007NF-5T
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 18:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxHnP-00060V-GW
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 18:00:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:57728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxHnN-0008NA-5k
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 18:00:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxHnL-0005Pj-AP
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 23:00:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 222522E813A
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 23:00:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 Jan 2021 22:50:44 -0000
From: Snoobz <1909921@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm linux-user vcpu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pmaydell snoobz
X-Launchpad-Bug-Reporter: Snoobz (snoobz)
X-Launchpad-Bug-Modifier: Snoobz (snoobz)
References: <160969474752.18413.12452840655391947769.malonedeb@gac.canonical.com>
Message-Id: <160997344464.6851.5349844938735741850.malone@wampee.canonical.com>
Subject: [Bug 1909921] Re: Raspberry Pi 4 qemu:handle_cpu_signal received
 signal outside vCPU context @ pc=0xffff87709b0e
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: e1ef43950c14682d01962fa41a84904d833d6ebc
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
Reply-To: Bug 1909921 <1909921@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

If I do as mentionned this command: qemu-i386 -d unimp ./ts3server

I get this output :

2021-01-06 22:45:26.201997|INFO    |ServerLibPriv |   |TeamSpeak 3 Server 3=
.13.3 (2020-12-16 14:17:05)
2021-01-06 22:45:26.225836|INFO    |ServerLibPriv |   |SystemInformation: L=
inux 4.18.0-193.28.1.el7.aarch64 #1 SMP Wed Oct 21 16:25:35 UTC 2020 i686 B=
inary: 32bit
2021-01-06 22:45:26.227507|WARNING |ServerLibPriv |   |The system locale is=
 set to "C" this can cause unexpected behavior. We advice you to repair you=
r locale!
qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0xffff81=
b99b0e
Trace/breakpoint trap (core dumped)


(Forget about the system local WARNING.)

I attached the generated core dumps, if that helps. I don't have other
logs to add.

Thank you for your help!

Regards,


** Attachment added: "core.316"
   https://bugs.launchpad.net/qemu/+bug/1909921/+attachment/5449850/+files/=
core.316

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909921

Title:
   Raspberry Pi 4 qemu:handle_cpu_signal received signal outside vCPU
  context @ pc=3D0xffff87709b0e

Status in QEMU:
  New

Bug description:
  Hello,

  I have a Raspberry Pi 4 with an ESXi hypervisor installed on it (ESXi ARM=
 Edition).
  I created a CentOS 7 VM on it and I'm using a Docker container which is r=
unning qemu inside it.

  This container is a Debian Bullseye OS and I'm using qemu-i386 to start m=
y application inside it.
  The error given by qemu is the following :

  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0xffff=
9d5f9b0e
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0xffff=
82f29b0e

  (The pc=3D value is always different, I guess it is randomly generated).

  My qemu version is : qemu-i386 version 5.1.0 (Debian 1:5.1+dfsg-4+b1)

  Could you please help me? Why am I facing this error?

  Feel free to ask any questions regarding this matter in order to find
  a solution to it!

  Regards

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909921/+subscriptions

