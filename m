Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1BD3C4311
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:33:18 +0200 (CEST)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nd7-00050A-Rr
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWX-0007lD-3o
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWU-0006QH-1a
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWQ-0005Li-5E
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E30A2E8245
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1911188@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: storage
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange janitor phidica th-huth
X-Launchpad-Bug-Reporter: Violet (phidica)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161045460597.3279.18327990327654492890.malonedeb@chaenomeles.canonical.com>
Message-Id: <162606344358.2726.7595898348089105261.malone@loganberry.canonical.com>
Subject: [Bug 1911188] Re: qemu-system-x86_64 prints obscure error message and
 exits when encountering an empty argument
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: b5a50cb7ffa0b7a7645645c20df6114745a69da9
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
Reply-To: Bug 1911188 <1911188@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911188

Title:
  qemu-system-x86_64 prints obscure error message and exits when
  encountering an empty argument

Status in QEMU:
  Expired

Bug description:
  QEMU emulator version 4.2.1 (qemu-4.2.1-1.fc32) on Fedora 32.

  When writing a script to start qemu automatically, I ran into a very
  confusing error message due to a bug in my script and had trouble
  understanding it. I isolated the problem to the following:

  $ qemu-system-x86_64 ""
  qemu-system-x86_64: Initialization of device ide-hd failed: Device needs =
media, but drive is empty

  As you can see, running qemu with an empty argument prints a seemingly
  random and unrelated error message about an ide-hd device, and the
  program immediately exits with code 1. This happens when an empty
  argument appears anywhere in the arguments list, always causing the
  program to immediately die with this error.

  This is a simply baffling message to be encountering when the problem
  is really an empty argument.

  Expected behaviour: Either flatly ignore the empty argument, or at
  most trigger a warning (eg, "warning: saw empty argument"). It should
  not at all prevent the program from running.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911188/+subscriptions

