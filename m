Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA73725A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 07:58:57 +0200 (CEST)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo5A-0000tv-NS
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 01:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzw-0005DO-RV; Tue, 04 May 2021 01:53:34 -0400
Received: from ozlabs.org ([203.11.71.1]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzs-0004fV-4L; Tue, 04 May 2021 01:53:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK1xKvz9sWW; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=O6avjl1hbr3lZtelooLHSiYSY2uVa/zlg2sxWvyezxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=He+sCNp9Hl2ol6wKSm+dt/YzhwrYaEQANl4sp9wt0kPVIa2zoCAVLW/K/+CUiyCs7
 fsetEw5M+B0Ewk2ypVFZ1qc4jjiR1LWwYj4VKpFdvHeJ3XS0Ty6orUlB7ISFSQ3TZo
 KHm08wSDDe83MVnoRczgsw7+Cgea5Lgh1iECDXzs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/46] target/ppc: Fix comment for MSR_FE{0,1}
Date: Tue,  4 May 2021 15:52:33 +1000
Message-Id: <20210504055312.306823-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

As per hreg_compute_hflags:

  We 'forget' FE0 & FE1: we'll never generate imprecise exceptions

remove the hflags marker from the respective comments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-7-richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 79c4033a42..fd13489dce 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -322,13 +322,13 @@ typedef struct ppc_v3_pate_t {
 #define MSR_PR   14 /* Problem state                                  hflags */
 #define MSR_FP   13 /* Floating point available                       hflags */
 #define MSR_ME   12 /* Machine check interrupt enable                        */
-#define MSR_FE0  11 /* Floating point exception mode 0                hflags */
+#define MSR_FE0  11 /* Floating point exception mode 0                       */
 #define MSR_SE   10 /* Single-step trace enable                     x hflags */
 #define MSR_DWE  10 /* Debug wait enable on 405                     x        */
 #define MSR_UBLE 10 /* User BTB lock enable on e500                 x        */
 #define MSR_BE   9  /* Branch trace enable                          x hflags */
 #define MSR_DE   9  /* Debug interrupts enable on embedded PowerPC  x        */
-#define MSR_FE1  8  /* Floating point exception mode 1                hflags */
+#define MSR_FE1  8  /* Floating point exception mode 1                       */
 #define MSR_AL   7  /* AL bit on POWER                                       */
 #define MSR_EP   6  /* Exception prefix on 601                               */
 #define MSR_IR   5  /* Instruction relocate                                  */
-- 
2.31.1


