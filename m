Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFA370E84
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:35:49 +0200 (CEST)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGwW-00084a-Le
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGi3-0004ss-QJ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:20:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGhz-0006Ad-M0
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:20:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGhy-0000Pj-Fz
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:20:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 782F42E8144
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:20:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:12:53 -0000
From: Thomas Huth <1856027@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: harrymalaria th-huth
X-Launchpad-Bug-Reporter: Tom Hanker (harrymalaria)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157606475893.7537.4130147721731991147.malonedeb@soybean.canonical.com>
Message-Id: <161997917586.10956.11247291984416805384.malone@gac.canonical.com>
Subject: [Bug 1856027] Re: Suddenly no internet in guest system!
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 35915d7b9cf7ad159ce4828aab9ab6066c988a79
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1856027 <1856027@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856027

Title:
  Suddenly no internet in guest system!

Status in QEMU:
  Incomplete

Bug description:
  I use Opensuse 15.1 i have installed androidx86_64 as a guest system, it =
runs for over 3 years. i had a internetconnection, i could use apps etc. bu=
t since yesterday i can=C2=B4t connect to the internet with the guest syste=
m in the host system all works fine. What could be the reason? There haven=
=C2=B4t been an update and i haven=C2=B4t changed anything. =

  The settings in nic are: bridge br0: Hostdevice eth0
  devicemodel: e1000

  The qemu Version is from the opensuse repo: 3.1.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856027/+subscriptions

