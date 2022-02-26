Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54064C5335
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 03:03:22 +0100 (CET)
Received: from localhost ([::1]:42492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmQb-0004q2-GI
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 21:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMv-00026Q-Mv
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:33 -0500
Received: from [2607:f8b0:4864:20::434] (port=35446
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMu-00073Y-Bg
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:33 -0500
Received: by mail-pf1-x434.google.com with SMTP id l19so6229572pfu.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=Hr84jzuOOI8GaMlfbFDKfgxztBJuYbkMWdOF4HbYVWD2mi60Ft5a4HvOr/pjqLA/Ls
 JX5kXjt+9T31FnHHf7AbYMlXm+MtCDssez9A40Nr9t1j2ZrBRY7C1/p6izNNgTBVZYDl
 MS6K8Q6RDqoeViqY06b1XcoOFBpgbmVtUN4VC8314Fhk4zP/VLGb9T92NH2z+hU6VVo2
 YaawCSaepF6JobftsXIqqmbyIA4K0p664Qa3zCOO+8wdpMkWL7z5YWEkqeRkwtf0NCBS
 X1IOeYNUgxlpJABX3lrqPQOdDzcgkCJ8LxUgSsdcrUlO2K67khY182NcKJRMlwXVUWDy
 7/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/xPLWx+WAFUwG3ewQ6NqeIlc0rSfL6G+5HjvVKbLiE=;
 b=y/dIiZhzBHQMl4hePs4Te6Hd9wgpbfNau66t8jesdJlNz9zMqmhDbF08qoCGA05dU4
 +NAcfccvm3p5h7+d8WYJLw2DZZ2ngAoXXqtk3b3t9FOqXeE81Xxmey8i7vL+5Y1ld45j
 hB0CJC3AJrAnxsS1Z0CSatnRy3DZzsWNCDCTBopL780IXmqqERaaQbcKd1hxyRQrcEcI
 i9tEzcHzrL3f18CR2B79r93icuQZ54VC5ZGMCiIGJg1c0WycSbIydVbC0DFg0CVQU/bU
 /GOOlaey0PSrbH1EmRpTzUlEdQ62TVPXmKYUK3gL1jJ+fPP+7CGiCTn1jXvn37Zxc/P5
 5DYA==
X-Gm-Message-State: AOAM5328Pu0Y9qkIygAduln3oLm+XLGuoYrdX0f/DQnfFTdIdi2LnSoN
 7weOn9B8ZzrpYJpAhno0rit6YLard8FwKA==
X-Google-Smtp-Source: ABdhPJyDUwaS/e+2UD6Rws1IjhDaDr2WMradylsKA9GbZ1ZG0tfOlg9emk0gRwvLldaHwNBHY2AFMQ==
X-Received: by 2002:a63:8f13:0:b0:375:2313:4096 with SMTP id
 n19-20020a638f13000000b0037523134096mr8436416pgd.466.1645840770653; 
 Fri, 25 Feb 2022 17:59:30 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa79f0f000000b004f3c48096d1sm4500281pfr.158.2022.02.25.17.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:59:30 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL v2 1/6] hw/openrisc/openrisc_sim: Create machine state for
 or1ksim
Date: Sat, 26 Feb 2022 10:59:19 +0900
Message-Id: <20220226015924.1293022-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226015924.1293022-1-shorne@gmail.com>
References: <20220226015924.1293022-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


