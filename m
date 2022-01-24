Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173A499379
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:36:15 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC64U-0001Cl-Ox
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lO-0006dW-LV
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:31 -0500
Received: from [2a00:1450:4864:20::52e] (port=33766
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lM-0003Ff-NA
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:30 -0500
Received: by mail-ed1-x52e.google.com with SMTP id b13so58843275edn.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kJKIshDyTcI5rF9NKk0EBn42A9+Ktxo8GSgpgvEDuI=;
 b=fT5KashhR2NPyO6ZThoHPIdf9qjj5f9ZGl22z8PGtq10sVLrRN07AfByZL0Yfcr92w
 kOeUQEn3C+o5x05kE9iVyDiJhcMY+Ejl4vD84a6N8bAvoo+n44CayZouw/EsIPNJuRgv
 iHXEb+5olWXO321aOoI5MkCBQ1AzmFC7l9f+KODuq0GGh6lK+VyMCRoZXHhaxSgu/HUg
 uG7PZQ72tK2MJwbz3OQQbh+VH6GW85k1ju/L1EkAveK5WJkQS0wj5AMmwFvTPqkGNzlL
 0DtpTYD2h1IKXNGDs2hozoLznjC1C+DfprdoPNk8ECmmqwxhzH8tJH+Q6YSJiJDgRcQQ
 ZM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kJKIshDyTcI5rF9NKk0EBn42A9+Ktxo8GSgpgvEDuI=;
 b=Y/sjsFqq7Q1nWagNblMpthJ7sLXRiTJfVz+nmbkS1O6er9PF8JHQnVe8nT7LYju788
 0byVfPRKK9HT9qGf/VGnM2dHP8PDY0v9c0IvHeopHmMdr/87aDK1GfRsWlJQN6NsL3yV
 9ut428jgM6/If+V/3SvDOT9TSgZCYRaEN/hIlGik36pAsQeM3PK69e5PF/Qgicpm7PCZ
 IpigUygBMq5Ybd110wv+LzTSVchDkgKd36JO/fiOxPxltHXwQiY4Nn/cAdj7KZMw1f28
 aaxeP5NuTeElbtls1j/v1vzGOmvF/h+qEwgtI6U2EWr7cjzSTcgselKZjSFLVnoW6nqq
 umzw==
X-Gm-Message-State: AOAM5300VnDgSU0PoN8+lmp2fobvcvj0iTikZ2PhICQ0jXjRiol9kOck
 aXmGM4aII3wXqHcJ5G6769Qc5A==
X-Google-Smtp-Source: ABdhPJxMuv3LVq/HcucWOBqQarYYXRtsTc6Cf1O6cCdUFZ6u8ZR1xmrw8CivcRk8/DCJ5cQD9HmRZA==
X-Received: by 2002:a05:6402:13c6:: with SMTP id
 a6mr17349902edx.222.1643055386811; 
 Mon, 24 Jan 2022 12:16:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i12sm4929026ejy.43.2022.01.24.12.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB5011FFC4;
 Mon, 24 Jan 2022 20:16:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 12/22] plugins: stxp test case from Aaron (!upstream)
Date: Mon, 24 Jan 2022 20:15:58 +0000
Message-Id: <20220124201608.604599-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>

---
[AJB] this was for testing, I think you can show the same stuff with
the much more complete execlog now.
---
 contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
 contrib/plugins/Makefile          |  1 +
 tests/tcg/aarch64/Makefile.target |  3 ++
 4 files changed, 82 insertions(+)
 create mode 100644 contrib/plugins/stxp-plugin.c
 create mode 100644 tests/tcg/aarch64/stxp.c

diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin.c
new file mode 100644
index 0000000000..432cf8c1ed
--- /dev/null
+++ b/contrib/plugins/stxp-plugin.c
@@ -0,0 +1,50 @@
+#include <stdio.h>
+#include <stdarg.h>
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+void qemu_logf(const char *str, ...)
+{
+    char message[1024];
+    va_list args;
+    va_start(args, str);
+    vsnprintf(message, 1023, str, args);
+
+    qemu_plugin_outs(message);
+
+    va_end(args);
+}
+
+void before_insn_cb(unsigned int cpu_index, void *udata)
+{
+    uint64_t pc = (uint64_t)udata;
+    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
+}
+
+static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)
+{
+    uint64_t pc = (uint64_t)udata;
+    qemu_logf("PC 0x%" PRIx64 " accessed memory at 0x%" PRIx64 "\n", pc, va);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n = qemu_plugin_tb_n_insns(tb);
+
+    for (size_t i = 0; i < n; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        uint64_t pc = qemu_plugin_insn_vaddr(insn);
+
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, QEMU_PLUGIN_CB_R_REGS, (void *)pc);
+        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
+    }
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    return 0;
+}
diff --git a/tests/tcg/aarch64/stxp.c b/tests/tcg/aarch64/stxp.c
new file mode 100644
index 0000000000..fb8ef6a46d
--- /dev/null
+++ b/tests/tcg/aarch64/stxp.c
@@ -0,0 +1,28 @@
+
+
+void stxp_issue_demo(void *arr)
+{
+    asm(".align 8\n\t"
+        "    mov x0, %[in]\n\t"
+        "    mov x18, 0x1000\n\t"
+        "    mov x2, 0x0\n\t"
+        "    mov x3, 0x0\n\t"
+        "loop:\n\t"
+        "    prfm  pstl1strm, [x0]\n\t"
+        "    ldxp  x16, x17, [x0]\n\t"
+        "    stxp  w16, x2, x3, [x0]\n\t"
+        "\n\t"
+        "    subs x18, x18, 1\n\t"
+        "    beq done\n\t"
+        "    b loop\n\t"
+        "done:\n\t"
+        : /* none out */
+        : [in] "r" (arr) /* in */
+        : "x0", "x2", "x3", "x16", "x17", "x18"); /* clobbers */
+}
+
+int main()
+{
+    char arr[16];
+    stxp_issue_demo(&arr);
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 54ac5ccd9f..576ed5875a 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -20,6 +20,7 @@ NAMES += howvec
 NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
+NAMES += stxp-plugin
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..54b2e90d00 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -72,4 +72,7 @@ endif
 
 endif
 
+# Load/Store exclusive test
+AARCH64_TESTS += stxp
+
 TESTS += $(AARCH64_TESTS)
-- 
2.30.2


