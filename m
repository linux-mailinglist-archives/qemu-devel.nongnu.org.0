Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D333AAE74
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 10:08:16 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltn4R-00044x-41
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 04:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltn36-0002ij-87
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:06:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:51190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltn34-0000Hs-1p
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:06:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ltn2y-0000Am-8n
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:06:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 317182E81D9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:06:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jun 2021 07:51:45 -0000
From: Thomas Huth <490484@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu-kvm; component=main; 
 status=Incomplete; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anthony-codemonkey kirkland koterpillar rakatan
 zulcss
X-Launchpad-Bug-Reporter: =?utf-8?b?xaBhcsWrbmFzIFZhbGHFoWtldmnEjWl1cyAo?=
 =?utf-8?q?rakatan=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 530077
References: <20091130193112.21058.19906.malonedeb@gangotri.canonical.com>
Message-Id: <162391630594.11752.10337830660371440662.launchpad@soybean.canonical.com>
Subject: [Bug 490484] Re: running 64bit client in 64bit host with intel crashes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 32861a752239881ca98762691dbda53e9542e6c0
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
Reply-To: Bug 490484 <490484@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 530077 ***
    https://bugs.launchpad.net/bugs/530077

** No longer affects: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/490484

Title:
  running 64bit client in 64bit host with intel crashes

Status in qemu-kvm package in Ubuntu:
  Incomplete

Bug description:
  Binary package hint: qemu-kvm

  running windows 7 VM halts on early boot with

  kvm: unhandled exit 80000021
  kvm_run returned -22

  ProblemType: Bug
  Architecture: amd64
  Date: Mon Nov 30 21:28:54 2009
  DistroRelease: Ubuntu 9.10
  KvmCmdLine: Error: command ['ps', '-C', 'kvm', '-F'] failed with exit cod=
e 1: UID        PID  PPID  C    SZ   RSS PSR STIME TTY          TIME CMD
  MachineType: System manufacturer P5Q-PRO
  NonfreeKernelModules: fglrx
  Package: kvm (not installed)
  ProcCmdLine: BOOT_IMAGE=3D/vmlinuz-2.6.31-14-generic root=3DUUID=3D17a8e1=
81-fac7-461e-8cad-8aea97be2536 ro quiet splash
  ProcEnviron:
   LANGUAGE=3Den_US:en
   PATH=3D(custom, user)
   LANG=3Den_US.UTF-8
   SHELL=3D/bin/bash
  ProcVersionSignature: Ubuntu 2.6.31-14.48-generic
  SourcePackage: qemu-kvm
  Uname: Linux 2.6.31-14-generic x86_64
  dmi.bios.date: 07/10/2008
  dmi.bios.vendor: American Megatrends Inc.
  dmi.bios.version: 1004
  dmi.board.asset.tag: To Be Filled By O.E.M.
  dmi.board.name: P5Q-PRO
  dmi.board.vendor: ASUSTeK Computer INC.
  dmi.board.version: Rev 1.xx
  dmi.chassis.asset.tag: Asset-1234567890
  dmi.chassis.type: 3
  dmi.chassis.vendor: Chassis Manufacture
  dmi.chassis.version: Chassis Version
  dmi.modalias: dmi:bvnAmericanMegatrendsInc.:bvr1004:bd07/10/2008:svnSyste=
mmanufacturer:pnP5Q-PRO:pvrSystemVersion:rvnASUSTeKComputerINC.:rnP5Q-PRO:r=
vrRev1.xx:cvnChassisManufacture:ct3:cvrChassisVersion:
  dmi.product.name: P5Q-PRO
  dmi.product.version: System Version
  dmi.sys.vendor: System manufacturer

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/490484/+subscriptio=
ns

