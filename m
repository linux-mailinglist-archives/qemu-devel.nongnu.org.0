Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C93155F2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:31:42 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XnY-00061i-Mr
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk2-0002x8-DO
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk0-0007oy-RQ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id q8so883020wru.13
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTJA1LO8Z0+7BgtkAor7hGRdE1VoRrWN9y3S3XEnRWI=;
 b=fFwbh0XWSo/LK+qGFnzqeQf5yzBNoJpZONNhqzYAqz+UbOSHkNr6Ze5YUIdlaQcTp0
 76ZMOG/izSrJwxV/ciJW10qopNJ/hEUBjNcaUnTyuaieJfXp1oB0xifvgbKgZwG5esfE
 ms9YmUrR97b4dqoBogTUGAWVwA+fBluZ4hLPF1d61fazpBwnDSJDxjusLYbYrICyJ8uD
 ZtMLG8/TNnNIt0NFiSlU4CdcfbNfbHeUpTWRVjmW7gs9U2jMNlFp079I5+toWQ+08s0r
 2btou0vXOH85pOh6KJ2awaJtH9hnWyq+jMFf8GtGkp2GyM4YaIIhmDzP+TQS24rIbTmB
 eQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTJA1LO8Z0+7BgtkAor7hGRdE1VoRrWN9y3S3XEnRWI=;
 b=RXl8ngEW6RzCG1oBRoyzGgu72AQy5zQq4tp5VqV0H5TmwPGVb0tNWZvVYRIXyxA04h
 1fCiwKHSTcUcMVIPsBeRkwYbdr4BuXVf/6JwioDqcZF9izlPvQYD01nxa6NMNw4CNacB
 aIZ7il23pNYuwqp5SNmCSJfD6ZYVkILjjtO1vwfJxqFhSH44p15H6R7DnX83BtYOhiCV
 OWX1beJCGuqaXtnBF/YOaAEDa926JwIBl2SPUfABOFCig2pM6wWXvDshgEVN1qBwW0zr
 1ORR53KQBGREmWCj/W16HVf13QtX6o/NY5dn61idiXkbXThmq9AFwgwrpLPdHX1aXPHp
 lAUw==
X-Gm-Message-State: AOAM533TnxBstba9IEgt7aY+74L3+ZeZIL+G5NZYR4LwvQUla8dKHTvW
 EFpTpA+pXaL3Ex5fBhPqRcsAxw==
X-Google-Smtp-Source: ABdhPJwoW104d4pX4pMpks0FHsXWM3y6jJD1eEbffAPUpht7qmCHP/WJq3AYXm3DyOzjj+/UHajxUA==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr5882598wrm.289.1612895279586; 
 Tue, 09 Feb 2021 10:27:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 67sm6088550wmz.46.2021.02.09.10.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 732FE1FF91;
 Tue,  9 Feb 2021 18:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/12] tests/plugin: expand insn test to detect duplicate
 instructions
Date: Tue,  9 Feb 2021 18:27:41 +0000
Message-Id: <20210209182749.31323-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 robhenry@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A duplicate insn is one that is appears to be executed twice in a row.
This is currently possible due to -icount and cpu_io_recompile()
causing a re-translation of a block. On it's own this won't trigger
any tests though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
[AJB: well not quite, the x86_64 test trips over this due to some
weirdness in the way we handle rep insns, e.g. rep movsb (%esi),
%es:(%edi) in the x86 bios code]
---
 tests/plugin/insn.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index a9a6e41237..c253980ec8 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -21,6 +21,14 @@ static bool do_inline;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
+    static uint64_t last_pc;
+    uint64_t this_pc = GPOINTER_TO_UINT(udata);
+    if (this_pc == last_pc) {
+        g_autofree gchar *out = g_strdup_printf("detected repeat execution @ 0x%"
+                                                PRIx64 "\n", this_pc);
+        qemu_plugin_outs(out);
+    }
+    last_pc = this_pc;
     insn_count++;
 }
 
@@ -36,8 +44,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             qemu_plugin_register_vcpu_insn_exec_inline(
                 insn, QEMU_PLUGIN_INLINE_ADD_U64, &insn_count, 1);
         } else {
+            uint64_t vaddr = qemu_plugin_insn_vaddr(insn);
             qemu_plugin_register_vcpu_insn_exec_cb(
-                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, NULL);
+                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS,
+                GUINT_TO_POINTER(vaddr));
         }
     }
 }
-- 
2.20.1


