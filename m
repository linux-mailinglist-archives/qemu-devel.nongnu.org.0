Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3F41833A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:28:08 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9ax-0004uA-My
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93E-0001hg-Ek
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93C-0006Qk-Uo
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id c21so6791455wrb.13
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=WdHaR98bEECTXPeNHifBn24cJqP5BxPwwYe6O1Yb0kTfnNMomo4cb3UeEQsUm+OTXt
 3gcQ4Z3txzbSkJYBClC+yfLTJuggmlAHo9Qc9e8jlm4cBa4jLhkXKHYVWoZ4Zz5iAQHS
 GrtNf4Ot7/BGJeMjQtzWbaJe0Bzj0rcDCydp7sBd/o7/5ud+Osm7T9f0d4znwTcXTI8+
 +OPzDQTYQgbEsiZwUhRouUABxppgeUV8puKI5NRRquhDejC3Xtc0svmkmjqCx6Dt/7iI
 R9pzgVli5D0ivFJkFtNL6TNt3Y/zByXSP3WXR78v5dyhnv7CQqn9BzeMqUSQIP9gi3x+
 P5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=M8ZK0FMgfm5ypus+ur9sOARVT0JHxXn8lK0oej7b0DKZG5KJF/TUKBvxhn7e/sjIeF
 11HugmfQ0eiHU12+rz1SPyD4K3Mw4ZtWmlqyqY/uANpWfhej06QsUywO9JH7DHnkVLC8
 lAKLldospPkXBkkh4G8DMP5dE7sTN9XTrpjbWiJOJPuKm0WWylnPGW2dx6fcfVVGGXmr
 U3enUykquyz5efw9OFulEYyPSqu+VxSZEt1kQOqRHBn+/qnYMK79/K0dkEfQYzqxwrTn
 eZv5O+gFJ9aY7jKxS7zbAX2znEfvNHpa9xtOyjzTh/BxcvlJGrQL3tTTJSF2lFb7xMrP
 j2lw==
X-Gm-Message-State: AOAM531iuLpuy/fZWxQVlp8gZlW5TulpJWk/4d5T+uYRCzWg97VNTrEA
 xSE8GfJSQ7HQOkcV1b0fX/KQtl9naXM=
X-Google-Smtp-Source: ABdhPJza9hyoTFHpoxhPwICXd2Y/7LrhGe/W93GuOg2NVL8wN4K+ZeH9tBA4jIlKT0mPnAYV0vZHYw==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr17400439wri.282.1632581593499; 
 Sat, 25 Sep 2021 07:53:13 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c7sm14015808wmq.13.2021.09.25.07.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 24/40] target/m68k: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:02 +0200
Message-Id: <20210925145118.1361230-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d11895..ad5d26b5c9e 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
@@ -518,6 +520,7 @@ static const struct TCGCPUOps m68k_tcg_ops = {
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = m68k_cpu_has_work,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
@@ -535,7 +538,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
-- 
2.31.1


