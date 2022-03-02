Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5B4C9AC9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:56:10 +0100 (CET)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEDp-00064M-F5
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3js0eYgYKCrsujuvtshpphmf.dpnrfnv-efwfmopohov.psh@flex--titusr.bounces.google.com>)
 id 1nPE93-0007Ol-58
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:13 -0500
Received: from [2607:f8b0:4864:20::b49] (port=50796
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3js0eYgYKCrsujuvtshpphmf.dpnrfnv-efwfmopohov.psh@flex--titusr.bounces.google.com>)
 id 1nPE91-0004z7-K0
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:12 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 l3-20020a25ad43000000b0062462e2af34so169523ybe.17
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ApmW83I1y/dWKJM+pAqI6WOG1YyRSlMqjhVaQd8jSwk=;
 b=SqIoliy3lDusv4uqOdSc0uOQoZy32GKDrdvHUOEkJ00ezi/isXq+XJNHxj1U2RlswW
 6Y7Op4BYTD3ADaHy/6uRHn6KtjYYDvIxuOMPvI5lkyu5pDTZNl/nejQ1jUqICWVKy/xz
 RrwIzKo0AOoHk22JULXfQD9F3d/gz592yentVM9pBy3bqVApjuI7+/q2IeIbt0FhRg2S
 gZMU7kYn7b4Tq5cGIk71OUq4Z0M9UXXzhCqxEALiGbXI3/U84g70oQZ7ZrE02dP9YNzs
 ysAd5cUFXcOP/yjEfI4pZNP+As1r2G3UbTg7PqEgLdJOog4lQX/Tgb5rPeLKh0DVoK78
 QEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ApmW83I1y/dWKJM+pAqI6WOG1YyRSlMqjhVaQd8jSwk=;
 b=VnxsDAlN8/ukTCNcZ7QT4OxX1PmoEb2ZhlSFq9NuQUmelxc4AtxflfNGz9hCrrLu2g
 CNJCp7oB7xVYxIHXZ500PF2UgRpLXDfrve9NcL2x9zvxk1Zq9r/vC36BWODXV0YmHB+n
 x+kcDHhVbmb3eBeDouT8sJY+L+ty9wFLii+sC3e94PxU71M9CHMDhl5GdcohKFxNeVb1
 ESEMPzYDjCHJNiD9rTND+MISXlCCcq6g5jirgw5+gDEKd7R9O/2LEg0LrjpwWn/MBpJw
 zwJAUd0vxWiV/FKMIV3TaG7oWY9oGzP/ToS1xR3Vu5Q1e9vxN6Eaeo+52EkkQ87TyyCv
 DL+w==
X-Gm-Message-State: AOAM533siLgtJki6SVo+t2AyChNv0eG/Sgae/6RD3lookWPshGXftlVq
 TlgRaYxVfA5kDf6z04mRWiDyyilj7a8=
X-Google-Smtp-Source: ABdhPJz+hcQ92onN6QTRxuA0BF2kKMXR1yd+RoVPzm+RWtRdxAh6aQG5sWtuWYjn4dztuzOY84uWzGQncpg=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:ae06:0:b0:624:42b0:3c7b with SMTP id
 a6-20020a25ae06000000b0062442b03c7bmr27615822ybj.535.1646185870175; Tue, 01
 Mar 2022 17:51:10 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:48 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-5-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 4/9] hw/i2c: pmbus: refactor uint handling
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3js0eYgYKCrsujuvtshpphmf.dpnrfnv-efwfmopohov.psh@flex--titusr.bounces.google.com;
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

This change cleans up the inputs to pmbus_receive uint, the length of
received data is contained in PMBusDevice state and doesn't need to be
passed around.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 6eeb0731d7..3beb02afad 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -89,16 +89,16 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
 }
 
 
-static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
+static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
     uint64_t ret = 0;
 
     /* Exclude command code from return value */
-    buf++;
-    len--;
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
 
-    for (int i = len - 1; i >= 0; i--) {
-        ret = ret << 8 | buf[i];
+    for (int i = pmdev->in_buf_len - 1; i >= 0; i--) {
+        ret = ret << 8 | pmdev->in_buf[i];
     }
     return ret;
 }
@@ -110,7 +110,7 @@ uint8_t pmbus_receive8(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 1 byte, got %d bytes\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
 
 uint16_t pmbus_receive16(PMBusDevice *pmdev)
@@ -120,7 +120,7 @@ uint16_t pmbus_receive16(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 2 bytes, got %d bytes\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
 
 uint32_t pmbus_receive32(PMBusDevice *pmdev)
@@ -130,7 +130,7 @@ uint32_t pmbus_receive32(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 4 bytes, got %d bytes\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
 
 uint64_t pmbus_receive64(PMBusDevice *pmdev)
@@ -140,7 +140,7 @@ uint64_t pmbus_receive64(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 8 bytes, got %d bytes\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
 
 static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
-- 
2.35.1.616.g0bdcbb4464-goog


