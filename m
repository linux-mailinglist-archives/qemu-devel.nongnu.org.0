Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C3D2ADDB9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:05:27 +0100 (CET)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcY1G-0006UU-O5
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcXxw-0003ll-SM
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:02:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:42090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcXxp-0001W9-7Q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:02:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcXxk-0000KI-IV
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:01:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 82E522E8138
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:01:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 17:54:55 -0000
From: Thomas Huth <1736042@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: liangy tezeb th-huth
X-Launchpad-Bug-Reporter: tezeb (tezeb)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151234883142.11175.15433643697954166633.malonedeb@soybean.canonical.com>
Message-Id: <160503089601.13144.16757036394141290151.malone@gac.canonical.com>
Subject: [Bug 1736042] Re: qemu-system-x86_64 does not boot image reliably
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 2ae15ac791d1d05cb86cbc65a2dbc02a0905a02e
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
Reply-To: Bug 1736042 <1736042@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have you ever tried the suggestions from Liang Yan ?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1736042

Title:
  qemu-system-x86_64 does not boot image reliably

Status in QEMU:
  Incomplete

Bug description:
  Booting image as root user with following command works randomly.

  ./qemu-system-x86_64 -enable-kvm -curses -smp cpus=3D4 -m 8192
  /root/ructfe2917_g.qcow2

  Most of the time it ends up on "800x600 Graphic mode"(been stuck there
  even for 4 hours before killed), but 1 out of ~20 it boots image
  correctly(and instantly).

  This is visible in v2.5.0 build from sources, v2.5.0 from Ubuntu
  Xenial and v2.1.2 from Debian Jessie.

  The image in question was converted from vmdk using:

  qemu-img convert -O qcow2 file.vmdk file.qcow2

  The image contains Ubuntu with grub.

  I can provide debug logs, but will need guidance how to enable
  them(and what logs are necessary).

  As a side note, it seems that booting is more certain after
  connecting(or mounting) partition using qemu-nbd/mount.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1736042/+subscriptions

