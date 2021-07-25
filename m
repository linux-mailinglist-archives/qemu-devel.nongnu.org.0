Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875213D4D58
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:26:13 +0200 (CEST)
Received: from localhost ([::1]:38940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dCu-000359-IA
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dB9-0000Hk-AP
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dB7-0003lk-RD
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:23 -0400
Received: by mail-pl1-x634.google.com with SMTP id n10so731027plc.2
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3B9CrnRSDOeKXxeWXGDcKxMgiwIzx47M7NAowChwks=;
 b=sektDWaTOg1KfikvBoZ5sssayiL6yKwrTFwKeUxY78VFhiBMRlwS/nJWw8Z7Tyx9Wc
 KnveDM2nMRYQI7AgxByPdXpdYNpNI/MVH9ADwg+fFA4VFXZ5EJlB232VnwSEw4vSF+j3
 sA5mKxcfZqVqTOYCNZJQduumswfpZabuayRiv96XFxo2P6/iCt0ni+NOblLbFT4kBw2M
 weYli2ZhlZbM7MNgbGrQNkP3+0I1/bKV8zpxF+zlBnCdKLxNPK95/3UXhVlan9e6lRTh
 vr2Bf6x0ja+tmjaNfDyW/e83FQIC6UR2SBRVP0KDITen/0GdnKdRZCF01j1VKbPrgQB8
 aTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3B9CrnRSDOeKXxeWXGDcKxMgiwIzx47M7NAowChwks=;
 b=muHJlwUsGBheTELaiEAzbZznJ0f5xU5aiJ05KdA+PZA/bh1H1BwDdfMOikmZ3qXvAb
 7wilaVhEls7+c8r67Py7veRNqr+zD+ME8LqEFtkKya0jy62QlE1TfWXiS+Cjm/m2laLd
 UFbTjqcV724t/K2cW4r8p0+twOcpil/0bQeN7sOwJiPM5mzJNgi9BDLHNDhyTgmg2sdu
 qDdi8jKjNlwr+iIUA5wtKyQCHpBl3NOyAXZnHRxQy7bsmlvm6OW8tLIYXmcktG0kBLtD
 mtOqc3k0RtjmWiHzulvnXfuzBmQuRQ520e9rwJzutrSDjeMnIAScYwcHVbx33KlNz3bN
 BxXQ==
X-Gm-Message-State: AOAM530u2hTDPnJBlk/nE6tJprmYrx2iqcw/CzJr18k8GyrPL62D6HbJ
 yHQ15X5uBWF4Xc8LkISU+07kKRNdECrHCg==
X-Google-Smtp-Source: ABdhPJwZnvq8BihUY/OWBYw/A5dxz5DqIYMKUqtNGbJWlpaH1fJ3sd11jp7NddjbUOR4Y+iXFWGeKA==
X-Received: by 2002:a17:902:e84d:b029:12b:b2aa:5266 with SMTP id
 t13-20020a170902e84db029012bb2aa5266mr10572277plg.65.1627215860453; 
 Sun, 25 Jul 2021 05:24:20 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 1/9] nbd/server: Mark variable unused in
 nbd_negotiate_meta_queries
Date: Sun, 25 Jul 2021 02:24:08 -1000
Message-Id: <20210725122416.1391332-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
nbd/server.c:976:22: error: variable 'bitmaps' set but not used \
    [-Werror,-Wunused-but-set-variable]

which is incorrect; see //bugs.llvm.org/show_bug.cgi?id=3888.

Cc: qemu-block@nongnu.org
Cc: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 nbd/server.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index b60ebc3ab6..3927f7789d 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -973,7 +973,8 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
 {
     int ret;
     g_autofree char *export_name = NULL;
-    g_autofree bool *bitmaps = NULL;
+    /* Mark unused to work around https://bugs.llvm.org/show_bug.cgi?id=3888 */
+    g_autofree G_GNUC_UNUSED bool *bitmaps = NULL;
     NBDExportMetaContexts local_meta = {0};
     uint32_t nb_queries;
     size_t i;
-- 
2.25.1


