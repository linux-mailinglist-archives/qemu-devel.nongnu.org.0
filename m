Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E472F051C
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:33:45 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySQC-0001WL-GJ
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIl-0007ml-Q9
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIj-0000gY-Ai
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIh-0000ME-D6
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4B6822E8144
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:47 -0000
From: Launchpad Bug Tracker <1738507@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth webczat-200-deactivatedaccount
X-Launchpad-Bug-Reporter: webczat (webczat-200-deactivatedaccount)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151338646328.26229.15531211351993382335.malonedeb@wampee.canonical.com>
Message-Id: <161025226719.18863.213174148871972564.malone@loganberry.canonical.com>
Subject: [Bug 1738507] Re: qemu sometimes stuck when booting windows 10
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 3c650d1194630618ba7cf1e9d1d72c07561a9e3f
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
Reply-To: Bug 1738507 <1738507@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1738507

Title:
  qemu sometimes stuck when booting windows 10

Status in QEMU:
  Expired

Bug description:
  I am using qemu-2.10.1, or actually libvirt, to create a virtual machine,=
 running microsoft windows 10 pro operating system.
  It installed fine and was actually working, however sometimes when trying=
 to boot the vm, the whole boot process gets stuck.
  For some reason, it seemed to happen only when enough physical memory is =
taken so that, when booting a windows vm that has 4gb of available ram, hos=
t starts swapping some other processes. It is not always happening there, b=
ut often it happens, and I do not remember seeing any case of this happenin=
g when not swapping, maybe a kind of a timing issue?
  When this happens, I usually try to hard reset the machine by libvirt res=
et command or equivalent system_reset on qemu monitor, however the whole re=
set does not happen, and the command is a noop. That makes me think it is a=
 qemu bug, not windows refusing operation. At the time of this event, qemu =
monitor and spice server are working correctly, are not stuck, and even doi=
ng things like system reset does not result in a monitor hang. It is also p=
ossible to quit qemu normally.
  I tried to workaround the bug by guessing what may cause it. Switched fro=
m bios to uefi, changed virtio-scsi to ahci temporarily, and disabled virti=
o-balloon in case it would be buggy, with no visible change.
  I will attach a libvirt log, because it contains qemu command line. I wil=
l also attach an example qemu backtrace.
  From what i know, both vcpu threads are working normally, at least none o=
f them is stuck in a vcpu, nor deadlocked, etc. So backtrace could be diffe=
rent each time I tried to get it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1738507/+subscriptions

