Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FFB6D13E4
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 02:09:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2KT-0007ZD-Sq; Thu, 30 Mar 2023 20:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCo8C1CDBAz77z4x.v759x5D-wxEx4676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K7-00078k-FT
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:55 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCo8C1CDBAz77z4x.v759x5D-wxEx4676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K5-0005q3-So
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:55 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 w5-20020a253005000000b00aedd4305ff2so20521945ybw.13
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221319;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6MwfbHdxuIOtH0NAbW8vcKKizTpZOCl4cwXr1Kj34SU=;
 b=XoqaedzahbGh+jdb0RPj/l7LmuvLGh5OLjY9N8gJSQDQZreoS1iqM+GU5+rk4StbyZ
 FCcD+RcCcFpAChkpL+8M9qivd6zPiw8U3R56U6YLNzqLRB5Xx2bkGOVM1yjbLF8bXu3k
 btALCziXrptWhtHJeJG9W10VkxyTpQPJlGI1H9T5VK3YqwqaN7ZRX9dnNux0gM2s/pj4
 PdVCxund3TjIOd4Gx+bH9gQ+ci3f4LSxW9Zo9SDvQzofryNRW+LvQnlGNGtdMPIFqTK8
 xOXIENr52JTgebC3fAWnr85AedJca+xCliAMrxG9ll+rtRpl0lusEXe4pV5oem3uqAiP
 sKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221319;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MwfbHdxuIOtH0NAbW8vcKKizTpZOCl4cwXr1Kj34SU=;
 b=PBgFl4R74HSzZZkXgkIOHSbrml84kuarvnNhVMWZK3JBBwtRASdy9u6ldx5/QZK69f
 OfWYuw/S701BkC+MzAJ4L3DHJI0yR9DqjWf976QgysOJ9KUOJLoY//PFPrsRK/LP3gyA
 bqanLWgINYJfgckt/1bott/x8GYIxpF/6pq7aXh6nz2oE3Rw8oN12aiT2e/nkLz4mRtI
 93A6QUBa/0a99Z1Nh9J3QWebPmMqNMk3J6KJWVufBayVSEFvgd/kgsXMbzKbtnyJeLSh
 CZG2GR3eOkzQ5Lt09yhfpI6uLdepLK3uHjZxLA233FefD6/oEQdVsY24QaKqQfgrPjUi
 Lrmg==
X-Gm-Message-State: AAQBX9dIjjve61HPpTx1MExc6eJsxTi+CqaX+W48ikaJDdF6/sul+uD7
 R32aAxqZH/OV85hlWiKw+2n4d4s9GPU=
X-Google-Smtp-Source: AKy350a1f89ion6Eqm9uoKjoKMUMuvuZI5MEq1nMoNDe7NwhRJ6DiSyh67J8Iuom+ADiccRJJIIqFKrnV3E=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:168d:b0:98e:6280:90e7 with SMTP id
 bx13-20020a056902168d00b0098e628090e7mr16740002ybb.13.1680221318928; Thu, 30
 Mar 2023 17:08:38 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:54 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-6-titusr@google.com>
Subject: [PATCH 5/7] hw/i2c: pmbus: add VCAP register
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Benjamin Streb <bstreb@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3hiQmZAYKCo8C1CDBAz77z4x.v759x5D-wxEx4676z6D.7Az@flex--titusr.bounces.google.com;
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
2.40.0.423.gd6c402a77b-goog


