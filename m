Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA56284B6D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 14:12:08 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPlp9-00055V-2g
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 08:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPln7-0003JJ-PU
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:10:01 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPln6-0004DX-3U
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:10:01 -0400
Received: by mail-pl1-x641.google.com with SMTP id o9so1118920plx.10
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oA6lwA9DRk6v/CqH7e4pibYzUGFI9UFOt7RD8ATdFPQ=;
 b=mDptSu/TJAdlaMSV4SNo6oO7zBvbrg9VaD+Lp4itrNOG4kSwyhdP1gkThzcy6gsgIx
 mlgnFY5C05NbZj3A9rENKLr9agYiCETEGtbWILmNGKUKOnM2uUAPZsVtkCSBRo0n2t19
 GHHmjwVIkdptlO94nriY6w6vpGcGjcuLiiEDj9BpMYSG3Uc5YH7ojAcWlCevFmmSr0IX
 HP3RkFKM9K9dhQhEGB5hy+uDOMaq0vLY5YxhVUiZ2hltSe34uGdVEF8osrJ8C1kw9uQn
 nSkQY/F7abB0UksjP1Bo6HFQjwqARy9CRZjfbraKMAKBZyAT0xr4oO3o3dyZPFzcg6bB
 2BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oA6lwA9DRk6v/CqH7e4pibYzUGFI9UFOt7RD8ATdFPQ=;
 b=ITexIU1U7Ku0NWWbERhVFZAO/sdmmhdtxLyLalnTotdGKbBYF11SjHpe3+L5xTNwNM
 4w+zZGZLBr8TUnwmKfY8J2alXFIe5mJJSG9dVdQJhG6CK/BxpiZ9FQnhWB1uYjtHlCtl
 EHSsss4nBlQdosJ28PBOb/hU22aEM5TBvbyTUE1idWtHfcAZIR7DdJ/HKOSXuRIZvrut
 QPTZI9lBtS8kDVFvVcMWoTl2U+UxkBlFehpVorsgWDGmxxEzfN0zJp3SwNjzt4YGDnu5
 4nddeh7iNPhWJl85ebVbPt9a0J1s4QUViK7rwZPHaVJVo/8OzycGHj4x1WNluxNEoeE6
 cROQ==
X-Gm-Message-State: AOAM533h8gjLJqmEvU6RyZfT02UGEIhV+EaFUEEgkRcKpANsKsr4M2MY
 eI5wQ3DNE4j/2vgCU5AJ0uiVdes5vzCk2Q==
X-Google-Smtp-Source: ABdhPJyD9ujyUCXnBno29fF1GG6x0UMJ5ZgVq7ozFDQdePY9E0BTIbjngJNSk+5nI4sj/rhMdpIv2Q==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr3493516pjv.144.1601986198006; 
 Tue, 06 Oct 2020 05:09:58 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id f4sm2965681pgk.19.2020.10.06.05.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 05:09:57 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] plugin: Fixes compiling errors on msys2/mingw
Date: Tue,  6 Oct 2020 20:08:55 +0800
Message-Id: <20201006120900.1579-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201006120900.1579-1-luoyonggang@gmail.com>
References: <20201006120900.1579-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/hotblocks.c | 2 +-
 tests/plugin/bb.c           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 3942a2ca54..37435a3fc7 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -102,7 +102,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     ExecCount *cnt;
     uint64_t pc = qemu_plugin_tb_vaddr(tb);
-    unsigned long insns = qemu_plugin_tb_n_insns(tb);
+    size_t insns = qemu_plugin_tb_n_insns(tb);
     uint64_t hash = pc ^ insns;
 
     g_mutex_lock(&lock);
diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index e4cc7fdd6e..de09bdde4e 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -72,7 +72,7 @@ static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
     CPUCount *count = max_cpus ?
         g_ptr_array_index(counts, cpu_index) : &inline_count;
 
-    unsigned long n_insns = (unsigned long)udata;
+    uintptr_t n_insns = (uintptr_t)udata;
     g_mutex_lock(&count->lock);
     count->insn_count += n_insns;
     count->bb_count++;
@@ -81,7 +81,7 @@ static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
-    unsigned long n_insns = qemu_plugin_tb_n_insns(tb);
+    size_t n_insns = qemu_plugin_tb_n_insns(tb);
 
     if (do_inline) {
         qemu_plugin_register_vcpu_tb_exec_inline(tb, QEMU_PLUGIN_INLINE_ADD_U64,
-- 
2.28.0.windows.1


