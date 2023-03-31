Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF6F6D13E5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 02:10:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2Jr-00076o-KV; Thu, 30 Mar 2023 20:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gSQmZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1pi2Jo-00075h-TL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:36 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gSQmZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1pi2Jm-0005m1-H9
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:35 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 j11-20020a25230b000000b00b6871c296bdso20171900ybj.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221313;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tMsLrklx39gsFoa2tmyIQkWi/3Q/pCg3SBebIkEyC/c=;
 b=YOR0rQQX40HtnSABalOFeGLmSxX72wjhJWQn/E7Mn+Y3G0t+r/VbP94/DK6gd2HhIt
 XNIJPZgEARfctJi4seRG9exwvo00KGiLfpNSTwL2L+p2VM7IjmWipmyqSLMmDdmdU2Ba
 3REW6czvpc150qPD0PfpR6/jNK+Cmpr3A7rYHRKwLuu0/mbB5ClsAv79lhlHQ30uRtEs
 LWCApt4nkNzheUFnbJoOv1m5I0YnTbMVLlfqCsKQvecbUQJPrv/fxGBLWl03IjESsxqM
 +j/Cwyki8ap4ynz2Z6F7fZStEHf1HY30/SlZuiij2gk2AbepJQaBkLFhlv2bhU7MnlCc
 jfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221313;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tMsLrklx39gsFoa2tmyIQkWi/3Q/pCg3SBebIkEyC/c=;
 b=OG97mgI/sDNzC0FJ6JK2hSW7+tsFeZ/Pi0JPHHeZ9YXD3r5aEcgyeM+lL7jrTOSMzs
 n+hAB35VSb3pfnAd3bBGda78DoDJZcYUJ8DmizoWpu+ihT6myc85zuqeZgvQrnDFrDbQ
 To0OuKusuLUeK57bqWo5gFh/t0yOHP3Ob+6CNs4KU87iiw/OzKRTLwZreWOILLpepBZS
 nFbQRitbvATm4FZbqoJeq2xV+zkVsWxn4SUMt5/AIA18NfC/xM96DbL0uF9O8l/U8sUB
 jnjtm4CuVFvEivM4dSCuiiCl2FoCccJ2aOiqaCk2K/KVFMPV+jd5cN0r1yHjnuA0wY9O
 1RCg==
X-Gm-Message-State: AAQBX9dpZGpohkfn3EuSUMC51Mocys991m/5M6Obblcen0SbLBj9cCbG
 YgBi89qQ7mz7DUtdVebVUcWDcWfOo94=
X-Google-Smtp-Source: AKy350bw/hFahSrs+G6sM3BryzJuv6Q9tXUQF3OZRIfZsXL2T7mdriUR6uFaWkexuh5hPRLCZP8KdNt4cKc=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:a84a:0:b0:544:bce8:980f with SMTP id
 f71-20020a81a84a000000b00544bce8980fmr12687664ywh.6.1680221313116; Thu, 30
 Mar 2023 17:08:33 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:50 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-2-titusr@google.com>
Subject: [PATCH 1/7] hw/i2c: pmbus add support for block receive
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3gSQmZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

PMBus devices can send and receive variable length data using the
block read and write format, with the first byte in the payload
denoting the length.

This is mostly used for strings and on-device logs. Devices can
respond to a block read with an empty string.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 30 +++++++++++++++++++++++++++++-
 include/hw/i2c/pmbus_device.h |  7 +++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c3d6046784..02647769cd 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -95,7 +95,6 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
 void pmbus_send_string(PMBusDevice *pmdev, const char *data)
 {
     size_t len = strlen(data);
-    g_assert(len > 0);
     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
     pmdev->out_buf[len + pmdev->out_buf_len] = len;
 
@@ -105,6 +104,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
     pmdev->out_buf_len += len + 1;
 }
 
+uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len)
+{
+    /* dest may contain data from previous writes */
+    memset(dest, 0, len);
+
+    /* Exclude command code from return value */
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
+
+    /* The byte after the command code denotes the length */
+    uint8_t sent_len = pmdev->in_buf[0];
+
+    if (sent_len != pmdev->in_buf_len - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected %d bytes, got %d bytes\n",
+                      __func__, sent_len, pmdev->in_buf_len - 1);
+    }
+
+    /* exclude length byte */
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
+
+    if (pmdev->in_buf_len < len) {
+        len = pmdev->in_buf_len;
+    }
+    memcpy(dest, pmdev->in_buf, len);
+    return len;
+}
+
 
 static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 93f5d57c9d..7dc00cc4d9 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t data);
  */
 void pmbus_send_string(PMBusDevice *state, const char *data);
 
+/**
+ * @brief Receive data sent with Block Write.
+ * @param dest - memory with enough capacity to receive the write
+ * @param len - the capacity of dest
+ */
+uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len);
+
 /**
  * @brief Receive data over PMBus
  * These methods help track how much data is being received over PMBus
-- 
2.40.0.423.gd6c402a77b-goog


