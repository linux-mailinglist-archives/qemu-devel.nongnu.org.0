Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092964ED2FE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:44:26 +0200 (CEST)
Received: from localhost ([::1]:46816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZmfY-0004uv-0S
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:44:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38y5FYgcKCn4mqonqfkiqqing.eqosgow-fgxgnpqpipw.qti@flex--komlodi.bounces.google.com>)
 id 1nZmbt-0000hT-Kv
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:40:37 -0400
Received: from [2607:f8b0:4864:20::54a] (port=38544
 helo=mail-pg1-x54a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38y5FYgcKCn4mqonqfkiqqing.eqosgow-fgxgnpqpipw.qti@flex--komlodi.bounces.google.com>)
 id 1nZmbs-0002rL-1y
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:40:37 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 x32-20020a631720000000b003981337c300so7524368pgl.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qPiA9z2tpVqJV7JwWQW6uE7O1g6VdcmOnhlhbntUHBA=;
 b=ryrUGstrOYHlCdZdY1YlMOFPCX0yFT7Uyu54he2jKaIadq8Ub7hAFi6nl3iHWXwEcN
 3pzOvEqXWXY4oxEjslibP2AH6Wb67o7qyp21+pPW8gp12NVllFEZNqKIKkHNassKR95c
 0RIJ2iHBIZsTdkG7VsokQi38prBd3o8HK52o8J9eA3y8HWt+wWtz9X4uiOcj3Wll8pUb
 +TjIu1kxAzXxIWUgvbTRwoeoEkn3Rvt7DddcR6N3jSG8FZscI3mnxKDdkpWCxWsdUdy+
 eI/a+5JJyMUkzBGV9Al07rewGkJB77c9HK5oQmbCU8xZ0IDx7aFn6mklXzs0tgwAkO/Q
 CE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qPiA9z2tpVqJV7JwWQW6uE7O1g6VdcmOnhlhbntUHBA=;
 b=F050IH9aj41fJ6vEjbNp+20ZXQ6etAQyC0DNjnGlOZS2HFwHRoxWr5RPz81wDPftfo
 Jv/DkiYKRMb0lWySL2EcK6E/Xn3mlrk4OhTXGBBXwHeonco1x87dSDtjN+dXN1lJawDY
 0DnBsCqQGBH5/6e4Zq8bFwRiQfIDRcxg7uj/OONaOGmctYa3OP95kaCqbKgTP3KrOdnd
 Z/8KPPPHhRUjt6UmqsEOfDOLR7+jivhMKWBqbjHbW256E0UldTKEhaBq3RYZYXqvCca3
 iE+jkAr3gb6la1LocSljz/L8kCNOq7YA7PpqH8+1XU0O9YB6OJUSqrBVSIML1kagZ0hl
 XA4A==
X-Gm-Message-State: AOAM530sstOM29GZd53eQCU9LWK68MSg05HMJugGKjwgSUXYMrl4XpYu
 xBKm5AdUsOqfi0uWY8T5wPDpAs1LkiXsBifMikeAg+vXrFYsS7Bxlkq6pnE9p0niD+soDidgDDA
 +WRGTsk4KnV5Nk13aOHSlymlAVTFF9UlV4svdH0MEdpW3T6aQfwX/T5BAVkz/tdM=
X-Google-Smtp-Source: ABdhPJwZqYSgeoFOaL8uPWKX+KZTVQ5apaz0otNq0Y3TWiOAuENbKqqYfMiaHmixfd7+q6ZJ/77n16XgQ3/P
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:902:f54e:b0:154:8219:ce02 with SMTP id
 h14-20020a170902f54e00b001548219ce02mr3290993plf.62.1648701171042; Wed, 30
 Mar 2022 21:32:51 -0700 (PDT)
Date: Thu, 31 Mar 2022 04:32:42 +0000
In-Reply-To: <20220331043248.2237838-1-komlodi@google.com>
Message-Id: <20220331043248.2237838-2-komlodi@google.com>
Mime-Version: 1.0
References: <20220331043248.2237838-1-komlodi@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC PATCH 1/7] hw/registerfields: Add shared fields macros
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 venture@google.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::54a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=38y5FYgcKCn4mqonqfkiqqing.eqosgow-fgxgnpqpipw.qti@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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

Occasionally a peripheral will have different operating modes, where the
MMIO layout changes, but some of the register fields have the same offsets
and behaviors.

To help support this, we add SHARED_FIELD_XX macros that create SHIFT,
LENGTH, and MASK macros for the fields that are shared across registers,
and accessors for these fields.

An example use may look as follows:
There is a peripheral with registers REG_MODE1 and REG_MODE2 at
different addreses, and both have a field FIELD1 initialized by
SHARED_FIELD().

Depending on what mode the peripheral is operating in, the user could
extract FIELD1 via
SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE1, FIELD1)
or
SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE2, FIELD1)

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: Id3dc53e7d2f8741c95697cbae69a81bb699fa3cb
---
 include/hw/registerfields.h | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index f2a3c9c41f..cf3bc3a6e3 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -108,4 +108,74 @@
 #define ARRAY_FIELD_DP64(regs, reg, field, val)                           \
     (regs)[R_ ## reg] = FIELD_DP64((regs)[R_ ## reg], reg, field, val);
 
+
+/*
+ * These macros can be used for defining and extracting fields that have the
+ * same bit position across multiple registers.
+ */
+
+/* Define shared SHIFT, LENGTH, and MASK constants */
+#define SHARED_FIELD(name, shift, length)   \
+    enum { name ## _ ## SHIFT = (shift)};   \
+    enum { name ## _ ## LENGTH = (length)}; \
+    enum { name ## _ ## MASK = MAKE_64BIT_MASK(shift, length)};
+
+/* Extract a shared field */
+#define SHARED_FIELD_EX8(storage, field) \
+    extract8((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX16(storage, field) \
+    extract16((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX32(storage, field) \
+    extract32((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX64(storage, field) \
+    extract64((storage), field ## _SHIFT, field ## _LENGTH)
+
+/* Extract a shared field from a register array */
+#define SHARED_ARRAY_FIELD_EX32(regs, offset, field) \
+    SHARED_FIELD_EX32((regs)[(offset)], field)
+#define SHARED_ARRAY_FIELD_EX64(regs, offset, field) \
+    SHARED_FIELD_EX64((regs)[(offset)], field)
+
+/* Deposit a shared field */
+#define SHARED_FIELD_DP8(storage, field, val) ({                        \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint8_t _d;                                                         \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP16(storage, field, val) ({                       \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint16_t _d;                                                        \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP32(storage, field, val) ({                       \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint32_t _d;                                                        \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP64(storage, field, val) ({                       \
+    struct {                                                            \
+        uint64_t v:field ## _LENGTH;                                    \
+    } _v = { .v = val };                                                \
+    uint64_t _d;                                                        \
+    _d = deposit64((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+/* Deposit a shared field to a register array */
+#define SHARED_ARRAY_FIELD_DP32(regs, offset, field, val) \
+    (regs)[(offset)] = SHARED_FIELD_DP32((regs)[(offset)], field, val);
+#define SHARED_ARRAY_FIELD_DP64(regs, offset, field, val) \
+    (regs)[(offset)] = SHARED_FIELD_DP64((regs)[(offset)], field, val);
+
 #endif
-- 
2.35.1.1021.g381101b075-goog


