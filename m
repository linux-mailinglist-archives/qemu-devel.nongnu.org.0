Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87EA2F31D8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:37:18 +0100 (CET)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJrJ-0000y5-RC
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzJpb-0000Rx-Ov
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:35:31 -0500
Received: from indium.canonical.com ([91.189.90.7]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzJpZ-0002MZ-NB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:35:31 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzJpX-0005Yl-P6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:35:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A95152E813B
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 13:28:35 -0000
From: Violet <1911188@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange phidica
X-Launchpad-Bug-Reporter: Violet (phidica)
X-Launchpad-Bug-Modifier: Violet (phidica)
References: <161045460597.3279.18327990327654492890.malonedeb@chaenomeles.canonical.com>
Message-Id: <161045811510.23111.5710034873953234624.malone@soybean.canonical.com>
Subject: [Bug 1911188] Re: qemu-system-x86_64 prints obscure error message and
 exits when encountering an empty argument
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 735fbd82fb6ea5cbd3e3390334561d8144f2186d
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
Reply-To: Bug 1911188 <1911188@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the quick reply Daniel. I've looked at the qemu man page many
times but somehow never noticed that it can take one non-option argument
alongside any other options. That does explain what is going on here. In
that case I'm not going to push for a potentially breaking change.

Perhaps it would still be beneficial to emit a warning about the empty
string, at least when it has occurred in conjunction with a non-
removable drive (I suppose one is created automatically if no other
options are present?) which doesn't make sense to get such a path. I
feel like the scenario in which it is intended might be less common than
the scenario in which it has happened accidentally. Maybe I'm biased
though ;)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911188

Title:
  qemu-system-x86_64 prints obscure error message and exits when
  encountering an empty argument

Status in QEMU:
  New

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

