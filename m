Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82031376FE6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 07:57:32 +0200 (CEST)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfFxz-0006mO-LA
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 01:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFwC-0004z0-Vi
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:55:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:52724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFwB-0006WR-Ac
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:55:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfFw6-0005Vn-Vg
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 05:55:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E34442E8139
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 05:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 05:46:04 -0000
From: Thomas Huth <1892533@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini th-huth zdra
X-Launchpad-Bug-Reporter: Xavier Claessens (zdra)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159803097267.15754.2795655095121321664.malonedeb@soybean.canonical.com>
Message-Id: <162045276501.6280.10934225628799201652.malone@gac.canonical.com>
Subject: [Bug 1892533] Re: Meson: Missing config-host.mak
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: cf996b219ca1c9c696aa609a3c43084a7aabd04b
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
Reply-To: Bug 1892533 <1892533@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU ships with the appropriate version of Meson included (see the
"meson" directory), that's why it is not mentioned in the README.

Anyway, does any of your build problems still persist with QEMU v6.0? Or
could we close this ticket now?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892533

Title:
  Meson: Missing config-host.mak

Status in QEMU:
  Incomplete

Bug description:
  Wanted to give a try to the new build system, but a simple "meson
  build" gives that error:

  meson.build:15:0: ERROR: Failed to load
  /home/xclaesse/programmation/qemu/build/config-host.mak: [Errno 2] No
  such file or directory: '/home/xclaesse/programmation/qemu/build
  /config-host.mak'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892533/+subscriptions

