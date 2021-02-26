Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44A326054
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:43:00 +0100 (CET)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZeF-0007vu-TF
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTn-0004mr-Gd
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:11 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTk-0003KA-Ik
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id lr13so13630964ejb.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMhjnuGsSAYh+HQgXi/TdYpXWknpXeIxYlrtS+35qs0=;
 b=gj9l/rcLfV77XSwbZoVWd5Hj7pAnNeVS21C6l1GOrvnOioQhfROxWMQJzvck8+joN8
 uUmGanx46vJHpvkulSdBD9NdyNPofZmUiWq6GFRNJD4PQwfUw4GTzPV+wLaWHrnTCd99
 oo8nVssbrWpK0+8j6R2vTJwml/8UqDv0n3QP55Jc/Tktsfaicm7Dq+Hrf9vO8NsikSPb
 FMig0rY1xI75Bg7dTow0lRnzIBGX5E29+OjoyIEyW0AzVEgL3bJ0lbcEqCOEsUXDRBKs
 ZzUZMRg1NqypenL+pFrqNTQTbUdH5wBEeSriBkgAOxTotl/7pi7nZPlWE9rYVzF7CLhr
 6eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HMhjnuGsSAYh+HQgXi/TdYpXWknpXeIxYlrtS+35qs0=;
 b=DYnJ8Bsh5nHp5l1gdFueIH6c1mkiWO4CkXnwHYDsnRHFKlYgcw9M8PIDiFACtdgQbm
 LyVLjpQtGSCpiG/JZjCyq6usw7E/6y9d9l11J0AIsWFS9NFrlFIAa6GnS7mnITkUBtii
 SX0C65BJGlZ9ie8KQfSgYMJV8IP36Ak1tRdaGiZFmlJVjv0TLjH9+KOz4dxlKCUIJiLT
 S49v1HfcwzFhWTcTYQHuahyWO1vvJ+cP0Y9rNIM/EPuos0f/GYNJkJplo/FSWu0qe7w1
 p4YK6kDg73eBDdXAYAYniNMqEllyu8Az0SXl/cbDsB7yQ6jv4Br9WEQPNMdtahg6/QUH
 IX2A==
X-Gm-Message-State: AOAM533p3SHjKWUZezRHyAKS5sipjHOYQ5s7yQw0E3YqlpneWe9Y2diG
 T4CTiXY+ZoL6VWFcLVeHRddVfZCkWIQ=
X-Google-Smtp-Source: ABdhPJxVva9Kt5Q5haxTp/DLz77LJp9PCQxz30FK1rDol9xApL6CG3b7Yk8jrjlv1kgcE2atky4+2Q==
X-Received: by 2002:a17:906:73d5:: with SMTP id
 n21mr1800939ejl.8.1614331925164; 
 Fri, 26 Feb 2021 01:32:05 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f20sm5247726edd.47.2021.02.26.01.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:32:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/13] target/mips: Convert decode_ase_mxu() to decodetree
 prototype
Date: Fri, 26 Feb 2021 10:31:07 +0100
Message-Id: <20210226093111.3865906-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To easily convert MXU code to decodetree, making it return a boolean.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index afdb42a3dd4..f25b1fe4d8f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25779,18 +25779,18 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_ase_mxu(DisasContext *ctx, uint32_t insn)
+static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
-        return;
+        return true;
     }
 
     if (opcode == OPC_MXU_S32I2M) {
         gen_mxu_s32i2m(ctx);
-        return;
+        return true;
     }
 
     {
@@ -25831,6 +25831,8 @@ static void decode_ase_mxu(DisasContext *ctx, uint32_t insn)
         gen_set_label(l_exit);
         tcg_temp_free(t_mxu_cr);
     }
+
+    return true;
 }
 
 #endif /* !defined(TARGET_MIPS64) */
-- 
2.26.2


