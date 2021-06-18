Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A533AD022
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:13:17 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luH7M-0002bI-9w
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGvU-0001a8-9p
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:37042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGvP-00045g-Ht
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:00:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luGvL-0001sc-L3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 16:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9D3F62E8087
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 16:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Jun 2021 15:53:34 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1858814@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: edk2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157849903743.2804.3996411796742068143.malonedeb@soybean.canonical.com>
Message-Id: <162403161547.11705.7985024734748931188.launchpad@soybean.canonical.com>
Subject: [Bug 1858814] Re: 'make -C roms efi' does not update edk2 submodules
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 7a9327abf1ce0f9308d911c2be75dc9466ff382c
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
Reply-To: Bug 1858814 <1858814@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: Philippe Mathieu-Daud=C3=A9 (philmd) =3D> (unassigned)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858814

Title:
  'make -C roms efi' does not update edk2 submodules

Status in QEMU:
  Incomplete

Bug description:
  On a fresh clone, 'make -C roms efi' fails because submodule is not
  initialized [1]:

  /builds/philmd/qemu/roms/edk2/CryptoPkg/Library/OpensslLib/OpensslLibCryp=
to.inf(-1): error 000E: File/directory not found in workspace
  /builds/philmd/qemu/roms/edk2/CryptoPkg/Library/OpensslLib/openssl/e_os.h
  - Failed -

  Laszlo suggested [2] it is possibly a regression from commit f3e330e3c319:
  "roms/Makefile.edk2: don't pull in submodules when building from tarball"

  [1] https://gitlab.com/philmd/qemu/-/jobs/395644357#L436
  [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg668929.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858814/+subscriptions

