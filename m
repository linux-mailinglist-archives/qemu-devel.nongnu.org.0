Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD6230A4E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 14:35:50 +0200 (CEST)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Oph-0005w0-LV
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 08:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k0OoZ-0004c9-AU
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 08:34:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k0OoX-0001rS-Jz
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 08:34:39 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N8X9L-1knIHA3k1J-014TAY; Tue, 28 Jul 2020 14:34:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Linux user for 5.1 patches
Date: Tue, 28 Jul 2020 14:34:29 +0200
Message-Id: <20200728123432.501354-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fcmWkIjMJNgZToDqYuIDIuS7y0Bs8Dtge+/XUrIW5ocEj1EqJ+o
 ESJ0xLp9VsF3ePPlIP5gmGmyV3WkN5+g0/jf3lleH7vibpg1Wu1pbIvDKMshSzfBAZccmAR
 4f6QOMVrY5r2v1BQ0MONWI7tIXBLpUNwCs7b0dW+phMKvYJku5oapp2SA1BNZrnDDt3GYb5
 jI1SoLqdrELRhwjvMWCKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:URZRxqmIbPU=:GJmMMjXt2BtkODP+egkGP8
 iVDyWsZgJc3niPeeZTPgkSihokFFAMuqFAyUvmNqMZVHCt8n4hXw/egpeB53ZrFryoEih/sbt
 VU4HcKxqQbB3CLT827QEVg3QHRsiySRFNlYpefYx25fsagPay5/+sXUMOzgxKmWVbKJeUkvgD
 UHCZ74rIkF5zwxhpSgq00L6TI8jZdVYSPFBZBqHJlL0bRQPgRYFdUikb1fcnJYrMB7sTy72Nx
 Cl/LY5TGUX/AGUNn7wJ3meKiitG7cWxbgxem7dXvuFdFpTLAf/kIrxVhMdsZoXt4OEykHQ33e
 hs67HhdKYXVwEAE3u5pqnVtPls4OZm8e6R0XJwArGxflljggZTWxWq8LKOrrRaa1XeKSnxP3V
 2GPK6ijF6FG5wxSwt2LNgFR18IxGEQpNjaVefE4qbJKvHjVgpImefCYOZ5FSs97KMP2IkvuNF
 1XErQxKK0F4vqNU+3w7Zd4duJAXNBu4xYEYmiTuyWaLcx074Okl15iuVxqcmSZpTiw4RTc6yr
 bCXw0cnfriufUGPOPwbdUGayzlttTbf04G1OztTeRo6ggs9oLej6Pz3gRNv85uUzzDioOYth/
 jqii4/j7X1cw8UYWbi6is41v/BNSfque65sncNfpX8Ej6HcOa3NnKJUwgu1ifBdp83ID2Krkp
 cosUVTj/Y6r7B6xmZyeDlNlF1DuaXF94r1W0uGexFpnpticRGazZYIcEhQgYpE6FsZ7RpYkG+
 WGIA2roi/jKz5X82LBd0+QMH5A+582+eIq4jG1hBSSTrIool/sjdidXadNoHeLibbkl8a+Zl2
 Z6gsUZ7Dq9c+RCGPOCOpSsNAmmSUyv0jEmc/zGj1+8Mlch8zwHw4MNDYT2sixzwHBWm4U2D
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 08:34:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

The following changes since commit 9303ecb658a0194560d1eecde165a1511223c2d8=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20200727' into st=
aging (2020-07-27 17:25:06 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-5.1-pull-request=0D
=0D
for you to fetch changes up to 0f6bb1958f3aae0171996941df7fb7ea7536bb12:=0D
=0D
  linux-user: Use getcwd syscall directly (2020-07-27 22:05:34 +0200)=0D
=0D
----------------------------------------------------------------=0D
linux-user 20200728=0D
=0D
Fix "pgb_reserved_va: Assertion `guest_base !=3D 0' failed." error=0D
Fix rt_sigtimedwait() errno=0D
Fix getcwd() errno=0D
=0D
----------------------------------------------------------------=0D
=0D
Andreas Schwab (1):=0D
  linux-user: Use getcwd syscall directly=0D
=0D
Filip Bozuta (1):=0D
  linux-user: Fix syscall rt_sigtimedwait() implementation=0D
=0D
Richard Henderson (1):=0D
  linux-user: Ensure mmap_min_addr is non-zero=0D
=0D
 linux-user/main.c    | 16 ++++++++++++++--=0D
 linux-user/syscall.c | 13 ++++---------=0D
 2 files changed, 18 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

