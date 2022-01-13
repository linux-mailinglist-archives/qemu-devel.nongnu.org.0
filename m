Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC448DE5F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:51:53 +0100 (CET)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n868W-0005Wj-5G
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oK-0006lZ-0i; Thu, 13 Jan 2022 14:31:00 -0500
Received: from [2607:f8b0:4864:20::332] (port=46972
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oH-0005F3-HB; Thu, 13 Jan 2022 14:30:59 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so7453976otc.13; 
 Thu, 13 Jan 2022 11:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1scbElBbNa0PK6qT3VP5d+MvI2dPrguob0wvJ1CvnQs=;
 b=D7YgK1FJxwu9cS+KHOf523Do6iCVo3/+zcfENQnm89/WsLzw4RMpo7ha/NeoZ07nnd
 /IrFEO+aVOW5TjA2y9eIo+FYfcuJXvOxkhGp6Zwl49ZcJf+ZsP6V0fx3/xKUW0pkvWk9
 HEhNXUt27RGvZy3sqNzZK1e21mRht3yclSMV1gJ05l5JkYHL7Yax1XgExdpAoLYNn6ro
 CWDUJ3E5mdr1/PgH8NCeKQki0dY6txjWCjNOzNxqqJGWT4Vhem7XBT9/FxsVs/ndD3ee
 423L/z1pSpWFwYodMU8MNzaSY6vvEw7ZbSTXB6BZ0TjkIAmvzv2CSIgwou+6qIEaQ+Lv
 g2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1scbElBbNa0PK6qT3VP5d+MvI2dPrguob0wvJ1CvnQs=;
 b=kj11TFTSLtVCp3npksunnsX32Uli+fUS6UxqzLk7XyoO1uR5kPJcdcBG/NFjI2w6NG
 7+8EcicfOzI5vJxqG7navEA5JYYwLVDIXyOxWCWfDeuVAbGqmHcLczCpWlMmAB6DHLj6
 Q4tD7zihQPRJr/9btEveUDAzU8NVZUll/BJLvNE8qsuV5QCSyfBRHfrh2k4Mqr5JMCtd
 tFbwhFp1PMGaXZQyblqQnmc4K25mJP5MGcZJg2VbULu/mQw0QriUiI14pVUIv2PUcR8r
 vmx9t8i1z3qsDfX61Qx/JTmFg+I1TsHHq4hIEcX5/ZHQWmldKZabIyw3uIXfhE31p54g
 HaJA==
X-Gm-Message-State: AOAM530S8mRb4t/tV/EuxaNXQ6wZkLZ7QKX8zKcJfoGDLf/VSYPkRf9G
 ZpFwb3sn27osMPTjlz7Rl45b5+E+NukwJ2fN
X-Google-Smtp-Source: ABdhPJysAyg6Lns9R4/bDN9M6zSQNf+yuCvjC0ngkoUqro9G9gx0QUf1sKXH6Nbu+DZco+ZEYQ4m0Q==
X-Received: by 2002:a9d:7f81:: with SMTP id t1mr4106319otp.89.1642102230685;
 Thu, 13 Jan 2022 11:30:30 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:30 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] ppc/pnv: remove PnvPhb4PecStack object
Date: Thu, 13 Jan 2022 16:29:51 -0300
Message-Id: <20220113192952.911188-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the complexity that was scattered between PnvPhb4PecStack and
PnvPHB4 are now centered in the PnvPHB4 device. PnvPhb4PecStack does not
serve any purpose in the current code base.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 34 ----------------------------------
 include/hw/pci-host/pnv_phb4.h | 20 --------------------
 2 files changed, 54 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 61d7add25a..02e7689372 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -282,43 +282,9 @@ static const TypeInfo pnv_pec_type_info = {
     }
 };
 
-static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
-{
-}
-
-static Property pnv_pec_stk_properties[] = {
-        DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
-        DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
-                         PnvPhb4PecState *),
-        DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pnv_pec_stk_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    device_class_set_props(dc, pnv_pec_stk_properties);
-    dc->realize = pnv_pec_stk_realize;
-    dc->user_creatable = false;
-
-    /* TODO: reset regs ? */
-}
-
-static const TypeInfo pnv_pec_stk_type_info = {
-    .name          = TYPE_PNV_PHB4_PEC_STACK,
-    .parent        = TYPE_DEVICE,
-    .instance_size = sizeof(PnvPhb4PecStack),
-    .class_init    = pnv_pec_stk_class_init,
-    .interfaces    = (InterfaceInfo[]) {
-        { TYPE_PNV_XSCOM_INTERFACE },
-        { }
-    }
-};
-
 static void pnv_pec_register_types(void)
 {
     type_register_static(&pnv_pec_type_info);
-    type_register_static(&pnv_pec_stk_type_info);
 }
 
 type_init(pnv_pec_register_types);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 170de2e752..96e8583e48 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -167,26 +167,6 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
 #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
 OBJECT_DECLARE_TYPE(PnvPhb4PecState, PnvPhb4PecClass, PNV_PHB4_PEC)
 
-#define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
-OBJECT_DECLARE_SIMPLE_TYPE(PnvPhb4PecStack, PNV_PHB4_PEC_STACK)
-
-/* Per-stack data */
-struct PnvPhb4PecStack {
-    DeviceState parent;
-
-    /* My own stack number */
-    uint32_t stack_no;
-
-    /* The owner PEC */
-    PnvPhb4PecState *pec;
-
-    /*
-     * PHB4 pointer. pnv_phb4_update_regions() needs to access
-     * the PHB4 via a PnvPhb4PecStack pointer.
-     */
-    PnvPHB4 *phb;
-};
-
 struct PnvPhb4PecState {
     DeviceState parent;
 
-- 
2.33.1


