Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0FF3273B3
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:52:03 +0100 (CET)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGQEb-0002jU-Ps
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGQDG-0002Ab-DP
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 12:50:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:58422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGQDE-0002Xk-8G
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 12:50:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGQDC-0001yj-8Q
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 17:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3AF0C2E813D
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 17:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Feb 2021 17:40:57 -0000
From: johannes <1906948@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gtk gui opengl virtio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832 janitor th-huth
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: johannes (fghgfh832)
References: <160719376548.16747.104851865616000042.malonedeb@wampee.canonical.com>
Message-Id: <161453405709.24730.5913157145465585071.malone@wampee.canonical.com>
Subject: [Bug 1906948] Re: Enabling OpenGL for GUI doesn't work on old laptop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: bd7c51b9e3a7882aacaf04781937f9764859c8cb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Still happens in 5.2.0 (Debian 1:5.2+dfsg-3~bpo10+1). Is this just due
to hardware which is too old?

** Changed in: qemu
       Status: Expired =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906948

Title:
  Enabling OpenGL for GUI doesn't work on old laptop

Status in QEMU:
  New

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

