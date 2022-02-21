Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF414BD8AC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:49:21 +0100 (CET)
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5Jn-0003R0-Hk
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:49:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zM-000819-Mm
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:12 -0500
Received: from [2a00:1450:4864:20::42a] (port=36530
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zL-00010b-4j
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o24so25918831wro.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FYBsoFS6jYxOCbq7ilPQhdHOnw4wYlKCWIQ28PlrxK8=;
 b=AobexD8k7xbR6TRSKdWQZQBOrAw+TJC6FuX3QMgKdsSAOQHO1W5+MnQ+aOIV3XPXTP
 aeYrNkEvXQOrHXi9kJqPR/ZL3CV+9DbguFWvTLbkg+mPK8hA8Kua6YaCbWijEf1AqNN8
 2Ke/eMgomD9nTUOp+LUTBPanRWCPeHibgwz4VqVFYMe/PGfdrGMB8hiTQTE2UXE9R0qv
 pdIJ+cS3GuN0aC+AIByekfpZe/EWNmR+dc6MmL5tM7TFWTKwSt9qtLsIJ/60Oa3tFzWe
 F9n1xgvfZAIrkqdFu77jXWNcCqr5nFYpAKt2peW2iJWaBR39tBrZ0ORwxg0XwgHqerCJ
 z+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYBsoFS6jYxOCbq7ilPQhdHOnw4wYlKCWIQ28PlrxK8=;
 b=Szeyupvx+bun9dJeqa0zJHxQ2YPJYEb33P8JZbPCoSjYlpzdyWsJ0/oMcB3FhT2Mn6
 Pg1qL5uzVgLrOpCar8uBr8WEJPJJW6BxsaJVcilNOogYZ6T5QT8LDWL4IlVdc8NTtb4j
 ca1QQI7VVt5zhdtIDgNNvCifQYshx5NXtBkrfFSz+DlWxNYWmclyUQaJwlrUJV4KBsb4
 qw6/00xRV/a5xO3eiNNTClNqumXw1Z7qQJfo5JlRERG6VrGoOqijZhLWnCoYfBH0IkPw
 m9Op8EnIkFp/aFy4Sr3vZx0SihSMIgy/C4DcachWMdVA36FRKBVQzIWG/QjtsAj29V6I
 AX/A==
X-Gm-Message-State: AOAM533XdTb70y2qEPYrcHYqE7WsTZuM9dpOj8GWgHdiGS3tddlPKXmb
 CR1mNJfRDAPRppCSn5WoRa+ijdIgoY2ycQ==
X-Google-Smtp-Source: ABdhPJzHKih4pmsUi/nKpB/Y35vzpoDkUWw/kjgU4Iaa2lOLAbk5hKWrJxRfJoJ2cei8czJEsxTSZA==
X-Received: by 2002:a05:6000:12:b0:1dd:f5db:6c0c with SMTP id
 h18-20020a056000001200b001ddf5db6c0cmr15487429wrx.256.1645435689830; 
 Mon, 21 Feb 2022 01:28:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] target/arm: Make KVM -cpu max exactly like -cpu host
Date: Mon, 21 Feb 2022 09:27:43 +0000
Message-Id: <20220221092800.404870-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Currently for KVM the intention is that '-cpu max' and '-cpu host'
are the same thing, but because we did this with two separate
pieces of code they have got a little bit out of sync. Specifically,
'max' has a 'sve-max-vq' property, and 'host' does not.

Bring the two together by having the initfn for 'max' actually
call the initfn for 'host'. This will result in 'max' no longer
exposing the 'sve-max-vq' property when using KVM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220204165506.2846058-4-peter.maydell@linaro.org
---
 target/arm/cpu64.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 590ac562714..ae2e431247f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,22 +682,22 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void aarch64_host_initfn(Object *obj)
 {
+#if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef CONFIG_KVM
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
     }
-#else
+#elif defined(CONFIG_HVF)
+    ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
+#else
+    g_assert_not_reached();
 #endif
 }
-#endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
@@ -709,7 +709,9 @@ static void aarch64_max_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     if (kvm_enabled()) {
-        kvm_arm_set_cpu_features_from_host(cpu);
+        /* With KVM, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_initfn(obj);
+        return;
     } else {
         uint64_t t;
         uint32_t u;
-- 
2.25.1


