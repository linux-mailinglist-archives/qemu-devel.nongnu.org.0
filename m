Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA238182D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:17:19 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsII-00081N-Gn
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsGl-0006DN-WC
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:15:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:55902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsGh-0001Cu-Al
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:15:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsGf-0000Q4-00
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:15:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F26472E8050
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:06:34 -0000
From: Thomas Huth <1922430@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: epistemepromeneur th-huth
X-Launchpad-Bug-Reporter: promeneur (epistemepromeneur)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161745782847.29743.8322673006861745178.malonedeb@gac.canonical.com>
Message-Id: <162107679503.21294.4079477558068982437.malone@soybean.canonical.com>
Subject: [Bug 1922430] Re: 3d accel does not take care of 1280x960 setting
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 29e6f9d7640a7bdaf89fc2af985490dd01c19030
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
Reply-To: Bug 1922430 <1922430@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ticket has been moved here (thanks!):
https://gitlab.com/qemu-project/qemu/-/issues/315
... so I'm closing this on Launchpad now.

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #315
   https://gitlab.com/qemu-project/qemu/-/issues/315

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922430

Title:
  3d accel does not take care of 1280x960 setting

Status in QEMU:
  Invalid

Bug description:
  openSuse 15.2
  kde plasma 5.21.3, frameworks 5.80.0
  libvirt 7.0.0
  qemu 5.2.0
  virgl renderer 0.8.2

  here is my invocation

  qemu-kvm -enable-kvm \
  -m 2048 -smp 2 -cpu host \
  -device virtio-vga,virgl=3Don -display gtk,gl=3Don \
  -device usb-ehci \
  -device usb-kbd \
  -device usb-mouse \
  -device usb-tablet \
  -device ich9-intel-hda \
  -device hda-duplex,audiodev=3Dsnd0 \
  -audiodev pa,id=3Dsnd0 \
  -device usb-host,vendorid=3D0x046d,productid=3D0x08e5 \
  -boot menu=3Don \
  -nic bridge \
  ~/QEMU_VM/android_x86_7.1-r5.img \

  in the kernel command there is "vga=3D1280x960"

  with "-device qxl" no problem. I get immediately a  window of size
  1280x960.

  with "-device virtio-vga,virgl=3Don -display gtk,gl=3Don"

  i get a tiny window.

  i must uncheck "zoom to fit" to get a window of size 1280x960.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922430/+subscriptions

