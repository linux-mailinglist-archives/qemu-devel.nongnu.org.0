Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6B4D1FDB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:15:18 +0100 (CET)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReMe-0001Gs-Rr
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:15:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReL5-0007fn-Vc
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:39 -0500
Received: from [2607:f8b0:4864:20::42e] (port=38868
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReL1-0001wU-LW
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:39 -0500
Received: by mail-pf1-x42e.google.com with SMTP id f8so74605pfj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aRgGA+YSFOUe5BsFmqTLLgWBcBUGKO4PrdFGl92DPc=;
 b=YOo4ccLgt1HZaFWANMlzlUsde1jmKO3UDYIY8ZEdO8yMpdzg7Q/WmdOLXj0dMtUVFE
 XxVsrYKsgBl/gApe1jBf6i5nWvAKksjftgOH5wVjCs4fZSXiIYm6p0++CW91JuNaxGZO
 2XwuIT1A6fz9EmUylxbE3vIvYexi4KMdusR3dUYNNeSt8ZQTpJanvenoyFuw2grh76Xo
 kLbzVfWkGENSVxd7czSylSJOqH5FqexfXv7/TmyXXhGwLkO/XVVFbwaV2uX5lu3XhYKW
 fEkFg6BZjDi/9myyjAbx711giQidIlqHJtiC1On0SdMjGZhO2pLB1m7sYwoxo5weRU8w
 GH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/aRgGA+YSFOUe5BsFmqTLLgWBcBUGKO4PrdFGl92DPc=;
 b=OniQql48/FMpt+veUXGMr5jUHUjdwJApk+0EHnpXJIVAboMrmzzmH5+6PebMrgi0fA
 mT90E4ECngBpVzocvAjzQi4EwHZRJOBYlDdFInXhGZ0xdSY1TAL05XcKafvEwPvB8BQS
 lJtMh2b3lQg4eTRaT7R04akhSrqsJrvqtpiP3394Jn5+hRxzhLcvifQuqMYb82Toi0NG
 Cp74aRT4v5OzivelIWSLWlHIi0axApm7nqVkp+Pkf6dvh/CxCPjRsXAyB793s2FGypjb
 blBLH7t4qPp14eTviB1pcel8A0YHwvA03CFsRlx2X7l9CiFeSR/d1G8XSP0moa2mAMYu
 Tzqw==
X-Gm-Message-State: AOAM530YxxV2+Pbu2u87wvzMWYmDLjbaCBrIde/GgtsurVdQ0BbItfnT
 m8KEMg5lwfsYI7YZpy88+PJoBGzuS/8=
X-Google-Smtp-Source: ABdhPJyLUKHEelpVwN6szJ1kJteZzZ7soAuYa5w4WAmRYBGwwsx1AvS1hch1XWA361lCxmD61s8d7A==
X-Received: by 2002:a65:5843:0:b0:347:6fca:d6de with SMTP id
 s3-20020a655843000000b003476fcad6demr15076478pgr.168.1646763214084; 
 Tue, 08 Mar 2022 10:13:34 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 s3-20020a056a00194300b004f6da3a1a3bsm13658094pfk.8.2022.03.08.10.13.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:13:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] hw/i2c: pmbus: add registers
Date: Tue,  8 Mar 2022 19:13:12 +0100
Message-Id: <20220308181320.79400-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Titus Rwantare <titusr@google.com>

   - add the VOUT_MIN and STATUS_MFR registers

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20220307200605.4001451-2-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 24 ++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 24f8f522d9..07a45c99f9 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -368,6 +368,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_VOUT_MIN:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_min);
+        } else {
+            goto passthough;
+        }
+        break;
+
     /* TODO: implement coefficients support */
 
     case PMBUS_POUT_MAX:                  /* R/W word */
@@ -708,6 +716,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         pmbus_send8(pmdev, pmdev->pages[index].status_other);
         break;
 
+    case PMBUS_STATUS_MFR_SPECIFIC:       /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
+        break;
+
     case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
         if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
             pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
@@ -1149,6 +1161,14 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         }
         break;
 
+    case PMBUS_VOUT_MIN:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmdev->pages[index].vout_min = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
     case PMBUS_POUT_MAX:                  /* R/W word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmdev->pages[index].pout_max = pmbus_receive16(pmdev);
@@ -1482,6 +1502,10 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->pages[index].status_other = pmbus_receive8(pmdev);
         break;
 
+    case PMBUS_STATUS_MFR_SPECIFIC:        /* R/W byte */
+        pmdev->pages[index].status_mfr_specific = pmbus_receive8(pmdev);
+        break;
+
     case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
     case PMBUS_CAPABILITY:                /* Read-Only byte */
     case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 62bd38c83f..72c0483149 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -43,6 +43,7 @@ enum pmbus_registers {
     PMBUS_VOUT_DROOP                = 0x28, /* R/W word */
     PMBUS_VOUT_SCALE_LOOP           = 0x29, /* R/W word */
     PMBUS_VOUT_SCALE_MONITOR        = 0x2A, /* R/W word */
+    PMBUS_VOUT_MIN                  = 0x2B, /* R/W word */
     PMBUS_COEFFICIENTS              = 0x30, /* Read-only block 5 bytes */
     PMBUS_POUT_MAX                  = 0x31, /* R/W word */
     PMBUS_MAX_DUTY                  = 0x32, /* R/W word */
@@ -255,6 +256,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_TEMP3               BIT_ULL(42)
 #define PB_HAS_TEMP_RATING         BIT_ULL(43)
 #define PB_HAS_MFR_INFO            BIT_ULL(50)
+#define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
 
 struct PMBusDeviceClass {
     SMBusDeviceClass parent_class;
@@ -295,6 +297,7 @@ typedef struct PMBusPage {
     uint16_t vout_droop;               /* R/W word */
     uint16_t vout_scale_loop;          /* R/W word */
     uint16_t vout_scale_monitor;       /* R/W word */
+    uint16_t vout_min;                 /* R/W word */
     uint8_t coefficients[5];           /* Read-only block 5 bytes */
     uint16_t pout_max;                 /* R/W word */
     uint16_t max_duty;                 /* R/W word */
-- 
2.34.1


