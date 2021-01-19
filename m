Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC652FB2A5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:16:48 +0100 (CET)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1lFv-0000oW-9b
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1lAX-0005iy-Tq
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:11:13 -0500
Received: from indium.canonical.com ([91.189.90.7]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1lAS-0004jQ-Je
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:11:13 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1lAR-00085T-Gk
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7D9C82E8137
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 06:57:08 -0000
From: Thomas Huth <1811711@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange ipatch th-huth xanclic
X-Launchpad-Bug-Reporter: Chris (ipatch)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154748542167.20943.17238616375041067992.malonedeb@soybean.canonical.com>
Message-Id: <161103942897.26612.5707440661948648121.malone@chaenomeles.canonical.com>
Subject: [Bug 1811711] Re: qemu-img can not convert virtualbox virtual disk
 formats qcow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: d37f9cd0598915c908bbc428260e1235f89d6bcc
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
Reply-To: Bug 1811711 <1811711@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1811711

Title:
  qemu-img can not convert virtualbox virtual disk formats qcow

Status in QEMU:
  Incomplete

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

