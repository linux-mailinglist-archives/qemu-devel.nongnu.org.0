Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1F431EFD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:07:37 +0200 (CEST)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTId-0006Xl-K0
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcTDy-0003Gp-OO
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:02:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcTDw-0005hC-Sm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:02:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso10487665wmc.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dr9HiO6Z+6raCU+RfVpg+exNsSiRLldmzl+NY3BKOw=;
 b=H2HktZmTWi7wEQEvdcjPBiDGlTr8Sw7fYYJP7G9fLVTTsBLID2TFFP7deoZ1Vt/574
 9uLIFzvmA9erIdrpyAtaT5bibRDK5Ed7IusJVHiWVX4294Z+ySdWbTyKKH5SSobT++zu
 F3ugDfbMyUXW3srSgt9OR+uyVqwFHHxMW7PyEk7hoU7SgC1zameWSsKICLbBCViZDfQ8
 0mIJkIJLXwn0sJvSq3IrdEtdVEb7KPWpitH0YliuVl79JlCDyYqzv/nddrNl7wTUXLRr
 DcPCs1X3kJvnAh5B63O8S7omkQynORVktaZJdVVx+VRODaUe+b/6rT1S+2DPuvO4RMTq
 3hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dr9HiO6Z+6raCU+RfVpg+exNsSiRLldmzl+NY3BKOw=;
 b=1nmH7iTKWSDE54m3W8N/9ENfKK9yDcQxiSuvzw4LXwKJBuQN6+GpF6Tw+uSbJ9B90r
 D50DgC9b4qUBXj3DCEAZ/2Xk88knglRd7pX8WlBEX18siAPqQO64BLNvUlz34SEQ/n1u
 E0asGlrVHRve4E7cD4atWFn074AQaH2i6MzFhMUTQ3DYIuLzcvdqIpBXqEYZbAvBjWPr
 RXwz1YH9vSQzQ6Rgz/YZRMqvJDkShfNqu5wh/0t3TBPkUbOl19Hj3Ij7fAw9kAnYtreR
 RmKuAU95I/Any9BiaKxIq1VBUoGEwZrtKw34X5FMCGuYRhID7oVyqmFVSA8u8e9U+sYf
 hexw==
X-Gm-Message-State: AOAM5327qM973kCltoEUvvw2bWFhBdPCpJMjKmZmRsAl8Az/7XAX21eU
 5VKfLdM0bwTLu0Db4K9f8JWjzA==
X-Google-Smtp-Source: ABdhPJxT3zHPblIc9S3uPvQH0H5033XJccUxZpDpSHZZBaLLqpM+s6A0RrCjKrxrFYkRZxCwP7iocQ==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr31326162wmb.191.1634565762838; 
 Mon, 18 Oct 2021 07:02:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p19sm17991599wmg.29.2021.10.18.07.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:02:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D62A11FF96;
 Mon, 18 Oct 2021 15:02:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] chardev: don't exit() straight away on C-a x
Date: Mon, 18 Oct 2021 15:02:26 +0100
Message-Id: <20211018140226.838137-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there are a number of uses in the code-base of the exit(0)
pattern it gets in the way of clean exit which can do all of it's
house-keeping. In particular it was reported that you can crash
plugins this way because TCG can still be running on other threads
when the atexit callback is called.

Use qemu_system_shutdown_request() instead. I did a gentle rename of
the runstate stub seeing as it now contains two functions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
---
 chardev/char-mux.c                     | 3 ++-
 stubs/{runstate-check.c => runstate.c} | 5 +++++
 stubs/meson.build                      | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)
 rename stubs/{runstate-check.c => runstate.c} (64%)

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index ada0c6866f..a46897fcd5 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -28,6 +28,7 @@
 #include "qemu/option.h"
 #include "chardev/char.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/runstate.h"
 #include "chardev-internal.h"
 
 /* MUX driver for serial I/O splitting */
@@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
             {
                  const char *term =  "QEMU: Terminated\n\r";
                  qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
-                 exit(0);
+                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
                  break;
             }
         case 's':
diff --git a/stubs/runstate-check.c b/stubs/runstate.c
similarity index 64%
rename from stubs/runstate-check.c
rename to stubs/runstate.c
index 2ccda2b70f..f47dbcd3e0 100644
--- a/stubs/runstate-check.c
+++ b/stubs/runstate.c
@@ -5,3 +5,8 @@ bool runstate_check(RunState state)
 {
     return state == RUN_STATE_PRELAUNCH;
 }
+
+void qemu_system_shutdown_request(ShutdownCause reason)
+{
+    return;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index f6aa3aa94f..8f6a9f17e5 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -35,7 +35,7 @@ stub_ss.add(files('qtest.c'))
 stub_ss.add(files('ram-block.c'))
 stub_ss.add(files('ramfb.c'))
 stub_ss.add(files('replay.c'))
-stub_ss.add(files('runstate-check.c'))
+stub_ss.add(files('runstate.c'))
 stub_ss.add(files('sysbus.c'))
 stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
-- 
2.30.2


