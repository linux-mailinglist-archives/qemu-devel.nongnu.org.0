Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5A4D202C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:24:08 +0100 (CET)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReVD-0004D6-3W
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLU-00009I-5g
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:04 -0500
Received: from [2607:f8b0:4864:20::635] (port=45955
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLQ-00020h-NI
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:03 -0500
Received: by mail-pl1-x635.google.com with SMTP id q13so1664576plk.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiJi+ZwhoHznG//6WBhvN1I69uJkl1Jx276W7e+HbUw=;
 b=gz7pPAxt/cfUvFSnw1xmeGn/lt/lQZAh0A0JysW5+jeEQ9sTMUQUtsBrR1V0ADQCTy
 nO0KdwKNeaG8Tqthk6DBiqKvkzYoNAn2xqQ9ryUDgJ2ugXkZuLA/zYe91w+qXF2Hi0IJ
 rNUa4TghstaNp/OCWpGc78p5RU/GUrMg6LuRzrbq+Qf+jrXhxFIeIXojESpYwehl+ZjU
 8niSpr2J11grT5kbk0igf1ucbl9XohxKWKW2k0KKH47/mdMaiMesYR+olECgyIJKefLS
 /WFVVRUpevIxyZ3urqcOTZNyYD+WsNuZhndNZPWVtDxQS4dBfJzsT8isPXoqsQw1swCL
 HRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiJi+ZwhoHznG//6WBhvN1I69uJkl1Jx276W7e+HbUw=;
 b=CcfYkOlhc9QYrlbqPM4dHfO6VyqLFI1vNyCq1xwqO4A2G8+c1mTQUn4IxZsuhMmkR8
 gLr5gZruxRnfX5Vw+wKc7+HSpx3WIyjAERyt4LgBK/Ofdvj02JeBoZ7X5SXtW6L257z4
 9JpprJ7kuYNAL5Us8LFWxu03Mo5fV2JuyZ8+YppCJHQqDUkVyFdqTXIdxKUJ4Tr4CWC+
 UbtIqjz6Bu7Duyds8u2A8JpN9Zwdm4Pz/GNGepd8Ug0riCQ6ggKtLINTu7lIXjCX8wzC
 KFDjUAoUvJup5brGI7s9BZ38nNsAF6TgNtuHonBC00bkhGLRooBKw6NY1URPH5dBr8/N
 V7dg==
X-Gm-Message-State: AOAM533CPt53iyoqEVAXZHcEN5Rte8G+sDkVCW+FSGCYHwGPD0W5oWPj
 pF3yMprHZ4qyHRB67CwcAYEq1MyM0Bg=
X-Google-Smtp-Source: ABdhPJxmGkWiVmuZn4pfE+HJTLQdzepXC+ax3VSuOi7erQA1/NHpM2l39OO3lHOEYsVeuT2TVh/S2g==
X-Received: by 2002:a17:90a:2e08:b0:1bd:59c2:3df5 with SMTP id
 q8-20020a17090a2e0800b001bd59c23df5mr6038793pjd.235.1646763239190; 
 Tue, 08 Mar 2022 10:13:59 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056a000c8c00b004e1a76f0a8asm21325512pfv.51.2022.03.08.10.13.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:13:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] hw/i2c: pmbus: refactor uint handling
Date: Tue,  8 Mar 2022 19:13:15 +0100
Message-Id: <20220308181320.79400-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
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

This change cleans up the inputs to pmbus_receive uint, the length of
received data is contained in PMBusDevice state and doesn't need to be
passed around.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20220307200605.4001451-5-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index ff644c1d4a..8cb9db0f80 100644
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
2.34.1


