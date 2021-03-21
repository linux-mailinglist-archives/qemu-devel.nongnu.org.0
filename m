Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CAF3430D4
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 05:29:15 +0100 (CET)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNpiE-0001MF-1S
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 00:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNpfb-0000SR-Pp
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 00:26:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:48516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNpfG-0002d3-2V
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 00:26:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lNpfC-0003hO-5Z
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 04:26:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6279E2E81FB
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Mar 2021 04:17:14 -0000
From: Launchpad Bug Tracker <1811711@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange ipatch janitor th-huth xanclic
X-Launchpad-Bug-Reporter: Chris (ipatch)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154748542167.20943.17238616375041067992.malonedeb@soybean.canonical.com>
Message-Id: <161630023492.2150.2275630236896183285.malone@loganberry.canonical.com>
Subject: [Bug 1811711] Re: qemu-img can not convert virtualbox virtual disk
 formats qcow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 8b7ecf11991b530c8493bfb13628264990848385
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
Reply-To: Bug 1811711 <1811711@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811711

Title:
  qemu-img can not convert virtualbox virtual disk formats qcow

Status in QEMU:
  Expired

Bug description:
  Hello, I'm working with QEMU on macOS, and am experiencing issues
  working with the `qemu-img` command.

  Info
  ----
  $ sw_vers
  ProductName:    Mac OS X
  ProductVersion: 10.13.6
  BuildVersion:   17G4015

  VirtualBox
  ----------
  $ VBoxManage --version
  6.0.0r127566

  $ qemu-system-x86_64 --version
  QEMU emulator version 3.1.50 (v3.1.0-rc2-745-g147923b1a9-dirty)
  Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers

  $ qemu-img --version
  qemu-img version 3.1.50 (v3.1.0-rc2-745-g147923b1a9-dirty)
  Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers

  Steps to reproduce
  ------------------

  > Prereq VirtualBox needs to be installed to run the `VBoxManage`
  command

  $ VBoxManage createmedium disk --filename vbox-vdisk-exp.qcow --format qc=
ow --size 5
  0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
  Medium created. UUID: e2b36955-3791-4c0e-93d4-913669b1d9fb

  $ file vbox-vdisk-exp.qcow
  vbox-vdisk-exp.qcow: QEMU QCOW Image (v1), 5242880 bytes

  $ qemu-img info vbox-vdisk-exp.qcow
  image: vbox-vdisk-exp.qcow
  file format: qcow
  virtual size: 5.0M (5242880 bytes)
  disk size: 8.0K
  cluster_size: 4096

  # Convert vbox virtualdisk to qcow2 format using `qemu-img`
  $ qemu-img convert -f qcow vbox-vdisk-exp.qcow -O qcow2 vbox-vdisk-exp-co=
nvert.qcow2

  $ file vbox-vdisk-exp-convert.qcow2
  vbox-vdisk-exp-convert.qcow2: QEMU QCOW Image (v3), 5242880 bytes

  # Print info about qemu-img converted image from vbox created qcow image
  $ qemu-img info vbox-vdisk-exp-convert.qcow2                             =
                      mutts-6 | 0 < 10:53:00
  image: vbox-vdisk-exp-convert.qcow2
  file format: qcow2
  virtual size: 5.0M (5242880 bytes)
  disk size: 196K
  cluster_size: 65536
  Format specific information:
      compat: 1.1
      lazy refcounts: false
      refcount bits: 16
      corrupt: false

  # Print info about vbox created qcow image
  qemu-img info vbox-vdisk-exp.qcow                                        =
                    mutts-6 | 0 < 10:53:19
  image: vbox-vdisk-exp.qcow
  file format: qcow
  virtual size: 5.0M (5242880 bytes)
  disk size: 8.0K
  cluster_size: 4096

  I've attached a zip file containing the vbox created qcow image along
  with the image that `qemu-img` converted.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811711/+subscriptions

