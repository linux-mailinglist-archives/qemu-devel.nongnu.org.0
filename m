Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2034E554BCD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:52:37 +0200 (CEST)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40mZ-0006uF-QS
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o40i1-0004Jv-Lj
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o40hy-0007Ul-L5
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655905669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOJOnSmKg2WSy30NZDwJenV9RNS5JdblfeNNvCQXTJ0=;
 b=Cb+ecubKPlyMuL2UiYm7rKwzNABPL6VKvZFzVBSaO6kQ9R7Oh+H13v4MnPmjSuDz0sUg0d
 nVyumiWr5tjkSG3C0pWui2kR++ByTzl8Tq47FqyoDJnfVOcpz8YrHBEXLA7ParulJLf8CN
 JpgC1XHyaxNw10yVhoG9dKNEbiC9pq4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-q1Sg8h0iOkOUzglANmpxKg-1; Wed, 22 Jun 2022 09:47:48 -0400
X-MC-Unique: q1Sg8h0iOkOUzglANmpxKg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sg40-20020a170907a42800b00722faf0aacbso301250ejc.3
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 06:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOJOnSmKg2WSy30NZDwJenV9RNS5JdblfeNNvCQXTJ0=;
 b=YZz0gBcp6b49eWgfzZD+G4TDMzRoIA0AN0ZjD+0Ln0Uok0fGI9cT1iTGH6w0e/YyDu
 SZX2w3hSfeUfUu2mwRV+RK4Y2q90wUf/zMKafqFrImAD2Rd/lEazTXofRcrueOF28GcD
 /KAN+Ne0O+jiAbqlexBP3u3crSGQ0MI7wTSmohPfUA+4rCbjT1ysaXBAYb9vw1+3Bw4G
 Cnjv2+4/lkV0gJA6OatbIGOGMDEL/GwKcB8nxiKIjKnKUaFZ4JX6pc6Ee9b9pnevU1XA
 Ce72Y0DAfEtNr2jsH8xcCnCO4MQ6azlFfaxTBWuttxYwL8sqlZdSeP/bL5fsUIIxIe6p
 u6hw==
X-Gm-Message-State: AJIora9vehWxEJL1FGJKAbWphkFOCA+j/ra7Nvt1Ns6QqNyq5VY6JH/W
 6WSRBqDumgostAJD5XzqBSQjDIxgCgyJQYPsMPpv2zVEMxKFbBj+3k3StlAlE0OIkMeeNtdWjTJ
 vDGzwT55GP+zI39c8et44WaMQ2qxY+YWzkaWHz8Os7m7P9VE4P++hBXz+dmXUTdn6T9M=
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr3369111ejc.721.1655905666694; 
 Wed, 22 Jun 2022 06:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulzs/yz3zRoJQ0vjz16jBHjknXmlV8jUO81UIpwprQ5XWtpkUWpZiaj8EMPH/kMhzIhW2Mpg==
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr3369082ejc.721.1655905666372; 
 Wed, 22 Jun 2022 06:47:46 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056402424c00b0043589eba83bsm6717518edb.58.2022.06.22.06.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 06:47:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 alex.bennee@linaro.org
Subject: [PATCH 1/2] tests/tcg: compile system emulation tests as freestanding
Date: Wed, 22 Jun 2022 15:47:41 +0200
Message-Id: <20220622134742.139306-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622134742.139306-1-pbonzini@redhat.com>
References: <20220622134742.139306-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



