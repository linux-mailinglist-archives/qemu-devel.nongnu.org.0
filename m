Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D66A9363
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zA-00080k-Sy; Fri, 03 Mar 2023 03:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z3-0007nm-CO
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:45 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z1-0007tj-DG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:45 -0500
Received: by mail-pf1-x42c.google.com with SMTP id bd34so1091769pfb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832902;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AS9hiZl0QHmELtD5efmoWyb9Kuen5W+Uc8UohPs5jS8=;
 b=GF0VGGHrbOAFtMFLpLS3sPoBSIth7DzMVNbrkFkq4UN6HdCg5vlnwzl0hPmk6nNaiI
 sEgLzKpKeYJ87/HGYkOznUtKvhiwK0hsHyZVHqjAzw4YJBJHJ7wTZdLrEpA0yqtFWcJm
 todytLF8Tg3aHdte8fgiKz5ToaWEn7E/hREHLIJWWaYJltrRiMmcamva+Nz0Hb1v9dyU
 no4R488lqLKuG7wCqj4T/u/kzCJhpVjCfHDh1N7x7+kXyrIdCxy6vc4oCz+OvvrcJGKg
 JcRKA6H7e2PnTDJqUo+OudhpdO3rwQSJE+/qTqrAmAACJLx6OMai7F+gWBd6uRlQ7mRO
 HwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832902;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AS9hiZl0QHmELtD5efmoWyb9Kuen5W+Uc8UohPs5jS8=;
 b=CEGMk5e0IIr2COo0BdeNIhGCHXUTdRG0dicsSUA/ibDsXB1jXVVKxerRy7AH0U8w7+
 Kf10SakArhOVh5FUbL+VNBD0iwzk210sZV8YF8cCOR8PXJyS2iviWy6WLUQgw8wQal9y
 azx/3mBgscMR28/wSZI/yjd+XDqBrSplThJwSdsyXU0TW6B7oil1Bz4TQJR9akecQm4N
 HFm1bqW6zfatQCySI7zZ0DEzAYIm7lcUYzGaBYCTYAFz/BHVB/FAAtXFDB3PIBa5s/ER
 Xcy1Tp8VRsJfi/KA0XUbrQFBpjTiptQWZhDM0bHkLTath2GGjj/VYFtcqvKLNh16FqlC
 CAAw==
X-Gm-Message-State: AO0yUKW12on4LyY5q/QuhOQiEKtgMxrVQC+MbTDWc526O01HLJnmHbzD
 JdCR4NSUnqPuLHzOqNMzY18CWw==
X-Google-Smtp-Source: AK7set+GF8ylGbOcPgnGkkHo3QO5dUA4Xnu6zzcp6QZaS9evXMYyK+MdJviZ5GVxj9/NswQFP7CDrQ==
X-Received: by 2002:aa7:948e:0:b0:5a8:b911:a264 with SMTP id
 z14-20020aa7948e000000b005a8b911a264mr1281302pfk.28.1677832902043; 
 Fri, 03 Mar 2023 00:41:42 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 f6-20020aa782c6000000b005d6dff9bbecsm1036415pfn.62.2023.03.03.00.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:41 -0800 (PST)
Subject: [PULL 17/59] target/riscv: Indent fixes in cpu.c
Date: Fri,  3 Mar 2023 00:36:58 -0800
Message-Id: <20230303083740.12817-18-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fix indent problems in vector related check.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-8-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49ac368662..9b8747ab15 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -798,7 +798,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
         if (cpu->cfg.ext_f) {
             error_setg(errp,
-                "Zfinx cannot be supported together with F extension");
+                       "Zfinx cannot be supported together with F extension");
             return;
         }
     }
@@ -861,40 +861,40 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVV;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
-                    "Vector extension VLEN must be power of 2");
+                       "Vector extension VLEN must be power of 2");
             return;
         }
         if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
             error_setg(errp,
-                    "Vector extension implementation only supports VLEN "
-                    "in the range [128, %d]", RV_VLEN_MAX);
+                       "Vector extension implementation only supports VLEN "
+                       "in the range [128, %d]", RV_VLEN_MAX);
             return;
         }
         if (!is_power_of_2(cpu->cfg.elen)) {
             error_setg(errp,
-                    "Vector extension ELEN must be power of 2");
+                       "Vector extension ELEN must be power of 2");
             return;
         }
-    if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-        error_setg(errp,
-                "Vector extension implementation only supports ELEN "
-                "in the range [8, 64]");
-        return;
-    }
-    if (cpu->cfg.vext_spec) {
-        if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-            vext_version = VEXT_VERSION_1_00_0;
-        } else {
+        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
             error_setg(errp,
-                   "Unsupported vector spec version '%s'",
-                   cpu->cfg.vext_spec);
+                       "Vector extension implementation only supports ELEN "
+                       "in the range [8, 64]");
             return;
         }
-    } else {
-        qemu_log("vector version is not specified, "
-                 "use the default value v1.0\n");
-    }
-    set_vext_version(env, vext_version);
+        if (cpu->cfg.vext_spec) {
+            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                vext_version = VEXT_VERSION_1_00_0;
+            } else {
+                error_setg(errp,
+                           "Unsupported vector spec version '%s'",
+                           cpu->cfg.vext_spec);
+                return;
+            }
+        } else {
+            qemu_log("vector version is not specified, "
+                     "use the default value v1.0\n");
+        }
+        set_vext_version(env, vext_version);
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.39.2


