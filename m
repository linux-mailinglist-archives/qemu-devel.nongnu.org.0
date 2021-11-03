Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AD4446FE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:23:55 +0100 (CET)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJzO-0005Ei-JP
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoI-0005cp-Qs
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoG-00074t-Hg
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r8so4632414wra.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6CwJoaEBKjKMYgYgC8qHcZ4bffXqP81dXgxRXrPAtQ=;
 b=evIiUVtAEpCKDO2ru74x1vhM30z6THoYQrEBhGxB5c93JfFR0iq/KxMmL/E8mgh/LD
 Tdn0L8t5IZJ2/F9lyssesxL6TowrrJSq/VZw2R30+h70TxbcO2C7ClnFMscfGc2yY8+U
 OoJLi9KSRzhjchUfbwpw6RlPH9ngrnUPR/Sl2ICujRWMbOakM5AnSMFozXiT+Z2pQ5Fb
 MEOIs80o4reFbrXzcit0eRQAx8rPK7TvJItL/kXEfjP4rlbwJw/8W7R6kSlnvo59xI/r
 z6sn1Q71fS/l7mP0ZEGKNB6Rv0/l2MgmShgQFqcighThtu/NTVSnQIbgaWIRXw50KJJn
 ntMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6CwJoaEBKjKMYgYgC8qHcZ4bffXqP81dXgxRXrPAtQ=;
 b=pHhCMrYYhmMIH833wD4c6dC/0/GFkU3qXElRaETgG6hs3gEurMT/aZVervgdvm7VuX
 p2KmMnpkZw7J5s1Y/sxAKJ3HrpEmi6/uIoJ6RlxPAY5ma+/VoKI8L85n0puSdoqXcipk
 OLSVc+V30/bGEjsiTV0Uyv30OCl7dcxPU7cbPs1CgskSWfh+1ZGr3ytPL3YL+3y2t+/s
 dqOfxQEQULvmFuBFF1sBThBOVj88pjaYjVGWCOZH/qzBjQPrw8RbvXvunjeao3f7alte
 J/8aFyxGU+08pEqZNTn3TbItV6zXbOE+eeVBMOkPDrvZ0WW3pyY83CfSqXUAUJWEjwHG
 vdQA==
X-Gm-Message-State: AOAM530iQ0eL2akph1+CxGxviV8Ku4jmknQqLldJEZ80N+UuGXHALH2x
 h3iUtxCOoDIUAX5bPEIDoSc/Dg==
X-Google-Smtp-Source: ABdhPJxwT2rgbK8gmo/v0NPl/B8rWLrm5SqcjMrwcojP9XZg+72lhMJxc+/ShLoeykCSMcVhGSHcPQ==
X-Received: by 2002:a05:6000:1842:: with SMTP id
 c2mr31651325wri.301.1635959543152; 
 Wed, 03 Nov 2021 10:12:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 10sm7013942wme.27.2021.11.03.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2C6D1FFAE;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/21] chardev: don't exit() straight away on C-a x
Date: Wed,  3 Nov 2021 17:05:52 +0000
Message-Id: <20211103170558.717981-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20211026102234.3961636-19-alex.bennee@linaro.org>

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


