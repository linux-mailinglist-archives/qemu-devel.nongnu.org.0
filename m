Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA1387FC1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:40:49 +0200 (CEST)
Received: from localhost ([::1]:34616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4e8-0004ML-B1
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4am-0001QD-Tl
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4ak-00081Z-N6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HmbSl5d9pXpS90PMMdxl3LY29W1LC7gy3N9ueCnGUQ=;
 b=bWtfAJJi1HzB7rQW9PdHk6ZQS4eGxYMYKYJRzeplekslHAci1tzPy+/nYl9fcZ30vvSwsA
 H/R/+zZAK5IjRvU0on319yxeJQQ3sF0aKC8k7xCYcS2udg8/pI687JUDMIgLnvl8vktc2n
 ZiNGYajab+t3G+12abpVz+VRpukPV6I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-3iaKjiiUMFSUOx1_v2d-7w-1; Tue, 18 May 2021 14:37:14 -0400
X-MC-Unique: 3iaKjiiUMFSUOx1_v2d-7w-1
Received: by mail-ed1-f71.google.com with SMTP id
 w1-20020aa7da410000b029038d323eeee3so4207376eds.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HmbSl5d9pXpS90PMMdxl3LY29W1LC7gy3N9ueCnGUQ=;
 b=MQBuO7J7ckpsUCtfLN6X66n2ljqbl1lArUsNfKt/pM318bdamtD+AHUpIl3S2FffLY
 JLRnpLd/EeedIhsC9fDgu/h/1pfGetimfb18HZC/7tyeC7skPhYrOxOskATiO+hc8qOG
 dE/UikueoI1IeGiDBvKzCygRw+29a6Uj5ymJxaLumr3vnxlRllYU2Uzbi6ATrGaZl8cM
 9bdhg+Yd11PBwgVExbuZmhtselDkzjjvawMjQMuo0+CwQR+y/2/Oew48Zhw7ll3FEpNq
 Gom3w+tg2W6FWDVOSGYjcocrhhjwSjyU/5kYu5O6muarjb6zc7nf9NtNXhNF8AYhcLat
 YgSg==
X-Gm-Message-State: AOAM531u/utDHy3qD8Xc8i7mL0Jkrq4Og5PAxhKjdP/EDPIaidNXad7R
 s9Iiol1T/iNY2+RfNIO68/STIMs4V3nQAlPt3IiPCBJ6gwZ5fCCbsEOIcYFzlCUrqOTG4LQSdeF
 AyahcKIiY31NWrlkLEbYoO12vQgbTIZFCxfFoCTY9+Tuda+mkyy0NZNZjMB8wRa/a
X-Received: by 2002:a17:906:328c:: with SMTP id
 12mr7440858ejw.361.1621363033263; 
 Tue, 18 May 2021 11:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOaLPa9LjW/42a1BXxy26w0/1lB6YlK+93L/Soq24MfY6UpIF8yeAuo6xL7vfburNouLjBEg==
X-Received: by 2002:a17:906:328c:: with SMTP id
 12mr7440838ejw.361.1621363033070; 
 Tue, 18 May 2021 11:37:13 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i5sm7861279ejv.120.2021.05.18.11.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/25] exec/memory_ldst: Use correct type sizes
Date: Tue, 18 May 2021 20:36:33 +0200
Message-Id: <20210518183655.1711377-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use uint8_t for (unsigned) byte, and uint16_t for (unsigned)
16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst.h.inc | 16 ++++++++--------
 memory_ldst.c.inc              | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 46e6c220d35..7c3a641f7ed 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -20,7 +20,7 @@
  */
 
 #ifdef TARGET_ENDIANNESS
-extern uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
@@ -29,17 +29,17 @@ extern uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
 extern void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 #else
-extern uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+extern uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-extern uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-extern uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
@@ -50,11 +50,11 @@ extern uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,
 extern uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
index b56e9619674..84b868f2946 100644
--- a/memory_ldst.c.inc
+++ b/memory_ldst.c.inc
@@ -157,7 +157,7 @@ uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
                                                     DEVICE_BIG_ENDIAN);
 }
 
-uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     uint8_t *ptr;
@@ -193,7 +193,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
 }
 
 /* warning: addr must be aligned */
-static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
+static inline uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
     enum device_endian endian)
 {
@@ -240,21 +240,21 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     return val;
 }
 
-uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
                                                      DEVICE_NATIVE_ENDIAN);
 }
 
-uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
                                                      DEVICE_LITTLE_ENDIAN);
 }
 
-uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
@@ -366,7 +366,7 @@ void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
 }
 
 void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     uint8_t *ptr;
     MemoryRegion *mr;
@@ -398,7 +398,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
 
 /* warning: addr must be aligned */
 static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs,
+    hwaddr addr, uint16_t val, MemTxAttrs attrs,
     MemTxResult *result, enum device_endian endian)
 {
     uint8_t *ptr;
@@ -441,21 +441,21 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
 }
 
 void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                              DEVICE_NATIVE_ENDIAN);
 }
 
 void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                              DEVICE_LITTLE_ENDIAN);
 }
 
 void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                DEVICE_BIG_ENDIAN);
-- 
2.26.3


