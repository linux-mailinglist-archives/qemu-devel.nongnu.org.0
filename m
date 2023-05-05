Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8E6F7A4D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujs3-0000Qk-2D; Thu, 04 May 2023 21:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujry-000089-Mz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrv-00070B-Sk
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-24e16918323so882182a91.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248658; x=1685840658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7BRB0VvCbUWARshHRUihAqCFtRb6NdUeQ4X2RByb3U=;
 b=Nr88YLii+qa8+NZIRknUzHOIsV04zQnxHbEbggfmEEBJl0Wv7+SPS4y9moJST09MdB
 m2d6ZVCeNWdkWDx03vtoPTcqVdPfetB6wzo2MyT1azvQIMAH97ErUJ8lqXWB/r347yyY
 1oB6AllM7vAvIKIvkHOM/zldk/pbYj6MzxFaI1SQ5GFDtx8EZlgfq9U2LBhCit6u2VdX
 fAWuV/5qAWTnU0MSJ+X36US71c2j70Rw0LSzOv9NrnKV0+iOL/xrZXHbwfNlGIwBmsxT
 9sI7J/gTM3JXTmRrHvUbnVW3GdOWWHCN7zu138drwJ0v0lRbbFPMHCtfU+X+tQv5LLt9
 FSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248658; x=1685840658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7BRB0VvCbUWARshHRUihAqCFtRb6NdUeQ4X2RByb3U=;
 b=Yrb3BUHf9o28cCuCZqUs21/UH8tU9k0bw3VvkbXqLgxRq2BLCiKBd+PlkDtYO5NqN4
 9tX+1XsdjCCsiCvRRts0DVNzlYN4hhL6e1WsAh3EV9n/YvjQm4eoZ8NycQWjuGvy7yF8
 qd9Q7iGjwwlJ8uzYl0k0c/bstBe3pyDu0uE5abkAvEhUddlRe/wW9jI1qNGX/lRrRTMd
 DJCYzgKfO1Ac+Ieop6CY+WNSi9S9CaX5ICiL8rNGnUG43bO96fZOPL8m93cmR0N5lqzi
 rHHWJrcCeMV0VuHA/kmTfQr9AZIlfiBBi+VwJHWbXj0uhdtMBtX30OwitAoI1qKgyiqh
 1gUw==
X-Gm-Message-State: AC+VfDyvsCd/7wzC8ghKUo2AAQAoYUwTpFiMhFCfhVyf8UJw1OQ0FuOA
 VZhJDLxOWnW43aKRYyLLO1MzAsip83tvPA==
X-Google-Smtp-Source: ACHHUZ4wH1vySHr5v8pz05ATU9WwkJCCjrNgyRqLSA6nggYJO07wsYn8uOP4gROpJwpL57BoFoETjg==
X-Received: by 2002:a17:90b:289:b0:24e:39d2:ab80 with SMTP id
 az9-20020a17090b028900b0024e39d2ab80mr4187689pjb.4.1683248657792; 
 Thu, 04 May 2023 18:04:17 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:17 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/89] target/riscv: Add support for Zce
Date: Fri,  5 May 2023 11:01:30 +1000
Message-Id: <20230505010241.21812-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add and expose property for Zce:
* Specifying Zce without F includes Zca, Zcb, Zcmp, Zcmt.
* Specifying Zce with F includes Zca, Zcb, Zcmp, Zcmt and Zcf.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-11-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8d66365f60..5f38b0adc0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -443,6 +443,7 @@ struct RISCVCPUConfig {
     bool ext_zca;
     bool ext_zcb;
     bool ext_zcd;
+    bool ext_zce;
     bool ext_zcf;
     bool ext_zcmp;
     bool ext_zcmt;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ed8dc61d10..cd9e7bdce6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -91,6 +91,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
     ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
     ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
+    ISA_EXT_DATA_ENTRY(zce, true, PRIV_VERSION_1_12_0, ext_zce),
     ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
     ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
     ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
@@ -945,6 +946,16 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_zce) {
+        cpu->cfg.ext_zca = true;
+        cpu->cfg.ext_zcb = true;
+        cpu->cfg.ext_zcmp = true;
+        cpu->cfg.ext_zcmt = true;
+        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+            cpu->cfg.ext_zcf = true;
+        }
+    }
+
     if (cpu->cfg.ext_c) {
         cpu->cfg.ext_zca = true;
         if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
@@ -1501,6 +1512,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
     DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
     DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
+    DEFINE_PROP_BOOL("x-zce", RISCVCPU, cfg.ext_zce, false),
     DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
     DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
-- 
2.40.0


