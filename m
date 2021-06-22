Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA843AFC4A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:58:50 +0200 (CEST)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYUr-0000vb-B7
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzs-00081L-1T
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:57446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzp-0005Ke-VC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzc-00013W-Cb
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3FDBA2E81DE
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:02 -0000
From: Launchpad Bug Tracker <1830031@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dancasali janitor th-huth
X-Launchpad-Bug-Reporter: Daniel Casali (dancasali)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155852860688.21087.13471720086898885960.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433548273.20423.13555513431637957199.malone@loganberry.canonical.com>
Subject: [Bug 1830031] Re: fatal error: float32nan on QEmu 3.1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 6ca6f5203c3ff4cb73ee3f170ee00154a737123c
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
Reply-To: Bug 1830031 <1830031@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830031

Title:
  fatal error: float32nan on QEmu 3.1

Status in QEMU:
  Expired

Bug description:
  Docker throws float32nan errors when running alpine container on a
  CentOS 7.6 ppc64le Distro VM, when using Fedora 30 Host qemu 3.1. I
  Compiled qemu 2.11.2 on the Fedora 30 and using this qemu-system-ppc64
  we don't see the error. Even using qemu 3.1 and machine 2.11 we still
  get the same issue.

  Nothing changed on the OS level on the two runs. just the qemu-system-
  ppc64 used to run the virtual machine.

   Docker on CentOS 7: docker.ppc64le 2:1.13.1-96

  Running with qemu 2.11.2 behavior and machine 2.11:
  [root@machine ~]# /usr/local/bin/qemu-system-ppc64 -version
  QEMU emulator version 2.11.2(qemu-2.11.2-5.fc30)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  [root@powericp ~]# docker run -i -t alpine /bin/sh
  / # exit
  [root@powericp ~]# uname -a
  Linux powericp 3.10.0-957.12.2.el7.ppc64le #1 SMP Tue May 14 22:24:22 UTC=
 2019 ppc64le ppc64le ppc64le GNU/Linux
  [root@powericp ~]# docker version
  Client:
   Version:         1.13.1
   API version:     1.26
   Package version: docker-1.13.1-96.gitb2f74b2.el7.centos.ppc64le
   Go version:      go1.10.3
   Git commit:      b2f74b2/1.13.1
   Built:           Wed May  1 15:05:41 2019
   OS/Arch:         linux/ppc64le
  =E2=80=A6
  [root@powericp ~]# lscpu
  Architecture:          ppc64le
  Byte Order:            Little Endian
  CPU(s):                16
  On-line CPU(s) list:   0-15
  Thread(s) per core:    1
  Core(s) per socket:    1
  Socket(s):             16
  NUMA node(s):          1
  Model:                 2.0 (pvr 004e 1200)
  Model name:            POWER8 (architected), altivec supported
  Hypervisor vendor:     KVM
  Virtualization type:   para
  L1d cache:             32K
  L1i cache:             32K
  NUMA node0 CPU(s):     0-15
  #########################################################################=
########################
  #Running with qemu3.1
  #########################################################################=
########################
  [root@machine ~]# qemu-system-ppc64 -version
  QEMU emulator version 3.1.0 (qemu-3.1.0-8.fc30)
  Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers
  [root@powericp ~]# docker run -i -t alpine /bin/sh
  /usr/bin/docker-current: Error response from daemon: oci runtime error: e=
rror running hook: exit status 4, stdout: , stderr: fatal error: float32nan
  runtime: panic before malloc heap initialized

  runtime stack:
  fatal error: gentraceback before goexitPC initialization
  runtime: panic before malloc heap initialized
  panic during panic

  runtime stack:
  fatal error: gentraceback before goexitPC initialization
  runtime: panic before malloc heap initialized
  stack trace unavailable.
  [root@powericp ~]# lscpu
  Architecture:          ppc64le
  Byte Order:            Little Endian
  CPU(s):                16
  On-line CPU(s) list:   0-15
  Thread(s) per core:    1
  Core(s) per socket:    1
  Socket(s):             16
  NUMA node(s):          1
  Model:                 2.0 (pvr 004e 1200)
  Model name:            POWER8 (architected), altivec supported
  Hypervisor vendor:     KVM
  Virtualization type:   para
  L1d cache:             32K
  L1i cache:             32K
  NUMA node0 CPU(s):     0-15

  =

  strace attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1830031/+subscriptions

