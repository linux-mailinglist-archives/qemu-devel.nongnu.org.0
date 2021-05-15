Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169B938182E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:17:21 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsIK-000849-6d
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsGs-0006EB-Ir
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:15:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:55860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsGg-0001CJ-1F
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:15:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsGe-0000Q1-5F
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 268D02E8186
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:09:33 -0000
From: Thomas Huth <1926952@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: firecode95 marcandre-lureau th-huth
X-Launchpad-Bug-Reporter: Firecode95 (firecode95)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <162004304487.4348.9374620020070858180.malonedeb@chaenomeles.canonical.com>
Message-Id: <162107697327.1436.14831231135066583075.malone@wampee.canonical.com>
Subject: [Bug 1926952] Re: SPICE support broken with 6.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 645d50919fe1da80e6eeb9a2728c3fba9d020422
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1926952 <1926952@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926952

Title:
  SPICE support broken with 6.0

Status in QEMU:
  Incomplete

Bug description:
  Using latest relase 6.0.0 while using Intel GVT-G DMA-BUF and SPICE
  for usb redirection Qemu won't start:

  qemu-system-x86_64: The console requires display DMABUF support.

  However just patching ui/console.c:

  if (flags & GRAPHIC_FLAGS_DMABUF &&
          !displaychangelistener_has_dmabuf(dcl)) {
          error_setg(errp, "The console requires display DMABUF support.");
          return false;
  }

  to always return true for dmabuf part works just fine:

  if (flags & GRAPHIC_FLAGS_DMABUF &&
          !displaychangelistener_has_dmabuf(dcl)) {
          error_setg(errp, "The console requires display DMABUF support.");
          return true;
  }

  This behavior wasn't in qemu 5.x version.

  To reproduce this bug need to use:

  /usr/bin/qemu-system-x86_64 \
  -machine q35 \
  -enable-kvm \
  -no-user-config \
  -nodefaults \
  -no-hpet \
  -display gtk,gl=3Don \
  -device pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mul=
tifunction=3Don,addr=3D0x1 \
  -device vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=3D/sys=
/devices/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/mdev/devi=
ces/1ae40c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=3Don,dis=
play=3Don,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,addr=3D0x=
2 \
  -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926952/+subscriptions

