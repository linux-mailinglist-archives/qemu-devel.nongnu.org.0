Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CC3736BB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:04:49 +0200 (CEST)
Received: from localhost ([::1]:56900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDSa-0003Qw-47
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOu-0000kg-Ad
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:48418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOr-0000JH-H5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:01:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leDOp-0008QV-M4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:00:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A63DB2E813A
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 09:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:51:40 -0000
From: Thomas Huth <1799768@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth yannick-duchene
X-Launchpad-Bug-Reporter: =?utf-8?b?SGlib3U1N8KgKFlhbm5pY2vCoER1Y2jDqm5l?=
 =?utf-8?q?=29_=28yannick-duchene=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154040735225.13629.1923075331608721611.malonedeb@chaenomeles.canonical.com>
Message-Id: <162020470055.6123.17721770470093853767.malone@wampee.canonical.com>
Subject: [Bug 1799768] Re: -nodefaults has unclear documentation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0df4298fa7dbe98e1e65aa313cd01a0943a3e146
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
Reply-To: Bug 1799768 <1799768@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/156


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #156
   https://gitlab.com/qemu-project/qemu/-/issues/156

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1799768

Title:
  -nodefaults has unclear documentation

Status in QEMU:
  Expired

Bug description:
  -nodefaults has an unclear documentation, I believe it should states
  it does not applies to devices created by a machine model.

  See https://stackoverflow.com/questions/52908614/qemu-s-nodefaults-
  not-working-as-expected-to-me to read how I came to this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1799768/+subscriptions

