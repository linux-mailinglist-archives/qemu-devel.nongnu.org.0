Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AA2AAA67
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 10:42:10 +0100 (CET)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbhD7-0003Pv-4W
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 04:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbhBu-0002gO-0b
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 04:40:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:57316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbhBs-0000BT-5i
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 04:40:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kbhBq-0000UD-FZ
 for <qemu-devel@nongnu.org>; Sun, 08 Nov 2020 09:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 744172E8131
 for <qemu-devel@nongnu.org>; Sun,  8 Nov 2020 09:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2020 09:35:12 -0000
From: Thomas Huth <1642011@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elitebadger th-huth
X-Launchpad-Bug-Reporter: Nathan (elitebadger)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20161115175129.19509.70345.malonedeb@gac.canonical.com>
Message-Id: <160482811280.27550.798114183056461722.malone@chaenomeles.canonical.com>
Subject: [Bug 1642011] Re: Mouse wheel events not forwarded to guest using GTK
 display
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: bdcdc57ab691994a9600b5247269310acc3ab9f9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 04:10:58
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
Reply-To: Bug 1642011 <1642011@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting all older bugs to
"Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1642011

Title:
  Mouse wheel events not forwarded to guest using GTK display

Status in QEMU:
  Incomplete

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

