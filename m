Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0D383C50
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:32:41 +0200 (CEST)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lii2g-0000RZ-C6
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlS-00065L-Al
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:50 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlH-0004R1-L2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:49 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MgNtR-1lGmvq23J9-00hrwH; Mon, 17
 May 2021 20:14:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/59] linux-user/sparc: Remove target_rt_signal_frame as unused
Date: Mon, 17 May 2021 20:13:45 +0200
Message-Id: <20210517181424.8093-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BwlfnC64NEJlz4qHut/WAaHeQIyWA/qbhMafmv/KGVtKYplKIsX
 7vqcghO50YNSkrwjJxdkBFoE7tseqxqHWVy1/9Xvvku+q//nY2sCX8x8mZKrxNQZ0DopWFh
 30NRBB/h7LlV6Bf6uuTo6N2WrubzrOc+abEsQ3sn/3CSjrigcQcWYQUE5cNkHQ7J208Ws1r
 ns5P7czxMMvQBrefTD+4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0NecXZrqtI4=:dpu1kQlkKO7wQ4j9b7F3Qe
 qD5J3t3jonnVn1CSGYxaaZQOMMHN6d+i8FIOJR/2OFLi6JQMqYKSDu6zc86vRp3CLNR0jBmqL
 z6N2ken3ylf+MFibJrRymx2lrDkmoGQvZeEwvhCtvVkN9LRhLc+3cH96AS8gcFxCQFskIw/bs
 ZO+Z7R9sBwmN9Egsw30hVieqnR5Eh3H8AKBWcYUPEQHW7i+OTu6iebk/Ml/LoOUWpV9VRJWXE
 PPP85s5/CpUXefEeHrsICGgHxOuTsp3gL6CoWOJTt9CMtuaNHn0KRgN03Irjn4iXR7ad695+O
 N5N73w82tTzy19oOIug+8LsI2IwsDX6cKmP8U/u5bxjcCqnIXQ291AvsfZnVA2cdIhCOt0f42
 sabyS1zpZmCyS5Dsdh6xYXFKwWcEdpvzGPakJK3hkO2YxyS/ktj2wGBMzlyekE+QWFGRtqe/+
 jfm/v6kHI5MFTeVctCjWs+8YhdcDBEOmJrRCxzh4Vzk2RCRlV4SNkudym+kfcp5krFdbCWUTF
 F3YEicp7pRbKiNWxuRPeKU=
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


