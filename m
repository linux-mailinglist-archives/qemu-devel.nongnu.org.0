Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6F2D5635
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:11:59 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHzS-0002mi-SW
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHuL-0007VM-51
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:06:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:60576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHuG-0002Vg-1B
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:06:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHuF-0005Qz-09
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:06:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F15CD2E802E
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:06:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 08:47:43 -0000
From: Thomas Huth <1453608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: krichter722 th-huth
X-Launchpad-Bug-Reporter: Karl-Philipp Richter (krichter722)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150510211131.15752.73461.malonedeb@chaenomeles.canonical.com>
Message-Id: <160759006403.16485.16204323328097265156.malone@chaenomeles.canonical.com>
Subject: [Bug 1453608] Re: explain what pcsys_monitor in manpage
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: ee52160ac6bce67a6bc6ccd2e8a014af939b3db2
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
Reply-To: Bug 1453608 <1453608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1453608

Title:
  explain what pcsys_monitor in manpage

Status in QEMU:
  Fix Released

Bug description:
  The specification of vnc passwords seems to have changed. `man qemu-
  system-x86_64` mentions `set_password` to be used in `pcsys_monitor`.
  Both are are not further mentioned in the man page and misteriously
  inexisting in both the web and the source root (as far as `grep -r -I
  'pcsys_monitor' .` is concerned). That's too vage to be usable.

  experienced with 2.3.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1453608/+subscriptions

