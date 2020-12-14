Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC52D9B11
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:34:51 +0100 (CET)
Received: from localhost ([::1]:47714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopsA-0003c7-SA
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnu-0007nh-Fp
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:29 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnr-00068K-US
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:26 -0500
Received: by mail-wr1-x443.google.com with SMTP id i9so16845314wrc.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyTGjsVZ1hUFkxFr4OcBIz/5XjlUR5r506a9Y66UF4g=;
 b=qyFFzz0a2jZAVVfg+/cRN9uXPbnwXylhX4jyu7Xct4OEJj01h4Dn5HT8mzmZT4x2T/
 24OFOR/ZzTVmpjZeyXb4Qnl/aTyS9jLRP4/MM1oahnMmTO3+9/l1bKho/mp36fAT8Gx7
 W8gZtIAr+0uu1rzH3zhw0G8iCYid7poMQaNE0pqn3eMiMYAxjQj/UK474UKyFXO3fW3L
 wnkPudjXV3ZMOKSw273e17xB1VJE020m24s6t0nNmeNv1bi+phW6OQ/s8AqK3ea1rljA
 6YAv75Lfpvn2dLmklC5DwNzmydBD2vpMrN6KN/nPLB+oMUOcWr2SEnQ4NizxJbD7epef
 N2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AyTGjsVZ1hUFkxFr4OcBIz/5XjlUR5r506a9Y66UF4g=;
 b=M5fMjByRQUyMex7EajteE2zxh9a9FYIvyZx698BeaAFu/r45f5DI8HvJ+cde9CTTfk
 VyrXD0QROZ/9xZeOf3tHq5SFc5zh6V76t1qEFOmygM4bbJSeoGVaAsZpsA09QR5OiGXn
 59oUcNwg7qtKX1FEQ/ZJ5RlgLiXC692kPgN23OkipKKrvlMMocHBZHE7kp5Eri14EmD7
 qGck1ppEP+GZSlApkXvb8tEJrDPYddqlreOZFaPXgAll5nRD0sYWhkGxRWXIquMLlcZG
 3zauzf4dAzs0uxhv1cdIWGBmpLW//9iK0eOZGMxjX5Apu4zPeOcd6QENbp4weF10sAkN
 B/1A==
X-Gm-Message-State: AOAM5309OajbRy+NIQqJWr1qui8dQRSpRcLuxRG/FCLAE+7u1OvNW4Xu
 aGmUL/R2eb3pOOB0GTJSMt9voA==
X-Google-Smtp-Source: ABdhPJzyi2/dW8Ij2uzdJ7M6K2eoWkn39q0G35bC6oGXtfnPyAauG7N75l0+XKgfie/YuWSwxfiaig==
X-Received: by 2002:adf:df03:: with SMTP id y3mr22786495wrl.102.1607959822548; 
 Mon, 14 Dec 2020 07:30:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u66sm32040538wmg.30.2020.12.14.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 340FE1FF91;
 Mon, 14 Dec 2020 15:30:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/6] gdbstub: drop gdbserver_cleanup in favour of gdb_exit
Date: Mon, 14 Dec 2020 15:30:11 +0000
Message-Id: <20201214153012.12723-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite it's name it didn't actually clean-up so let us document
gdb_exit() better and use that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 14 +++++++++++---
 gdbstub.c              |  7 -------
 softmmu/vl.c           |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 492db0f512..ff0b7bc45e 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -46,7 +46,17 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
 void gdb_set_stop_cpu(CPUState *cpu);
-void gdb_exit(int);
+
+/**
+ * gdb_exit: exit gdb session, reporting inferior status
+ * @code: exit code reported
+ *
+ * This closes the session and sends a final packet to GDB reporting
+ * the exit status of the program. It also cleans up any connections
+ * detritus before returning.
+ */
+void gdb_exit(int code);
+
 #ifdef CONFIG_USER_ONLY
 /**
  * gdb_handlesig: yield control to gdb
@@ -187,8 +197,6 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
  */
 int gdbserver_start(const char *port_or_device);
 
-void gdbserver_cleanup(void);
-
 /**
  * gdb_has_xml:
  * This is an ugly hack to cope with both new and old gdb.
diff --git a/gdbstub.c b/gdbstub.c
index f6566c7b82..7172f063a1 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3547,13 +3547,6 @@ int gdbserver_start(const char *device)
     return 0;
 }
 
-void gdbserver_cleanup(void)
-{
-    if (gdbserver_state.init) {
-        put_packet("W00");
-    }
-}
-
 static void register_types(void)
 {
     type_register_static(&char_gdb_type_info);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..0694a1d602 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4509,7 +4509,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
 void qemu_cleanup(void)
 {
-    gdbserver_cleanup();
+    gdb_exit(0);
 
     /*
      * cleaning up the migration object cancels any existing migration
-- 
2.20.1


