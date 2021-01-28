Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D965307D03
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:52:45 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BTI-0006WU-IQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5BMi-0002Zd-UI
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:45:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:60176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5BMf-0000p7-6g
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:45:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5BMb-0003zK-U5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:45:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DA9772E8148
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:45:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Jan 2021 17:35:11 -0000
From: Gerd Hoffmann <1913619@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: nographic
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: buzzheavyyear kraxel-redhat
X-Launchpad-Bug-Reporter: buzz (buzzheavyyear)
X-Launchpad-Bug-Modifier: Gerd Hoffmann (kraxel-redhat)
References: <161185194511.7487.12920912623269673480.malonedeb@gac.canonical.com>
Message-Id: <161185531187.32409.11311937434963001130.malone@chaenomeles.canonical.com>
Subject: [Bug 1913619] Re: qemu-system-x86_64 -cdrom -nographic gives no output
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: c1ce5c8e6d161c783e1d00587c998d9d46b80962
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
Reply-To: Bug 1913619 <1913619@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vga-to-serial redirection activated by -nographics works only for vgabi=
os calls,
not for direct vga hardware access. grub2 uses the vgabios, the linux kerne=
l doesn't.
You can edit the menu entry in grub and add "console=3DttyS0" to the linux =
command line.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913619

Title:
  qemu-system-x86_64 -cdrom -nographic gives no output

Status in QEMU:
  Invalid

Bug description:
  Running 'sudo qemu-system-x86_64 -m 2048M -cpu host -cdrom github
  /xvisor-bootable.iso -boot d -enable-kvm' will create a qemu window,
  boot to a grub prompt and then boot the xvisor binary correctly.

  Once I append -nographic to the command - after the user has selected
  the grub boot binary, there is no further output.

  I've tried various permutations with qemu options, but to no avail. It
  would be great to have this working as it will permit scrolling back
  up into the command history for reference and large data output.

  QEMU emulator version 5.2.50 (v5.2.0-925-g7b09f12773)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913619/+subscriptions

