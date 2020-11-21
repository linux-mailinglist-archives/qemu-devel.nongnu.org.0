Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64F2BC2BC
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:51:20 +0100 (CET)
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcf1-0005Pg-L7
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgceJ-0004vG-Ly
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:50:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:56830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgceH-0008JO-Kq
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:50:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgceF-0001gN-0o
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:50:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 01CE62E813A
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:50:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 23:44:24 -0000
From: Peter Maydell <1895703@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: buildsys tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn bonzini philmd pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160018860889.17103.9156462398304890013.malonedeb@soybean.canonical.com>
Message-Id: <160600226420.29038.17867942422183191827.malone@chaenomeles.canonical.com>
Subject: [Bug 1895703] Re: performance degradation in tcg since Meson switch
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 5e5227e7c265529efec1b7a28ff90d17ecd61b03
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
Reply-To: Bug 1895703 <1895703@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was fixed initially by commit 0c3dd50eaecbfe2, which is the change
suggested in Paolo's comment #6, and then refined by commit
a5cb7c5afe717d4.


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895703

Title:
  performance degradation in tcg since Meson switch

Status in QEMU:
  Fix Committed

Bug description:
  The buildsys conversion to Meson (1d806cef0e3..7fd51e68c34)
  introduced a degradation in performance in some TCG targets:

  --------------------------------------------------------
  Test Program: matmult_double
  --------------------------------------------------------
  Target              Instructions     Previous    Latest
                                       1d806cef   7fd51e68
  ----------  --------------------  ----------  ----------
  alpha              3 233 957 639       -----     +7.472%
  m68k               3 919 110 506       -----    +18.433%
  --------------------------------------------------------

  Original report from Ahmed Karaman with further testing done
  by Aleksandar Markovic:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg740279.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895703/+subscriptions

