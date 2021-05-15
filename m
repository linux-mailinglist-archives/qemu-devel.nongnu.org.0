Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF63817B9
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:43:25 +0200 (CEST)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrlU-0000b5-3c
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhrkF-0008NI-RR
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:42:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhrkE-0004cU-Fi
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:42:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so934665wmf.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyGZUTcV7Vdwt/peHuJybUGNH8k01xGBPAOEf0ivUjE=;
 b=uifwQ1tC5eeWt4uSNEpwEeqh+gt+ZrPBPGTTwQor599ENP2/jiGgwT67RVfamH4kwV
 qECjxxRnynUNgqol+wjAuvSuegPCqsg1Q26TBJgdwv4lKWsTHOHq1WDY5pYe5UZaDp8K
 yJTjr6tTr3T6cM0CK9rU/EDztdScA+91wrTnahCX5Y0ZMs6zFi33eX0sDyasetDtEO64
 0qlVyNzf7mT9jovOHUgiVSVR8LUWoNiV/mjWoeDEN5dZfNPFoe4DYoFo/z2P+WiLIM/2
 dvP7C0NfMTzn3cQJNvBe9SfnIFAMzt264c8bm0HdyEf4nph5pPw9RvKKZtLQ3fXvNbBg
 HR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wyGZUTcV7Vdwt/peHuJybUGNH8k01xGBPAOEf0ivUjE=;
 b=sM9vbWyCibfK9qA/0LQMWI+p6tH4W5oqv3JDFWEMoxKNTuvnlnYJ/zohNlH+82UISG
 QFDhZRQkYF4VcnuSKAl98HZPPMJmRZLOjKMamAEfZkyMhCS1QszugkeW+9hVzKoL5O+n
 kxGmQkhvw66pjJpTOKBeRrp9d93Bsh5ubfARIdpg1AYi0N+g29xsSGw+I0nFn3Ogl5HG
 njm9uTXJd+lvLVqPjJ0DbmhryoP3DcxrAU2e1f2mwfzeRuMv9BHVykP1rIKpHm+U8Zeq
 mgUySCiOR2hUeB1JbMvkURrK6uxLADelL0cSqYWjd2qqJR1fk39oq2ZqLvWjCOc1EkGv
 j9xg==
X-Gm-Message-State: AOAM530nFbn/JUejWOh38DmXMljenxIyZW8+jcT+OjKvtmTdhBULHa2Q
 AoBIfFrZc/ff0mCVpM8f+v2kujrkWpf3WA==
X-Google-Smtp-Source: ABdhPJzaoqP1G4t1vaiHcne4EJgzomcygu7T8uI+IfDLpYorMcjQYKnA2durWy/DpvhwRAaIBAMVyA==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr14025903wma.39.1621075324896; 
 Sat, 15 May 2021 03:42:04 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p17sm9255340wru.1.2021.05.15.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 03:42:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Align data dumped at end of TB
Date: Sat, 15 May 2021 12:42:02 +0200
Message-Id: <20210515104202.241504-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To better visualize the data dumped at the end of a TB,
left-align it (padding it with 0).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/translate-all.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ae7e873713a..387f3dc2303 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2042,8 +2042,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             int i;
             qemu_log("  data: [size=%d]\n", data_size);
             for (i = 0; i < data_size / sizeof(tcg_target_ulong); i++) {
-                qemu_log("0x%08" PRIxPTR ":  .quad  0x%" TCG_PRIlx "\n",
-                         (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
+                qemu_log("0x%08" PRIxPTR ":  .quad  0x%0*" TCG_PRIlx "\n",
+                         (uintptr_t)&rx_data_gen_ptr[i],
+                         2 * sizeof(tcg_target_ulong), rx_data_gen_ptr[i]);
             }
         }
         qemu_log("\n");
-- 
2.26.3


