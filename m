Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF754D1FFD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:20:33 +0100 (CET)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReRk-0004Z1-Gg
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLi-0000mC-3U
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:18 -0500
Received: from [2607:f8b0:4864:20::435] (port=47056
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLg-00022j-KB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:17 -0500
Received: by mail-pf1-x435.google.com with SMTP id s11so37499pfu.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qoO0aOTEMzeuoSO2zvGHsWf9YN5JNGZ9eDkl4rl2If4=;
 b=fA2oL4LvfnpIFGYT7hMHYaK8mJuJD4ANAKPolwaZsluziRzqAcZy/g8sryja4m48kB
 LJxD7bi09/MtBPHW4KNzJfNGs8ExGHL3e6UGiRiOv0TKRNVPtqRiPEHms9EJM38XABt/
 /4BE8i/gucm1SvSXnOHxCk0rVHQ2ali4M3iwgN7+XMDhCWf05oOX7wcCLKfg/d0YBgdi
 12sKGHn/yvCNxyQCoDzwjY2FmiCDmDWWabnAL0v3lNzxYfSQkYIVZoOk7Pqs6Bb2oU/V
 M4w6nNGDo+48E/UBI3wWVsy8Pj5tqKUsdnr44RA6Uge+1LvDVcy7P2lDKK6UO2+RERgi
 3EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qoO0aOTEMzeuoSO2zvGHsWf9YN5JNGZ9eDkl4rl2If4=;
 b=fbINARYDt8advU6x3H7e1RdpcW6ooYjif1NrRXuEDMTffrrY9K1jhZ2wDbonab/Vbt
 8sL7zSzO/8xfLifURUrrYsnAfMdt20Yv6UT1kFCcCfeeiErEmE8aiQVTi5hfszyHiSWU
 zF8CLznbJgdpigp+JYfVeEdlzbPU3LlrT/ClUBiZZGaFTn8uuQN73JWKob7qEgQmoEsL
 /e7/ktRxvJ5kNDJfCAncK2DxiWJVuwvcdz2OJ47qIbPqOzSwirMQuQxTkGcrireXn9Ek
 xzSXvznwfKC1Wnp7DMJoYay3Jjvn7qVZ740w9h5dfNeEbkXut/C1u8Th1hzMPFqJwkvz
 PMvA==
X-Gm-Message-State: AOAM532xoACG+YlIb+FjHVqIqEV8oP+7Sb4GVha9Opvd9cmqnKEAXVje
 2EvHZl717u4g4w0oWrNIFbAwQp8Faac=
X-Google-Smtp-Source: ABdhPJzJOET0O5VwFZKPDTdVlSX7PBFahPncnQxebB/uyLf0MHwqQGiHNEfIvmNR4xIZ73eUfAQz/Q==
X-Received: by 2002:a63:1112:0:b0:380:7ef:1f1c with SMTP id
 g18-20020a631112000000b0038007ef1f1cmr13572979pgl.152.1646763255220; 
 Tue, 08 Mar 2022 10:14:15 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 pf15-20020a17090b1d8f00b001bf5d59a8fdsm4069449pjb.2.2022.03.08.10.14.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:14:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] hw/i2c: Added linear mode translation for pmbus devices
Date: Tue,  8 Mar 2022 19:13:17 +0100
Message-Id: <20220308181320.79400-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
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
 Shengtan Mao <stmao@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20220307200605.4001451-7-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
 include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 8cb9db0f80..62885fa6a1 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -28,6 +28,24 @@ uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value)
     return x;
 }
 
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp)
+{
+    /* L = D * 2^(-e) */
+    if (exp < 0) {
+        return value << (-exp);
+    }
+    return value >> exp;
+}
+
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp)
+{
+    /* D = L * 2^e */
+    if (exp < 0) {
+        return value >> (-exp);
+    }
+    return value << exp;
+}
+
 void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len)
 {
     if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index bab4526734..0f4d6b3fad 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -448,7 +448,7 @@ typedef struct PMBusCoefficients {
  *
  * Y = (m * x - b) * 10^R
  *
- * @return uint32_t
+ * @return uint16_t
  */
 uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
 
@@ -461,6 +461,24 @@ uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
  */
 uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value);
 
+/**
+ * Convert sensor values to linear mode format
+ *
+ * L = D * 2^(-e)
+ *
+ * @return uint16
+ */
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp);
+
+/**
+ * Convert linear mode formatted data into sensor reading
+ *
+ * D = L * 2^e
+ *
+ * @return uint16
+ */
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp);
+
 /**
  * @brief Send a block of data over PMBus
  * Assumes that the bytes in the block are already ordered correctly,
-- 
2.34.1


