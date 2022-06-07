Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F495419B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:26:50 +0200 (CEST)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygiu-00016j-Jr
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfte-0000Nm-KG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:50 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftW-0007TZ-K8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:50 -0400
Received: by mail-pg1-x529.google.com with SMTP id g186so8076296pgc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lr8nU07ATHOfF6fXY/tNxkqqDhGq3qxiduBu16rymxM=;
 b=NV6/dE+rxePGYSNNSPx0QSoT9PYlQKsOvAAYE9It/RcORdGiNZiKJf+YvBNdykBatE
 kjeTFKW1aTTZf6Z0fLwcdnQPtkBNJTuYOhezoM4xbk4leZxZwIjAmieboJgT0vlYZTJs
 mj/WQWCRKzZeTXJkNgPlCz05aTXCPNOdlHZGRfYu9rQPA+DYNndOZFq5PDK+fIy1OMiK
 /jcEHDAqe5W7G3RhbmMmxvKATbNjkTFqiR3/G3945A7RvIuHDD9S2txCpjOR141X5NUv
 FKzH3dlWp17FdAe6T1JS7Ps/mkJcIKbvu5gRURsukvkinJzH6Y+M2uSzuNloUoVTs+R2
 9hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lr8nU07ATHOfF6fXY/tNxkqqDhGq3qxiduBu16rymxM=;
 b=l0ULRnZ+7mbZ1fPSXovyGdueTpCxgtWbJRughM//2vg+LQcZRayOO3W2Fq2VwZbSK4
 YBcPSwgcgEYukDxihgD5DQTLPejWufGy97HDNK3brm5R3iZyFWxDwluPJx/FZqaakZ/m
 HJIpgZQs1feokhF+se1lNWJJfZJ5GOZ4Z6BcgknMqt89zaBe6h6/vDgJpNvLyqL+1+l5
 XXDqgb5p0Yf6s7rIbMRrTSFKv/ezVyGIVmcyFZKyMfAlK8yB8qiwiW6PHA4oYWvMQ9qb
 ownjyjXx3AklTOYeEc7MzCTNIDYYFRWhrwLMx1mt5nWrLskH7ntTsJsntZMJNi7N+Zqy
 4K8Q==
X-Gm-Message-State: AOAM533wTonuNWO1JkATvdatdFgN5LuOAawRXw/AHF9UpOaI9pY1AnGw
 OO+rMeUiPuY3gbyibL4y+e5chaVRhMqbig==
X-Google-Smtp-Source: ABdhPJy+1ZjyMMzUyYRTZu+11oq9JszN1lp0fgReFYZxgmBikQYtXiBQe6xuGYFixKkFky3s7fTV1w==
X-Received: by 2002:a63:480c:0:b0:3fa:7277:bf34 with SMTP id
 v12-20020a63480c000000b003fa7277bf34mr27186216pga.35.1654634020767; 
 Tue, 07 Jun 2022 13:33:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 36/71] target/arm: Unexport aarch64_add_*_properties
Date: Tue,  7 Jun 2022 13:32:31 -0700
Message-Id: <20220607203306.657998-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These functions are not used outside cpu64.c,
so make them static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 3 ---
 target/arm/cpu64.c | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 25a77ec676..8a89548cb9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1097,8 +1097,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
-void aarch64_add_pauth_properties(Object *obj);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
@@ -1130,7 +1128,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c5bfc3d082..9ae9be6698 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -689,7 +689,7 @@ static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
 }
 #endif
 
-void aarch64_add_sve_properties(Object *obj)
+static void aarch64_add_sve_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -752,7 +752,7 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
-void aarch64_add_pauth_properties(Object *obj)
+static void aarch64_add_pauth_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-- 
2.34.1


