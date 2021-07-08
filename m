Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A816B3BF4C9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:31:32 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LhD-0002uW-Me
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbr-0005PI-No
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:57898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbp-0003Jg-Ft
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1Lbl-0000mv-SX
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CB9E62E80BA
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Jul 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1893807@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jesussanz2003 th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Jes=C3=BAs_Sanz_del_Rey_=28jesussanz200?=
 =?utf-8?q?3=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159897706621.21998.10972908941872978580.malonedeb@chaenomeles.canonical.com>
Message-Id: <162571784847.7916.13891155834856649188.malone@loganberry.canonical.com>
Subject: [Bug 1893807] Re: Crash when launching windows qemu version from WSL2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 016261eb50d107592bcdf5bfcee1b0d7c5607473
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
Reply-To: Bug 1893807 <1893807@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893807

Title:
  Crash when launching windows qemu version from WSL2

Status in QEMU:
  Expired

Bug description:
  Version: 5.1.0
  Command line from WSL2:
  qemu-system-x86_64.exe -hdd /home/jesus/proyectos/RWivOS/bin/RELEASE/imag=
e.hdd -m 4G -smp 4 -machine q35 -debugcon stdio

  OS: Windows 10(64 bits) from WSL2 Ubuntu 18.04

  The error:
  ERROR:/home/stefan/src/qemu/repo.or.cz/qemu/ar7/block.c:1325:bdrv_open_dr=
iver: assertion
  =C2=A0failed: (is_power_of_2(bs->bl.request_alignment))

  The problem i'm seeing when i lauch from wsl2 only occurs when
  launched with argument -hdd from WSL2, if i launch it from Windows
  pointing to the WSL path where the file is stored works.

  It occurs on other versions, i tried 4.1.0 too.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893807/+subscriptions

