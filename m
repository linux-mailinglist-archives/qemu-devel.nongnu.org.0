Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD34B8549
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:14:10 +0100 (CET)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHK5-0007NA-Lr
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHL-0004Do-M1; Wed, 16 Feb 2022 05:11:20 -0500
Received: from [2607:f8b0:4864:20::c32] (port=44641
 helo=mail-oo1-xc32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHJ-00028F-H0; Wed, 16 Feb 2022 05:11:19 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so1858219ooa.11; 
 Wed, 16 Feb 2022 02:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EpGEy8fDu3EubxFFZaGiLhh8nzXGXNhzkEkvUY5o5LI=;
 b=XJ+jGUCe1KywNjWWLE0K9eLtLpJziYk/8RGaWyp85SEbILKon59ZAVCnHgdljZ22vF
 V8bepRSQQfwUdETxGxp4ZcKuchL3UD4igK7ZqHQ3LhIS0Sv66cQYYfWIeWw/v2i+5KoF
 rB1sRPwuiJdO8EslLpFA+6iJYqnSXJwj7VvSumBMHHaepVOg4T3WZ6WdKGf5TCTZgLeC
 GOEREiJ/kBa82YuXyQyWusSEgulC7n5Fe5eCGuwEyr/vp9ILH8kQ2sdONCCHJWunCsdX
 CO/+AKDBILpVrgkcZlLnhhiLpLRBINqwS56WZBPGcMBeuRcTw3AWZYBaG1v2bXtLPxeC
 oo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EpGEy8fDu3EubxFFZaGiLhh8nzXGXNhzkEkvUY5o5LI=;
 b=y2FJ4hOlCHOEyK2s+WX2VBeN9sOi+kBzxyD6G1fSGxYULWYj79LesyEnaFuEYb6NHe
 Ct1ocr6Z5Rm/Exj1rmu64LlARo/+GjFz+FgJ/qTKw+nHaxI06/i9kFN5VK15wwbWBLaX
 tueW9K6KVR5w1kFYCMsSi60oHwrvqLydyyhIKNKcQvvxCMqQEZDP/wHyKySf+1jsrPbQ
 9CTDa8pch/3v3KEq8yCPVK/mWtbjUOMvK3tkZ73qdcF8fjgzoY4bZWvcR0b6AqcFKMIa
 PGkSzm3q1wCv2TlTVQBJ+ZaczMZsu0M8I2sVnE7Oj1A4DmgZhsDT3mCnRj2zpOQN2ZpD
 2L1Q==
X-Gm-Message-State: AOAM532Jvji2+7vhEE8irDycBWubiNaJvBmF6Q2UyGog9A/4+3BEse6N
 1g18Tm8Y4Kj42t/NXV95EjPHXDc6TIo=
X-Google-Smtp-Source: ABdhPJwx7YUODW23xDh+stULtom135pF9d/qIFCLYWzKQH12EGvEEWtL0pkJjMC3Yn0XNmt+2aDQEw==
X-Received: by 2002:a05:6871:4182:b0:d2:808e:c293 with SMTP id
 lc2-20020a056871418200b000d2808ec293mr206485oab.302.1645006275251; 
 Wed, 16 Feb 2022 02:11:15 -0800 (PST)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id
 y1sm17612689oad.38.2022.02.16.02.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:11:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 1/5] target/ppc: fix indent of powerpc_set_excp_state()
Date: Wed, 16 Feb 2022 07:10:58 -0300
Message-Id: <20220216101102.179158-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216101102.179158-1-danielhb413@gmail.com>
References: <20220216101102.179158-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fcc83a7701..bbc75afbc0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -361,7 +361,7 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
 #endif
 
 static void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ulong msr)
+                                   target_ulong vector, target_ulong msr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-- 
2.34.1


