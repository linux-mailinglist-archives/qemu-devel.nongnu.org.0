Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E3ABD9E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 18:23:05 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6H0q-0006Cn-QP
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 12:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6GyN-00048r-28
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:20:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6GyL-00047a-Me
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:20:30 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37949)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6GyL-00045p-9v; Fri, 06 Sep 2019 12:20:29 -0400
Received: by mail-pf1-x441.google.com with SMTP id h195so4837673pfe.5;
 Fri, 06 Sep 2019 09:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=AES+BfF3l1s5FVFWAAB+fdZAhbNT/mYS7UL6vuCzg9Y=;
 b=VteO2TcBoesI4v0n0Z59qaHf9yfMl49XZXP33mH9VaChwUwTV09wudlO1szrlyTKdf
 X4gRIgTwhxVFslE9gaQBGtUw2xrlsYaZdO8kD7MGVVkP74E3JkPDZJhEUUgUnUwhux0j
 vn6WinqWlTip/IB2tPVi442scQM7hm6yO+Bg08svLAdLjpSHLF8k9I4dhI2AnSIqBK87
 /XgQHuV1DnqxOnz4leDID00cjdARF9Av+olLBZlWpAGT3CtUOWshE9EldaZSyAmwbKcT
 accjEglCrOa6OBOOPOA+27tGXLeOsAfWZkNdXAxCerqzcSUmp3GMF8d6M18svdI9RRKk
 3/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=AES+BfF3l1s5FVFWAAB+fdZAhbNT/mYS7UL6vuCzg9Y=;
 b=U0M5kBTltJzhBxQbAXR5Ga2ECEkfQrhqlm4JvscCceGH406+xpJJ/V0yroxfasbgHn
 SC0M+WOi6loN3djYpHSoVAZYYPh+XXAPG2VL3zpbJBH0fKVuCF7ebul83okq0Jp5EY6z
 aSB3uq4lOIhgu3xzToee0/nm7CpXdD8XWklSErCTpO5oWi1fWMro014EMdhFlIdPA14X
 pJHTDsMGfyzcvpLAyZi/ZC6BI+rjF6w/eCHmGOa5MvYCy0m3jjPCNwlIBAwlU69g84J6
 kNWbLXVOAV6sy6btfCEjMJdJhW7JdjnPSazKhBjxk5XOFoxZjQ2IdcFDuMrOt4pHj0WG
 WFsQ==
X-Gm-Message-State: APjAAAV+OMUYikzAnN7G+Y8nPYM0SPDbLNwfX0asWBbZo3fqqfxZVnEw
 k9TEb1bdosxtLjUzh7pXQl4=
X-Google-Smtp-Source: APXvYqylbjfHNaRXXQ5Y5CaRcjF2INrn+0MpW2v6uHBNG+y4t0e9HsuPpJCS9OIv1p/B4UvENAh60g==
X-Received: by 2002:a17:90a:ae04:: with SMTP id
 t4mr4038213pjq.52.1567786828269; 
 Fri, 06 Sep 2019 09:20:28 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.27
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:19:49 -0700
Message-Id: <1567786819-22142-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v8 02/32] riscv: sifive_test: Add reset
 functionality
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a reset opcode for sifive_test device to trigger a system
reset for testing purpose.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

---

Changes in v8:
- newly included in v8 to ease patch inter dependencies

 hw/riscv/sifive_test.c         | 4 ++++
 include/hw/riscv/sifive_test.h | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 3a14f9f..7117409 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
+#include "sysemu/runstate.h"
 #include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/riscv/sifive_test.h"
@@ -41,6 +42,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
             exit(code);
         case FINISHER_PASS:
             exit(0);
+        case FINISHER_RESET:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            return;
         default:
             break;
         }
diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
index 3a603a6..1ec416a 100644
--- a/include/hw/riscv/sifive_test.h
+++ b/include/hw/riscv/sifive_test.h
@@ -36,7 +36,8 @@ typedef struct SiFiveTestState {
 
 enum {
     FINISHER_FAIL = 0x3333,
-    FINISHER_PASS = 0x5555
+    FINISHER_PASS = 0x5555,
+    FINISHER_RESET = 0x7777
 };
 
 DeviceState *sifive_test_create(hwaddr addr);
-- 
2.7.4


