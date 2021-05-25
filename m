Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BFD39056C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:28:14 +0200 (CEST)
Received: from localhost ([::1]:42054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYyb-0003NQ-GN
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYb3-0002Rl-2R
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYb0-0004FT-2X
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so13021175wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GaZQeOIzuyLo3zicYK1Ozk0rRMl1jpH+sIBVMVCEWdk=;
 b=Eb/sEa/bDHqI7Tl/dmqRd8xdOpoUQNCR08eYzfFc7lwt+mNm2rJ0hG06DR6+f1oMiw
 bP2iezsaUJcXQ21lgXrE0hkus47fyf4Xzi6szptgoWjY2PepaJhCkm6JFrQtZk90tdFI
 L88MRNewsRfeRJ3W4BTYKz3yVl/AQYmlYKQWECfxq93kVCYhWfHjiK9tnOAFdjsL6EN7
 PZR3M/trFu146GtXsUFGarglp7e5plnVPsjPdUCzL5Jo4/c88/rVbqZkBI+rZXTfbqqY
 dB2dWJzRJSqEw/+Prri/pO1hIqpkPbNRKsqlmnXjt4HtdY5Yspi3J+nG+OwOPfqFsteP
 668g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GaZQeOIzuyLo3zicYK1Ozk0rRMl1jpH+sIBVMVCEWdk=;
 b=XUDhVa24Mfn/xdNhsGeCPc/qBqtAgqVxNeC0+myMpBX5HuWK5pfGWQsm9qszj8xgv3
 R2fA+pVlM+x+s3CddjM/7+ysdfT6V/MyQrn0/f0vOGEumRghLtuIOXeHrlPb6dp9g/zp
 o/TA5mrS8O30yEI7U6ricPSxnejOUPxMQwwQJV0UNgzyu4Dlxh+khaKfW9PaRmpTFzJP
 Jm0fyVuXQ+PnjlIkZxcHK+obBDD0CHkoxUQMsJgkRD8ViG73hWX4T1CDMer/TaQB0iev
 bgYr+TbBC8YLfRpBhAxcjXDuRTl7DmDwqX40dNfFJjn1hpUoVZYGGRkFC6B9ZcbX2GWb
 RPbw==
X-Gm-Message-State: AOAM532CLfMLRMdYHN8oj3fRy0gI8UjSLJNn/SCRYIifx1fxlC4gdT/R
 tOeSuiRYj5BfTzw9CAY79pkirnCuUXDEJjBv
X-Google-Smtp-Source: ABdhPJwd+V0XUz3wkj0tTIeUyffmZm/Wze4Tl0ngY7GZPjZs6ZGapKTu6h62UbUHpzTmnin9TN400g==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr4495061wmj.115.1621955028654; 
 Tue, 25 May 2021 08:03:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 023/114] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
Date: Tue, 25 May 2021 16:01:53 +0100
Message-Id: <20210525150324.32370-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Will be used for SVE2 isa subset enablement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 16 ++++++++++++++++
 target/arm/helper.c |  3 +--
 target/arm/kvm64.c  | 21 +++++++++++++++------
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7986a217acd..b7ce3b1e89b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -947,6 +947,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -2034,6 +2035,16 @@ FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
+FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
+FIELD(ID_AA64ZFR0, AES, 4, 4)
+FIELD(ID_AA64ZFR0, BITPERM, 16, 4)
+FIELD(ID_AA64ZFR0, BFLOAT16, 20, 4)
+FIELD(ID_AA64ZFR0, SHA3, 32, 4)
+FIELD(ID_AA64ZFR0, SM4, 40, 4)
+FIELD(ID_AA64ZFR0, I8MM, 44, 4)
+FIELD(ID_AA64ZFR0, F32MM, 52, 4)
+FIELD(ID_AA64ZFR0, F64MM, 56, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -4225,6 +4236,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 59e9847133a..a66c1f0b9eb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7879,8 +7879,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              /* At present, only SVEver == 0 is defined anyway.  */
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64zfr0 },
             { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db94..37ceadd9a9d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -647,17 +647,26 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
 
-    kvm_arm_destroy_scratch_host_vcpu(fdarray);
-
-    if (err < 0) {
-        return false;
-    }
-
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
         t = ahcf->isar.id_aa64pfr0;
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         ahcf->isar.id_aa64pfr0 = t;
+
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
+         * not expose the register to "user" requests like this
+         * unless the host supports SVE.
+         */
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                              ARM64_SYS_REG(3, 0, 0, 4, 4));
+    }
+
+    kvm_arm_destroy_scratch_host_vcpu(fdarray);
+
+    if (err < 0) {
+        return false;
     }
 
     /*
-- 
2.20.1


