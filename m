Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80306126028
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:58:03 +0100 (CET)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihtVK-0001WY-5g
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ihtNS-0006rh-Bl
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:49:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ihtNR-0000mW-1o
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:49:54 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38895)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ihtNQ-0000hV-Nc
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:49:52 -0500
Received: by mail-wr1-x433.google.com with SMTP id y17so5504265wrh.5
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 02:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9Lb7ztuATikl7TNtVbTN8vyb1yQBmpZ8Z1emNqMw+U=;
 b=dLES/IB2Yra2QENlYcb7uoe69TkKxnfF8dYEVjIq+/WDoIjNtBOF7rpcf4LECdevwQ
 pUw0iUoXiZC/P8zUnXEya/f5QgSRQeZHYbexifNzWP46Eq0pcT6hQ05gouCcZv1H4PnX
 QzgpraEtgSPNF+uYXDqa71Gh8EcPWbU7dB/DANysxC5GQQPj7PGouDDmn3BSyki5T0DU
 fciy+SueMzNCx7f7n/FYDXFp9lCBPRknL4eTxeTPqWUeGoNnKmTAZMd14ZwZMGpX9Bbe
 9WzZsN1PQOSHy8e0wgHpnMdCHEU7oYamsZPr/5alMLpXQlDcwjStNqrq/Ix0g0CtPVBU
 /Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9Lb7ztuATikl7TNtVbTN8vyb1yQBmpZ8Z1emNqMw+U=;
 b=A6YGEsAxjPStLUZzCfBEpObFjPlEBlO0aE5w8EEKoJOvMKW4NzqK0rMy0rhHKLocQ4
 XgQHL/5AcRB3pqZAHmm7qKa6dt43H/JhPt8IJCAyt9DCea6HmUSWexGDldpLShS9vyZ5
 lmjzTUpEegg/oYN7pT1mBODK6LyGoiquSl/1GDd+17rQKN+jCyhi+ukeAO7uKKXuCrJQ
 81TfQoLGavxbPwVoCLBetPlOAoR1sNDlcdqgTYLMK3ZvuzRcs/W+PVSNn5Yyx8DcEjI0
 OD9Qq689YrZXSERSXxLDnEF1YRkWNlhi/tg6NVm+ERp4YdIXfZ9FZPatsp+/wPhU/JXE
 Vw+A==
X-Gm-Message-State: APjAAAUXQm/IJGtLr/+7Wi6gCYr1lwbVrgcaaELUNuW21LMNh8jVxjPG
 XtfQsib5pvTD/1YRYxHkVpjwcA==
X-Google-Smtp-Source: APXvYqzarSrwwWTUHcCnBKjDaVZ6mgl6qF+C0ETog/yeO/B5o8aKJSUSkoHW9vjgSDa4rMZfrN+/Ww==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr8851946wrp.378.1576752591727; 
 Thu, 19 Dec 2019 02:49:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm5734133wrt.82.2019.12.19.02.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:49:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8AC561FF9C;
 Thu, 19 Dec 2019 10:49:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/25] Cleaned up flow of code in qemu_set_log(),
 to simplify and clarify.
Date: Thu, 19 Dec 2019 10:49:21 +0000
Message-Id: <20191219104934.866-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219104934.866-1-alex.bennee@linaro.org>
References: <20191219104934.866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
 qemu-devel@nongnu.org, Robert Foley <robert.foley@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

Also added some explanation of the reasoning behind the branches.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20191118211528.3221-3-robert.foley@linaro.org>

diff --git a/util/log.c b/util/log.c
index 4316fe74eee..417d16ec66e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -54,12 +54,25 @@ static bool log_uses_own_buffers;
 /* enable or disable low levels log */
 void qemu_set_log(int log_flags)
 {
+    bool need_to_open_file = false;
     qemu_loglevel = log_flags;
 #ifdef CONFIG_TRACE_LOG
     qemu_loglevel |= LOG_TRACE;
 #endif
-    if (!qemu_logfile &&
-        (is_daemonized() ? logfilename != NULL : qemu_loglevel)) {
+    /*
+     * In all cases we only log if qemu_loglevel is set.
+     * Also:
+     *   If not daemonized we will always log either to stderr
+     *     or to a file (if there is a logfilename).
+     *   If we are daemonized,
+     *     we will only log if there is a logfilename.
+     */
+    if (qemu_loglevel && (!is_daemonized() || logfilename)) {
+        need_to_open_file = true;
+    }
+    if (qemu_logfile && !need_to_open_file) {
+        qemu_log_close();
+    } else if (!qemu_logfile && need_to_open_file) {
         if (logfilename) {
             qemu_logfile = fopen(logfilename, log_append ? "a" : "w");
             if (!qemu_logfile) {
@@ -93,10 +106,6 @@ void qemu_set_log(int log_flags)
             log_append = 1;
         }
     }
-    if (qemu_logfile &&
-        (is_daemonized() ? logfilename == NULL : !qemu_loglevel)) {
-        qemu_log_close();
-    }
 }
 
 void qemu_log_needs_buffers(void)
-- 
2.20.1


