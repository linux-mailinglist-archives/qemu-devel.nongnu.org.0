Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB7E4A8D0C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:14:07 +0100 (CET)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiUY-0002eQ-Hx
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:14:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhf3-00035N-GN
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:13 -0500
Received: from [2607:f8b0:4864:20::62e] (port=45773
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhf1-0002dO-Cn
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:52 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s6so3003285plg.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4B30BDBN8zTHKXNizOw6js0bo6ETgyInEfiIbfWw7I=;
 b=fFrbpDgtK1wE3hmCkgvzm9XHpb6Bu4N+IbySkeMzgN4rJwaPl07hglNPDCfVp6F7NE
 JvO4buvLqyB9twW3EtTQsVNxovSM2/bVVEHnEbMyM8xm65ZF2w0q6JTgOr4mp9ucH17B
 nInWgaEr2HxhpJeAv6KcFxTU9UAthOxZ6EDbSjO+eCZVnz7C4KHyWQ3dDzEXABtDlPJj
 lEhOFa2kBW3sJjd+sTt4/m8JZc99oZ28MUuA541W3rpfH+OfagAtm6/Idh1nYUM8CtP6
 iTrOM12d3kgYMY0EyWqnHBItfP2Eyydg9+ML9wX9KzKcrzmxXrUpkA+iXRIFTHSxqzkJ
 XF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z4B30BDBN8zTHKXNizOw6js0bo6ETgyInEfiIbfWw7I=;
 b=WHWTCR64UNTRA8af0t72A91NeJH2OgO/7hloIP5Ns7oeHLphZBoevA3EL06wW8d29u
 DcMEcg+s3JAOpcPvg0VOLg1yRbWWsTsVkvhJp+srj0QgzZIFImDlcaxskp1RQmgvOwYz
 ZtWUPclqeiBufU8lIamIFXw6MrQxh5Xa7ymJv3vGQba1PIXXe3sPDCPO19kKCet+wya+
 Z8T7USn4geZgGgGj76wcTn6Wlwc/OGRI3M+PRJrdYCRBkrfNYP+wwV0x8C7Avue/oDy7
 tK3crTs7MasJtl7ZQp5TyeGPj7S0EiG4qcdpZUYPzyTO/SgIFstRhwCKWPseigIUO1ia
 q/oA==
X-Gm-Message-State: AOAM532ELbGcSyeV+LzwkqkEsQdEEwE4/tqTBmeJG95WNizojrrqn3LH
 RCTRFEO/MxE2oIeyRloZTRKmWCJ7fCs=
X-Google-Smtp-Source: ABdhPJztIP6+ZZyp8t1n112S+GIvMfXfocbDsXOyC/CdlfPUjOnsgXk3SR+lyuwpPAwbv/sV1yP7rA==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr36185352plr.65.1643916043144; 
 Thu, 03 Feb 2022 11:20:43 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j18sm31340481pfj.13.2022.02.03.11.20.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:42 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 18/21] exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu()
 target agnostic
Date: Thu,  3 Feb 2022 20:18:11 +0100
Message-Id: <20220203191814.45023-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/gdbstub.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350d..84b1f2ff2a 100644
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


