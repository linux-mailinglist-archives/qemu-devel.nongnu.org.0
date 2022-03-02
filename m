Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEF4C99DF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:31:46 +0100 (CET)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCu9-0007Xz-6J
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:31:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BLkeYgYKCgk2r2310pxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--titusr.bounces.google.com>)
 id 1nPCmK-0008Mt-2U
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:40 -0500
Received: from [2607:f8b0:4864:20::b49] (port=39429
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BLkeYgYKCgk2r2310pxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--titusr.bounces.google.com>)
 id 1nPCmH-0003Ew-51
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:38 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 a12-20020a056902056c00b0061dc0f2a94aso22219ybt.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=mO5CUDor+WI9zZ1oHZfOBwMGxSPf6O7bUsACSSTY/eohY7BbMKskHLAYUi0pG5x/yn
 BnGP41fUlFfNQ8uFsn9dwjDnivBa+7D6yuBMapQPkokb2RO5/TEv6eF7SKm6ofMxW7FV
 MASkJF/JtxGNdiJropwF8nB4g1jtRtqXvmmFmeX5c4yexYHWIPUflg7S5nLyB7ZOfnwy
 a+iLoNF5lDuEHFpkG+NrHAXko3y+WDTBIUy5gj8dnhOjmxTPfgsfajsSN1U+ddi82jBG
 QUGaOZ3EMrYIzTFx+DMeDqRTNle79Iq7dK1rIYjPUbX/VO8oliwr6fFYwCeWzCHbf7XU
 maSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=eBdeM28gGq2l3lBjcTigqaHyEqQ1szKGQS/lWSGtuRiFsjjsmGMbQlrYbF4zbJ1ay5
 PQDgE/fIgpRVuGmfg5jPVdKzmJzGYlDVo3LX2bDSTeOm7KH9FOzGarzp5fdAeZewM0X4
 Rk+0s1HVSXXHZOvoExMXTrrq/TqQY0D16mE4qOO+6eQ3atOuODAvuC5HyXRfkix7KWnS
 DCWlJREHqhwGEfEWFYl7g6gPf/CcP8+lMW3+3hKPiEPfYtegh3BIO7pVPcZc9fmfDDrv
 czKpbgbPNXW6sG5JFTQwmmmhtp4S68P92SfVLAFNlgWFjr6qgcZc75viHmWpSjKehCXc
 mjxA==
X-Gm-Message-State: AOAM533SZHrInTv0/n5ZM2gwSqUn3E7/NY5VKiXySstYJiITt2Zy18c4
 +TkfoLhokqQsXRjgLwm7MfS13IuaG0g=
X-Google-Smtp-Source: ABdhPJwW0gm81h/ePVSgzn7Axarntcgd4X+AP2uIsifpWz5yR/aT6pyI0eAzk/ZJrWdED0fKmwPiZnEjyuM=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:b004:0:b0:621:f386:f10a with SMTP id
 q4-20020a25b004000000b00621f386f10amr25596459ybf.314.1646180612929; Tue, 01
 Mar 2022 16:23:32 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:03 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-6-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 5/9] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Shengtan Mao <stmao@google.com>, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3BLkeYgYKCgk2r2310pxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
 include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 3beb02afad..1036c41c49 100644
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
index 72c0483149..9a274247ab 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -446,7 +446,7 @@ typedef struct PMBusCoefficients {
  *
  * Y = (m * x - b) * 10^R
  *
- * @return uint32_t
+ * @return uint16_t
  */
 uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
 
@@ -459,6 +459,24 @@ uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
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
2.35.1.616.g0bdcbb4464-goog


