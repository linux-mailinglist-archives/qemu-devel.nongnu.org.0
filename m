Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3860F4CFB93
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:40:06 +0100 (CET)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAmb-0008Pp-7r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:40:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALg-0002qU-PF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:18 -0500
Received: from [2a00:1450:4864:20::434] (port=34668
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALf-0004HP-9w
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:16 -0500
Received: by mail-wr1-x434.google.com with SMTP id j26so11989340wrb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8OlnKGBcJmp8ZSBDdM9hwxfl+ILOgzIJHWHqjOQrx0=;
 b=nmBaKEbT+EaNDb12oP2syZp4IAXvLANNAbEQxjdr2Y38w4Zhmb8gjnQlPp5iySi7t4
 Dsgexwxk/QaoxMGwoxCi0ygmGpmtAwM7AVqGd2lHDdR9ID0vq66UX7M86VP14AClaZ2r
 ppkx1TRaSuoOx5L6RFrkt10r3XvrbOCRePUhAAUphgGlYpocVBy0qeUQ5XMJ9jKEa0yj
 p/BeIb6UmkaOFaPjpL2eo0QMaaoHTUzd2RNekEEB4yha68GRIPLSObmwlS1vwpLwhAE9
 hMmjZmPXRnhqQK6ekVPbl26jb/WHx26Q3W+v2ZABWtRErPXIG/2W9m2rL4cTSlincrh1
 ZX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8OlnKGBcJmp8ZSBDdM9hwxfl+ILOgzIJHWHqjOQrx0=;
 b=pHQJdxhZgo2oyTdyVQmHWqXGuFdS1YNmiWERoVvfKEb8zNeE3bR4G1lEtVUf/ao/k5
 a87XE6Eeub3tdbQCi9LOV56J6ml+clk6M5grzDCom6Q4/uZpHkw0WJB7hLPAb3FLVKWY
 189KbF4byCdPh8xc5oDAvDT2ZkYxGNVWS21qKffZfMvia2jT96b/kHyoXVyrh7QjLPcc
 HEynJg/X93AIXAo54PPyx+U0XSN+2bfebU7pkWX6DWVwS9XN5l8V/FeJW7YkoY7yxm1Q
 2HzcCaMevjW0djpcEgRyesQhRSYQEuC6h2IrwOszTyGIMrep4/3HaT7I0Pt8ADVQ8yeN
 K47g==
X-Gm-Message-State: AOAM5334E8MYb+tosATKBXp1pNaQB+4E63IGj+ZWf7c742OVOxKWVvOZ
 /55BlXXtKj0Jj5HjGQoS5oQrfCRFeGE=
X-Google-Smtp-Source: ABdhPJxW6umkoOY9QxXMNjx3Yfjp7u1eXTY/54Kn5SZ93m4f/zPD3a1JeO2riVyRvbBJXNeqEn3yoA==
X-Received: by 2002:adf:bc09:0:b0:1f0:2483:48b with SMTP id
 s9-20020adfbc09000000b001f02483048bmr7991671wrg.118.1646647933648; 
 Mon, 07 Mar 2022 02:12:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm21859356wmb.48.2022.03.07.02.12.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] target/mips: Fix cycle counter timing calculations
Date: Mon,  7 Mar 2022 11:11:52 +0100
Message-Id: <20220307101207.90369-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Simon Burge <simonb@NetBSD.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Simon Burge <simonb@NetBSD.org>

The cp0_count_ns value is calculated from the CP0_COUNT_RATE_DEFAULT
constant in target/mips/cpu.c.  The cycle counter resolution is defined
per-CPU in target/mips/cpu-defs.c.inc; use this value for calculating
cp0_count_ns.  Fixings timing problems on guest OSs for the 20Kc CPU
which has a CCRes of 1.

Signed-off-by: Simon Burge <simonb@NetBSD.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211213135125.18378-1-simonb@NetBSD.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 4aae23934b..0766e25693 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -440,8 +440,9 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
 {
     CPUMIPSState *env = &cpu->env;
 
+    /* env->CCRes isn't initialised this early, use env->cpu_model->CCRes. */
     env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
-                                          cpu->cp0_count_rate);
+                                          env->cpu_model->CCRes);
     assert(env->cp0_count_ns);
 }
 
-- 
2.34.1


