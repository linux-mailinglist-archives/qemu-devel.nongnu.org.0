Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251D2CF919
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 03:57:06 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klNkv-0001YW-1o
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 21:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1klNjc-000130-Uz
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 21:55:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1klNja-0000u6-RI
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 21:55:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1klNjW-0000HF-PC
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 02:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9602F2E8088
 for <qemu-devel@nongnu.org>; Sat,  5 Dec 2020 02:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Dec 2020 02:46:15 -0000
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
Message-Id: <160713637515.29734.7944043235110810650.malone@chaenomeles.canonical.com>
Subject: [Bug 1906156] Re: Host OS Reboot Required,
 for Guest kext to Load (Fully)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="15cd58601e77a273f7390fc4f4fcd16efe814a43"; Instance="production"
X-Launchpad-Hash: a11c29ed2f78f7caf37825141dccf7300e5c7fb6
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
Reply-To: Bug 1906156 <1906156@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My apologies, but I'm somewhat stuck here :-(. Trying to run the latest (up=
stream) version of QEMU, but no luck getting it to execute. I even tried se=
tting securit_driver =3D "none", as captured here,
https://gitlab.com/apparmor/apparmor/-/wikis/Libvirt

But no luck. Open to any suggestions.

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

