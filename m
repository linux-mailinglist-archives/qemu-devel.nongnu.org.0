Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFC365073
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 04:47:11 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYgPt-0002LE-PW
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 22:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYgOW-0001tS-0D
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 22:45:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:44596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYgOT-0006qr-U5
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 22:45:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYgOS-000419-7n
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 363272E8041
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 02:38:06 -0000
From: hjiayz <1925109@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hjiayz163
X-Launchpad-Bug-Reporter: hjiayz (hjiayz163)
X-Launchpad-Bug-Modifier: hjiayz (hjiayz163)
Message-Id: <161888628706.6044.6118190110754714311.malonedeb@soybean.canonical.com>
Subject: [Bug 1925109] [NEW] usbredirparser: bulk transfer length exceeds
 limits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: c4419b8acae3a365c77c4c233baa9650c435a4f6
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
Reply-To: Bug 1925109 <1925109@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

2021-04-20T01:26:36.662244Z qemu-system-x86_64: usbredirparser: bulk transf=
er length exceeds limits 131072 > 65536
2021-04-20T01:26:36.662276Z qemu-system-x86_64: usbredirparser: error usbre=
dirparser_send_* call invalid params, please report!!
2021-04-20T01:26:57.670412Z qemu-system-x86_64: usbredirparser: bulk transf=
er length exceeds limits 131072 > 65536
2021-04-20T01:26:57.670445Z qemu-system-x86_64: usbredirparser: error usbre=
dirparser_send_* call invalid params, please report!!
2021-04-20T01:37:01.920613Z qemu-system-x86_64: usbredirparser: bulk transf=
er length exceeds limits 131072 > 65536
2021-04-20T01:37:01.920624Z qemu-system-x86_64: usbredirparser: error usbre=
dirparser_send_* call invalid params, please report!!
host:
Linux version 5.11.15-arch1-2 (linux@archlinux) (gcc (GCC) 10.2.0, GNU ld (=
GNU Binutils) 2.36.1) #1 SMP PREEMPT Sat, 17 Apr 2021 00:22:30 +0000
guest:
win10 20H2
usb device:
Bus 002 Device 007: ID 0781:55ab SanDisk Corp.  SanDisk 3.2Gen1
size 250G

https://gitlab.freedesktop.org/spice/usbredir/-/blob/master/usbredirparser/=
usbredirparser.c#L32

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925109

Title:
  usbredirparser: bulk transfer length exceeds limits

Status in QEMU:
  New

Bug description:
  2021-04-20T01:26:36.662244Z qemu-system-x86_64: usbredirparser: bulk tran=
sfer length exceeds limits 131072 > 65536
  2021-04-20T01:26:36.662276Z qemu-system-x86_64: usbredirparser: error usb=
redirparser_send_* call invalid params, please report!!
  2021-04-20T01:26:57.670412Z qemu-system-x86_64: usbredirparser: bulk tran=
sfer length exceeds limits 131072 > 65536
  2021-04-20T01:26:57.670445Z qemu-system-x86_64: usbredirparser: error usb=
redirparser_send_* call invalid params, please report!!
  2021-04-20T01:37:01.920613Z qemu-system-x86_64: usbredirparser: bulk tran=
sfer length exceeds limits 131072 > 65536
  2021-04-20T01:37:01.920624Z qemu-system-x86_64: usbredirparser: error usb=
redirparser_send_* call invalid params, please report!!
  host:
  Linux version 5.11.15-arch1-2 (linux@archlinux) (gcc (GCC) 10.2.0, GNU ld=
 (GNU Binutils) 2.36.1) #1 SMP PREEMPT Sat, 17 Apr 2021 00:22:30 +0000
  guest:
  win10 20H2
  usb device:
  Bus 002 Device 007: ID 0781:55ab SanDisk Corp.  SanDisk 3.2Gen1
  size 250G

  https://gitlab.freedesktop.org/spice/usbredir/-/blob/master/usbredirparse=
r/usbredirparser.c#L32

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925109/+subscriptions

