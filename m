Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7835EE6AC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:36:58 +0200 (CEST)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddnd-0002ld-8B
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0007wM-7s
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:46 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddei-0006Mx-7N
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mdvua-1pC8vQ0laI-00b1nK; Wed, 28
 Sep 2022 22:27:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/37] linux-user/hppa: Use EXCP_DUMP() to show enhanced debug
 info
Date: Wed, 28 Sep 2022 22:27:07 +0200
Message-Id: <20220928202737.793171-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eVOKsC8xzl0ZnPNrXBuA0/GkPZkVucxxWiWq3qPY07w9W90+izW
 CaFfncV53HSuT6G+/ajDVuutTfUZq3JXdBiU+DH3gDlMCdGvGFL0QfAj9z0AgcIfTc6GWYN
 vpPbawx6s10NSMLuIR0qxbatNtMCIvEuMWYB5YqtRIm3pQhLUJNitEXmAhmsGVHxf74WgRG
 oUsTP2yNSrN/jGmb1hsdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DaR3/sLLs4Q=:8HprY/+FlU/SzxaasSwa1U
 tBRaV9M9F/Kw74bOSlVSUr2aRDTjCbwUhLUJ8YwvkgxZb9uCL7p3drurqlk6OPqjB+Ew6Q9sZ
 HiHvvvQBvvJnu9Ehm1S3weIGvAc3mLRly97ZSSgyXs4jjQocp+kyaHeXzDVzxm6kZ3bD6SZf+
 /2nbQS8E94p7JujmR2IfSxmT83EPrXTNdplx+4x7t52uC3XZhPOS6IpOXpB/oq49BilOxPjoW
 M2wC9n1DF671o9wJFAzqjMbylSJ/niCEUtrkU12cpS4sjxW8MgNVnp+p/j4K/Y6SJTASF+4hC
 Oo0tAqa4vsObt3UmaYRyzmHFWz/kTtvfhj6i9zU8wHaPXX5CaqU3aUXsrE/sYQwbyweThYihE
 +dORFFA10v3bYQNfB6VvvtrJUsxeLQrPHEIhuosWiDaz0MkvHnYowyLCbnQXQwxFMLXtlEDwQ
 e017fy895B6FpQTa3dPelTXCCxAMLcfr55rT0X1TvJpOmnFCGPT8t4STAB/7MgWBhG3X4m5mB
 RzrcnMVKRHLW/PhwaCLHdbdMhoVlglsbEZ1NQzZ07e9RsfWnkhcgV2/EEWGtNrdSGXZcgXCRW
 I3+0LFEShhpL1EeYAlGRARPaiKIELkJjv0VF4Alxc5L6H59sUSGTYeQ8teOPI3awOec3dB8jl
 2koAxSbKlo2O3KYrLNoqBRPEE+fd9OahPWT5PAam2UHCcNdrRaWmihAXUFoUssjP9IuRrl6ds
 pDZaY0Cquw1S44By1aAF/Ky6dDZfeJC67SIIru6tP6n2M9SLTV0lu3I2swA0DVJaMuDYimyzR
 YB0qgcn
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

Enhance the hppa linux-user cpu_loop() to show more debugging info
on hard errors.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-6-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 64263c3dc406..1ef3b461911c 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -147,12 +147,15 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
             break;
         case EXCP_ILL:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_PRIV_OPR:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
             break;
         case EXCP_PRIV_REG:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
@@ -171,7 +174,8 @@ void cpu_loop(CPUHPPAState *env)
             /* just indicate that signals should be handled asap */
             break;
         default:
-            g_assert_not_reached();
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
+            abort();
         }
         process_pending_signals(env);
     }
-- 
2.37.3


