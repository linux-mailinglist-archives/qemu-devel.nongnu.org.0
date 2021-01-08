Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945212EEC85
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:33:16 +0100 (CET)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjSd-000292-KI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLs-0001Pw-Ve
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:56360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLp-0003iL-Vp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLc-0004CI-AC
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:26:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A1D32E814A
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1642011@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elitebadger janitor th-huth
X-Launchpad-Bug-Reporter: Nathan (elitebadger)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20161115175129.19509.70345.malonedeb@gac.canonical.com>
Message-Id: <161007944752.27824.15192964175310722747.malone@loganberry.canonical.com>
Subject: [Bug 1642011] Re: Mouse wheel events not forwarded to guest using GTK
 display
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 26ad7fde721a773afe26a4ee85beb8f85fe3c0cc
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
Reply-To: Bug 1642011 <1642011@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1642011

Title:
  Mouse wheel events not forwarded to guest using GTK display

Status in QEMU:
  Expired

Bug description:
  Using QEMU 2.7.0 with KVM enabled, when I launch the guest without
  options (using the default of gtk), the mouse wheel events are not
  propagated to the guest.

  When I start qemu using -display sdk, mouse wheel events are properly
  forwarded.

  I can determine that the guest is not receiving mouse wheel events by
  doing cat /dev/input/by-id/usb-QEMU_QEMU_USB_Mouse_42-event-mouse.
  When I scroll the wheel, no output is printed to the screen.

  The guest is ChromiumOS.

  The command line is:

  qemu-system-x86_64 -enable-kvm -m 2G -smp 4 -vga cirrus -usbdevice
  mouse -pidfile /tmp/kvm.pid -chardev
  pipe,id=3Dcontrol_pipe,path=3D/tmp/kvm.pipe -serial file:/tmp/kvm.serial
  -mon chardev=3Dcontrol_pipe -net nic,model=3Dvirtio -net
  user,hostfwd=3Dtcp:127.0.0.1:9222-:22 -drive
  file=3Dchromiumos/src/build/images/amd64-generic/latest/chromiumos_qemu_i=
mage.bin,index=3D0,media=3Ddisk,cache=3Dunsafe

  (Most of that invocation sets up Linux fifos for various and nefarious
  purposes and can be profitably ignored).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1642011/+subscriptions

