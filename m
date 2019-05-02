Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0F11477
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 09:46:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6QJ-0002sO-AC
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 03:46:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6B2-0005rt-Ht
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6Ay-0004b2-K2
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:30:42 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39151)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM6Ap-0000pG-Cr
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:30:36 -0400
Received: by mail-wr1-x441.google.com with SMTP id a9so1794753wrp.6
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J6AQ6ezpQ7lzWuL7dF/ov14egOgbuG1nkSc0nfJNR5A=;
	b=onkV/oMYuUx9EPWQh14cvasyM5TasZjH0us5VPZKdOVq2HCX/LVSZqL0buFOTgnIBg
	12qFcWg9YlO3A5FlpwZkSAC/b8WgvsahWw7yi0YzhukSCQLvusDtCOPLOB/WEkYw/g/5
	m2CFvAK0/DZkMHjHQtKLm+t/jZ9r9ctFcMVXMItMw1qCQwA7hluTy9Y6msm2W80RlOxc
	2rLcW4t4mKYBcb7shNIaeQRteKTXM4v/5tSv3S6X9SVCEaA1nAR3uyLX7u7qdwriawf2
	x07XPHhW9m/aDk7x8mWqIDFHHamzc+jblqWBwKzIQE24M83VkrJSE8/gdr37mEDotQxZ
	RyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J6AQ6ezpQ7lzWuL7dF/ov14egOgbuG1nkSc0nfJNR5A=;
	b=c3byWmR7czUqrZk0BOiawheQdvljAjfF9DPbwJd0c2NJFTTQLN27PFZJlXcXnlPSpB
	xJJI9t/AiDl169Ku95s0Eb2SNTK/tBK3X1/ik91zdbWtaRVxv+JkdyDZ8laQ28QB1qTP
	WqmHDdhLnTZzOcUnS1tfaQSHpS4jWdnOqnnQmmxhkLcY3WndNCGbDLHNBUhjnB6ApDQv
	HBv/a4Wiu89FtmhfdSvWkRrjKr/p5so/WSI2XP9M5nT2NQaiqclWDZzGCdGbY+QdPWi3
	RcE3IgFo8hKz0Ky8CM/lTB5OcgqqkzXIlVRAePBfYsGaiE5stToYZxbluL+X1OUMrp/E
	HIWw==
X-Gm-Message-State: APjAAAWz/YevAxcukatHqrRN/+SmPC1nhBvtbA7QmXmTh2wGIU+jJPaP
	q0Je09/bYgeiFYKD+48KcBl+zPZO
X-Google-Smtp-Source: APXvYqxtKPze9H7ztAXdhsvCr0awYsAyA5abtl1chlljGYhc1b4NEEUZdatzv//jQ8WQDDfjQpdB7Q==
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr1633429wrv.224.1556782058331; 
	Thu, 02 May 2019 00:27:38 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id z5sm8769289wre.70.2019.05.02.00.27.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 00:27:37 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:26:40 +0300
Message-Id: <20190502072641.4667-27-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502072641.4667-1-arilou@gmail.com>
References: <20190502072641.4667-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v8 26/27] gdbstub: Add support to read a MSR
 for KVM target
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: liran.alon@oracle.com, alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdb> maint packet qqemu.kvm.Rdmsr:MsrIndex

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 gdbstub.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index bceceeec57..d5cdda190a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2141,7 +2141,14 @@ static void handle_query_attached(GdbCmdContext *gdb_ctx, void *user_ctx)
 
 static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    put_packet(gdb_ctx->s, "sstepbits;sstep;PhyMemMode");
+    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf),
+             "sstepbits;sstep;PhyMemMode");
+
+    if (kvm_enabled()) {
+        pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";kvm.Rdmsr");
+    }
+
+    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
 }
 
 static void handle_query_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx,
@@ -2166,6 +2173,29 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, "OK");
 }
 
+static void handle_query_kvm_read_msr(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    uint64_t msr_val;
+
+    if (!kvm_enabled()) {
+        return;
+    }
+
+    if (!gdb_ctx->num_params) {
+        put_packet(gdb_ctx->s, "E22");
+        return;
+    }
+
+    if (kvm_arch_read_msr(gdbserver_state->c_cpu, gdb_ctx->params[0].val_ul,
+                          &msr_val)) {
+        put_packet(gdb_ctx->s, "E00");
+        return;
+    }
+
+    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "0x%" PRIx64, msr_val);
+    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+}
+
 static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
@@ -2250,6 +2280,12 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
         .handler = handle_query_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode",
     },
+    {
+        .handler = handle_query_kvm_read_msr,
+        .cmd = "qemu.kvm.Rdmsr:",
+        .cmd_startswith = 1,
+        .schema = "l0"
+    },
 };
 
 static GdbCmdParseEntry gdb_gen_set_table[] = {
-- 
2.20.1


