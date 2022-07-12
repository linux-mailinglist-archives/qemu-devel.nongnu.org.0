Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2C571B0A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:21:37 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFpY-00055b-IC
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLK-00037p-Ai
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLI-0001Ss-Ep
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOJOnSmKg2WSy30NZDwJenV9RNS5JdblfeNNvCQXTJ0=;
 b=G0JpMhE/YqDcgKJurEpnal2pSE8C0lsKp3AZkgbnOu5GE9yX3i9HqK4JIDUpXYr/i1+569
 jx43M8V4lZAsS3sYIQtVEI2YmaAhzy+jmG76B4aCw2hfehwCBhBI6h+Js8PljWgVO9TzJW
 d+9koHaQtRYETYj4lRmddiAEu2Eg9sc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-bfNTCLlvPZKc9KOhXHx84A-1; Tue, 12 Jul 2022 08:50:15 -0400
X-MC-Unique: bfNTCLlvPZKc9KOhXHx84A-1
Received: by mail-ed1-f71.google.com with SMTP id
 c9-20020a05640227c900b0043ad14b1fa0so4003334ede.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOJOnSmKg2WSy30NZDwJenV9RNS5JdblfeNNvCQXTJ0=;
 b=fyt/c4iIvdSiWUhMgZb7GF+z69ANFN6CRJHHqz1G5CwGe9hF8muh8CxpSLV4obnlFQ
 bV998RPMSjbQdmahN6Pr5PZvaWqOD/BwNXMlrhnEs1L14oyPldPLbvVddBkWRod+c+87
 jSZhqTO+as7a9sMSSa83ZpaXpJBNk5mKXp5i+MOu/eAHhnUQTuxjPpZxICBw1UF23MS7
 NE8iJAb23dXyuTUn+2riCyQnPz+KXUfYVmy1uK8XRRXkUVShaZD0NzfC8dHT/jEeY9eY
 zZAXDyEaIUAh8oo7vpDB/Wa8ECsaq8n6FCf2JeltOPs7/i+6kHsq0yN9u8wdSR/MGzaQ
 04sQ==
X-Gm-Message-State: AJIora+x1P4FQlPtqwaLN5yoNztwkZ4X05Fdi3clBIW7Ih/OZLy9idRj
 ZyiSKYVuMudnOlJ+FFQhqYByGOnsa/F2rWVtLtnvvm4zzCLc/RP2hRrwt/8ko6FG+WyMVOljczy
 mgZFNVDaAcHnE+VSKLKuEGrjhrlwDf84cEURJ0S4ymcVJ1uhciKRFjVwfa75kBsRlZkE=
X-Received: by 2002:a17:907:7292:b0:726:95e4:5a21 with SMTP id
 dt18-20020a170907729200b0072695e45a21mr24082084ejc.266.1657630214029; 
 Tue, 12 Jul 2022 05:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLawvZHJuvj4b9THQm6/o32Lw2izbNCfyIxfQa7a4Eo1zQM4rI2984YvveqyOH+KE+KXE+Qw==
X-Received: by 2002:a17:907:7292:b0:726:95e4:5a21 with SMTP id
 dt18-20020a170907729200b0072695e45a21mr24082043ejc.266.1657630213670; 
 Tue, 12 Jul 2022 05:50:13 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 25-20020a170906309900b00722e57fa051sm3810358ejv.90.2022.07.12.05.50.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] tests/tcg: compile system emulation tests as freestanding
Date: Tue, 12 Jul 2022 14:49:47 +0200
Message-Id: <20220712124956.150451-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



