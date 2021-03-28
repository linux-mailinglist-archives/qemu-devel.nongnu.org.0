Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA634BD22
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:09:17 +0200 (CEST)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXyW-0005yE-6x
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQXvp-0004ZB-1f
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:06:29 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQXvn-00072S-84
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:06:28 -0400
Received: from localhost.localdomain ([82.142.14.126]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2Dks-1ld5eq1vry-013ghr; Sun, 28 Mar 2021 18:06:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Linux user for 6.0 patches
Date: Sun, 28 Mar 2021 18:06:17 +0200
Message-Id: <20210328160619.4015954-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kwLgPI+yPHZhKVRj8S0sZQUPICRwCb/F4h2+x3ysZQ4UUnmqG8a
 e9/Mnzx0LOJi2bQ9Kx/35bYxlkhRCBSFct1eOukO5GgLo++4EkexScG5unpgnBiNSMh6Eag
 3M6tYzxfk2NyMZKrFqSOU4AGiQCyxoFlFKnvTIvRRs5JjvVrxTpbH9FgQfBwg9FZIzLl9E1
 up1dUFrMAmSMQ1/f/uDpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpSLRy2Dgns=:9kknOxLKXs7BUWeENHeWSc
 LJy/VOpRE/PPfGnC2Xya77OMOYCRAIebfX3naZ6y8ZT8tm+Otrh+MUr2dWj/IcH2OtzofVfnI
 JOw7IEGE90SzngGIg0yvPmuIA+bFZWJ1WnB6l1s2G5uGS4rD/ArLC9ueb1Yu/LNPrfijsv4vM
 RERm6RASv6w9fu21VvQDjoGNvons8Wiozh2YMLpbitXQJUPZxC+T8QfN7DmHYDXQNj3r5Hm9n
 ZNnc43byycE1ngTmT4NsJdTbDDTIJQswatCMKxO+RLlkokQM89cL5bDo+giYX4vBxKeSktgsR
 wdZ2cMi7d+Kj4uDAPd2weDie3e5IFTY4WutQqWFxRJ55V1tt3iy6gcNim9euWjUHWVIGKlVra
 4qX5gzC3IP4YVk003gDmtNsh3xHrlGBRPJXMc4fb8rZUgM0SaQzlDX/1uBnPiOMUMTKnglTlL
 SVYAA1/ynysxLWRrIUwChNlyD4Dmw5M4f+TugIUGcurkZQd8DA/7
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9e2e9fe3df9f539f8b6941ceb96d25355fdae47e=
:=0D
=0D
  Update version for v6.0.0-rc0 release (2021-03-24 19:50:49 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 4a1e6bce2308b720d79d5ea0a3d24501c89bd80c:=0D
=0D
  linux-user: allow NULL msg in recvfrom (2021-03-27 16:48:45 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210328=0D
=0D
- Fix recvfrom with NULL msg=0D
- Fix sigreturn address on s390x=0D
=0D
----------------------------------------------------------------=0D
=0D
Andreas Krebbel (1):=0D
  linux-user/s390x: Use the guest pointer for the sigreturn stub=0D
=0D
Zach Reizner (1):=0D
  linux-user: allow NULL msg in recvfrom=0D
=0D
 linux-user/s390x/signal.c |  5 +++--=0D
 linux-user/syscall.c      | 11 ++++++++---=0D
 2 files changed, 11 insertions(+), 5 deletions(-)=0D
=0D
-- =0D
2.30.2=0D
=0D

