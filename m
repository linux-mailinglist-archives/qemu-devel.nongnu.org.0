Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B4935D9C6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:14:31 +0200 (CEST)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEBq-0003Tq-2Z
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWE7i-0007pe-7C
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:10:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWE7g-0007pi-8z
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:10:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id e7so6497474wrs.11
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/1LbSlSgHUfCQEcO9y0pv344AB8nCW5zeRWPXmoBzsk=;
 b=HQ3A99Y30/6JDKPT5WJxwM1rDP+A0bvLeu7MIuDyV07He0O3N2kzHx3VXNEOgDyF/v
 7tlzyaiAWULD8DsbNnaDqoJpt5rkoplB0w4zG83maOmw+OeAJyzL1naOVBA5jlN6WKgC
 Tisph465/wuvfedwezSed9wNpK6AwZOpDsashJQA7mLmNtxGaQKkfR9+YarQQy8a435M
 RyPmJsaUbKJQ9K8HomMhCLIvswL7Nn76WvrGNKVER//D7HCozRxKn/MUJeJvc8OTL+Qc
 VDx+Z/kqfZWvLyP/U4CnnpMt1d34/NL1Hxay0ST9/xWRFh6oJNkYVNJS1iiv7dMshUmr
 FtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/1LbSlSgHUfCQEcO9y0pv344AB8nCW5zeRWPXmoBzsk=;
 b=fxsnIKt3UkebxfqsiHaRExMTWDTrHIT4vHtyLULDN2TTUl5a+CqJy4JytV1cLRnQSF
 e/ou84DnPLcFM8+W6D8Ity5G4bqYKmt4MPygfJItlBYkFKwwSURyfR3KufpF9XcIumKQ
 ydOnJs0cxlD/8Mn3n5NxlBkMj08P52bFZAD18W8YJhaQNAwqcJzsremO0SKjn10q1E0Z
 OvYEK/tGWcSIW2MaWmoYaB5R4UQ3pRYvKJw8VKhXVpfqxhDNwJhX6ataVipLTuvj6BLy
 1z7D+Vrxn4Zgvrf0AS4ktrvaKH6tKAQcuZuRCHrY6E9oYPZyiHNR8T5nmVw2C4aMoBIp
 a+Lg==
X-Gm-Message-State: AOAM5337Gge0SBA3VtQENHCKL8XtfYDYY8s4IlZ0t0/Y9EbXmn8eajdO
 Lu7A8GGziU2s7rOkMZGCJqbTvngwHNk=
X-Google-Smtp-Source: ABdhPJyUu3PBguVNIHHWJHKqKvSz/IqI5cSas2UseGis9160MrC436OzguytG6hXre1mGOyOvsetOg==
X-Received: by 2002:a05:6000:54d:: with SMTP id
 b13mr34835327wrf.417.1618301410444; 
 Tue, 13 Apr 2021 01:10:10 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm4439645wrp.66.2021.04.13.01.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:10:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1] exec: Remove accel/tcg/ from include paths
Date: Tue, 13 Apr 2021 10:10:08 +0200
Message-Id: <20210413081008.3409459-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When TCG is enabled, the accel/tcg/ include path is added to the
project global include search list. This accel/tcg/ directory
contains a header named "internal.h" which, while intented to
be internal to accel/tcg/, is accessible by all files compiled
when TCG is enabled. This might lead to problem with other
directories using the same "internal.h" header name:

  $ git ls-files | fgrep /internal.h
  accel/tcg/internal.h
  include/hw/ide/internal.h
  target/hexagon/internal.h
  target/mips/internal.h
  target/ppc/internal.h
  target/s390x/internal.h

As we don't need to expose accel/tcg/ internals to the rest of
the code base, simplify by removing it from the include search
list, and include the accel/tcg/ public headers relative to the
project root search path (which is already in the generic include
search path).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Arguably public accel/tcg/ headers should be exposed under include/.
---
 meson.build                 | 1 -
 include/exec/helper-gen.h   | 4 ++--
 include/exec/helper-proto.h | 4 ++--
 include/exec/helper-tcg.h   | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e8..d8bb1ec5aa9 100644
--- a/meson.build
+++ b/meson.build
@@ -258,7 +258,6 @@
     tcg_arch = 'riscv'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
-                        '-iquote', meson.current_source_dir() / 'accel/tcg',
                         language: ['c', 'cpp', 'objc'])
 
   accelerators += 'CONFIG_TCG'
diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index 29c02f85dcc..1c2e7a8ed39 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -81,8 +81,8 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
 #include "helper.h"
 #include "trace/generated-helpers.h"
 #include "trace/generated-helpers-wrappers.h"
-#include "tcg-runtime.h"
-#include "plugin-helpers.h"
+#include "accel/tcg/tcg-runtime.h"
+#include "accel/tcg/plugin-helpers.h"
 
 #undef DEF_HELPER_FLAGS_0
 #undef DEF_HELPER_FLAGS_1
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 659f9298e8f..ba100793a7d 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -39,8 +39,8 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
-#include "tcg-runtime.h"
-#include "plugin-helpers.h"
+#include "accel/tcg/tcg-runtime.h"
+#include "accel/tcg/plugin-helpers.h"
 
 #undef IN_HELPER_PROTO
 
diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
index 27870509a20..68885146355 100644
--- a/include/exec/helper-tcg.h
+++ b/include/exec/helper-tcg.h
@@ -60,8 +60,8 @@
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
-#include "tcg-runtime.h"
-#include "plugin-helpers.h"
+#include "accel/tcg/tcg-runtime.h"
+#include "accel/tcg/plugin-helpers.h"
 
 #undef str
 #undef DEF_HELPER_FLAGS_0
-- 
2.26.3


