Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F71601659
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 20:33:40 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okUvj-0003Bl-71
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 14:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okUmi-0003Lu-Gk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 14:24:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okUmd-00025u-Gl
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 14:24:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so13298635wma.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnJHTMxkwdi/Ong9Olyva2KLa6Ws7Msb9dZoqmoc8EM=;
 b=WEtE4X4wOy2hVTcwhcGA8cV0Cw2JjGCx28ZhsclQVm9tOnxMOgnkhzqWskjeP417Z4
 Xs85u5eGDcHoxjUN93IDi8E4JHpRuJ4jLjEWfL8nOE103rID8SxuGdrExtYyt8Tr3bR+
 bTGdwy5h+wXpyQ2P1/ApB2POdGGm+Pj7YNcWOcdhKxX4juQbJmdFBUY5y535mWZP9Hjn
 oEzGQfFW5UqchB5DGPunEksm3ojhuykTb/FYRFLwCNj4s/M+G+wQIC0vLC+sKBRj4oxU
 pbN/Ji/RArmDlBtQdUURfVjOERLjbBcjCRUwQRYrjS7ZYpwl4AJwvmrhAG+AHyf5Vdp6
 aF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnJHTMxkwdi/Ong9Olyva2KLa6Ws7Msb9dZoqmoc8EM=;
 b=6jiueCXrfUs2jUzfgzp9DrBBf/xh4Z/xnH8owvjFhqrECxqYAIdM0+3s7/kVhYb1+H
 /fhOPYSiTqyttoXxD9yLGfwUJJTkzykmWeg5kJQWznkt0tNXXk75qlKMcSS6aSFqpNHR
 b2p5dJ42MiwMl9jlUEHUbtYLmI/w+F40jukoRFBh+A7OQ1N6C98NZmQ8G5lZn0N3rE/k
 A9J3jkINz7xNFiUQhyl32rgbTAw3npSY9d3fiMpSrSsl7m4D5pnKLSMxXcrdPvz92xa8
 bP//lbTqpJi/G6lfoK/lckdZW/xa6sg35KWXv6HxDnJyZDnYt18tigC+fTfGX1rFdDM0
 5g9Q==
X-Gm-Message-State: ACrzQf0bleJMDdcUBo6EBk9nE5WSxM21RJFQJtGuLqkcWmEwmbuGg3wz
 fQ5G1UDByf5Zru4N26m6OUye3axLzkF/QTRqCIk=
X-Google-Smtp-Source: AMsMyM5WQYCuuDIdPKc0vuztwLT0Fy6s0jEfvUjzU/N6LSiTg57svq0thUYRb3U4ZfkDgwhSoyi2bg==
X-Received: by 2002:a05:600c:5398:b0:3c3:dccf:2362 with SMTP id
 hg24-20020a05600c539800b003c3dccf2362mr8615876wmb.89.1666031051777; 
 Mon, 17 Oct 2022 11:24:11 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.48])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0a4300b003b4fdbb6319sm17493047wmq.21.2022.10.17.11.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 11:24:11 -0700 (PDT)
From: amarjargal <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: sgarzare@redhat.com,
	amarjargal <amarjargal16@gmail.com>
Subject: [PATCH 2/4] hw/audio: fix tab indentation into spaces
Date: Tue, 18 Oct 2022 02:23:57 +0800
Message-Id: <594bcbbbda41a3af86208c55ab975a181b205bca.1666029821.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666029821.git.amarjargal16@gmail.com>
References: <cover.1666029821.git.amarjargal16@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=amarjargal16@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The TABs should be replaced with spaces, to make sure that we have a
consistent coding style with an indentation of 4 spaces everywhere.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370

Signed-off-by: amarjargal <amarjargal16@gmail.com>
---
 hw/audio/fmopl.c          | 1664 ++++++++++++++++++-------------------
 hw/audio/fmopl.h          |  138 +--
 hw/audio/intel-hda-defs.h | 1008 +++++++++++-----------
 hw/audio/wm8750.c         |  270 +++---
 4 files changed, 1540 insertions(+), 1540 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 8a71a569fa..fd7371638d 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -9,9 +9,9 @@
 */
 
 /*
-	preliminary :
-	Problem :
-	note:
+    preliminary :
+    Problem :
+    note:
 */
 
 /* This version of fmopl.c is a fork of the MAME one, relicensed under the LGPL.
@@ -32,7 +32,7 @@
 
 #include "qemu/osdep.h"
 #include <math.h>
-//#include "driver.h"		/* use M.A.M.E. */
+//#include "driver.h"        /* use M.A.M.E. */
 #include "fmopl.h"
 #ifndef PI
 #define PI 3.14159265358979323846
@@ -53,14 +53,14 @@ static int opl_dbg_maxchip,opl_dbg_chip;
 
 #define DELTAT_MIXING_LEVEL (1) /* DELTA-T ADPCM MIXING LEVEL */
 
-#define FREQ_BITS 24			/* frequency turn          */
+#define FREQ_BITS 24            /* frequency turn          */
 
 /* counter bits = 20 , octerve 7 */
 #define FREQ_RATE   (1<<(FREQ_BITS-20))
 #define TL_BITS    (FREQ_BITS+2)
 
 /* final output shift , limit minimum and maximum */
-#define OPL_OUTSB   (TL_BITS+3-16)		/* OPL output final shift 16bit */
+#define OPL_OUTSB   (TL_BITS+3-16)        /* OPL output final shift 16bit */
 #define OPL_MAXOUT (0x7fff<<OPL_OUTSB)
 #define OPL_MINOUT (-0x8000<<OPL_OUTSB)
 
@@ -108,10 +108,10 @@ static int opl_dbg_maxchip,opl_dbg_chip;
 /* -------------------- tables --------------------- */
 static const int slot_array[32]=
 {
-	 0, 2, 4, 1, 3, 5,-1,-1,
-	 6, 8,10, 7, 9,11,-1,-1,
-	12,14,16,13,15,17,-1,-1,
-	-1,-1,-1,-1,-1,-1,-1,-1
+     0, 2, 4, 1, 3, 5,-1,-1,
+     6, 8,10, 7, 9,11,-1,-1,
+    12,14,16,13,15,17,-1,-1,
+    -1,-1,-1,-1,-1,-1,-1,-1
 };
 
 /* key scale level */
@@ -119,46 +119,46 @@ static const int slot_array[32]=
 #define DV (EG_STEP/2)
 static const uint32_t KSL_TABLE[8*16]=
 {
-	/* OCT 0 */
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	/* OCT 1 */
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	 0.000/DV, 0.750/DV, 1.125/DV, 1.500/DV,
-	 1.875/DV, 2.250/DV, 2.625/DV, 3.000/DV,
-	/* OCT 2 */
-	 0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
-	 0.000/DV, 1.125/DV, 1.875/DV, 2.625/DV,
-	 3.000/DV, 3.750/DV, 4.125/DV, 4.500/DV,
-	 4.875/DV, 5.250/DV, 5.625/DV, 6.000/DV,
-	/* OCT 3 */
-	 0.000/DV, 0.000/DV, 0.000/DV, 1.875/DV,
-	 3.000/DV, 4.125/DV, 4.875/DV, 5.625/DV,
-	 6.000/DV, 6.750/DV, 7.125/DV, 7.500/DV,
-	 7.875/DV, 8.250/DV, 8.625/DV, 9.000/DV,
-	/* OCT 4 */
-	 0.000/DV, 0.000/DV, 3.000/DV, 4.875/DV,
-	 6.000/DV, 7.125/DV, 7.875/DV, 8.625/DV,
-	 9.000/DV, 9.750/DV,10.125/DV,10.500/DV,
-	10.875/DV,11.250/DV,11.625/DV,12.000/DV,
-	/* OCT 5 */
-	 0.000/DV, 3.000/DV, 6.000/DV, 7.875/DV,
-	 9.000/DV,10.125/DV,10.875/DV,11.625/DV,
-	12.000/DV,12.750/DV,13.125/DV,13.500/DV,
-	13.875/DV,14.250/DV,14.625/DV,15.000/DV,
-	/* OCT 6 */
-	 0.000/DV, 6.000/DV, 9.000/DV,10.875/DV,
-	12.000/DV,13.125/DV,13.875/DV,14.625/DV,
-	15.000/DV,15.750/DV,16.125/DV,16.500/DV,
-	16.875/DV,17.250/DV,17.625/DV,18.000/DV,
-	/* OCT 7 */
-	 0.000/DV, 9.000/DV,12.000/DV,13.875/DV,
-	15.000/DV,16.125/DV,16.875/DV,17.625/DV,
-	18.000/DV,18.750/DV,19.125/DV,19.500/DV,
-	19.875/DV,20.250/DV,20.625/DV,21.000/DV
+    /* OCT 0 */
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+    /* OCT 1 */
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+     0.000/DV, 0.750/DV, 1.125/DV, 1.500/DV,
+     1.875/DV, 2.250/DV, 2.625/DV, 3.000/DV,
+    /* OCT 2 */
+     0.000/DV, 0.000/DV, 0.000/DV, 0.000/DV,
+     0.000/DV, 1.125/DV, 1.875/DV, 2.625/DV,
+     3.000/DV, 3.750/DV, 4.125/DV, 4.500/DV,
+     4.875/DV, 5.250/DV, 5.625/DV, 6.000/DV,
+    /* OCT 3 */
+     0.000/DV, 0.000/DV, 0.000/DV, 1.875/DV,
+     3.000/DV, 4.125/DV, 4.875/DV, 5.625/DV,
+     6.000/DV, 6.750/DV, 7.125/DV, 7.500/DV,
+     7.875/DV, 8.250/DV, 8.625/DV, 9.000/DV,
+    /* OCT 4 */
+     0.000/DV, 0.000/DV, 3.000/DV, 4.875/DV,
+     6.000/DV, 7.125/DV, 7.875/DV, 8.625/DV,
+     9.000/DV, 9.750/DV,10.125/DV,10.500/DV,
+    10.875/DV,11.250/DV,11.625/DV,12.000/DV,
+    /* OCT 5 */
+     0.000/DV, 3.000/DV, 6.000/DV, 7.875/DV,
+     9.000/DV,10.125/DV,10.875/DV,11.625/DV,
+    12.000/DV,12.750/DV,13.125/DV,13.500/DV,
+    13.875/DV,14.250/DV,14.625/DV,15.000/DV,
+    /* OCT 6 */
+     0.000/DV, 6.000/DV, 9.000/DV,10.875/DV,
+    12.000/DV,13.125/DV,13.875/DV,14.625/DV,
+    15.000/DV,15.750/DV,16.125/DV,16.500/DV,
+    16.875/DV,17.250/DV,17.625/DV,18.000/DV,
+    /* OCT 7 */
+     0.000/DV, 9.000/DV,12.000/DV,13.875/DV,
+    15.000/DV,16.125/DV,16.875/DV,17.625/DV,
+    18.000/DV,18.750/DV,19.125/DV,19.500/DV,
+    19.875/DV,20.250/DV,20.625/DV,21.000/DV
 };
 #undef DV
 
@@ -207,7 +207,7 @@ static int32_t RATE_0[16]=
 static int num_lock = 0;
 
 /* work table */
-static void *cur_chip = NULL;	/* current chip point */
+static void *cur_chip = NULL;    /* current chip point */
 /* currenct chip state */
 /* static OPLSAMPLE  *bufL,*bufR; */
 static OPL_CH *S_CH;
@@ -221,7 +221,7 @@ static int32_t *ams_table;
 static int32_t *vib_table;
 static int32_t amsIncr;
 static int32_t vibIncr;
-static int32_t feedback2;		/* connect for SLOT 2 */
+static int32_t feedback2;        /* connect for SLOT 2 */
 
 /* log output level */
 #define LOG_ERR  3      /* ERROR       */
@@ -229,7 +229,7 @@ static int32_t feedback2;		/* connect for SLOT 2 */
 #define LOG_INF  1      /* INFORMATION */
 
 //#define LOG_LEVEL LOG_INF
-#define LOG_LEVEL	LOG_ERR
+#define LOG_LEVEL    LOG_ERR
 
 //#define LOG(n,x) if( (n)>=LOG_LEVEL ) logerror x
 #define LOG(n,x)
@@ -237,204 +237,204 @@ static int32_t feedback2;		/* connect for SLOT 2 */
 /* --------------------- subroutines  --------------------- */
 
 static inline int Limit( int val, int max, int min ) {
-	if ( val > max )
-		val = max;
-	else if ( val < min )
-		val = min;
+    if ( val > max )
+        val = max;
+    else if ( val < min )
+        val = min;
 
-	return val;
+    return val;
 }
 
 /* status set and IRQ handling */
 static inline void OPL_STATUS_SET(FM_OPL *OPL,int flag)
 {
-	/* set status flag */
-	OPL->status |= flag;
-	if(!(OPL->status & 0x80))
-	{
-		if(OPL->status & OPL->statusmask)
-		{	/* IRQ on */
-			OPL->status |= 0x80;
-		}
-	}
+    /* set status flag */
+    OPL->status |= flag;
+    if(!(OPL->status & 0x80))
+    {
+        if(OPL->status & OPL->statusmask)
+        {    /* IRQ on */
+            OPL->status |= 0x80;
+        }
+    }
 }
 
 /* status reset and IRQ handling */
 static inline void OPL_STATUS_RESET(FM_OPL *OPL,int flag)
 {
-	/* reset status flag */
-	OPL->status &=~flag;
-	if((OPL->status & 0x80))
-	{
-		if (!(OPL->status & OPL->statusmask) )
-		{
-			OPL->status &= 0x7f;
-		}
-	}
+    /* reset status flag */
+    OPL->status &=~flag;
+    if((OPL->status & 0x80))
+    {
+        if (!(OPL->status & OPL->statusmask) )
+        {
+            OPL->status &= 0x7f;
+        }
+    }
 }
 
 /* IRQ mask set */
 static inline void OPL_STATUSMASK_SET(FM_OPL *OPL,int flag)
 {
-	OPL->statusmask = flag;
-	/* IRQ handling check */
-	OPL_STATUS_SET(OPL,0);
-	OPL_STATUS_RESET(OPL,0);
+    OPL->statusmask = flag;
+    /* IRQ handling check */
+    OPL_STATUS_SET(OPL,0);
+    OPL_STATUS_RESET(OPL,0);
 }
 
 /* ----- key on  ----- */
 static inline void OPL_KEYON(OPL_SLOT *SLOT)
 {
-	/* sin wave restart */
-	SLOT->Cnt = 0;
-	/* set attack */
-	SLOT->evm = ENV_MOD_AR;
-	SLOT->evs = SLOT->evsa;
-	SLOT->evc = EG_AST;
-	SLOT->eve = EG_AED;
+    /* sin wave restart */
+    SLOT->Cnt = 0;
+    /* set attack */
+    SLOT->evm = ENV_MOD_AR;
+    SLOT->evs = SLOT->evsa;
+    SLOT->evc = EG_AST;
+    SLOT->eve = EG_AED;
 }
 /* ----- key off ----- */
 static inline void OPL_KEYOFF(OPL_SLOT *SLOT)
 {
-	if( SLOT->evm > ENV_MOD_RR)
-	{
-		/* set envelope counter from envleope output */
-		SLOT->evm = ENV_MOD_RR;
-		if( !(SLOT->evc&EG_DST) )
-			//SLOT->evc = (ENV_CURVE[SLOT->evc>>ENV_BITS]<<ENV_BITS) + EG_DST;
-			SLOT->evc = EG_DST;
-		SLOT->eve = EG_DED;
-		SLOT->evs = SLOT->evsr;
-	}
+    if( SLOT->evm > ENV_MOD_RR)
+    {
+        /* set envelope counter from envleope output */
+        SLOT->evm = ENV_MOD_RR;
+        if( !(SLOT->evc&EG_DST) )
+            //SLOT->evc = (ENV_CURVE[SLOT->evc>>ENV_BITS]<<ENV_BITS) + EG_DST;
+            SLOT->evc = EG_DST;
+        SLOT->eve = EG_DED;
+        SLOT->evs = SLOT->evsr;
+    }
 }
 
 /* ---------- calcrate Envelope Generator & Phase Generator ---------- */
 /* return : envelope output */
 static inline uint32_t OPL_CALC_SLOT( OPL_SLOT *SLOT )
 {
-	/* calcrate envelope generator */
-	if( (SLOT->evc+=SLOT->evs) >= SLOT->eve )
-	{
-		switch( SLOT->evm ){
-		case ENV_MOD_AR: /* ATTACK -> DECAY1 */
-			/* next DR */
-			SLOT->evm = ENV_MOD_DR;
-			SLOT->evc = EG_DST;
-			SLOT->eve = SLOT->SL;
-			SLOT->evs = SLOT->evsd;
-			break;
-		case ENV_MOD_DR: /* DECAY -> SL or RR */
-			SLOT->evc = SLOT->SL;
-			SLOT->eve = EG_DED;
-			if(SLOT->eg_typ)
-			{
-				SLOT->evs = 0;
-			}
-			else
-			{
-				SLOT->evm = ENV_MOD_RR;
-				SLOT->evs = SLOT->evsr;
-			}
-			break;
-		case ENV_MOD_RR: /* RR -> OFF */
-			SLOT->evc = EG_OFF;
-			SLOT->eve = EG_OFF+1;
-			SLOT->evs = 0;
-			break;
-		}
-	}
-	/* calcrate envelope */
-	return SLOT->TLL+ENV_CURVE[SLOT->evc>>ENV_BITS]+(SLOT->ams ? ams : 0);
+    /* calcrate envelope generator */
+    if( (SLOT->evc+=SLOT->evs) >= SLOT->eve )
+    {
+        switch( SLOT->evm ){
+        case ENV_MOD_AR: /* ATTACK -> DECAY1 */
+            /* next DR */
+            SLOT->evm = ENV_MOD_DR;
+            SLOT->evc = EG_DST;
+            SLOT->eve = SLOT->SL;
+            SLOT->evs = SLOT->evsd;
+            break;
+        case ENV_MOD_DR: /* DECAY -> SL or RR */
+            SLOT->evc = SLOT->SL;
+            SLOT->eve = EG_DED;
+            if(SLOT->eg_typ)
+            {
+                SLOT->evs = 0;
+            }
+            else
+            {
+                SLOT->evm = ENV_MOD_RR;
+                SLOT->evs = SLOT->evsr;
+            }
+            break;
+        case ENV_MOD_RR: /* RR -> OFF */
+            SLOT->evc = EG_OFF;
+            SLOT->eve = EG_OFF+1;
+            SLOT->evs = 0;
+            break;
+        }
+    }
+    /* calcrate envelope */
+    return SLOT->TLL+ENV_CURVE[SLOT->evc>>ENV_BITS]+(SLOT->ams ? ams : 0);
 }
 
 /* set algorithm connection */
 static void set_algorithm( OPL_CH *CH)
 {
-	int32_t *carrier = &outd[0];
-	CH->connect1 = CH->CON ? carrier : &feedback2;
-	CH->connect2 = carrier;
+    int32_t *carrier = &outd[0];
+    CH->connect1 = CH->CON ? carrier : &feedback2;
+    CH->connect2 = carrier;
 }
 
 /* ---------- frequency counter for operater update ---------- */
 static inline void CALC_FCSLOT(OPL_CH *CH,OPL_SLOT *SLOT)
 {
-	int ksr;
-
-	/* frequency step counter */
-	SLOT->Incr = CH->fc * SLOT->mul;
-	ksr = CH->kcode >> SLOT->KSR;
-
-	if( SLOT->ksr != ksr )
-	{
-		SLOT->ksr = ksr;
-		/* attack , decay rate recalcration */
-		SLOT->evsa = SLOT->AR[ksr];
-		SLOT->evsd = SLOT->DR[ksr];
-		SLOT->evsr = SLOT->RR[ksr];
-	}
-	SLOT->TLL = SLOT->TL + (CH->ksl_base>>SLOT->ksl);
+    int ksr;
+
+    /* frequency step counter */
+    SLOT->Incr = CH->fc * SLOT->mul;
+    ksr = CH->kcode >> SLOT->KSR;
+
+    if( SLOT->ksr != ksr )
+    {
+        SLOT->ksr = ksr;
+        /* attack , decay rate recalcration */
+        SLOT->evsa = SLOT->AR[ksr];
+        SLOT->evsd = SLOT->DR[ksr];
+        SLOT->evsr = SLOT->RR[ksr];
+    }
+    SLOT->TLL = SLOT->TL + (CH->ksl_base>>SLOT->ksl);
 }
 
 /* set multi,am,vib,EG-TYP,KSR,mul */
 static inline void set_mul(FM_OPL *OPL,int slot,int v)
 {
-	OPL_CH   *CH   = &OPL->P_CH[slot/2];
-	OPL_SLOT *SLOT = &CH->SLOT[slot&1];
-
-	SLOT->mul    = MUL_TABLE[v&0x0f];
-	SLOT->KSR    = (v&0x10) ? 0 : 2;
-	SLOT->eg_typ = (v&0x20)>>5;
-	SLOT->vib    = (v&0x40);
-	SLOT->ams    = (v&0x80);
-	CALC_FCSLOT(CH,SLOT);
+    OPL_CH   *CH   = &OPL->P_CH[slot/2];
+    OPL_SLOT *SLOT = &CH->SLOT[slot&1];
+
+    SLOT->mul    = MUL_TABLE[v&0x0f];
+    SLOT->KSR    = (v&0x10) ? 0 : 2;
+    SLOT->eg_typ = (v&0x20)>>5;
+    SLOT->vib    = (v&0x40);
+    SLOT->ams    = (v&0x80);
+    CALC_FCSLOT(CH,SLOT);
 }
 
 /* set ksl & tl */
 static inline void set_ksl_tl(FM_OPL *OPL,int slot,int v)
 {
-	OPL_CH   *CH   = &OPL->P_CH[slot/2];
-	OPL_SLOT *SLOT = &CH->SLOT[slot&1];
-	int ksl = v>>6; /* 0 / 1.5 / 3 / 6 db/OCT */
+    OPL_CH   *CH   = &OPL->P_CH[slot/2];
+    OPL_SLOT *SLOT = &CH->SLOT[slot&1];
+    int ksl = v>>6; /* 0 / 1.5 / 3 / 6 db/OCT */
 
-	SLOT->ksl = ksl ? 3-ksl : 31;
-	SLOT->TL  = (v&0x3f)*(0.75/EG_STEP); /* 0.75db step */
+    SLOT->ksl = ksl ? 3-ksl : 31;
+    SLOT->TL  = (v&0x3f)*(0.75/EG_STEP); /* 0.75db step */
 
-	if( !(OPL->mode&0x80) )
-	{	/* not CSM latch total level */
-		SLOT->TLL = SLOT->TL + (CH->ksl_base>>SLOT->ksl);
-	}
+    if( !(OPL->mode&0x80) )
+    {    /* not CSM latch total level */
+        SLOT->TLL = SLOT->TL + (CH->ksl_base>>SLOT->ksl);
+    }
 }
 
 /* set attack rate & decay rate  */
 static inline void set_ar_dr(FM_OPL *OPL,int slot,int v)
 {
-	OPL_CH   *CH   = &OPL->P_CH[slot/2];
-	OPL_SLOT *SLOT = &CH->SLOT[slot&1];
-	int ar = v>>4;
-	int dr = v&0x0f;
-
-	SLOT->AR = ar ? &OPL->AR_TABLE[ar<<2] : RATE_0;
-	SLOT->evsa = SLOT->AR[SLOT->ksr];
-	if( SLOT->evm == ENV_MOD_AR ) SLOT->evs = SLOT->evsa;
-
-	SLOT->DR = dr ? &OPL->DR_TABLE[dr<<2] : RATE_0;
-	SLOT->evsd = SLOT->DR[SLOT->ksr];
-	if( SLOT->evm == ENV_MOD_DR ) SLOT->evs = SLOT->evsd;
+    OPL_CH   *CH   = &OPL->P_CH[slot/2];
+    OPL_SLOT *SLOT = &CH->SLOT[slot&1];
+    int ar = v>>4;
+    int dr = v&0x0f;
+
+    SLOT->AR = ar ? &OPL->AR_TABLE[ar<<2] : RATE_0;
+    SLOT->evsa = SLOT->AR[SLOT->ksr];
+    if( SLOT->evm == ENV_MOD_AR ) SLOT->evs = SLOT->evsa;
+
+    SLOT->DR = dr ? &OPL->DR_TABLE[dr<<2] : RATE_0;
+    SLOT->evsd = SLOT->DR[SLOT->ksr];
+    if( SLOT->evm == ENV_MOD_DR ) SLOT->evs = SLOT->evsd;
 }
 
 /* set sustain level & release rate */
 static inline void set_sl_rr(FM_OPL *OPL,int slot,int v)
 {
-	OPL_CH   *CH   = &OPL->P_CH[slot/2];
-	OPL_SLOT *SLOT = &CH->SLOT[slot&1];
-	int sl = v>>4;
-	int rr = v & 0x0f;
-
-	SLOT->SL = SL_TABLE[sl];
-	if( SLOT->evm == ENV_MOD_DR ) SLOT->eve = SLOT->SL;
-	SLOT->RR = &OPL->DR_TABLE[rr<<2];
-	SLOT->evsr = SLOT->RR[SLOT->ksr];
-	if( SLOT->evm == ENV_MOD_RR ) SLOT->evs = SLOT->evsr;
+    OPL_CH   *CH   = &OPL->P_CH[slot/2];
+    OPL_SLOT *SLOT = &CH->SLOT[slot&1];
+    int sl = v>>4;
+    int rr = v & 0x0f;
+
+    SLOT->SL = SL_TABLE[sl];
+    if( SLOT->evm == ENV_MOD_DR ) SLOT->eve = SLOT->SL;
+    SLOT->RR = &OPL->DR_TABLE[rr<<2];
+    SLOT->evsr = SLOT->RR[SLOT->ksr];
+    if( SLOT->evm == ENV_MOD_RR ) SLOT->evs = SLOT->evsr;
 }
 
 /* operator output calcrator */
