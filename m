Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8053C89D4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:29:55 +0200 (CEST)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ihm-0008C3-ES
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idc-0008S4-Df
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idW-0005jk-T9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id g12so2084437wme.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MgSxNTXj24fmsVtKLZKGMUSHi7S+elrSni9PhwS8No=;
 b=Ild5PhSy4FIQvEheWdayucZkih6yFYrmi8Xy8NEkIk0egsavgSXuQjo/Mk9yy5bUYg
 JmtcFY7vMjWmWpwyM0ExXlS3jIFfYj1WVuGjpx833g+X94TcgRekdwORKlspXG7fDhrw
 7ZxNbTVuW7l9sPa4YI8gq0A87FKdqDZ6kf4FJiFzyhaKT3Kgn+kw6fojMdAsDGuex6sA
 Gfgi8P2G33k4mBeCMNTvn28bKpR6LADlwTfFp2LeWbiRcOYbosjEmRfOXbIB9TL97kwW
 419NimGZLj8PU4qrZ6mpDlYP0u8fnIoDQt4Nanc1qzWynpyXI3s/AnOHnxwZUtS42hvG
 qdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MgSxNTXj24fmsVtKLZKGMUSHi7S+elrSni9PhwS8No=;
 b=aD0GsyEosp7OR0HBuZ0nxsjJ/BSHmc4bTw8a/Wq+LQszMVZrrkh84Ja+9He9HXWmA/
 WZ3HPILX8AAhQe2hBUWSzPLq09/F3eFxff9hZvg8T+uIevZnF2Mvuq8Fix3yabGukCWI
 Ub95+zIlx1lq5WVV84reW6hb8LjcamifNPZrB8RRstZAbCo66HRHOKeKgsbt4EckJMRk
 TdgfafUfKi/Owh3fsTUlMKt4hUJB2X0FqVj+LP0zxFkVLyr85lNNt3SbMGwDkjavFxeg
 3+Jv66/+Wd4jOs/UV7PG8V6t8XyJnEegg1StsHVTTjDxg6YEcf+0dv9EqPl+Ibze4bxZ
 9/LQ==
X-Gm-Message-State: AOAM531hSwmoF+kRQgUFXrCSyV3PLoZWVO56PvVZ0ac1Ulo/Zz3HvZr4
 Mc+83cBw1AxLqC6f7LeKtekN85tomk0NZw==
X-Google-Smtp-Source: ABdhPJx+tYkda9XkMF9q5uybC6XHoaKJB/yahIkm9lha77NhfRYEvZvfMZwplJOXRaDk6cPhx4QqAg==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr12534006wms.169.1626283529202; 
 Wed, 14 Jul 2021 10:25:29 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:25:28 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] plugins/cache: Fixed "function decl. is not a prototype"
 warnings
Date: Wed, 14 Jul 2021 19:21:52 +0200
Message-Id: <20210714172151.8494-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714172151.8494-1-ma.mandourr@gmail.com>
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x331.google.com
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
index 60f7be208b..f82a8310dc 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -541,7 +541,7 @@ static int icmp(gconstpointer a, gconstpointer b)
     return insn_a->imisses < insn_b->imisses ? 1 : -1;
 }
 
-static void log_stats()
+static void log_stats(void)
 {
     int i, iters;
     CoreStats cs;
@@ -578,7 +578,7 @@ static void log_stats()
     qemu_plugin_outs(rep->str);
 }
 
-static void log_top_insns()
+static void log_top_insns(void)
 {
     int i;
     GList *curr, *miss_insns;
@@ -633,7 +633,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     g_mutex_unlock(&mtx);
 }
 
-static void policy_init()
+static void policy_init(void)
 {
     switch (policy) {
     case LRU:
-- 
2.25.1


