Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9156A44AB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFT-0002gx-Bg; Mon, 27 Feb 2023 09:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF4-0000aP-Ah
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEz-0001L2-JW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:35 -0500
Received: by mail-wr1-x434.google.com with SMTP id q16so6392576wrw.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UvspQ/VBF3M0wOKvRS1ObiXSHGJAYd524IYPVL8lVZs=;
 b=aVWE7y9VdH+5wu+v/tU46odSWWAyHFe34qGMb0OZUfdxjQrry/MorshwTXJJ1tnffm
 fYyKn1Kh/IVA6LUg13ABJ8ydHldYmlB41dcqQ5keSPa8j+Et8/aZ6G+zfe9GsvGux2Gg
 Qz9Darnb+qmvf/xSGY3Hcg/QiTOmZpJnh2Gd0FH/csKdWKJlHHUu/n/KZwAO0SM1Ktsg
 fnuC1k2GZ8dWW6z0NYSifS5sKv0ZqD5ktXCMBZlInFEenLMw6XR4RMIhpAjfxajR74ZA
 9Z2dImjvbd93IO8Fo5MyYrdclsgHaNnMnU8h+UARUvep4dCOkyvVqwphxcrEa4BofSeO
 BCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvspQ/VBF3M0wOKvRS1ObiXSHGJAYd524IYPVL8lVZs=;
 b=8OCQn8wE/odaEFy9/4gGhpotOVRtz9iWPmAI6+C4yCulOHXc3jf1gDy4AR0fRrS3Xk
 IN8U2vQi5h6wuatB5sbAd/kdYrf3RZJQoq3QeyUzExCve7sxcS4TJZScIdJx47o4nqBj
 TRLHCUgNSp4Fefs0lAU3qt0DL9t0L7nTpwe3rY9OzJRhDtIGdCOIy+sRJloqXuMuW4fw
 l0cq48982hE+bPNfN2WH01XhwdUiwLDFBsvvrGKwSHf3Iv39f071DZknP51g6kR/hl/7
 ZE7iXsmL7DZRMU89zFm6m653tjtr7pZoJUv9SUh2NyzoluDPRPiXrHIN0QdnvaUgRiUU
 5LCw==
X-Gm-Message-State: AO0yUKVJEfWU4aeqVzzLWmy0B248U/8orDblKPl/dbFkEPXJMcdNyfxd
 9PNkZ6E9z9e7KTXgaELHRhOw1hYSOPpt0OQu
X-Google-Smtp-Source: AK7set9IC8vR3Cs3mocdn1XJgG/8uGQA0krpP84vhX8vQYO+PpJ2NpdntCiXm8wRzgNIKTn3zHsW8A==
X-Received: by 2002:a5d:43d1:0:b0:2c9:e996:8275 with SMTP id
 v17-20020a5d43d1000000b002c9e9968275mr5292833wrr.13.1677507151526; 
 Mon, 27 Feb 2023 06:12:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c350a00b003daffc2ecdesm14019924wmq.13.2023.02.27.06.12.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 123/126] dump: Clean included headers
Date: Mon, 27 Feb 2023 15:02:10 +0100
Message-Id: <20230227140213.35084-114-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

"qemu/win_dump_defs.h" is only required by win_dump.c,
but win_dump.h requires "sysemu/dump.h" which declares
the DumpState type. Remove various unused headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230225094903.53167-4-philmd@linaro.org>
---
 dump/dump-hmp-cmds.c |  2 +-
 dump/dump.c          |  6 ++----
 dump/win_dump.c      | 15 +++++----------
 dump/win_dump.h      |  2 +-
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
index e5053b04cd..b038785fee 100644
--- a/dump/dump-hmp-cmds.c
+++ b/dump/dump-hmp-cmds.c
@@ -1,5 +1,5 @@
 /*
- * Human Monitor Interface commands
+ * Windows crashdump (Human Monitor Interface commands)
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/dump/dump.c b/dump/dump.c
index 4d68a74ffa..da63129825 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -14,22 +14,20 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "elf.h"
-#include "exec/hwaddr.h"
+#include "qemu/bswap.h"
 #include "exec/target_page.h"
 #include "monitor/monitor.h"
-#include "sysemu/kvm.h"
 #include "sysemu/dump.h"
-#include "sysemu/memory_mapping.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-dump.h"
 #include "qapi/qapi-events-dump.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
+#include "hw/core/cpu.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
diff --git a/dump/win_dump.c b/dump/win_dump.c
index f20b6051b6..ba7fa404fe 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -1,5 +1,5 @@
 /*
- * Windows crashdump
+ * Windows crashdump (target specific implementations)
  *
  * Copyright (c) 2018 Virtuozzo International GmbH
  *
@@ -9,19 +9,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/cutils.h"
-#include "elf.h"
-#include "exec/hwaddr.h"
-#include "monitor/monitor.h"
-#include "sysemu/kvm.h"
 #include "sysemu/dump.h"
-#include "sysemu/memory_mapping.h"
-#include "sysemu/cpus.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/error-report.h"
-#include "hw/misc/vmcoreinfo.h"
+#include "exec/cpu-defs.h"
+#include "hw/core/cpu.h"
+#include "qemu/win_dump_defs.h"
 #include "win_dump.h"
+#include "cpu.h"
 
 static size_t win_dump_ptr_size(bool x64)
 {
diff --git a/dump/win_dump.h b/dump/win_dump.h
index b8c25348f4..56f63683c3 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -11,7 +11,7 @@
 #ifndef WIN_DUMP_H
 #define WIN_DUMP_H
 
-#include "qemu/win_dump_defs.h"
+#include "sysemu/dump.h"
 
 void create_win_dump(DumpState *s, Error **errp);
 
-- 
2.38.1


