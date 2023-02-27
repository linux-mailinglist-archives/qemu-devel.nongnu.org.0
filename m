Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B524E6A44F7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:44:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFQ-00029f-PM; Mon, 27 Feb 2023 09:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEd-0000RW-E1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEI-0001Cr-QV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2621044wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fusPliZxFroR31tM0titpPE2I3vuj4ZeCjqW1pWpihU=;
 b=VbkeYioHaKWC9ppe0N3KlVLItL89O7jqZU5XvsrRy5MEAMqM3c5RJhcrqqz9liGJXw
 U0loIbNBreHKE22SKQW05imGz8fwl9NECH3ThURz/io26GbaVoG0QepMr8wM60OhQ4yE
 NME2+XKfScC93V1bHTy0k3cIqGXS4BOCHdqAAV+uGTuhdQnyihd3hIxQZ6Px3ms6TXpB
 WGmliWRYOYL0woQnXRAewm1qT8m/db7sYn3p4h9aytvDsc76ZwFWTJuvBvmWO34viTS4
 WemN1EfsOdpd2DXOwcHLvTiXiajaKTJzUuJOj5nuw9PgOx87y/YNHKfvKk0hr9AojXvf
 dnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fusPliZxFroR31tM0titpPE2I3vuj4ZeCjqW1pWpihU=;
 b=1JHMLAYoWlJPgmMmrzEiKG4hJaDRIjSfwJ3lnDwkQ6vOJqPfEzWCdxqrvXJb0Lpj1y
 zFteEDr5J9HEhcbpA98edvKNaucGYerwdFMVk+IgAda3Pu99GYM6VwFfNuVrjZFnmjDZ
 KN3gPQY2ubAL2/e3ZaIeaaMvw5jSqCpzgrZ/lGL0me0U181CqiqH9+mabsBoZUYuCTTU
 9a/zvBK7gc0d7F8hJe2VvHcyJM9kyzVHxRCqByrGmEl7hh4paD4U+A9+XxoHpd18BFnp
 n316zPWc4O7gkbp6bKiH5bn2DT2qlJRo4QQp95+TAui3S9nsSv8qRQE//jB9+aDGXepi
 vwlw==
X-Gm-Message-State: AO0yUKV6si6Ku8A84ud7WO2Sfu3XscHGu1kEPY7pZF5MqWT/jOotIXoo
 fntSfVM3aIzjHXQ2JBbrh10u3CxotsefHbjr
X-Google-Smtp-Source: AK7set+yyqBvqBtQVafgC2PuCbIkIWrx7RPHkfCxHezTP+KKw2KeY41zV/sGx4/SExwONozFKl44Mg==
X-Received: by 2002:a05:600c:4d18:b0:3ea:e554:7808 with SMTP id
 u24-20020a05600c4d1800b003eae5547808mr9946317wmp.19.1677507109187; 
 Mon, 27 Feb 2023 06:11:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a1c7318000000b003dc522dd25esm9082325wmb.30.2023.02.27.06.11.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 115/126] hw/ide/pci: Unexport bmdma_active_if()
Date: Mon, 27 Feb 2023 15:02:02 +0100
Message-Id: <20230227140213.35084-106-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

The function is only used inside ide/pci.c, so doesn't need to be exported.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-18-philmd@linaro.org>
---
 hw/ide/pci.c         | 6 ++++++
 include/hw/ide/pci.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 2ddcb49b27..fc9224bbc9 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static IDEState *bmdma_active_if(BMDMAState *bmdma)
+{
+    assert(bmdma->bus->retry_unit != (uint8_t)-1);
+    return bmdma->bus->ifs + bmdma->bus->retry_unit;
+}
+
 static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
                             BlockCompletionFunc *dma_cb)
 {
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 2a6284acac..7b5e3f6e1c 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -55,12 +55,6 @@ struct PCIIDEState {
     MemoryRegion data_bar[2];
 };
 
-static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
-{
-    assert(bmdma->bus->retry_unit != (uint8_t)-1);
-    return bmdma->bus->ifs + bmdma->bus->retry_unit;
-}
-
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
-- 
2.38.1


