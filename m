Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E503652FF83
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 22:53:03 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsW5u-0002Hx-FN
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 16:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nsW3m-0001Vm-Fd
 for qemu-devel@nongnu.org; Sat, 21 May 2022 16:50:50 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:52690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nsW3k-0000qs-7E
 for qemu-devel@nongnu.org; Sat, 21 May 2022 16:50:50 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id E1D483F599
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1653166243;
 bh=u+JKrvUhlkyNnBuznKwQfEUYE/vaFFBDaRrcZ81ziMg=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ErVxabiOu0IHxZ4OWPY1bq1ia9ZGRqpHqNZJg0JM2hOs0ftKIM48kchCG1FXHKWX3
 0skTtvtcphiSk+uhVbsmw8Xsa/zl8W6AB0DlIWom9HfyiWs8SBubTgKMvbPdSaNMoX
 nBwHQdLQD1vgKUuBle35i7eVrx8f21dq/ycIHkt8Ds3rhmA/2N7tR+VUaMr8gv3HVB
 e7ks8a9av/JAHkQwKTzHqQHEKRlbkEby7ghXCrecxnz0jeRRy2UOIZB1iZAEEgNRev
 VlUZSRmAu3+JzTFfQYMPkrMV4CBOYt3uUcx+Zs1RkdHN1tIWvVKLkNltSFts7UAOqi
 QxhLowBxcdJUQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7104C2E8264
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 20:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 May 2022 20:43:45 -0000
From: Lev Kujawski <1639394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jnsnow lkujaw madgemade-v xtrondo
X-Launchpad-Bug-Reporter: xtrondo (xtrondo)
X-Launchpad-Bug-Modifier: Lev Kujawski (lkujaw)
References: <20161105021624.30133.98019.malonedeb@wampee.canonical.com>
Message-Id: <165316582556.49659.2705129043971733047.malone@daniels.canonical.com>
Subject: [Bug 1639394] Re: Unable to boot Solaris 8/9 x86 under Fedora 24
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b94d9e1863e34c2bb2e616313c72421407e026e2"; Instance="production"
X-Launchpad-Hash: a0069d2b865405ee6513398815dc1db63d3f5f88
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1639394 <1639394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, I believe I have solved the underlying issue with the attached
patch. Verified against the behavior of an actual i440FX IDE controller.

See https://lists.nongnu.org/archive/html/qemu-
devel/2022-05/msg04229.html .

** Patch added: "0001-ide_ioport_read-Return-lower-octet-of-data-register-.=
patch"
   https://bugs.launchpad.net/qemu/+bug/1639394/+attachment/5591880/+files/=
0001-ide_ioport_read-Return-lower-octet-of-data-register-.patch

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1639394

Title:
  Unable to boot Solaris 8/9 x86 under Fedora 24

Status in QEMU:
  Expired

Bug description:
  qemu-system-x86_64 -version
  QEMU emulator version 2.6.2 (qemu-2.6.2-4.fc24), Copyright (c) 2003-2008 =
Fabrice Bellard

  Try several ways without success, I think it was a regression because pro=
blem seems to be related with ide fixed on 0.6.0:
  - int13 CDROM BIOS fix (aka Solaris x86 install CD fix)
  - int15, ah=3D86 BIOS fix (aka Solaris x86 hardware probe hang up fix)

  Solaris 10/11 works without a problem, also booting with "scsi" will
  circumvent initial problem, but later found problems related with
  "scsi" cdrom boot and also will not found the "ide" disk device.

 =20
  qemu-system-i386 -m 712 -drive file=3D/dev/Virtual_hdd/beryllium0,format=
=3Draw -cdrom /repo/Isos/sol-9_905_x86.iso

  SunOS Secondary Boot version 3.00

  prom_panic: Could not mount filesystem.
  Entering boot debugger:
  [136419]

 =20
  Regards,
  \\CA,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1639394/+subscriptions


