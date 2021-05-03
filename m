Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D237156B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:51:38 +0200 (CEST)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldY2z-0007s0-T4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldY18-0006Xs-09
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:49:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:56128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldY16-0002un-3o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:49:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldY14-0002Pj-9y
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 12:49:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 360E92E8164
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 12:49:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 12:37:24 -0000
From: Thomas Huth <1163034@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: costamagnagianfranco pmaydell serge-hallyn th-huth
 wgrant
X-Launchpad-Bug-Reporter: Gianfranco Costamagna (costamagnagianfranco)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130401223319.8572.52647.malonedeb@gac.canonical.com>
Message-Id: <162004544440.10821.5731867809825457068.malone@gac.canonical.com>
Subject: [Bug 1163034] Re: linux-user mode can't handle guest setting a very
 small RLIMIT_AS (hangs running gnutls28, coreutils configure check code)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: a203a732033e3597baa61037a3efa27e454ac6fd
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
Reply-To: Bug 1163034 <1163034@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/95


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #95
   https://gitlab.com/qemu-project/qemu/-/issues/95

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1163034

Title:
  linux-user mode can't handle guest setting a very small RLIMIT_AS
  (hangs running gnutls28, coreutils configure check code)

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  Please look at
  https://code.launchpad.net/~costamagnagianfranco/+archive/costamagnagianf=
ranco-ppa/+packages
  and
  https://code.launchpad.net/~costamagnagianfranco/+archive/costamagnagianf=
ranco-ppa/+build/4457434

  I cannot make gnutls28 build on armhf, I suspect a builder problem

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1163034/+subscriptions

