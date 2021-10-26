Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691E43B061
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:43:10 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJvB-0002Tw-Ed
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJht-0001cy-4q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhr-0004ei-5w
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id s19so18199012wra.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5nc1aRJ5hwFpLdq28mQ7T73wF2chGMJXK8KdXx7nbm4=;
 b=WTw/9GhrCRU008VX3ZeBULgs4FLDr0tQX3qyUZFuvnhJO8OWfG7m2BgxqwRUshlrBC
 hG9ZSsnDi3hWBbFArqGhMqbYlRUuT6jy6j+U62Q7BgKTv8IRE6y8kDTyeXYAhdpfKcvn
 gcJ/pnlThmZ8VfzwqveH3hJu7Nmn5X4LQpTGy2Sl9g2XvRW0zzVYQjXYxZwBq97oGglq
 VpeXdegI4SN+iC6LtotV21lm5L8wa8cj0FJriSzVoNs8wYIN3f6TP/YKLU7ejLGXNS2R
 ++uBl6K7bX3nCuM+PJdVaTGMlvmxpEHT31d4dH2rhy+MtmwbwkyfS64h/RzVWuf/3pO5
 c7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nc1aRJ5hwFpLdq28mQ7T73wF2chGMJXK8KdXx7nbm4=;
 b=13/zltZDMYTmfGmR8Cy5Gdj+1Rcw3ucMVIC8BX/q7D/ot+h7SRahkc2Nu8LB/Q/aQc
 yEOjsMSz8g4iQOC20Awbl7l8Dj5xIJ2pw9xhBq/Tei1BSLH/NAbN7OiJvsMY9k/xG2DH
 qbybrl55tbmEgqfOQgouGnr0HOa41cQv0/Mu38KOAmDxMUzY2NZNKDO20O+sZ4Ich1Sm
 ZvQlARvGQCXAMK0RZdcOMYVeNTgo7F/ErPppLXUKo22wJFjAjcQDcbdpGsPfvu/+TMNj
 5o3pVv3PEUBhfTwm06EL3oPu7LJTW3CwL2PyInjUDiQAGdXT9uqRjn5jsvmjYElcuSNx
 Z0kw==
X-Gm-Message-State: AOAM533ZJqosdlcfdwne5kYSHYACf+jfl4xWKJfslIpNuasjR5vRnPhB
 YVIddu8BYrpmKYt+Oc5FSKvf4A==
X-Google-Smtp-Source: ABdhPJwlR0enq4o9J6UfhevLuG9x+N7D7ScBZbkuYdVwu6/I1+M4MwUn8FeFSSeWhAVKJ20F586CxQ==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr30370106wro.349.1635244160710; 
 Tue, 26 Oct 2021 03:29:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j10sm4370643wrx.94.2021.10.26.03.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56A781FFB3;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/28] chardev: don't exit() straight away on C-a x
Date: Tue, 26 Oct 2021 11:22:24 +0100
Message-Id: <20211026102234.3961636-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20211019092901.1519570-1-alex.bennee@linaro.org>
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


