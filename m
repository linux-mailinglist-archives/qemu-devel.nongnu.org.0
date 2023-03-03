Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54D76A92E0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:44:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zV-0008Kk-CQ; Fri, 03 Mar 2023 03:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zP-0008Az-6K
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:07 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zN-0007vc-Kj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so5450102pjb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832925;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrDNSJ01MNe4AZXUogDwvS66/gkFhC+s8KaVpjsj/Go=;
 b=cY+01czx0GDG0q30miN71rwDnbe+cNDymj71s7DGyMLnhhFtADQ4Mf/jE0uWX17GTP
 AJjyj4bgPIQI845o4k/5bBBRXwBUl6zuT1wNcj9koa4GMq4uXi3AVur4vHuL6dsBmd2h
 Z7xPP443EFN+aO6RR9R78ADwprefIvYwJ9yXEjlx57Cumr7M5rlKVWhiC22GT4fS/beR
 rgMn84uF7dxatN9rxAGQavUO6t9znPDYeqy0Rzf0KYpdrLhVmUjcC9oRnNVZpuejNZ8B
 X8VacJ9QL7+A32I1yGNFix6aF7dZem9itykOdz7gtwkiI/dKg5n0dBBD73nNVGFiHQdb
 0/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832925;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrDNSJ01MNe4AZXUogDwvS66/gkFhC+s8KaVpjsj/Go=;
 b=03pliGHtPkwq26MpGRs9Fkme9wQOhYwRnpILDwefVjeocx9RSdWqp4fpmtvZ+YXuHI
 fWPSWjyz0+QoJFbKErFGPy3zdjFBxsDi55z1N70s1yADxyxV3OS8BhLo57NGZnbc1uaF
 opjZtiMBB+Dw+GkRW4AgB+fHHNYKBjrsvVjOElXgEvIPyEpLTIlG6twBwPtmjFWNBB0b
 hqLGNyQIIQuDZ/+XrE2gJO9xRxkeB3+tU+SQL08OuN8xmONhnQ/6MJEVtJZ//lGELpP8
 EJJRutGZTWm/Bd0DYkbel8Lj6KuxYGd491aCK96xLx2KsH4pT5gcj5GqjXdNoVXmBKd6
 nwBA==
X-Gm-Message-State: AO0yUKVaBzTxEvUeNPIe6962HrwI9h8mvyG7PEbup2vHapqOuIPAv5dr
 lUuMXBi7Vs8AdBv/nEqFjYvZFGcPbZxKET79
X-Google-Smtp-Source: AK7set8U+HRbMNTXrUD5d4kntWKvfl0yzqKA2SWDZ27fnPtaFV3ZOHACszKb7zshwcj5AVIKjFH+tg==
X-Received: by 2002:a05:6a20:65a8:b0:cc:491f:420b with SMTP id
 p40-20020a056a2065a800b000cc491f420bmr1437459pzh.8.1677832924845; 
 Fri, 03 Mar 2023 00:42:04 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 b13-20020aa7870d000000b0058dbd7a5e0esm1028113pfo.89.2023.03.03.00.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:04 -0800 (PST)
Subject: [PULL 35/59] target/riscv: gdbstub: Turn on debugger mode before
 calling CSR predicate()
Date: Fri,  3 Mar 2023 00:37:16 -0800
Message-Id: <20230303083740.12817-36-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

Since commit 94452ac4cf26 ("target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml")
the 3 FPU CSRs are removed from the XML target decription. The
original intent of that commit was based on the assumption that
the 3 FPU CSRs will show up in the riscv-csr.xml so the ones in
riscv-*-fpu.xml are redundant. But unforuantely that is not true.
As the FPU CSR predicate() has a run-time check on MSTATUS.FS,
at the time when CSR XML is generated MSTATUS.FS is unset, hence
no FPU CSRs will be reported.

The FPU CSR predicate() already considered such a case of being
accessed by a debugger. All we need to do is to turn on debugger
mode before calling predicate().

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-12-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 294f0ceb1c..ef52f41460 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -280,6 +280,10 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     int bitsize = 16 << env->misa_mxl_max;
     int i;
 
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = true;
+#endif
+
     /* Until gdb knows about 128-bit registers */
     if (bitsize > 64) {
         bitsize = 64;
@@ -308,6 +312,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "</feature>");
 
     cpu->dyn_csr_xml = g_string_free(s, false);
+
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = false;
+#endif
+
     return CSR_TABLE_SIZE;
 }
 
-- 
2.39.2


