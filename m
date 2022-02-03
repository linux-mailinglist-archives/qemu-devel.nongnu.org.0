Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F444A8CF1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:07:17 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiNw-0000qE-Vr
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdn-0002mj-1y
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:39 -0500
Received: from [2607:f8b0:4864:20::634] (port=45772
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdh-0002KP-UZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:32 -0500
Received: by mail-pl1-x634.google.com with SMTP id s6so2999493plg.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pxosyp14whWtXiAs8rnIXM8WUYsnAS8eqq/iDTkcN1U=;
 b=UHBPhUqBPD9XxEcEtuJxjNqMu84HFTex0aPTeoiEM8AVNC4euDbKxb1cBLLFJo3AO1
 7h0R5A849qiwBI5nSvsmEMYxhFMjqOQGuhZczEVH7cxveKNYrwDVlWILmtl57U+MNN+i
 go/1/pAlMkq2dq8BuHu5r+A4KIzkwLeml8hVbq0XByYM9xFvQkL46WLLa8eERRcd5RM/
 LPXw4AsGaYg7ymNNbtbAtnEa/o0xX0RREKFBJPlvFrJoXUJo3SnEKr7kJhvS0lGvJ1lf
 teq4naC5vJl1BxhsaB625Ht1iDbTN1RBMJN4MTSqOoX818Q+1mwapstSUczHEp0Q81f0
 NB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pxosyp14whWtXiAs8rnIXM8WUYsnAS8eqq/iDTkcN1U=;
 b=h1Ez2PKN/lqzR0iHSxqNKZ5DFyIQAumfFX2rJSJQ4XoS9TGq2Mufd8cKuvbcMimKBt
 YZ6jTU2T5k//eDA2X44TT8bojauUhpAFNJPWouvwUQtysqCBzvy+giXAnviQXAeBxjTD
 2RbE6+O7T/7AhulziA8ZNLdEW22U4JDHIxqngnJ1x8NjiapIrKe0+XwIaK0cN6HuVghf
 zW0sesLxA33vU6/nQRNZT5BFB6j4nFBOYB9mXE9uBvabIoRorVhskmOY6mgwe1/nPVz+
 1NOTZNqU9BSGd3R26Y10mwoxDCuh4cxeQerR6eWv5CihgQiEEg5V8c3tP82DfAZmYqdN
 uRIA==
X-Gm-Message-State: AOAM532Nnauwtv/6z4Gc6nFRa4RAM8PX64uGSnrEWyZPQ88uKdPCH3st
 aBjFAgAUJblLDsB+KobO/V9JaL3WxEk=
X-Google-Smtp-Source: ABdhPJz3egYP/+i2x6o59ZbcGgDCsTR3ncjgR0P4PIumXRp6O9/Kd/FNds0M9s7IlXkbzHJzk/vKRw==
X-Received: by 2002:a17:902:b407:: with SMTP id
 x7mr36729330plr.99.1643915964728; 
 Thu, 03 Feb 2022 11:19:24 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f5sm17659266pfc.0.2022.02.03.11.19.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 08/21] accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
Date: Thu,  3 Feb 2022 20:18:01 +0100
Message-Id: <20220203191814.45023-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Mirror "sysemu/kvm.h" #ifdef'ry to define CONFIG_HAX_IS_POSSIBLE,
expose hax_allowed to hax_enabled() macro.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/hax-stub.c    |  2 ++
 include/sysemu/hax.h      | 18 ++++++++++++------
 target/i386/hax/hax-all.c |  7 +------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
index 49077f88e3..2fe31aaa9a 100644
--- a/accel/stubs/hax-stub.c
+++ b/accel/stubs/hax-stub.c
@@ -16,6 +16,8 @@
 #include "qemu/osdep.h"
 #include "sysemu/hax.h"
 
+bool hax_allowed;
+
 int hax_sync_vcpus(void)
 {
     return 0;
diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 247f0661d1..bf8f99a824 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -25,17 +25,23 @@
 int hax_sync_vcpus(void);
 
 #ifdef NEED_CPU_H
+# ifdef CONFIG_HAX
+#  define CONFIG_HAX_IS_POSSIBLE
+# endif
+#else /* !NEED_CPU_H */
+# define CONFIG_HAX_IS_POSSIBLE
+#endif
 
-#ifdef CONFIG_HAX
+#ifdef CONFIG_HAX_IS_POSSIBLE
 
-int hax_enabled(void);
+extern bool hax_allowed;
 
-#else /* CONFIG_HAX */
+#define hax_enabled()               (hax_allowed)
 
-#define hax_enabled() (0)
+#else /* !CONFIG_HAX_IS_POSSIBLE */
 
-#endif /* CONFIG_HAX */
+#define hax_enabled()               (0)
 
-#endif /* NEED_CPU_H */
+#endif /* CONFIG_HAX_IS_POSSIBLE */
 
 #endif /* QEMU_HAX_H */
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa9..ccdcb6afab 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -49,18 +49,13 @@ const uint32_t hax_cur_version = 0x4; /* API v4: unmapping and MMIO moves */
 /* Minimum HAX kernel version */
 const uint32_t hax_min_version = 0x4; /* API v4: supports unmapping */
 
-static bool hax_allowed;
+bool hax_allowed;
 
 struct hax_state hax_global;
 
 static void hax_vcpu_sync_state(CPUArchState *env, int modified);
 static int hax_arch_get_registers(CPUArchState *env);
 
-int hax_enabled(void)
-{
-    return hax_allowed;
-}
-
 int valid_hax_tunnel_size(uint16_t size)
 {
     return size >= sizeof(struct hax_tunnel);
-- 
2.34.1


