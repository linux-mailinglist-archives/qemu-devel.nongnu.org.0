Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC6585738
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:12:20 +0200 (CEST)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ9X-00060p-Ia
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ45-0003V5-48
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ43-0001tn-J9
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id g12so5832231pfb.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbWEiIuyggnyFyXXn6RRuP9nqwzyt9y0LyosHzVyHv8=;
 b=irWbsfVCY7EXryHUEgvv9zXRUHvT+ug+enJTNshE7OTDz6mvljflFWeSCqWVnRKXkQ
 1ViHLbF59Lg2yTUire29uNENqh5ggpCL8Xft8BfQCipC7WfyfnthVLIfbfDOh24ajmqe
 f2uMSigEaEQmQscCfycv6pcncYI0AqXMCnvVQqf3Vi1qL5w/hNSvlRY5iS9qA4r+1D/u
 5RHzG3YK1lQK3d+0ZnK6pQPf3TuBzBTORICLymG6pqP/0oTl/P33fdJKibUW1Uo4se3l
 CHO0ksn+P8Glqzij/isR60c2nv9maWKmUzMm6pa2hmxoJTrlgaNPs1B5TjFnvoeDWUMJ
 j4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbWEiIuyggnyFyXXn6RRuP9nqwzyt9y0LyosHzVyHv8=;
 b=C6e/kFkawbIQJVNNxOihl6DyWh2id5rOZgOkOQwU2M9OeGSPUNNn0KKTulImRi0Lc9
 oHvTCAHo1Is857gvCFDiw7ThN50umh/wfY3PUgYq1/NtFhQDSSAwGIsokF6mvlmRZkIp
 Cfj/Gf9uFFrJZGpXfwNqfADwGtFj95KcZ2g+ut0+0Nhn6uV9kC6nlFO+1ZeKKWlxtWZa
 ynxS0ASM4Fpe/VZYk3+4v2q0kf7eBemqvfwVDXDEySDgJK6474D3qujkuO7NsRN/rocu
 NsnhRwz7Z0jqiRL9daA7AmMVIvSnpIlOsUYr3S5DqZMj7mVjO2I/c8v9eA0v3guu8cdb
 JInA==
X-Gm-Message-State: AJIora+j8/h2Ii8hNY21KCJoobImXy7hHYEX9xzj3zt9BLPI4Qn+ElKh
 WXHudqn1WRfvLEsIglPOJ6cUXWcfH5DAuQ==
X-Google-Smtp-Source: AGRyM1vyctu8vP735GDkjlYdyCKhr1opLcOO1hw5ZYtJmbkC6hXPVEihXtTtt8dvGzRGnagm1sJWmg==
X-Received: by 2002:a63:c049:0:b0:41b:823d:43a8 with SMTP id
 z9-20020a63c049000000b0041b823d43a8mr4498276pgi.283.1659135997894; 
 Fri, 29 Jul 2022 16:06:37 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a63e24e000000b0040ced958e8fsm3051983pgj.80.2022.07.29.16.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:37 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 10/11] hw/openrisc: virt: pass random seed to fdt
Date: Sat, 30 Jul 2022 08:01:16 +0900
Message-Id: <20220729230117.3768312-11-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc2.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - No changes

 hw/openrisc/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index 9a78234a28..f8a68a6a6b 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
@@ -130,6 +131,7 @@ static void openrisc_create_fdt(OR1KVirtState *state,
     void *fdt;
     int cpu;
     char *nodename;
+    uint8_t rng_seed[32];
 
     fdt = state->fdt = create_device_tree(&state->fdt_size);
     if (!fdt) {
@@ -186,6 +188,10 @@ static void openrisc_create_fdt(OR1KVirtState *state,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 
+    /* Pass seed to RNG. */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     /* Create aliases node for use by devices. */
     qemu_fdt_add_subnode(fdt, "/aliases");
 }
-- 
2.37.1


