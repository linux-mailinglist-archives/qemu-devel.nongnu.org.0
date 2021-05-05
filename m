Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0D3736BD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:06:56 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDUd-0005eo-8Z
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOu-0000ko-QB
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:48484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOr-0000LJ-UW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:01:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leDOq-0008Q6-NX
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AFC412E813A
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 09:00:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:51:31 -0000
From: Thomas Huth <1798451@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mhaggard romell roolebo th-huth
X-Launchpad-Bug-Reporter: Rob Maskell (romell)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153980387714.3465.12419240219281347614.malonedeb@soybean.canonical.com>
Message-Id: <162020469164.917.17832169822132274542.malone@chaenomeles.canonical.com>
Subject: [Bug 1798451] Re: MMX emulation is missing on HVF Acceleration
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7bd5525c12a1d601a89cb7f7c823521e4886f381
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
Reply-To: Bug 1798451 <1798451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/155


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #155
   https://gitlab.com/qemu-project/qemu/-/issues/155

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1798451

Title:
  MMX emulation is missing on HVF Acceleration

Status in QEMU:
  Expired

Bug description:
  Robs-MacBook-Pro-2:~ robmaskell$ qemu-system-x86_64 --version
  QEMU emulator version 3.0.0

  Host: MacOS - 10.13.6
    Model Name:	MacBook Pro
    Model Identifier:	MacBookPro14,3
    Processor Name:	Intel Core i7
    Processor Speed:	2.8 GHz
    Number of Processors:	1
    Total Number of Cores:	4
    L2 Cache (per Core):	256 KB
    L3 Cache:	6 MB
    Memory:	16 GB

  Guest OS: Elementary Linux Loki 0.4.1, patched up to date

  Command used to start QEMU:

  qemu-system-x86_64 \
    -name ElementaryLokiDev \
    -machine pc,accel=3Dhvf \
    -cpu max \
    -smp cpus=3D2,sockets=3D2,cores=3D1,threads=3D1,maxcpus=3D2 \
    -numa node,nodeid=3D0 \
    -numa cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D0,socket-id=3D1=
 \
    -m 8G \
    -vga vmware \
    -hda e4.qcow2

  Symptoms: Started without the -smp / -numa commands to install the OS,
  then added -smp / -numa and the machine boots and lscpu reports extra
  cpu as expected. Restart VM and it hangs on startup. Remove -smp /
  -numa and machine starts again.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1798451/+subscriptions

