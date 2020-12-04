Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04952CF6BD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:29:25 +0100 (CET)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJZs-0004MB-AS
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXV-0002gB-EL
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:27:01 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXR-00080u-F9
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:54 -0500
Received: by mail-ej1-x644.google.com with SMTP id qw4so10870089ejb.12
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPVQZVrJYHV9VRQKq9oG2AAR4beoTafSJ17RxMCvpOk=;
 b=Bb+fncHR/1kTHmi2VJPpS7u6w0kDJt4JaWbYIuzHTOzo6mnPEID9spQrGXNYlJ/CDg
 JfA1pJfRX1p+Qk55P0EN6vXZlRe+oxSNaP3hxfeQlsEiL/JeNLecDsidOdYWGMiebjkH
 iMixCbadpiaOZptlCTw43sQfsvAq6I2S/eczF5zDbBVd2AbLFyFEQpWEGv/qUAuUlSTO
 D7Xx1bu7S1qbdOg8EThn3ZKv0Bjnlq55u9RpfTmoRH6jahGP0Xtla0nOPb23EtnHaM8/
 Cguy3xZOpAoh737Ncj7CoDY4EE/HQmumMdBV9ck6D3OTvl7RJ/XOQMYNS9cEw6A9un9q
 9ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yPVQZVrJYHV9VRQKq9oG2AAR4beoTafSJ17RxMCvpOk=;
 b=M6dtEWogViQEOsLHm71PR6AmQYOfkKk2vWo3Tg0Ut89AQcCFEtSFYOKGSUApQIQ20W
 BtyLirJlXvxDpaZrv/zebLvLbOvu8HWe6PAa1BPv9cH26gxLVoqan6PjIWXO6rg30OgQ
 Wdfnryls+jcoDoshu3bmS2gciW04BRqz5stSd4UHJyXJ8JaDlmqSI19gzSVFs/mCAiCh
 djPPaTV7oIJxyZF6KSWrAhlAb6eAqgtncvL42sQKjgL1LMWhXgVbA1ou0f9+L7VXxzM+
 yxiH3kQZBtl700Bvt4j9KLcneLzCRwrx+EaDwNl6Q9+G5/90u/5KuU2aHBKg0bKdB/L9
 5TbA==
X-Gm-Message-State: AOAM533g0Wvngs5uSZS6akCgQ+t6tG0xvsQbbkJte9R+Z9QPbPNuobv5
 2pxqLp5+qj6xJpFsDiWDgIQ=
X-Google-Smtp-Source: ABdhPJznyaEiLXNVRdJ+jnvNs6rKjbzwldBEb83ibl9Am7rdn29z6610yrZX1+X4suaKzSozg+JCfg==
X-Received: by 2002:a17:906:7104:: with SMTP id
 x4mr9343458ejj.141.1607120811094; 
 Fri, 04 Dec 2020 14:26:51 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id p22sm3896344ejx.59.2020.12.04.14.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:26:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/mips/malta: Rewrite CP0_MVPConf0 access using deposit()
Date: Fri,  4 Dec 2020 23:26:22 +0100
Message-Id: <20201204222622.2743175-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204222622.2743175-1-f4bug@amsat.org>
References: <20201204222622.2743175-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PTC field has 8 bits, PVPE has 4. We plan to use the
"hw/registerfields.h" API with MIPS CPU definitions
(target/mips/cpu.h). Meanwhile we use magic 8 and 4.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
We want to move that to mips_cpu_reset() later,
because this is not Malta specific but cpu-specific.
However SMP 'cpus' come from MachineState ("hw/boards.h").
So meanwhile this is early review.
---
 hw/mips/malta.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 350b92b4d79..c35fbf97272 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/bitops.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/clock.h"
@@ -1135,8 +1136,11 @@ static void malta_mips_config(MIPSCPU *cpu)
     CPUState *cs = CPU(cpu);
 
     if (ase_mt_available(env)) {
-        env->mvp->CP0_MVPConf0 |= ((smp_cpus - 1) << CP0MVPC0_PVPE) |
-                         ((smp_cpus * cs->nr_threads - 1) << CP0MVPC0_PTC);
+        env->mvp->CP0_MVPConf0 = deposit32(env->mvp->CP0_MVPConf0,
+                                           CP0MVPC0_PTC, 8,
+                                           smp_cpus * cs->nr_threads - 1);
+        env->mvp->CP0_MVPConf0 = deposit32(env->mvp->CP0_MVPConf0,
+                                           CP0MVPC0_PVPE, 4, smp_cpus - 1);
     }
 }
 
-- 
2.26.2


