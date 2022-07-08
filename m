Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A256BD11
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:54:30 +0200 (CEST)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qJK-0000rW-0T
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjf-0004QE-JT
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pje-0002WJ-73
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:39 -0400
Received: by mail-pg1-x533.google.com with SMTP id i190so10006478pge.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5ee/kpTJRv70/KN+irqbHOKZ1TmVta3xQPxo1FwOpU=;
 b=m8lc/pwbr7mOPs+Mt8Ipy+vH/nDdM+Nqn1gbwlAUSUBI6tZAAXjkjlgKDBB6vq0lTg
 /JprRslQkO5G4EufQ5oGWEPQqZT2u/09UPtj4AG+/RJyYHLAhXgVO/YGiFy+EHYgpy34
 7fWedvVT0sBScEMW+LttyKyRtKi3a6xRx7nbJkDDO1ufBoIk9w8lsKsRNAzbRqz+Rsz4
 JdPIQUhJcQEo/goTJukhEldVy+iBVYc0TWXHr/818dqiSvs9OIiYWmpE0n7ATNoyONRD
 Nupm6pM8EzbH/4hqNqpa0IsnP+6IU3jifpFXfcZxppcae8PtoCMcKP5JD1lO/SKfl8Ku
 o1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5ee/kpTJRv70/KN+irqbHOKZ1TmVta3xQPxo1FwOpU=;
 b=VjHtBe+yc6Gdj3D4auEx1aZxGsvmELY87xCiK8pMtl3eNBPKcUqN+mXI03ahtdPPIV
 IqVcUqlcFGin9/Mh8uhbLTysQDNyzBv3nw4RR34gucMHShWn10sr2SGxZ76bt9Vmt0AY
 G1EX5mDXeSoaH4DalhP9/vor8SsYHPuvw9xQNu1BtjzQY3K85lsZC9lei6JP75mbV6WS
 RPT7f5LmGYMIAlqUcNnB92cyjJ1miRmuzBJhiEuffKbpl2iVnHpesIkOc7oe5v0+/VwG
 +BvPP1pT4Gu7pUy4nJw1uRBL/16wibtqEqJyhGmYs7oOKF8TwSYEUrtrqmcHOYInQQzh
 LTXA==
X-Gm-Message-State: AJIora9mT5mpqhNqcrFaRDjX+H4G7cZtOrvJDXlFTAQrlZLYJvq+uRxV
 qxMDV7CRUNVA2tENtmJOC+y/wvyp8DBoGpsi
X-Google-Smtp-Source: AGRyM1vCplbx/74qdRssZw4kFtrShEoJnmayLsaSs4RHUtx5VAxdrLo06nmgc8dtYuBtfJwhAcH/vQ==
X-Received: by 2002:a05:6a00:2188:b0:50c:ef4d:ef3b with SMTP id
 h8-20020a056a00218800b0050cef4def3bmr4224400pfi.83.1657293456949; 
 Fri, 08 Jul 2022 08:17:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 37/45] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Fri,  8 Jul 2022 20:45:32 +0530
Message-Id: <20220708151540.18136-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97..8fbe98d72f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1


