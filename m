Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB743759B9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:53:51 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiC6-0007iR-KK
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehzq-0007LV-9R
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:41:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:40252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehzk-0007r0-06
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:41:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lehze-0001bi-M1
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 17:40:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8BC1C2E8189
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 17:40:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 17:31:36 -0000
From: Thomas Huth <1873335@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: epistemepromeneur ruthan th-huth
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158706530687.6368.4226982042682182002.malonedeb@chaenomeles.canonical.com>
Message-Id: <162032229623.14052.9347785479374526247.malone@soybean.canonical.com>
Subject: [Bug 1873335] Re: Dos Keypad is not working for numbers - numlock is
 not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e0053712a325bc06cd3738c663c62e339ff0696b
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
Reply-To: Bug 1873335 <1873335@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/204


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #204
   https://gitlab.com/qemu-project/qemu/-/issues/204

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873335

Title:
  Dos Keypad is not working for numbers - numlock is not working

Status in QEMU:
  Expired

Bug description:
  Hello,
  i tried to use Qemu 4.2 for Dos, but there is problem what in Dos is not =
possible turn on Numlock for input numbers, so games need it.. Numlock only=
 working as arrow keys.
  =C2=A0=C2=A0I tested bough Windows and Linux builds.

  With same setting, when i use Windows 98 or later os, numlock is
  working fine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873335/+subscriptions

