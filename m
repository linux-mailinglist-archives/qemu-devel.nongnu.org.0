Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7D6AC561
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrP-000426-9l; Mon, 06 Mar 2023 10:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrM-0003z8-EP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:44 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrK-00027j-Ew
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id c18so5930869wmr.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OVuuzGVy3oGWRblHp623aytTERnHyys4g3WWhXo/bgU=;
 b=YwZx5vNQQamsQ05ROLsyC37KPYTxAh+4NSf1jO54ckLX7vTCB5JHD1rAawtOwcmZR/
 zTObyWDvimiClSGQVTEozVE9r8xRkCMwQM3rsVXrATgvwtd2yCPy+ao16lZ51XsQpE+m
 g/Dg7Fq2AhSDMMgbdqOgY7iAhBKhHg8txTu/ePQ9BZR5pRVgaGQI/5NwPiUU4HByI3Cq
 Wn1sjc29XF1ycycmz1/QrZ7J5afngIo5cTPg9GTkJ3QI2MOZY3eqDwohn+GVU7HAL+Sk
 qRzH186OSzASSa+Oec/zXj3ldbDw+SoOT0lGuFLOhiqzKStwJqvXHnp1lmWDuAcwMKo5
 jZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVuuzGVy3oGWRblHp623aytTERnHyys4g3WWhXo/bgU=;
 b=CImLrqzx0llrCAdS7X6oYouR1mf8f3l/kvKgfe4QDmug9oJaGqgxMp6FSoZh1pG7EN
 VxSOigGwAUpISKItvaggCTyp5cn6AK3W3H4o/7kGi/r7Cv6CxHVquHNWhdP/ePrsekIL
 4rnbFPu7sdTwU6I3UHpp/vHGp3faxQx3ZcwxVMj+mUmAFByg7xrK8yhMdan0Qzl+Q8Vh
 X6bykIsVMbHFcTflFkrIPT6djhS5eD99u8CYQdSdZkR2mQIzKQ1H0+d2OdHXAchFO+3C
 FQjo2aYHjtppVpfld7I1VUPi92oftt+agA3oZHFfPtEXnDvzzNc/RooPpT4DY6eh8C7e
 7sJg==
X-Gm-Message-State: AO0yUKVvs67Pj1PtwIAl7w1atnKdx3r870lk82e98ura4X4C2REnvW8i
 wLjpb+Mw/PZFXeF1txvMmtTPKfKPil1ttiSPLc0=
X-Google-Smtp-Source: AK7set9uPr9HyI+UV5E/4rw4c8VlrFOlgbtti87Bgcd011DeilrIsdIEboJljeZ2mBnnE4tHV2hQfg==
X-Received: by 2002:a05:600c:4751:b0:3eb:578d:decb with SMTP id
 w17-20020a05600c475100b003eb578ddecbmr8957015wmo.28.1678116881496; 
 Mon, 06 Mar 2023 07:34:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Date: Mon,  6 Mar 2023 15:34:19 +0000
Message-Id: <20230306153435.490894-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Rather than increment base_reg and num, compute num from the change
to base_reg at the end.  Clean up some nearby comments.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub64.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 811833d8dec..070ba20d991 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -277,32 +277,35 @@ static void output_vector_union_type(GString *s, int reg_width)
     g_string_append(s, "</union>");
 }
 
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
-    int i, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
+    int reg_width = cpu->sve_max_vq * 128;
+    int base_reg = orig_base_reg;
+    int i;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
+    /* Create the vector union type. */
     output_vector_union_type(s, reg_width);
 
-    /* Finally the sve prefix type */
+    /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
                            reg_width / 8);
 
-    /* Then define each register in parts for each vq */
+    /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
         g_string_append_printf(s,
                                "<reg name=\"z%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svev\"/>",
                                i, reg_width, base_reg++);
-        info->num++;
     }
+
     /* fpscr & status registers */
     g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
@@ -310,27 +313,29 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
-    info->num += 2;
 
+    /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
                                i, cpu->sve_max_vq * 16, base_reg++);
-        info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
                            cpu->sve_max_vq * 16, base_reg++);
+
+    /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
                            " regnum=\"%d\" type=\"int\"/>",
                            base_reg++);
-    info->num += 2;
-    g_string_append_printf(s, "</feature>");
-    info->desc = g_string_free(s, false);
 
+    g_string_append_printf(s, "</feature>");
+
+    info->desc = g_string_free(s, false);
+    info->num = base_reg - orig_base_reg;
     return info->num;
 }
-- 
2.34.1


