Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DE2BC2AE
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:42:41 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcWe-0002aN-IQ
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcUs-0001fN-Tr
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:40:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:56522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcUo-0004zq-Tg
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:40:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgcUm-0001Dw-Cb
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:40:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 596682E8041
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:40:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 23:30:46 -0000
From: Peter Maydell <1748756@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell th-huth typicalcoder-deactivatedaccount
X-Launchpad-Bug-Reporter: Sturov Fedor (typicalcoder-deactivatedaccount)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <151835983054.10064.7263863820027448340.malonedeb@wampee.canonical.com>
Message-Id: <160600144674.27933.17830291504560961202.malone@chaenomeles.canonical.com>
Subject: [Bug 1748756] Re: [Feature request] Support of TI AM1808 for Lego EV3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: d526c524923673053218f8f4601c22f9f4e426f2
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
Reply-To: Bug 1748756 <1748756@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project doesn't implement new target architectures or board
models on demand based on wishlist requests; they're a lot of work to
do. Instead we simply code-review and incorporate board models and
architectures as and when people decide to write them and submit the
patches. So there's really no point in having a 'wishlist' bug in the
bug tracker saying "support for board X would be nice", because it will
never happen, unless by the coincidence that somebody happened to
implement and submit it to us anyway.

So I'm going to close this bug as "Won't Fix"; if anybody happens to
want to work with upstream on implementing this board model they are
welcome to do so -- the mechanism for that is to email qemu-devel (with
plans, requests for advice or patches).


** Changed in: qemu
       Status: Incomplete =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1748756

Title:
  [Feature request] Support of TI AM1808 for Lego EV3

Status in QEMU:
  Won't Fix

Bug description:
  It would be great if emulating TI AM1808 would be possible. It will be
  a big step towards Lego Mindstorms EV3 emulation.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1748756/+subscriptions

