Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87932CA79B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:03:16 +0100 (CET)
Received: from localhost ([::1]:32796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk87X-00009k-U9
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kk85g-00073g-4H
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:01:20 -0500
Received: from indium.canonical.com ([91.189.90.7]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kk85Z-0000nC-N1
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:01:19 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kk85S-0005SI-5V
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 16:01:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7D4822E8145
 for <qemu-devel@nongnu.org>; Tue,  1 Dec 2020 16:01:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Dec 2020 15:47:14 -0000
From: Russell Morris <1906156@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h th-huth
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Russell Morris (6-u3untu-h)
References: <160665259684.21842.16670509730009461748.malonedeb@gac.canonical.com>
Message-Id: <160683763477.6856.9123728838778498794.malone@chaenomeles.canonical.com>
Subject: [Bug 1906156] Re: Host OS Reboot Required,
 for Guest kext to Load (Fully)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="08644ab21771254a8c489299c99344a1828acad8"; Instance="production"
X-Launchpad-Hash: 2fd57432bf4314b124869565f37e82aa959ba8c5
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
Reply-To: Bug 1906156 <1906156@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That makes sense, no issue at all. So I cloned from git (v5.2.0-rc3),
built, installed. All good so far :-). But then I tried to modify the
"emulator" in virt-manager, point to this build =3D> I get the error,

Error changing VM configuration: internal error: Failed to start QEMU
binary /usr/local/bin/qemu-system-x86_64 for probing: libvirt:  error :
cannot execute binary /usr/local/bin/qemu-system-x86_64: Permission
denied

Thoughts? I have run into this before (without finding a fix sadly) -
thinking it's apparmor related somehow?

Thanks!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906156

Title:
  Host OS Reboot Required, for Guest kext to Load (Fully)

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  Finding this one a bit odd, but I am loading a driver (kext) in a
  macOS guest ... and it works, on the first VM (domain) startup after a
  full / clean host OS boot (or reboot). However, if I even reboot the
  guest OS, then the driver load fails =3D> can be "corrected" by a full
  host OS reboot (which seems very extreme).

  Is this a known issue, and/or is there a workaround?

  FYI, running,
  QEMU emulator version 5.0.0 (Debian 1:5.0-5ubuntu9.1)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  This is for a macOS guest, on a Linux host.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906156/+subscriptions

