Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C323B9CA7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 08:58:02 +0200 (CEST)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzD7i-0001sr-0q
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 02:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzD5a-0000Is-0E
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 02:55:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:56388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzD5X-0000T6-Qq
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 02:55:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzD5T-0005EX-U7
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:55:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B27992E8180
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 06:55:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 06:49:29 -0000
From: Thomas Huth <1703147@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: duanev janitor pmaydell th-huth
X-Launchpad-Bug-Reporter: Duane Voth (duanev)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <149954874338.15421.5827897782818416258.malonedeb@wampee.canonical.com>
Message-Id: <162520856999.25411.12031877015689184903.malone@gac.canonical.com>
Subject: [Bug 1703147] Re: Xfer:features:read truncating xml sent to gdb
 frontends
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 89924594aa6b0cf8d64806781c50a3c9e3cea95b
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
Reply-To: Bug 1703147 <1703147@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/458


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #458
   https://gitlab.com/qemu-project/qemu/-/issues/458

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1703147

Title:
  Xfer:features:read truncating xml sent to gdb frontends

Status in QEMU:
  Expired

Bug description:
  Around line 1326 in gdbstub.c:

              if (len > (MAX_PACKET_LENGTH - 5) / 2)
                  len =3D (MAX_PACKET_LENGTH - 5) / 2;

  is truncating processor reg description xml files longer than 2045
  bytes.  Deleting these lines works for my immediate need, but they
  seem to be trying to fix some buffer overrun condition so I won't
  offer a patch until we understand their purpose.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1703147/+subscriptions

