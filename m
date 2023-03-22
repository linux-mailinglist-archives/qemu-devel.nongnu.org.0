Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5C6C531F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hZ-0000Ba-KA; Wed, 22 Mar 2023 13:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VEEbZAYKCmscRcdbaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--titusr.bounces.google.com>)
 id 1pf2hX-0000B2-EV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:43 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VEEbZAYKCmscRcdbaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--titusr.bounces.google.com>)
 id 1pf2hV-0002H6-Sv
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:43 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536d63d17dbso197694457b3.22
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5/Dadg8m/Nn6NEOd+UqaKmTnByQM0BpngrWfhpbEyYg=;
 b=F1itLqKhKt9whbHkXAzqNSS6zyDHCFIxRjbLNZINzTpJa8BCd9hvDypXX7pxdWglam
 QZVABlGCcn9409/bor2HXCP38XGldAVfDJvgu7HgFYDVOLj2CYoOGTNFRk6+e2ZZ+473
 rPHNfSP4QU4SzN+SZvQnINk6NFtimfQQ98sGq8deUMmZAd1NpQbfoWehh6pQF2WjVT2/
 avBfiuyE7wRW8PgAnrD3ziQfeWWIos888NyPyRgLQt0PHhoKSU18dBafcUjKagIrnrFa
 P8TrO0WNXYxDfpr7vMpP91xPOMYpqgH7BNO8RNKVZGoUi/AGOj7BqQklOhtev72iWSwV
 lIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5/Dadg8m/Nn6NEOd+UqaKmTnByQM0BpngrWfhpbEyYg=;
 b=drY64ufKXD9nZLJ3ZTtVJgSPv7dhihRiGwybZUM4xSu1sQJItSJ/PStaLtvI4aek1e
 o0sNdGiDSLFMnqX72AGPD2Nk9FF1zortjSEaFXnCH4269iPUPcIlYwKzGB99WUpASqGd
 xO5ltWJf3qwWI9ddMxD1EB52Q1cSvhn1jekFHrYYhVTNkfBDeI6amttnI41z+CA8DVtK
 JKeKbZy6kA9VbAkwI+dXIoB1OdvgHoBmH+0QTsYn6tbfKvQIaNOfbReYdQD0lPCwhK9z
 dFbAvrrsoFjVD1MrJH1Tirx7JlleJlhPHx/VH2wUwW3cw4LKT1CtFIZ17QKbC3Q4FlXQ
 347Q==
X-Gm-Message-State: AAQBX9e0hy38tvdmfmVIW7xT8TjFz1avfuweSh7hd8ZMlugODE7HBP/G
 x7friQtIluNBNx/hEvaVG1z9crDt78w=
X-Google-Smtp-Source: AKy350aNmvCusv7yo1iQBEDZfxLXMV/kgC5N4elF0uNiONFQFcTZ5e3+LJEZGExuw+hKm80f+NQVB+eAxm4=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:1141:b0:91d:98cd:bfe4 with SMTP id
 p1-20020a056902114100b0091d98cdbfe4mr407835ybu.10.1679507796245; Wed, 22 Mar
 2023 10:56:36 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:13 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-6-titusr@google.com>
Subject: [PATCH 5/5] hw/i2c: pmbus: add VCAP register
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Benjamin Streb <bstreb@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3VEEbZAYKCmscRcdbaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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

VCAP is a register for devices with energy storage capacitors.

Reviewed-by: Benjamin Streb <bstreb@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 8 ++++++++
 include/hw/i2c/pmbus_device.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 18e629eaac..ef0314a913 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -903,6 +903,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_READ_VCAP:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VCAP) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_vcap);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_READ_VOUT:                 /* Read-Only word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmbus_send16(pmdev, pmdev->pages[index].read_vout);
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index ad431bdc7c..f195c11384 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -243,6 +243,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_VIN_RATING          BIT_ULL(13)
 #define PB_HAS_VOUT_RATING         BIT_ULL(14)
 #define PB_HAS_VOUT_MODE           BIT_ULL(15)
+#define PB_HAS_VCAP                BIT_ULL(16)
 #define PB_HAS_IOUT                BIT_ULL(21)
 #define PB_HAS_IIN                 BIT_ULL(22)
 #define PB_HAS_IOUT_RATING         BIT_ULL(23)
-- 
2.40.0.rc1.284.g88254d51c5-goog


