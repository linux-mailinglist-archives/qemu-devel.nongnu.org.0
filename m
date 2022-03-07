Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0804D083D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:19:25 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJpE-0007EI-CI
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33GUmYgYKClkK9KLJI7FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--titusr.bounces.google.com>)
 id 1nRJju-0006GX-E7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:54 -0500
Received: from [2607:f8b0:4864:20::24a] (port=52840
 helo=mail-oi1-x24a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33GUmYgYKClkK9KLJI7FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--titusr.bounces.google.com>)
 id 1nRJjt-00071U-0Y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:54 -0500
Received: by mail-oi1-x24a.google.com with SMTP id
 w19-20020a0568080d5300b002d54499cc1eso10368361oik.19
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=C1QU/XG0WjYMmOuB0Sr7RgGJYPpVOPbbX4rLSKFUlSI=;
 b=dTbZYyaBO0lInfSz39p94rFrVu7K3EIittObjn0BlWf0jJg9rmlvsIOVyuPm0Gj9c2
 I0VS7ybCGUSWfOkOqjehQZsg+JkKMLsA4nEkVmBoJCebSYVKTqk/sFQVgaZJ3KVdIFAt
 pZuIM9tM6kHpZiDjA+/jeG0ddEM2Ot32+N1JRIR6OJ0hCc39u/sGjYh1nBCYabWjMRyj
 NFHF8gTw32ZgQK6cV/UJUPbbcS/sXN2JzAf2I9sx3hbMeSM1dfpubgmSTAdhR/9ev3jG
 NDSv4Sfuwv4ftgsrzmq/raDDBDL5FdgtIYBrJ6dcMiqB6T/jWzeBqduEdvX/+qXFCiIe
 Hrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=C1QU/XG0WjYMmOuB0Sr7RgGJYPpVOPbbX4rLSKFUlSI=;
 b=pIq44tYBWw4Wp9Ya0IUVWCSQS7Fn71XjECsniKY75rUN3EwfSo46oclMt4O0tuEh+f
 GiA3AQWMjMlSjXvyHg77wqYpnzmv/SNaVa9hY/TR8X/tqSUrGbcnuioexeutH2sfoaMS
 1OFuKwLecyTHypjdSo5tFgZoVPOT9KnPcw6oZ3O6zqZq0mkIUdK0rPDZCiI2nkZJcaeQ
 OXj/xFEgc7/zllQzfNT916Q/sRUCRDdi2o7mkUPV1E2gWrV0Hrv4c56ke3kiIvDYrFWl
 d8GXeD+GjxF1GvaxjKO37CjFcJZE4Lzxg29Cmxi10gzj1xUz+ECxXT6ecgIxo7S3Pa2M
 uHQQ==
X-Gm-Message-State: AOAM533725h4lMgTale+RdyOLdDAqrzPhun2fKEfuLqGk/62eghVA4ir
 /UWuKOYAtNLPktxdU3Z2+aBvprRoNQ4=
X-Google-Smtp-Source: ABdhPJypyEYe5TvU/gqjsiZfBOuoluqnHFS5pN/ubNi9RkHB9jg0odypGzGqU6aIXuFTtUfjeRtAah0IZ1c=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:2c86:0:b0:629:1915:3bbe with SMTP id
 s128-20020a252c86000000b0062919153bbemr8540178ybs.49.1646683612671; Mon, 07
 Mar 2022 12:06:52 -0800 (PST)
Date: Mon,  7 Mar 2022 12:05:59 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-4-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 3/9] hw/i2c: pmbus: add PEC unsupported warning
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::24a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::24a;
 envelope-from=33GUmYgYKClkK9KLJI7FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--titusr.bounces.google.com;
 helo=mail-oi1-x24a.google.com
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c7ec8e5499..ff644c1d4a 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.35.1.616.g0bdcbb4464-goog


