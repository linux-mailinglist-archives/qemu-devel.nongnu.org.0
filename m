Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564151FA94
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:54:51 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no12Q-0008LZ-Lx
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f4-0004Vo-Sj
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f3-0002n3-CU
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjKxDsM6JMdOOXJmgTB6DwHRYA3FRd1PM2p7yAZWPzo=;
 b=WXnLF8uXhzRgR3l+xgwIHLKxbRx/qvA+CgBW47wqeYSQsooe7LUrIdhLecyhQwKTI4gKSq
 pakPZOvj3acxzuPMdaOuN9gpoUu+DHL4vvfUxyWJmLP4BF9Q/30B0X3DBhW3kGPTajfHwY
 O6CTfPOPCwL4DYbhs88735H/RWwRx+A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-gQp-BKT8P5KrTxvbnRLzkQ-1; Mon, 09 May 2022 06:30:39 -0400
X-MC-Unique: gQp-BKT8P5KrTxvbnRLzkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s14-20020a05600c29ce00b00394611a8059so6966437wmd.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjKxDsM6JMdOOXJmgTB6DwHRYA3FRd1PM2p7yAZWPzo=;
 b=RbtR/DKuFSQlTYDNB09eFqvLu7j5sAqrazTIwn9GTUBea4dbatl80F5TD22QUEAmfD
 DC5SaD1YUlzLX7mkK3YIu/113EhwBL6SIbRWqQkjh3jxTqW+DjelW1pQP38uzuww1tZ0
 TBfyWq/tgeymWw6sJas5L10MCvNJyz1rV9Js46BayOra9TOGjE07rx3eokmWdawTnVBi
 zZd/HptUE0adsZomv1sHmBC75PrnsPaKfqa3azGNP/pGnSc8m5xabsjojkJ1MPuBB+4c
 mPjA81j0sKHQ8/4tepVJc8Qw6hgg/o2VR6F7EmD10UjSB5GO9OS2l8lbu1FJmrb7CzHe
 /yRw==
X-Gm-Message-State: AOAM531i2aPuHO+tjaLn90DUgEWlNmA0UDAK7hGi677CUgVbuqRtEZdt
 q5N6KiEMH8WjKPiV53S1EQPosUhsNgEUnR/DFDRTlVZIQ/0kzfgru/v4yi37T47fb6hbIVI/pP8
 Ux9oyszZdQsoaRZIjs/bozXguwaT7YPgDb2Pg6ID5Q98MrB2lHztl3rbKakVBaqxw9fw=
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id
 e8-20020a056000178800b0020ca43c10famr12933087wrg.511.1652092237764; 
 Mon, 09 May 2022 03:30:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwruBEgxVDD8kjkvK7d2XwVDsesCMyjk5njx3Ozm863VVFYeQkxpVBL0q9DRsjtSSm5C/yQ3Q==
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id
 e8-20020a056000178800b0020ca43c10famr12933061wrg.511.1652092237336; 
 Mon, 09 May 2022 03:30:37 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056000118600b0020c5253d8d6sm10884109wrx.34.2022.05.09.03.30.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/26] file-posix: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:01 +0200
Message-Id: <20220509103019.215041-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..76eea8d350 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2158,7 +2158,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
 #endif
 }
 
-static int raw_co_flush_to_disk(BlockDriverState *bs)
+static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
-- 
2.35.1


