Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AC3D0C9B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:56:41 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69u4-0007OC-Pc
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69aw-0004HU-9V
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69au-0005AI-It
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u1so1660153wrs.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xVDywL+q5JpXQhN2A4F3STnAn6KlKWnwZ97uKe26WU=;
 b=tyg2+odlUkGFwC0ZP/q86045/QyxIVt+Ew+MiLcj0svla7n0ESpHpBQv6tTVpXDVFT
 1FrIR72ZSI2II3/DOeDGu9bkWFwqKaihKw61UVTHV9uPTz1rwUwBTVcbXJffYD6q3unR
 c6OZeHZiE67YLHH579g8svNx2u5MjWZRcdlOV9hDMuQn+QVe9xXEJxWytv7LkRzRG9UN
 BNYgt5bMfhZSSZgKaXfv+eUhbheyVFkIV+zW3Z76gKjor8hlURS5341oe4ve5UdWSkYW
 UYlRx0hKM2zdtS2XV+28rLRC7Yqh8KG1pfIJP9TsyHhYW4sTDjczeknSgAObUAE8pk7n
 X5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/xVDywL+q5JpXQhN2A4F3STnAn6KlKWnwZ97uKe26WU=;
 b=olNYQ2PTi9RPNtsxs7l0iKHhahbmYEPpXK47XhK7cBW0yAmYE0E0DxDiCg3/Xy2Awn
 OAdCl+3Skvlo7V9vuWPZda77ABbcdV079w//cBx42YXuhnBny5wcChLlzwJJcUb/bsEZ
 gEviQaF5fBnaWyOPKZ8DYSYnqMIx9v/8H9Q5Lc+y8XexkHXRYuqr5gxAiqj1p0/XFh0r
 o4KT0xxXoDqPK67K5ntg2YTkhm+dWMkLRkftMJ3AyxLV7iB/9Ydt2JwBn6F/Yj7OhUZP
 wMSkpCQBKNwpL122yyRRwye2LXjoPat539H5fwC8Y4IjQGCHI5h0gbE8b30cxlcIBJ8i
 Hkfg==
X-Gm-Message-State: AOAM533ZilooQquyup6mhiozoWhUpreWzs3eMyQBweWMeXX9vwvqQWa/
 Mvu+oNVWDoJBEJX/p9pzRF7faaGoM50=
X-Google-Smtp-Source: ABdhPJxZIfM7OdOixdjtBE2EDkxAQpB7kqOZmkOlBA3I6QUAsvOLIpVVpbqnvCnyKF5OXLk5qqUchg==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr41542664wrz.227.1626863811097; 
 Wed, 21 Jul 2021 03:36:51 -0700 (PDT)
Received: from localhost.localdomain ([102.47.167.62])
 by smtp.gmail.com with ESMTPSA id s24sm28854019wra.33.2021.07.21.03.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:36:50 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] plugins/cache: Fixed "function decl. is not a
 prototype" warnings
Date: Wed, 21 Jul 2021 12:36:11 +0200
Message-Id: <20210721103612.48844-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721103612.48844-1-ma.mandourr@gmail.com>
References: <20210721103612.48844-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 496d6e7d49..cc9020b2d5 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -535,7 +535,7 @@ static void sum_stats(void)
     }
 }
 
-static void log_stats()
+static void log_stats(void)
 {
     int i, iters;
 
@@ -559,7 +559,7 @@ static void log_stats()
     qemu_plugin_outs(rep->str);
 }
 
-static void log_top_insns()
+static void log_top_insns(void)
 {
     int i;
     GList *curr, *miss_insns;
@@ -610,7 +610,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     g_free(stats);
 }
 
-static void policy_init()
+static void policy_init(void)
 {
     switch (policy) {
     case LRU:
-- 
2.25.1


