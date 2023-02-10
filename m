Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B9691FFE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTgn-0007w4-2P; Fri, 10 Feb 2023 08:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pQSs9-0001aj-4i; Fri, 10 Feb 2023 07:51:25 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pQSs7-0006SM-DJ; Fri, 10 Feb 2023 07:51:24 -0500
Received: by mail-il1-x12d.google.com with SMTP id b9so1938575ila.0;
 Fri, 10 Feb 2023 04:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NfGPvny6NxPc9Mfi2uNmNsYLGPUMbT5SqnsspfIokgE=;
 b=aViDOMgpo6TwNvuv90RfMp0Sjp1q1oGgepdq1ZybVKQd7K5hmrpdEfjOy+0McBDQoF
 Sw+0MKwVkTz19Nuipw7OAYtzISD1J+7wviUArX/QOyaigga2sAfwJsOgBhvcDfqvfpFQ
 pK9vr7NTQgjhOwHFC70ppQbUJM4xZr7ILAwr3QUFKyEXQJn6HZ61Pochnq5Es9SEdQRp
 qVNXGQzdEVEsqmtZwcmeyxJd9+0vZcleMiW5WKYRKxc9uvH7CoeO6kUsDjrKjJrv1EzY
 He9HQHhL56alQpI9SR/hrgUouRWCa1Oqn6U79hJemL7+exlIMCNcx7Lgi1mevrsmJfSg
 vWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfGPvny6NxPc9Mfi2uNmNsYLGPUMbT5SqnsspfIokgE=;
 b=m8oAyVte+l6hnX/hCANApOP7U1sb9I+nt3YU1u7GgarhPLo+VNKx4Jzspl/VyDolXr
 p8GEAmfKljKlBQ7qljTnwL56MxvNFEJyL9JXBuHuhfWPeKjoGUg4xTDHibthv/Fk5ngk
 pE044P4ptJ4+VUyiOwSAlh63krazz1jwodCmVwFzacjurVFhHtwPissFlqSyd/NZtVQG
 yJkv9IhV0qD2YB03Zp+Rdm38a6TJtL4qvI85sLYi3/wOvCTtZMpVjN0ffvGrwAlpq0d6
 40EEqTbNPlJNrjkK3CvPpaLJqpOUU+aZnp5zQy/NQNLwgZVYUhKOygmHHpOEIEAjvuVi
 A4Pg==
X-Gm-Message-State: AO0yUKVZV0kjRfAJtb69rMssCWdfc56/KLXr5dxn2788i0d+vE0VEZgx
 6jW4VbNqY6GFfU77TyrnDWw=
X-Google-Smtp-Source: AK7set8ISfrgX96OWugVk9olAVkKKcd4Iz7PmtFVGxeeeSwikny4zwwVDaeek3W1MZrNE2FOmqqnGA==
X-Received: by 2002:a05:6e02:1bc4:b0:310:fbaa:192b with SMTP id
 x4-20020a056e021bc400b00310fbaa192bmr16573354ilv.30.1676033480601; 
 Fri, 10 Feb 2023 04:51:20 -0800 (PST)
Received: from hcl-ThinkPad-T495.hclt.corp.hcl.in ([192.8.226.44])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056e02106b00b00313b281ecd2sm1292004ilj.70.2023.02.10.04.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:51:20 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Adding new machine Yosemitev2 in QEMU
Date: Fri, 10 Feb 2023 18:20:29 +0530
Message-Id: <20230210125028.839131-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Feb 2023 08:43:40 -0500
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

This patch support Yosemitev2 in QEMU environment.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..74dc07190d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -536,6 +536,14 @@ static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
                             TYPE_PCA9552, addr);
 }
 
+static void fb_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* The FB board AST2500 compatible with ds1338 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
+}
+
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1191,6 +1199,24 @@ static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_fbyv2_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
+    amc->hw_strap2 = 0;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->i2c_init  = fb_bmc_i2c_init;
+    mc->default_ram_size       = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1554,6 +1580,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_sonorapass_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("fbyv2-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_fbyv2_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("witherspoon-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.25.1


