Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99963725EF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:47:13 +0200 (CEST)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldops-000244-TS
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo14-0006mE-Lm
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:54:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:49030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo11-0005PI-MH
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:54:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldo0z-0002We-Uu
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:54:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CAB562E8194
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 05:54:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 05:44:46 -0000
From: Thomas Huth <1453613@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: krichter722 pmaydell th-huth
X-Launchpad-Bug-Reporter: Karl-Philipp Richter (krichter722)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150510212848.16381.19321.malonedeb@gac.canonical.com>
Message-Id: <162010708624.4685.5216543764080012959.malone@chaenomeles.canonical.com>
Subject: [Bug 1453613] Re: the help message of the set_password subcommand of
 the qemu monitor isn't usable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 0534b6629f6225ac228241809b949654077203dc
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
Reply-To: Bug 1453613 <1453613@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/114


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #114
   https://gitlab.com/qemu-project/qemu/-/issues/114

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1453613

Title:
  the help message of the set_password subcommand of the qemu monitor
  isn't usable

Status in QEMU:
  Expired

Bug description:
  `help set_password` in qemu monitor prints `set_password protocol
  password action-if-connected -- set spice/vnc password` which doesn't
  allow to figure out how to use this subcommand.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1453613/+subscriptions

