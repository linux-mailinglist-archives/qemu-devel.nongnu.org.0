Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217694856BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 17:37:03 +0100 (CET)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n59HZ-0005ON-Rc
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 11:37:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1n59GK-0004hO-S8
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:35:45 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:41016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1n59GI-0006W1-9U
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:35:44 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 5DE0A4068C
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1641400534;
 bh=o2qSX3slNabqAmr5+y2w4ETDLdH64dxk9u6ShfFLmto=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=gEjMj+kT1hoXWphkdvFDYHfbgxmfhXXKfymQW0CTAo+/8PAeY01Hm4/c/ZaodyPI4
 MK/VjTO05tOg8600f776eUYDWF922+tY9PxPi+cu6Jt62oZopF8PVKLj4cMlIVDjQ1
 PugT6nke3/EGusZb9jKb4OobleXsX5bt3l+oiAourKVCFxncgY22dZ0y9W+j1bmX0F
 cM/gLwHdffiU/1b6QOKFzzmroNi0WsmPoY6bDolQuZXO0XY/eWfPne3vfodul7t6yx
 Qqpyip2z/ds5za1JaR1c4skxeoPm4BAIVAKIZ1QS2JmMITutT+WV/vjD/12Y4Gs5ga
 1K/9tm5dDVTwg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2C67A2E816E
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 16:35:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Jan 2022 16:27:44 -0000
From: Andrew Scott <1862619@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ascott1 imapotato2 laurent-vivier pmaydell
 tebounet th-huth
X-Launchpad-Bug-Reporter: Thierry Briot (tebounet)
X-Launchpad-Bug-Modifier: Andrew Scott (ascott1)
References: <158133547000.19789.14380673630783179726.malonedeb@wampee.canonical.com>
Message-Id: <164140006416.11158.10666333713269762981.malone@gac.canonical.com>
Subject: [Bug 1862619] Re: "-serial telnet::xxxx,
 server" causes "Device 'serial0' is in use"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="adb364d6a74a28e7b95d51cd30446ec16160de6c"; Instance="production"
X-Launchpad-Hash: 025594df3cf4d1ad90a4c723103c759207b563c2
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1862619 <1862619@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reporting again. Compiled QEMU from the latest stable Git:

QEMU emulator version 6.2.50 (v6.2.0-529-gfb084237a3)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

Exactly as original post, if I place -serial telnet::4441,server ahead
of -serial mon,stdio on the command line, it dumps core and aborts.

if I flip them, it runs... BUT! The vm console output appears in the
terminal where I launched qemu, I get no output in the telnet session.
That's backwards. I have no access to the qemu console and can't issue
commands to do things like change the CDROM.

full command startup script (this one works but output doesn't happen
where I expect)

#!/bin/sh
CDROM=3D"-cdrom HP-UX-OE-1.iso"
QEMU=3D/home/ascott/Documents/hpux/qemu/qemu/build/qemu-system-hppa
IMAGE=3D/home/ascott/Documents/hpux/hpux.img
$QEMU -boot d -serial mon:stdio -serial telnet::4441,server -drive if=3Dscs=
i,bus=3D0,index=3D6,file=3D$IMAGE,format=3Draw -nographic -m 512 -d nochain=
 $CDROM  -net nic,model=3Dtulip  -net user

This one dumps core with the serial0 error from the originla post:

#!/bin/sh
CDROM=3D"-cdrom HP-UX-OE-1.iso"
QEMU=3D/home/ascott/Documents/hpux/qemu/qemu/build/qemu-system-hppa
IMAGE=3D/home/ascott/Documents/hpux/hpux.img
$QEMU -boot d -serial telnet::4441,server -serial mon:stdio -drive if=3Dscs=
i,bus=3D0,index=3D6,file=3D$IMAGE,format=3Draw -nographic -m 512 -d nochain=
 $CDROM  -net nic,model=3Dtulip  -net user

ascott@vmhost01:~/Documents/hpux$ sh ./install-hpux.sh=20
qemu-system-hppa: -serial telnet::4441,server: info: QEMU waiting for conne=
ction on: disconnected:telnet:0.0.0.0:4441,server=3Don
Unexpected error in qemu_chr_fe_init() at ../chardev/char-fe.c:220:
qemu-system-hppa: Device 'serial0' is in use
Aborted (core dumped)

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862619

Title:
  "-serial telnet::xxxx,server" causes "Device 'serial0' is in use"

Status in QEMU:
  Fix Released

Bug description:
  I start qemu version 4.2.50 in a first terminal :

  $ sudo ./qemu-system-hppa -boot d -serial telnet::4441,server -drive
  if=3Dscsi,bus=3D0,index=3D6,file=3D./hpux.img,format=3Draw -serial mon:st=
dio -D
  /tmp/foo -nographic -m 512 -d nochain -cdrom
  ./HPUX_9.05_Installation_Disc_S700.iso -D /tmp/foo -net
  nic,model=3Dtulip  -net tap

  qemu-system-hppa: -serial telnet::4441,server: info: QEMU waiting for
  connection on: disconnected:telnet:0.0.0.0:4441,server

  In another terminal, I launch "telnet localhost 4441"

  And in the qemu window I have the following error:

  Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:220:
  qemu-system-hppa: Device 'serial0' is in use

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862619/+subscriptions


