Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DB6C5323
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hR-00007m-DM; Wed, 22 Mar 2023 13:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UEEbZAYKCmcYNYZXWLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--titusr.bounces.google.com>)
 id 1pf2hP-00006M-Is
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:35 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UEEbZAYKCmcYNYZXWLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--titusr.bounces.google.com>)
 id 1pf2hN-0002Fe-Po
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:35 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 e129-20020a251e87000000b00b56598237f5so20273742ybe.16
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507792;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2T5B4kmhyEWAy1vn/gaQP2yNmdYM7rv0n//EHdFKaCI=;
 b=N8QTU+1ND/S+CLRk0HAnO7gylmQ/p2Z2t57NotAO7i2MkzX6Nk7KZaCH7QJme6t8Vz
 VGrVpqOmxdbavLeD8ZgoADOB8sb5a5tEumgtxxwH3jTWdu+FY7ogmauJx4DxZ2t/+PoA
 cKHVryYcHXffymaOn7NogEAJTbgMVRFRN85ir1UTb4rKLshWvGqepO4bRR2d9fci+aKB
 MHe2U23Ij8lGRSktyRp4AWOptGP7uUuKLX/dLfckoe5fTmBoMRBc8uFanhppMeqkYKeC
 bTs7W1YSk0qE/Uu7VR6WRj1Mpp/7xyH1olMZbJ0tWzkA/BHH/blsfGy/P6X6EgKUM3Jp
 TpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507792;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2T5B4kmhyEWAy1vn/gaQP2yNmdYM7rv0n//EHdFKaCI=;
 b=QNgvp8T4P3Qgeu28wUf9KPaLLawwt9X/aRDoOp9U2MC0u032SpGrs61gTvifI8Q2db
 B6oGJ2elANKu2LfpcB//SHX2b3hb7KPyS1wvT/bnzH71gyv5Z+e8f1LxXUrJlpw81oB0
 zCBYfqUYewndmxMB+PYe6C8raZ2/3k1xLqHx/LX7RRcUVxa9mow8bZgt0dkG8zUYl8AP
 9Sdmoey6jtoVrKy69+faAN4Kb3eA9hsE5InK/iH3OB9LCzFKdGIvU4yx0oxitd1jxXeE
 N5aiNtH3Pu4feO/ZgE+mxeUZL054u1s3gMHw5gEdFBvxB3kANUWpOPIzYHfwtPOui4jj
 2dXA==
X-Gm-Message-State: AAQBX9ev0O7e1I7agHx8djHA194cFTIh0LCQDw0eQixE74Pdgv5fIooF
 eIRQMlCUwlspX07rkTd/to078CW0msY=
X-Google-Smtp-Source: AKy350YeZFYzpyAjNphOgXMSyKXpnOReDaT5+D0XX7sAgGl/yVUle6ZgCrjjtr/WMo4tQLR7B1D+ND4ATds=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:b203:0:b0:545:64c4:7701 with SMTP id
 q3-20020a81b203000000b0054564c47701mr386939ywh.3.1679507792164; Wed, 22 Mar
 2023 10:56:32 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:09 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-2-titusr@google.com>
Subject: [PATCH 1/5] hw/i2c: pmbus add support for block receive
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3UEEbZAYKCmcYNYZXWLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
2.40.0.rc1.284.g88254d51c5-goog


