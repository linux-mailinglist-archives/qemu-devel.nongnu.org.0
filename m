Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EC54AE276
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:02:20 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWgt-0008P0-4J
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:02:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWU3-0007Uy-BW; Tue, 08 Feb 2022 14:49:03 -0500
Received: from [2607:f8b0:4864:20::233] (port=42923
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWTy-0002so-LE; Tue, 08 Feb 2022 14:49:03 -0500
Received: by mail-oi1-x233.google.com with SMTP id v67so161451oie.9;
 Tue, 08 Feb 2022 11:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PnNDqF1lFFTjoNNbc2JTk2OTTv0V8Z8TBb4IecBKnvA=;
 b=D+YrH5tWWtDVFt4KfrljHnjpgyaHhuT4Inyl3to9X3sFWzjMBNwRERR4GuihO2QHOH
 IOr4Vuuvts1KzhsLcgeRdwA8sdom61jIBZomvP6ZboM9LmfCnWcXWuSweAtlE6eUUwk2
 AcAX/bN3Jq6qEOxjKcAU+ThkasC2/Cvgbk6X2IQjAF/rQCYTaP9/rCZqlG3ALIfh0Ki/
 U6lSMGO2XKPT8e7YsvZBok1UX8KWymOdPHsocZYJ58+sw9GWUYh0uILkHDlnzW8EqFlA
 SiByXXpmspFYMF7b1acBVg7lfaLYquDUenJ7Gzkc3dG6aNCk2jEPmFApP76S5K6G66m2
 /oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnNDqF1lFFTjoNNbc2JTk2OTTv0V8Z8TBb4IecBKnvA=;
 b=0xhJrh5Xm0RBCZx4nV2g2zImLnrQVTSgSQJVpjE/R1/kezbALnvV+JdFKbOByEo+2e
 BLziAdhS1lHSkF1HM3p3DdANhQU9n53L+n4byKE8oRrKM0sQnMwbKhstO5BWcvnotG9n
 B6f0YS4ihs7nkfmWt4MbYzcmEKlBOedQ8cCYPaZLkxkQA6icm+nlORHOcCTIvzkMv7FL
 S/nQAtJEbYek6nFaX0MwKglMV2QeJpBUncbCCBi9r2/i6r6MfFBqwcB4p0R8+m4SiCmf
 1sYm1HuFNTNEQGIU0G9ZI+UPd+eHG9o8dNvHPDUhpZ5phSoZpKl9rttf1d432Mzuy6/I
 LKcw==
X-Gm-Message-State: AOAM531OUyGuCadnkfuZy5DVvBdyMQl1kvjsmBcu59jYpncnZKzeCRzm
 a2hXXsj4OJD2lbJ51cVyl1rnMSzQe6Q=
X-Google-Smtp-Source: ABdhPJzE94EZN3+x1S6EYfZIDVIXV5l/szxUXi6HtQXey+NCA9QfANp+IqFv0kI5+p4b0PMvsHPX8w==
X-Received: by 2002:a05:6808:1983:: with SMTP id
 bj3mr1236687oib.313.1644349737070; 
 Tue, 08 Feb 2022 11:48:57 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id s14sm6012592oiw.42.2022.02.08.11.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:48:56 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 1/3] target/ppc: fix indent of function parameters
Date: Tue,  8 Feb 2022 16:48:36 -0300
Message-Id: <20220208194838.169257-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208194838.169257-1-danielhb413@gmail.com>
References: <20220208194838.169257-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix indentation of powerpc_set_excp_state() and ppc_excp_apply_ail()
parameters.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c107953dec..8a49a4ab90 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -265,9 +265,9 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
  * +--------------------------------------------------------------------+
  */
 static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
-                                      target_ulong msr,
-                                      target_ulong *new_msr,
-                                      target_ulong *vector)
+                               target_ulong msr,
+                               target_ulong *new_msr,
+                               target_ulong *vector)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = &cpu->env;
@@ -362,7 +362,7 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
 }
 
 static void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ulong msr)
+                                   target_ulong vector, target_ulong msr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-- 
2.34.1


