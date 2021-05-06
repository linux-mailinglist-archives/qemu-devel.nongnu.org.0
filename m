Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AEA375532
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:55:57 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeTs-0002tV-CO
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeP0-00069t-GA
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:43114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeOx-00074E-4o
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:50:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leeOv-00034h-64
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 13:50:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F1A952E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 13:50:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 13:37:40 -0000
From: Thomas Huth <1874504@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sparc64 vfio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: atar4qemu gh975223
X-Launchpad-Bug-Reporter: Graeme Brett Houston BSc (gh975223)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158766417277.8728.12362820918014730192.malonedeb@gac.canonical.com>
Message-Id: <162030826091.6373.5755231009944647444.launchpad@wampee.canonical.com>
Subject: [Bug 1874504] Re: VFIO passthrough spits out thousands of messages
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 1f49d45bc1a5a50108b59ed91e71fd054ae2f58a
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
Reply-To: Bug 1874504 <1874504@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874504

Title:
  VFIO passthrough spits out thousands of messages

Status in QEMU:
  Incomplete

Bug description:
  started qemu as:
  sudo qemu-system-sparc64 -device vfio-pci,host=3D0b:05.0,x-no-mmap=3Don,b=
us=3DpciB

  messages received thousands of times:

  qemu-system-sparc64: -device vfio-pci,host=3D0b:05.0,x-no-mmap=3Don,bus=
=3DpciB: iommu has granularity incompatible with target AS
  qemu-system-sparc64: -device vfio-pci,host=3D0b:05.0,x-no-mmap=3Don,bus=
=3DpciB: iommu map to non memory area 4079c000

  qemu version (think telling a lie as sure its 5.0)
  QEMU emulator version 4.2.92
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  pci device being passed through:

  0b:05.0 Display controller [0380]: 3DLabs Permedia II 2D+3D [3d3d:0009] (=
rev 01)
  	Subsystem: Tech-Source Permedia II 2D+3D [1227:0006]
  	Flags: medium devsel, IRQ 11
  	Memory at 83000000 (32-bit, non-prefetchable) [disabled] [size=3D128K]
  	Memory at 82800000 (32-bit, non-prefetchable) [disabled] [size=3D8M]
  	Memory at 82000000 (32-bit, non-prefetchable) [disabled] [size=3D8M]
  	Expansion ROM at 83020000 [disabled] [size=3D64K]
  	Capabilities: <access denied>
  	Kernel driver in use: vfio-pci

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874504/+subscriptions

