Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D723E715
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 07:42:58 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3v9d-0002Ox-9z
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 01:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3v7q-0000gk-PS
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 01:41:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:39360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3v7n-0000g2-Nr
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 01:41:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k3v7l-0005rs-T9
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 05:41:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AB9542E807B
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 05:41:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 05:33:02 -0000
From: Laci <1890775@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jacoka
X-Launchpad-Bug-Reporter: Laci (jacoka)
X-Launchpad-Bug-Modifier: Laci (jacoka)
References: <159677829829.10348.2497937987968118298.malonedeb@chaenomeles.canonical.com>
Message-Id: <159677838285.2281.6152810823679990374.malone@gac.canonical.com>
Subject: [Bug 1890775] Re: Aten USB to Serial bridge does not work with qemu
 under Windows 10
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 67e099af2fda90ea7067b221a3a0baa8ad3fa6bf
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1890775 <1890775@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I forgot that the environment is Windows 10 64 bit.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890775

Title:
  Aten USB to Serial bridge does not work with qemu under Windows 10

Status in QEMU:
  New

Bug description:
  I would like to use MSDOS 6.22 with qemu (unfortunatelly lot of our test =
programs has been written in dos).
  I tried to connect two laptop by RS232 port, one of the machine have a bu=
ilt-in serial port and run with native MSDOS 6.22 with 4.0 norton commander=
. Another machine have only USB ports and i try to use a new Aten USB to Se=
rial device. Ok. Has been started qemu with -serial and -chardev parameters=
, at startup appear a window with serial port setting such as baud rate, st=
art bit, etc...

  Quemu has been satrted succeeded but serial port cannot be used
  becouse was nothing activited on usb serial adapter :(

  I tried same configuration with VirtualBox and everything was worked
  fine (serial connection was estabiled and copied several files from
  one machine into another machine), seems to be the emulated serial
  port has been worked fine.

  I would like to use qemu, i just thougt qemu is better, simple and
  faster...

  Exists solution or is this a qemu bug?

  Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890775/+subscriptions

