Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE916F8AB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 08:44:55 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6rNG-0000el-Ty
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 02:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIN-0000zV-9j
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIM-0002u0-6B
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:51 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39357)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6rIL-0002se-VW
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:50 -0500
Received: by mail-wm1-x342.google.com with SMTP id c84so1840644wme.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 23:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKkeoZq9HbTVeGuobEg9B8HnhSc+qC4HzgVEf5ivfAQ=;
 b=jWLD05JYdzjyIOMxlekctkdIfA094/bwKSVWPOv2lOrULpfDaIn3u7p6X4LCKOj/S+
 9uRGyoJ0mt6qbsbmpW9LgkRCeEqFOC0Hn3zy3RbcDkcIro3TdMnxkwX/ssZ0AJDiLUHg
 zU6BsWj0VOTPOdYEdEy4NR3aapGhNuZ4Wv5re2hrejJaAAOgYOEncH0EeP3SVFQJfDZi
 4YFevoCSnlKtAwrm+mQt+14RcPIW7Auv4jDHWHqZzvss4riQrek6XfZfqufXaKR+ADuX
 mTM8dOwl+efsUqPbvOGwdHVkn5au4Svu143xTVkxu2zY0I3qt0M9DQnxZVP/XymCJ9cf
 vluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iKkeoZq9HbTVeGuobEg9B8HnhSc+qC4HzgVEf5ivfAQ=;
 b=CCAIjLun2259GEQaqkhU2mAQMJdaunrM+tuthW3M1nxG9rn8IY8UaLiOFMx6mbMFqi
 k8TFFNFxqmFM60ayEEo9oAzE22Ck4aDv+eNDI3/2WphEgBbxvBlTZfUF3VAdCjOrtKDO
 jJGthqVTLrDs08sMZ9gXrWTEYz2L3Gisi2lhrjGIlWCxGe9wPxSt2JUgOmKBjxx8hU5p
 tCOWnfb4b//SabgLCbNh3NcVEXHBinezWoxtfkkEJLfTCM1iqH8zlW6YdTPzXj1iqy7i
 ty1XVKD0CWb6iE+pCI/8lX9oat3wS5HIQrL9jHsMr+ZurE5LJk6udatsYcaScHJacRhB
 6vJw==
X-Gm-Message-State: APjAAAVJ/rw5YbbLHicWFqx6zaRZsefG007HfIjLPaAwRXWCCZO88KSx
 l+8XXTK9LcMxZz6F5pZqSFLIuQ==
X-Google-Smtp-Source: APXvYqy01llcX3kBwQ8MCoTlhtHtUe6oLGG53XZMWd+aidDCN90k5O3pDe6vWTk0w+NVuE98DDamFA==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr3946534wmg.151.1582702788871; 
 Tue, 25 Feb 2020 23:39:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm2074201wrt.45.2020.02.25.23.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:39:41 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50A381FF9C;
 Wed, 26 Feb 2020 07:39:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/19] tests/plugin: prevent uninitialized warning
Date: Wed, 26 Feb 2020 07:39:22 +0000
Message-Id: <20200226073929.28237-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

According to the glibc function requirements, we need initialise
 the variable. Otherwise there will be compilation warnings:

glib-autocleanups.h:28:3: warning: ‘out’ may be
used uninitialized in this function [-Wmaybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200206093238.203984-1-kuhn.chenqun@huawei.com>
[AJB: uses Thomas's single line allocation]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200225124710.14152-13-alex.bennee@linaro.org>

diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index f30bea08dcc..df19fd359df 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -22,9 +22,9 @@ static bool do_inline;
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
-    g_autofree gchar *out;
-    out = g_strdup_printf("bb's: %" PRIu64", insns: %" PRIu64 "\n",
-                          bb_count, insn_count);
+    g_autofree gchar *out = g_strdup_printf(
+        "bb's: %" PRIu64", insns: %" PRIu64 "\n",
+        bb_count, insn_count);
     qemu_plugin_outs(out);
 }
 
diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 0a8f5a0000e..a9a6e412373 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -44,8 +44,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
-    g_autofree gchar *out;
-    out = g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
+    g_autofree gchar *out = g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
     qemu_plugin_outs(out);
 }
 
-- 
2.20.1


