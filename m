Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2584C9ABD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:53:54 +0100 (CET)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEBc-0001Th-Ml
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:53:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3h80eYgYKCrQncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com>)
 id 1nPE90-0007M2-Pt
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:10 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=56150
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3h80eYgYKCrQncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com>)
 id 1nPE8x-0004xX-Bd
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:10 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 b18-20020a25fa12000000b0062412a8200eso153507ybe.22
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=psSMCNKv2yqoyBWLtLGO59oWBEWLqDJSO6USW3rcrSM=;
 b=qbAA0sUfF1cD7Aex3ZpkZvhuGVfeNsbCKuFI2FSM8NVDF3kUX/zdo+h8BC9J1uSSui
 RFuMF/4OZ/Hzi3t/2eT0awPiaf/XBJ5ewgSlF3o7qBoxk0LmmWzFB9dx2uVdfkKP1C8p
 Q0BX9a2H8NWffhNHkulwgQA+Os8at++jkdXGukbXLbCh4M1bHdC0jltR1Eivr9PjuoxM
 OUAG5RX09mSy9CYEvpdIySEGkW38TF3AyT9az7hqyntHEF9Q46URLgWB3kY8umQTzIKW
 +1LEbc+lx/6vkF9i0GCC5H/iQfzL8FMcKrC/Y2zdpokMzVotAYo3uvUNjeNCSeUQpKOv
 07NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=psSMCNKv2yqoyBWLtLGO59oWBEWLqDJSO6USW3rcrSM=;
 b=esbydNq75Fb93DAZuoz5NcWFfNbtejQniMU8g75+C7axWirCFfZr2FQw0Ck6rylgil
 s8d/CHrJ1F9IbwwyhpLXGALLu9fNCGl4Wadkx+SSaFNW3TOPCMRNAz5Smu0s/d5xObe/
 IeNVNYxe3/dpRr3MGQjHbs2TqqyhT5LXJCR5ttVE94g9FPgl+A/t27plpUgw3b9VaM1j
 YLDBkjO9M/nCUf85pkXKWhb70QYoF/+kfPyZXuFbZCj7SUMvria2XEKdmSaWO1gu8XKQ
 pBUmCeqnMrjinWXqkLMObl8Q6lrjnZcM468B65uDwF0M6yUHLJLFU3w+7YvZTCc1MViR
 0okA==
X-Gm-Message-State: AOAM530agixzGjqdnDW0cHI1SSima2LYF5kvpCHBTX+JnMyR5VNTPH/P
 7JiMcZ11TharusRzx3dEhogVZnPQfhg=
X-Google-Smtp-Source: ABdhPJzU6hZp5dQ4LzuPqKAk4pIFHD4SUNz1xeljzM3NeiGoxdRdS7Um/FtnTllq3ICySAY9UobHVi71X7k=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:a1e4:0:b0:620:f638:3eeb with SMTP id
 a91-20020a25a1e4000000b00620f6383eebmr27581480ybi.392.1646185863148; Tue, 01
 Mar 2022 17:51:03 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:45 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-2-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 1/9] hw/i2c: pmbus: add registers
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3h80eYgYKCrQncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

   - add the VOUT_MIN and STATUS_MFR registers

Signed-off-by: Titus Rwantare <titusr@google.com>
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
2.35.1.616.g0bdcbb4464-goog


