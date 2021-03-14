Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40C33A27E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:27:06 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHPF-0000mz-5b
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMH-0006V2-6C
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMF-0004Qa-8F
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so18142586wml.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsATIuWJVLsP36O5rVx7aqqo47uS9kRVIQPzX/a9z+M=;
 b=h47gePfWpVLTlLPeqZkKtPpprzcttqNm4iqD709FU3AmUNx5hZF7Ma5GzOUvsuXdE0
 x4mwtwFfcDugY+XLj22iWPLYPll3qqoyQw46nZzht2aqWaYbUoelLvO0hvlNB6u9LXh7
 74GU9z+9h4A1Vf/fYlj0nb6hIFvaqSN45IBa8eJzXtitgwW2GkRMCW5lUiKPt7ffFeRH
 LcXqbDX3TQyRXAjIe3841bnbXBV2SUwfq0S44Ul+Rq6cl/QlDGNRkwXMN0MuCbIW77w/
 6thnQtdpZ2tR3XigZTxAOhpUloTSj69BmJIG03aJbVHkXSLk2nOEwzaCvBRUpRPfCIkq
 nmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsATIuWJVLsP36O5rVx7aqqo47uS9kRVIQPzX/a9z+M=;
 b=DXILvivAyzEG6VRgb0B49H0FDgX0sfMc4ZpqxaS9OfEUHbLUq8IJmhIzWF1CmGq7ih
 1kYVaDYd2xCDmFQuMa7rmts2Ll4a0rTEX2w6LzkSHz/rAXcoeokwROtMlyQ/SV3ImCdo
 xGpuv2793aoJg174aNtJtknZ0ArY5JxctyYB5u0ck1qBeopjvFYQA2def21RsLw6uGmu
 uT8CqCLZewoIRMlOOFKWv2RoQv32I6zTiab1HwkAfsW6bVDfzMqHkBYxWoZVXr1WM13R
 cKDabf4nlUFLPX9y/k7onndKQGKKByKsC+knzJjpSdBa92rqwl3x0cJcomSiN1o0ZBOi
 FTWw==
X-Gm-Message-State: AOAM532ymiv6+L7UOfo1o2mGqHntN5zofqPXuLQoULbF2wpeZZ2iDB+S
 6SJ+l7AGAlCU47HU9+gx4fFJRjgAbJg=
X-Google-Smtp-Source: ABdhPJzqIDzR+OfYBW1hXWgNXuwHYHW1Ydm/6WN4sD2new6S/6A72iUdabFtAqRUo+oDaMfAx5rTfQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr17364503wma.170.1615692236853; 
 Sat, 13 Mar 2021 19:23:56 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:23:56 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] hw/audio/fmopl.c: Fixing some style errors
Date: Sun, 14 Mar 2021 05:23:18 +0200
Message-Id: <20210314032324.45142-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314032324.45142-1-ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed style errors on the relevant lines in which
I will introduce changes.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 hw/audio/fmopl.c | 58 ++++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 8a71a569fa..51b773695a 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -607,26 +607,32 @@ static int OPLOpenTable( void )
 	double pom;
 
 	/* allocate dynamic tables */
-	if( (TL_TABLE = malloc(TL_MAX*2*sizeof(int32_t))) == NULL)
-		return 0;
-	if( (SIN_TABLE = malloc(SIN_ENT*4 *sizeof(int32_t *))) == NULL)
-	{
-		free(TL_TABLE);
-		return 0;
-	}
-	if( (AMS_TABLE = malloc(AMS_ENT*2 *sizeof(int32_t))) == NULL)
-	{
-		free(TL_TABLE);
-		free(SIN_TABLE);
-		return 0;
-	}
-	if( (VIB_TABLE = malloc(VIB_ENT*2 *sizeof(int32_t))) == NULL)
-	{
-		free(TL_TABLE);
-		free(SIN_TABLE);
-		free(AMS_TABLE);
-		return 0;
-	}
+    TL_TABLE = malloc(TL_MAX * 2 * sizeof(int32_t));
+    if (TL_TABLE == NULL) {
+        return 0;
+    }
+
+    SIN_TABLE = malloc(SIN_ENT * 4 * sizeof(int32_t *));
+    if (SIN_TABLE == NULL) {
+        free(TL_TABLE);
+        return 0;
+    }
+
+    AMS_TABLE = malloc(AMS_ENT * 2 * sizeof(int32_t));
+    if (AMS_TABLE == NULL) {
+        free(TL_TABLE);
+        free(SIN_TABLE);
+        return 0;
+    }
+
+    VIB_TABLE = malloc(VIB_ENT * 2 * sizeof(int32_t));
+    if (VIB_TABLE == NULL) {
+        free(TL_TABLE);
+        free(SIN_TABLE);
+        free(AMS_TABLE);
+        return 0;
+    }
+
     ENV_CURVE = g_new(int32_t, 2 * EG_ENT + 1);
 	/* make total level table */
 	for (t = 0;t < EG_ENT-1 ;t++){
@@ -696,10 +702,10 @@ static int OPLOpenTable( void )
 static void OPLCloseTable( void )
 {
     g_free(ENV_CURVE);
-	free(TL_TABLE);
-	free(SIN_TABLE);
-	free(AMS_TABLE);
-	free(VIB_TABLE);
+    free(TL_TABLE);
+    free(SIN_TABLE);
+    free(AMS_TABLE);
+    free(VIB_TABLE);
 }
 
 /* CSM Key Control */
@@ -1082,7 +1088,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 	state_size  = sizeof(FM_OPL);
 	state_size += sizeof(OPL_CH)*max_ch;
 	/* allocate memory block */
-	ptr = malloc(state_size);
+    ptr = malloc(state_size);
 	if(ptr==NULL) return NULL;
 	/* clear */
 	memset(ptr,0,state_size);
@@ -1128,7 +1134,7 @@ void OPLDestroy(FM_OPL *OPL)
 	}
 #endif
 	OPL_UnLockTable();
-	free(OPL);
+    free(OPL);
 }
 
 /* ----------  Option handlers ----------       */
-- 
2.25.1


