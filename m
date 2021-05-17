Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1F383C86
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:38:56 +0200 (CEST)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lii8l-0001vI-TC
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlR-00062D-JI
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlH-0004Qy-K1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:49 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MHWvH-1leWuS06TJ-00DW0V; Mon, 17
 May 2021 20:14:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/59] linux-user/sparc: Remove target_sigcontext as unused
Date: Mon, 17 May 2021 20:13:44 +0200
Message-Id: <20210517181424.8093-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z1xx6rmZUGv7FNGN31N81HKTc7xt0hSgaJTAHgUyI/0bHxLLuzQ
 kKYPS0VuvffteZjC0QbasWOW0C7cd9SdSRgsRPFyKc+yTBk4JwT0x6BPqjzCkpsykI5/fst
 vNXSOvY2hx91Ty04GE1iQJuvyauVoTY06N6/S6FaYPFSH17jLui96AW04bm12xF6UWFgu3v
 RX6RKgtt+14hDfYcI13dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AQ3C3vF78lg=:pPEny69aGRRPCAe5Ic9yBw
 HDFGzoh/0WNndCTehxDNsQ+LAM/sGyzWMCeAoA76OFvLwkfI2fJaqlcZK+sooQAaUpkeyjPy8
 i2vc5oxwHdiRDTh06NkVYr5yXPJbn4H+lRuEmZET4tGMXabX/X/ROTcplQx+HT5GTZe89OxvH
 FZ3GIUYdCFdF6QICIT3yLLLM6Cb8EUCYrMNiKNsCz9Pa3uZor1UFF9mrqlSt2cyuAFX1IDYXV
 /A22vTLKVhz8Mdod7+Wno34Ji8BngZ1i1XdVAzNVn1U0qNyUHGOyec0S0nj7gR0MFHPh3ES8G
 ASC0/t4rhevQGlHYnqwLdVhZZ7y4Lvs0PuF9bf5tbgnQoJCwPRsnZ30qHnY5P3g6xRaVBlC30
 XKPL6p1UsVpoJ915iP4DuawJwqlDRWys9WueuI7os3HLZNuoUZFnqUWj3Yit2LtHcGlptShir
 48iBkYvGc2w5ghYiluj0BtIauZhv5oONS3A3PQRUigEt39cUvoNfiPFDI2woKl9+lVF4a/ab9
 FPWTQSAN5OAZgoEUCBj7IY=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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


