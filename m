Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8D3EF940
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 06:27:22 +0200 (CEST)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGDAf-0004dQ-Aw
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 00:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGD9G-0003CH-9d
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 00:25:54 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:45488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGD9E-0000M1-EL
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 00:25:54 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 583CF3F606
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 04:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629260750;
 bh=4OXuDfdI7ZznuM3UFCg5tWAD6vACBSUuxCgH8cxZ+Ow=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=r37SvthwyydzQ/0Zd5CQTgYbD5vVydWZZ4E7N9ALbsmn2H7ffhIeId1GZGGoW3rUR
 UHMlPtUJLS8V2YdTWhiZ9SZYtAw5GjajvDqRceVpoIAKbbbSsbZnd+A1l+UYPWRR2w
 g8+Ha3zoDJ5Uadouo7+8Xufmlto7WCuaWq7IrFimSLn3cnfdg329X1l18VW0kEGUSj
 7aCWaluBMZtkfvdj+k+qSaurYLVoZMBMcNcANS+nJogJ2QQX+OZXLRbHWM0MT0HQ7N
 s0DfhSLU0mGUKoemHwkC9gjHw+xXgN7jMgJQOZULmqj/G0UZ4o6nUYIzzqTp755xXu
 p2vAA5OOskqHg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F1FF22E805B
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 04:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1858814@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: edk2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lersek philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157849903743.2804.3996411796742068143.malonedeb@soybean.canonical.com>
Message-Id: <162926024020.26802.6333978812445274164.malone@loganberry.canonical.com>
Subject: [Bug 1858814] Re: 'make -C roms efi' does not update edk2 submodules
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b08a7ac7ee9dae6cca70a44dbdbee2a2b52e9053"; Instance="production"
X-Launchpad-Hash: 345b79ba543450d285f97b1d202a5c5f0b1d19dc
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-To: Bug 1858814 <1858814@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858814

Title:
  'make -C roms efi' does not update edk2 submodules

Status in QEMU:
  Expired

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


