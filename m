Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F166291251
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 16:19:12 +0200 (CEST)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTn39-000798-Nj
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 10:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTmoV-0002GM-P8
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:04:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:32880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTmoU-0003lw-6w
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:04:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b8so6632296wrn.0
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FVvaalxt9KuyVeDEZxGfM43cusXrs9xwV/O2dDwsxY=;
 b=NKou7XW2LX2dAxn4rUen0yaVzk6YArYrWPmqTWKPE1ItLr9udQ6PRnYFz9roqCbLWe
 E8PCFZeIX4IsehVtuO7bOfY+XBgr8B+35b4wo/NIibDIlScQmQVMD9kzVsgLSWAQUmVS
 ZOGsXbybCNO6gf/e+o97fk1+pebkIm4KQZnR6D3/b9gVUjKC/HNTOgR04FQTh1Vbu2xH
 bjJlUaIXTrMeqQXnvPEnxlCnSI0DXFR3AXkp50r272vnG1WsAzxKvX7MoCNxpA9XgZTx
 DXe03O9z4sfVjb705JYK1OV0eewgFZZI1KNS2GlA9lPr0QuLjAIb1JNncx7b6rEzy/tN
 N9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2FVvaalxt9KuyVeDEZxGfM43cusXrs9xwV/O2dDwsxY=;
 b=Z3Hlpbdlqx1WtZV0u1Ih8OYH4mugNnQ153WxOToLzMaiM+9VHbVGv+035u+yobF2h7
 u2QUBp3o4mLOut7pcmY3C0vZfHeyR6Ycqbdm6HBbDf6NmCwbEPhxb9bbM/biucfCUIGq
 zNlplbhNlSlc/f0m6YDo6OIaYG/LBEkSBOfoXTPJkALwM/7D5XHQPxi+r2e9TF5T5reT
 Tj+l7d5K6qk8GZL+YHZTOp3D7tGJzfi1rroTdRGuYbdNNPm/aeQCIP4AyGEGpEr4FBQq
 dBcJ7fJ/IZAnmQXw/c3ymUIyYAOBsWVP5Rp9wEBCoAYhaf2nFgxjG3vHPkzmzURFLI+p
 jI7Q==
X-Gm-Message-State: AOAM5312EUndMQHOQC3TM1nnDWWu7VkIsKtksI8q36sfPNK/vC+z5izY
 A9JrQII3Y58TPfev01hbuQjcmhyaA1U=
X-Google-Smtp-Source: ABdhPJwaxVpBDw5kswerHJ3ikoQELPQx9A8fgB9uFCVmxntpUPa0jEEdvKD70zdGvuCCyVjKNmAXig==
X-Received: by 2002:adf:84a5:: with SMTP id 34mr10949494wrg.152.1602943440609; 
 Sat, 17 Oct 2020 07:04:00 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id v6sm2513056wrp.69.2020.10.17.07.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 07:04:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/44] target/mips/cp0_timer: Document TIMER_PERIOD origin
Date: Sat, 17 Oct 2020 16:02:15 +0200
Message-Id: <20201017140243.1078718-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201017140243.1078718-1-f4bug@amsat.org>
References: <20201017140243.1078718-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TIMER_PERIOD value of '10 ns' can be explained looking at
commit 6af0bf9c7c3doc, where the CPU frequency is 200 MHz
and CP0 default count rate is half the frequency of the
CPU. Document that.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201012095804.3335117-8-f4bug@amsat.org>
---
 target/mips/cp0_timer.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index 5194c967ae3..6fec5fe0ff7 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -27,7 +27,17 @@
 #include "sysemu/kvm.h"
 #include "internal.h"
 
-#define TIMER_PERIOD 10 /* 10 ns period for 100 Mhz frequency */
+/*
+ * Since commit 6af0bf9c7c3 this model assumes a CPU clocked at 200MHz
+ * and a CP0 timer running at half the clock of the CPU (cp0_count_rate = 2).
+ *
+ * TIMER_FREQ_HZ = CPU_FREQ_HZ / CP0_COUNT_RATE = 200 MHz / 2 = 100 MHz
+ *
+ * TIMER_PERIOD_NS = 1 / TIMER_FREQ_HZ = 10 ns
+ */
+#define CPU_FREQ_HZ_DEFAULT     200000000
+#define CP0_COUNT_RATE_DEFAULT  2
+#define TIMER_PERIOD            10  /* 1 / (CPU_FREQ_HZ / CP0_COUNT_RATE) */
 
 /* MIPS R4K timer */
 static void cpu_mips_timer_update(CPUMIPSState *env)
-- 
2.26.2


