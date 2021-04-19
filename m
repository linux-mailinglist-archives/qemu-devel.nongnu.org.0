Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F653643BA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:32:06 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYU0T-0003NL-GR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYTzP-0002b8-Ku
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:30:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:46822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYTzN-0005f4-Qs
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:30:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYTzK-0000cR-TM
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:30:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C92E62E80EA
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:30:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 13:21:01 -0000
From: Thomas Huth <1822012@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-pennebaker th-huth
X-Launchpad-Bug-Reporter: mcandre (andrew-pennebaker)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155373213706.19594.537277581807889618.malonedeb@chaenomeles.canonical.com>
Message-Id: <161883846119.2567.5952214281750007853.malone@gac.canonical.com>
Subject: [Bug 1822012] Re: powernv machine complains of missing skiboot files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 5551e8892d9ac189b994ba9f3e73043339e80641
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1822012 <1822012@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This sounds like a bug in the packaging of Ubuntu, so I've moved it to
the Ubuntu tracker

** Project changed: qemu =3D> qemu (Ubuntu)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1822012

Title:
  powernv machine complains of missing skiboot files

Status in qemu package in Ubuntu:
  New

Bug description:
  Hi, I want to use the powernv machine from the qemu-system-ppcle
  application. However, when I specify this machine, qemu complains that
  it can't find the skiboot files.

  I noticed that skiboot is available for Ubuntu, but only for the
  PPC[64] hosts. Well, I just need skiboot files for qemu on amd64
  hosts.

  Hmm, looks like Debian has a package for these missing qemu files:

  https://packages.debian.org/sid/qemu-skiboot

  Could we promote these to Ubuntu repositories, and fix the qemu
  packages so that they automatically depend on the necessary BIOS
  packages? For example, openbios-ppc should also be installed when
  qemu-system-ppc[64[le]] are installed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1822012/+subscriptions

