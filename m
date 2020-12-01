Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B021C2CAC70
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:34:14 +0100 (CET)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBPh-0003Pd-Pj
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBKE-0007H0-BM
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:35 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBKB-0006Hm-U4
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:33 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so8588855wmb.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USTM+axbGh0qDsZVg1RndxDmZdTVf+v41Eb/YfPql44=;
 b=CkZacQ5oc2SEakSQQFxhg8OzOVlqorJOWVcY1CVdVdGt8CsMZHQzlCBXwv+HpXuz94
 Aq/0RvHdgZaXViq4UObereFE6C8kI2YGFSzT5Y+5wdu/y7n09EcaKRemmvGjy7n46Kju
 AEo77a+BpmOOm1ddfXRkHjOlvwutF63ikxz0kWmPPwwTU3yOfjj53R8vIbEKsbnguXlx
 Oyhi0mdQlPGcE3JA6QIu0Ax3wxdKlQpcs9ClOxGmuWrjACMqmn35iklZHaw7nHY1JwSi
 4kQf7cPeHDP2cr88i6UbM7jo5goexa6sqdPp8hOYAuE9+Y2yTO2Iqy08z4GPwY8WCBVG
 XlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=USTM+axbGh0qDsZVg1RndxDmZdTVf+v41Eb/YfPql44=;
 b=TsA0AgpMyiMFKXIbAxIrwXHgVkOGy/Y4ZSeajiIcBdi3mE+bNYeYqSLdUbKOZ4VuSQ
 pzVM0tC5BuL5S/pkuLAct7k+SoNpAA4XGWbsEEjxlQhfCl4BaHCNdff2L1yustqheXTG
 8AlpWavgAgXah4ZOpv+5jceueikqojmB6e/7L/hPNj/0Yb4L+QRq6RhVVXVgEgYERD9D
 x77e6pgl4HujR3iN/N2+J4kICUxCLKZBdvaOvY2V5+ZWyh5p+Wp/AO7dleEfMYAVLKlO
 4WuKseJc2cezbE7xXA8YslL3m4meUV34hwudRCzMtZHjshQAsKF9TkODD3kexCq8n2Wr
 RlvA==
X-Gm-Message-State: AOAM532Mh1kXQFNqd6ba/cBnkRFLoigsIJRaQaKtTMi0ItCcqYcFlIGA
 0yc0iuAUo7Cn9r2dy86bO2A=
X-Google-Smtp-Source: ABdhPJyTAl6uVneqOuXjm3ksG7vY4myFlnbpJfLdJgGcmKevgC/S+wee3W+P6ApG6Yp3eHU7gvdF7g==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr4337457wmc.117.1606850910636; 
 Tue, 01 Dec 2020 11:28:30 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id h83sm1385420wmf.9.2020.12.01.11.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
Date: Tue,  1 Dec 2020 20:28:05 +0100
Message-Id: <20201201192807.1094919-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201192807.1094919-1-f4bug@amsat.org>
References: <20201201192807.1094919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_EQU() macro which
checks if a CPU register has bits set to a specific value.

Use the macro to check the 'Architecture Revision' level
of the Config0 register, which is '2' when the Release 6
ISA is implemented.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b7c6d30723a..9c475fa5f70 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "disas/disas.h"
+#include "qemu/bitops.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
 #include "qemu/guest-random.h"
@@ -995,17 +996,25 @@ enum {
 #define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
     do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_EQU(_reg, _start, _length, _val, _hwcap) \
+    do { \
+        if (extract32(cpu->env._reg, (_start), (_length)) == (_val)) { \
+            hwcaps |= _hwcap; \
+        } \
+    } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_EQU
 #undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
-- 
2.26.2


