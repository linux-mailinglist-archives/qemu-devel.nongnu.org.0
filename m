Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5F4C9AC5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:54:24 +0100 (CET)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEC7-0002Gc-CT
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ks0eYgYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPE97-0007cx-WE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:18 -0500
Received: from [2607:f8b0:4864:20::b49] (port=55251
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ks0eYgYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPE96-0004zt-FA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:17 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 x11-20020a5b0f0b000000b0062277953037so156082ybr.21
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=PrPSE+alUxesQE9QCHPpKglatXwma04vyfRTLAysKvatKxN9oo1nHmGL4Fmy5i445q
 BAhSppH+QyB1oIB9JPxXHTrzibhsbLGXQcCmkWAavVYkShilJ9g54sz+oq6fxDz1cRvk
 78IyHrwshOpRcohd6nU/gp8i/uH3PW9LKjBqzJ/gZY+wDL2De8moT7MRalnFcI4NcDzo
 hUO/V2wd4XXwSkj9xKE9D9c8rY713QaqGd2copJ4EwGpgobKCkXyX+R6idwiVhathY6m
 noruaEPkKEw6Ix41GtF+7PYvgjykXwPjYi8sSTkA7qqApyfAH+hiv/sWzRlgF8nxqtmo
 2DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=2GKmr41WlSpkGYGtOm5akUicBgQyfrnM+ca2dP618ZIGMPmAB3nP1QH6PlD5i1FX+I
 TVCUr3gFZGztJ22ioQ0JKXXIcwRgtGgT/mGSRNxQJq/tCmzKML4mNioRZ6IjSlDGnUPE
 pLkQp4vNaWu6H4NByY5p9yUxoHBGb+3UAp4EsDdYYYIAEHeol4jF29gpouGRYDBWmJ0n
 31qE7P/ncHuBvBJByVuiPIPcib82PzyOrLfZJBPscqzHZLWZc9ExcQsJgky0vBAi5vm9
 WiWZW0HaeGUpQJJMfYqDC0Lh08VR7tb8fgA8gD0FecGTg9cGzpF5q5np0pLWM38g+Hym
 adJQ==
X-Gm-Message-State: AOAM531G8GVvwDljSO01r3Pk7Ho9ERyEV/h8mHxembKUwq4uxxSWDZBS
 Rz7gpNZFNgPjqeaKb3clPxj1t8xziec=
X-Google-Smtp-Source: ABdhPJyoV5I0jVXj9QFzW1RqDgFl0QEw1yXEAr2ze9FQJ6t5PDDomSQLIFB6A0W22RPPxp61Z/+20bqsmuI=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a0d:ca8f:0:b0:2d6:b8dc:13f5 with SMTP id
 m137-20020a0dca8f000000b002d6b8dc13f5mr28277501ywd.323.1646185874896; Tue, 01
 Mar 2022 17:51:14 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:50 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-7-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 6/9] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Shengtan Mao <stmao@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ks0eYgYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com;
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


