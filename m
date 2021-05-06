Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81874374F64
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:32:57 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXZA-0007R6-Jn
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leXXB-0006Lo-U9
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:30:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:46474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leXXA-000532-66
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:30:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leXX7-0001Aj-Bt
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:30:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5851F2E80F3
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 06:30:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 06:20:25 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1897568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awik philmd
X-Launchpad-Bug-Reporter: Albert Wik (awik)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <160129907003.10349.16133652474527618816.malonedeb@chaenomeles.canonical.com>
Message-Id: <162028202562.15318.972105125854973562.malone@soybean.canonical.com>
Subject: [Bug 1897568] Re: Strange keyboard behaviour in Vim editor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: bf323b0ae9dca7c3c584f32708fda6aaf1d9e3d0
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
Reply-To: Bug 1897568 <1897568@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Possible fix:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg804823.html

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897568

Title:
  Strange keyboard behaviour in Vim editor

Status in QEMU:
  Confirmed

Bug description:
  =

  I'm running MS-DOS 7.10 in a QEMU virtual machine, and there is a problem=
 with the keyboard in the Vim editor.  The arrow keys jump over a line, as =
if you had typed the key twice.  PgUp and PgDn are likewise affected.  Othe=
r applications are not affected, unless you shell out from Vim.

  The QEMU version is 5.0.0, and I'm using the "-k sv" option, but I've
  tried without it and it doesn't make a difference.

  I don't get this keyboard behaviour in the exact same VM under VMware
  Player or Bochs.

  -Albert.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1897568/+subscriptions

