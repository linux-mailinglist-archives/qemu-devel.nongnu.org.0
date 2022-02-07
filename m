Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46404AB6DF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:51:00 +0100 (CET)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzjd-0001SN-En
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:50:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyst-00062D-Lf
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:29 -0500
Received: from [2a00:1450:4864:20::433] (port=34762
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysb-0002GK-FV
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id f17so23173507wrx.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPAmnOsRbcA4UD7ctUqowakXgtnJBAK19odJ2q4fziY=;
 b=Pbhz3QjiaGxQlV/pc+/UVoDHABY76qJuKsZiLQXABesOtdZ/oREIqPkvoZ0TT7dfZ9
 1J1bQKokeIcTlllHHi7v6TyyETHarsJY204a4HnkPbasbwKCXeFPONE+QJt19Vg4OZk8
 IUdNDo57ZwsVZdMtW6JX+H9aCBA8zIxBz8JfyIc20aAlPdSyaIatoG5vLurR1pMaf8b+
 KhJRs513pQfFfRqdkH+2Gufo97Vw1J8s+Agn7kRuK15n0zQrUmK2jlwKqBmRjFJeBjV0
 DfB2JcPSkMS2B/U9UCGr/GRmfG35ECvmpXzTrOJB9Xzx3EuZx/xaBE7GF+EOSPOZDF9u
 NgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MPAmnOsRbcA4UD7ctUqowakXgtnJBAK19odJ2q4fziY=;
 b=um/vpAkvaT8UZYghSs9aFIkSoYKkEA25SUGCDt3xhcEYWw6BjhNWGsiM5/D+nAyb6m
 b/6KHq+AuItGKufF+4yapXlICLTYuSvKrx30lgD10W2nWeUJUTGmxBYOsVfHL12YIO6a
 xrC1pn7C6iCI/8+wTAocS2g4CjEK+ifGAERr138yeablurISOAm4Ddy803aCxJE7CiTd
 6KqejcsJgrJPv++QQczMx3oaEahJ8AZmPQYP5NuEJi6Vp3UlJSc8+sCZRBgvDUoaTpoo
 CnkIasSxHovfDtbHiiMW6FXAU9FyUBAQZwAz4EFfr68hmwp3BICR0a/F4rAGgrhkbHrw
 HQHQ==
X-Gm-Message-State: AOAM533Pu4ADRWin/Yzr/QrAskro9kwwaaj+vdULlA+yGck6wUvkvdgG
 ThcOzPERQutfR7lGsSA0YI8r1Nouhs8=
X-Google-Smtp-Source: ABdhPJxhI374mKKu2e7TPIB0do2dU3fmkcGZRKZ5cEZQNnQbAWzs+3Hz6+WA6Kmrnv6a9q52QBmyMg==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr5410121wrt.70.1644220550601;
 Sun, 06 Feb 2022 23:55:50 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r2sm882763wrt.65.2022.02.06.23.55.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 18/21] exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu()
 target agnostic
Date: Mon,  7 Feb 2022 08:54:23 +0100
Message-Id: <20220207075426.81934-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

gdb_exit() and gdb_set_stop_cpu() prototypes don't have to be
target specific. Remove this limitation to be able to build
softmmu/cpus.c and softmmu/runstate.c once for all targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/gdbstub.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350d..89edf94d28 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -45,17 +45,6 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
  */
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
-void gdb_set_stop_cpu(CPUState *cpu);
-
-/**
- * gdb_exit: exit gdb session, reporting inferior status
- * @code: exit code reported
- *
- * This closes the session and sends a final packet to GDB reporting
- * the exit status of the program. It also cleans up any connections
- * detritus before returning.
- */
-void gdb_exit(int code);
 
 #ifdef CONFIG_USER_ONLY
 /**
@@ -165,7 +154,7 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
 #define ldtul_p(addr) ldl_p(addr)
 #endif
 
-#endif
+#endif /* NEED_CPU_H */
 
 /**
  * gdbserver_start: start the gdb server
@@ -177,6 +166,18 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
  */
 int gdbserver_start(const char *port_or_device);
 
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
+void gdb_set_stop_cpu(CPUState *cpu);
+
 /**
  * gdb_has_xml:
  * This is an ugly hack to cope with both new and old gdb.
-- 
2.34.1


