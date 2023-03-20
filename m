Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6E6C2428
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNTa-0005Wk-OK; Mon, 20 Mar 2023 17:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCoc4t4532rzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTZ-0005WE-21
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:33 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCoc4t4532rzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTW-0006Ye-Aa
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:32 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-541a39df9f4so136424777b3.20
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349329;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl9Rnc3jC5wN7ou+/okayIAPmuVV14qj7WXT6LiSRPk=;
 b=Tyhvs+k/tPaFAgnWcIHKjCvZ2oKuT9qiO/B9VpGSyIbJzdKSzJe7C97tp2kLWTb46V
 UcsVaFVOM5dkj+/yglxK9fapRktqx537fXiVq+wywrhyrbNWSvT3b/0WXD3byFuscnEj
 Rw06GOQ5Z481IKLXCa9uXT3VmAvqAnG2VccNFVTqYXZidVYcvL1AzYaV+Z4T4RG7w7hf
 gG5ysnknOCqssPxIFedxpSgt12U3ErEakgYSU5TloKf4C8Yk5I9xBcZP7fwja7GLonoV
 e44Udl+Lz31BmyXL8l9UEIT3LgdO2/hG3NWHvE47b5X1UCL146aKg7P2yR4YMH8lCK19
 vnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349329;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl9Rnc3jC5wN7ou+/okayIAPmuVV14qj7WXT6LiSRPk=;
 b=hpJ4ZcT0rvIwXDK8xkb/2YySO9gY7xT2vfcFnciGGZIqPffpD6WDuLP/4KKjqk8+KY
 SMB9YYM5NgQyAkMOYCnWeYdCSTnTqBcT3n8lPYSlXhIjvKMY18LK5tby0GsjI+//Q2p3
 ps6di49kM0bO8VBGAjAU8Ie1zD4aqGdi5s4kxXmCmqRH4CQEr9pMgcsNwZFAL2g2gHx/
 Au3vIuK4fYAzbYEmSdxKLqc7Qxl3KZ6KELVA6UNlt/6+K9pQksOB9DLPk8yUY1597l5r
 as6G55Eg4CUCsW3XIhEYtq4eqo/UnCKgUHMvC+5HP9aJSYXnJkftcAe5lho6/CSbD1eK
 z8dA==
X-Gm-Message-State: AO0yUKWPHoJi9q4foon8VWzmcAK7WwlagxL2nh88xZUtgeLDEUsJ6Lpu
 4N6O2T+1oJlIgYldfqaCvN/cT97wP44=
X-Google-Smtp-Source: AK7set/V/uHhl42zcrnYa36qXYmGJq22yDUjNGdfoLxPngYGq33g6hs9zqG3qkSWFI7RtmSt4Oog4zkX1Ng=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:b663:0:b0:52b:fd10:4809 with SMTP id
 h35-20020a81b663000000b0052bfd104809mr11343138ywk.0.1679349328865; Mon, 20
 Mar 2023 14:55:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:55 +0000
In-Reply-To: <20230320215500.722960-1-titusr@google.com>
Mime-Version: 1.0
References: <20230320215500.722960-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-2-titusr@google.com>
Subject: [PATCH v3 1/5] bitops.h: add deposit16 function
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3UNYYZAYKCoc4t4532rzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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

Makes it more explicit that 16 bit values are being used

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/qemu/bitops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..887b8f8ce8 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -446,6 +446,32 @@ static inline int64_t sextract64(uint64_t value, int start, int length)
     return ((int64_t)(value << (64 - length - start))) >> (64 - length);
 }
 
+/**
+ * deposit16:
+ * @value: initial value to insert bit field into
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ * @fieldval: the value to insert into the bit field
+ *
+ * Deposit @fieldval into the 16 bit @value at the bit field specified
+ * by the @start and @length parameters, and return the modified
+ * @value. Bits of @value outside the bit field are not modified.
+ * Bits of @fieldval above the least significant @length bits are
+ * ignored. The bit field must lie entirely within the 16 bit word.
+ * It is valid to request that all 16 bits are modified (ie @length
+ * 16 and @start 0).
+ *
+ * Returns: the modified @value.
+ */
+static inline uint16_t deposit16(uint16_t value, int start, int length,
+                                 uint16_t fieldval)
+{
+    uint16_t mask;
+    assert(start >= 0 && length > 0 && length <= 16 - start);
+    mask = (~0U >> (16 - length)) << start;
+    return (value & ~mask) | ((fieldval << start) & mask);
+}
+
 /**
  * deposit32:
  * @value: initial value to insert bit field into
-- 
2.40.0.rc1.284.g88254d51c5-goog