@@ -442,693 +442,693 @@ static inline void set_sl_rr(FM_OPL *OPL,int slot,int v)
 /* ---------- calcrate one of channel ---------- */
 static inline void OPL_CALC_CH( OPL_CH *CH )
 {
-	uint32_t env_out;
-	OPL_SLOT *SLOT;
-
-	feedback2 = 0;
-	/* SLOT 1 */
-	SLOT = &CH->SLOT[SLOT1];
-	env_out=OPL_CALC_SLOT(SLOT);
-	if( env_out < EG_ENT-1 )
-	{
-		/* PG */
-		if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
-		else          SLOT->Cnt += SLOT->Incr;
-		/* connectoion */
-		if(CH->FB)
-		{
-			int feedback1 = (CH->op1_out[0]+CH->op1_out[1])>>CH->FB;
-			CH->op1_out[1] = CH->op1_out[0];
-			*CH->connect1 += CH->op1_out[0] = OP_OUT(SLOT,env_out,feedback1);
-		}
-		else
-		{
-			*CH->connect1 += OP_OUT(SLOT,env_out,0);
-		}
-	}else
-	{
-		CH->op1_out[1] = CH->op1_out[0];
-		CH->op1_out[0] = 0;
-	}
-	/* SLOT 2 */
-	SLOT = &CH->SLOT[SLOT2];
-	env_out=OPL_CALC_SLOT(SLOT);
-	if( env_out < EG_ENT-1 )
-	{
-		/* PG */
-		if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
-		else          SLOT->Cnt += SLOT->Incr;
-		/* connectoion */
-		outd[0] += OP_OUT(SLOT,env_out, feedback2);
-	}
+    uint32_t env_out;
+    OPL_SLOT *SLOT;
+
+    feedback2 = 0;
+    /* SLOT 1 */
+    SLOT = &CH->SLOT[SLOT1];
+    env_out=OPL_CALC_SLOT(SLOT);
+    if( env_out < EG_ENT-1 )
+    {
+        /* PG */
+        if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
+        else          SLOT->Cnt += SLOT->Incr;
+        /* connectoion */
+        if(CH->FB)
+        {
+            int feedback1 = (CH->op1_out[0]+CH->op1_out[1])>>CH->FB;
+            CH->op1_out[1] = CH->op1_out[0];
+            *CH->connect1 += CH->op1_out[0] = OP_OUT(SLOT,env_out,feedback1);
+        }
+        else
+        {
+            *CH->connect1 += OP_OUT(SLOT,env_out,0);
+        }
+    }else
+    {
+        CH->op1_out[1] = CH->op1_out[0];
+        CH->op1_out[0] = 0;
+    }
+    /* SLOT 2 */
+    SLOT = &CH->SLOT[SLOT2];
+    env_out=OPL_CALC_SLOT(SLOT);
+    if( env_out < EG_ENT-1 )
+    {
+        /* PG */
+        if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
+        else          SLOT->Cnt += SLOT->Incr;
+        /* connectoion */
+        outd[0] += OP_OUT(SLOT,env_out, feedback2);
+    }
 }
 
 /* ---------- calcrate rhythm block ---------- */
 #define WHITE_NOISE_db 6.0
 static inline void OPL_CALC_RH( OPL_CH *CH )
 {
-	uint32_t env_tam,env_sd,env_top,env_hh;
-	int whitenoise = (rand()&1)*(WHITE_NOISE_db/EG_STEP);
-	int32_t tone8;
-
-	OPL_SLOT *SLOT;
-	int env_out;
-
-	/* BD : same as FM serial mode and output level is large */
-	feedback2 = 0;
-	/* SLOT 1 */
-	SLOT = &CH[6].SLOT[SLOT1];
-	env_out=OPL_CALC_SLOT(SLOT);
-	if( env_out < EG_ENT-1 )
-	{
-		/* PG */
-		if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
-		else          SLOT->Cnt += SLOT->Incr;
-		/* connectoion */
-		if(CH[6].FB)
-		{
-			int feedback1 = (CH[6].op1_out[0]+CH[6].op1_out[1])>>CH[6].FB;
-			CH[6].op1_out[1] = CH[6].op1_out[0];
-			feedback2 = CH[6].op1_out[0] = OP_OUT(SLOT,env_out,feedback1);
-		}
-		else
-		{
-			feedback2 = OP_OUT(SLOT,env_out,0);
-		}
-	}else
-	{
-		feedback2 = 0;
-		CH[6].op1_out[1] = CH[6].op1_out[0];
-		CH[6].op1_out[0] = 0;
-	}
-	/* SLOT 2 */
-	SLOT = &CH[6].SLOT[SLOT2];
-	env_out=OPL_CALC_SLOT(SLOT);
-	if( env_out < EG_ENT-1 )
-	{
-		/* PG */
-		if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
-		else          SLOT->Cnt += SLOT->Incr;
-		/* connectoion */
-		outd[0] += OP_OUT(SLOT,env_out, feedback2)*2;
-	}
-
-	// SD  (17) = mul14[fnum7] + white noise
-	// TAM (15) = mul15[fnum8]
-	// TOP (18) = fnum6(mul18[fnum8]+whitenoise)
-	// HH  (14) = fnum7(mul18[fnum8]+whitenoise) + white noise
-	env_sd =OPL_CALC_SLOT(SLOT7_2) + whitenoise;
-	env_tam=OPL_CALC_SLOT(SLOT8_1);
-	env_top=OPL_CALC_SLOT(SLOT8_2);
-	env_hh =OPL_CALC_SLOT(SLOT7_1) + whitenoise;
-
-	/* PG */
-	if(SLOT7_1->vib) SLOT7_1->Cnt += (2*SLOT7_1->Incr*vib/VIB_RATE);
-	else             SLOT7_1->Cnt += 2*SLOT7_1->Incr;
-	if(SLOT7_2->vib) SLOT7_2->Cnt += ((CH[7].fc*8)*vib/VIB_RATE);
-	else             SLOT7_2->Cnt += (CH[7].fc*8);
-	if(SLOT8_1->vib) SLOT8_1->Cnt += (SLOT8_1->Incr*vib/VIB_RATE);
-	else             SLOT8_1->Cnt += SLOT8_1->Incr;
-	if(SLOT8_2->vib) SLOT8_2->Cnt += ((CH[8].fc*48)*vib/VIB_RATE);
-	else             SLOT8_2->Cnt += (CH[8].fc*48);
-
-	tone8 = OP_OUT(SLOT8_2,whitenoise,0 );
-
-	/* SD */
-	if( env_sd < EG_ENT-1 )
-		outd[0] += OP_OUT(SLOT7_1,env_sd, 0)*8;
-	/* TAM */
-	if( env_tam < EG_ENT-1 )
-		outd[0] += OP_OUT(SLOT8_1,env_tam, 0)*2;
-	/* TOP-CY */
-	if( env_top < EG_ENT-1 )
-		outd[0] += OP_OUT(SLOT7_2,env_top,tone8)*2;
-	/* HH */
-	if( env_hh  < EG_ENT-1 )
-		outd[0] += OP_OUT(SLOT7_2,env_hh,tone8)*2;
+    uint32_t env_tam,env_sd,env_top,env_hh;
+    int whitenoise = (rand()&1)*(WHITE_NOISE_db/EG_STEP);
+    int32_t tone8;
+
+    OPL_SLOT *SLOT;
+    int env_out;
+
+    /* BD : same as FM serial mode and output level is large */
+    feedback2 = 0;
+    /* SLOT 1 */
+    SLOT = &CH[6].SLOT[SLOT1];
+    env_out=OPL_CALC_SLOT(SLOT);
+    if( env_out < EG_ENT-1 )
+    {
+        /* PG */
+        if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
+        else          SLOT->Cnt += SLOT->Incr;
+        /* connectoion */
+        if(CH[6].FB)
+        {
+            int feedback1 = (CH[6].op1_out[0]+CH[6].op1_out[1])>>CH[6].FB;
+            CH[6].op1_out[1] = CH[6].op1_out[0];
+            feedback2 = CH[6].op1_out[0] = OP_OUT(SLOT,env_out,feedback1);
+        }
+        else
+        {
+            feedback2 = OP_OUT(SLOT,env_out,0);
+        }
+    }else
+    {
+        feedback2 = 0;
+        CH[6].op1_out[1] = CH[6].op1_out[0];
+        CH[6].op1_out[0] = 0;
+    }
+    /* SLOT 2 */
+    SLOT = &CH[6].SLOT[SLOT2];
+    env_out=OPL_CALC_SLOT(SLOT);
+    if( env_out < EG_ENT-1 )
+    {
+        /* PG */
+        if(SLOT->vib) SLOT->Cnt += (SLOT->Incr*vib/VIB_RATE);
+        else          SLOT->Cnt += SLOT->Incr;
+        /* connectoion */
+        outd[0] += OP_OUT(SLOT,env_out, feedback2)*2;
+    }
+
+    // SD  (17) = mul14[fnum7] + white noise
+    // TAM (15) = mul15[fnum8]
+    // TOP (18) = fnum6(mul18[fnum8]+whitenoise)
+    // HH  (14) = fnum7(mul18[fnum8]+whitenoise) + white noise
+    env_sd =OPL_CALC_SLOT(SLOT7_2) + whitenoise;
+    env_tam=OPL_CALC_SLOT(SLOT8_1);
+    env_top=OPL_CALC_SLOT(SLOT8_2);
+    env_hh =OPL_CALC_SLOT(SLOT7_1) + whitenoise;
+
+    /* PG */
+    if(SLOT7_1->vib) SLOT7_1->Cnt += (2*SLOT7_1->Incr*vib/VIB_RATE);
+    else             SLOT7_1->Cnt += 2*SLOT7_1->Incr;
+    if(SLOT7_2->vib) SLOT7_2->Cnt += ((CH[7].fc*8)*vib/VIB_RATE);
+    else             SLOT7_2->Cnt += (CH[7].fc*8);
+    if(SLOT8_1->vib) SLOT8_1->Cnt += (SLOT8_1->Incr*vib/VIB_RATE);
+    else             SLOT8_1->Cnt += SLOT8_1->Incr;
+    if(SLOT8_2->vib) SLOT8_2->Cnt += ((CH[8].fc*48)*vib/VIB_RATE);
+    else             SLOT8_2->Cnt += (CH[8].fc*48);
+
+    tone8 = OP_OUT(SLOT8_2,whitenoise,0 );
+
+    /* SD */
+    if( env_sd < EG_ENT-1 )
+        outd[0] += OP_OUT(SLOT7_1,env_sd, 0)*8;
+    /* TAM */
+    if( env_tam < EG_ENT-1 )
+        outd[0] += OP_OUT(SLOT8_1,env_tam, 0)*2;
+    /* TOP-CY */
+    if( env_top < EG_ENT-1 )
+        outd[0] += OP_OUT(SLOT7_2,env_top,tone8)*2;
+    /* HH */
+    if( env_hh  < EG_ENT-1 )
+        outd[0] += OP_OUT(SLOT7_2,env_hh,tone8)*2;
 }
 
 /* ----------- initialize time tabls ----------- */
 static void init_timetables( FM_OPL *OPL , int ARRATE , int DRRATE )
 {
-	int i;
-	double rate;
-
-	/* make attack rate & decay rate tables */
-	for (i = 0;i < 4;i++) OPL->AR_TABLE[i] = OPL->DR_TABLE[i] = 0;
-	for (i = 4;i <= 60;i++){
-		rate  = OPL->freqbase;						/* frequency rate */
-		if( i < 60 ) rate *= 1.0+(i&3)*0.25;		/* b0-1 : x1 , x1.25 , x1.5 , x1.75 */
-		rate *= 1<<((i>>2)-1);						/* b2-5 : shift bit */
-		rate *= (double)(EG_ENT<<ENV_BITS);
-		OPL->AR_TABLE[i] = rate / ARRATE;
-		OPL->DR_TABLE[i] = rate / DRRATE;
-	}
-	for (i = 60; i < ARRAY_SIZE(OPL->AR_TABLE); i++)
-	{
-		OPL->AR_TABLE[i] = EG_AED-1;
-		OPL->DR_TABLE[i] = OPL->DR_TABLE[60];
-	}
+    int i;
+    double rate;
+
+    /* make attack rate & decay rate tables */
+    for (i = 0;i < 4;i++) OPL->AR_TABLE[i] = OPL->DR_TABLE[i] = 0;
+    for (i = 4;i <= 60;i++){
+        rate  = OPL->freqbase;                        /* frequency rate */
+        if( i < 60 ) rate *= 1.0+(i&3)*0.25;        /* b0-1 : x1 , x1.25 , x1.5 , x1.75 */
+        rate *= 1<<((i>>2)-1);                        /* b2-5 : shift bit */
+        rate *= (double)(EG_ENT<<ENV_BITS);
+        OPL->AR_TABLE[i] = rate / ARRATE;
+        OPL->DR_TABLE[i] = rate / DRRATE;
+    }
+    for (i = 60; i < ARRAY_SIZE(OPL->AR_TABLE); i++)
+    {
+        OPL->AR_TABLE[i] = EG_AED-1;
+        OPL->DR_TABLE[i] = OPL->DR_TABLE[60];
+    }
 #if 0
-	for (i = 0;i < 64 ;i++){	/* make for overflow area */
-		LOG(LOG_WAR, ("rate %2d , ar %f ms , dr %f ms\n", i,
-			((double)(EG_ENT<<ENV_BITS) / OPL->AR_TABLE[i]) * (1000.0 / OPL->rate),
-			((double)(EG_ENT<<ENV_BITS) / OPL->DR_TABLE[i]) * (1000.0 / OPL->rate) ));
-	}
+    for (i = 0;i < 64 ;i++){    /* make for overflow area */
+        LOG(LOG_WAR, ("rate %2d , ar %f ms , dr %f ms\n", i,
+            ((double)(EG_ENT<<ENV_BITS) / OPL->AR_TABLE[i]) * (1000.0 / OPL->rate),
+            ((double)(EG_ENT<<ENV_BITS) / OPL->DR_TABLE[i]) * (1000.0 / OPL->rate) ));
+    }
 #endif
 }
 
 /* ---------- generic table initialize ---------- */
 static int OPLOpenTable( void )
 {
-	int s,t;
-	double rate;
-	int i,j;
-	double pom;
-
-	/* allocate dynamic tables */
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
+    int s,t;
+    double rate;
+    int i,j;
+    double pom;
+
+    /* allocate dynamic tables */
+    if( (TL_TABLE = malloc(TL_MAX*2*sizeof(int32_t))) == NULL)
+        return 0;
+    if( (SIN_TABLE = malloc(SIN_ENT*4 *sizeof(int32_t *))) == NULL)
+    {
+        free(TL_TABLE);
+        return 0;
+    }
+    if( (AMS_TABLE = malloc(AMS_ENT*2 *sizeof(int32_t))) == NULL)
+    {
+        free(TL_TABLE);
+        free(SIN_TABLE);
+        return 0;
+    }
+    if( (VIB_TABLE = malloc(VIB_ENT*2 *sizeof(int32_t))) == NULL)
+    {
+        free(TL_TABLE);
+        free(SIN_TABLE);
+        free(AMS_TABLE);
+        return 0;
+    }
     ENV_CURVE = g_new(int32_t, 2 * EG_ENT + 1);
-	/* make total level table */
-	for (t = 0;t < EG_ENT-1 ;t++){
-		rate = ((1<<TL_BITS)-1)/pow(10,EG_STEP*t/20);	/* dB -> voltage */
-		TL_TABLE[       t] =  (int)rate;
-		TL_TABLE[TL_MAX+t] = -TL_TABLE[t];
-/*		LOG(LOG_INF,("TotalLevel(%3d) = %x\n",t,TL_TABLE[t]));*/
-	}
-	/* fill volume off area */
-	for ( t = EG_ENT-1; t < TL_MAX ;t++){
-		TL_TABLE[t] = TL_TABLE[TL_MAX+t] = 0;
-	}
-
-	/* make sinwave table (total level offet) */
-	/* degree 0 = degree 180                   = off */
-	SIN_TABLE[0] = SIN_TABLE[SIN_ENT/2]         = &TL_TABLE[EG_ENT-1];
-	for (s = 1;s <= SIN_ENT/4;s++){
-		pom = sin(2*PI*s/SIN_ENT); /* sin     */
-		pom = 20*log10(1/pom);	   /* decibel */
-		j = pom / EG_STEP;         /* TL_TABLE steps */
+    /* make total level table */
+    for (t = 0;t < EG_ENT-1 ;t++){
+        rate = ((1<<TL_BITS)-1)/pow(10,EG_STEP*t/20);    /* dB -> voltage */
+        TL_TABLE[       t] =  (int)rate;
+        TL_TABLE[TL_MAX+t] = -TL_TABLE[t];
+/*        LOG(LOG_INF,("TotalLevel(%3d) = %x\n",t,TL_TABLE[t]));*/
+    }
+    /* fill volume off area */
+    for ( t = EG_ENT-1; t < TL_MAX ;t++){
+        TL_TABLE[t] = TL_TABLE[TL_MAX+t] = 0;
+    }
+
+    /* make sinwave table (total level offet) */
+    /* degree 0 = degree 180                   = off */
+    SIN_TABLE[0] = SIN_TABLE[SIN_ENT/2]         = &TL_TABLE[EG_ENT-1];
+    for (s = 1;s <= SIN_ENT/4;s++){
+        pom = sin(2*PI*s/SIN_ENT); /* sin     */
+        pom = 20*log10(1/pom);       /* decibel */
+        j = pom / EG_STEP;         /* TL_TABLE steps */
 
         /* degree 0   -  90    , degree 180 -  90 : plus section */
-		SIN_TABLE[          s] = SIN_TABLE[SIN_ENT/2-s] = &TL_TABLE[j];
+        SIN_TABLE[          s] = SIN_TABLE[SIN_ENT/2-s] = &TL_TABLE[j];
         /* degree 180 - 270    , degree 360 - 270 : minus section */
-		SIN_TABLE[SIN_ENT/2+s] = SIN_TABLE[SIN_ENT  -s] = &TL_TABLE[TL_MAX+j];
-/*		LOG(LOG_INF,("sin(%3d) = %f:%f db\n",s,pom,(double)j * EG_STEP));*/
-	}
-	for (s = 0;s < SIN_ENT;s++)
-	{
-		SIN_TABLE[SIN_ENT*1+s] = s<(SIN_ENT/2) ? SIN_TABLE[s] : &TL_TABLE[EG_ENT];
-		SIN_TABLE[SIN_ENT*2+s] = SIN_TABLE[s % (SIN_ENT/2)];
-		SIN_TABLE[SIN_ENT*3+s] = (s/(SIN_ENT/4))&1 ? &TL_TABLE[EG_ENT] : SIN_TABLE[SIN_ENT*2+s];
-	}
-
-	/* envelope counter -> envelope output table */
-	for (i=0; i<EG_ENT; i++)
-	{
-		/* ATTACK curve */
-		pom = pow( ((double)(EG_ENT-1-i)/EG_ENT) , 8 ) * EG_ENT;
-		/* if( pom >= EG_ENT ) pom = EG_ENT-1; */
-		ENV_CURVE[i] = (int)pom;
-		/* DECAY ,RELEASE curve */
-		ENV_CURVE[(EG_DST>>ENV_BITS)+i]= i;
-	}
-	/* off */
-	ENV_CURVE[EG_OFF>>ENV_BITS]= EG_ENT-1;
-	/* make LFO ams table */
-	for (i=0; i<AMS_ENT; i++)
-	{
-		pom = (1.0+sin(2*PI*i/AMS_ENT))/2; /* sin */
-		AMS_TABLE[i]         = (1.0/EG_STEP)*pom; /* 1dB   */
-		AMS_TABLE[AMS_ENT+i] = (4.8/EG_STEP)*pom; /* 4.8dB */
-	}
-	/* make LFO vibrate table */
-	for (i=0; i<VIB_ENT; i++)
-	{
-		/* 100cent = 1seminote = 6% ?? */
-		pom = (double)VIB_RATE*0.06*sin(2*PI*i/VIB_ENT); /* +-100sect step */
-		VIB_TABLE[i]         = VIB_RATE + (pom*0.07); /* +- 7cent */
-		VIB_TABLE[VIB_ENT+i] = VIB_RATE + (pom*0.14); /* +-14cent */
-		/* LOG(LOG_INF,("vib %d=%d\n",i,VIB_TABLE[VIB_ENT+i])); */
-	}
-	return 1;
+        SIN_TABLE[SIN_ENT/2+s] = SIN_TABLE[SIN_ENT  -s] = &TL_TABLE[TL_MAX+j];
+/*        LOG(LOG_INF,("sin(%3d) = %f:%f db\n",s,pom,(double)j * EG_STEP));*/
+    }
+    for (s = 0;s < SIN_ENT;s++)
+    {
+        SIN_TABLE[SIN_ENT*1+s] = s<(SIN_ENT/2) ? SIN_TABLE[s] : &TL_TABLE[EG_ENT];
+        SIN_TABLE[SIN_ENT*2+s] = SIN_TABLE[s % (SIN_ENT/2)];
+        SIN_TABLE[SIN_ENT*3+s] = (s/(SIN_ENT/4))&1 ? &TL_TABLE[EG_ENT] : SIN_TABLE[SIN_ENT*2+s];
+    }
+
+    /* envelope counter -> envelope output table */
+    for (i=0; i<EG_ENT; i++)
+    {
+        /* ATTACK curve */
+        pom = pow( ((double)(EG_ENT-1-i)/EG_ENT) , 8 ) * EG_ENT;
+        /* if( pom >= EG_ENT ) pom = EG_ENT-1; */
+        ENV_CURVE[i] = (int)pom;
+        /* DECAY ,RELEASE curve */
+        ENV_CURVE[(EG_DST>>ENV_BITS)+i]= i;
+    }
+    /* off */
+    ENV_CURVE[EG_OFF>>ENV_BITS]= EG_ENT-1;
+    /* make LFO ams table */
+    for (i=0; i<AMS_ENT; i++)
+    {
+        pom = (1.0+sin(2*PI*i/AMS_ENT))/2; /* sin */
+        AMS_TABLE[i]         = (1.0/EG_STEP)*pom; /* 1dB   */
+        AMS_TABLE[AMS_ENT+i] = (4.8/EG_STEP)*pom; /* 4.8dB */
+    }
+    /* make LFO vibrate table */
+    for (i=0; i<VIB_ENT; i++)
+    {
+        /* 100cent = 1seminote = 6% ?? */
+        pom = (double)VIB_RATE*0.06*sin(2*PI*i/VIB_ENT); /* +-100sect step */
+        VIB_TABLE[i]         = VIB_RATE + (pom*0.07); /* +- 7cent */
+        VIB_TABLE[VIB_ENT+i] = VIB_RATE + (pom*0.14); /* +-14cent */
+        /* LOG(LOG_INF,("vib %d=%d\n",i,VIB_TABLE[VIB_ENT+i])); */
+    }
+    return 1;
 }
 
 
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
 static inline void CSMKeyControll(OPL_CH *CH)
 {
-	OPL_SLOT *slot1 = &CH->SLOT[SLOT1];
-	OPL_SLOT *slot2 = &CH->SLOT[SLOT2];
-	/* all key off */
-	OPL_KEYOFF(slot1);
-	OPL_KEYOFF(slot2);
-	/* total level latch */
-	slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
-	slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
-	/* key on */
-	CH->op1_out[0] = CH->op1_out[1] = 0;
-	OPL_KEYON(slot1);
-	OPL_KEYON(slot2);
+    OPL_SLOT *slot1 = &CH->SLOT[SLOT1];
+    OPL_SLOT *slot2 = &CH->SLOT[SLOT2];
+    /* all key off */
+    OPL_KEYOFF(slot1);
+    OPL_KEYOFF(slot2);
+    /* total level latch */
+    slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
+    slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
+    /* key on */
+    CH->op1_out[0] = CH->op1_out[1] = 0;
+    OPL_KEYON(slot1);
+    OPL_KEYON(slot2);
 }
 
 /* ---------- opl initialize ---------- */
 static void OPL_initialize(FM_OPL *OPL)
 {
-	int fn;
-
-	/* frequency base */
-	OPL->freqbase = (OPL->rate) ? ((double)OPL->clock / OPL->rate) / 72  : 0;
-	/* Timer base time */
-	OPL->TimerBase = 1.0/((double)OPL->clock / 72.0 );
-	/* make time tables */
-	init_timetables( OPL , OPL_ARRATE , OPL_DRRATE );
-	/* make fnumber -> increment counter table */
-	for( fn=0 ; fn < 1024 ; fn++ )
-	{
-		OPL->FN_TABLE[fn] = OPL->freqbase * fn * FREQ_RATE * (1<<7) / 2;
-	}
-	/* LFO freq.table */
-	OPL->amsIncr = OPL->rate ? (double)AMS_ENT*(1<<AMS_SHIFT) / OPL->rate * 3.7 * ((double)OPL->clock/3600000) : 0;
-	OPL->vibIncr = OPL->rate ? (double)VIB_ENT*(1<<VIB_SHIFT) / OPL->rate * 6.4 * ((double)OPL->clock/3600000) : 0;
+    int fn;
+
+    /* frequency base */
+    OPL->freqbase = (OPL->rate) ? ((double)OPL->clock / OPL->rate) / 72  : 0;
+    /* Timer base time */
+    OPL->TimerBase = 1.0/((double)OPL->clock / 72.0 );
+    /* make time tables */
+    init_timetables( OPL , OPL_ARRATE , OPL_DRRATE );
+    /* make fnumber -> increment counter table */
+    for( fn=0 ; fn < 1024 ; fn++ )
+    {
+        OPL->FN_TABLE[fn] = OPL->freqbase * fn * FREQ_RATE * (1<<7) / 2;
+    }
+    /* LFO freq.table */
+    OPL->amsIncr = OPL->rate ? (double)AMS_ENT*(1<<AMS_SHIFT) / OPL->rate * 3.7 * ((double)OPL->clock/3600000) : 0;
+    OPL->vibIncr = OPL->rate ? (double)VIB_ENT*(1<<VIB_SHIFT) / OPL->rate * 6.4 * ((double)OPL->clock/3600000) : 0;
 }
 
 /* ---------- write a OPL registers ---------- */
 static void OPLWriteReg(FM_OPL *OPL, int r, int v)
 {
-	OPL_CH *CH;
-	int slot;
-	int block_fnum;
-
-	switch(r&0xe0)
-	{
-	case 0x00: /* 00-1f:control */
-		switch(r&0x1f)
-		{
-		case 0x01:
-			/* wave selector enable */
-			OPL->wavesel = v&0x20;
+    OPL_CH *CH;
+    int slot;
+    int block_fnum;
+
+    switch(r&0xe0)
+    {
+    case 0x00: /* 00-1f:control */
+        switch(r&0x1f)
+        {
+        case 0x01:
+            /* wave selector enable */
+            OPL->wavesel = v&0x20;
                         if(!OPL->wavesel)
-			{
-				/* preset compatible mode */
-				int c;
-				for(c=0;c<OPL->max_ch;c++)
-				{
-					OPL->P_CH[c].SLOT[SLOT1].wavetable = &SIN_TABLE[0];
-					OPL->P_CH[c].SLOT[SLOT2].wavetable = &SIN_TABLE[0];
-				}
-			}
-			return;
-		case 0x02:	/* Timer 1 */
-			OPL->T[0] = (256-v)*4;
-			break;
-		case 0x03:	/* Timer 2 */
-			OPL->T[1] = (256-v)*16;
-			return;
-		case 0x04:	/* IRQ clear / mask and Timer enable */
-			if(v&0x80)
-			{	/* IRQ flag clear */
-				OPL_STATUS_RESET(OPL,0x7f);
-			}
-			else
-			{	/* set IRQ mask ,timer enable*/
-				uint8_t st1 = v&1;
-				uint8_t st2 = (v>>1)&1;
-				/* IRQRST,T1MSK,t2MSK,EOSMSK,BRMSK,x,ST2,ST1 */
-				OPL_STATUS_RESET(OPL,v&0x78);
-				OPL_STATUSMASK_SET(OPL,((~v)&0x78)|0x01);
-				/* timer 2 */
-				if(OPL->st[1] != st2)
-				{
-					double interval = st2 ? (double)OPL->T[1]*OPL->TimerBase : 0.0;
-					OPL->st[1] = st2;
+            {
+                /* preset compatible mode */
+                int c;
+                for(c=0;c<OPL->max_ch;c++)
+                {
+                    OPL->P_CH[c].SLOT[SLOT1].wavetable = &SIN_TABLE[0];
+                    OPL->P_CH[c].SLOT[SLOT2].wavetable = &SIN_TABLE[0];
+                }
+            }
+            return;
+        case 0x02:    /* Timer 1 */
+            OPL->T[0] = (256-v)*4;
+            break;
+        case 0x03:    /* Timer 2 */
+            OPL->T[1] = (256-v)*16;
+            return;
+        case 0x04:    /* IRQ clear / mask and Timer enable */
+            if(v&0x80)
+            {    /* IRQ flag clear */
+                OPL_STATUS_RESET(OPL,0x7f);
+            }
+            else
+            {    /* set IRQ mask ,timer enable*/
+                uint8_t st1 = v&1;
+                uint8_t st2 = (v>>1)&1;
+                /* IRQRST,T1MSK,t2MSK,EOSMSK,BRMSK,x,ST2,ST1 */
+                OPL_STATUS_RESET(OPL,v&0x78);
+                OPL_STATUSMASK_SET(OPL,((~v)&0x78)|0x01);
+                /* timer 2 */
+                if(OPL->st[1] != st2)
+                {
+                    double interval = st2 ? (double)OPL->T[1]*OPL->TimerBase : 0.0;
+                    OPL->st[1] = st2;
                     if (OPL->TimerHandler) {
                         (OPL->TimerHandler)(OPL->TimerParam, 1, interval);
                     }
-				}
-				/* timer 1 */
-				if(OPL->st[0] != st1)
-				{
-					double interval = st1 ? (double)OPL->T[0]*OPL->TimerBase : 0.0;
-					OPL->st[0] = st1;
+                }
+                /* timer 1 */
+                if(OPL->st[0] != st1)
+                {
+                    double interval = st1 ? (double)OPL->T[0]*OPL->TimerBase : 0.0;
+                    OPL->st[0] = st1;
                     if (OPL->TimerHandler) {
                         (OPL->TimerHandler)(OPL->TimerParam, 0, interval);
                     }
-				}
-			}
-			return;
-		}
-		break;
-	case 0x20:	/* am,vib,ksr,eg type,mul */
-		slot = slot_array[r&0x1f];
-		if(slot == -1) return;
-		set_mul(OPL,slot,v);
-		return;
-	case 0x40:
-		slot = slot_array[r&0x1f];
-		if(slot == -1) return;
-		set_ksl_tl(OPL,slot,v);
-		return;
-	case 0x60:
-		slot = slot_array[r&0x1f];
-		if(slot == -1) return;
-		set_ar_dr(OPL,slot,v);
-		return;
-	case 0x80:
-		slot = slot_array[r&0x1f];
-		if(slot == -1) return;
-		set_sl_rr(OPL,slot,v);
-		return;
-	case 0xa0:
-		switch(r)
-		{
-		case 0xbd:
-			/* amsep,vibdep,r,bd,sd,tom,tc,hh */
-			{
-			uint8_t rkey = OPL->rhythm^v;
-			OPL->ams_table = &AMS_TABLE[v&0x80 ? AMS_ENT : 0];
-			OPL->vib_table = &VIB_TABLE[v&0x40 ? VIB_ENT : 0];
-			OPL->rhythm  = v&0x3f;
-			if(OPL->rhythm&0x20)
-			{
+                }
+            }
+            return;
+        }
+        break;
+    case 0x20:    /* am,vib,ksr,eg type,mul */
+        slot = slot_array[r&0x1f];
+        if(slot == -1) return;
+        set_mul(OPL,slot,v);
+        return;
+    case 0x40:
+        slot = slot_array[r&0x1f];
+        if(slot == -1) return;
+        set_ksl_tl(OPL,slot,v);
+        return;
+    case 0x60:
+        slot = slot_array[r&0x1f];
+        if(slot == -1) return;
+        set_ar_dr(OPL,slot,v);
+        return;
+    case 0x80:
+        slot = slot_array[r&0x1f];
+        if(slot == -1) return;
+        set_sl_rr(OPL,slot,v);
+        return;
+    case 0xa0:
+        switch(r)
+        {
+        case 0xbd:
+            /* amsep,vibdep,r,bd,sd,tom,tc,hh */
+            {
+            uint8_t rkey = OPL->rhythm^v;
+            OPL->ams_table = &AMS_TABLE[v&0x80 ? AMS_ENT : 0];
+            OPL->vib_table = &VIB_TABLE[v&0x40 ? VIB_ENT : 0];
+            OPL->rhythm  = v&0x3f;
+            if(OPL->rhythm&0x20)
+            {
 #if 0
-				usrintf_showmessage("OPL Rhythm mode select");
+                usrintf_showmessage("OPL Rhythm mode select");
 #endif
-				/* BD key on/off */
-				if(rkey&0x10)
-				{
-					if(v&0x10)
-					{
-						OPL->P_CH[6].op1_out[0] = OPL->P_CH[6].op1_out[1] = 0;
-						OPL_KEYON(&OPL->P_CH[6].SLOT[SLOT1]);
-						OPL_KEYON(&OPL->P_CH[6].SLOT[SLOT2]);
-					}
-					else
-					{
-						OPL_KEYOFF(&OPL->P_CH[6].SLOT[SLOT1]);
-						OPL_KEYOFF(&OPL->P_CH[6].SLOT[SLOT2]);
-					}
-				}
-				/* SD key on/off */
-				if(rkey&0x08)
-				{
-					if(v&0x08) OPL_KEYON(&OPL->P_CH[7].SLOT[SLOT2]);
-					else       OPL_KEYOFF(&OPL->P_CH[7].SLOT[SLOT2]);
-				}/* TAM key on/off */
-				if(rkey&0x04)
-				{
-					if(v&0x04) OPL_KEYON(&OPL->P_CH[8].SLOT[SLOT1]);
-					else       OPL_KEYOFF(&OPL->P_CH[8].SLOT[SLOT1]);
-				}
-				/* TOP-CY key on/off */
-				if(rkey&0x02)
-				{
-					if(v&0x02) OPL_KEYON(&OPL->P_CH[8].SLOT[SLOT2]);
-					else       OPL_KEYOFF(&OPL->P_CH[8].SLOT[SLOT2]);
-				}
-				/* HH key on/off */
-				if(rkey&0x01)
-				{
-					if(v&0x01) OPL_KEYON(&OPL->P_CH[7].SLOT[SLOT1]);
-					else       OPL_KEYOFF(&OPL->P_CH[7].SLOT[SLOT1]);
-				}
-			}
-			}
-			return;
-		}
-		/* keyon,block,fnum */
-		if( (r&0x0f) > 8) return;
-		CH = &OPL->P_CH[r&0x0f];
-		if(!(r&0x10))
-		{	/* a0-a8 */
-			block_fnum  = (CH->block_fnum&0x1f00) | v;
-		}
-		else
-		{	/* b0-b8 */
-			int keyon = (v>>5)&1;
-			block_fnum = ((v&0x1f)<<8) | (CH->block_fnum&0xff);
-			if(CH->keyon != keyon)
-			{
-				if( (CH->keyon=keyon) )
-				{
-					CH->op1_out[0] = CH->op1_out[1] = 0;
-					OPL_KEYON(&CH->SLOT[SLOT1]);
-					OPL_KEYON(&CH->SLOT[SLOT2]);
-				}
-				else
-				{
-					OPL_KEYOFF(&CH->SLOT[SLOT1]);
-					OPL_KEYOFF(&CH->SLOT[SLOT2]);
-				}
-			}
-		}
-		/* update */
-		if(CH->block_fnum != block_fnum)
-		{
-			int blockRv = 7-(block_fnum>>10);
-			int fnum   = block_fnum&0x3ff;
-			CH->block_fnum = block_fnum;
-
-			CH->ksl_base = KSL_TABLE[block_fnum>>6];
-			CH->fc = OPL->FN_TABLE[fnum]>>blockRv;
-			CH->kcode = CH->block_fnum>>9;
-			if( (OPL->mode&0x40) && CH->block_fnum&0x100) CH->kcode |=1;
-			CALC_FCSLOT(CH,&CH->SLOT[SLOT1]);
-			CALC_FCSLOT(CH,&CH->SLOT[SLOT2]);
-		}
-		return;
-	case 0xc0:
-		/* FB,C */
-		if( (r&0x0f) > 8) return;
-		CH = &OPL->P_CH[r&0x0f];
-		{
-		int feedback = (v>>1)&7;
-		CH->FB   = feedback ? (8+1) - feedback : 0;
-		CH->CON = v&1;
-		set_algorithm(CH);
-		}
-		return;
-	case 0xe0: /* wave type */
-		slot = slot_array[r&0x1f];
-		if(slot == -1) return;
-		CH = &OPL->P_CH[slot/2];
-		if(OPL->wavesel)
-		{
-			/* LOG(LOG_INF,("OPL SLOT %d wave select %d\n",slot,v&3)); */
-			CH->SLOT[slot&1].wavetable = &SIN_TABLE[(v&0x03)*SIN_ENT];
-		}
-		return;
-	}
+                /* BD key on/off */
+                if(rkey&0x10)
+                {
+                    if(v&0x10)
+                    {
+                        OPL->P_CH[6].op1_out[0] = OPL->P_CH[6].op1_out[1] = 0;
+                        OPL_KEYON(&OPL->P_CH[6].SLOT[SLOT1]);
+                        OPL_KEYON(&OPL->P_CH[6].SLOT[SLOT2]);
+                    }
+                    else
+                    {
+                        OPL_KEYOFF(&OPL->P_CH[6].SLOT[SLOT1]);
+                        OPL_KEYOFF(&OPL->P_CH[6].SLOT[SLOT2]);
+                    }
+                }
+                /* SD key on/off */
+                if(rkey&0x08)
+                {
+                    if(v&0x08) OPL_KEYON(&OPL->P_CH[7].SLOT[SLOT2]);
+                    else       OPL_KEYOFF(&OPL->P_CH[7].SLOT[SLOT2]);
+                }/* TAM key on/off */
+                if(rkey&0x04)
+                {
+                    if(v&0x04) OPL_KEYON(&OPL->P_CH[8].SLOT[SLOT1]);
+                    else       OPL_KEYOFF(&OPL->P_CH[8].SLOT[SLOT1]);
+                }
+                /* TOP-CY key on/off */
+                if(rkey&0x02)
+                {
+                    if(v&0x02) OPL_KEYON(&OPL->P_CH[8].SLOT[SLOT2]);
+                    else       OPL_KEYOFF(&OPL->P_CH[8].SLOT[SLOT2]);
+                }
+                /* HH key on/off */
+                if(rkey&0x01)
+                {
+                    if(v&0x01) OPL_KEYON(&OPL->P_CH[7].SLOT[SLOT1]);
+                    else       OPL_KEYOFF(&OPL->P_CH[7].SLOT[SLOT1]);
+                }
+            }
+            }
+            return;
+        }
+        /* keyon,block,fnum */
+        if( (r&0x0f) > 8) return;
+        CH = &OPL->P_CH[r&0x0f];
+        if(!(r&0x10))
+        {    /* a0-a8 */
+            block_fnum  = (CH->block_fnum&0x1f00) | v;
+        }
+        else
+        {    /* b0-b8 */
+            int keyon = (v>>5)&1;
+            block_fnum = ((v&0x1f)<<8) | (CH->block_fnum&0xff);
+            if(CH->keyon != keyon)
+            {
+                if( (CH->keyon=keyon) )
+                {
+                    CH->op1_out[0] = CH->op1_out[1] = 0;
+                    OPL_KEYON(&CH->SLOT[SLOT1]);
+                    OPL_KEYON(&CH->SLOT[SLOT2]);
+                }
+                else
+                {
+                    OPL_KEYOFF(&CH->SLOT[SLOT1]);
+                    OPL_KEYOFF(&CH->SLOT[SLOT2]);
+                }
+            }
+        }
+        /* update */
+        if(CH->block_fnum != block_fnum)
+        {
+            int blockRv = 7-(block_fnum>>10);
+            int fnum   = block_fnum&0x3ff;
+            CH->block_fnum = block_fnum;
+
+            CH->ksl_base = KSL_TABLE[block_fnum>>6];
+            CH->fc = OPL->FN_TABLE[fnum]>>blockRv;
+            CH->kcode = CH->block_fnum>>9;
+            if( (OPL->mode&0x40) && CH->block_fnum&0x100) CH->kcode |=1;
+            CALC_FCSLOT(CH,&CH->SLOT[SLOT1]);
+            CALC_FCSLOT(CH,&CH->SLOT[SLOT2]);
+        }
+        return;
+    case 0xc0:
+        /* FB,C */
+        if( (r&0x0f) > 8) return;
+        CH = &OPL->P_CH[r&0x0f];
+        {
+        int feedback = (v>>1)&7;
+        CH->FB   = feedback ? (8+1) - feedback : 0;
+        CH->CON = v&1;
+        set_algorithm(CH);
+        }
+        return;
+    case 0xe0: /* wave type */
+        slot = slot_array[r&0x1f];
+        if(slot == -1) return;
+        CH = &OPL->P_CH[slot/2];
+        if(OPL->wavesel)
+        {
+            /* LOG(LOG_INF,("OPL SLOT %d wave select %d\n",slot,v&3)); */
+            CH->SLOT[slot&1].wavetable = &SIN_TABLE[(v&0x03)*SIN_ENT];
+        }
+        return;
+    }
 }
 
 /* lock/unlock for common table */
 static int OPL_LockTable(void)
 {
-	num_lock++;
-	if(num_lock>1) return 0;
-	/* first time */
-	cur_chip = NULL;
-	/* allocate total level table (128kb space) */
-	if( !OPLOpenTable() )
-	{
-		num_lock--;
-		return -1;
-	}
-	return 0;
+    num_lock++;
+    if(num_lock>1) return 0;
+    /* first time */
+    cur_chip = NULL;
+    /* allocate total level table (128kb space) */
+    if( !OPLOpenTable() )
+    {
+        num_lock--;
+        return -1;
+    }
+    return 0;
 }
 
 static void OPL_UnLockTable(void)
 {
-	if(num_lock) num_lock--;
-	if(num_lock) return;
-	/* last time */
-	cur_chip = NULL;
-	OPLCloseTable();
+    if(num_lock) num_lock--;
+    if(num_lock) return;
+    /* last time */
+    cur_chip = NULL;
+    OPLCloseTable();
 }
 
 /*******************************************************************************/
