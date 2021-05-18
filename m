Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5E38715E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:39:15 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisRm-0001XR-Em
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKZ-00076a-2L
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:59629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKX-00071H-Ab
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:46 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mnq4Q-1l75r248a2-00pNWQ; Tue, 18
 May 2021 07:31:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/59] linux-user/sparc: Remove target_sigcontext as unused
Date: Tue, 18 May 2021 07:30:51 +0200
Message-Id: <20210518053131.87212-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fzgVEwQgHpq5x7eUZ6n+Y9Jg7c2kJgFhZ9mPXELGNIUovVvMXG+
 fFRHH50Ins/T7+XW3NvGhUKQywVgww1xivcP/NuEehlTflrrpZw7K9lJMqGkUR9fLvOzDqn
 CEJkrGVwM8/lftnKzCf3kuQZiNpYeWFUvQgAI2/HNSf4gdP1MeelhM1e+EjKJ5X3W8Uyhq9
 uJxhytJBAJZfH/Km3TLqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:txJ3j8Gd3Ow=:bDPsAdo17l4f6gLL4nb5ck
 GpoQCVLhFR8fG6OxwrftE4DmfogOznEmSmvA7n0s7LeWtUv7gGHDmU6/AyFOZi1Gg0VZjUXO/
 +5p94pdN35VLx3VswQwlR6NUylvk+mhI81FPfohIar/6x/I9qrXnvoih49SCYm+1k//vRnjCP
 uUcwPPazhjD3ttPeyZXyyo69wMOsbtglS3jx/8a1+29wO3tz7Uo0xbMlwpM8H9NBHXjy+Kvzb
 2YZy9jPRviD3qTQw6Y1opcjYzOggVO6TfVhBSU49MuP/fgSjucrYdnylHQnAI01ysxEs5yTNS
 c2buQF4v5l/Ot1JBMxKce1itHE5r499bMgBAc2PFj1RzKNFMXtF8fX3sal7CFtXeLPE7lBccr
 bDI2g8PBE68HyR7GtgLvCuTZ3IpDK1coiAXEkIIW77z3bkW6gH1HuJ1bscoPpyTSSEmH76OgZ
 cCbEoNC3x8AUlFNL+Cp06dBBmVI5CJxkS36t/bnAYCLrh5nEdy1eaqqXuER330WLJO+tNG6lB
 lCbo4jy1wKoC0GBr/IXUqw=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 76579093a88c..3d068e095508 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -21,34 +21,6 @@
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
-#define __SUNOS_MAXWIN   31
-
-/* This is what SunOS does, so shall I. */
-struct target_sigcontext {
-    abi_ulong sigc_onstack;      /* state to restore */
-
-    abi_ulong sigc_mask;         /* sigmask to restore */
-    abi_ulong sigc_sp;           /* stack pointer */
-    abi_ulong sigc_pc;           /* program counter */
-    abi_ulong sigc_npc;          /* next program counter */
-    abi_ulong sigc_psr;          /* for condition codes etc */
-    abi_ulong sigc_g1;           /* User uses these two registers */
-    abi_ulong sigc_o0;           /* within the trampoline code. */
-
-    /* Now comes information regarding the users window set
-         * at the time of the signal.
-         */
-    abi_ulong sigc_oswins;       /* outstanding windows */
-
-    /* stack ptrs for each regwin buf */
-    char *sigc_spbuf[__SUNOS_MAXWIN];
-
-    /* Windows to restore after signal */
-    struct {
-        abi_ulong locals[8];
-        abi_ulong ins[8];
-    } sigc_wbuf[__SUNOS_MAXWIN];
-};
 /* A Sparc stack frame */
 struct sparc_stackf {
     abi_ulong locals[8];
-- 
2.31.1


