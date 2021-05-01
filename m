Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4F370858
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:08:15 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcu2I-0008LE-KV
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzp-0006g5-DS
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzn-0004py-60
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lctzk-0004do-Uv
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 18:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E881F2E8144
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 18:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 17:59:05 -0000
From: Thomas Huth <1891830@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: msmouse
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mslade th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159762797324.26708.16374390576065274837.malonedeb@soybean.canonical.com>
Message-Id: <161989194509.12015.8872554431110345641.malone@soybean.canonical.com>
Subject: [Bug 1891830] Re: msmouse serial mouse emulation broken? No id byte
 sent on reset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 0c07abfc2de054f34d31728e84ba0f000af7538f
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
Reply-To: Bug 1891830 <1891830@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/78


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #78
   https://gitlab.com/qemu-project/qemu/-/issues/78

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891830

Title:
  msmouse serial mouse emulation broken? No id byte sent on reset

Status in QEMU:
  Expired

Bug description:
  I took a shot at getting Windows 1.01 working.  It doesn't support a
  PS/2 mouse out-of-the-box but does support MS serial mice.  It doesn't
  seem to detect qemu's emulated msmouse.

  When I run this command:

  > qemu-system-i386 -nodefaults -hda my_windows1_hd.qcow2 -vga std
  -serial msmouse -trace enable=3D'serial*'  -icount shift=3D10,align=3Don

  I get this output (edited):

  251908@1597626456.800452:serial_ioport_write write addr 0x04 val 0x01
  251908@1597626456.800460:serial_ioport_read read addr 0x00 val 0x00
  251908@1597626456.800462:serial_ioport_read read addr 0x00 val 0x00

  [snip]

  251908@1597626456.961641:serial_ioport_read read addr 0x00 val 0x00
  251908@1597626456.961642:serial_ioport_read read addr 0x00 val 0x00
  251908@1597626456.961644:serial_ioport_read read addr 0x00 val 0x00
  251908@1597626456.961647:serial_ioport_write write addr 0x04 val 0x0b
  251908@1597626456.961648:serial_ioport_read read addr 0x05 val 0x60
  251908@1597626456.961684:serial_ioport_read read addr 0x05 val 0x60
  251908@1597626456.961685:serial_ioport_read read addr 0x05 val 0x60

  [snip]

  251908@1597626457.045894:serial_ioport_read read addr 0x05 val 0x60
  251908@1597626457.045895:serial_ioport_read read addr 0x05 val 0x60
  251908@1597626457.045897:serial_ioport_read read addr 0x05 val 0x60
  251908@1597626457.045932:serial_ioport_read read addr 0x00 val 0x00

  The write of 0x01 and then 0x0b to reg 0x04 is the guest turning the
  RTS line off then on.  A real mouse will respond to this by sending
  0x4d, which is how the guest detects the mouse.

  Reproducible in current stable-4.2 and 5.0 (debian's build).  I am
  able to get the guest to use a real passed-through serial mouse (with
  a minor hack, separate bug filed for this)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891830/+subscriptions

