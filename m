Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263AA3C2673
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:59:34 +0200 (CEST)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ryX-0003iN-4b
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdT-0004u8-H1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdR-0000HF-F7
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id l7so11520039wrv.7
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tf6f4EfVwE6wKq/VA+ZpZ7sEgtGzPQDIrYTfwBXbX4=;
 b=I36vqi2R0l58wEyntdwvMfEqIa8+Z2zb5ymIqeum4wL1dnPHfFMaKAErHMCP+fdQSh
 dhpwb7QqgsUtnm0etXx5UNk0lciAow5ndKDIaKuwCR7E9pGseQpDHPJGXrHokvjm7qfy
 be2iqU8nk/5xKFY5oWTHFxmDbvVj7q47IhZFe2wVCxxYVQgzRhE8UjdqCvU26ruJEiUE
 GxqowW0iSX2N9rcZE7TrhAGRvP25fJ2CzITNINzhkMP9oevEcK3p0ijV1MjGp1NbG85K
 LX7IsdtdsMLbsOa9U5Fa+LrnluOZVftATA4Yi0n+y5w0CLvKlmzjqD2FBghNcWo3ac/u
 1Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4tf6f4EfVwE6wKq/VA+ZpZ7sEgtGzPQDIrYTfwBXbX4=;
 b=U8aULlIGlTGd2iE5IMEEeKLZy1yp+CSCn9tTXrllfsd1x2U3Q9XvrtPXbu/iAhMNBg
 hVNYjZFH2yGKengu68atEddLFTsgynKzFCmQlgUkp+16KDzt5lX6JqOrXRmODfkTVe5Z
 rBgag5z144SDKZ/qUykc33ncsnQXF3tRerwwHGaewd554G26TgS8gUTzoEyiuAC3xnAO
 taPxxsTNTQWJdXfKdJzGJILOP9vXzY11YL55Y0qgWqEIalOc3r7BfGTXwU1cDQE2QeWU
 8BJMWJS6A0XteurcK8YLsoQZNlH3b1xbnLojOi9uSmLMlFyD/TkGjgbkzpfprW6dhhUU
 jCwg==
X-Gm-Message-State: AOAM532I37uUYj639zNZQ4yO48oeoAws+PBClsDdnbzlhS5l2jYl/p2/
 tm4fNDS1N/RLKx7iivQZjBIxfA==
X-Google-Smtp-Source: ABdhPJxmrXncZ+FNJ19eQhGBAt2cPtTA6ouEYqIaYsZdp/wGPy4P7Knp6492QX6cNzvqAA8+IWMgwA==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr42239238wrt.425.1625841464051; 
 Fri, 09 Jul 2021 07:37:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u1sm12496277wmn.23.2021.07.09.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CACDB1FFB3;
 Fri,  9 Jul 2021 15:30:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/40] configure: add an explicit static and plugins check
Date: Fri,  9 Jul 2021 15:29:55 +0100
Message-Id: <20210709143005.1554-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moving this check earlier will make the later re-factor for enabling
by default a bit neater.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 7f906be68d..25daabd0ff 100755
--- a/configure
+++ b/configure
@@ -923,6 +923,7 @@ for opt do
   ;;
   --static)
     static="yes"
+    plugins="no"
     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
   ;;
   --mandir=*) mandir="$optarg"
@@ -2184,11 +2185,14 @@ if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
   error_exit "Can't enable module-upgrades as Modules are not enabled"
 fi
 
-# Static linking is not possible with modules or PIE
+# Static linking is not possible with plugins, modules or PIE
 if test "$static" = "yes" ; then
   if test "$modules" = "yes" ; then
     error_exit "static and modules are mutually incompatible"
   fi
+  if test "$plugins" = "yes"; then
+    error_exit "static and plugins are mutually incompatible"
+  fi
 fi
 
 # Unconditional check for compiler __thread support
@@ -3979,7 +3983,7 @@ if  test "$plugins" = "yes" &&
       "Plugin support requires dynamic linking and specifying a set of symbols " \
       "that are exported to plugins. Unfortunately your linker doesn't " \
       "support the flag (--dynamic-list or -exported_symbols_list) used " \
-      "for this purpose. You can't build with --static."
+      "for this purpose."
 fi
 
 ########################################
-- 
2.20.1