-/*		YM3812 local section                                                   */
+/*        YM3812 local section                                                   */
 /*******************************************************************************/
 
 /* ---------- update one of chip ----------- */
 void YM3812UpdateOne(FM_OPL *OPL, int16_t *buffer, int length)
 {
     int i;
-	int data;
-	int16_t *buf = buffer;
-	uint32_t amsCnt  = OPL->amsCnt;
-	uint32_t  vibCnt  = OPL->vibCnt;
-	uint8_t rhythm = OPL->rhythm&0x20;
-	OPL_CH *CH,*R_CH;
-
-	if( (void *)OPL != cur_chip ){
-		cur_chip = (void *)OPL;
-		/* channel pointers */
-		S_CH = OPL->P_CH;
-		E_CH = &S_CH[9];
-		/* rhythm slot */
-		SLOT7_1 = &S_CH[7].SLOT[SLOT1];
-		SLOT7_2 = &S_CH[7].SLOT[SLOT2];
-		SLOT8_1 = &S_CH[8].SLOT[SLOT1];
-		SLOT8_2 = &S_CH[8].SLOT[SLOT2];
-		/* LFO state */
-		amsIncr = OPL->amsIncr;
-		vibIncr = OPL->vibIncr;
-		ams_table = OPL->ams_table;
-		vib_table = OPL->vib_table;
-	}
-	R_CH = rhythm ? &S_CH[6] : E_CH;
+    int data;
+    int16_t *buf = buffer;
+    uint32_t amsCnt  = OPL->amsCnt;
+    uint32_t  vibCnt  = OPL->vibCnt;
+    uint8_t rhythm = OPL->rhythm&0x20;
+    OPL_CH *CH,*R_CH;
+
+    if( (void *)OPL != cur_chip ){
+        cur_chip = (void *)OPL;
+        /* channel pointers */
+        S_CH = OPL->P_CH;
+        E_CH = &S_CH[9];
+        /* rhythm slot */
+        SLOT7_1 = &S_CH[7].SLOT[SLOT1];
+        SLOT7_2 = &S_CH[7].SLOT[SLOT2];
+        SLOT8_1 = &S_CH[8].SLOT[SLOT1];
+        SLOT8_2 = &S_CH[8].SLOT[SLOT2];
+        /* LFO state */
+        amsIncr = OPL->amsIncr;
+        vibIncr = OPL->vibIncr;
+        ams_table = OPL->ams_table;
+        vib_table = OPL->vib_table;
+    }
+    R_CH = rhythm ? &S_CH[6] : E_CH;
     for( i=0; i < length ; i++ )
-	{
-		/*            channel A         channel B         channel C      */
-		/* LFO */
-		ams = ams_table[(amsCnt+=amsIncr)>>AMS_SHIFT];
-		vib = vib_table[(vibCnt+=vibIncr)>>VIB_SHIFT];
-		outd[0] = 0;
-		/* FM part */
-		for(CH=S_CH ; CH < R_CH ; CH++)
-			OPL_CALC_CH(CH);
-		/* Rythn part */
-		if(rhythm)
-			OPL_CALC_RH(S_CH);
-		/* limit check */
-		data = Limit( outd[0] , OPL_MAXOUT, OPL_MINOUT );
-		/* store to sound buffer */
-		buf[i] = data >> OPL_OUTSB;
-	}
-
-	OPL->amsCnt = amsCnt;
-	OPL->vibCnt = vibCnt;
+    {
+        /*            channel A         channel B         channel C      */
+        /* LFO */
+        ams = ams_table[(amsCnt+=amsIncr)>>AMS_SHIFT];
+        vib = vib_table[(vibCnt+=vibIncr)>>VIB_SHIFT];
+        outd[0] = 0;
+        /* FM part */
+        for(CH=S_CH ; CH < R_CH ; CH++)
+            OPL_CALC_CH(CH);
+        /* Rythn part */
+        if(rhythm)
+            OPL_CALC_RH(S_CH);
+        /* limit check */
+        data = Limit( outd[0] , OPL_MAXOUT, OPL_MINOUT );
+        /* store to sound buffer */
+        buf[i] = data >> OPL_OUTSB;
+    }
+
+    OPL->amsCnt = amsCnt;
+    OPL->vibCnt = vibCnt;
 #ifdef OPL_OUTPUT_LOG
-	if(opl_dbg_fp)
-	{
-		for(opl_dbg_chip=0;opl_dbg_chip<opl_dbg_maxchip;opl_dbg_chip++)
-			if( opl_dbg_opl[opl_dbg_chip] == OPL) break;
-		fprintf(opl_dbg_fp,"%c%c%c",0x20+opl_dbg_chip,length&0xff,length/256);
-	}
+    if(opl_dbg_fp)
+    {
+        for(opl_dbg_chip=0;opl_dbg_chip<opl_dbg_maxchip;opl_dbg_chip++)
+            if( opl_dbg_opl[opl_dbg_chip] == OPL) break;
+        fprintf(opl_dbg_fp,"%c%c%c",0x20+opl_dbg_chip,length&0xff,length/256);
+    }
 #endif
 }
 
 /* ---------- reset one of chip ---------- */
 static void OPLResetChip(FM_OPL *OPL)
 {
-	int c,s;
-	int i;
-
-	/* reset chip */
-	OPL->mode   = 0;	/* normal mode */
-	OPL_STATUS_RESET(OPL,0x7f);
-	/* reset with register write */
-	OPLWriteReg(OPL,0x01,0); /* wabesel disable */
-	OPLWriteReg(OPL,0x02,0); /* Timer1 */
-	OPLWriteReg(OPL,0x03,0); /* Timer2 */
-	OPLWriteReg(OPL,0x04,0); /* IRQ mask clear */
-	for(i = 0xff ; i >= 0x20 ; i-- ) OPLWriteReg(OPL,i,0);
-	/* reset operator parameter */
-	for( c = 0 ; c < OPL->max_ch ; c++ )
-	{
-		OPL_CH *CH = &OPL->P_CH[c];
-		/* OPL->P_CH[c].PAN = OPN_CENTER; */
-		for(s = 0 ; s < 2 ; s++ )
-		{
-			/* wave table */
-			CH->SLOT[s].wavetable = &SIN_TABLE[0];
-			/* CH->SLOT[s].evm = ENV_MOD_RR; */
-			CH->SLOT[s].evc = EG_OFF;
-			CH->SLOT[s].eve = EG_OFF+1;
-			CH->SLOT[s].evs = 0;
-		}
-	}
+    int c,s;
+    int i;
+
+    /* reset chip */
+    OPL->mode   = 0;    /* normal mode */
+    OPL_STATUS_RESET(OPL,0x7f);
+    /* reset with register write */
+    OPLWriteReg(OPL,0x01,0); /* wabesel disable */
+    OPLWriteReg(OPL,0x02,0); /* Timer1 */
+    OPLWriteReg(OPL,0x03,0); /* Timer2 */
+    OPLWriteReg(OPL,0x04,0); /* IRQ mask clear */
+    for(i = 0xff ; i >= 0x20 ; i-- ) OPLWriteReg(OPL,i,0);
+    /* reset operator parameter */
+    for( c = 0 ; c < OPL->max_ch ; c++ )
+    {
+        OPL_CH *CH = &OPL->P_CH[c];
+        /* OPL->P_CH[c].PAN = OPN_CENTER; */
+        for(s = 0 ; s < 2 ; s++ )
+        {
+            /* wave table */
+            CH->SLOT[s].wavetable = &SIN_TABLE[0];
+            /* CH->SLOT[s].evm = ENV_MOD_RR; */
+            CH->SLOT[s].evc = EG_OFF;
+            CH->SLOT[s].eve = EG_OFF+1;
+            CH->SLOT[s].evs = 0;
+        }
+    }
 }
 
 /* ----------  Create one of virtual YM3812 ----------       */
 /* 'rate'  is sampling rate and 'bufsiz' is the size of the  */
 FM_OPL *OPLCreate(int clock, int rate)
 {
-	char *ptr;
-	FM_OPL *OPL;
-	int state_size;
-	int max_ch = 9; /* normaly 9 channels */
-
-	if( OPL_LockTable() ==-1) return NULL;
-	/* allocate OPL state space */
-	state_size  = sizeof(FM_OPL);
-	state_size += sizeof(OPL_CH)*max_ch;
-	/* allocate memory block */
-	ptr = malloc(state_size);
-	if(ptr==NULL) return NULL;
-	/* clear */
-	memset(ptr,0,state_size);
-	OPL        = (FM_OPL *)ptr; ptr+=sizeof(FM_OPL);
-	OPL->P_CH  = (OPL_CH *)ptr; ptr+=sizeof(OPL_CH)*max_ch;
-	/* set channel state pointer */
-	OPL->clock = clock;
-	OPL->rate  = rate;
-	OPL->max_ch = max_ch;
-	/* init grobal tables */
-	OPL_initialize(OPL);
-	/* reset chip */
-	OPLResetChip(OPL);
+    char *ptr;
+    FM_OPL *OPL;
+    int state_size;
+    int max_ch = 9; /* normaly 9 channels */
+
+    if( OPL_LockTable() ==-1) return NULL;
+    /* allocate OPL state space */
+    state_size  = sizeof(FM_OPL);
+    state_size += sizeof(OPL_CH)*max_ch;
+    /* allocate memory block */
+    ptr = malloc(state_size);
+    if(ptr==NULL) return NULL;
+    /* clear */
+    memset(ptr,0,state_size);
+    OPL        = (FM_OPL *)ptr; ptr+=sizeof(FM_OPL);
+    OPL->P_CH  = (OPL_CH *)ptr; ptr+=sizeof(OPL_CH)*max_ch;
+    /* set channel state pointer */
+    OPL->clock = clock;
+    OPL->rate  = rate;
+    OPL->max_ch = max_ch;
+    /* init grobal tables */
+    OPL_initialize(OPL);
+    /* reset chip */
+    OPLResetChip(OPL);
 #ifdef OPL_OUTPUT_LOG
-	if(!opl_dbg_fp)
-	{
-		opl_dbg_fp = fopen("opllog.opl","wb");
-		opl_dbg_maxchip = 0;
-	}
-	if(opl_dbg_fp)
-	{
-		opl_dbg_opl[opl_dbg_maxchip] = OPL;
-		fprintf(opl_dbg_fp,"%c%c%c%c%c%c",0x00+opl_dbg_maxchip,
-			type,
-			clock&0xff,
-			(clock/0x100)&0xff,
-			(clock/0x10000)&0xff,
-			(clock/0x1000000)&0xff);
-		opl_dbg_maxchip++;
-	}
+    if(!opl_dbg_fp)
+    {
+        opl_dbg_fp = fopen("opllog.opl","wb");
+        opl_dbg_maxchip = 0;
+    }
+    if(opl_dbg_fp)
+    {
+        opl_dbg_opl[opl_dbg_maxchip] = OPL;
+        fprintf(opl_dbg_fp,"%c%c%c%c%c%c",0x00+opl_dbg_maxchip,
+            type,
+            clock&0xff,
+            (clock/0x100)&0xff,
+            (clock/0x10000)&0xff,
+            (clock/0x1000000)&0xff);
+        opl_dbg_maxchip++;
+    }
 #endif
-	return OPL;
+    return OPL;
 }
 
 /* ----------  Destroy one of virtual YM3812 ----------       */
 void OPLDestroy(FM_OPL *OPL)
 {
 #ifdef OPL_OUTPUT_LOG
-	if(opl_dbg_fp)
-	{
-		fclose(opl_dbg_fp);
-		opl_dbg_fp = NULL;
-	}
+    if(opl_dbg_fp)
+    {
+        fclose(opl_dbg_fp);
+        opl_dbg_fp = NULL;
+    }
 #endif
-	OPL_UnLockTable();
-	free(OPL);
+    OPL_UnLockTable();
+    free(OPL);
 }
 
 /* ----------  Option handlers ----------       */
