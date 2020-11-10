Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C32ADDFF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:16:53 +0100 (CET)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcYCK-0005u7-UX
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcY6y-0001NU-Ov
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:11:22 -0500
Received: from indium.canonical.com ([91.189.90.7]:45726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcY6s-0004Y2-S1
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:11:20 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcY6n-0002AG-8j
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:11:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3AEC52E8132
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:11:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 18:02:10 -0000
From: Thomas Huth <1738507@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth webczat-200-deactivatedaccount
X-Launchpad-Bug-Reporter: webczat (webczat-200-deactivatedaccount)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151338646328.26229.15531211351993382335.malonedeb@wampee.canonical.com>
Message-Id: <160503133023.28244.13941610311714778517.malone@chaenomeles.canonical.com>
Subject: [Bug 1738507] Re: qemu sometimes stuck when booting windows 10
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 223995835d0da52b04f0c6422952f31d0b897393
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
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
Reply-To: Bug 1738507 <1738507@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1738507

Title:
  qemu sometimes stuck when booting windows 10

Status in QEMU:
  Incomplete

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

