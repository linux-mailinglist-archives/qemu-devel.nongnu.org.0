Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706B8B944
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 14:58:27 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxWNe-0007mZ-RU
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 08:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWFS-0002Yt-Ql
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWFR-0000nH-M9
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:58 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hxWFR-0000mF-ES
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:57 -0400
Received: by mail-wm1-x342.google.com with SMTP id f72so1386165wmf.5
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NoY4fxuwSw4w5d0A97p1qZBRlAujfMxBHOYoRwMXm8I=;
 b=bguDt9Lfy7i3w+MyuHH+hr1JoO5u/iyHxOohMr9ooAd1ybUxCvfi7GcmA8YaOjA2r1
 UOP4aE95WI2ziWF26t/hYw+eNvdz+KESuZsRfzvtW8hiq33nFkqTFScby8pxV3X1rHfc
 oGX+q91tNsXhlEkWZ5t5ykHdw93jEZActMRh/gfntKMqVZSbc1oTyY10RYHKTJu/0VGh
 g+4pC1DgLV1R2BvDMsqhL53yVmXEHELMCs6mGBsp1dptFj37wpZIHp3gS87G/mv5zrcc
 BwuY4Cn2ZPFApZZIijpPFvGsDsMKjes5nDEAfb7jwJ75rRCGwM/3DJN064VEtIzH1b/4
 keLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NoY4fxuwSw4w5d0A97p1qZBRlAujfMxBHOYoRwMXm8I=;
 b=I9BTV6VqTaHw/21Hn62iJxnEX4iszEsoFOop220o/vp+VJ5o+hT0l2wIj4P/CJ2mMS
 Tw3XKOrVkKLsFwU++b+qpkFIkmwV7RDvUpqHbFpK91FPuI5svCwjNSRllvzQ17iGFVPi
 qgc1IaB686d2wo3Z89HCJw31FqphygL1AHmSwxl8Q7TPzvIItAadnTMQnAYz4EOeJlpu
 /AmwlPEeFka1ghDljwcQmTDMJAP9Gg2yvDItSmCRg1/7zPcCqpWz2IRbzd8Og1KQdA63
 h04N7dxXs0l0XvbTE+avHaj2kSrsehRQvRqw7PI45aXsCGmQpfEeufeILosxwJ/+TteY
 vsvw==
X-Gm-Message-State: APjAAAVGXJXusoxhD0AxgtzOhzP3rY7SJAtqMm7KY6wvDhjCK5rs7NZT
 3GCfNhYUySUD9U2aFG6HQnHYaw==
X-Google-Smtp-Source: APXvYqzk1SaYamAhANQ7ZOGx/4l/FUNMITCJzDxRQ2pzjZ127lXSjZGWCKhifeIJio+wqQyfZ+nnxg==
X-Received: by 2002:a1c:4d0c:: with SMTP id o12mr3106796wmh.62.1565700596345; 
 Tue, 13 Aug 2019 05:49:56 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id w5sm1705603wmm.43.2019.08.13.05.49.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 05:49:53 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 240B51FF9C;
 Tue, 13 Aug 2019 13:49:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 13:49:46 +0100
Message-Id: <20190813124946.25322-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190813124946.25322-1-alex.bennee@linaro.org>
References: <20190813124946.25322-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v3 13/13] targets (various): use
 softfloat-helpers.h where we can
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
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generally the cpu and non-FP helper files just want to manipulate the
softfloat flags. For this they can just use the -helpers.h include
which brings in a minimal number of inline helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/alpha/helper.c   | 2 +-
 target/microblaze/cpu.c | 2 +-
 target/s390x/cpu.c      | 2 +-
 target/sh4/cpu.c        | 3 +--
 target/tricore/helper.c | 2 +-
 target/unicore32/cpu.c  | 1 -
 6 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 93b8e788b18..c6998348df4 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -21,7 +21,7 @@
 
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "fpu/softfloat.h"
+#include "fpu/softfloat-types.h"
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 0bec54b2f8a..9cfd7445e7d 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -28,7 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
-#include "fpu/softfloat.h"
+#include "fpu/softfloat-helpers.h"
 
 static const struct {
     const char *name;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 736a7903e22..5db016672bb 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -42,7 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #endif
-#include "fpu/softfloat.h"
+#include "fpu/softfloat-helpers.h"
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 816d6d7f311..d0a7707991f 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -25,8 +25,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
-#include "fpu/softfloat.h"
-
+#include "fpu/softfloat-helpers.h"
 
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index a6803368506..d5db7b2c03f 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -19,7 +19,7 @@
 
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "fpu/softfloat.h"
+#include "fpu/softfloat-helpers.h"
 #include "qemu/qemu-print.h"
 
 enum {
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 802e2f1eba5..b27fb9689ff 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -17,7 +17,6 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
-#include "fpu/softfloat.h"
 
 static void uc32_cpu_set_pc(CPUState *cs, vaddr value)
 {
-- 
2.20.1


