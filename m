Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0E5EF0EF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:54:51 +0200 (CEST)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpJf-0001vd-3h
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2R-0000Nw-7H; Thu, 29 Sep 2022 04:37:00 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2P-0007hU-LJ; Thu, 29 Sep 2022 04:36:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso5256633pjf.5; 
 Thu, 29 Sep 2022 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=u7Vyf1KXlekn86IvpZl1aTdlqQKIB8UmDy2XqOY+20U=;
 b=nPZc0MXnc/sM9pOAqbXMOSO2S58RbTw5gtX0VW17ltqag5qkYtEh6zaT7V4OEO2GMc
 FXWdPLamqs9ZRQko8tgX5suOlAJe29iZxzlK2/gfEUsWXpDNsDzwpnJODxpRCIVEKHBW
 wtbCpQ4/iMWjEFZhdF0hL9S0vexyRGndvFpYQsq/Oj6iLZ4DJtfPl5MQXt9esA4hUHLq
 Xhh2dAM/Xcb7SRBg6aNs8a2Ou10J5SsYit4blZysmgeBZVJuh+mywHgyGuEQzTt5cqvu
 VoalZWZ+wXnT6Yya2/aamnqgjVNJU47Mbf0Ez4Z9aD9MV3PMTl/Ttd5+nfN+Mzgb4uLo
 We0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u7Vyf1KXlekn86IvpZl1aTdlqQKIB8UmDy2XqOY+20U=;
 b=pgTk9bU1pudAzz0eirsGFoBUtP4R7Sg7gGVWDrjOO4Qo+IxkbiVK4uk/TpfhvELyOP
 9O2esx3AqqaPwiz9TZLXfAOh/PHqNLS0slHj8MHbL72HIHprqr8rfk2yaXFQOwoG+OmW
 mfGsx+KUU/skcsxh2ljUlioGiBDXCPOOLp8F8ZbE+GSYJvcEsXs7r7qkHnGLj6XuJPLt
 tEv7ggQId4zfZ+9/yZByxzg79mdBBmIcnQwKGC7Yp1TvWnpNgx/st7OIBFKJPW068dgH
 P23ijYWHUBFYSSnvNMXxtcNcpDKxl8KzyJ5gLKD3sNodOsHI9NL1WEuCj8UqRgNuoqvi
 /TxA==
X-Gm-Message-State: ACrzQf2r1XWP94ja4UIc7baX3sKt1zf2JbsqZdjMqDSS1rtSvJtmXg+Y
 VwxHB6dksMCrknGBdsH3X6ot7PI/mQUWFQ==
X-Google-Smtp-Source: AMsMyM5oek9xYhu43NRoFFT+ItirRIJUOHRnpOmNEfEEkw2Y7utC7xLq7RCPoqfZsfoa/kG8y0/uyg==
X-Received: by 2002:a17:902:7294:b0:178:a2be:ac13 with SMTP id
 d20-20020a170902729400b00178a2beac13mr2293309pll.59.1664440615523; 
 Thu, 29 Sep 2022 01:36:55 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:36:55 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 1/7] include: add zoned device structs
Date: Thu, 29 Sep 2022 16:36:25 +0800
Message-Id: <20220929083631.61899-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083631.61899-1-faithilikerun@gmail.com>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..36bd0e480e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
 
+typedef enum BlockZoneOp {
+    BLK_ZO_OPEN,
+    BLK_ZO_CLOSE,
+    BLK_ZO_FINISH,
+    BLK_ZO_RESET,
+} BlockZoneOp;
+
+typedef enum BlockZoneModel {
+    BLK_Z_NONE = 0x0, /* Regular block device */
+    BLK_Z_HM = 0x1, /* Host-managed zoned block device */
+    BLK_Z_HA = 0x2, /* Host-aware zoned block device */
+} BlockZoneModel;
+
+typedef enum BlockZoneCondition {
+    BLK_ZS_NOT_WP = 0x0,
+    BLK_ZS_EMPTY = 0x1,
+    BLK_ZS_IOPEN = 0x2,
+    BLK_ZS_EOPEN = 0x3,
+    BLK_ZS_CLOSED = 0x4,
+    BLK_ZS_RDONLY = 0xD,
+    BLK_ZS_FULL = 0xE,
+    BLK_ZS_OFFLINE = 0xF,
+} BlockZoneCondition;
+
+typedef enum BlockZoneType {
+    BLK_ZT_CONV = 0x1, /* Conventional random writes supported */
+    BLK_ZT_SWR = 0x2, /* Sequential writes required */
+    BLK_ZT_SWP = 0x3, /* Sequential writes preferred */
+} BlockZoneType;
+
+/*
+ * Zone descriptor data structure.
+ * Provides information on a zone with all position and size values in bytes.
+ */
+typedef struct BlockZoneDescriptor {
+    uint64_t start;
+    uint64_t length;
+    uint64_t cap;
+    uint64_t wp;
+    BlockZoneType type;
+    BlockZoneCondition cond;
+} BlockZoneDescriptor;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
-- 
2.37.3


