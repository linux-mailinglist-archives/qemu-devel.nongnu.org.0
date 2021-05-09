Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F6C3776EC
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:11:24 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfk9T-0002eH-6b
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk3w-0003qK-I3
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:52012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk3t-0005j6-0I
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfk3p-0003JL-W7
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:05:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DEFE42E8026
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:05:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 13:56:11 -0000
From: Thomas Huth <1897568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awik philmd
X-Launchpad-Bug-Reporter: Albert Wik (awik)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160129907003.10349.16133652474527618816.malonedeb@chaenomeles.canonical.com>
Message-Id: <162056857184.6615.13203552706716331082.launchpad@gac.canonical.com>
Subject: [Bug 1897568] Re: Strange keyboard behaviour in Vim editor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 3a17f659ac4c47722563de55f8b8e12b7e2add6e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897568

Title:
  Strange keyboard behaviour in Vim editor

Status in QEMU:
  In Progress

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

