Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028B50FDA7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:52:22 +0200 (CEST)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKg2-0006pP-3J
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaC-0006KG-6b; Tue, 26 Apr 2022 08:46:20 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaA-0007D2-AD; Tue, 26 Apr 2022 08:46:19 -0400
Received: from quad ([82.142.9.138]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7bND-1noZEu38fd-007zxj; Tue, 26
 Apr 2022 14:46:13 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] target/mips: Remove stale TODO file
Date: Tue, 26 Apr 2022 14:46:08 +0200
Message-Id: <20220426124610.639614-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426124610.639614-1-laurent@vivier.eu>
References: <20220426124610.639614-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jXV4HkMsm15ucqLXV6DMOV8Iivp+GGn+wfz9h1QZ9gcS5fXoPqP
 w1FKx3r0csgs5vbBjR2rEMpGGZFdupLqdqKIalvjIZY7oabbTCSH16RVYvU1ATBPXvRgpTt
 kbo9JDZDR/GXqwZD+8vSvngOIvWFXvC1cCAm29SWN4mogFqflzXKlB09bAG556vXhTUe/an
 3XS6zYU7rAKrvCCYlNjYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ew6NugmkP7E=:wWGwGojYQPKSuUgqzrbfct
 6fbdEEliVIonXldHpL3uztosq9KzjRYkwzq38jYRK0O1OT28ZT2iAn80IDKUVUv/4J7t0uibR
 ntidsy7hjVm8bvKE/itrQVxM5BTWvb7lTkkTCszMOiWnEWtcszwkAUzniGxTzJDuFgy/G5Fkw
 j8RRrHURFV6swQeBHb5vU/6Ndv32Qb05j4FfS+DxkI+0jiK86+bzrz2hVHUjzqCREfz5wHcnI
 Yw1PX6lSh606wAld8XVYiKeO3dMhcCPuI6H+byxflYwe5SZDjrmN+qeqxYyALNBx1THlP4iF3
 rgX2BKIBmh8CGPVDJMhnOW5t5Dqy2BbtMrPJ4ApvVYTi5SdWvvpqzTdvKFvRTv998iODFwVbt
 YZqQgtSY7yvc74SfpejzlmRVbDH9hspsLg7BJFqCIhFKc+p9GuAc+wKVGmk4nou3sqQSaOV/5
 CRehqvYS0CnDBReAnC97LqtXmAWizfPiY3rsyTwNX1CGaLxvGIVqY3AIakG8Vaqg+phzqGbHl
 1EOAx+3chRsmIeGdZ01apz1qw2J3hWObmWv2x4WcsnLuwVzHI9OFXJ2VMFdjVu2K7qdreBWXn
 AtLCa8/NYz8LoM7TL/9uBtIssz1DZIeU4npFLRJDIUMfIDDQNVQLB8b83V2inunoiU0vuIlBr
 joheL0qIcpt960ip83vdK8ccGSwgqbanC4IvsAgTCzuMy0d8/sbVKQemywe7w5sIkykY=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The last change to this file has been done in 2012, so it
seems like this is not really used anymore, and the content
is likely very out of date now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220412113824.297108-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/mips/TODO | 51 ------------------------------------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 target/mips/TODO

diff --git a/target/mips/TODO b/target/mips/TODO
deleted file mode 100644
index 1d782d8027e0..000000000000
--- a/target/mips/TODO
+++ /dev/null
@@ -1,51 +0,0 @@
-Unsolved issues/bugs in the mips/mipsel backend
------------------------------------------------
-
-General
--------
-- Unimplemented ASEs:
-  - MDMX
-  - SmartMIPS
-  - microMIPS DSP r1 & r2 encodings
-- MT ASE only partially implemented and not functional
-- Shadow register support only partially implemented,
-  lacks set switching on interrupt/exception.
-- 34K ITC not implemented.
-- A general lack of documentation, especially for technical internals.
-  Existing documentation is x86-centric.
-- Reverse endianness bit not implemented
-- The TLB emulation is very inefficient:
-  QEMU's softmmu implements a x86-style MMU, with separate entries
-  for read/write/execute, a TLB index which is just a modulo of the
-  virtual address, and a set of TLBs for each user/kernel/supervisor
-  MMU mode.
-  MIPS has a single entry for read/write/execute and only one MMU mode.
-  But it is fully associative with randomized entry indices, and uses
-  up to 256 ASID tags as additional matching criterion (which roughly
-  equates to 256 MMU modes). It also has a global flag which causes
-  entries to match regardless of ASID.
-  To cope with these differences, QEMU currently flushes the TLB at
-  each ASID change. Using the MMU modes to implement ASIDs hinges on
-  implementing the global bit efficiently.
-- save/restore of the CPU state is not implemented (see machine.c).
-
-MIPS64
-------
-- Userland emulation (both n32 and n64) not functional.
-
-"Generic" 4Kc system emulation
-------------------------------
-- Doesn't correspond to any real hardware. Should be removed some day,
-  U-Boot is the last remaining user.
-
-PICA 61 system emulation
-------------------------
-- No framebuffer support yet.
-
-MALTA system emulation
-----------------------
-- We fake firmware support instead of doing the real thing
-- Real firmware (YAMON) falls over when trying to init RAM, presumably
-  due to lacking system controller emulation.
-- Bonito system controller not implemented
-- MSC1 system controller not implemented
-- 
2.35.1


