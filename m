Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20173486DAA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:22:19 +0100 (CET)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5c5K-0000UC-7o
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:22:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wXbXYQYKCiIRGRSQPEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1n5bz5-0001eN-U9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:15:51 -0500
Received: from [2607:f8b0:4864:20::b49] (port=39921
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wXbXYQYKCiIRGRSQPEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1n5bz3-00063F-DZ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:15:51 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 k130-20020a255688000000b0060c3dcae580so7956338ybb.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 15:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YbOjq3KDlppshwQpezVsb9MS/E9NuLAoax6A9T70OSQ=;
 b=jc5cDr3OREYGEfR5CAaIq3QBrJAl5cWO28XpM4lxNWwQTw+Vy5PYSvXqYX7fbyR52I
 cWdZw7lCXIzVmaR2kLc9kX3i8yWnJamLHHV5/8s6vmwIsgVWJ1Sd7rNLwBahvgaF+uAm
 8F0g8NAgCBNirvUzrv1DmaU4c8uFzPuOqQC4/fzeG3d7rC5uVspPnVB56ERcpk9Guqzf
 D91DfkF4xaWqWYogM4WySnXvT3PJscbIPOhwUqj1RYVCT4q4MrBX4okH4sZO003fj5Yo
 qFXCirB6STaz2fazj+eSJohIlFSs1ErdykfB7zsFFUg9EvKeDTgmP7jSgpS331hxLUZV
 AWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YbOjq3KDlppshwQpezVsb9MS/E9NuLAoax6A9T70OSQ=;
 b=250FTKkMeUHDW5LaZRCSY3nNwgaz+6MNgf3jAxwkehjS+VgV0jwp1Vqhx3Wh92pxEy
 04w0gou4XvG+/twOgRR1KzooMLrBgtI5XodG7bMXoQpmv1Ye2lLs6igPxfy4A/0N8Sks
 BCf6dvg2WRhV8qUG+u95qcMly0XpWnrm6Nbu96afcDX2R8ileHhT834Wo2mVO+tMm1ok
 Q2I5J/exKnZxSFch2937KQ1pgqGHsHuSOeVV9Z8PL/JFh6U+pd0ZvdXUn4kFTn3K3eNA
 /YaXHlfphtTSkC3WcAtGoq6bJh7nSEbZKZ3JT2yYvqe9Rf2SRYVvlP+RwHHfiBgnhMVS
 Rwbw==
X-Gm-Message-State: AOAM530wuPetcNSN5lYQMIlngxfRQQAgho0xsxnUIz7aeZjyh3Hg+SPK
 Q2RBukpMX+L/u6yYmZR85odoXneFm0E=
X-Google-Smtp-Source: ABdhPJzAV57Kj61O/DbrIucBNN+T7qurrRe4G/dVtQ76CJfWPi+gbgX5PWIcLuIGXI2nxqpSRCICyUMWRsk=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a5b:386:: with SMTP id
 k6mr32905947ybp.706.1641510593947; 
 Thu, 06 Jan 2022 15:09:53 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:33 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-3-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 2/5] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Shengtan Mao <stmao@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3wXbXYQYKCiIRGRSQPEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
2.34.1.448.ga2b2bfdf31-goog


