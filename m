Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69937396A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:32:55 +0200 (CEST)
Received: from localhost ([::1]:36818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFlt-00063m-W9
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFfJ-0000kS-VQ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:26:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:48874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFf8-0002F2-Pp
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:26:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFf7-0000fZ-HL
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 826092E80F9
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:17:55 -0000
From: Thomas Huth <1818398@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: evdev kvm mouse virtio-vga
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gatestallaman th-huth
X-Launchpad-Bug-Reporter: gatestallman (gatestallaman)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155161629551.17312.8753163653910781588.malonedeb@soybean.canonical.com>
Message-Id: <162021347525.5917.12163014486472065696.malone@wampee.canonical.com>
Subject: [Bug 1818398] Re: No evdev mouse passthrough with virtio-vga or kvm
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0d7dbb7dde5f91d223e76a0d965a0c73bd3d4294
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1818398 <1818398@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/165


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #165
   https://gitlab.com/qemu-project/qemu/-/issues/165

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1818398

Title:
  No evdev mouse passthrough with virtio-vga or kvm

Status in QEMU:
  Expired

Bug description:
  Hi,

  Using qemu version 3.1.0-1 on a host with the latest Archlinux 64-bit
  distribution, and running the same OS as guest, the mouse doesn't work
  when using both evdev passthrough and virtio-vga, or when using both
  evdev passthrough and kvm.

  The following command line runs a machine that does not receive any mouse=
 event:
  qemu-system-x86_64 -machine type=3Dq35,accel=3Dkvm -cpu host -accel kvm -=
boot order=3Ddc,menu=3Don -m size=3D2048 -net nic -device virtio-vga -devic=
e intel-hda -name Linux -drive file=3D/mnt/data/nobody/linux/arch.img,if=3D=
virtio -display sdl,gl=3Don -full-screen -net user -D /dev/null -rtc base=
=3Dutc,clock=3Dhost,driftfix=3Dslew -nodefaults -object input-linux,id=3Dkb=
d1,evdev=3D/dev/input/event6,grab_all=3Don,repeat=3Don -object input-linux,=
id=3Dmouse1,evdev=3D/dev/input/event7

  But with this command line, removing virtio-vga and kvm, the mouse works =
as expected:
  qemu-system-x86_64 -machine type=3Dq35 -boot order=3Ddc,menu=3Don -m size=
=3D2048 -net nic -device cirrus-vga -device intel-hda -name Linux -drive fi=
le=3D/mnt/data/nobody/linux/arch.img,if=3Dvirtio -display sdl,gl=3Don -full=
-screen -net user -D /dev/null -rtc base=3Dutc,clock=3Dhost,driftfix=3Dslew=
 -nodefaults -object input-linux,id=3Dkbd1,evdev=3D/dev/input/event6,grab_a=
ll=3Don,repeat=3Don -object input-linux,id=3Dmouse1,evdev=3D/dev/input/even=
t7

  Note: Passing a keyboard by evdev in the same way always works, the
  problem is mouse specific.

  Thanks in advance for the analysis,
  gatestallman

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1818398/+subscriptions

