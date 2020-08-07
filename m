Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609523EA9D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:42:11 +0200 (CEST)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3yt8-0008Pz-4J
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3yrE-0005ps-8E
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:40:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:45112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3yrC-0003qG-GT
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:40:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k3yrB-0007ii-Fg
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 09:40:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 732DE2E8072
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 09:40:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 09:26:06 -0000
From: Thomas Huth <1187319@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lekensteyn th-huth
X-Launchpad-Bug-Reporter: Peter Wu (lekensteyn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130604094937.27663.87753.malonedeb@gac.canonical.com>
Message-Id: <159679236675.3031.13959677101809673523.malone@gac.canonical.com>
Subject: [Bug 1187319] Re: Ctrl-Alt-- and Ctrl-Alt-+ have no effect in SDL
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b8dd683a91f8d7684d839cdb0b6f9fbf8df94269
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1187319 <1187319@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... is this still an issue with the
latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1187319

Title:
  Ctrl-Alt-- and Ctrl-Alt-+ have no effect in SDL

Status in QEMU:
  Incomplete

Bug description:
  The manual page mentions Ctrl-Alt-- for shrinking a window and Ctrl-
  Alt-+ for enlarging it. Pressing these keys do not seem to have any
  effect.

  I tried -/=3D with and without holding shift and the numpad. By the way,
  the numpad plus and min do not have any effect in GTK either.

  Keyboard layout: US int with AltGr dead keys
  version: 1.5.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1187319/+subscriptions

