Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB53C65DC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:01:40 +0200 (CEST)
Received: from localhost ([::1]:42064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33zf-0000yu-42
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tv-0000aI-Lo
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tr-0006ql-FG
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso724882pjt.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyvaGMC6h5HLiIret8Mp3ndf9xYPQ8o8+AuZQESpOgY=;
 b=DPzFqEs3acNKDr6SkjYmqgBFsYTVS0IIUku+NMS1BmLR1ubh6PIyzP7+iRLVbaVz20
 Lu7UNPOR2CDo4U4EHY5FBRzADuLJSETQGEfG0yRL/F/MrEplB/gEQIQvWNLBMhhl0X/1
 cbhAvA0tohXqtl9pVu93EaOuTFiqaq2WAJHwIPBDg4ryRrYV6HI9/I0328K3dmgQsSRX
 9SVFroCie0HDtvMDS3d7te5cS7ZIPu8LYLw+ECHcnAz6dx8rghLVrvfwBD6vmB3yw4UC
 JlGb3fepux2qdgi/COYJZRUZ/OHclzFjOK1W5C39j3ZrhLowpX1hRC4USyroBwPxpy8H
 D5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iyvaGMC6h5HLiIret8Mp3ndf9xYPQ8o8+AuZQESpOgY=;
 b=CObi3oui0uMxseKPTTTbOLeTvh1iFkXXvW3ufZ5EAiphjxpioG7Puz79160+xWOI92
 a/hEq1vIMesq04tVbDCjE/0l4yadGYPDtxbm9HpEHJ+PEkUUa2zpOIC0SIRVO2s16lyr
 aqKcIlcwUBA9chKAUvBq3bbnfo46505wCgArjPDHUh3h/5B9ZALDHqcUhh054Jl+lkCm
 VVZl4wIJC1l4+IQSjnw6Cj4Z6DgBU13YmncJ/w2Xa7Cx1DmPhY+iM6jHwRzC8sN06oNi
 2pngVsVs8aB3L4pCkd1B7lQ5Qx9iuEA1b4rbP4jK58a1iC4RpC4KuNhyPQ918mQrdUou
 fWXw==
X-Gm-Message-State: AOAM532U9arA88jP0TxKBWzpcCs6qludvwLF1qAvhqs2mRdCak1LAPzp
 zPixNIfhUI0E4Y9tyNDaNZ5FCbwfv9CpOA==
X-Google-Smtp-Source: ABdhPJwLZ1AGRUEt91hy+D+14Wci8tqlZFgEAeAUkFggVgc4bXOn+qhKQ2ZZFDJYolXhHwlfWJyhjg==
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr1008965pjn.212.1626126937990; 
 Mon, 12 Jul 2021 14:55:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] nbd/server: Remove unused variable
Date: Mon, 12 Jul 2021 14:55:25 -0700
Message-Id: <20210712215535.1471256-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
nbd/server.c:976:22: error: variable 'bitmaps' set but not used \
    [-Werror,-Wunused-but-set-variable]

Cc: qemu-block@nongnu.org
Cc: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 nbd/server.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index b60ebc3ab6..721349ec00 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -973,7 +973,6 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
 {
     int ret;
     g_autofree char *export_name = NULL;
-    g_autofree bool *bitmaps = NULL;
     NBDExportMetaContexts local_meta = {0};
     uint32_t nb_queries;
     size_t i;
@@ -1007,9 +1006,6 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
                             "export '%s' not present", sane_name);
     }
     meta->bitmaps = g_new0(bool, meta->exp->nr_export_bitmaps);
-    if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
-        bitmaps = meta->bitmaps;
-    }
 
     ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), false, errp);
     if (ret <= 0) {
-- 
2.25.1


