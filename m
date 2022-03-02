Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D681A4CB116
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:15:51 +0100 (CET)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWK6-0001Aa-Uw
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxp-0005rJ-CT
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:51 -0500
Received: from [2a00:1450:4864:20::32f] (port=52060
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxn-0008HT-RN
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p4so1946252wmg.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a6BM5prJChWZqJQTT1PzTDgjTHURzpRa12/wyNIbx18=;
 b=DDAlN3CbmhnKG5xNfWo9TpC2VPU48k6thIy65fLnNhL4hT46OubyMN1cMVpxNXjVxr
 dDd/djwWU1qcbRa3J/7iL2reD/cgCp7HJ3gdsD0t36wQLk2lByukEiw93yjSpJUj/Rb5
 xpwRU6e8b29tMbWEGwqq2j705SWREWULQ7/DyLr97eljKdUZ5+o4Zriz6kFhg8312P0s
 Av1O7IAhAF40CrQQVs9Ir6NKGtQTQvvwi9CHTKhr0vPJc8C/6xKzJGZY3GmFXEt1EkdV
 VjkmkrxuNQFwwlGQ5qLKfMXX80aFLVPas7ebn+RGUIKgeUwA1idtnyJo+4jwGRTkYIU9
 4XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6BM5prJChWZqJQTT1PzTDgjTHURzpRa12/wyNIbx18=;
 b=du1zXppQuaTZalxflUXjD0jztEghCoTNGVk8GST56x+2OaPAIONEK7wdvqs5YkXHYO
 pVM/lCJLJIzt1w/wTwxeM9/r7pn5xeRpikmiE9B+LLXE9bE1glrAyQ8XkHTuWEJzXA+d
 BkS0uNmePgWZ8gBu9istKRGNSpH0low6caWU5YwI8m2botmE1TzNWC1eMKY09kC+3ou7
 TdZSgHS1b9kJ8hJ1KpQ+bNNJyYMbinnq3fHOx2k/86MddmamQ1xQbL04goZmea/KBvej
 ZcKAYD5NZ5U9zUOMe21aNSwiUjI0XvomeFbrPKjkYJqfFFExgaoj83wvdRiJ3tbCYE4U
 +9UA==
X-Gm-Message-State: AOAM530qS5dkLREzTUqH3vyUm0GEhW4LwCa60CZ9o2zTFoz3IXnhoaC4
 sB2lxbHKD83ArUYder64EfuB/I0ueW6EUw==
X-Google-Smtp-Source: ABdhPJyoLerY6sdVig9RINJO4OhnhklUFUM4wALPK7lAJw6r/ZQe2R1tacwVFjdRdeR6DqzomQHnCA==
X-Received: by 2002:a7b:c207:0:b0:381:6db7:d053 with SMTP id
 x7-20020a7bc207000000b003816db7d053mr1280380wmi.137.1646254366646; 
 Wed, 02 Mar 2022 12:52:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] target/arm: Implement FEAT_LVA
Date: Wed,  2 Mar 2022 20:52:20 +0000
Message-Id: <20220302205230.2122390-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This feature is relatively small, as it applies only to
64k pages and thus requires no additional changes to the
table descriptor walking algorithm, only a change to the
minimum TSZ (which is the inverse of the maximum virtual
address space size).

Note that this feature widens VBAR_ELx, but we already
treat the register as being 64 bits wide.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-param.h        | 2 +-
 target/arm/cpu.h              | 5 +++++
 target/arm/cpu64.c            | 1 +
 target/arm/helper.c           | 9 ++++++++-
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 144dc491d95..f3eabddfb5a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -27,6 +27,7 @@ the following architecture extensions:
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
+- FEAT_LVA (Large Virtual Address space)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 7f38d33b8ea..5f9c288b1a6 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -11,7 +11,7 @@
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
 # define TARGET_PHYS_ADDR_SPACE_BITS  48
-# define TARGET_VIRT_ADDR_SPACE_BITS  48
+# define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
 # define TARGET_PHYS_ADDR_SPACE_BITS  40
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6a4d50e821..c52d56f6699 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4289,6 +4289,11 @@ static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
 }
 
+static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1171ab16b94..1de31ffb406 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -811,6 +811,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2eff30d18c6..28b43472131 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11271,7 +11271,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
-    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
+
+    min_tsz = 16;
+    if (using64k) {
+        if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+            min_tsz = 12;
+        }
+    }
+    /* TODO: FEAT_LPA2 */
 
     if (tsz > max_tsz) {
         tsz = max_tsz;
-- 
2.25.1


