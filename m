Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E116380715
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 12:22:58 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhUy8-0007Gr-Sp
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 06:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhUwB-0005HI-Gu
 for qemu-devel@nongnu.org; Fri, 14 May 2021 06:20:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:60192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhUwA-0006AB-0t
 for qemu-devel@nongnu.org; Fri, 14 May 2021 06:20:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhUw5-0000sH-KW
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:20:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 024302E81C3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:20:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 10:07:16 -0000
From: Thomas Huth <1906948@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gtk gui opengl virtio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832 janitor th-huth
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160719376548.16747.104851865616000042.malonedeb@wampee.canonical.com>
Message-Id: <162098683669.16288.9751675330556317229.malone@soybean.canonical.com>
Subject: [Bug 1906948] Re: Enabling OpenGL for GUI doesn't work on old laptop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: cf0085cbec71a724f0acbdd2751d4ed07af7f6c8
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
Reply-To: Bug 1906948 <1906948@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/296


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #296
   https://gitlab.com/qemu-project/qemu/-/issues/296

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906948

Title:
  Enabling OpenGL for GUI doesn't work on old laptop

Status in QEMU:
  Expired

Bug description:
  QEMU start command is:

  qemu-system-x86_64 -enable-kvm -m 2G -cpu host -smp 2 -cdrom
  ./linuxmint-20-mate-64bit.iso -boot d -vga virtio -soundhw hda
  -display gtk,gl=3Don

  =

  and QEMU crashes immediately on startup and gives these error messages:

  =

  qemu_gl_create_compile_shader: compile vertex error
  0:2(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.=
10, 1.20, and 1.00 ES

  qemu_gl_create_compile_shader: compile fragment error
  0:2(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.=
10, 1.20, and 1.00 ES

  qemu_gl_create_compile_shader: compile vertex error
  0:2(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.=
10, 1.20, and 1.00 ES

  qemu_gl_create_compile_shader: compile fragment error
  0:2(10): error: GLSL ES 3.00 is not supported. Supported versions are: 1.=
10, 1.20, and 1.00 ES

  =

  If I remove "gl=3Don" it will boot. Does this just mean that this hardwar=
e is too old to run QEMU with OpenGL enabled in GUI, or is this a bug? =


  Host OS is Debian 10, computer is a Lenovo laptop with Core i5-520M
  CPU and its integrated Intel HD graphics GPU.

  QEMU version is 3.1.0 from Debian repositories.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906948/+subscriptions

