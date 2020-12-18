Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6781C2DE205
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:32:35 +0100 (CET)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDzu-0004qF-E5
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDut-000732-Jf
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:23 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDur-00037v-LJ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id d13so1724855wrc.13
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yB8UJ3jgqS4qYz+f00mcHp/m9Q9/LaOQZNMtgdlHZX8=;
 b=URHBHGEgkp9WV6Fb5bnoo1cMm+ZnrCfS8kPWdEEP8B4K62RUTf6zIFkCycgSAHU4DZ
 QrgJsA5vdtMG3DQ5iOicqYNHu9Brzv/pLhsRD+1tUDQ0muouCQoXIaSgt9+Zk1jP/q4i
 pOoSNabaFDOFNFXN43wMXASycDvTTV01DKSEa1y4bkO8jJlRd+sw6cNf5NcIFxNEMa9U
 FnSmTuH1YiWsLSRCc4b1V6ek9p0I3r/naiamUnnbDae7EMpVBu5sJb/6Cf2k7BTqJfX5
 ATXn4JxIj8MKPPWu3LMk0GERphgZ5ZaAjHpid+o4vyS6twvp8SZeZDLFrVxiQF6hsYhq
 P8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yB8UJ3jgqS4qYz+f00mcHp/m9Q9/LaOQZNMtgdlHZX8=;
 b=AqLg/uHenlmSr0gshRtqNR1qcCDp+RWKXnAxTS/NWilcgo3CEz+mleLK/ZpE1AhVTe
 aToi6sG44LlrVl5sIa0chZbYaBMs2MeTpxi/ZQ/iUJBcKsEzYw+DUTo9+w84hsbQZAOE
 YEmsRVl4DY3c6SfRDh0FugY5oDepOZ9VROy/Tpi2/JQC7mLhpQMVvV1YSzALqd9nM8pG
 vSaUNR4pf3IcGwFiwDL7Dl6lQjkHIX6jMq7UbG88CfX1I3FM6hVPZ0ZtxRohmZppYjb9
 Uhcie0hPnCxXP/ZfSxRh63iUXcrNFZ1SdWDBFgqcHVAz90DSUbciY9zV3TzYC+8q1ytO
 nvmg==
X-Gm-Message-State: AOAM533EzP0xbJH7xJZZEYC4M5m1GEQT5hHM+zVLLohtsAIos9eyGEup
 YEbPONzhnqIudLJ0O+yzon0ZOYBu+x9xEA==
X-Google-Smtp-Source: ABdhPJy1mh9Z1uvlU/eDKZazlXNNwoznimOxYhmoIZG7xJkbiOZtEtspjMi2SZiLCjbiW3IEk0Yggg==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr4086919wra.68.1608290840147;
 Fri, 18 Dec 2020 03:27:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a17sm13644300wrs.20.2020.12.18.03.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64C0D1FF93;
 Fri, 18 Dec 2020 11:27:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] gdbstub: drop gdbserver_cleanup in favour of gdb_exit
Date: Fri, 18 Dec 2020 11:27:05 +0000
Message-Id: <20201218112707.28348-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite it's name it didn't actually clean-up so let us document
gdb_exit() better and use that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214153012.12723-6-alex.bennee@linaro.org>
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


