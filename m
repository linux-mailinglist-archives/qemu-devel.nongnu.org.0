Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CF6A92FA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:48:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zI-00088K-QX; Fri, 03 Mar 2023 03:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zG-000874-Ff
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:58 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zE-0007qA-TI
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u5so1973634plq.7
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832916;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xX9YoSlLa+3ihvCOlNB2JgR3BNTq1PpQmJ+xcNb0lYg=;
 b=ClK2y2OfxJm7n0NGGgdJ7jLJ7wByicD9GPynkVoRAtW0NXINqAwIdbYTHxilLH/xJW
 dpHblgq5dWQQ23/OxG2IGpbcNnuO3nTxWdHbfcJHpkVQHvpp5tjuJXZesz/53+NYCx/K
 7DeTCOE1uRYQuboyzpkyzWITvrBcTuLhivlCnoynIqw+EQV7T/N1qFNGXrdI8dLMuqp4
 hiNtdFcU1Hmr3KiIKaBQDB/gvKzRLIBBZQ/gPzsAkqi9iFBqqgHV27L2qSt2yxp9GEFM
 BPd3AdO3t+uPNg9+DTO9uSW/7jfRnpfVL7HNXf+audKbZeJlmJq6oW54hv0CyvKf1Tuq
 GToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832916;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xX9YoSlLa+3ihvCOlNB2JgR3BNTq1PpQmJ+xcNb0lYg=;
 b=Q4k+xy0Nf9mO1LQaaUQIRoql5L/E8aglRGdlo4pKiXYuFwMjhT+Ez9c4FIP55Lw7WW
 3rPX82lg5QASEnKNXmrVpzzFYB7PEzhbJEZ8AGXMGyrCQrIMnqhBKshDKB9u2B24ud7M
 ZrptERWjZkJNhzcz8MiEhrA3I8/iw/a4gBzdZCjOANgGC2ZXCx0RMs1q6gbkJGIcG2A8
 hVvSAj70yf9cdzXFhzzEqC4hvS+H1lclJB9PecedH24FapjJVt6ICakphsZc78NOAYPJ
 VUep7wZE7nKmIFCZHxegJ4j2KJwaDQKnXykOVlWekpuORx9ihyDetS5QOcrZo0F0KMct
 LxGg==
X-Gm-Message-State: AO0yUKV+2ZYpiWElkDSmKvOO/DpEQZv976ZxV+5wpZpvdL9kzckQKZOn
 pauhKGCIW5jmAsY6CDjm7mB8/Q==
X-Google-Smtp-Source: AK7set9+lqxqXkM3zJ2QMCLDUUa2AAoohVUAGFzHc2rxQIRrDs4zAIp1cCT27bUswx31wY5scLyEdA==
X-Received: by 2002:a17:902:a985:b0:19e:7f80:4165 with SMTP id
 bh5-20020a170902a98500b0019e7f804165mr1132240plb.17.1677832916136; 
 Fri, 03 Mar 2023 00:41:56 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ka12-20020a170903334c00b0019d1f42b00csm1002981plb.17.2023.03.03.00.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:55 -0800 (PST)
Subject: [PULL 28/59] target/riscv: gdbstub: Minor change for better
 readability
Date: Fri,  3 Mar 2023 00:37:09 -0800
Message-Id: <20230303083740.12817-29-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
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

Use a variable 'base_reg' to represent cs->gdb_num_regs so that
the call to ricsv_gen_dynamic_vector_xml() can be placed in one
single line for better readability.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-5-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index e57372db38..704f3d6922 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -385,9 +385,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
+        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs,
-                                                              cs->gdb_num_regs),
+                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
                                  "riscv-vector.xml", 0);
     }
     switch (env->misa_mxl_max) {
-- 
2.39.2


