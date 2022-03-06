Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925614CEBA6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:11:16 +0100 (CET)
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqfL-0006qY-MJ
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVq-00013B-4M
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:26 -0500
Received: from [2a00:1450:4864:20::32d] (port=37417
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVo-0003yu-Mi
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so9277832wmj.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GMB8Rq+BqMPgenOlLOMr9lo83TlpAisAXHfN8XD4OE=;
 b=pDwjZr+0d08JPvgB647Zt+xLnflHg9I2qSqZNmdXs39OxJ5vYlm8ms5iq1MSVEdZqF
 UxjB+QGBLzcRpUhTxnHleAf+a32DjDDk/GSH6sCyWfdSMYLSnFvsdRZCf/VSH/HwsoOh
 CVqZS9jPu7xbs2ZBtnvFnlwawi2xsX3Xt4xYv6dCScCdPnFfyCIOy7aW3RjQA2iYepEr
 PXpslra6p1TfVYFQLljuJy69E1uk+EtFDQ/y4Paw0HwsalEMYuv7+grwJp/wMPhTQTJ6
 MY67mDmIugsT4wld/m1rgYXzHMZPXgGiv3QuIHzCCcy6QBJv7iEaSo79EpHuseRCOYhm
 GJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GMB8Rq+BqMPgenOlLOMr9lo83TlpAisAXHfN8XD4OE=;
 b=2YG0uIwI2r5gMNWnlMV8TtT5NFrqMKCkW+kayuau2stgcfJ2tzrRI9T72pS+slEmQg
 K1g4nObBfep/9FwcVkJlWTTsrojUMc/NLq7hTFkiBawQhnWYnj13vEUwKbA9yooUZrMN
 1e1ZvG3HteBfXeShXy/ItxriA6bXDeY41skEV5PlC5H2/C3bBu5yn68qIk7K7rTY0l4J
 TBrWSct8fRjEikISQ4a9zvB3AjM/joAeMRj0ZG+BXsLf4mYLEAwoQG+YkiTXxFLAQFOt
 edfG/wHSTjhB/u+9mbAvZVcfrRwPX6v8Ao9iGGNnGdnhOl1oE/O3Jgq1BC28Eag+X7x2
 xesQ==
X-Gm-Message-State: AOAM533hD3wLNxxau0XLyLdmb0k/BXFmEYNYEJA1LMKuWZn6IhVLmrpf
 RWn69D7oeWhxGxnqwi/rbn3gqmvLGHk=
X-Google-Smtp-Source: ABdhPJx7J2iqtHuJmkrkFJsaqsB6HTsjiK6CpHTa6eWJHRvey07RuXTJ3lA0nAxU9VvqCiitRbtFWg==
X-Received: by 2002:a05:600c:1f18:b0:381:691c:b481 with SMTP id
 bd24-20020a05600c1f1800b00381691cb481mr5555989wmb.44.1646571683205; 
 Sun, 06 Mar 2022 05:01:23 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 i186-20020a1c3bc3000000b00382b25f6c9fsm10294341wma.42.2022.03.06.05.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] misc: Remove unnecessary "sysemu/cpu-timers.h" include
Date: Sun,  6 Mar 2022 13:59:42 +0100
Message-Id: <20220306130000.8104-16-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-17-f4bug@amsat.org>
---
 accel/qtest/qtest.c            | 1 -
 target/alpha/translate.c       | 1 -
 tests/unit/ptimer-test-stubs.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d52..f6056ac8361 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -20,7 +20,6 @@
 #include "qemu/accel.h"
 #include "sysemu/qtest.h"
 #include "sysemu/cpus.h"
-#include "sysemu/cpu-timers.h"
 #include "qemu/guest-random.h"
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index ca78a0faed0..66768ab47ad 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "sysemu/cpus.h"
-#include "sysemu/cpu-timers.h"
 #include "disas/disas.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stubs.c
index 2a3ef587991..f5e75a96b6d 100644
--- a/tests/unit/ptimer-test-stubs.c
+++ b/tests/unit/ptimer-test-stubs.c
@@ -12,7 +12,6 @@
 #include "qemu/main-loop.h"
 #include "sysemu/replay.h"
 #include "migration/vmstate.h"
-#include "sysemu/cpu-timers.h"
 
 #include "ptimer-test.h"
 
-- 
2.35.1


