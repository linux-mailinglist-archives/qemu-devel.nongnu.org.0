Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED0F5595A8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:50:38 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f1R-0001bC-D9
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eff-0006Sr-Hy
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efQ-0005U6-G4
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOJOnSmKg2WSy30NZDwJenV9RNS5JdblfeNNvCQXTJ0=;
 b=NZlKXGwawNAaIGZxA8fM6mdTHzSymjTHx6Y76oI5Pg1NKV6zhNvpGMatNXUPYNz07lRj4w
 jEuuX2vBb43fpwmXdabbm4hZ5KKmNxUsDDVGGLsDIZ8U1kJm0axB7Ggdufkq2J2dcIyp3A
 IFnkUyVf5ZjtS/t+dIjNdXswCZBdlBg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-keqfQgkXPKaGvz8zm1VgHw-1; Fri, 24 Jun 2022 04:27:49 -0400
X-MC-Unique: keqfQgkXPKaGvz8zm1VgHw-1
Received: by mail-ed1-f71.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso1333412edx.19
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOJOnSmKg2WSy30NZDwJenV9RNS5JdblfeNNvCQXTJ0=;
 b=nOWvc0i7mWH4znm7zXYWOLAQzOnBAOQpoguZvt11yn3GIepxWyEvpm46fWDcA09eY1
 TSaIWOzzbp4niGPaybb3E1ENXjmQuh1Lb+IZH0qtgkDeENi6sPhOwKGtzwMVWZ4gKcSS
 CdocShVzTZzxO5XIb24YZ1lZ+S2FraCfPKDRgDMqSyiOAsejrpAoXmDP+lVvzMOw0K2Z
 iKSm8soUKKVOPNcR9iyvB0bmNW3K1/bPK49PVUCwh+apQq+OEh8VJ4jOzmL/yoPtd0D7
 lV9LIweaeHYkSN+hJKI6mFNzdiPcaTARtNQ990EOBGZf5ZUKGbv9AHwSNCdb2xoCaU76
 V56Q==
X-Gm-Message-State: AJIora/M8nLptcZc7yCLjt7sdHWQr5UnBZymvgU7OdkVCisZGSGOte2z
 dSqALIx4d+T66hytGNIYQovg0/7aqZP4o9PWmk5Ji4UTA1a+h8YFMK1Hs31DbhWOYVdGebmgMqd
 hc9IA5zLo1Ayjug3xXme/z2qrk+P0qCV7+eaK+N6cYHWRz1li591OX3L6lIE4PmqPX1U=
X-Received: by 2002:a17:907:3e82:b0:6ff:1e04:a365 with SMTP id
 hs2-20020a1709073e8200b006ff1e04a365mr12170256ejc.617.1656059268229; 
 Fri, 24 Jun 2022 01:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbtUOG6Q0gzsUyp4wVUFegH9TuVKdpGDZ7IszdKV32JQ6iyFoiPM2Hh1gs6iZCn4fWJYVbGQ==
X-Received: by 2002:a17:907:3e82:b0:6ff:1e04:a365 with SMTP id
 hs2-20020a1709073e8200b006ff1e04a365mr12170240ejc.617.1656059267912; 
 Fri, 24 Jun 2022 01:27:47 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o19-20020a17090611d300b007109b15c109sm720874eja.66.2022.06.24.01.27.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] tests/tcg: compile system emulation tests as freestanding
Date: Fri, 24 Jun 2022 10:27:24 +0200
Message-Id: <20220624082730.246924-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

System emulation tests do not run in a hosted environment, since they
do not link with libc.  They should only use freestanding headers
(float.h, limits.h, stdarg.h, stddef.h, stdbool.h, stdint.h,
stdalign.h, stdnoreturn.h) and should be compiled with -ffreestanding
in order to use the compiler implementation of those headers
rather than the one in libc.

Some tests are using inttypes.h instead of stdint.h, so fix that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target              | 1 +
 tests/tcg/aarch64/system/pauth-3.c     | 2 +-
 tests/tcg/aarch64/system/semiconsole.c | 2 +-
 tests/tcg/aarch64/system/semiheap.c    | 2 +-
 tests/tcg/multiarch/system/memory.c    | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index f427a0304e..e68830af15 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -111,6 +111,7 @@ else
 # For softmmu targets we include a different Makefile fragement as the
 # build options for bare programs are usually pretty different. They
 # are expected to provide their own build recipes.
+EXTRA_CFLAGS += -ffreestanding
 -include $(SRC_PATH)/tests/tcg/minilib/Makefile.target
 -include $(SRC_PATH)/tests/tcg/multiarch/system/Makefile.softmmu-target
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.softmmu-target
diff --git a/tests/tcg/aarch64/system/pauth-3.c b/tests/tcg/aarch64/system/pauth-3.c
index 42eff4d5ea..77a467277b 100644
--- a/tests/tcg/aarch64/system/pauth-3.c
+++ b/tests/tcg/aarch64/system/pauth-3.c
@@ -1,4 +1,4 @@
-#include <inttypes.h>
+#include <stdint.h>
 #include <minilib.h>
 
 int main()
diff --git a/tests/tcg/aarch64/system/semiconsole.c b/tests/tcg/aarch64/system/semiconsole.c
index bfe7c9e26b..81324c639f 100644
--- a/tests/tcg/aarch64/system/semiconsole.c
+++ b/tests/tcg/aarch64/system/semiconsole.c
@@ -6,7 +6,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#include <inttypes.h>
+#include <stdint.h>
 #include <minilib.h>
 
 #define SYS_READC 0x7
diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/system/semiheap.c
index 4ed258476d..a254bd8982 100644
--- a/tests/tcg/aarch64/system/semiheap.c
+++ b/tests/tcg/aarch64/system/semiheap.c
@@ -6,7 +6,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#include <inttypes.h>
+#include <stdint.h>
 #include <stddef.h>
 #include <minilib.h>
 
diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 41c7f66e2e..214f7d4f54 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -12,7 +12,7 @@
  *   - sign extension when loading
  */
 
-#include <inttypes.h>
+#include <stdint.h>
 #include <stdbool.h>
 #include <minilib.h>
 
-- 
2.36.1



