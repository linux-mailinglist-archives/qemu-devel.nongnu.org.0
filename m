Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE82F7D69
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:58:45 +0100 (CET)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pci-0006au-Oy
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEP-0000yN-Pb
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEN-00082O-O0
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 91so9308509wrj.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldh2RZcPciHS3IeZWtBzIRmDunW2E0Q1bR4gP7fB6wc=;
 b=HQ5GQ56V0smLxmh1tMc0TTB84e5CDmglMxtqYn3kiighh5X7S2ZI7FAviLWfwd+9WB
 BPgK2VYqA/xfxiJRvRRP1i0vXkIEONsUXRPYyXtwqoYNI1QXDUsHxzV4Q1OkiDsKHC3K
 Kc9ov0iwx/a1bNDsotUF+wb0pZWNrv9e0c6IBclUUqHCKBjxz+LPncZhYbh7dvm0LWa8
 w9mYL03P4+sYIZlHhwA8MIKbs1Ejc0pmTUrYMU/CcVBnFkR9zWY+OMq+pLODkxY2+Pgo
 RdrK0E+Dy1UbYx7ZMpm8K3SYlWSGlhgQ5Ga+scn5acvzrIfU8ykDZUeEkyEpT8QgElly
 jkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldh2RZcPciHS3IeZWtBzIRmDunW2E0Q1bR4gP7fB6wc=;
 b=LLwQY0XbIO47WX7ib6MS2pSUwmX+ZG4rbi5DMsZlDneM5w3LMz2Z3EqgwH4OXQ7Oqq
 +MKIHApIGlZUm/pd76LwgJkYV2GmqbGykti/PBhwKPCV3tjB0rmO553sYiErvJnD9hEq
 zwnM7fDaXIN+HvGYJ7b2sVAr82la4YyQJcbcL337zSKNSlJFbWDm00NtBRyFDMqM/zpz
 LbBGT20jn5+9neX28WkUZ8kQqh0O+dtMj8loxBQRDFx3BLw0tA7SeTrHkZFSCQ2fFQTu
 mL7paDl493IdvxMRkYFBH4F4ouh8wH5xdlMeKPtR6Jek+fXeBWnX/vzJuyiBogNT0yx1
 VhHQ==
X-Gm-Message-State: AOAM533KSI61zyHbOmQCJ6as8205mYIKTo07P8wQnbWZBaVXvOjSJXBq
 aE4QkNrcTPhbPSDodZy601pqfA==
X-Google-Smtp-Source: ABdhPJyhOP0LnDCj2aMzpSNJF0Va5rPxpFdfCve64YMZG6/+Rr2Wt8OMOLKNUWa+hDoZGltca5vtEw==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr13382075wru.291.1610717614171; 
 Fri, 15 Jan 2021 05:33:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm16528611wrb.92.2021.01.15.05.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD2001FFA6;
 Fri, 15 Jan 2021 13:08:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/30] gdbstub: drop gdbserver_cleanup in favour of gdb_exit
Date: Fri, 15 Jan 2021 13:08:17 +0000
Message-Id: <20210115130828.23968-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite it's name it didn't actually clean-up so let us document
gdb_exit() better and use that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210108224256.2321-9-alex.bennee@linaro.org>

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


