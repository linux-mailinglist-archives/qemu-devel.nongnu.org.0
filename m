Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BB4004D6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:28:18 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDvF-0007F4-FJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDhk-0005Zy-Nw
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:14:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDhX-00070j-Dd
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:14:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so105645wms.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/y6lefGmnKA37b/WqjjyN9Rfzl/x0P60az39iUCo3A=;
 b=qkNHjr7M6DnVMIJPZjiS51RM5mL8P8VQuSD2vqEWnVUtQn0HrbQ8NWyjzAQquOGIFo
 eE90TJLV1rpkW2v+NgEfNdgWVZ21RMD5otEJpb1Vg+WlPppj3K7ug2I9p+TJ+w+QCR1R
 tybBl1CbG6x3az6N0je51FEvOrP6JhQBGaSED+vXwInfIg886b1+M7JobYQikTDyMX2v
 W0pu8JEnAdNx7bY+iXZEMKkmQJtnADxLnxm4H1qhkzAhFEPnmSRLPkuJKg+frKyiehtg
 wbUQX02ecZixKy8o2Ao7QN0/XYxW+lDkSgGP6wG3ZzQFKwc3Sl1XxCKpFGfz13SZYYcN
 8p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j/y6lefGmnKA37b/WqjjyN9Rfzl/x0P60az39iUCo3A=;
 b=eEx4/Tg/GeW6K9Xn7fSmNw0hR4RHu8YrYjNEQh4RcG6Mzi+9o9BFFfdYjCzwL40YGg
 HdlDi/cLMqVlssywUGVyR9UF4yB8KA5wSi4BoiFYJAgJpm81rGqZmqFS7pLjT/Hd1HlR
 XkjnxwZxR3VR/ijKslmplgQ4P03HG7C8CSETgcfB42PtVTHTovuoqbggidXpUUf0VHll
 4snorrQ7HB9WQTyhgD9h8amsxkzDXgYa09ERxY+0lCz+Z/kiudQyVsp8IOtXdmZDRn4P
 dWKo/fDGcCRYgzT16cbSlV91ubVNrWMtqme+ovXU8FKSlMva1fYFaCrgUdecVGH50tGY
 FOMw==
X-Gm-Message-State: AOAM532nr7pB5/PpIK0HFmbmcKVj33ldNzAT5DW7dDK6mp0VWWZNRDBO
 Xy5n3IlS624PUCy15ECfxjvEZJykMKQ=
X-Google-Smtp-Source: ABdhPJyVxiI3xDcuUNAN44Vitgj/bT4FG+EO+EW6166a1Vs4tZSzM6a9r3rwvOPUsRGvt4Vct9+qAw==
X-Received: by 2002:a1c:9a13:: with SMTP id c19mr44987wme.195.1630692845615;
 Fri, 03 Sep 2021 11:14:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r25sm5574058wra.12.2021.09.03.11.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:14:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/30] target/sparc: Restrict has_work() handler to sysemu
 and TCG
Date: Fri,  3 Sep 2021 20:14:02 +0200
Message-Id: <20210903181402.761372-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 5a8a4ce7506..bb28ea78bfb 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -702,6 +702,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.npc = tb->cs_base;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool sparc_cpu_has_work(CPUState *cs)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
@@ -710,6 +711,7 @@ static bool sparc_cpu_has_work(CPUState *cs)
     return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(env);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static char *sparc_cpu_type_name(const char *cpu_model)
 {
@@ -868,6 +870,7 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = sparc_cpu_has_work,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
@@ -890,7 +893,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-    cc->has_work = sparc_cpu_has_work;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
-- 
2.31.1


