Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C03C9759
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:27:12 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3sxr-0007Q2-S1
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swT-0004qC-Q9
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swR-0000FM-Fv
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3swP-0007dk-D3
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5D0832E813A
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1926782@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse janitor th-huth
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161979514177.9618.12499713444538330547.malonedeb@gac.canonical.com>
Message-Id: <162632264063.31721.1026052348407128532.malone@loganberry.canonical.com>
Subject: [Bug 1926782] Re: configure script --extra-cflags not passed to
 config-meson.cross
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: a202bdbad1586833ef53cb254c266ae191036b64
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1926782 <1926782@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926782

Title:
  configure script --extra-cflags not passed to config-meson.cross

Status in QEMU:
  Expired

Bug description:
  Since qemu 5.2, when building, the configure would not finish, but
  would return this error instead:

     qemu ../meson.build:852:2: ERROR: C header 'sasl/sasl.h' not found

  This is for a cross build, and I invoke qemu with the --extra-cflags
  and --extra-ldflags containing all the proper paths to the headers,
  libraries etc. It worked properly with qemu 3.1 to 5.1.

  After looking into the configure script, it seems that meson is passed
  the CFLAGS environment variable instead of QEMU_CFLAGS, and only the
  latter contains the --extra-cflags argument:

      echo "c_args =3D [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross

  Using the CFLAGS and LDFLAGS environment variable instead of --extra-
  cflags and --extra-ldflags fixes the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926782/+subscriptions