@@ -1136,76 +1136,76 @@ void OPLDestroy(FM_OPL *OPL)
 void OPLSetTimerHandler(FM_OPL *OPL, OPL_TIMERHANDLER TimerHandler,
                         void *param)
 {
-	OPL->TimerHandler   = TimerHandler;
+    OPL->TimerHandler   = TimerHandler;
     OPL->TimerParam = param;
 }
 
 /* ---------- YM3812 I/O interface ---------- */
 int OPLWrite(FM_OPL *OPL,int a,int v)
 {
-	if( !(a&1) )
-	{	/* address port */
-		OPL->address = v & 0xff;
-	}
-	else
-	{	/* data port */
+    if( !(a&1) )
+    {    /* address port */
+        OPL->address = v & 0xff;
+    }
+    else
+    {    /* data port */
 #ifdef OPL_OUTPUT_LOG
-	if(opl_dbg_fp)
-	{
-		for(opl_dbg_chip=0;opl_dbg_chip<opl_dbg_maxchip;opl_dbg_chip++)
-			if( opl_dbg_opl[opl_dbg_chip] == OPL) break;
-		fprintf(opl_dbg_fp,"%c%c%c",0x10+opl_dbg_chip,OPL->address,v);
-	}
+    if(opl_dbg_fp)
+    {
+        for(opl_dbg_chip=0;opl_dbg_chip<opl_dbg_maxchip;opl_dbg_chip++)
+            if( opl_dbg_opl[opl_dbg_chip] == OPL) break;
+        fprintf(opl_dbg_fp,"%c%c%c",0x10+opl_dbg_chip,OPL->address,v);
+    }
 #endif
-		OPLWriteReg(OPL,OPL->address,v);
-	}
-	return OPL->status>>7;
+        OPLWriteReg(OPL,OPL->address,v);
+    }
+    return OPL->status>>7;
 }
 
 unsigned char OPLRead(FM_OPL *OPL,int a)
 {
-	if( !(a&1) )
-	{	/* status port */
-		return OPL->status & (OPL->statusmask|0x80);
-	}
-	/* data port */
-	switch(OPL->address)
-	{
-	case 0x05: /* KeyBoard IN */
-		return 0;
+    if( !(a&1) )
+    {    /* status port */
+        return OPL->status & (OPL->statusmask|0x80);
+    }
+    /* data port */
+    switch(OPL->address)
+    {
+    case 0x05: /* KeyBoard IN */
+        return 0;
 #if 0
-	case 0x0f: /* ADPCM-DATA  */
-		return 0;
+    case 0x0f: /* ADPCM-DATA  */
+        return 0;
 #endif
-	case 0x19: /* I/O DATA    */
-		return 0;
-	case 0x1a: /* PCM-DATA    */
-		return 0;
-	}
-	return 0;
+    case 0x19: /* I/O DATA    */
+        return 0;
+    case 0x1a: /* PCM-DATA    */
+        return 0;
+    }
+    return 0;
 }
 
 int OPLTimerOver(FM_OPL *OPL,int c)
 {
-	if( c )
-	{	/* Timer B */
-		OPL_STATUS_SET(OPL,0x20);
-	}
-	else
-	{	/* Timer A */
-		OPL_STATUS_SET(OPL,0x40);
-		/* CSM mode key,TL control */
-		if( OPL->mode & 0x80 )
-		{	/* CSM mode total level latch and auto key on */
-			int ch;
-			for(ch=0;ch<9;ch++)
-				CSMKeyControll( &OPL->P_CH[ch] );
-		}
-	}
-	/* reload timer */
+    if( c )
+    {    /* Timer B */
+        OPL_STATUS_SET(OPL,0x20);
+    }
+    else
+    {    /* Timer A */
+        OPL_STATUS_SET(OPL,0x40);
+        /* CSM mode key,TL control */
+        if( OPL->mode & 0x80 )
+        {    /* CSM mode total level latch and auto key on */
+            int ch;
+            for(ch=0;ch<9;ch++)
+                CSMKeyControll( &OPL->P_CH[ch] );
+        }
+    }
+    /* reload timer */
     if (OPL->TimerHandler) {
         (OPL->TimerHandler)(OPL->TimerParam, c,
                             (double)OPL->T[c] * OPL->TimerBase);
     }
-	return OPL->status>>7;
+    return OPL->status>>7;
 }
diff --git a/hw/audio/fmopl.h b/hw/audio/fmopl.h
index e008e72d7a..17ad1fc4a8 100644
--- a/hw/audio/fmopl.h
+++ b/hw/audio/fmopl.h
@@ -9,83 +9,83 @@ typedef void (*OPL_TIMERHANDLER)(void *param, int channel, double interval_Sec);
 /* Saving is necessary for member of the 'R' mark for suspend/resume */
 /* ---------- OPL one of slot  ---------- */
 typedef struct fm_opl_slot {
-	int32_t TL;		/* total level     :TL << 8            */
-	int32_t TLL;		/* adjusted now TL                     */
-	uint8_t  KSR;		/* key scale rate  :(shift down bit)   */
-	int32_t *AR;		/* attack rate     :&AR_TABLE[AR<<2]   */
-	int32_t *DR;		/* decay rate      :&DR_TALBE[DR<<2]   */
-	int32_t SL;		/* sustin level    :SL_TALBE[SL]       */
-	int32_t *RR;		/* release rate    :&DR_TABLE[RR<<2]   */
-	uint8_t ksl;		/* keyscale level  :(shift down bits)  */
-	uint8_t ksr;		/* key scale rate  :kcode>>KSR         */
-	uint32_t mul;		/* multiple        :ML_TABLE[ML]       */
-	uint32_t Cnt;		/* frequency count :                   */
-	uint32_t Incr;	/* frequency step  :                   */
-	/* envelope generator state */
-	uint8_t eg_typ;	/* envelope type flag                  */
-	uint8_t evm;		/* envelope phase                      */
-	int32_t evc;		/* envelope counter                    */
-	int32_t eve;		/* envelope counter end point          */
-	int32_t evs;		/* envelope counter step               */
-	int32_t evsa;	/* envelope step for AR :AR[ksr]           */
-	int32_t evsd;	/* envelope step for DR :DR[ksr]           */
-	int32_t evsr;	/* envelope step for RR :RR[ksr]           */
-	/* LFO */
-	uint8_t ams;		/* ams flag                            */
-	uint8_t vib;		/* vibrate flag                        */
-	/* wave selector */
-	int32_t **wavetable;
+    int32_t TL;         /* total level     :TL << 8            */
+    int32_t TLL;        /* adjusted now TL                     */
+    uint8_t  KSR;       /* key scale rate  :(shift down bit)   */
+    int32_t *AR;        /* attack rate     :&AR_TABLE[AR<<2]   */
+    int32_t *DR;        /* decay rate      :&DR_TALBE[DR<<2]   */
+    int32_t SL;         /* sustin level    :SL_TALBE[SL]       */
+    int32_t *RR;        /* release rate    :&DR_TABLE[RR<<2]   */
+    uint8_t ksl;        /* keyscale level  :(shift down bits)  */
+    uint8_t ksr;        /* key scale rate  :kcode>>KSR         */
+    uint32_t mul;       /* multiple        :ML_TABLE[ML]       */
+    uint32_t Cnt;       /* frequency count :                   */
+    uint32_t Incr;      /* frequency step  :                   */
+    /* envelope generator state */
+    uint8_t eg_typ;     /* envelope type flag                  */
+    uint8_t evm;        /* envelope phase                      */
+    int32_t evc;        /* envelope counter                    */
+    int32_t eve;        /* envelope counter end point          */
+    int32_t evs;        /* envelope counter step               */
+    int32_t evsa;    /* envelope step for AR :AR[ksr]           */
+    int32_t evsd;    /* envelope step for DR :DR[ksr]           */
+    int32_t evsr;    /* envelope step for RR :RR[ksr]           */
+    /* LFO */
+    uint8_t ams;        /* ams flag                            */
+    uint8_t vib;        /* vibrate flag                        */
+    /* wave selector */
+    int32_t **wavetable;
 }OPL_SLOT;
 
 /* ---------- OPL one of channel  ---------- */
 typedef struct fm_opl_channel {
-	OPL_SLOT SLOT[2];
-	uint8_t CON;			/* connection type                     */
-	uint8_t FB;			/* feed back       :(shift down bit)   */
-	int32_t *connect1;	/* slot1 output pointer                */
-	int32_t *connect2;	/* slot2 output pointer                */
-	int32_t op1_out[2];	/* slot1 output for selfeedback        */
-	/* phase generator state */
-	uint32_t  block_fnum;	/* block+fnum      :                   */
-	uint8_t kcode;		/* key code        : KeyScaleCode      */
-	uint32_t  fc;			/* Freq. Increment base                */
-	uint32_t  ksl_base;	/* KeyScaleLevel Base step             */
-	uint8_t keyon;		/* key on/off flag                     */
+    OPL_SLOT SLOT[2];
+    uint8_t CON;           /* connection type                     */
+    uint8_t FB;            /* feed back       :(shift down bit)   */
+    int32_t *connect1;     /* slot1 output pointer                */
+    int32_t *connect2;     /* slot2 output pointer                */
+    int32_t op1_out[2];    /* slot1 output for selfeedback        */
+    /* phase generator state */
+    uint32_t  block_fnum;  /* block+fnum      :                   */
+    uint8_t kcode;         /* key code        : KeyScaleCode      */
+    uint32_t  fc;          /* Freq. Increment base                */
+    uint32_t  ksl_base;    /* KeyScaleLevel Base step             */
+    uint8_t keyon;         /* key on/off flag                     */
 } OPL_CH;
 
 /* OPL state */
 typedef struct fm_opl_f {
-	int clock;			/* master clock  (Hz)                */
-	int rate;			/* sampling rate (Hz)                */
-	double freqbase;	/* frequency base                    */
-	double TimerBase;	/* Timer base time (==sampling time) */
-	uint8_t address;		/* address register                  */
-	uint8_t status;		/* status flag                       */
-	uint8_t statusmask;	/* status mask                       */
-	uint32_t mode;		/* Reg.08 : CSM , notesel,etc.       */
-	/* Timer */
-	int T[2];			/* timer counter                     */
-	uint8_t st[2];		/* timer enable                      */
-	/* FM channel slots */
-	OPL_CH *P_CH;		/* pointer of CH                     */
-	int	max_ch;			/* maximum channel                   */
-	/* Rhythm sention */
-	uint8_t rhythm;		/* Rhythm mode , key flag */
-	/* time tables */
-	int32_t AR_TABLE[76];	/* attack rate tables  */
-	int32_t DR_TABLE[76];	/* decay rate tables   */
-	uint32_t FN_TABLE[1024];  /* fnumber -> increment counter */
-	/* LFO */
-	int32_t *ams_table;
-	int32_t *vib_table;
-	int32_t amsCnt;
-	int32_t amsIncr;
-	int32_t vibCnt;
-	int32_t vibIncr;
-	/* wave selector enable flag */
-	uint8_t wavesel;
-	/* external event callback handler */
-	OPL_TIMERHANDLER  TimerHandler;		/* TIMER handler   */
+    int clock;             /* master clock  (Hz)                */
+    int rate;              /* sampling rate (Hz)                */
+    double freqbase;       /* frequency base                    */
+    double TimerBase;      /* Timer base time (==sampling time) */
+    uint8_t address;       /* address register                  */
+    uint8_t status;        /* status flag                       */
+    uint8_t statusmask;    /* status mask                       */
+    uint32_t mode;         /* Reg.08 : CSM , notesel,etc.       */
+    /* Timer */
+    int T[2];              /* timer counter                     */
+    uint8_t st[2];         /* timer enable                      */
+    /* FM channel slots */
+    OPL_CH *P_CH;          /* pointer of CH                     */
+    int    max_ch;         /* maximum channel                   */
+    /* Rhythm sention */
+    uint8_t rhythm;        /* Rhythm mode , key flag */
+    /* time tables */
+    int32_t AR_TABLE[76];    /* attack rate tables  */
+    int32_t DR_TABLE[76];    /* decay rate tables   */
+    uint32_t FN_TABLE[1024];  /* fnumber -> increment counter */
+    /* LFO */
+    int32_t *ams_table;
+    int32_t *vib_table;
+    int32_t amsCnt;
+    int32_t amsIncr;
+    int32_t vibCnt;
+    int32_t vibIncr;
+    /* wave selector enable flag */
+    uint8_t wavesel;
+    /* external event callback handler */
+    OPL_TIMERHANDLER  TimerHandler;        /* TIMER handler   */
     void *TimerParam; /* TIMER parameter */
 } FM_OPL;
 
