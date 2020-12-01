Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260742CAAB8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:27:14 +0100 (CET)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAMr-0003Z2-8X
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkALU-0002oP-IB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:25:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:39398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkALP-0003iM-IX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:25:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kkALN-0000tu-GS
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 18:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 771722E813F
 for <qemu-devel@nongnu.org>; Tue,  1 Dec 2020 18:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Dec 2020 18:13:54 -0000
From: Daniel Berrange <1906180@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: input keyboard
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange fghgfh832 th-huth
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <160668110894.7596.13290289019242660849.malonedeb@soybean.canonical.com>
Message-Id: <160684643455.23860.15585835500636470581.malone@wampee.canonical.com>
Subject: [Bug 1906180] Re: Keyboard keys get stuck
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="08644ab21771254a8c489299c99344a1828acad8"; Instance="production"
X-Launchpad-Hash: cc9b8b859ee542460829bb13b2d41e8e31e2ed62
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
Reply-To: Bug 1906180 <1906180@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you confirm whether you are executing QEMU on your local
desktop/laptop machine, or remotely over SSH with X11-forwarding, or
over a remote VNC server, etc ? In the remote cases stuck keys is
somewhat of a known problem especially if latency is bad

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906180

Title:
  Keyboard keys get stuck

Status in QEMU:
  Incomplete

Bug description:
  Keyboard keys get "stuck" quite often, on certain Linux guests at
  least, and start repeating themselves until another key is pressed.
  This is especially noticeable with key combinations like Ctrl+V for
  pasting. When it happens, you get the pasted text and
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv...

  This bug has been present for quite some time but I don't remember any
  specific version that had it first.

  =

  QEMU version: 5.1.0
  Guest: Debian stable 64-bit (live), with Gnome desktop (may occur with ot=
her Linux guests too)
  Host: Arch Linux with KDE desktop (X11, wayland not tested); both default=
 and hardened kernel tested

  QEMU start command:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom debian.iso -=
boot d -vga std

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906180/+subscriptions

