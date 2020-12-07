Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC42D119F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:16:10 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGN7-0003NC-EV
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmF7m-0006NF-0L
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:56:22 -0500
Received: from indium.canonical.com ([91.189.90.7]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmF7h-0004N5-F1
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:56:13 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kmF7c-0005DB-BN
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 11:56:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4DA1B2E813B
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 11:56:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Dec 2020 11:48:38 -0000
From: Mario <1674114@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bad disk image sector
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mario1992 th-huth
X-Launchpad-Bug-Reporter: Mario (mario1992)
X-Launchpad-Bug-Modifier: Mario (mario1992)
References: <20170319155854.19555.99549.malonedeb@soybean.canonical.com>
Message-Id: <160734171847.30334.5144592583591460837.malone@chaenomeles.canonical.com>
Subject: [Bug 1674114] Re: Bad sectors when using MS-DOS 6.22
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="15cd58601e77a273f7390fc4f4fcd16efe814a43"; Instance="production"
X-Launchpad-Hash: e62522976d43736dce83fdd17595b757e0f40edb
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
Reply-To: Bug 1674114 <1674114@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The issue is resolved in the current release

C:\tmp>"C:\Program Files\qemu\\qemu-system-i386.exe" --version
QEMU emulator version 5.1.92 (v5.2.0-rc2-11843-gf571c4ffb5-dirty)
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1674114

Title:
  Bad sectors when using MS-DOS 6.22

Status in QEMU:
  Fix Released

Bug description:
  When I try to install DOS 6.22 in QEMU, I get many disk errors when
  the virtual disk is beeing partionized and formatted. When I later do
  a SCANDISK, I can see many bad sectors and file errors.

  I have tested this with the following disk formats: qcow2, vmdk, raw.

  I tested this on Windows 7 with the following command line and QEMU versi=
on:
  qemu-system-i386 -name "Windows 3.11 WfW" -machine isapc -cpu 486 -boot o=
rder=3Dadc -m 32 -soundhw sb16 -hda disk1.qcow2 -vga cirrus

  qemu-system-i386 --version
  QEMU emulator version 2.8.50 (v2.8.0-12557-g0bd1f6b1b2-dirty)
  Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developers

  I then did a test with the linux version of qemu, which gave me the same =
results.
  Command line: qemu-system-i386 -name "Windows 3.11 WfW" -machine isapc -c=
pu 486 -boot order=3Dadc -m 32 -soundhw sb16 -hda disk1.qcow2 -vga cirrus -=
monitor stdout
  Version: qemu-system-i386 --version
  QEMU emulator version 2.1.2 (Debian 1:2.1+dfsg-12+deb8u6), Copyright (c) =
2003-2008 Fabrice Bellard

  I also checked the disk image with qemu-img, with no results:

  No errors were found on the image.
  7986/8000 =3D 99.83% allocated, 0.20% fragmented, 0.00% compressed cluste=
rs
  Image end offset: 523698176

  Because I got the error with two different versions of QEMU, I think
  this is a general problem and not related to a specific distribution.

  I have attached a zip file with screenshots of SCANDISK, which shows
  the disk errors.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1674114/+subscriptions