diff --git a/hw/audio/intel-hda-defs.h b/hw/audio/intel-hda-defs.h
index 2e37e5b874..edda637c4f 100644
--- a/hw/audio/intel-hda-defs.h
+++ b/hw/audio/intel-hda-defs.h
@@ -10,81 +10,81 @@
 /*
  * registers
  */
-#define ICH6_REG_GCAP			0x00
-#define   ICH6_GCAP_64OK	(1 << 0)   /* 64bit address support */
-#define   ICH6_GCAP_NSDO	(3 << 1)   /* # of serial data out signals */
-#define   ICH6_GCAP_BSS		(31 << 3)  /* # of bidirectional streams */
-#define   ICH6_GCAP_ISS		(15 << 8)  /* # of input streams */
-#define   ICH6_GCAP_OSS		(15 << 12) /* # of output streams */
-#define ICH6_REG_VMIN			0x02
-#define ICH6_REG_VMAJ			0x03
-#define ICH6_REG_OUTPAY			0x04
-#define ICH6_REG_INPAY			0x06
-#define ICH6_REG_GCTL			0x08
-#define   ICH6_GCTL_RESET	(1 << 0)   /* controller reset */
-#define   ICH6_GCTL_FCNTRL	(1 << 1)   /* flush control */
-#define   ICH6_GCTL_UNSOL	(1 << 8)   /* accept unsol. response enable */
-#define ICH6_REG_WAKEEN			0x0c
-#define ICH6_REG_STATESTS		0x0e
-#define ICH6_REG_GSTS			0x10
-#define   ICH6_GSTS_FSTS	(1 << 1)   /* flush status */
-#define ICH6_REG_INTCTL			0x20
-#define ICH6_REG_INTSTS			0x24
-#define ICH6_REG_WALLCLK		0x30	/* 24Mhz source */
-#define ICH6_REG_SYNC			0x34
-#define ICH6_REG_CORBLBASE		0x40
-#define ICH6_REG_CORBUBASE		0x44
-#define ICH6_REG_CORBWP			0x48
-#define ICH6_REG_CORBRP			0x4a
-#define   ICH6_CORBRP_RST	(1 << 15)  /* read pointer reset */
-#define ICH6_REG_CORBCTL		0x4c
-#define   ICH6_CORBCTL_RUN	(1 << 1)   /* enable DMA */
-#define   ICH6_CORBCTL_CMEIE	(1 << 0)   /* enable memory error irq */
-#define ICH6_REG_CORBSTS		0x4d
-#define   ICH6_CORBSTS_CMEI	(1 << 0)   /* memory error indication */
-#define ICH6_REG_CORBSIZE		0x4e
-
-#define ICH6_REG_RIRBLBASE		0x50
-#define ICH6_REG_RIRBUBASE		0x54
-#define ICH6_REG_RIRBWP			0x58
-#define   ICH6_RIRBWP_RST	(1 << 15)  /* write pointer reset */
-#define ICH6_REG_RINTCNT		0x5a
-#define ICH6_REG_RIRBCTL		0x5c
-#define   ICH6_RBCTL_IRQ_EN	(1 << 0)   /* enable IRQ */
-#define   ICH6_RBCTL_DMA_EN	(1 << 1)   /* enable DMA */
-#define   ICH6_RBCTL_OVERRUN_EN	(1 << 2)   /* enable overrun irq */
-#define ICH6_REG_RIRBSTS		0x5d
-#define   ICH6_RBSTS_IRQ	(1 << 0)   /* response irq */
-#define   ICH6_RBSTS_OVERRUN	(1 << 2)   /* overrun irq */
-#define ICH6_REG_RIRBSIZE		0x5e
-
-#define ICH6_REG_IC			0x60
-#define ICH6_REG_IR			0x64
-#define ICH6_REG_IRS			0x68
-#define   ICH6_IRS_VALID	(1<<1)
-#define   ICH6_IRS_BUSY		(1<<0)
-
-#define ICH6_REG_DPLBASE		0x70
-#define ICH6_REG_DPUBASE		0x74
-#define   ICH6_DPLBASE_ENABLE	0x1	/* Enable position buffer */
+#define ICH6_REG_GCAP             0x00
+#define ICH6_GCAP_64OK            (1 << 0)   /* 64bit address support */
+#define ICH6_GCAP_NSDO            (3 << 1)   /* # of serial data out signals */
+#define ICH6_GCAP_BSS             (31 << 3)  /* # of bidirectional streams */
+#define ICH6_GCAP_ISS             (15 << 8)  /* # of input streams */
+#define ICH6_GCAP_OSS             (15 << 12) /* # of output streams */
+#define ICH6_REG_VMIN             0x02
+#define ICH6_REG_VMAJ             0x03
+#define ICH6_REG_OUTPAY           0x04
+#define ICH6_REG_INPAY            0x06
+#define ICH6_REG_GCTL             0x08
+#define ICH6_GCTL_RESET           (1 << 0)   /* controller reset */
+#define ICH6_GCTL_FCNTRL          (1 << 1)   /* flush control */
+#define ICH6_GCTL_UNSOL           (1 << 8)   /* accept unsol. response enable */
+#define ICH6_REG_WAKEEN           0x0c
+#define ICH6_REG_STATESTS         0x0e
+#define ICH6_REG_GSTS             0x10
+#define ICH6_GSTS_FSTS            (1 << 1)   /* flush status */
+#define ICH6_REG_INTCTL           0x20
+#define ICH6_REG_INTSTS           0x24
+#define ICH6_REG_WALLCLK          0x30    /* 24Mhz source */
+#define ICH6_REG_SYNC             0x34
+#define ICH6_REG_CORBLBASE        0x40
+#define ICH6_REG_CORBUBASE        0x44
+#define ICH6_REG_CORBWP           0x48
+#define ICH6_REG_CORBRP           0x4a
+#define ICH6_CORBRP_RST           (1 << 15)  /* read pointer reset */
+#define ICH6_REG_CORBCTL          0x4c
+#define ICH6_CORBCTL_RUN          (1 << 1)   /* enable DMA */
+#define ICH6_CORBCTL_CMEIE        (1 << 0)   /* enable memory error irq */
+#define ICH6_REG_CORBSTS          0x4d
+#define ICH6_CORBSTS_CMEI         (1 << 0)   /* memory error indication */
+#define ICH6_REG_CORBSIZE         0x4e
+
+#define ICH6_REG_RIRBLBASE        0x50
+#define ICH6_REG_RIRBUBASE        0x54
+#define ICH6_REG_RIRBWP           0x58
+#define ICH6_RIRBWP_RST           (1 << 15)  /* write pointer reset */
+#define ICH6_REG_RINTCNT          0x5a
+#define ICH6_REG_RIRBCTL          0x5c
+#define ICH6_RBCTL_IRQ_EN         (1 << 0)   /* enable IRQ */
+#define ICH6_RBCTL_DMA_EN         (1 << 1)   /* enable DMA */
+#define ICH6_RBCTL_OVERRUN_EN     (1 << 2)   /* enable overrun irq */
+#define ICH6_REG_RIRBSTS          0x5d
+#define ICH6_RBSTS_IRQ            (1 << 0)   /* response irq */
+#define ICH6_RBSTS_OVERRUN        (1 << 2)   /* overrun irq */
+#define ICH6_REG_RIRBSIZE         0x5e
+
+#define ICH6_REG_IC               0x60
+#define ICH6_REG_IR               0x64
+#define ICH6_REG_IRS              0x68
+#define ICH6_IRS_VALID            (1<<1)
+#define ICH6_IRS_BUSY             (1<<0)
+
+#define ICH6_REG_DPLBASE          0x70
+#define ICH6_REG_DPUBASE          0x74
+#define ICH6_DPLBASE_ENABLE       0x1    /* Enable position buffer */
 
 /* SD offset: SDI0=0x80, SDI1=0xa0, ... SDO3=0x160 */
 enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 
 /* stream register offsets from stream base */
-#define ICH6_REG_SD_CTL			0x00
-#define ICH6_REG_SD_STS			0x03
-#define ICH6_REG_SD_LPIB		0x04
-#define ICH6_REG_SD_CBL			0x08
-#define ICH6_REG_SD_LVI			0x0c
-#define ICH6_REG_SD_FIFOW		0x0e
-#define ICH6_REG_SD_FIFOSIZE		0x10
-#define ICH6_REG_SD_FORMAT		0x12
-#define ICH6_REG_SD_BDLPL		0x18
-#define ICH6_REG_SD_BDLPU		0x1c
+#define ICH6_REG_SD_CTL           0x00
+#define ICH6_REG_SD_STS           0x03
+#define ICH6_REG_SD_LPIB          0x04
+#define ICH6_REG_SD_CBL           0x08
+#define ICH6_REG_SD_LVI           0x0c
+#define ICH6_REG_SD_FIFOW         0x0e
+#define ICH6_REG_SD_FIFOSIZE      0x10
+#define ICH6_REG_SD_FORMAT        0x12
+#define ICH6_REG_SD_BDLPL         0x18
+#define ICH6_REG_SD_BDLPU         0x1c
 
 /* PCI space */
-#define ICH6_PCIREG_TCSEL	0x44
+#define ICH6_PCIREG_TCSEL         0x44
 
 /*
  * other constants
@@ -92,98 +92,98 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 
 /* max number of SDs */
 /* ICH, ATI and VIA have 4 playback and 4 capture */
-#define ICH6_NUM_CAPTURE	4
-#define ICH6_NUM_PLAYBACK	4
+#define ICH6_NUM_CAPTURE          4
+#define ICH6_NUM_PLAYBACK         4
 
 /* ULI has 6 playback and 5 capture */
-#define ULI_NUM_CAPTURE		5
-#define ULI_NUM_PLAYBACK	6
+#define ULI_NUM_CAPTURE           5
+#define ULI_NUM_PLAYBACK          6
 
 /* ATI HDMI has 1 playback and 0 capture */
-#define ATIHDMI_NUM_CAPTURE	0
-#define ATIHDMI_NUM_PLAYBACK	1
+#define ATIHDMI_NUM_CAPTURE       0
+#define ATIHDMI_NUM_PLAYBACK      1
 
 /* TERA has 4 playback and 3 capture */
-#define TERA_NUM_CAPTURE	3
-#define TERA_NUM_PLAYBACK	4
+#define TERA_NUM_CAPTURE          3
+#define TERA_NUM_PLAYBACK         4
 
 /* this number is statically defined for simplicity */
-#define MAX_AZX_DEV		16
+#define MAX_AZX_DEV               16
 
 /* max number of fragments - we may use more if allocating more pages for BDL */
-#define BDL_SIZE		4096
-#define AZX_MAX_BDL_ENTRIES	(BDL_SIZE / 16)
-#define AZX_MAX_FRAG		32
+#define BDL_SIZE                  4096
+#define AZX_MAX_BDL_ENTRIES       (BDL_SIZE / 16)
+#define AZX_MAX_FRAG              32
 /* max buffer size - no h/w limit, you can increase as you like */
-#define AZX_MAX_BUF_SIZE	(1024*1024*1024)
+#define AZX_MAX_BUF_SIZE          (1024*1024*1024)
 
 /* RIRB int mask: overrun[2], response[0] */
-#define RIRB_INT_RESPONSE	0x01
-#define RIRB_INT_OVERRUN	0x04
-#define RIRB_INT_MASK		0x05
+#define RIRB_INT_RESPONSE         0x01
+#define RIRB_INT_OVERRUN          0x04
+#define RIRB_INT_MASK             0x05
 
 /* STATESTS int mask: S3,SD2,SD1,SD0 */
-#define AZX_MAX_CODECS		8
-#define AZX_DEFAULT_CODECS	4
-#define STATESTS_INT_MASK	((1 << AZX_MAX_CODECS) - 1)
+#define AZX_MAX_CODECS            8
+#define AZX_DEFAULT_CODECS        4
+#define STATESTS_INT_MASK         ((1 << AZX_MAX_CODECS) - 1)
 
 /* SD_CTL bits */
-#define SD_CTL_STREAM_RESET	0x01	/* stream reset bit */
-#define SD_CTL_DMA_START	0x02	/* stream DMA start bit */
-#define SD_CTL_STRIPE		(3 << 16)	/* stripe control */
-#define SD_CTL_TRAFFIC_PRIO	(1 << 18)	/* traffic priority */
-#define SD_CTL_DIR		(1 << 19)	/* bi-directional stream */
-#define SD_CTL_STREAM_TAG_MASK	(0xf << 20)
-#define SD_CTL_STREAM_TAG_SHIFT	20
+#define SD_CTL_STREAM_RESET       0x01    /* stream reset bit */
+#define SD_CTL_DMA_START          0x02    /* stream DMA start bit */
+#define SD_CTL_STRIPE             (3 << 16)    /* stripe control */
+#define SD_CTL_TRAFFIC_PRIO       (1 << 18)    /* traffic priority */
+#define SD_CTL_DIR                (1 << 19)    /* bi-directional stream */
+#define SD_CTL_STREAM_TAG_MASK    (0xf << 20)
+#define SD_CTL_STREAM_TAG_SHIFT   20
 
 /* SD_CTL and SD_STS */
-#define SD_INT_DESC_ERR		0x10	/* descriptor error interrupt */
-#define SD_INT_FIFO_ERR		0x08	/* FIFO error interrupt */
-#define SD_INT_COMPLETE		0x04	/* completion interrupt */
-#define SD_INT_MASK		(SD_INT_DESC_ERR|SD_INT_FIFO_ERR|\
-				 SD_INT_COMPLETE)
+#define SD_INT_DESC_ERR           0x10    /* descriptor error interrupt */
+#define SD_INT_FIFO_ERR           0x08    /* FIFO error interrupt */
+#define SD_INT_COMPLETE           0x04    /* completion interrupt */
+#define SD_INT_MASK               (SD_INT_DESC_ERR|SD_INT_FIFO_ERR|\
+                                   SD_INT_COMPLETE)
 
 /* SD_STS */
-#define SD_STS_FIFO_READY	0x20	/* FIFO ready */
+#define SD_STS_FIFO_READY         0x20    /* FIFO ready */
 
 /* INTCTL and INTSTS */
-#define ICH6_INT_ALL_STREAM	0xff	   /* all stream interrupts */
-#define ICH6_INT_CTRL_EN	0x40000000 /* controller interrupt enable bit */
-#define ICH6_INT_GLOBAL_EN	0x80000000 /* global interrupt enable bit */
+#define ICH6_INT_ALL_STREAM    0xff       /* all stream interrupts */
+#define ICH6_INT_CTRL_EN       0x40000000 /* controller interrupt enable bit */
+#define ICH6_INT_GLOBAL_EN     0x80000000 /* global interrupt enable bit */
 
 /* below are so far hardcoded - should read registers in future */
-#define ICH6_MAX_CORB_ENTRIES	256
-#define ICH6_MAX_RIRB_ENTRIES	256
+#define ICH6_MAX_CORB_ENTRIES     256
+#define ICH6_MAX_RIRB_ENTRIES     256
 
 /* position fix mode */
 enum {
-	POS_FIX_AUTO,
-	POS_FIX_LPIB,
-	POS_FIX_POSBUF,
+    POS_FIX_AUTO,
+    POS_FIX_LPIB,
+    POS_FIX_POSBUF,
 };
 
 /* Defines for ATI HD Audio support in SB450 south bridge */
-#define ATI_SB450_HDAUDIO_MISC_CNTR2_ADDR   0x42
-#define ATI_SB450_HDAUDIO_ENABLE_SNOOP      0x02
+#define ATI_SB450_HDAUDIO_MISC_CNTR2_ADDR  0x42
+#define ATI_SB450_HDAUDIO_ENABLE_SNOOP     0x02
 
 /* Defines for Nvidia HDA support */
-#define NVIDIA_HDA_TRANSREG_ADDR      0x4e
-#define NVIDIA_HDA_ENABLE_COHBITS     0x0f
-#define NVIDIA_HDA_ISTRM_COH          0x4d
-#define NVIDIA_HDA_OSTRM_COH          0x4c
-#define NVIDIA_HDA_ENABLE_COHBIT      0x01
+#define NVIDIA_HDA_TRANSREG_ADDR           0x4e
+#define NVIDIA_HDA_ENABLE_COHBITS          0x0f
+#define NVIDIA_HDA_ISTRM_COH               0x4d
+#define NVIDIA_HDA_OSTRM_COH               0x4c
+#define NVIDIA_HDA_ENABLE_COHBIT           0x01
 
 /* Defines for Intel SCH HDA snoop control */
-#define INTEL_SCH_HDA_DEVC      0x78
-#define INTEL_SCH_HDA_DEVC_NOSNOOP       (0x1<<11)
+#define INTEL_SCH_HDA_DEVC                 0x78
+#define INTEL_SCH_HDA_DEVC_NOSNOOP         (0x1<<11)
 
 /* Define IN stream 0 FIFO size offset in VIA controller */
-#define VIA_IN_STREAM0_FIFO_SIZE_OFFSET	0x90
+#define VIA_IN_STREAM0_FIFO_SIZE_OFFSET    0x90
 /* Define VIA HD Audio Device ID*/
-#define VIA_HDAC_DEVICE_ID		0x3288
+#define VIA_HDAC_DEVICE_ID                 0x3288
 
 /* HD Audio class code */
-#define PCI_CLASS_MULTIMEDIA_HD_AUDIO	0x0403
+#define PCI_CLASS_MULTIMEDIA_HD_AUDIO      0x0403
 
 /* --------------------------------------------------------------------- */
 /* from linux/sound/pci/hda/hda_codec.h                                  */
