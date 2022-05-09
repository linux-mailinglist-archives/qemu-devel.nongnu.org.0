Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CD51FA1E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:40:03 +0200 (CEST)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0o6-0004ek-7N
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ez-0004Mt-UU
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ey-0002m4-5u
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0td3BIo8+I/vX9T6ItFSnDKy+nzpzS9t1PxQm6FyM8=;
 b=jETv6V43+SWRRPjbxrAgG4+FLfDJBtWqU/4i2gBPc8jz+7MV+84QXLdAPLc76ebb+kEttl
 /Oz0kBwpjI/sGct0XVGvBzZmnT5+yh07KWLflI284zcnil2G7bt7EwGmxGmKdTKtpW/VfX
 IhJQcgk25sNoKOXyeJ7ld2ffR4fPG18=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-_OUx7TYDMsiqJx1gti6M2w-1; Mon, 09 May 2022 06:30:34 -0400
X-MC-Unique: _OUx7TYDMsiqJx1gti6M2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso3714790wmr.6
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0td3BIo8+I/vX9T6ItFSnDKy+nzpzS9t1PxQm6FyM8=;
 b=kWJqUvbddjAs1DCUhLJC+kDXk3Z0PlxT/NwcSr3oQbO6IbNNPfXCysk+7J+L0O9L8h
 /N5tWC6zE0DKnrvtxWKAUPXDGWPv8mh1dxZ7Hx/PIXqjy+krcmttw/imcc0O8A0V2w6d
 5VL7VRxAxV5VpcEKRgNb7nOEniSIaZD31nyoNRndTjeE5+XClXBUh+YO7CbWGieKlTYw
 CGD1WFDwbphkg+OxmAbCx7g5CC4vLp8sk0CcMl885WP537tCiIa584G6Ni4huhnQ54yN
 33Fr2IvgRS/hy+pbGoHKKO/wa5Djyd5ZVAL8tfcmVZQWiYFL3ecRqB6TQ7H+AaJxfsE1
 ldXw==
X-Gm-Message-State: AOAM530kG1W/5BglvszAXSAZuSTV8jwJiYzzhPlWNg3TgfRZskp+FzzH
 F3lam8+5thmc9WlqzmhqIvxxXklOCpeMnSjCb9yj5gaiAR4As/lETFNyKgt1n5q4lIL5vM9xN1D
 utt0gOW/GhCDyYC3/MKFKsqnDqECeZyZ371by0iLNMDf0HzJGbN3+PKfa2NX1uaVrVKU=
X-Received: by 2002:a05:600c:4ed1:b0:394:8352:3ea1 with SMTP id
 g17-20020a05600c4ed100b0039483523ea1mr9755108wmq.153.1652092232760; 
 Mon, 09 May 2022 03:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrtc9eIWMhWrT4QhsjW1ljSDGoNVEVp5BSxRL0SgGE5H8PC2eMo92BKFuPTcpCERDyhKdsXA==
X-Received: by 2002:a05:600c:4ed1:b0:394:8352:3ea1 with SMTP id
 g17-20020a05600c4ed100b0039483523ea1mr9755065wmq.153.1652092232248; 
 Mon, 09 May 2022 03:30:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a05600016c300b0020c5253d8cesm10353064wrf.26.2022.05.09.03.30.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/26] blkdebug: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:58 +0200
Message-Id: <20220509103019.215041-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..a93ba61487 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -587,8 +587,8 @@ out:
     return ret;
 }
 
-static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                      BlkdebugIOType iotype)
+static int coroutine_fn rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+                                   BlkdebugIOType iotype)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugRule *rule = NULL;
@@ -672,7 +672,7 @@ blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int blkdebug_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
 {
     int err = rule_check(bs, 0, 0, BLKDEBUG_IO_TYPE_FLUSH);
 
@@ -791,7 +791,7 @@ static void blkdebug_close(BlockDriverState *bs)
 }
 
 /* Called with lock held.  */
-static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
+static void coroutine_fn suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
@@ -810,8 +810,8 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 }
 
 /* Called with lock held.  */
-static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
-                         int *action_count, int *new_state)
+static void coroutine_fn process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
+                                      int *action_count, int *new_state)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
@@ -840,7 +840,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
     }
 }
 
-static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+static void coroutine_fn blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     BDRVBlkdebugState *s = bs->opaque;
     struct BlkdebugRule *rule, *next;
-- 
2.35.1


