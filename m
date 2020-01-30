Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA114D776
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 09:26:38 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix59p-0003F6-Lb
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 03:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ix58z-0002XO-Cp
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ix58y-00070p-5d
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:25:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:55394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ix58y-00070W-0h
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:25:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ix58w-0005Pc-C3
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 08:25:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5652B2E80C0
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 08:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jan 2020 08:18:06 -0000
From: Thomas Huth <1860920@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: jgkammerer
X-Launchpad-Bug-Reporter: Jean-Gabriel Kammerer (jgkammerer)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158005183659.18916.14986952783973408797.malonedeb@gac.canonical.com>
Message-Id: <158037228723.18764.4489127563146894619.launchpad@gac.canonical.com>
Subject: [Bug 1860920] Re: qemu-s390x-softmmu: crash 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 13e7351d6bec24eb183b10d6cacc69866ed4256a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1860920 <1860920@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Information type changed from Private Security to Public Security

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860920

Title:
  qemu-s390x-softmmu: crash

Status in QEMU:
  New

Bug description:
  Trying to compile and use rust programs on an s390x emulated machine,
  crash in qemu/target/s390x/translate.c line 3894

  Steps to reproduce:
  on a amd64 PC, installed debian on s390x emulated by qemu, seems to work =
fine (installed some packages, etc.)
  installed rust cargo (either from rustup or from debian)
  cargo install anything makes *qemu* crash when beginning to compile

  Technical details:
  * host: amd64 Linux
  * qemu v4.2.0 (recompiled from git with debug options using configure --t=
arget-list=3Ds390x-softmmu --enable-debug) (problem appears also with older=
 versions of qemu from git, with default compilation options, with qemu fro=
m debian, etc.)
  * compiled with gcc 9.2
  * command line, relevant part: qemu-system-s390x -snapshot -machine s390-=
ccw-virtio -cpu max,zpci=3Don -serial mon:stdio -display none -m 512
  (tested with -smp 4  -m 4096 as well and without snapshotting)
  * command line, less relevant part: -drive file=3D./debian.qcow2,if=3Dnon=
e,id=3Ddrive-virtio-disk0,format=3Dqcow2,cache=3Dnone    -device virtio-blk=
-ccw,devno=3Dfe.0.0001,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,bootind=
ex=3D1,scsi=3Doff    -netdev user,id=3Dmynet0,hostfwd=3Dtcp::2223-:22 -devi=
ce virtio-net-pci,netdev=3Dmynet0
  * core dump: abort in qemu/target/s390x/translate.c line 3894 ; s->field:=
 op has value 0xEC and op2 has value 0x54
  (more info available if needed)

  Tried to patch source to add 0x54 case to no avail.
  Tried other cpu variants to no avail as well.

  Reporting this in security as well since it also looks very much like
  a DoS (albeit somewhat minor), feel free to tell me to report the bug
  somewhere else.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860920/+subscriptions

