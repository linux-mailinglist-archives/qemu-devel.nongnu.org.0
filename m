Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C752C3C65E8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:06:01 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m343s-0007Z7-Tt
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tx-0000ea-1l
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tu-0006t3-96
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so842279pju.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XETLGHbzSx1DKTz4qiEULjf7r49YPKh/uFQ3WSm96o=;
 b=aFRau+l+IQuB//pmHt5hO7GeCYO3oqJ1azjwDPsr8FPMP+lVeBZ9uoBFC3R49eEuEo
 BJOsqCxd7vWf3aYAdzO9e4qEeAAKCHBeUWdOZsa8rjO6sKtSpj4b6W4ZU6Tv8fWETbHA
 +DX9Gt7D9iRt0+QpeFL5m+7i5v7d54WzSEGXLPYzw1RfciGTjRkQtdnoqZYK1q3vrQfq
 eszGcng4eq9N8ilep9OOjedlRwQcun2Q4SfGoaSMEafJALeEvllwF6Js62NR3n/pzAgV
 /L0C+fV2PuGvzWQEIfLBY/QwSg4XljxM3z3SqfkQO6MJVxNgkGNX38oAeboB4r3WSrHm
 wmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XETLGHbzSx1DKTz4qiEULjf7r49YPKh/uFQ3WSm96o=;
 b=ABiSHkF+aaIsXcJzJ1d+PP+U5x+M2G14wa6Re5zRvgvj8VWVe1YBqkiH/dcnb7LrWF
 ov2pBz3dAki4qfIZr65nSJPNoZeK/pgZioLNY29oYmwhJDQPlPnlrSuT2b3gEfezXr7U
 VrLhQv917EpDnBakxdEAbO/SIBrF0iHuJOghHXai3UEbX+h/koQutqOmvtMKcm2tSvsc
 ugHnk9KL6bWTAOoqrVJAgfX98qvVb4/TKREArgiIFaKA60VGbmJ2ksBoHnnmKLSV5FE6
 JrUu1pXDLT/W690sM+Ze+XE4Mv0mLhPJWnqcEaIdLdc/QrrCiww31hGDCvn+ws4GDxTz
 vLfQ==
X-Gm-Message-State: AOAM530Q5+pO5mq27/5NszukvTMc4LkLH4Xp1QWnr+EBVssN38t70SaQ
 Lt0rnAZCX4svLBm3EZBGXLdQPKLiQQlIIg==
X-Google-Smtp-Source: ABdhPJz2Bo9jIPm1EXaWuYT5Gar3Tv+/dEymg4ycTbDyNUPIgGBQV8o3LeQlQiMApVJJHNxk75uucw==
X-Received: by 2002:a17:90a:e2c5:: with SMTP id
 fr5mr1042981pjb.34.1626126941048; 
 Mon, 12 Jul 2021 14:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] hw/ppc/spapr_events: Remove unused variable from
 check_exception
Date: Mon, 12 Jul 2021 14:55:30 -0700
Message-Id: <20210712215535.1471256-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/ppc/spapr_events.c:937:14: error: variable 'xinfo' set but not used \
    [-Werror,-Wunused-but-set-variable]

Cc: qemu-ppc@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/spapr_events.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0cfc19be19..23e2e2fff1 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -934,7 +934,6 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             uint32_t nret, target_ulong rets)
 {
     uint32_t mask, buf, len, event_len;
-    uint64_t xinfo;
     SpaprEventLogEntry *event;
     struct rtas_error_log header;
     int i;
@@ -944,13 +943,9 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return;
     }
 
-    xinfo = rtas_ld(args, 1);
     mask = rtas_ld(args, 2);
     buf = rtas_ld(args, 4);
     len = rtas_ld(args, 5);
-    if (nargs == 7) {
-        xinfo |= (uint64_t)rtas_ld(args, 6) << 32;
-    }
 
     event = rtas_event_log_dequeue(spapr, mask);
     if (!event) {
-- 
2.25.1


