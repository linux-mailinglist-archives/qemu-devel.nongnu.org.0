Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7E23D1E8F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:57:21 +0200 (CEST)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Sdz-0002F9-Nc
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6Sbc-00004r-4I
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6Sba-0006xz-OL
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f17so4708067wrt.6
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 23:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xVDywL+q5JpXQhN2A4F3STnAn6KlKWnwZ97uKe26WU=;
 b=LRnq1siYwm8bpJK36qvHeBf82nrMc+Jz3C8cajsct6kew+4s8rsLEABxIaxk0Tlt7X
 i5NaFiGNLgwfztBQGEGezTRxf5tKhL3X8YeX87BpWsdPW8hANrvEEbC8N5D+G+/cI86L
 5fbuJOuB0yMrp4MKblXfmuPHkEVyWBl431Hyfojw3U8nDnuPjF8Dsj1W1/ljzjr/x+H3
 beAPqfcoK1QMsNbA1PxRFgoyhdjfIxwnSpyszkuy1C431BARrpRIjndrvkix4lTafejv
 tMTR2aCfS0diPnlliF8wOVbTzcCEC4jiks4DP+pKcOZnJFwF72zClQPZniJFOlNCtJob
 +BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/xVDywL+q5JpXQhN2A4F3STnAn6KlKWnwZ97uKe26WU=;
 b=R/dUyLrX3dhDBw2P8/5p9Y8dyFfcGgnjW482n/RZ42dGPy7jSkasLcf4vEG0KUp+l0
 zsAZX9ZRpJ8R7nPt0DrhfM4QAJ2130QDiTvEovtlkMe7OWySn9MxX2oC5VDXCoYVHP4n
 x091C7qureqjuDaM53Oa00C7R7AHFU8X09L/omB948xZ39xEFBddagoerlGEowEbPJCD
 maql1p99jSS13zYIzt/aldHUu8IeWLUrpbb60wlil/VhMNG8RkhOIrffR4xcTM16cId6
 hAlzbjpjSyyJcUqqZXG57IAb9x16BheUqNK24yq2yo+M14bFs2Jsobnic9UJENxaXFCj
 8G9w==
X-Gm-Message-State: AOAM530UEYZWrNAe2mYxILSCsX8A72UqqVogy6yCbvX3TEgRr1u9J9tz
 NhFs97Jg/WTo+wAveYDzgMvLSXYoSog=
X-Google-Smtp-Source: ABdhPJyWshi+BjH88n1H3O/rTm8MTIg72WAMfDuX5hivym2O4QUNv2an6yx4Kv9mSsvbbiZ/pbrSPw==
X-Received: by 2002:a5d:456d:: with SMTP id a13mr14761026wrc.255.1626936889310; 
 Wed, 21 Jul 2021 23:54:49 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id b16sm29245426wrw.46.2021.07.21.23.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:54:49 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] plugins/cache: Fixed "function decl. is not a
 prototype" warnings
Date: Thu, 22 Jul 2021 08:54:28 +0200
Message-Id: <20210722065428.134608-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722065428.134608-1-ma.mandourr@gmail.com>
References: <20210722065428.134608-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42c.google.com
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


