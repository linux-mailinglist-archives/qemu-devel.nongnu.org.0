Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A13B182D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:37:18 +0200 (CEST)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Fx-0007U5-Ry
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw0Dz-0004yB-Md
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:35:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw0Dx-0005wc-5g
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:35:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id i94so2068830wri.4
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Csq3L73UZfDLRhp+50fvannHlui5uKUq6fhdlJrVjY=;
 b=HCpNtft9zPqrED1fFB0ToTHOqNcWI9rTNtctgcjnMGo6rnJN6H+JBkoYL59V/2p+9g
 fBHEQfLUj3gLksSZ+7+8szyMWr7a6UtYGGivUl0byslB3KleXek717wQ3TdDtOISKok3
 pR9GI5oQUgsFZ6QF0FTL5BbAhzGkIu/iZQiz02osIboIZ7WSJUErTywMFDbguo6JoI6d
 cOjhfwmgZVJ1b6QVHdavQ/6HqDdnSRaKVG24b+LUM2rSWDwskCqOhUKtqF8RpLAtymfd
 aRivyBzVKAqHgKcEf9eFlMYUcQvorkQBAA2owffiTUztTOgu6/KOJe/Qf8yjjsnRjgRr
 SiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Csq3L73UZfDLRhp+50fvannHlui5uKUq6fhdlJrVjY=;
 b=cRmIaOvGbPGdQMWOOOesEyGG3hljN8RxqbCob+8qe3PRxKvJgNUgUdfNzRirPlMxlB
 NhD3Phgh9T+8CgYEJofECurkoh6jG9QtHRDHdRn/6zdJx0jfMzwM6Qmi95JUtMUdkNSQ
 7UmlkxHFMXsBDKQ2VD0l67GURnfYsC7VJckZ0FheNIk0Y7c/z1OUWA9sv0nctzka62Me
 Fyhd0ls/vsDmov59WeQ67vnOe/r6EcR0QUYMP+d1Br4x0LxkE9GgpB+fr9QOd5JFjnF/
 xS0gZOrPACdySUZnoW9ms7ZHCD3harUqPtQwWHRRJ4sjpAbmB07yYCGthZqq2vUMaNyS
 wcsw==
X-Gm-Message-State: AOAM530ETRfx+7xtbwLehNIKp//kTaz8rALCWmvI/eu1GJoU68hQAx1S
 TvXp7Wdq9v7gSKIdGXYMOKaLVI6ZcsYQ8g==
X-Google-Smtp-Source: ABdhPJyYfbIrmDQLmENLOB1F3mbvxT3A4Jp+AYI0HNkI6Nu26ZBK6ge6dPuyWYhroQxwx972IrSOAA==
X-Received: by 2002:adf:f088:: with SMTP id n8mr10584374wro.227.1624444511857; 
 Wed, 23 Jun 2021 03:35:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n18sm5492764wmq.41.2021.06.23.03.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:35:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 557771FF93;
 Wed, 23 Jun 2021 11:27:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 7/8] plugins/api: expose symbol lookup to plugins
Date: Wed, 23 Jun 2021 11:27:48 +0100
Message-Id: <20210623102749.25686-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a quality of life helper for plugins so they don't need to
re-implement symbol lookup when dumping an address. The strings are
constant so don't need to be duplicated. One minor tweak is to return
NULL instead of a zero length string to show lookup failed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210601145824.3849-1-alex.bennee@linaro.org>
Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210608040532.56449-2-ma.mandourr@gmail.com>
---
 include/qemu/qemu-plugin.h | 9 +++++++++
 plugins/api.c              | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 97cdfd7761..dc3496f36c 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -525,6 +525,15 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
 
 char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_symbol() - best effort symbol lookup
+ * @insn: instruction reference
+ *
+ * Return a static string referring to the symbol. This is dependent
+ * on the binary QEMU is running having provided a symbol table.
+ */
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
+
 /**
  * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
  * @id: plugin ID
diff --git a/plugins/api.c b/plugins/api.c
index 817c9b6b69..332e2c60e2 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
     return plugin_disas(cpu, insn->vaddr, insn->data->len);
 }
 
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
+{
+    const char *sym = lookup_symbol(insn->vaddr);
+    return sym[0] != 0 ? sym : NULL;
+}
+
 /*
  * The memory queries allow the plugin to query information about a
  * memory access.
-- 
2.20.1


