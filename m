Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DF6062E9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:25:06 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWTo-0004yK-3w
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:25:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWQy-0007ts-8V
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU6F-0002fM-Lj
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0000oh-ON
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so1982803wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRCAx/0T6uLHPeJ0IbWs8YzhrB6ddKjxKSX6xBBHKNY=;
 b=nmN/ljEoDll7JN6kCEi8ytDbCR+Aa84ZrkkzdYKQDwwJKYUETtcyFa72sH7ntfiZcN
 EZ64o95UbgOcwd/TvT2ubEk6Ju0NoDMswxJ7JPPEe5M7mPnnPszYaw87n4Xwo3N6YBAC
 DLhU0Kr8JuK5LgbhpwUhFSMBtQr3/rK0Yn7pTzMJqPQlSn1LSwXYswiymhj7V/z7uxHj
 q1YkCWDjsCfVM2zgNukVra9l3HZYDVj88SdPOKyV9EB0DkBoO6OEH7LhL+onEI6wbJeW
 OXLavI1VdxRqydPgUIdrw5YXQnj+4UphSlSKB73absmgp7BpZnXZtpkbNXMCORXm4E5a
 9KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRCAx/0T6uLHPeJ0IbWs8YzhrB6ddKjxKSX6xBBHKNY=;
 b=uMQgiioasjKczyI8ld68JhwabWE1W+vBATp9k99EoUxzS2ApGJLj6Y5HF3Hcf4ZR1D
 uDyiupKbcbFH4tYQyhjb06PJbe5UnyVHRtidhs76qAEoCB6FXOav9IR2jQuXNsTnG77d
 pP1SODEHABIWF9yV/9Geyj8GVwMwHPrFVCLHOWpS8mRLrIeas6m8Eb1s1V/cbkkM6yX7
 OQ41Z65li3DHEcQhQTQrYe9D/O9tl/AHagZleMCR0rk58IEmBFGCJkUIpnEcWatclGGg
 iUHRONiMcP/Y2laHsij8fl1Ac9pi9YEqbTX8HMASkv1tHLWjiSMdaboNdbAAa6Bfy0aH
 srXA==
X-Gm-Message-State: ACrzQf31y8s05/xGzVwQ9+SS1d46y24jJSHqsNMwmccA/sjAIna4x/5F
 MoaFSp6PjHzy7m4Orso7s0EIag==
X-Google-Smtp-Source: AMsMyM7QqhllCydpW4ys/Pjl+qLorPOpsw0CwKgvdU+PW0RbYr0bGiaVNlbjksqh6uub+mIODk8ylA==
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr8846370wmq.125.1666266740214; 
 Thu, 20 Oct 2022 04:52:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adff582000000b0022cd0c8c696sm2374980wro.103.2022.10.20.04.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 189231FFC2;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 11/26] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Thu, 20 Oct 2022 12:51:54 +0100
Message-Id: <20221020115209.1761864-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221006151927.2079583-4-bmeng.cn@gmail.com>
---
 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1


