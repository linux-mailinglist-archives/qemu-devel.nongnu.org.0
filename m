Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D12EFB51
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:46:36 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0Wh-0007eY-VZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TS-0005pT-4b
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:14 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TQ-0003IA-DM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r3so10425800wrt.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wV5YT0kkIRUM85lgbMG4TlRtNuUCjbVc4zflwSIgjEQ=;
 b=SjEfd5RLvdAiQFgoFigah/fmjYuSwBpWdERYc3frFRD73aYbJzpkMPWpR8yJy66YYG
 mJfl6b4ji6pfjsVFnxKRzLPznYzHmOko+3IuLRlaA4VW/EGCD+NPiGsdHbA6UTkrdWvD
 a/qImH7x02kdwHSpwbQISW+ujKcU/bzq7oMx3mDm0vCIRgXaVMPKDPa9wF2t7Rda0Xv/
 JOXBzjRnW95BMnJF3cSGXQVaPsrx70q4Pav6IKRVN120zi6/vC8QdNOZlySUESLDhnD+
 wTaaO2cfAgW4DFB/7Yr6dymq2aXvTPe+vJCBNurBtV1BfBE8Sbf+LgdMHni/xd/SBb8H
 IOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wV5YT0kkIRUM85lgbMG4TlRtNuUCjbVc4zflwSIgjEQ=;
 b=JToRZMaTW31R+MNoFDoJPXJsbGQbepxXPhEcERpwKjfM8NsJrJj4Ea8CkU6dkO3FCW
 9Bp/m89Osi3LfjXJ8qSM8RRtFK60DCdncKvJOVFMBW583WivuJbTaX9UEwUHt3Ol2nzB
 mY94xLsTeoOAvThgQjLDkTgIpbw5nK4/pOs1280Ss1a+fRxriW0fprH4EWL2TNVoondj
 voFJ6my5QclWbPjPzVWhfPDeiepq71biDL4lG5SPOomwJoJ6xQfAGu9Vs71FUTgrYWNQ
 i0J6hWROuGdi89ZTuRl+uBJ2KyQoTWgYyPBWZdZwBz/d6tgx088pS7X2iUhd5PNzZsVg
 yPxw==
X-Gm-Message-State: AOAM532Hs/RUmxGhiHc1If05rB/sBXgArfpdZAL9RV1Xo4oEvjuQpGuo
 d9LuOhVeN71kWdDAw0oGGeE/OA==
X-Google-Smtp-Source: ABdhPJxp3Aw5TInaA7lEHN8LSZa82du5deVyNI3VJ9IohD8rhS2TPHDuUFNxi1DW7hiDU2sAEUugjA==
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr5485360wrd.22.1610145791186; 
 Fri, 08 Jan 2021 14:43:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q1sm14849983wrj.8.2021.01.08.14.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:43:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9F6E1FF96;
 Fri,  8 Jan 2021 22:42:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/20] gdbstub: drop gdbserver_cleanup in favour of gdb_exit
Date: Fri,  8 Jan 2021 22:42:44 +0000
Message-Id: <20210108224256.2321-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite it's name it didn't actually clean-up so let us document
gdb_exit() better and use that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214153012.12723-6-alex.bennee@linaro.org>
Message-Id: <20201218112707.28348-8-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 14 +++++++++++---
 gdbstub.c              |  7 -------
 softmmu/runstate.c     |  2 +-
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
index afa553e8fc..bab8476357 100644
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
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 636aab0add..6177693a30 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -775,7 +775,7 @@ void qemu_init_subsystems(void)
 
 void qemu_cleanup(void)
 {
-    gdbserver_cleanup();
+    gdb_exit(0);
 
     /*
      * cleaning up the migration object cancels any existing migration
-- 
2.20.1


