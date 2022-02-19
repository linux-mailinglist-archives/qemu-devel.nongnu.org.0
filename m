Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D484BC62B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 08:06:48 +0100 (CET)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLJpO-0006Mz-SH
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 02:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJTA-0006j1-8c
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:48 -0500
Received: from [2607:f8b0:4864:20::1035] (port=50735
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJRx-0007Ww-Pd
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id y16so2225215pjt.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 22:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=dCpsvQ4QXVs7I9Nlof4TpSgeonmz00MxcTYTJqSKtbpzVTeuxY0mHh0D/8yu9m4Rek
 waCDpf7XVhIxgZ48/snYEsa5H3Eru+F3VTjuKntCn5ez5SjpfKyZigeCSfU7cv0YHqWC
 IJ4jatAMj7NXDlZDwmRuXaYsyh7Kf9nWHmhcmv2n+LWKoyhkmeewe3lyjCDnhs9jyv3L
 hPsYa53eY4QwenVsQHEv31FiHO3XaRY7ryepwFxRRILnFxu3neIHEX+f5FvdCUyDvTEG
 ZFgrh/DSUeIBdgM7S3+/WODf8zWLuKkrgMrjqzfVwoD/noxYC9Ha2dZl7Te2OdfqKjgS
 ej9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=p4+BtR+GlrgLVgaVw6ZjQ7wOBKyiAg8tiRhq+P7PQQvJC6tQDjciEqCThlEWEGCLBu
 cs0QCcLxv3FuXkvWvlHe71gpN4iTqgn2YK3q+duUAreKB80A9Dbzd4dL06ZIKfh9KHpB
 qQUbJ7HjxyTL6Dirj1EHRsdfgbfH5gGDbd9ZCuAjUhAr0EPq0RNKqkJkPiilUE8peHWE
 U4JD5zRb86rzY3vtueoB5591rED4wQUaIGFaHTD6Hg+K2fajgH6+OH085P5butQMpXBO
 tpLmLDPOkWAUIAf6G130Cw6oN0DMuNwHRj7OweRO1LPboU4etTLuKtlmrxcpzrUE9FMO
 lH1A==
X-Gm-Message-State: AOAM532/BGoo4EquhYxoM+Az/nWYkpRlbPNVu8yIZKGP6rKK4GUn81h0
 bmmy9oMrLYM3e+UoipwcEbXlMBnm3xW5Jw==
X-Google-Smtp-Source: ABdhPJwXNKxMukEc8YVd7LKRgg0xD6iSNmJSLLvI2NTAzw7TIrw+q1P3G7OlJnnWvH98WzvmvahVng==
X-Received: by 2002:a17:903:3053:b0:14d:2f71:3a61 with SMTP id
 u19-20020a170903305300b0014d2f713a61mr10365385pla.47.1645252946117; 
 Fri, 18 Feb 2022 22:42:26 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id w15sm5334235pfu.2.2022.02.18.22.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 22:42:25 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/6] hw/openrisc/openrisc_sim: Create machine state for
 or1ksim
Date: Sat, 19 Feb 2022 15:42:05 +0900
Message-Id: <20220219064210.3145381-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220219064210.3145381-1-shorne@gmail.com>
References: <20220219064210.3145381-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to attach machine state attributes like
the device tree fdt.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/openrisc/openrisc_sim.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 73fe383c2d..26d2370e60 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -37,6 +37,18 @@
 
 #define KERNEL_LOAD_ADDR 0x100
 
+#define TYPE_OR1KSIM_MACHINE MACHINE_TYPE_NAME("or1k-sim")
+#define OR1KSIM_MACHINE(obj) \
+    OBJECT_CHECK(Or1ksimState, (obj), TYPE_OR1KSIM_MACHINE)
+
+typedef struct Or1ksimState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    /*< public >*/
+
+} Or1ksimState;
+
 static struct openrisc_boot_info {
     uint32_t bootstrap_pc;
 } boot_info;
@@ -183,8 +195,10 @@ static void openrisc_sim_init(MachineState *machine)
     openrisc_load_kernel(ram_size, kernel_filename);
 }
 
-static void openrisc_sim_machine_init(MachineClass *mc)
+static void openrisc_sim_machine_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "or1k simulation";
     mc->init = openrisc_sim_init;
     mc->max_cpus = 2;
@@ -192,4 +206,16 @@ static void openrisc_sim_machine_init(MachineClass *mc)
     mc->default_cpu_type = OPENRISC_CPU_TYPE_NAME("or1200");
 }
 
-DEFINE_MACHINE("or1k-sim", openrisc_sim_machine_init)
+static const TypeInfo or1ksim_machine_typeinfo = {
+    .name       = TYPE_OR1KSIM_MACHINE,
+    .parent     = TYPE_MACHINE,
+    .class_init = openrisc_sim_machine_init,
+    .instance_size = sizeof(Or1ksimState),
+};
+
+static void or1ksim_machine_init_register_types(void)
+{
+    type_register_static(&or1ksim_machine_typeinfo);
+}
+
+type_init(or1ksim_machine_init_register_types)
-- 
2.31.1


