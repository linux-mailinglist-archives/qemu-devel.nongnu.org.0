Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F12552F44
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:59:12 +0200 (CEST)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3af9-0004n1-WC
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR3-0007qn-6V; Tue, 21 Jun 2022 05:44:37 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:38437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR1-0007Ot-IW; Tue, 21 Jun 2022 05:44:36 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 c3-20020a9d6843000000b0060c2c63c337so10278690oto.5; 
 Tue, 21 Jun 2022 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZxwtskLmFvgISK1U3su1Dai1pSu06Ej2pDh25MW1aY=;
 b=DR9fY6/mWr1jhFCwwllDhF48zkKZn8xlQNfXE8tu8C5EFvj2BDwqFfVlkve6dLTE2R
 K8FDiTo2FjwHH/E3N0Oeagnra0G5Srmu/CxdHQHleQ0VP9g41vC1ECffl9PtqSqD8BDO
 psmi78WecU2SfEecWVxiMoLnmv7c0IqYsgwHrqqZRjkJGVUMOLWTthFafelYWoC/nqRL
 eZFubrw9OCu1Fova0CputZ14BkwP0MZ54aYeLJPtrlxIiI0pEYqkVHoxQXz1U2R2EnGc
 8laHXJBFngtwQshQyLSx9EjiCFWfSD8lCkaxXZBhUEM6gzMBT+G6CFZJIgVV9XDnvUrc
 8dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZxwtskLmFvgISK1U3su1Dai1pSu06Ej2pDh25MW1aY=;
 b=6bxE41WG4REnqdjZaKFzwta0NvhxRJxEXbSX/MK+OI+XzG6nvvKreGVn6beKAnRlx+
 CPuNJAUO1v2FJ1d1HdA0xC9lvUq8pTnMnzWc3S6uRFQcS+WIL4wifrWtiAsx2+hVvlJ8
 tUdWBQG11RU4a80YOeYeV7nzUPwuD588V9f01ZhiQKZJ7dVTMmxSw5KYtWjpp91GtZNi
 ZHdAXR+RHapQc6C7aFmZGXLYYRgYmID2TDYLRod1hLX3MJiy9YO5m9RgvsZ78zBXmbxN
 VpX2fOwv+Vd2NvrOAsYooCU5D8qQgFvhF/e0WBChaaqLog6iIy+lYjy38987NrSXIb2y
 OE8g==
X-Gm-Message-State: AJIora/gTriUTqS7TxMtLWQV2CHt79ovO+UTnJhDL5W/A3PKBvqd99qp
 wzdyGxLVlhj42HQ9d3B5MPrgA55DSUVA1Q==
X-Google-Smtp-Source: AGRyM1s2Q0MqJjsgvmI8KTLzs65skmSTPwSAktQKjlkft+0H5Cvn4pla3EbHJl+poqZ/tl7djvyE4g==
X-Received: by 2002:a9d:468b:0:b0:610:f9d0:885e with SMTP id
 z11-20020a9d468b000000b00610f9d0885emr6049631ote.66.1655804674119; 
 Tue, 21 Jun 2022 02:44:34 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 12/15] ppc/pnv: fix extra indent spaces with DEFINE_PROP*
Date: Tue, 21 Jun 2022 06:43:57 -0300
Message-Id: <20220621094400.122800-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DEFINE_PROP* macros in pnv files are using extra spaces for no good
reason.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220602215351.149910-1-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c     |  8 ++++----
 hw/pci-host/pnv_phb4.c     | 10 +++++-----
 hw/pci-host/pnv_phb4_pec.c | 10 +++++-----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3f03467dde..26ac9b7123 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1088,10 +1088,10 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
 }
 
 static Property pnv_phb3_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
-        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
-        DEFINE_PROP_END_OF_LIST(),
+    DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
+    DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb3_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 13ba9e45d8..6594016121 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1692,11 +1692,11 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
 }
 
 static Property pnv_phb4_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
-        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
-                         PnvPhb4PecState *),
-        DEFINE_PROP_END_OF_LIST(),
+    DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
+    DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
+                     PnvPhb4PecState *),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb4_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 61bc0b503e..8b7e823fa5 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -215,11 +215,11 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
 }
 
 static Property pnv_pec_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
-        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
-                         PnvChip *),
-        DEFINE_PROP_END_OF_LIST(),
+    DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
+    DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
+                     PnvChip *),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static uint32_t pnv_pec_xscom_pci_base(PnvPhb4PecState *pec)
-- 
2.36.1


