Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00492376F9C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 06:46:56 +0200 (CEST)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfErg-0004jt-3L
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 00:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfEqP-00043H-Lq
 for qemu-devel@nongnu.org; Sat, 08 May 2021 00:45:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:49936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfEqN-0007Vv-P0
 for qemu-devel@nongnu.org; Sat, 08 May 2021 00:45:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfEqL-0007GZ-KL
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 04:45:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 87E282E813A
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 04:45:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 04:36:39 -0000
From: Thomas Huth <1926995@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=High;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314 th-huth
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <162006770303.13621.18026521974059309297.malonedeb@wampee.canonical.com>
Message-Id: <162044859971.10782.6829842843897964015.malone@chaenomeles.canonical.com>
Subject: [Bug 1926995] Re: hw/remote/mpqemu-link.c:221: bad error checking ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: f9ad2f15f80ef65bc5cc97a2ad80df2b48776032
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
Reply-To: Bug 1926995 <1926995@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, I've reported it on the mailing list, and a patch has now been post=
ed here:
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg02106.html

** Changed in: qemu
       Status: New =3D> In Progress

** Changed in: qemu
   Importance: Undecided =3D> High

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926995

Title:
  hw/remote/mpqemu-link.c:221: bad error checking ?

Status in QEMU:
  In Progress

Bug description:
  hw/remote/mpqemu-link.c:221:36: warning: logical =E2=80=98and=E2=80=99 of=
 mutually
  exclusive tests is always false [-Wlogical-op]

  Source code is

     if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
          return false;
      }

  Maybe better code:

     if (msg->cmd >=3D MPQEMU_CMD_MAX || msg->cmd < 0) {
          return false;
      }

  It might be useful to switch on gcc compiler flag -Wlogical-op
  to see these warnings.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926995/+subscriptions

