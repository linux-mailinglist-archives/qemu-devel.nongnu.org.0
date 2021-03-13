Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A00339F2B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:42:27 +0100 (CET)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7LO-0005b3-Kk
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HL-0002Rv-Q6
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:15 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HD-0007Ih-Hl
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so6456525wrz.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHt/kKgnn7OMCOswaApfoEE2IOMfcSBQxaUlkBfROq4=;
 b=Vne8VT16lc9LjWIxaeOA3fR2gy71F5DGrOOQ+Q31uW9CAZlcR2KEVICOD9c9/EpWb5
 wcbZvObaimEtKvz4YnwXnMjAoGWF3XLDY31jIaZn7DABothdzMSCNaD6KRJoUPWXT5/0
 OfYzUSix8zzbuXB6wblCPMp6tYjG8gd9SlOdLtXP+57UlI6tw77rAwX57RIFyDawXoa2
 UqgyZC26WbW8lZqCWIGgknQW+6VWiqWW2X2MJSGIXuHwAyD8IHdTK4fWkZBp34fp/+yx
 fOVLihIXf4xrx2S4yVTCssewjRkadsObZ2Evusd9CxRutXqwksRr4B1PJVwaG+ESENW4
 Yvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHt/kKgnn7OMCOswaApfoEE2IOMfcSBQxaUlkBfROq4=;
 b=f7tkHrApa4ZZbNRAsc/uhwDYMYNiDefW4ySpj6FbYD3VNX4TKsLpRJw+RkSepkwoSS
 tNZLZVMeA68dgyGkX3O6PRAAnDSc9HNsBv2Ep3l0XxNZnaIXHi40Y/2Iz5D3JyuIMLJA
 j9Re/BYtcjWG7YJSucPqhDcpS0OTYX6CQPgD3ttwb2B3kDYkkQxRqkMpY+gvGELl5sFd
 BEm64gHKY3XKDbOetfirTy2+CymlFgC+k+dk6A4iyCPsfegMYeCHFLjEOpuh31pnqCCh
 xEiB7XcXEbZFJWYsVV5uChzMqFHqRIP7IbfDh024JA1r+3ujYV27Df3wKt2Prr6wZvOt
 8+Dw==
X-Gm-Message-State: AOAM533kILOAQwm3Vj6nvn7QBqBaVPCf96VK+oHwAQwV1Y1rGGSqIk9j
 yyXs9wfdnoZKGcOxIEYJhEqomxpeRlo=
X-Google-Smtp-Source: ABdhPJw0wsi7z9utCj2pHYGtpprrXk770490KvyQHEbDjtrUDa7pnkLacfKcW9Gqa4KVDx491xDE7w==
X-Received: by 2002:a05:6000:245:: with SMTP id
 m5mr20050311wrz.284.1615653486101; 
 Sat, 13 Mar 2021 08:38:06 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:05 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/audio/fmopl.c: Fixing some style errors.
Date: Sat, 13 Mar 2021 18:36:46 +0200
Message-Id: <20210313163653.37089-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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
 hw/audio/fmopl.c | 52 ++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 8a71a569fa..45f15c53b3 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -607,26 +607,26 @@ static int OPLOpenTable( void )
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
+    if((TL_TABLE = malloc(TL_MAX * 2 * sizeof(int32_t))) == NULL)
+        return 0;
+    if((SIN_TABLE = malloc(SIN_ENT * 4 *sizeof(int32_t *))) == NULL)
+    {
+        free(TL_TABLE);
+        return 0;
+    }
+    if((AMS_TABLE = malloc(AMS_ENT * 2 * sizeof(int32_t))) == NULL)
+    {
+        free(TL_TABLE);
+        free(SIN_TABLE);
+        return 0;
+    }
+    if((VIB_TABLE = malloc(VIB_ENT *2 * sizeof(int32_t))) == NULL)
+    {
+        free(TL_TABLE);
+        free(SIN_TABLE);
+        free(AMS_TABLE);
+        return 0;
+    }
     ENV_CURVE = g_new(int32_t, 2 * EG_ENT + 1);
 	/* make total level table */
 	for (t = 0;t < EG_ENT-1 ;t++){
@@ -696,10 +696,10 @@ static int OPLOpenTable( void )
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
@@ -1082,7 +1082,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 	state_size  = sizeof(FM_OPL);
 	state_size += sizeof(OPL_CH)*max_ch;
 	/* allocate memory block */
-	ptr = malloc(state_size);
+    ptr = malloc(state_size);
 	if(ptr==NULL) return NULL;
 	/* clear */
 	memset(ptr,0,state_size);
@@ -1128,7 +1128,7 @@ void OPLDestroy(FM_OPL *OPL)
 	}
 #endif
 	OPL_UnLockTable();
-	free(OPL);
+    free(OPL);
 }
 
 /* ----------  Option handlers ----------       */
-- 
2.25.1


