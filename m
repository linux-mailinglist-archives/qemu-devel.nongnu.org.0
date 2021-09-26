Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D0418B90
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:38:47 +0200 (CEST)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcnG-0005h7-Kl
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdj-0003HI-4V
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdh-0006Hw-Na
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so46372250wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtkZfC3Jqv9BX8O65q6cSfCgutSi0wjc1sQe8Yf13mk=;
 b=CaHvRzc9OEUjh+VhqdSmYDRGncUTUtjOHahnwzwvNBGfaaFbfMQCQZIrDTapLhrW4i
 RVx1pyxEIl64Bw8BjQVyEA9AeN9WpEirTmKDgjpKLTUysn8yQyTKpV0jwX/dWlhJsaXH
 ZNW+ZYsKZxM1YFU45ELEIy5evxXwkxccUB5MJAjRew4b8+JJU9BGUF7Vj6AFUDjFBZ8B
 VvG3sfDTbuRXOrIVi3qoJ4JH9DEUk+GtdPqgTOUS36gk6mG9JTdY2gJGqweey8LqRtTg
 ifKpHr04h6WdQFsdwf6GNVrxxrD1dj1FbKZ9Ar83/6KvXrArJvz6Xzp0Ya8VJESXyow8
 5a+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BtkZfC3Jqv9BX8O65q6cSfCgutSi0wjc1sQe8Yf13mk=;
 b=zDnxvvhs2HG7hOLV9Jwd8DMD8lPAVkX+PX0uXxVwFrAtNdx61/dRfjIUeTCdae4tXA
 uulr6rwuZn3HcoL2XOAJeYVrcUBSRLSCVWp6RWmJJSgFxUK9ejGqT7Q7COoV5K8A+dzb
 qrGB9yQKupY8Q4eTgpd4sxK3aAkt2/BVgUzWip/G6uo8YebvRMRoaqcCsdSwwfPmdgoJ
 tymEzlt6LdOjIweg8ofDP2uQZMO3i+qqkBvXba3Ta848DoduApdrEBcYVI+zSNb7N2+h
 5TKSZGCSX5ZVY2LxdxLnXhc00gYHTTwv1d7/9lp9dIxHbg0bGBAyRuQlfSdscxdRB/HU
 finA==
X-Gm-Message-State: AOAM533oqVsR3XxCJA8D9iqMcMQCA0HuJYVEQazmf60JepF9HKhl5kHq
 pL5AoF+ESTxH/OTj4kVhgbEheBtq2/Y=
X-Google-Smtp-Source: ABdhPJzXja2v4LLPPGDWb9/UMUA8/1QdkjShi4MBtTvUN/CLFyB/1XPtIsQzZnQo8IIUxQCM+Oze/g==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr24506219wru.76.1632695332185; 
 Sun, 26 Sep 2021 15:28:52 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t11sm1878658wrz.65.2021.09.26.15.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 20/40] target/cris: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:26:56 +0200
Message-Id: <20210926222716.1732932-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5bd..b2761f8b110 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,10 +35,12 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cris_cpu_reset(DeviceState *dev)
 {
@@ -208,6 +210,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -218,6 +221,7 @@ static const struct TCGCPUOps crisv32_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -294,7 +298,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
-- 
2.31.1


