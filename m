Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B084AF666
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:20:01 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHphH-0005cy-Kh
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHo3b-0004mc-DQ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:34:55 -0500
Received: from [2a00:1450:4864:20::534] (port=41501
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHo3Z-0003E0-Hr
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:34:55 -0500
Received: by mail-ed1-x534.google.com with SMTP id cz16so5446643edb.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nc7NqSSiuD8zDZWIBuWD4uXfx2qSa99zJOclVo9lxBA=;
 b=SW1OP7QMPXwLLrVWCRlrIqlGgg0TRnLBe239Y3UuzDFHX842kAd4Xg/lTfAz4lETh7
 uLYDhR574ecpkUz0hPb5HpV/LBJ/fw5OxahQbqxrNWMGvU6rwtjyBdUkW93gLDMUULUT
 HphJjohzYBrMWnp6gLk2j92IS5+16loY6FHRfnLD51/kVC0StXCLqQf1D0v/P+2FZNmt
 35HhUo7PJ8coYaWIiprYaz+LfeR8Wsj4DqRt36ilc/QEyzKlTBqXLHKKTEgpPoSNUQIe
 IPvYjgRZ2NVYv1rdjWniIGQfAO/sNpEtZYPHfLtXID0u1xao8CUSZypJON79hx5frjtJ
 sEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nc7NqSSiuD8zDZWIBuWD4uXfx2qSa99zJOclVo9lxBA=;
 b=Y5v7KF+7EtmLeRXeAncjV7iQF8VGZqg1pzSpGUt6JH3v+ST67dp92cu5YLAIQ3eNYB
 quk56B4Zou1JrCZE4Uzp24xQnSkJ28e6Vy+fSUdjZaFNSCrOxCEAwsyF33dYq/xtnJvQ
 Dm+4ayMX95aReLmjKpQ8441GUiA09cCZ8WTL/k6+rU5OuAYuAorBX39DQfKYQNFB9nci
 shVZfIo6KXgJ4Y7QfLvitAucnLBpqpNrW+fwhzwSRLpUNQnvef1SOUe4ybPhsMahnTuD
 G3HXyNoQH+mgAITYuhpF7BCd+tNmeQFq2EbBmz0id18PyRBKm/Brfh1MvKtWn2YjHzYQ
 EXcw==
X-Gm-Message-State: AOAM530ZLZKQv8U3rtrksgvG29BMHqfNx5Wngty5zG/RzgXd8x8AXbdE
 WZ1iuPYSN2b2DMsOJoEwbiY+dw==
X-Google-Smtp-Source: ABdhPJySmiwjLeeyG1HhacDIphp1cR9VsQRI9Of973yK8TrdFmw7lglmWCF/QmJQtB9r0msVdsgU2g==
X-Received: by 2002:a50:fd05:: with SMTP id i5mr2796341eds.181.1644417292027; 
 Wed, 09 Feb 2022 06:34:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q5sm5136325eds.82.2022.02.09.06.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:34:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83B251FFD0;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 25/28] target/i386: use CPU_LOG_INT for IRQ servicing
Date: Wed,  9 Feb 2022 14:15:26 +0000
Message-Id: <20220209141529.3418384-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think these have been wrong since f193c7979c (do not depend on
thunk.h - more log items). Fix them so as not to confuse other
debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220204204335.1689602-26-alex.bennee@linaro.org>

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


