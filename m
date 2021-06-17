Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB73AB340
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:06:54 +0200 (CEST)
Received: from localhost ([::1]:38874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqnN-0005NL-Gp
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbK-0008Ip-AX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbI-0005T7-MR
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6198818wmg.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMrFIFZX4VBJPQraxvDxEyJhOku4B5f9uSq095+uB5I=;
 b=qDhkZeLjhAHgduWQ7jztCxzxHL24Z+ru7vAtjKudTNlRv52tbfcGv7KpE6tTzsKe0l
 0n53pU6lwGIJyTrIJZKK2rK5QRLytDN2ZK2cXtEPtv+5wPWCC9RT6Hdopvt5bV1LSpn3
 SN988XpJEPnCrnUkk+x4y64gVp9gCq3rZUZ4nOshWl7IJ+eNuRjqYnF6SqB4OarkUjx8
 l+Hc8QxZs6MWDy6c3k5ezT5N53ctGnyXwEqrRZjRDUFeNKvxmMcWvvhAT62clTcMVnvp
 J492lVWJOFvnkOovE3WX3i3E3AnWBCR1WSkCw/96jfTQUr7TAAKD9rUClCH9At81k56U
 6r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lMrFIFZX4VBJPQraxvDxEyJhOku4B5f9uSq095+uB5I=;
 b=J5yTYh092SGJp/gnMIsas3KKLxZ0P5F4PE5Pc4wHu7TfgD4DD6GdDcCi4R67tLWjUc
 7I1dJuK08mdGCUWh0fnSdvThn6z+Jr4fthvZl9o2rqo/ZqyL3GYUh6tQlhx0zXzRJaSK
 dYR/Sa0HK9ud8Ugw+USrEj6+LGYP5/f4fPbKF+CHFOV1NvD5OWFuh2T0v6St+JpJ6xw8
 qgE0yEBOdVyEP9NbPeHPSVXyndDN25LW+aIKupleXzAJ7OLml90KN6imXkltNPabVmiI
 4Le+7uGeoMtRYf/xZC8LRBlIQBrFmDxuThkp1++ygAtepkcmqMz0wqE50J+BZF1SKXkS
 vUxA==
X-Gm-Message-State: AOAM533LbCHP3pO9974CbHcoIK77mNHCKH41AqSP/m45lvlo0t+K/fA7
 G3YGfV579yD+ZOScXBVZJak06EgIafMYXw==
X-Google-Smtp-Source: ABdhPJzkiMMvmGOa4BIUg/B0FMPUlbQoJs617pqwZgs3ZPMcDAUWnlahc/CMFF+7SbzWq2RQRuONkg==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr4742749wmq.4.1623930863189; 
 Thu, 17 Jun 2021 04:54:23 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f5sm6126634wrf.22.2021.06.17.04.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/15] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Thu, 17 Jun 2021 13:53:29 +0200
Message-Id: <20210617115334.2761573-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), replace
  i2c_send_recv(send = true) by i2c_send() and
  i2c_send_recv(send = false) by i2c_recv().
During the replacement we also change a while() statement by for().
The resulting code is easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index d96219aef88..44aa9730bc9 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -141,12 +141,8 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
 
         ret = AUX_I2C_ACK;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
-                ret = AUX_I2C_NACK;
-                break;
-            }
-            len--;
+        for (i = 0; i < len; i++) {
+            data[i] = i2c_recv(i2c_bus);
         }
         i2c_end_transfer(i2c_bus);
         break;
@@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
 
         ret = AUX_I2C_ACK;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
+        for (i = 0; i < len; i++) {
+            if (i2c_send(i2c_bus, data[i]) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
-            len--;
         }
         i2c_end_transfer(i2c_bus);
         break;
@@ -200,15 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
 
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
+        ret = AUX_I2C_ACK;
+        for (i = 0; i < len; i++) {
+            if (i2c_send(i2c_bus, data[i]) < 0) {
                 i2c_end_transfer(i2c_bus);
+                ret = AUX_I2C_NACK;
                 break;
             }
-            len--;
-        }
-        if (len == 0) {
-            ret = AUX_I2C_ACK;
         }
         break;
     case READ_I2C_MOT:
@@ -233,16 +226,10 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
 
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
-                i2c_end_transfer(i2c_bus);
-                break;
-            }
-            len--;
-        }
-        if (len == 0) {
-            ret = AUX_I2C_ACK;
+        for (i = 0; i < len; i++) {
+            data[i] = i2c_recv(i2c_bus);
         }
+        ret = AUX_I2C_ACK;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "AUX cmd=%u not implemented\n", cmd);
-- 
2.31.1