@@ -191,526 +191,526 @@ enum {
 /*
  * nodes
  */
-#define	AC_NODE_ROOT		0x00
+#define AC_NODE_ROOT        0x00
 
 /*
  * function group types
  */
 enum {
-	AC_GRP_AUDIO_FUNCTION = 0x01,
-	AC_GRP_MODEM_FUNCTION = 0x02,
+    AC_GRP_AUDIO_FUNCTION = 0x01,
+    AC_GRP_MODEM_FUNCTION = 0x02,
 };
-	
+
 /*
  * widget types
  */
 enum {
-	AC_WID_AUD_OUT,		/* Audio Out */
-	AC_WID_AUD_IN,		/* Audio In */
-	AC_WID_AUD_MIX,		/* Audio Mixer */
-	AC_WID_AUD_SEL,		/* Audio Selector */
-	AC_WID_PIN,		/* Pin Complex */
-	AC_WID_POWER,		/* Power */
-	AC_WID_VOL_KNB,		/* Volume Knob */
-	AC_WID_BEEP,		/* Beep Generator */
-	AC_WID_VENDOR = 0x0f	/* Vendor specific */
+    AC_WID_AUD_OUT,        /* Audio Out */
+    AC_WID_AUD_IN,        /* Audio In */
+    AC_WID_AUD_MIX,        /* Audio Mixer */
+    AC_WID_AUD_SEL,        /* Audio Selector */
+    AC_WID_PIN,        /* Pin Complex */
+    AC_WID_POWER,        /* Power */
+    AC_WID_VOL_KNB,        /* Volume Knob */
+    AC_WID_BEEP,        /* Beep Generator */
+    AC_WID_VENDOR = 0x0f    /* Vendor specific */
 };
 
 /*
  * GET verbs
  */
-#define AC_VERB_GET_STREAM_FORMAT		0x0a00
-#define AC_VERB_GET_AMP_GAIN_MUTE		0x0b00
-#define AC_VERB_GET_PROC_COEF			0x0c00
-#define AC_VERB_GET_COEF_INDEX			0x0d00
-#define AC_VERB_PARAMETERS			0x0f00
-#define AC_VERB_GET_CONNECT_SEL			0x0f01
-#define AC_VERB_GET_CONNECT_LIST		0x0f02
-#define AC_VERB_GET_PROC_STATE			0x0f03
-#define AC_VERB_GET_SDI_SELECT			0x0f04
-#define AC_VERB_GET_POWER_STATE			0x0f05
-#define AC_VERB_GET_CONV			0x0f06
-#define AC_VERB_GET_PIN_WIDGET_CONTROL		0x0f07
-#define AC_VERB_GET_UNSOLICITED_RESPONSE	0x0f08
-#define AC_VERB_GET_PIN_SENSE			0x0f09
-#define AC_VERB_GET_BEEP_CONTROL		0x0f0a
-#define AC_VERB_GET_EAPD_BTLENABLE		0x0f0c
-#define AC_VERB_GET_DIGI_CONVERT_1		0x0f0d
-#define AC_VERB_GET_DIGI_CONVERT_2		0x0f0e /* unused */
-#define AC_VERB_GET_VOLUME_KNOB_CONTROL		0x0f0f
+#define AC_VERB_GET_STREAM_FORMAT                0x0a00
+#define AC_VERB_GET_AMP_GAIN_MUTE                0x0b00
+#define AC_VERB_GET_PROC_COEF                    0x0c00
+#define AC_VERB_GET_COEF_INDEX                   0x0d00
+#define AC_VERB_PARAMETERS                       0x0f00
+#define AC_VERB_GET_CONNECT_SEL                  0x0f01
+#define AC_VERB_GET_CONNECT_LIST                 0x0f02
+#define AC_VERB_GET_PROC_STATE                   0x0f03
+#define AC_VERB_GET_SDI_SELECT                   0x0f04
+#define AC_VERB_GET_POWER_STATE                  0x0f05
+#define AC_VERB_GET_CONV                         0x0f06
+#define AC_VERB_GET_PIN_WIDGET_CONTROL           0x0f07
+#define AC_VERB_GET_UNSOLICITED_RESPONSE         0x0f08
+#define AC_VERB_GET_PIN_SENSE                    0x0f09
+#define AC_VERB_GET_BEEP_CONTROL                 0x0f0a
+#define AC_VERB_GET_EAPD_BTLENABLE               0x0f0c
+#define AC_VERB_GET_DIGI_CONVERT_1               0x0f0d
+#define AC_VERB_GET_DIGI_CONVERT_2               0x0f0e /* unused */
+#define AC_VERB_GET_VOLUME_KNOB_CONTROL          0x0f0f
 /* f10-f1a: GPIO */
-#define AC_VERB_GET_GPIO_DATA			0x0f15
-#define AC_VERB_GET_GPIO_MASK			0x0f16
-#define AC_VERB_GET_GPIO_DIRECTION		0x0f17
-#define AC_VERB_GET_GPIO_WAKE_MASK		0x0f18
-#define AC_VERB_GET_GPIO_UNSOLICITED_RSP_MASK	0x0f19
-#define AC_VERB_GET_GPIO_STICKY_MASK		0x0f1a
-#define AC_VERB_GET_CONFIG_DEFAULT		0x0f1c
+#define AC_VERB_GET_GPIO_DATA                    0x0f15
+#define AC_VERB_GET_GPIO_MASK                    0x0f16
+#define AC_VERB_GET_GPIO_DIRECTION               0x0f17
+#define AC_VERB_GET_GPIO_WAKE_MASK               0x0f18
+#define AC_VERB_GET_GPIO_UNSOLICITED_RSP_MASK    0x0f19
+#define AC_VERB_GET_GPIO_STICKY_MASK             0x0f1a
+#define AC_VERB_GET_CONFIG_DEFAULT               0x0f1c
 /* f20: AFG/MFG */
-#define AC_VERB_GET_SUBSYSTEM_ID		0x0f20
-#define AC_VERB_GET_CVT_CHAN_COUNT		0x0f2d
-#define AC_VERB_GET_HDMI_DIP_SIZE		0x0f2e
-#define AC_VERB_GET_HDMI_ELDD			0x0f2f
-#define AC_VERB_GET_HDMI_DIP_INDEX		0x0f30
-#define AC_VERB_GET_HDMI_DIP_DATA		0x0f31
-#define AC_VERB_GET_HDMI_DIP_XMIT		0x0f32
-#define AC_VERB_GET_HDMI_CP_CTRL		0x0f33
-#define AC_VERB_GET_HDMI_CHAN_SLOT		0x0f34
+#define AC_VERB_GET_SUBSYSTEM_ID                 0x0f20
+#define AC_VERB_GET_CVT_CHAN_COUNT               0x0f2d
+#define AC_VERB_GET_HDMI_DIP_SIZE                0x0f2e
+#define AC_VERB_GET_HDMI_ELDD                    0x0f2f
+#define AC_VERB_GET_HDMI_DIP_INDEX               0x0f30
+#define AC_VERB_GET_HDMI_DIP_DATA                0x0f31
+#define AC_VERB_GET_HDMI_DIP_XMIT                0x0f32
+#define AC_VERB_GET_HDMI_CP_CTRL                 0x0f33
+#define AC_VERB_GET_HDMI_CHAN_SLOT               0x0f34
 
 /*
  * SET verbs
  */
-#define AC_VERB_SET_STREAM_FORMAT		0x200
-#define AC_VERB_SET_AMP_GAIN_MUTE		0x300
-#define AC_VERB_SET_PROC_COEF			0x400
-#define AC_VERB_SET_COEF_INDEX			0x500
-#define AC_VERB_SET_CONNECT_SEL			0x701
-#define AC_VERB_SET_PROC_STATE			0x703
-#define AC_VERB_SET_SDI_SELECT			0x704
-#define AC_VERB_SET_POWER_STATE			0x705
-#define AC_VERB_SET_CHANNEL_STREAMID		0x706
-#define AC_VERB_SET_PIN_WIDGET_CONTROL		0x707
-#define AC_VERB_SET_UNSOLICITED_ENABLE		0x708
-#define AC_VERB_SET_PIN_SENSE			0x709
-#define AC_VERB_SET_BEEP_CONTROL		0x70a
-#define AC_VERB_SET_EAPD_BTLENABLE		0x70c
-#define AC_VERB_SET_DIGI_CONVERT_1		0x70d
-#define AC_VERB_SET_DIGI_CONVERT_2		0x70e
-#define AC_VERB_SET_VOLUME_KNOB_CONTROL		0x70f
-#define AC_VERB_SET_GPIO_DATA			0x715
-#define AC_VERB_SET_GPIO_MASK			0x716
-#define AC_VERB_SET_GPIO_DIRECTION		0x717
-#define AC_VERB_SET_GPIO_WAKE_MASK		0x718
-#define AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK	0x719
-#define AC_VERB_SET_GPIO_STICKY_MASK		0x71a
-#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_0	0x71c
-#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_1	0x71d
-#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_2	0x71e
-#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_3	0x71f
-#define AC_VERB_SET_EAPD				0x788
-#define AC_VERB_SET_CODEC_RESET			0x7ff
-#define AC_VERB_SET_CVT_CHAN_COUNT		0x72d
-#define AC_VERB_SET_HDMI_DIP_INDEX		0x730
-#define AC_VERB_SET_HDMI_DIP_DATA		0x731
-#define AC_VERB_SET_HDMI_DIP_XMIT		0x732
-#define AC_VERB_SET_HDMI_CP_CTRL		0x733
-#define AC_VERB_SET_HDMI_CHAN_SLOT		0x734
+#define AC_VERB_SET_STREAM_FORMAT                0x200
+#define AC_VERB_SET_AMP_GAIN_MUTE                0x300
+#define AC_VERB_SET_PROC_COEF                    0x400
+#define AC_VERB_SET_COEF_INDEX                   0x500
+#define AC_VERB_SET_CONNECT_SEL                  0x701
+#define AC_VERB_SET_PROC_STATE                   0x703
+#define AC_VERB_SET_SDI_SELECT                   0x704
+#define AC_VERB_SET_POWER_STATE                  0x705
+#define AC_VERB_SET_CHANNEL_STREAMID             0x706
+#define AC_VERB_SET_PIN_WIDGET_CONTROL           0x707
+#define AC_VERB_SET_UNSOLICITED_ENABLE           0x708
+#define AC_VERB_SET_PIN_SENSE                    0x709
+#define AC_VERB_SET_BEEP_CONTROL                 0x70a
+#define AC_VERB_SET_EAPD_BTLENABLE               0x70c
+#define AC_VERB_SET_DIGI_CONVERT_1               0x70d
+#define AC_VERB_SET_DIGI_CONVERT_2               0x70e
+#define AC_VERB_SET_VOLUME_KNOB_CONTROL          0x70f
+#define AC_VERB_SET_GPIO_DATA                    0x715
+#define AC_VERB_SET_GPIO_MASK                    0x716
+#define AC_VERB_SET_GPIO_DIRECTION               0x717
+#define AC_VERB_SET_GPIO_WAKE_MASK               0x718
+#define AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK    0x719
+#define AC_VERB_SET_GPIO_STICKY_MASK             0x71a
+#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_0       0x71c
+#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_1       0x71d
+#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_2       0x71e
+#define AC_VERB_SET_CONFIG_DEFAULT_BYTES_3       0x71f
+#define AC_VERB_SET_EAPD                         0x788
+#define AC_VERB_SET_CODEC_RESET                  0x7ff
+#define AC_VERB_SET_CVT_CHAN_COUNT               0x72d
+#define AC_VERB_SET_HDMI_DIP_INDEX               0x730
+#define AC_VERB_SET_HDMI_DIP_DATA                0x731
+#define AC_VERB_SET_HDMI_DIP_XMIT                0x732
+#define AC_VERB_SET_HDMI_CP_CTRL                 0x733
+#define AC_VERB_SET_HDMI_CHAN_SLOT               0x734
 
 /*
  * Parameter IDs
  */
-#define AC_PAR_VENDOR_ID		0x00
-#define AC_PAR_SUBSYSTEM_ID		0x01
-#define AC_PAR_REV_ID			0x02
-#define AC_PAR_NODE_COUNT		0x04
-#define AC_PAR_FUNCTION_TYPE		0x05
-#define AC_PAR_AUDIO_FG_CAP		0x08
-#define AC_PAR_AUDIO_WIDGET_CAP		0x09
-#define AC_PAR_PCM			0x0a
-#define AC_PAR_STREAM			0x0b
-#define AC_PAR_PIN_CAP			0x0c
-#define AC_PAR_AMP_IN_CAP		0x0d
-#define AC_PAR_CONNLIST_LEN		0x0e
-#define AC_PAR_POWER_STATE		0x0f
-#define AC_PAR_PROC_CAP			0x10
-#define AC_PAR_GPIO_CAP			0x11
-#define AC_PAR_AMP_OUT_CAP		0x12
-#define AC_PAR_VOL_KNB_CAP		0x13
-#define AC_PAR_HDMI_LPCM_CAP		0x20
+#define AC_PAR_VENDOR_ID             0x00
+#define AC_PAR_SUBSYSTEM_ID          0x01
+#define AC_PAR_REV_ID                0x02
+#define AC_PAR_NODE_COUNT            0x04
+#define AC_PAR_FUNCTION_TYPE         0x05
+#define AC_PAR_AUDIO_FG_CAP          0x08
+#define AC_PAR_AUDIO_WIDGET_CAP      0x09
+#define AC_PAR_PCM                   0x0a
+#define AC_PAR_STREAM                0x0b
+#define AC_PAR_PIN_CAP               0x0c
+#define AC_PAR_AMP_IN_CAP            0x0d
+#define AC_PAR_CONNLIST_LEN          0x0e
+#define AC_PAR_POWER_STATE           0x0f
+#define AC_PAR_PROC_CAP              0x10
+#define AC_PAR_GPIO_CAP              0x11
+#define AC_PAR_AMP_OUT_CAP           0x12
+#define AC_PAR_VOL_KNB_CAP           0x13
+#define AC_PAR_HDMI_LPCM_CAP         0x20
 
 /*
  * AC_VERB_PARAMETERS results (32bit)
  */
 
 /* Function Group Type */
-#define AC_FGT_TYPE			(0xff<<0)
-#define AC_FGT_TYPE_SHIFT		0
-#define AC_FGT_UNSOL_CAP		(1<<8)
+#define AC_FGT_TYPE                  (0xff<<0)
+#define AC_FGT_TYPE_SHIFT            0
+#define AC_FGT_UNSOL_CAP             (1<<8)
 
 /* Audio Function Group Capabilities */
-#define AC_AFG_OUT_DELAY		(0xf<<0)
-#define AC_AFG_IN_DELAY			(0xf<<8)
-#define AC_AFG_BEEP_GEN			(1<<16)
+#define AC_AFG_OUT_DELAY             (0xf<<0)
+#define AC_AFG_IN_DELAY              (0xf<<8)
+#define AC_AFG_BEEP_GEN              (1<<16)
 
 /* Audio Widget Capabilities */
-#define AC_WCAP_STEREO			(1<<0)	/* stereo I/O */
-#define AC_WCAP_IN_AMP			(1<<1)	/* AMP-in present */
-#define AC_WCAP_OUT_AMP			(1<<2)	/* AMP-out present */
-#define AC_WCAP_AMP_OVRD		(1<<3)	/* AMP-parameter override */
-#define AC_WCAP_FORMAT_OVRD		(1<<4)	/* format override */
-#define AC_WCAP_STRIPE			(1<<5)	/* stripe */
-#define AC_WCAP_PROC_WID		(1<<6)	/* Proc Widget */
-#define AC_WCAP_UNSOL_CAP		(1<<7)	/* Unsol capable */
-#define AC_WCAP_CONN_LIST		(1<<8)	/* connection list */
-#define AC_WCAP_DIGITAL			(1<<9)	/* digital I/O */
-#define AC_WCAP_POWER			(1<<10)	/* power control */
-#define AC_WCAP_LR_SWAP			(1<<11)	/* L/R swap */
-#define AC_WCAP_CP_CAPS			(1<<12) /* content protection */
-#define AC_WCAP_CHAN_CNT_EXT		(7<<13)	/* channel count ext */
-#define AC_WCAP_DELAY			(0xf<<16)
-#define AC_WCAP_DELAY_SHIFT		16
-#define AC_WCAP_TYPE			(0xf<<20)
-#define AC_WCAP_TYPE_SHIFT		20
+#define AC_WCAP_STEREO               (1<<0)    /* stereo I/O */
+#define AC_WCAP_IN_AMP               (1<<1)    /* AMP-in present */
+#define AC_WCAP_OUT_AMP              (1<<2)    /* AMP-out present */
+#define AC_WCAP_AMP_OVRD             (1<<3)    /* AMP-parameter override */
+#define AC_WCAP_FORMAT_OVRD          (1<<4)    /* format override */
+#define AC_WCAP_STRIPE               (1<<5)    /* stripe */
+#define AC_WCAP_PROC_WID             (1<<6)    /* Proc Widget */
+#define AC_WCAP_UNSOL_CAP            (1<<7)    /* Unsol capable */
+#define AC_WCAP_CONN_LIST            (1<<8)    /* connection list */
+#define AC_WCAP_DIGITAL              (1<<9)    /* digital I/O */
+#define AC_WCAP_POWER                (1<<10)    /* power control */
+#define AC_WCAP_LR_SWAP              (1<<11)    /* L/R swap */
+#define AC_WCAP_CP_CAPS              (1<<12) /* content protection */
+#define AC_WCAP_CHAN_CNT_EXT         (7<<13)    /* channel count ext */
+#define AC_WCAP_DELAY                (0xf<<16)
+#define AC_WCAP_DELAY_SHIFT          16
+#define AC_WCAP_TYPE                 (0xf<<20)
+#define AC_WCAP_TYPE_SHIFT           20
 
 /* supported PCM rates and bits */
-#define AC_SUPPCM_RATES			(0xfff << 0)
-#define AC_SUPPCM_BITS_8		(1<<16)
-#define AC_SUPPCM_BITS_16		(1<<17)
-#define AC_SUPPCM_BITS_20		(1<<18)
-#define AC_SUPPCM_BITS_24		(1<<19)
-#define AC_SUPPCM_BITS_32		(1<<20)
+#define AC_SUPPCM_RATES              (0xfff << 0)
+#define AC_SUPPCM_BITS_8             (1<<16)
+#define AC_SUPPCM_BITS_16            (1<<17)
+#define AC_SUPPCM_BITS_20            (1<<18)
+#define AC_SUPPCM_BITS_24            (1<<19)
+#define AC_SUPPCM_BITS_32            (1<<20)
 
 /* supported PCM stream format */
-#define AC_SUPFMT_PCM			(1<<0)
-#define AC_SUPFMT_FLOAT32		(1<<1)
-#define AC_SUPFMT_AC3			(1<<2)
+#define AC_SUPFMT_PCM                (1<<0)
+#define AC_SUPFMT_FLOAT32            (1<<1)
+#define AC_SUPFMT_AC3                (1<<2)
 
 /* GP I/O count */
-#define AC_GPIO_IO_COUNT		(0xff<<0)
-#define AC_GPIO_O_COUNT			(0xff<<8)
-#define AC_GPIO_O_COUNT_SHIFT		8
-#define AC_GPIO_I_COUNT			(0xff<<16)
-#define AC_GPIO_I_COUNT_SHIFT		16
-#define AC_GPIO_UNSOLICITED		(1<<30)
-#define AC_GPIO_WAKE			(1<<31)
+#define AC_GPIO_IO_COUNT             (0xff<<0)
+#define AC_GPIO_O_COUNT              (0xff<<8)
+#define AC_GPIO_O_COUNT_SHIFT        8
+#define AC_GPIO_I_COUNT              (0xff<<16)
+#define AC_GPIO_I_COUNT_SHIFT        16
+#define AC_GPIO_UNSOLICITED          (1<<30)
+#define AC_GPIO_WAKE                 (1<<31)
 
 /* Converter stream, channel */
-#define AC_CONV_CHANNEL			(0xf<<0)
-#define AC_CONV_STREAM			(0xf<<4)
-#define AC_CONV_STREAM_SHIFT		4
+#define AC_CONV_CHANNEL              (0xf<<0)
+#define AC_CONV_STREAM               (0xf<<4)
+#define AC_CONV_STREAM_SHIFT         4
 
 /* Input converter SDI select */
-#define AC_SDI_SELECT			(0xf<<0)
+#define AC_SDI_SELECT                (0xf<<0)
 
 /* stream format id */
-#define AC_FMT_CHAN_SHIFT		0
-#define AC_FMT_CHAN_MASK		(0x0f << 0)
-#define AC_FMT_BITS_SHIFT		4
-#define AC_FMT_BITS_MASK		(7 << 4)
-#define AC_FMT_BITS_8			(0 << 4)
-#define AC_FMT_BITS_16			(1 << 4)
-#define AC_FMT_BITS_20			(2 << 4)
-#define AC_FMT_BITS_24			(3 << 4)
-#define AC_FMT_BITS_32			(4 << 4)
-#define AC_FMT_DIV_SHIFT		8
-#define AC_FMT_DIV_MASK			(7 << 8)
-#define AC_FMT_MULT_SHIFT		11
-#define AC_FMT_MULT_MASK		(7 << 11)
-#define AC_FMT_BASE_SHIFT		14
-#define AC_FMT_BASE_48K			(0 << 14)
-#define AC_FMT_BASE_44K			(1 << 14)
-#define AC_FMT_TYPE_SHIFT		15
-#define AC_FMT_TYPE_PCM			(0 << 15)
-#define AC_FMT_TYPE_NON_PCM		(1 << 15)
+#define AC_FMT_CHAN_SHIFT            0
+#define AC_FMT_CHAN_MASK             (0x0f << 0)
+#define AC_FMT_BITS_SHIFT            4
+#define AC_FMT_BITS_MASK             (7 << 4)
+#define AC_FMT_BITS_8                (0 << 4)
+#define AC_FMT_BITS_16               (1 << 4)
+#define AC_FMT_BITS_20               (2 << 4)
+#define AC_FMT_BITS_24               (3 << 4)
+#define AC_FMT_BITS_32               (4 << 4)
+#define AC_FMT_DIV_SHIFT             8
+#define AC_FMT_DIV_MASK              (7 << 8)
+#define AC_FMT_MULT_SHIFT            11
+#define AC_FMT_MULT_MASK             (7 << 11)
+#define AC_FMT_BASE_SHIFT            14
+#define AC_FMT_BASE_48K              (0 << 14)
+#define AC_FMT_BASE_44K              (1 << 14)
+#define AC_FMT_TYPE_SHIFT            15
+#define AC_FMT_TYPE_PCM              (0 << 15)
+#define AC_FMT_TYPE_NON_PCM          (1 << 15)
 
 /* Unsolicited response control */
-#define AC_UNSOL_TAG			(0x3f<<0)
-#define AC_UNSOL_ENABLED		(1<<7)
-#define AC_USRSP_EN			AC_UNSOL_ENABLED
+#define AC_UNSOL_TAG                 (0x3f<<0)
+#define AC_UNSOL_ENABLED             (1<<7)
+#define AC_USRSP_EN                  AC_UNSOL_ENABLED
 
 /* Unsolicited responses */
-#define AC_UNSOL_RES_TAG		(0x3f<<26)
-#define AC_UNSOL_RES_TAG_SHIFT		26
-#define AC_UNSOL_RES_SUBTAG		(0x1f<<21)
-#define AC_UNSOL_RES_SUBTAG_SHIFT	21
-#define AC_UNSOL_RES_ELDV		(1<<1)	/* ELD Data valid (for HDMI) */
-#define AC_UNSOL_RES_PD			(1<<0)	/* pinsense detect */
-#define AC_UNSOL_RES_CP_STATE		(1<<1)	/* content protection */
-#define AC_UNSOL_RES_CP_READY		(1<<0)	/* content protection */
+#define AC_UNSOL_RES_TAG             (0x3f<<26)
+#define AC_UNSOL_RES_TAG_SHIFT       26
+#define AC_UNSOL_RES_SUBTAG          (0x1f<<21)
+#define AC_UNSOL_RES_SUBTAG_SHIFT    21
+#define AC_UNSOL_RES_ELDV            (1<<1)    /* ELD Data valid (for HDMI) */
+#define AC_UNSOL_RES_PD              (1<<0)    /* pinsense detect */
+#define AC_UNSOL_RES_CP_STATE        (1<<1)    /* content protection */
+#define AC_UNSOL_RES_CP_READY        (1<<0)    /* content protection */
 
 /* Pin widget capabilies */
-#define AC_PINCAP_IMP_SENSE		(1<<0)	/* impedance sense capable */
-#define AC_PINCAP_TRIG_REQ		(1<<1)	/* trigger required */
-#define AC_PINCAP_PRES_DETECT		(1<<2)	/* presence detect capable */
-#define AC_PINCAP_HP_DRV		(1<<3)	/* headphone drive capable */
-#define AC_PINCAP_OUT			(1<<4)	/* output capable */
-#define AC_PINCAP_IN			(1<<5)	/* input capable */
-#define AC_PINCAP_BALANCE		(1<<6)	/* balanced I/O capable */
+#define AC_PINCAP_IMP_SENSE          (1<<0)    /* impedance sense capable */
+#define AC_PINCAP_TRIG_REQ           (1<<1)    /* trigger required */
+#define AC_PINCAP_PRES_DETECT        (1<<2)    /* presence detect capable */
+#define AC_PINCAP_HP_DRV             (1<<3)    /* headphone drive capable */
+#define AC_PINCAP_OUT                (1<<4)    /* output capable */
+#define AC_PINCAP_IN                 (1<<5)    /* input capable */
+#define AC_PINCAP_BALANCE            (1<<6)    /* balanced I/O capable */
 /* Note: This LR_SWAP pincap is defined in the Realtek ALC883 specification,
  *       but is marked reserved in the Intel HDA specification.
  */
-#define AC_PINCAP_LR_SWAP		(1<<7)	/* L/R swap */
+#define AC_PINCAP_LR_SWAP            (1<<7)    /* L/R swap */
 /* Note: The same bit as LR_SWAP is newly defined as HDMI capability
  *       in HD-audio specification
  */
-#define AC_PINCAP_HDMI			(1<<7)	/* HDMI pin */
-#define AC_PINCAP_DP			(1<<24)	/* DisplayPort pin, can
-						 * coexist with AC_PINCAP_HDMI
-						 */
-#define AC_PINCAP_VREF			(0x37<<8)
-#define AC_PINCAP_VREF_SHIFT		8
-#define AC_PINCAP_EAPD			(1<<16)	/* EAPD capable */
-#define AC_PINCAP_HBR			(1<<27)	/* High Bit Rate */
+#define AC_PINCAP_HDMI               (1<<7)    /* HDMI pin */
+#define AC_PINCAP_DP                 (1<<24)    /* DisplayPort pin, can
+                                                 * coexist with AC_PINCAP_HDMI
+                                                 */
+#define AC_PINCAP_VREF               (0x37<<8)
+#define AC_PINCAP_VREF_SHIFT         8
+#define AC_PINCAP_EAPD               (1<<16)    /* EAPD capable */
+#define AC_PINCAP_HBR                (1<<27)    /* High Bit Rate */
 /* Vref status (used in pin cap) */
-#define AC_PINCAP_VREF_HIZ		(1<<0)	/* Hi-Z */
-#define AC_PINCAP_VREF_50		(1<<1)	/* 50% */
-#define AC_PINCAP_VREF_GRD		(1<<2)	/* ground */
-#define AC_PINCAP_VREF_80		(1<<4)	/* 80% */
-#define AC_PINCAP_VREF_100		(1<<5)	/* 100% */
+#define AC_PINCAP_VREF_HIZ           (1<<0)    /* Hi-Z */
+#define AC_PINCAP_VREF_50            (1<<1)    /* 50% */
+#define AC_PINCAP_VREF_GRD           (1<<2)    /* ground */
+#define AC_PINCAP_VREF_80            (1<<4)    /* 80% */
+#define AC_PINCAP_VREF_100           (1<<5)    /* 100% */
 
 /* Amplifier capabilities */
-#define AC_AMPCAP_OFFSET		(0x7f<<0)  /* 0dB offset */
-#define AC_AMPCAP_OFFSET_SHIFT		0
-#define AC_AMPCAP_NUM_STEPS		(0x7f<<8)  /* number of steps */
-#define AC_AMPCAP_NUM_STEPS_SHIFT	8
-#define AC_AMPCAP_STEP_SIZE		(0x7f<<16) /* step size 0-32dB
-						    * in 0.25dB
-						    */
-#define AC_AMPCAP_STEP_SIZE_SHIFT	16
-#define AC_AMPCAP_MUTE			(1<<31)    /* mute capable */
-#define AC_AMPCAP_MUTE_SHIFT		31
+#define AC_AMPCAP_OFFSET             (0x7f<<0)  /* 0dB offset */
+#define AC_AMPCAP_OFFSET_SHIFT       0
+#define AC_AMPCAP_NUM_STEPS          (0x7f<<8)  /* number of steps */
+#define AC_AMPCAP_NUM_STEPS_SHIFT    8
+#define AC_AMPCAP_STEP_SIZE          (0x7f<<16) /* step size 0-32dB
+                                                 * in 0.25dB
+                                                 */
+#define AC_AMPCAP_STEP_SIZE_SHIFT    16
+#define AC_AMPCAP_MUTE               (1<<31)    /* mute capable */
+#define AC_AMPCAP_MUTE_SHIFT         31
 
 /* Connection list */
-#define AC_CLIST_LENGTH			(0x7f<<0)
-#define AC_CLIST_LONG			(1<<7)
+#define AC_CLIST_LENGTH              (0x7f<<0)
+#define AC_CLIST_LONG                (1<<7)
 
 /* Supported power status */
-#define AC_PWRST_D0SUP			(1<<0)
-#define AC_PWRST_D1SUP			(1<<1)
-#define AC_PWRST_D2SUP			(1<<2)
-#define AC_PWRST_D3SUP			(1<<3)
-#define AC_PWRST_D3COLDSUP		(1<<4)
-#define AC_PWRST_S3D3COLDSUP		(1<<29)
-#define AC_PWRST_CLKSTOP		(1<<30)
-#define AC_PWRST_EPSS			(1U<<31)
+#define AC_PWRST_D0SUP               (1<<0)
+#define AC_PWRST_D1SUP               (1<<1)
+#define AC_PWRST_D2SUP               (1<<2)
+#define AC_PWRST_D3SUP               (1<<3)
+#define AC_PWRST_D3COLDSUP           (1<<4)
+#define AC_PWRST_S3D3COLDSUP         (1<<29)
+#define AC_PWRST_CLKSTOP             (1<<30)
+#define AC_PWRST_EPSS                (1U<<31)
 
 /* Power state values */
-#define AC_PWRST_SETTING		(0xf<<0)
-#define AC_PWRST_ACTUAL			(0xf<<4)
-#define AC_PWRST_ACTUAL_SHIFT		4
-#define AC_PWRST_D0			0x00
-#define AC_PWRST_D1			0x01
-#define AC_PWRST_D2			0x02
-#define AC_PWRST_D3			0x03
+#define AC_PWRST_SETTING             (0xf<<0)
+#define AC_PWRST_ACTUAL              (0xf<<4)
+#define AC_PWRST_ACTUAL_SHIFT        4
+#define AC_PWRST_D0                  0x00
+#define AC_PWRST_D1                  0x01
+#define AC_PWRST_D2                  0x02
+#define AC_PWRST_D3                  0x03
 
 /* Processing capabilies */
-#define AC_PCAP_BENIGN			(1<<0)
-#define AC_PCAP_NUM_COEF		(0xff<<8)
-#define AC_PCAP_NUM_COEF_SHIFT		8
+#define AC_PCAP_BENIGN               (1<<0)
+#define AC_PCAP_NUM_COEF             (0xff<<8)
+#define AC_PCAP_NUM_COEF_SHIFT       8
 
 /* Volume knobs capabilities */
-#define AC_KNBCAP_NUM_STEPS		(0x7f<<0)
-#define AC_KNBCAP_DELTA			(1<<7)
+#define AC_KNBCAP_NUM_STEPS          (0x7f<<0)
+#define AC_KNBCAP_DELTA              (1<<7)
 
 /* HDMI LPCM capabilities */
-#define AC_LPCMCAP_48K_CP_CHNS		(0x0f<<0) /* max channels w/ CP-on */	
-#define AC_LPCMCAP_48K_NO_CHNS		(0x0f<<4) /* max channels w/o CP-on */
-#define AC_LPCMCAP_48K_20BIT		(1<<8)	/* 20b bitrate supported */
-#define AC_LPCMCAP_48K_24BIT		(1<<9)	/* 24b bitrate supported */
-#define AC_LPCMCAP_96K_CP_CHNS		(0x0f<<10) /* max channels w/ CP-on */	
-#define AC_LPCMCAP_96K_NO_CHNS		(0x0f<<14) /* max channels w/o CP-on */
-#define AC_LPCMCAP_96K_20BIT		(1<<18)	/* 20b bitrate supported */
-#define AC_LPCMCAP_96K_24BIT		(1<<19)	/* 24b bitrate supported */
-#define AC_LPCMCAP_192K_CP_CHNS		(0x0f<<20) /* max channels w/ CP-on */	
-#define AC_LPCMCAP_192K_NO_CHNS		(0x0f<<24) /* max channels w/o CP-on */
-#define AC_LPCMCAP_192K_20BIT		(1<<28)	/* 20b bitrate supported */
-#define AC_LPCMCAP_192K_24BIT		(1<<29)	/* 24b bitrate supported */
-#define AC_LPCMCAP_44K			(1<<30)	/* 44.1kHz support */
-#define AC_LPCMCAP_44K_MS		(1<<31)	/* 44.1kHz-multiplies support */
+#define AC_LPCMCAP_48K_CP_CHNS       (0x0f<<0) /* max channels w/ CP-on */
+#define AC_LPCMCAP_48K_NO_CHNS       (0x0f<<4) /* max channels w/o CP-on */
+#define AC_LPCMCAP_48K_20BIT         (1<<8)    /* 20b bitrate supported */
+#define AC_LPCMCAP_48K_24BIT         (1<<9)    /* 24b bitrate supported */
+#define AC_LPCMCAP_96K_CP_CHNS       (0x0f<<10) /* max channels w/ CP-on */
+#define AC_LPCMCAP_96K_NO_CHNS       (0x0f<<14) /* max channels w/o CP-on */
+#define AC_LPCMCAP_96K_20BIT         (1<<18)    /* 20b bitrate supported */
+#define AC_LPCMCAP_96K_24BIT         (1<<19)    /* 24b bitrate supported */
+#define AC_LPCMCAP_192K_CP_CHNS      (0x0f<<20) /* max channels w/ CP-on */
+#define AC_LPCMCAP_192K_NO_CHNS      (0x0f<<24) /* max channels w/o CP-on */
+#define AC_LPCMCAP_192K_20BIT        (1<<28)    /* 20b bitrate supported */
+#define AC_LPCMCAP_192K_24BIT        (1<<29)    /* 24b bitrate supported */
+#define AC_LPCMCAP_44K               (1<<30)    /* 44.1kHz support */
+#define AC_LPCMCAP_44K_MS            (1<<31)    /* 44.1kHz-multiplies support */
 
 /*
  * Control Parameters
  */
 
 /* Amp gain/mute */
-#define AC_AMP_MUTE			(1<<7)
-#define AC_AMP_GAIN			(0x7f)
-#define AC_AMP_GET_INDEX		(0xf<<0)
-
-#define AC_AMP_GET_LEFT			(1<<13)
-#define AC_AMP_GET_RIGHT		(0<<13)
-#define AC_AMP_GET_OUTPUT		(1<<15)
-#define AC_AMP_GET_INPUT		(0<<15)
-
-#define AC_AMP_SET_INDEX		(0xf<<8)
-#define AC_AMP_SET_INDEX_SHIFT		8
-#define AC_AMP_SET_RIGHT		(1<<12)
-#define AC_AMP_SET_LEFT			(1<<13)
-#define AC_AMP_SET_INPUT		(1<<14)
-#define AC_AMP_SET_OUTPUT		(1<<15)
+#define AC_AMP_MUTE                  (1<<7)
+#define AC_AMP_GAIN                  (0x7f)
+#define AC_AMP_GET_INDEX             (0xf<<0)
+
+#define AC_AMP_GET_LEFT              (1<<13)
+#define AC_AMP_GET_RIGHT             (0<<13)
+#define AC_AMP_GET_OUTPUT            (1<<15)
+#define AC_AMP_GET_INPUT             (0<<15)
+
+#define AC_AMP_SET_INDEX             (0xf<<8)
+#define AC_AMP_SET_INDEX_SHIFT       8
+#define AC_AMP_SET_RIGHT             (1<<12)
+#define AC_AMP_SET_LEFT              (1<<13)
+#define AC_AMP_SET_INPUT             (1<<14)
+#define AC_AMP_SET_OUTPUT            (1<<15)
 
 /* DIGITAL1 bits */
-#define AC_DIG1_ENABLE			(1<<0)
-#define AC_DIG1_V			(1<<1)
-#define AC_DIG1_VCFG			(1<<2)
-#define AC_DIG1_EMPHASIS		(1<<3)
-#define AC_DIG1_COPYRIGHT		(1<<4)
-#define AC_DIG1_NONAUDIO		(1<<5)
-#define AC_DIG1_PROFESSIONAL		(1<<6)
-#define AC_DIG1_LEVEL			(1<<7)
+#define AC_DIG1_ENABLE               (1<<0)
+#define AC_DIG1_V                    (1<<1)
+#define AC_DIG1_VCFG                 (1<<2)
+#define AC_DIG1_EMPHASIS             (1<<3)
+#define AC_DIG1_COPYRIGHT            (1<<4)
+#define AC_DIG1_NONAUDIO             (1<<5)
+#define AC_DIG1_PROFESSIONAL         (1<<6)
+#define AC_DIG1_LEVEL                (1<<7)
 
 /* DIGITAL2 bits */
-#define AC_DIG2_CC			(0x7f<<0)
+#define AC_DIG2_CC                   (0x7f<<0)
 
 /* Pin widget control - 8bit */
-#define AC_PINCTL_EPT			(0x3<<0)
-#define AC_PINCTL_EPT_NATIVE		0
-#define AC_PINCTL_EPT_HBR		3
-#define AC_PINCTL_VREFEN		(0x7<<0)
-#define AC_PINCTL_VREF_HIZ		0	/* Hi-Z */
-#define AC_PINCTL_VREF_50		1	/* 50% */
-#define AC_PINCTL_VREF_GRD		2	/* ground */
-#define AC_PINCTL_VREF_80		4	/* 80% */
-#define AC_PINCTL_VREF_100		5	/* 100% */
-#define AC_PINCTL_IN_EN			(1<<5)
-#define AC_PINCTL_OUT_EN		(1<<6)
-#define AC_PINCTL_HP_EN			(1<<7)
+#define AC_PINCTL_EPT                (0x3<<0)
+#define AC_PINCTL_EPT_NATIVE          0
+#define AC_PINCTL_EPT_HBR             3
+#define AC_PINCTL_VREFEN             (0x7<<0)
+#define AC_PINCTL_VREF_HIZ            0    /* Hi-Z */
+#define AC_PINCTL_VREF_50             1    /* 50% */
+#define AC_PINCTL_VREF_GRD            2    /* ground */
+#define AC_PINCTL_VREF_80             4    /* 80% */
+#define AC_PINCTL_VREF_100            5    /* 100% */
+#define AC_PINCTL_IN_EN              (1<<5)
+#define AC_PINCTL_OUT_EN             (1<<6)
+#define AC_PINCTL_HP_EN              (1<<7)
 
 /* Pin sense - 32bit */
-#define AC_PINSENSE_IMPEDANCE_MASK	(0x7fffffff)
-#define AC_PINSENSE_PRESENCE		(1<<31)
-#define AC_PINSENSE_ELDV		(1<<30)	/* ELD valid (HDMI) */
+#define AC_PINSENSE_IMPEDANCE_MASK   (0x7fffffff)
+#define AC_PINSENSE_PRESENCE         (1<<31)
+#define AC_PINSENSE_ELDV             (1<<30)    /* ELD valid (HDMI) */
 
 /* EAPD/BTL enable - 32bit */
-#define AC_EAPDBTL_BALANCED		(1<<0)
-#define AC_EAPDBTL_EAPD			(1<<1)
-#define AC_EAPDBTL_LR_SWAP		(1<<2)
+#define AC_EAPDBTL_BALANCED          (1<<0)
+#define AC_EAPDBTL_EAPD              (1<<1)
+#define AC_EAPDBTL_LR_SWAP           (1<<2)
 
 /* HDMI ELD data */
-#define AC_ELDD_ELD_VALID		(1<<31)
-#define AC_ELDD_ELD_DATA		0xff
+#define AC_ELDD_ELD_VALID            (1<<31)
+#define AC_ELDD_ELD_DATA             0xff
 
 /* HDMI DIP size */
-#define AC_DIPSIZE_ELD_BUF		(1<<3) /* ELD buf size of packet size */
-#define AC_DIPSIZE_PACK_IDX		(0x07<<0) /* packet index */
+#define AC_DIPSIZE_ELD_BUF           (1<<3) /* ELD buf size of packet size */
+#define AC_DIPSIZE_PACK_IDX          (0x07<<0) /* packet index */
 
 /* HDMI DIP index */
-#define AC_DIPIDX_PACK_IDX		(0x07<<5) /* packet idnex */
-#define AC_DIPIDX_BYTE_IDX		(0x1f<<0) /* byte index */
+#define AC_DIPIDX_PACK_IDX           (0x07<<5) /* packet idnex */
+#define AC_DIPIDX_BYTE_IDX           (0x1f<<0) /* byte index */
 
 /* HDMI DIP xmit (transmit) control */
-#define AC_DIPXMIT_MASK			(0x3<<6)
-#define AC_DIPXMIT_DISABLE		(0x0<<6) /* disable xmit */
-#define AC_DIPXMIT_ONCE			(0x2<<6) /* xmit once then disable */
-#define AC_DIPXMIT_BEST			(0x3<<6) /* best effort */
+#define AC_DIPXMIT_MASK              (0x3<<6)
+#define AC_DIPXMIT_DISABLE           (0x0<<6) /* disable xmit */
+#define AC_DIPXMIT_ONCE              (0x2<<6) /* xmit once then disable */
+#define AC_DIPXMIT_BEST              (0x3<<6) /* best effort */
 
 /* HDMI content protection (CP) control */
-#define AC_CPCTRL_CES			(1<<9) /* current encryption state */
-#define AC_CPCTRL_READY			(1<<8) /* ready bit */
-#define AC_CPCTRL_SUBTAG		(0x1f<<3) /* subtag for unsol-resp */
-#define AC_CPCTRL_STATE			(3<<0) /* current CP request state */
+#define AC_CPCTRL_CES                (1<<9) /* current encryption state */
+#define AC_CPCTRL_READY              (1<<8) /* ready bit */
+#define AC_CPCTRL_SUBTAG             (0x1f<<3) /* subtag for unsol-resp */
+#define AC_CPCTRL_STATE              (3<<0) /* current CP request state */
 
 /* Converter channel <-> HDMI slot mapping */
-#define AC_CVTMAP_HDMI_SLOT		(0xf<<0) /* HDMI slot number */
-#define AC_CVTMAP_CHAN			(0xf<<4) /* converter channel number */
+#define AC_CVTMAP_HDMI_SLOT          (0xf<<0) /* HDMI slot number */
+#define AC_CVTMAP_CHAN               (0xf<<4) /* converter channel number */
 
 /* configuration default - 32bit */
-#define AC_DEFCFG_SEQUENCE		(0xf<<0)
-#define AC_DEFCFG_DEF_ASSOC		(0xf<<4)
-#define AC_DEFCFG_ASSOC_SHIFT		4
-#define AC_DEFCFG_MISC			(0xf<<8)
-#define AC_DEFCFG_MISC_SHIFT		8
-#define AC_DEFCFG_MISC_NO_PRESENCE	(1<<0)
-#define AC_DEFCFG_COLOR			(0xf<<12)
-#define AC_DEFCFG_COLOR_SHIFT		12
-#define AC_DEFCFG_CONN_TYPE		(0xf<<16)
-#define AC_DEFCFG_CONN_TYPE_SHIFT	16
-#define AC_DEFCFG_DEVICE		(0xf<<20)
-#define AC_DEFCFG_DEVICE_SHIFT		20
-#define AC_DEFCFG_LOCATION		(0x3f<<24)
-#define AC_DEFCFG_LOCATION_SHIFT	24
-#define AC_DEFCFG_PORT_CONN		(0x3<<30)
-#define AC_DEFCFG_PORT_CONN_SHIFT	30
+#define AC_DEFCFG_SEQUENCE           (0xf<<0)
+#define AC_DEFCFG_DEF_ASSOC          (0xf<<4)
+#define AC_DEFCFG_ASSOC_SHIFT        4
+#define AC_DEFCFG_MISC               (0xf<<8)
+#define AC_DEFCFG_MISC_SHIFT         8
+#define AC_DEFCFG_MISC_NO_PRESENCE   (1<<0)
+#define AC_DEFCFG_COLOR              (0xf<<12)
+#define AC_DEFCFG_COLOR_SHIFT        12
+#define AC_DEFCFG_CONN_TYPE          (0xf<<16)
+#define AC_DEFCFG_CONN_TYPE_SHIFT    16
+#define AC_DEFCFG_DEVICE             (0xf<<20)
+#define AC_DEFCFG_DEVICE_SHIFT       20
+#define AC_DEFCFG_LOCATION           (0x3f<<24)
+#define AC_DEFCFG_LOCATION_SHIFT     24
+#define AC_DEFCFG_PORT_CONN          (0x3<<30)
+#define AC_DEFCFG_PORT_CONN_SHIFT    30
 
 /* device device types (0x0-0xf) */
 enum {
-	AC_JACK_LINE_OUT,
-	AC_JACK_SPEAKER,
-	AC_JACK_HP_OUT,
-	AC_JACK_CD,
-	AC_JACK_SPDIF_OUT,
-	AC_JACK_DIG_OTHER_OUT,
-	AC_JACK_MODEM_LINE_SIDE,
-	AC_JACK_MODEM_HAND_SIDE,
-	AC_JACK_LINE_IN,
-	AC_JACK_AUX,
-	AC_JACK_MIC_IN,
-	AC_JACK_TELEPHONY,
-	AC_JACK_SPDIF_IN,
-	AC_JACK_DIG_OTHER_IN,
-	AC_JACK_OTHER = 0xf,
+    AC_JACK_LINE_OUT,
+    AC_JACK_SPEAKER,
+    AC_JACK_HP_OUT,
+    AC_JACK_CD,
+    AC_JACK_SPDIF_OUT,
+    AC_JACK_DIG_OTHER_OUT,
+    AC_JACK_MODEM_LINE_SIDE,
+    AC_JACK_MODEM_HAND_SIDE,
+    AC_JACK_LINE_IN,
+    AC_JACK_AUX,
+    AC_JACK_MIC_IN,
+    AC_JACK_TELEPHONY,
+    AC_JACK_SPDIF_IN,
+    AC_JACK_DIG_OTHER_IN,
+    AC_JACK_OTHER = 0xf,
 };
 
 /* jack connection types (0x0-0xf) */
 enum {
-	AC_JACK_CONN_UNKNOWN,
-	AC_JACK_CONN_1_8,
-	AC_JACK_CONN_1_4,
-	AC_JACK_CONN_ATAPI,
-	AC_JACK_CONN_RCA,
-	AC_JACK_CONN_OPTICAL,
-	AC_JACK_CONN_OTHER_DIGITAL,
-	AC_JACK_CONN_OTHER_ANALOG,
-	AC_JACK_CONN_DIN,
-	AC_JACK_CONN_XLR,
-	AC_JACK_CONN_RJ11,
-	AC_JACK_CONN_COMB,
-	AC_JACK_CONN_OTHER = 0xf,
+    AC_JACK_CONN_UNKNOWN,
+    AC_JACK_CONN_1_8,
+    AC_JACK_CONN_1_4,
+    AC_JACK_CONN_ATAPI,
+    AC_JACK_CONN_RCA,
+    AC_JACK_CONN_OPTICAL,
+    AC_JACK_CONN_OTHER_DIGITAL,
+    AC_JACK_CONN_OTHER_ANALOG,
+    AC_JACK_CONN_DIN,
+    AC_JACK_CONN_XLR,
+    AC_JACK_CONN_RJ11,
+    AC_JACK_CONN_COMB,
+    AC_JACK_CONN_OTHER = 0xf,
 };
 
 /* jack colors (0x0-0xf) */
 enum {
-	AC_JACK_COLOR_UNKNOWN,
-	AC_JACK_COLOR_BLACK,
-	AC_JACK_COLOR_GREY,
-	AC_JACK_COLOR_BLUE,
-	AC_JACK_COLOR_GREEN,
-	AC_JACK_COLOR_RED,
-	AC_JACK_COLOR_ORANGE,
-	AC_JACK_COLOR_YELLOW,
-	AC_JACK_COLOR_PURPLE,
-	AC_JACK_COLOR_PINK,
-	AC_JACK_COLOR_WHITE = 0xe,
-	AC_JACK_COLOR_OTHER,
+    AC_JACK_COLOR_UNKNOWN,
+    AC_JACK_COLOR_BLACK,
+    AC_JACK_COLOR_GREY,
+    AC_JACK_COLOR_BLUE,
+    AC_JACK_COLOR_GREEN,
+    AC_JACK_COLOR_RED,
+    AC_JACK_COLOR_ORANGE,
+    AC_JACK_COLOR_YELLOW,
+    AC_JACK_COLOR_PURPLE,
+    AC_JACK_COLOR_PINK,
+    AC_JACK_COLOR_WHITE = 0xe,
+    AC_JACK_COLOR_OTHER,
 };
 
 /* Jack location (0x0-0x3f) */
 /* common case */
 enum {
-	AC_JACK_LOC_NONE,
-	AC_JACK_LOC_REAR,
-	AC_JACK_LOC_FRONT,
-	AC_JACK_LOC_LEFT,
-	AC_JACK_LOC_RIGHT,
-	AC_JACK_LOC_TOP,
-	AC_JACK_LOC_BOTTOM,
+    AC_JACK_LOC_NONE,
+    AC_JACK_LOC_REAR,
+    AC_JACK_LOC_FRONT,
+    AC_JACK_LOC_LEFT,
+    AC_JACK_LOC_RIGHT,
+    AC_JACK_LOC_TOP,
+    AC_JACK_LOC_BOTTOM,
 };
 /* bits 4-5 */
 enum {
-	AC_JACK_LOC_EXTERNAL = 0x00,
-	AC_JACK_LOC_INTERNAL = 0x10,
-	AC_JACK_LOC_SEPARATE = 0x20,
-	AC_JACK_LOC_OTHER    = 0x30,
+    AC_JACK_LOC_EXTERNAL = 0x00,
+    AC_JACK_LOC_INTERNAL = 0x10,
+    AC_JACK_LOC_SEPARATE = 0x20,
+    AC_JACK_LOC_OTHER    = 0x30,
 };
 enum {
-	/* external on primary chasis */
-	AC_JACK_LOC_REAR_PANEL = 0x07,
-	AC_JACK_LOC_DRIVE_BAY,
-	/* internal */
-	AC_JACK_LOC_RISER = 0x17,
-	AC_JACK_LOC_HDMI,
-	AC_JACK_LOC_ATAPI,
-	/* others */
-	AC_JACK_LOC_MOBILE_IN = 0x37,
-	AC_JACK_LOC_MOBILE_OUT,
+    /* external on primary chasis */
+    AC_JACK_LOC_REAR_PANEL = 0x07,
+    AC_JACK_LOC_DRIVE_BAY,
+    /* internal */
+    AC_JACK_LOC_RISER = 0x17,
+    AC_JACK_LOC_HDMI,
+    AC_JACK_LOC_ATAPI,
+    /* others */
+    AC_JACK_LOC_MOBILE_IN = 0x37,
+    AC_JACK_LOC_MOBILE_OUT,
 };
 
 /* Port connectivity (0-3) */
 enum {
-	AC_JACK_PORT_COMPLEX,
-	AC_JACK_PORT_NONE,
-	AC_JACK_PORT_FIXED,
-	AC_JACK_PORT_BOTH,
+    AC_JACK_PORT_COMPLEX,
+    AC_JACK_PORT_NONE,
+    AC_JACK_PORT_FIXED,
+    AC_JACK_PORT_BOTH,
 };
 
 /* max. connections to a widget */
-#define HDA_MAX_CONNECTIONS	32
+#define HDA_MAX_CONNECTIONS      32
 
 /* max. codec address */
-#define HDA_MAX_CODEC_ADDRESS	0x0f
+#define HDA_MAX_CODEC_ADDRESS    0x0f
 
 /* max number of PCM devics per card */
-#define HDA_MAX_PCMS		10
+#define HDA_MAX_PCMS             10
 
 /* --------------------------------------------------------------------- */
 
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index b5722b37c3..6f289568dc 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -15,10 +15,10 @@
 #include "audio/audio.h"
 #include "qom/object.h"
 
-#define IN_PORT_N	3
-#define OUT_PORT_N	3
+#define IN_PORT_N     3
+#define OUT_PORT_N    3
 
-#define CODEC		"wm8750"
+#define CODEC         "wm8750"
 
 typedef struct {
     int adc;
@@ -64,8 +64,8 @@ static const uint8_t wm8750_vol_db_table[] = {
     4, 4, 3, 3, 3, 2, 2
 };
 
-#define WM8750_OUTVOL_TRANSFORM(x)	wm8750_vol_db_table[(0x7f - x) / 3]
-#define WM8750_INVOL_TRANSFORM(x)	(x << 2)
+#define WM8750_OUTVOL_TRANSFORM(x)    wm8750_vol_db_table[(0x7f - x) / 3]
+#define WM8750_INVOL_TRANSFORM(x)    (x << 2)
 
 static inline void wm8750_in_load(WM8750State *s)
 {
@@ -107,38 +107,38 @@ static void wm8750_audio_out_cb(void *opaque, int free_b)
 }
 
 static const WMRate wm_rate_table[] = {
-    {  256, 48000,  256, 48000 },	/* SR: 00000 */
-    {  384, 48000,  384, 48000 },	/* SR: 00001 */
-    {  256, 48000, 1536,  8000 },	/* SR: 00010 */
-    {  384, 48000, 2304,  8000 },	/* SR: 00011 */
-    { 1536,  8000,  256, 48000 },	/* SR: 00100 */
-    { 2304,  8000,  384, 48000 },	/* SR: 00101 */
-    { 1536,  8000, 1536,  8000 },	/* SR: 00110 */
-    { 2304,  8000, 2304,  8000 },	/* SR: 00111 */
-    { 1024, 12000, 1024, 12000 },	/* SR: 01000 */
-    { 1526, 12000, 1536, 12000 },	/* SR: 01001 */
-    {  768, 16000,  768, 16000 },	/* SR: 01010 */
-    { 1152, 16000, 1152, 16000 },	/* SR: 01011 */
-    {  384, 32000,  384, 32000 },	/* SR: 01100 */
-    {  576, 32000,  576, 32000 },	/* SR: 01101 */
-    {  128, 96000,  128, 96000 },	/* SR: 01110 */
-    {  192, 96000,  192, 96000 },	/* SR: 01111 */
-    {  256, 44100,  256, 44100 },	/* SR: 10000 */
-    {  384, 44100,  384, 44100 },	/* SR: 10001 */
-    {  256, 44100, 1408,  8018 },	/* SR: 10010 */
-    {  384, 44100, 2112,  8018 },	/* SR: 10011 */
-    { 1408,  8018,  256, 44100 },	/* SR: 10100 */
-    { 2112,  8018,  384, 44100 },	/* SR: 10101 */
-    { 1408,  8018, 1408,  8018 },	/* SR: 10110 */
-    { 2112,  8018, 2112,  8018 },	/* SR: 10111 */
-    { 1024, 11025, 1024, 11025 },	/* SR: 11000 */
-    { 1536, 11025, 1536, 11025 },	/* SR: 11001 */
-    {  512, 22050,  512, 22050 },	/* SR: 11010 */
-    {  768, 22050,  768, 22050 },	/* SR: 11011 */
-    {  512, 24000,  512, 24000 },	/* SR: 11100 */
-    {  768, 24000,  768, 24000 },	/* SR: 11101 */
-    {  128, 88200,  128, 88200 },	/* SR: 11110 */
-    {  192, 88200,  192, 88200 },	/* SR: 11111 */
+    {  256, 48000,  256, 48000 },    /* SR: 00000 */
+    {  384, 48000,  384, 48000 },    /* SR: 00001 */
+    {  256, 48000, 1536,  8000 },    /* SR: 00010 */
+    {  384, 48000, 2304,  8000 },    /* SR: 00011 */
+    { 1536,  8000,  256, 48000 },    /* SR: 00100 */
+    { 2304,  8000,  384, 48000 },    /* SR: 00101 */
+    { 1536,  8000, 1536,  8000 },    /* SR: 00110 */
+    { 2304,  8000, 2304,  8000 },    /* SR: 00111 */
+    { 1024, 12000, 1024, 12000 },    /* SR: 01000 */
+    { 1526, 12000, 1536, 12000 },    /* SR: 01001 */
+    {  768, 16000,  768, 16000 },    /* SR: 01010 */
+    { 1152, 16000, 1152, 16000 },    /* SR: 01011 */
+    {  384, 32000,  384, 32000 },    /* SR: 01100 */
+    {  576, 32000,  576, 32000 },    /* SR: 01101 */
+    {  128, 96000,  128, 96000 },    /* SR: 01110 */
+    {  192, 96000,  192, 96000 },    /* SR: 01111 */
+    {  256, 44100,  256, 44100 },    /* SR: 10000 */
+    {  384, 44100,  384, 44100 },    /* SR: 10001 */
+    {  256, 44100, 1408,  8018 },    /* SR: 10010 */
+    {  384, 44100, 2112,  8018 },    /* SR: 10011 */
+    { 1408,  8018,  256, 44100 },    /* SR: 10100 */
+    { 2112,  8018,  384, 44100 },    /* SR: 10101 */
+    { 1408,  8018, 1408,  8018 },    /* SR: 10110 */
+    { 2112,  8018, 2112,  8018 },    /* SR: 10111 */
+    { 1024, 11025, 1024, 11025 },    /* SR: 11000 */
+    { 1536, 11025, 1536, 11025 },    /* SR: 11001 */
+    {  512, 22050,  512, 22050 },    /* SR: 11010 */
+    {  768, 22050,  768, 22050 },    /* SR: 11011 */
+    {  512, 24000,  512, 24000 },    /* SR: 11100 */
+    {  768, 24000,  768, 24000 },    /* SR: 11101 */
+    {  128, 88200,  128, 88200 },    /* SR: 11110 */
+    {  192, 88200,  192, 88200 },    /* SR: 11111 */
 };
 
 static void wm8750_vol_update(WM8750State *s)
@@ -327,42 +327,42 @@ static int wm8750_event(I2CSlave *i2c, enum i2c_event event)
     return 0;
 }
 
-#define WM8750_LINVOL	0x00
-#define WM8750_RINVOL	0x01
-#define WM8750_LOUT1V	0x02
-#define WM8750_ROUT1V	0x03
-#define WM8750_ADCDAC	0x05
-#define WM8750_IFACE	0x07
-#define WM8750_SRATE	0x08
-#define WM8750_LDAC	0x0a
-#define WM8750_RDAC	0x0b
-#define WM8750_BASS	0x0c
-#define WM8750_TREBLE	0x0d
-#define WM8750_RESET	0x0f
-#define WM8750_3D	0x10
-#define WM8750_ALC1	0x11
-#define WM8750_ALC2	0x12
-#define WM8750_ALC3	0x13
-#define WM8750_NGATE	0x14
-#define WM8750_LADC	0x15
-#define WM8750_RADC	0x16
-#define WM8750_ADCTL1	0x17
-#define WM8750_ADCTL2	0x18
-#define WM8750_PWR1	0x19
-#define WM8750_PWR2	0x1a
-#define WM8750_ADCTL3	0x1b
-#define WM8750_ADCIN	0x1f
-#define WM8750_LADCIN	0x20
-#define WM8750_RADCIN	0x21
-#define WM8750_LOUTM1	0x22
-#define WM8750_LOUTM2	0x23
-#define WM8750_ROUTM1	0x24
-#define WM8750_ROUTM2	0x25
-#define WM8750_MOUTM1	0x26
-#define WM8750_MOUTM2	0x27
-#define WM8750_LOUT2V	0x28
-#define WM8750_ROUT2V	0x29
-#define WM8750_MOUTV	0x2a
+#define WM8750_LINVOL    0x00
+#define WM8750_RINVOL    0x01
+#define WM8750_LOUT1V    0x02
+#define WM8750_ROUT1V    0x03
+#define WM8750_ADCDAC    0x05
+#define WM8750_IFACE     0x07
+#define WM8750_SRATE     0x08
+#define WM8750_LDAC      0x0a
+#define WM8750_RDAC      0x0b
+#define WM8750_BASS      0x0c
+#define WM8750_TREBLE    0x0d
+#define WM8750_RESET     0x0f
+#define WM8750_3D        0x10
+#define WM8750_ALC1      0x11
+#define WM8750_ALC2      0x12
+#define WM8750_ALC3      0x13
+#define WM8750_NGATE     0x14
+#define WM8750_LADC      0x15
+#define WM8750_RADC      0x16
+#define WM8750_ADCTL1    0x17
+#define WM8750_ADCTL2    0x18
+#define WM8750_PWR1      0x19
+#define WM8750_PWR2      0x1a
+#define WM8750_ADCTL3    0x1b
+#define WM8750_ADCIN     0x1f
+#define WM8750_LADCIN    0x20
+#define WM8750_RADCIN    0x21
+#define WM8750_LOUTM1    0x22
+#define WM8750_LOUTM2    0x23
+#define WM8750_ROUTM1    0x24
+#define WM8750_ROUTM2    0x25
+#define WM8750_MOUTM1    0x26
+#define WM8750_MOUTM2    0x27
+#define WM8750_LOUT2V    0x28
+#define WM8750_ROUT2V    0x29
+#define WM8750_MOUTV     0x2a
 
 static int wm8750_tx(I2CSlave *i2c, uint8_t data)
 {
@@ -384,174 +384,174 @@ static int wm8750_tx(I2CSlave *i2c, uint8_t data)
     value = ((s->i2c_data[0] << 8) | s->i2c_data[1]) & 0x1ff;
 
     switch (cmd) {
-    case WM8750_LADCIN:	/* ADC Signal Path Control (Left) */
-        s->diff[0] = (((value >> 6) & 3) == 3);	/* LINSEL */
+    case WM8750_LADCIN:    /* ADC Signal Path Control (Left) */
+        s->diff[0] = (((value >> 6) & 3) == 3);    /* LINSEL */
         if (s->diff[0])
             s->in[0] = &s->adc_voice[0 + s->ds * 1];
         else
             s->in[0] = &s->adc_voice[((value >> 6) & 3) * 1 + 0];
         break;
 
-    case WM8750_RADCIN:	/* ADC Signal Path Control (Right) */
-        s->diff[1] = (((value >> 6) & 3) == 3);	/* RINSEL */
+    case WM8750_RADCIN:    /* ADC Signal Path Control (Right) */
+        s->diff[1] = (((value >> 6) & 3) == 3);    /* RINSEL */
         if (s->diff[1])
             s->in[1] = &s->adc_voice[0 + s->ds * 1];
         else
             s->in[1] = &s->adc_voice[((value >> 6) & 3) * 1 + 0];
         break;
 
-    case WM8750_ADCIN:	/* ADC Input Mode */
-        s->ds = (value >> 8) & 1;	/* DS */
+    case WM8750_ADCIN:    /* ADC Input Mode */
+        s->ds = (value >> 8) & 1;    /* DS */
         if (s->diff[0])
             s->in[0] = &s->adc_voice[0 + s->ds * 1];
         if (s->diff[1])
             s->in[1] = &s->adc_voice[0 + s->ds * 1];
-        s->monomix[0] = (value >> 6) & 3;	/* MONOMIX */
+        s->monomix[0] = (value >> 6) & 3;    /* MONOMIX */
         break;
 
-    case WM8750_ADCTL1:	/* Additional Control (1) */
-        s->monomix[1] = (value >> 1) & 1;	/* DMONOMIX */
+    case WM8750_ADCTL1:    /* Additional Control (1) */
+        s->monomix[1] = (value >> 1) & 1;    /* DMONOMIX */
         break;
 
-    case WM8750_PWR1:	/* Power Management (1) */
-        s->enable = ((value >> 6) & 7) == 3;	/* VMIDSEL, VREF */
+    case WM8750_PWR1:    /* Power Management (1) */
+        s->enable = ((value >> 6) & 7) == 3;    /* VMIDSEL, VREF */
         wm8750_set_format(s);
         break;
 
-    case WM8750_LINVOL:	/* Left Channel PGA */
-        s->invol[0] = value & 0x3f;		/* LINVOL */
-        s->inmute[0] = (value >> 7) & 1;	/* LINMUTE */
+    case WM8750_LINVOL:    /* Left Channel PGA */
+        s->invol[0] = value & 0x3f;        /* LINVOL */
+        s->inmute[0] = (value >> 7) & 1;    /* LINMUTE */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_RINVOL:	/* Right Channel PGA */
-        s->invol[1] = value & 0x3f;		/* RINVOL */
-        s->inmute[1] = (value >> 7) & 1;	/* RINMUTE */
+    case WM8750_RINVOL:    /* Right Channel PGA */
+        s->invol[1] = value & 0x3f;        /* RINVOL */
+        s->inmute[1] = (value >> 7) & 1;    /* RINMUTE */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ADCDAC:	/* ADC and DAC Control */
-        s->pol = (value >> 5) & 3;		/* ADCPOL */
-        s->mute = (value >> 3) & 1;		/* DACMU */
+    case WM8750_ADCDAC:    /* ADC and DAC Control */
+        s->pol = (value >> 5) & 3;        /* ADCPOL */
+        s->mute = (value >> 3) & 1;        /* DACMU */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ADCTL3:	/* Additional Control (3) */
+    case WM8750_ADCTL3:    /* Additional Control (3) */
         break;
 
-    case WM8750_LADC:	/* Left ADC Digital Volume */
-        s->invol[2] = value & 0xff;		/* LADCVOL */
+    case WM8750_LADC:    /* Left ADC Digital Volume */
+        s->invol[2] = value & 0xff;        /* LADCVOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_RADC:	/* Right ADC Digital Volume */
-        s->invol[3] = value & 0xff;		/* RADCVOL */
+    case WM8750_RADC:    /* Right ADC Digital Volume */
+        s->invol[3] = value & 0xff;        /* RADCVOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ALC1:	/* ALC Control (1) */
-        s->alc = (value >> 7) & 3;		/* ALCSEL */
+    case WM8750_ALC1:    /* ALC Control (1) */
+        s->alc = (value >> 7) & 3;        /* ALCSEL */
         break;
 
-    case WM8750_NGATE:	/* Noise Gate Control */
-    case WM8750_3D:	/* 3D enhance */
+    case WM8750_NGATE:    /* Noise Gate Control */
+    case WM8750_3D:    /* 3D enhance */
         break;
 
-    case WM8750_LDAC:	/* Left Channel Digital Volume */
-        s->outvol[0] = value & 0xff;		/* LDACVOL */
+    case WM8750_LDAC:    /* Left Channel Digital Volume */
+        s->outvol[0] = value & 0xff;        /* LDACVOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_RDAC:	/* Right Channel Digital Volume */
-        s->outvol[1] = value & 0xff;		/* RDACVOL */
+    case WM8750_RDAC:    /* Right Channel Digital Volume */
+        s->outvol[1] = value & 0xff;        /* RDACVOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_BASS:	/* Bass Control */
+    case WM8750_BASS:    /* Bass Control */
         break;
 
-    case WM8750_LOUTM1:	/* Left Mixer Control (1) */
-        s->path[0] = (value >> 8) & 1;		/* LD2LO */
+    case WM8750_LOUTM1:    /* Left Mixer Control (1) */
+        s->path[0] = (value >> 8) & 1;        /* LD2LO */
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_LOUTM2:	/* Left Mixer Control (2) */
-        s->path[1] = (value >> 8) & 1;		/* RD2LO */
+    case WM8750_LOUTM2:    /* Left Mixer Control (2) */
+        s->path[1] = (value >> 8) & 1;        /* RD2LO */
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ROUTM1:	/* Right Mixer Control (1) */
-        s->path[2] = (value >> 8) & 1;		/* LD2RO */
+    case WM8750_ROUTM1:    /* Right Mixer Control (1) */
+        s->path[2] = (value >> 8) & 1;        /* LD2RO */
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ROUTM2:	/* Right Mixer Control (2) */
-        s->path[3] = (value >> 8) & 1;		/* RD2RO */
+    case WM8750_ROUTM2:    /* Right Mixer Control (2) */
+        s->path[3] = (value >> 8) & 1;        /* RD2RO */
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_MOUTM1:	/* Mono Mixer Control (1) */
-        s->mpath[0] = (value >> 8) & 1;		/* LD2MO */
+    case WM8750_MOUTM1:    /* Mono Mixer Control (1) */
+        s->mpath[0] = (value >> 8) & 1;        /* LD2MO */
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_MOUTM2:	/* Mono Mixer Control (2) */
-        s->mpath[1] = (value >> 8) & 1;		/* RD2MO */
+    case WM8750_MOUTM2:    /* Mono Mixer Control (2) */
+        s->mpath[1] = (value >> 8) & 1;        /* RD2MO */
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_LOUT1V:	/* LOUT1 Volume */
-        s->outvol[2] = value & 0x7f;		/* LOUT1VOL */
+    case WM8750_LOUT1V:    /* LOUT1 Volume */
+        s->outvol[2] = value & 0x7f;        /* LOUT1VOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_LOUT2V:	/* LOUT2 Volume */
-        s->outvol[4] = value & 0x7f;		/* LOUT2VOL */
+    case WM8750_LOUT2V:    /* LOUT2 Volume */
+        s->outvol[4] = value & 0x7f;        /* LOUT2VOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ROUT1V:	/* ROUT1 Volume */
-        s->outvol[3] = value & 0x7f;		/* ROUT1VOL */
+    case WM8750_ROUT1V:    /* ROUT1 Volume */
+        s->outvol[3] = value & 0x7f;        /* ROUT1VOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ROUT2V:	/* ROUT2 Volume */
-        s->outvol[5] = value & 0x7f;		/* ROUT2VOL */
+    case WM8750_ROUT2V:    /* ROUT2 Volume */
+        s->outvol[5] = value & 0x7f;        /* ROUT2VOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_MOUTV:	/* MONOOUT Volume */
-        s->outvol[6] = value & 0x7f;		/* MONOOUTVOL */
+    case WM8750_MOUTV:    /* MONOOUT Volume */
+        s->outvol[6] = value & 0x7f;        /* MONOOUTVOL */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_ADCTL2:	/* Additional Control (2) */
+    case WM8750_ADCTL2:    /* Additional Control (2) */
         break;
 
-    case WM8750_PWR2:	/* Power Management (2) */
+    case WM8750_PWR2:    /* Power Management (2) */
         s->power = value & 0x7e;
         /* TODO: mute/unmute respective paths */
         wm8750_vol_update(s);
         break;
 
-    case WM8750_IFACE:	/* Digital Audio Interface Format */
+    case WM8750_IFACE:    /* Digital Audio Interface Format */
         s->format = value;
-        s->master = (value >> 6) & 1;			/* MS */
+        s->master = (value >> 6) & 1;            /* MS */
         wm8750_clk_update(s, s->master);
         break;
 
-    case WM8750_SRATE:	/* Clocking and Sample Rate Control */
+    case WM8750_SRATE:    /* Clocking and Sample Rate Control */
         s->rate = &wm_rate_table[(value >> 1) & 0x1f];
         wm8750_clk_update(s, 0);
         break;
 
-    case WM8750_RESET:	/* Reset */
+    case WM8750_RESET:    /* Reset */
         wm8750_reset(I2C_SLAVE(s));
         break;
 
-- 
2.25.1


