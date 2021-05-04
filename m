Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3862372ED4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 19:22:26 +0200 (CEST)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldykb-0003Ds-T9
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 13:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldyjC-0002Jy-TG
 for qemu-devel@nongnu.org; Tue, 04 May 2021 13:20:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:38866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldyj4-0002Tt-4C
 for qemu-devel@nongnu.org; Tue, 04 May 2021 13:20:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldyj1-00058c-2K
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 17:20:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D6A0A2E8186
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 17:20:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 17:14:30 -0000
From: Jannik <1857226@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: exploide th-huth
X-Launchpad-Bug-Reporter: Jannik (exploide)
X-Launchpad-Bug-Modifier: Jannik (exploide)
References: <157700964058.28040.6250427039167117245.malonedeb@chaenomeles.canonical.com>
Message-Id: <162014847062.32573.15057947450403217611.malone@chaenomeles.canonical.com>
Subject: [Bug 1857226] Re: 'set_link net0 off' not working with e1000e driver
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 1582f8614e06fb54640a6a2c17d86e05fc1689c8
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
Reply-To: Bug 1857226 <1857226@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still reproducible on Fedora 34 with QEMU 5.2.0.

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857226

Title:
  'set_link net0 off' not working with e1000e driver

Status in QEMU:
  New

Bug description:
  I'm encountering a bug with the e1000e network driver, that appears to
  got previously reported at rhbz. Steps to reproduce are provided in
  detail there:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1707646

  It is about switching off network link state (set_link net0 off)
  having no effect when using the e1000e driver.

  Version details:
  QEMU emulator version 4.1.1 (qemu-4.1.1-1.fc31)
  Fedora 31

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857226/+subscriptions

