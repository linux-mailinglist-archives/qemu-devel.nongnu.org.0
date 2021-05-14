Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088BA38105A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:14:31 +0200 (CEST)
Received: from localhost ([::1]:55230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdGY-0004aM-3z
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdDD-0006qM-KK
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:39842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdD8-00027t-52
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdD5-0007fA-Ch
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C7412E8193
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:05:32 -0000
From: Thomas Huth <1922102@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos net network tap tap-net
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: shchukovl th-huth
X-Launchpad-Bug-Reporter: Vladislav Yaroshchuk (shchukovl)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161720333927.2408.17717907169331715630.malonedeb@chaenomeles.canonical.com>
Message-Id: <162101913244.8318.7852598844331489279.malone@gac.canonical.com>
Subject: [Bug 1922102] Re: Broken tap networking on macOS host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 1eba4eb772da21a0382e6fe906f26c63fd4eaabc
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
Reply-To: Bug 1922102 <1922102@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1922102

Title:
  Broken tap networking on macOS host

Status in QEMU:
  Incomplete

Bug description:
  Building QEMU with GLib newer than 2.58.3 corrupts tap networking on macO=
S hosts.
  Tap device was provided by Tun/Tap kernel extension installed from brew:
  =C2=A0=C2=A0brew install tuntap

  Checked revisions:
  =C2=A0=C2=A0553032d (v5.2.0)
  =C2=A0=C2=A06d40ce0 (v6.0.0-rc1)

  Host:
  =C2=A0MacBook Pro (Retina, 15-inch, Mid 2015)
  =C2=A0macOS Catalina 10.15.6 (19G2021)

  Guest:
  =C2=A0=C2=A0Linux Ubuntu 4.4.0-206-generic x86_64
  =C2=A0=C2=A0Also tested macOS Catalina 10.15.7 as a guest, the behaviour =
is the same.

  QEMU command line:

  qemu-system-x86_64 \
  =C2=A0=C2=A0-drive file=3Dhdd.qcow2,if=3Dvirtio,format=3Dqcow2 \
  =C2=A0=C2=A0-m 3G \
  =C2=A0=C2=A0-nic tap,script=3Dtap-up.sh

  tap-up.sh:

  =C2=A0#!/bin/sh

  =C2=A0TAPDEV=3D"$1"
  =C2=A0BRIDGEDEV=3D"bridge0"

  =C2=A0ifconfig "$BRIDGEDEV" addm "$TAPDEV"

  Enabling/disabling Hypervisor.Framework acceleration (`-accel hvf`)
  has no effect.

  How to reproduce:
  =C2=A0=C2=A01. Build & install GLib > 2.58.3 (tested 2.60.7)
  =C2=A0=C2=A02. Build qemu-system-x86_64 with GLib > 2.58.3
  =C2=A0=C2=A03. Boot any guest with tap networking enabled
  =C2=A0=C2=A04. See that the external network is inaccessible

  Hotfix:
  =C2=A0=C2=A01. Build & install GLib 2.58.3
  =C2=A0=C2=A02. Build qemu-system-x86_64 with GLib 2.58.3
  =C2=A0=C2=A03. Boot any guest with tap networking enabled
  =C2=A0=C2=A04. See that the external network is accessible, everything is=
 working as expected

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922102/+subscriptions

