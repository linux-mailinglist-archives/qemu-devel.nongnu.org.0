Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C358A13E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:29:23 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgX4-0007Y3-SN
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQZ-0006UG-QP; Thu, 04 Aug 2022 15:22:40 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQJ-0002iB-Bb; Thu, 04 Aug 2022 15:22:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N5mWp-1nNKXH1B3T-017Hd4; Thu, 04
 Aug 2022 21:22:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 4/5] ppc: Remove redundant macro MSR_BOOK3S_MASK.
Date: Thu,  4 Aug 2022 21:22:15 +0200
Message-Id: <20220804192216.1958922-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu>
References: <20220804192216.1958922-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wujUiv6wx74tv6MS1YU4pSik11YX8b8zNpa5zzyrB/mNBDXv5R3
 /zdXg+OEPFfp8s8PmqFlEJYh0HiRMtimXy9wRb+lBsMA1SxWm3Xlz8scrE5/b6y3LefyOYg
 cRyxpa+Kk6vkzcKN78w02JhrDXsYpZ74krko3c7tiFoK/46YzdBMj151H74YElr6oZFNUqn
 q22lRwQ02817Etx1yF8Ng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9g4ntCPcTsM=:MZNC/yrLPYLwmHa+VVpqHO
 X5dY7GzgWrUx7BFN9f1hb1a9dvD0qmvVEnP160Vlht5Lf7OKhgAtT3IjxgosL1OvRIxPnHE20
 YUvma3w890YcFxTLmRYluNBu4GLM5EKsrJfEENiPiqBliz6+qsc1I+hSyqWgzA4t1nLko0Lqo
 ex2VZZvsLCmiB8UoiRo7HpTBvugZq6eHPwKEbs8JXnXKEeNkSOF9L80eEJ70P6z1oNw/z8fvG
 MeCTbVgETTnEpj+yVFyN1LHJS5QcE6VBY1ibcHH8mvhisIZX44XEnADC48ALKxJ2UWbKRZD/K
 fLAWXaCLm4dUskZfouGlmAL3N/50+ik5RZlTaDPU/FQgArHXQbSdxKZS3YRf4oGcp5ZGnIAfJ
 bFK/jmMWZajOyf/JbFuNLrDS3TMjZrwn9GLwDAG9ZopCkschA0Yw8bo3PPP2RiXQjQGOXHGYy
 hrl4I5VeKaWxkE+gXD8y3IQwyGiOPfF5KT0joTfmAAqukKKRzxrD64Pcw1blKBNLaDF7eAJPt
 hTmfP6LAq7CgjV1flFvCArIKcPxer61uJP3tytHCvOVK9LaUeYmxxAbUaPJ8Of/r25T26TJpg
 PJtPNBUqVLUEHR7Rz0yrOy0WFuejYSLVwCupNq6BIocVANyrv81mFJYHnif6q0ztzZ9S2VkAm
 chWcUgVc73X0rqAhxc/A1G+CcOeoISWpdwadDw58eQibvvBZWLM7s2voI1Xi/jl9Elr7hlvAo
 cXONGvNZNGKPelyAU9QKP5rXTXHBQAjjkYYAuw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220728201135.223-1-luoyonggang@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/ppc/excp_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cb752b184a0a..7550aafed660 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2015,7 +2015,6 @@ void helper_rfi(CPUPPCState *env)
     do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
 }
 
-#define MSR_BOOK3S_MASK
 #if defined(TARGET_PPC64)
 void helper_rfid(CPUPPCState *env)
 {
-- 
2.37.1


