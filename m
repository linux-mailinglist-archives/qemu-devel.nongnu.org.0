Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1384F51FA47
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:47:21 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0v9-00023h-OR
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f1-0004Pf-Cr
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ez-0002mQ-TD
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T8GsUtcx8uBNvR21n6Vfvw1RaJjYiS0GAlgoMt4AQA=;
 b=IbmSpClpimlcvmGH0zpPMGen8fOJqJ+1vzPhwfZgJ8QDZ9nyn1KpjKne+EGyP4qgDPD2+p
 E3h0KEmbpBz6iiGh1WNxgBuCm3CtA5GUzteMTh7I9xvFvWPPorPQ4jGbWHOp5BYjylQegt
 PqG4d6LiP2dyI2UvyyLfC4Y6w+SfqSQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-o1fl7cVUPY-p3IAPColDUA-1; Mon, 09 May 2022 06:30:35 -0400
X-MC-Unique: o1fl7cVUPY-p3IAPColDUA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so5607476wra.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4T8GsUtcx8uBNvR21n6Vfvw1RaJjYiS0GAlgoMt4AQA=;
 b=pRUKFyVsw+zsspB2JKI/GVkcqFGBYo8pAz0HHPWCAuDOcb4bS3UM21K3u8IvOGQKEY
 gtMFdcwKhBGfPiRKmkyhC6Uz17WA+mnl4uMWaPFoS06EtAsjV43TiXR/BvDDItg6H6kC
 W27zcsOJ40i3ihNxOANJarWekNTwPNNi00j7t1TWFlOb2ryqJoOiH1KxqHkhFPnmlHFy
 kUcvSJYDiR+LE4JLUvIttxVEO4LR2MwdDVk484TFgCbh1FlOStz1muif7ea2fUUUvLDF
 y6/IvVMcyvYMP5pncCY8q6BjypKRstt8OhVFrxIWw2Up/yEHZkjk+/uSIuR+DUvHwHlr
 IfmA==
X-Gm-Message-State: AOAM5308g+A/yK6fyLBshegWJCokuenw1V9EE4CV1GwEryCy38ngJEQb
 W1QvZL3Gt6YZLgBCUH7AarXXSkGDOS6hyU42uk7+YtXQ7tUy0gP8z6MKfl5V1wU4CGbvOA1YhZf
 +ef8/wTZc1qCmloqpCJZqnKfTPVWx9keyybwPOvjvBP4sWh1+xWjOSyPAuBYenndv+gQ=
X-Received: by 2002:a05:600c:1552:b0:394:52a9:e48a with SMTP id
 f18-20020a05600c155200b0039452a9e48amr21894406wmg.45.1652092234140; 
 Mon, 09 May 2022 03:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ4d/SdBU8ZM/viC+pXqRrCNR9OPufg7qi5YNBUACFjJPpGV5i2N46TJ/B85Ste/y/90mpcg==
X-Received: by 2002:a05:600c:1552:b0:394:52a9:e48a with SMTP id
 f18-20020a05600c155200b0039452a9e48amr21894375wmg.45.1652092233747; 
 Mon, 09 May 2022 03:30:33 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c1c8700b003946433a829sm12382328wms.11.2022.05.09.03.30.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/26] blkverify: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:59 +0200
Message-Id: <20220509103019.215041-7-pbonzini@redhat.com>
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
 block/blkverify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blkverify.c b/block/blkverify.c
index e4a37af3b2..020b1ae7b6 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -258,7 +258,7 @@ blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
 }
 
-static int blkverify_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkverify_co_flush(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
-- 
2.35.1


