Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE423FFCC6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:10:48 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Dj-0006Os-3s
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM572-00064n-Kn
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM570-0005a1-Vc
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so3114097wmq.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omwD0CvH7QKtlKqaBp+2tXe6lKOc5AVhGBgb958NX84=;
 b=W30RGIQAW/jU/eKsCxBjChQK1S3oSIjb/C3v7WuLB24zHMxxr2bGYOfyXa2ONa7UkQ
 mPPeEfb0TaQRoJBFtpEsFNe/NgEoG58/DPmveKjbCLRwdWti+pwD7UoKMwpSgMwXYCI7
 8NtFPETKLswrH3a0WXEOnqk4c4ebp/TNUWqQGmRzaIf2XgbCVauHSIaun4z/AeKY9iSR
 38eb/lnZWLiLaNnDEfOFWR6CPMuxL8tymJA3+ARf45ERoTa8ybYdqGPABYAp2y7mUmq9
 1uJwAepWM7hGkzxT36KmVxUTQdCg0lA4kJVGFHVsxwa8zJGIFmwUcc92MNkrls2z4NU7
 eJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omwD0CvH7QKtlKqaBp+2tXe6lKOc5AVhGBgb958NX84=;
 b=E7G1khVzd1VhchA4hlA8GMXZtbOsoF2ar27h0CJU0lajBVGefiVfBxfoiLrNojj+sZ
 BDpmxLv/5eupdRLMFFwCqs2k24PBkfgPjKOuoX2EYtFcTSZR3i0exYTZrcRO35WFFUor
 TG4EDUBOgC5pv2o2BoAXNgoJq05hPfWm5vq5jnmYqodaAAaeRqkiaKtBWOcq3RqGqCht
 oN3dILDl4IA05ZAPqzqPd4pzatKbyq090jkH70PHTLTbxNu8A+EozmU9ZnUYi1RiFQZ6
 2gclEQbtO+qZatgU5IswFI5NZBP0hKov1yLPif7KeR8u11XfQTw14Rcf7cWbogAtD61d
 PwGw==
X-Gm-Message-State: AOAM530Id47wAliN1WnseMCtqhTrZgNQtepLL0l6Ayfu1K3XkK8QBxS8
 xXGpgG09gHqw1BILMBY89PbgPa69owZGpA==
X-Google-Smtp-Source: ABdhPJwQhIf44Bf1fScHor1m96Il/AJGfxQF/pB6Puo/c0CZVQkCczX9iR4GRsyr5uQRg/SDgnqtlg==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr7287927wmq.24.1630659829707; 
 Fri, 03 Sep 2021 02:03:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g143sm3789723wme.16.2021.09.03.02.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0F531FFA9;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/22] plugins/hotpages: introduce sortby arg and parsed bool
 args correctly
Date: Fri,  3 Sep 2021 10:03:28 +0100
Message-Id: <20210903090339.1074887-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Since plugin arguments now expect boolean arguments, a plugin argument
name "sortby" now expects a value of "read", "write", or "address".

"io" arg is now expected to be passed as a full-form boolean parameter,
i.e. "io=on|true|yes|off|false|no"

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-4-ma.mandourr@gmail.com>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 2d29a8972b..aa75b390b1 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -193,6 +193,21 @@ Similar to hotblocks but this time tracks memory accesses::
   0x0000000048b000, 0x0001, 130594, 0x0001, 355
   0x0000000048a000, 0x0001, 1826, 0x0001, 11
 
+The hotpages plugin can be configured using the following arguments:
+
+  * sortby=reads|writes|address
+
+  Log the data sorted by either the number of reads, the number of writes, or
+  memory address. (Default: entries are sorted by the sum of reads and writes)
+
+  * io=on
+
+  Track IO addresses. Only relevant to full system emulation. (Default: off)
+
+  * pagesize=N
+
+  The page size used. (Default: N = 4096)
+
 - contrib/plugins/howvec.c
 
 This is an instruction classifier so can be used to count different
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index bf53267532..0d12910af6 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -169,16 +169,26 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "reads") == 0) {
-            sort_by = SORT_R;
-        } else if (g_strcmp0(opt, "writes") == 0) {
-            sort_by = SORT_W;
-        } else if (g_strcmp0(opt, "address") == 0) {
-            sort_by = SORT_A;
-        } else if (g_strcmp0(opt, "io") == 0) {
-            track_io = true;
-        } else if (g_str_has_prefix(opt, "pagesize=")) {
-            page_size = g_ascii_strtoull(opt + 9, NULL, 10);
+        g_autofree char **tokens = g_strsplit(opt, "=", -1);
+
+        if (g_strcmp0(tokens[0], "sortby") == 0) {
+            if (g_strcmp0(tokens[1], "reads") == 0) {
+                sort_by = SORT_R;
+            } else if (g_strcmp0(tokens[1], "writes") == 0) {
+                sort_by = SORT_W;
+            } else if (g_strcmp0(tokens[1], "address") == 0) {
+                sort_by = SORT_A;
+            } else {
+                fprintf(stderr, "invalid value to sortby: %s\n", tokens[1]);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "io") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &track_io)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "pagesize") == 0) {
+            page_size = g_ascii_strtoull(tokens[1], NULL, 10);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.30.2


