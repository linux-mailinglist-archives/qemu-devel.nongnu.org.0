Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DA3B4037
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:21:33 +0200 (CEST)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwi1k-00052p-RB
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhub-0000kk-A4
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuZ-0002zo-B8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7986704wmh.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuaYXTg4/dBgDQ4lrFjh3sy+LtieNejFb8VKCFi7jGg=;
 b=mPL6TbPdmvFgWghaFtK9AcxZMQ0AL9+CkOnMm48yikiwBklmZ7ZMZ1fsPWo/MX3JjJ
 l98aHWw+CSaPUpXwEJAO133Igvk82ZQhGPUs4bWaIZFcLlTquNhskwHbosndWze7NEF6
 JNeiTBAD6yo5q/aXHsTieCb5xgBP8yUMWOhlwOWdNVgyqEo6okotV8EFCA+7SP5txJYR
 rhSQCMXXqYm5B6BIiia0oq7aRRBnd1Abe89XDibeAiT6g9jtBV2Kj9IQC5xvyO9nnGs9
 1I64zvU8ESCwBJkqWYUsiEb03rJRsgv7NRUEfuWOanFzVUW0EC7ELOmNZuunPvzbtwff
 VT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuaYXTg4/dBgDQ4lrFjh3sy+LtieNejFb8VKCFi7jGg=;
 b=bEbC9CpfZI4ZBrSdhoMjoSBlh9BLPn95jiWqRjC8NhjW2p/v0nCt2ZHGRBZj3tcR2G
 6Pw+YymJAQQ8pi3pJKr67GxSy+DtvIDNuuDIBLISSlZfNMrzFGwKy4KL7HJb9gskDSmH
 nKhRdunkeu2+y9+NxeEyOalAptAq/1Wn1k+RwKyJ2t8leqFUMHW6Gpja++/VWLQHB9BD
 vha/8k+nl88QUNtTel95oQcD0rXfUEHf9cQty5ycjiLn6+VVsThLldTF1EDWparuaiG8
 aSj5cCvL1dB9J8HE/EXxV/qY0sEL4xVWYok6XrBl4RVinraIBatvZC269rRVun/0K1I0
 mZ0g==
X-Gm-Message-State: AOAM533DqdG+zHU/EDhdDZKnjT9jg/1wbP4L7Ut4ldeGhBb9pHNtztx8
 hJ7UFptmzzB41SBLgDgIOQ1FsDDVfX9VsQ==
X-Google-Smtp-Source: ABdhPJxfrdEcmSLWQMxKojyCtS0D7cuwgKikvBOC9be20y0bzhkjsOHKO7jqaUKyeuc75BkzxMJnVw==
X-Received: by 2002:a1c:4682:: with SMTP id t124mr9231718wma.94.1624612445917; 
 Fri, 25 Jun 2021 02:14:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m67sm11273088wmm.17.2021.06.25.02.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:14:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 143601FF93;
 Fri, 25 Jun 2021 10:13:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 7/7] plugins/api: expose symbol lookup to plugins
Date: Fri, 25 Jun 2021 10:13:55 +0100
Message-Id: <20210625091355.25673-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a quality of life helper for plugins so they don't need to
re-implement symbol lookup when dumping an address. The strings are
constant so don't need to be duplicated. One minor tweak is to return
NULL instead of a zero length string to show lookup failed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210608040532.56449-2-ma.mandourr@gmail.com>
Message-Id: <20210623102749.25686-8-alex.bennee@linaro.org>

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


