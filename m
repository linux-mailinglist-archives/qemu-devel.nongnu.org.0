Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DC2EFFA8
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:46:34 +0100 (CET)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDdZ-0001TX-K9
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTZ-0000ue-ID; Sat, 09 Jan 2021 07:36:13 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTU-0001XJ-0e; Sat, 09 Jan 2021 07:36:13 -0500
Received: by mail-pf1-x434.google.com with SMTP id d2so8018878pfq.5;
 Sat, 09 Jan 2021 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=co4+01plcMDklfphwAUe6tgXN/qjYqocNNI7W6fX0o0=;
 b=SYFIVItpDjUMf9Urp35g6no2zi5PbB2hOcTikRIGkcAoKGd3m5X3wVPzjAuo9FP9wI
 bZ8cGc1eAe1UIEVp4iLKJDOY1HstFJX+wBFqqglUFd90xHM2Gnh4AxCzBiCoccSHTU5N
 iZwkOK7fpjAQQ/cTtn/UGJ766utRjT3IC/imxHcydlBCwfukSWm3OmYfgSRl+ydajfjr
 DXa3fvqMm4SfbRVNb/OXhPUPsTjz0HBGx0QCFCjGr/ugb/Aw2XJveIbKKSB7egDJTUs6
 5cY/13oJNSOhsJvGCYlIuZPN3yc+BPNqQqP/FGK22A46AfJdgYiaAHx1WPQIdj7YxBKG
 njkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=co4+01plcMDklfphwAUe6tgXN/qjYqocNNI7W6fX0o0=;
 b=JjOqnIVpQlbbKF3vFTHDO0vRd3TszNv55vHOSg9iNlPrGT/cNjZL8Of0hvxQFH8tYX
 5mAuXNK5Rf0QT+9pHafZkphBa2Cf/fmn4MVxme2NaNMP1XWSOha/RcJp0jKw1RmEdpFV
 g72LZlYFkV0sZyxWSh6fC7rTz3NoSqXmiW3Q0Vf7aVj5I9VlwKaWyMt8EHbASgdcQTFD
 3B8PfIHo32ng/u9NreksnbOlJJymG9ZEqzvTnkhvkOvi40rtKg24GAy2/a/V+PKEjIkq
 HXY+vdDcMjf+EA1iukhIsg1xL1oqXJKVBSf93k4J7S3vlujHXxw+373XL+mHV2SNOdFf
 7ZjA==
X-Gm-Message-State: AOAM53328TaaJWqD8x6ZYleH8lACKQg3YLyMwywRGW493lSv3arehSf8
 6FMxtNbPv06bHUpR0Swogyg=
X-Google-Smtp-Source: ABdhPJyECys33XlgX+x9BOV27QKrBoIP7h4PA2iUgOaeSwjw2GtcigjY73ceV/XCV1BSJJ/4JOCzOA==
X-Received: by 2002:a63:4559:: with SMTP id u25mr11304263pgk.306.1610195766316; 
 Sat, 09 Jan 2021 04:36:06 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Sat,  9 Jan 2021 20:35:40 +0800
Message-Id: <20210109123545.12001-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f364..eeaf49bbac 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -77,6 +77,9 @@
 
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
+/* number of chip selects supported */
+#define ECSPI_NUM_CS 4
+
 #define TYPE_IMX_SPI "imx.spi"
 OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
 
@@ -89,7 +92,7 @@ struct IMXSPIState {
 
     qemu_irq irq;
 
-    qemu_irq cs_lines[4];
+    qemu_irq cs_lines[ECSPI_NUM_CS];
 
     SSIBus *bus;
 
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae454..e605049a21 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -361,7 +361,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
             /* We are in master mode */
 
-            for (i = 0; i < 4; i++) {
+            for (i = 0; i < ECSPI_NUM_CS; i++) {
                 qemu_set_irq(s->cs_lines[i],
                              i == imx_spi_selected_channel(s) ? 0 : 1);
             }
@@ -424,7 +424,7 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ECSPI_NUM_CS; ++i) {
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-- 
2.25.1


