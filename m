Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6C33C668
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:08:13 +0100 (CET)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsZY-0003Dz-Ex
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEV-00079n-Oi
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:27 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:33222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsET-0001a2-97
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:27 -0400
Received: by mail-ot1-x336.google.com with SMTP id j8so7498854otc.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYpOKcKLH+90rQBuRerzfXX/ETf/I2egL2u0VDsDgAk=;
 b=DodCnvCqPeveFHfsnHx1pGp6lpsLI1X7cpfknHUUdcbmTQC/rc71CwOXHzwanjAJEQ
 R8IAAywmIox8B5SHgLurP2WAanueeaG8+4zaSw7etqc+8emyvqpB0qIQfIBgs+LWqjm2
 u4J2ipWOQTDEpJnFwZ3Hsn5orBOcB9NOT2211Oe1BE+P4pak3MEkaBNtUBSDG8xhB/3M
 LBt60Ameh6zi8Bhi7MG6SVAsKZiJWdOM7jK5pzQY5jC5xKXMbipObSuNCX8PSfjKRACU
 W1iOuXNBsMnkS3oPF9ZZQ7vn4OPVRQ126FDHjyH3z7A27OTpKoJQ1Rm2BLjRkSojykF4
 tqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYpOKcKLH+90rQBuRerzfXX/ETf/I2egL2u0VDsDgAk=;
 b=ZC/PkDtcP9AQLWWLmbOqhAUIu6GTUaMHpTYc2lH0ZU5nUGw49rSfPYcY5Y0eOET9fn
 M+MsQwTRv0/wYmX+HsxtiTg4ABSy+T5wI4n15TBHaYjOLe/HpLS1UhDqJa4o9eJUR8oV
 6c+Hso30ATiZzqpMLdgfvq/x202RTfqBnjWJMvDdqPTpXgjb0dEsnyzTG5g0esiTCPa5
 CiV3UkZyX9Z8EM44YWoqHsBlkxByuryMwuXk3rVAi+bE9XL/5RqZchYU/5s4K3r7dxH4
 +yE+zm4aEnohT4iPl9hexWGOiFzjpZW72uPf51PFhEji0AlUR2ZLhsnVoa7iWYDpONX3
 D/NQ==
X-Gm-Message-State: AOAM533MyL6QyuF9JA3ITUQ0DdD29+r0peONF8OwHQ56mDVI1gOAQAVt
 Vt+z8olgk0Ohw4pV/aeFlPEVJ2IOD50TksSE
X-Google-Smtp-Source: ABdhPJyt4zyt5cuggUCbnMRUFpFmpQr78LgBAcTpwL4gl3wqdi3x92Pzf/8fkWBdSIn9u+R1nOWrpQ==
X-Received: by 2002:a9d:3b85:: with SMTP id k5mr381695otc.237.1615833984098;
 Mon, 15 Mar 2021 11:46:24 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/17] target/ppc: Fix comment for MSR_FE{0,1}
Date: Mon, 15 Mar 2021 12:46:04 -0600
Message-Id: <20210315184615.1985590-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per hreg_compute_hflags:

  We 'forget' FE0 & FE1: we'll never generate imprecise exceptions

remove the hflags marker from the respective comments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


