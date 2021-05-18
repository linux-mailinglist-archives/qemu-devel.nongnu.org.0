Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5C38717E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:56:12 +0200 (CEST)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisiB-0001N1-ID
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKc-0007Lt-LV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:50 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:38329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKX-00071f-Hg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:50 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLiPA-1m0PDL1xDs-00HdQ4; Tue, 18
 May 2021 07:31:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/59] linux-user/sparc: Remove target_rt_signal_frame as unused
Date: Tue, 18 May 2021 07:30:52 +0200
Message-Id: <20210518053131.87212-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pzEhl5msB69SR1LsoqWXfpcEmhm28bWZGCNObjajD4vE5qRp2rh
 7hjmXvwFhS33IFOyGAq21ravfx2HyotUI4fuxBwUQIpGULnjLkV/qsRRtYheWX2q1/fKcPh
 3cBtwoG7lPJtb34QY+Hsq3RF2J85kpCZl8umSTp0s5Jr+V00qYBJ+taReBWp83X2sYMqhGR
 XlbPIKO81tCt7ym4W2hlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z5KaRiB5JzM=:C+XKfrtCu4Q0bB+TnrZos2
 4bftf59kDiCbAJcyXp0ZToAKhEn8WlNeqZocSDCtnzjtdDDn4P8ow/C6b1iaRjBx28apYA8rf
 IUtdVevZt3UAKjTiP4LdyPVSHa0XodEQLs5aSqO7r4awihP5ot3xLSK4p7I4Z+MjSQso7tjWn
 FxNRds3vhV0Yqu92AzyfursuLmwSLeMtUvRPlfTf08qQaY2NLpkz255T7ohURq8b5fnIrZcXR
 850uPRT9CXPEUv7++w0rR1zro+kwk244TRQhxu1/RJwUfn8H0owMhvM0Y9BxJ835pnpP0ZFMy
 /wia5F1lAYbW6YKXYAKDx3wkrAAaQAWsadSsIIwXjwtmrldTkkCUC+TuwBVYagdAQhgNjSF1x
 J3W38/XG8M2LhJBI8mTaz3bFV2XoMUmG46E+M/TX0d3qYjYrlbyg4ZmfLQCpVhsFtMD1Bl6+M
 HsfEgtYNwiRoNDoOrXMRr4HgNmOYrrbwgZgMTJIxf95n0Nbtf0SjJWyVf7bLN8L/wHfrEy1ep
 nOsZFuolkpBTAwc/kXrKTI=
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

It's wrong anyway.  Remove it for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3d068e095508..29c5e3b0c0be 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -64,17 +64,6 @@ struct target_signal_frame {
     abi_ulong           extra_size; /* Should be 0 */
     qemu_siginfo_fpu_t fpu_state;
 };
-struct target_rt_signal_frame {
-    struct sparc_stackf ss;
-    siginfo_t           info;
-    abi_ulong           regs[20];
-    sigset_t            mask;
-    abi_ulong           fpu_save;
-    uint32_t            insns[2];
-    stack_t             stack;
-    unsigned int        extra_size; /* Should be 0 */
-    qemu_siginfo_fpu_t  fpu_state;
-};
 
 static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
                                      CPUSPARCState *env,
-- 
2.31.1


