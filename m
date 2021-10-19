Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18D433241
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:31:57 +0200 (CEST)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclTQ-00062v-4T
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mclQk-0003TU-SW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mclQj-0005JW-2P
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so1995814wmq.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/uK1jDKTLkid3j4yaxLUFlZ/3QtXdnoxP/si0rXyn0=;
 b=nIksu12YCU+A22rKmAMp6UkyTzdHrN2QSVDvdIHGtxzIt5E95d2Sfrekju8CmK37d0
 vrCWKbImPuALSyK98jZMbC7dxtsHW2GRT1MQqBMLl+iCu4Fne54hrg/MDlPPmjUAWIqR
 9bN3qGm/ohLp/L1MSdBG3UMsANc0mF/lsSgBHCg2yvFm6XRMqLkpnNILVRhy1uiKWLn9
 W6jh4yxWPJ+CbUEbY7uvMTnLpC7hzRC5Rg9+MPWk/0N7LW/geWD2+wZbJn2U+q3GHqrM
 llfYOh2BdAjJkRB82hmLds+tdhTsUBFyGCQGPYe6dj6fosvHWUQVfxgB7Vy0ja/WR84v
 3tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/uK1jDKTLkid3j4yaxLUFlZ/3QtXdnoxP/si0rXyn0=;
 b=xnTDHQAJ1bx3oZn4WJRW37hlmM5HDsJnRWVa1fvMKcpgdHswV6qUwJSXJBNddAst9u
 Ro95IA10TTL4ib4a3VbO12D7xYdiXaZl2X3/VGtE05RG/SdS3Y3Y9o4Ab/lhObdMKfxf
 nMKmlIei75D85fMyBTSZKZAhZJCjZ7JHrOmt2RPVRrnpZc3HdHFAV4xWKNRvHX4IxP8O
 BZt896UoDak/LxBcVO3x6m0yb2Zg/Nic6HuZUqFYipQbZ20HSJOBXzb/S9KR1CPaRg4k
 uhMr5OmD4rPC6f9UPCkvjyPDqeRYEsQPDUKD2r9tYMZ1xAQadF30ZIHaLmxNnEPlSRhE
 Qm+w==
X-Gm-Message-State: AOAM5336k3oVAgMN+Fv0Dh4f5HFiwbTKQgRRdGAfRReeSXgyXI2TRuq8
 9WVqLo4wNss1RbCqAc8JLvKQJg==
X-Google-Smtp-Source: ABdhPJxnSoDdvTsSZD24kVstNtIEtSB5I1HJLD+CmSqW3rNIfriR8xDCABBNR/8z3XqRAapR5TIyww==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr4788026wmo.125.1634635747463; 
 Tue, 19 Oct 2021 02:29:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s3sm14582497wrm.40.2021.10.19.02.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B57201FF96;
 Tue, 19 Oct 2021 10:29:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] chardev: don't exit() straight away on C-a x
Date: Tue, 19 Oct 2021 10:29:01 +0100
Message-Id: <20211019092901.1519570-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Use qmp_quit() instead which takes care of some housekeeping before
triggering the shutdown.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211018140226.838137-1-alex.bennee@linaro.org>

---
v2
  - use qmp_quit instead of direct qemu_system_shutdown_request
  - g_assert_not_reached() for the stub definition
---
 chardev/char-mux.c | 3 ++-
 stubs/qmp-quit.c   | 8 ++++++++
 stubs/meson.build  | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 stubs/qmp-quit.c

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index ada0c6866f..ee2d47b20d 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -28,6 +28,7 @@
 #include "qemu/option.h"
 #include "chardev/char.h"
 #include "sysemu/block-backend.h"
+#include "qapi/qapi-commands-control.h"
 #include "chardev-internal.h"
 
 /* MUX driver for serial I/O splitting */
@@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
             {
                  const char *term =  "QEMU: Terminated\n\r";
                  qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
-                 exit(0);
+                 qmp_quit(NULL);
                  break;
             }
         case 's':
diff --git a/stubs/qmp-quit.c b/stubs/qmp-quit.c
new file mode 100644
index 0000000000..a3ff47f7bd
--- /dev/null
+++ b/stubs/qmp-quit.c
@@ -0,0 +1,8 @@
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-control.h"
+#include "qapi/qmp/dispatch.h"
+
+void qmp_quit(Error **errp)
+{
+    g_assert_not_reached();
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index f6aa3aa94f..71469c1d50 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -31,6 +31,7 @@ stub_ss.add(files('pci-bus.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
+stub_ss.add(files('qmp-quit.c'))
 stub_ss.add(files('qtest.c'))
 stub_ss.add(files('ram-block.c'))
 stub_ss.add(files('ramfb.c'))
-- 
2.30.2


