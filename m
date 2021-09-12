Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A5407EFF
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:36:03 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTOc-0005YM-Hy
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHT-0007UG-RJ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHS-0004qF-9r
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso5233706wms.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hcdc/mmIgCeyUTMws35ZeDR0xT8KVD3mt7/D2pvFUfg=;
 b=ikLnu9WG1Vh2fvM+gJ1ulzamXB/rBxE+SdcdLEayPF4qEr09u/cy/K3EKM5qP3Fxa9
 tljeX0d20vVwBmvOFvPcczgctxSv8IG4XWyP4Rf2FdZlBZiOARITuX8tDReYkK6caO/D
 kAQQAKaYvPcmiNP1uzqTPQOCOPiuu2yrFzPvUGkZzIfYSQxRR+PK2xC6FjJeDKMFS8E9
 SPG4LxpDfl8+tcf1jvUlzlDUC7OjJBL/ZuvcmWEkqGRnSdSvqGTXrhE48PBqx/vpamxV
 yHEi+tN4AmzuuMXmEmdylsalbJOREfbLZgdg6vMy65tWW2grtsUVsF6rRq080lXCgBY2
 q7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hcdc/mmIgCeyUTMws35ZeDR0xT8KVD3mt7/D2pvFUfg=;
 b=uYnv5C95gjS4hOh7U+13DAfXhaeWaFmwAuhOmXhpTlmAlEJWGqZd2aBegkL9ufJ8TJ
 4E9EJ21T4dE9svQxYgptnoE3Vv8b8jCpUQBTfBvA8R6enislRhgC7v886Eg8XFIH07zD
 NUEOSs1e9vwQjDHLvovXz1U5NPSVWPI+PDGzlFYDdCBl++XLDTNxo6JI24QfwWa2pZ2x
 BlzfgdUAdV40AUamZUcFPgf164tHQMaiLfxDBcxchV1CR4qGfm02BFVuK3WH9FJSMGRo
 gWopyXckvJgURbJaf7qgS/zILEqxZAbXUckoaynZjMcmAZzzq+M3ShBRyjObvjM1w+U2
 bhdA==
X-Gm-Message-State: AOAM532kV0BKDr4eWy+xzXLGMabFLzXksh9crnd62IAhEPf6ae7L5aFV
 nS1CQo7bHJ0GyUIWcPxIPPvy/41hYVs=
X-Google-Smtp-Source: ABdhPJxG3epHPqHVZLmHH2S7Cl1C1D8qxBHm+ZN642KxM1GtAW4UFxMYKe79IEm7jM+L/eDDiwJJSw==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr7453449wmh.114.1631467716839; 
 Sun, 12 Sep 2021 10:28:36 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o14sm5030395wrg.91.2021.09.12.10.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/30] target/hppa: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:14 +0200
Message-Id: <20210912172731.789788-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bfc..be940ae2246 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -147,6 +149,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -163,7 +166,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1


