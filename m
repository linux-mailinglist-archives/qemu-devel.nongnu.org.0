Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC814994AD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:49:53 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6Hf-0001zD-OO
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lX-0006qB-Uu
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:40 -0500
Received: from [2a00:1450:4864:20::635] (port=34761
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lW-0003I0-AO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:39 -0500
Received: by mail-ej1-x635.google.com with SMTP id h7so24656403ejf.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/z5GGZMV35f+I2ea4vFQTVFSNKkQJlZfsfq4OFs3GJ0=;
 b=HmM6OMdRqL8k7LC9Y4JBHxl89VKdCt4AiBHAQt+kpPCaYZtIVWHPakIMOPCuBtg4J5
 crdWz2Et/UtwILdjo3AsDiQUQRYiA229W6T3PmNtlcvmtNHwV//pI3NFLqPeUn/n1w3x
 GgBMPA6QjkRUq6QtaWZ04TygU4QryZo15rH1+Ir3pehzK7xk5/MmlR9qK529+iBzpgMs
 pF+EGkX8wYD/i5Of3VBeVcVmGBUpQWKpGzjely6BJm0C0kZn+6pGyYVDzxwCFtvgudwJ
 Zac+pev9gwpUHaBTy/16waaNq5HXk5PTCW4hoFk0oOk+Fh10oSG7xpMpN7QkQJNeNHEy
 OatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/z5GGZMV35f+I2ea4vFQTVFSNKkQJlZfsfq4OFs3GJ0=;
 b=zp/PyTEBk80RDdjSsC7UerS7giL6jaP5tdXRfedQkpTmnZhBoQ1wUYRSWHmoJdk64U
 67OvapeKqWisssPpkptb7zbQ0o9iWOG0OQqHTx7OzEQCoPDhTGUp5pSiznkqjsXJCDY/
 cXr+y+A1WC+BKGlDkIM96Lg4H7uDEnLf8H1UMpEOYX6L7q4Sa2K4ctTfrrHalvRK59G7
 ifXzHry1wHvHn9Sk6GBJtMoNL0ULWljSG3m39kuNeWe3AkZvlnfBTRBtZp5etTwAby6P
 sCbZTGMfW8CDF0MIeYHTlSHQdl8+fCsQsmYJ3qyCeJPIMfdbbmvJUkjRiN3ZE43U4mPd
 9qqw==
X-Gm-Message-State: AOAM532H4IetanjjO0w0i1lE9QLkHkFuqrd9E8WqP/nVbjqnE73VCsXt
 EVjKDJvriKIQae4H58UaJC2Gqw==
X-Google-Smtp-Source: ABdhPJze9w6icK0txIOrs9/qYY73TZHBVoKyoNX0RtvEjSqE8StZ1E7fXDhDR79ZdTkvtSLCnMTyww==
X-Received: by 2002:a17:907:2d0c:: with SMTP id
 gs12mr7551646ejc.165.1643055392742; 
 Mon, 24 Jan 2022 12:16:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id op20sm5317494ejb.68.2022.01.24.12.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8CB11FFCC;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 21/22] target/i386: use CPU_LOG_INT for IRQ servicing
Date: Mon, 24 Jan 2022 20:16:07 +0000
Message-Id: <20220124201608.604599-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think these have been wrong since f193c7979c (do not depend on
thunk.h - more log items). Fix them so as not to confuse other
debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/i386/tcg/sysemu/seg_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index bf3444c26b..824b9a5a26 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -167,7 +167,7 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cs->interrupt_request &= ~(CPU_INTERRUPT_HARD |
                                    CPU_INTERRUPT_VIRQ);
         intno = cpu_get_pic_interrupt(env);
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+        qemu_log_mask(CPU_LOG_INT,
                       "Servicing hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         break;
@@ -175,7 +175,7 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
         intno = x86_ldl_phys(cs, env->vm_vmcb
                              + offsetof(struct vmcb, control.int_vector));
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+        qemu_log_mask(CPU_LOG_INT,
                       "Servicing virtual hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
-- 
2.30.2


