Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D03D057E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:40:29 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zLg-0003NL-OF
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z97-0003yi-UJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z96-0005nb-B5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so174961wri.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxz2FMJoV1HKgMmvJKUxJuLeAUrERy6ujFTWPPfWTVg=;
 b=zyrSfnUPpT7ShdOHG7mNRVw0GMn65aLdh3NPL93JNs1DC1VzdWx+Bx6ZArgYf0Tykc
 8iJO1qNUWD7oTPcZbYVe6lEJKGXL/AWBK9MdBWt6l3A7KDLQdb89T0bUgq0Zsx7KQbWt
 Zmag/ChMlkfncb0+926quHU1zDgydpSJSAnKGREn1uhnjPg8bFFAx4XoVL5M9QBOfphb
 bweULl/IWe2ECCalNDg0oXrAuL1DrRvLvPncIDB/AyidVdinzO8ijjZCPfRRvgCxI32r
 tEbFOBNbBcjOQdB03cWrIBbLBWBo/XxZOtOhXx+Pjfh4SEMCpk3a7dHDnUxyOOFBW+6q
 k80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxz2FMJoV1HKgMmvJKUxJuLeAUrERy6ujFTWPPfWTVg=;
 b=BFk90ptxGVdFZ14H52xvaVsC4V6bM17rMe/bC2pCHHQ8ozpLl72AEul88AfSdSEtQ1
 gZgaQQxQjRoBCaCs4RwZaIC98n4ptUfhj3EDSy/zeRRyeEfvR5WhHLm+gZSsDwnbS+oL
 yCFkYvtevS6hgI5j9lIzDHIgw1Vp1aFK0t3uxG+/gEGhoQxFmJPc8R15cxHp7hgjAQ7l
 Z5BYEmROeQLX8B+Z+cIBgu/jtzvBl17G9V5KBUBt0gjDCyVAjDRP0PonBGYYe4gaPXQy
 gSMceVAD17agy3PfwVN/uTrnzQqoeFXSmD20DP6QME17qgQmHhIPINtOyfCdsAzWfd12
 BAhA==
X-Gm-Message-State: AOAM533lP2dba4dl48awNkCsZ45hBXGeSl4kUgR2NwmYS+lVAp+1nEmQ
 C4XXaecNlo0Qu3MUnI+rwByqyA==
X-Google-Smtp-Source: ABdhPJyCSmknC6drtoI2BWv3VDldI3PRT2OGCwX/FPFdHtGZx+45xOEvb3FSPdtKCwwBsIDCqdF4Gg==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr39413898wrs.356.1626823646910; 
 Tue, 20 Jul 2021 16:27:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm21077644wmq.33.2021.07.20.16.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F27961FFAC;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 23/29] plugins/cache: Fixed "function decl. is not a
 prototype" warnings
Date: Wed, 21 Jul 2021 00:26:57 +0100
Message-Id: <20210720232703.10650-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714172151.8494-7-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 695fb969dc..066ea6d8ec 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -469,7 +469,7 @@ static int icmp(gconstpointer a, gconstpointer b)
     return insn_a->imisses < insn_b->imisses ? 1 : -1;
 }
 
-static void log_stats()
+static void log_stats(void)
 {
     g_autoptr(GString) rep = g_string_new("");
     g_string_append_printf(rep,
@@ -487,7 +487,7 @@ static void log_stats()
     qemu_plugin_outs(rep->str);
 }
 
-static void log_top_insns()
+static void log_top_insns(void)
 {
     int i;
     GList *curr, *miss_insns;
@@ -536,7 +536,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     g_hash_table_destroy(miss_ht);
 }
 
-static void policy_init()
+static void policy_init(void)
 {
     switch (policy) {
     case LRU:
-- 
2.32.0.264.g75ae10bc75


