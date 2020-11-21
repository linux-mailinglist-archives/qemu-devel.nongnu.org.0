Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E342BC20A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:31:53 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZXz-0000gS-KN
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgZWw-0000El-HJ
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:30:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgZWr-0003bH-0M
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:30:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgZWn-0004TY-GN
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 20:30:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6E5E02E813B
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 20:30:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 20:24:40 -0000
From: Peter Maydell <1652286@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lpnow pmaydell
X-Launchpad-Bug-Reporter: LPNow (lpnow)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20161223114830.15083.74920.malonedeb@wampee.canonical.com>
Message-Id: <160599028088.2306.3225287731237084100.malone@gac.canonical.com>
Subject: [Bug 1652286] Re: QEMU manpages provoke man(1) "can't break line"
 warnings
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 34b6cd4445e03de2c79f8c689ba30525f577855a
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
Reply-To: Bug 1652286 <1652286@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still happens with the new Sphinx-generated manpages, for exactly the
same reason.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1652286

Title:
  QEMU manpages provoke man(1) "can't break line" warnings

Status in QEMU:
  Confirmed

Bug description:
  I noticed when I ran 'man qemu' for version 2.8.0 I am getting this
  back at the terminal;

  =

  <standard input>:1674: warning [p 1, 188.5i, div `an-div', 0.2i]: can't b=
reak line
  <standard input>:1677: warning [p 1, 188.8i, div `an-div', 0.2i]: can't b=
reak line

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1652286/+subscriptions

