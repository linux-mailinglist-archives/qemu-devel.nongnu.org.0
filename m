Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECE51FA48
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:47:25 +0200 (CEST)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0vE-0002AJ-Aw
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ez-0004LZ-Cv
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ex-0002lp-3z
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7eQMU/MNT2j16i5jmqBt6QjHezLYbmXNfnGxCR7DVo=;
 b=iYA+I3UHNC+F6QnfgMbYa37PoE34HpCihVon3ezivdFHG+nXVj9XQX+gPRREPRtsD9luTS
 MRpsA1rw0mB08t6TOuYfy7RDECD4uSOiVvV+QsHBZnohoVqIVNAeqKiI3abNYEJgy1XrH8
 JZh/nDyCQI96Y7oSC7e6EXnMnq/hlpg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-pHFbScKhMWW7ewNlH020Vw-1; Mon, 09 May 2022 06:30:25 -0400
X-MC-Unique: pHFbScKhMWW7ewNlH020Vw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso5602699wrp.21
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7eQMU/MNT2j16i5jmqBt6QjHezLYbmXNfnGxCR7DVo=;
 b=V021LC9ieAph+UEKuvyUZxD+65QI58sKKOllZWh6u/TeDBab3PW+Ctl6DO4ofxQc9H
 lwQh+aamuDM+60b+lbp3rABORgkVwn3hYtj6Pemo5u77kypN4Ar2IYQ0ds+mOZm6pIEg
 C9JH5Q1u5BkRADUzrHpUleCzXluXPGVRFJ2XhMal5WPdbkuIKzr7D/1bRKw0teSM8Aal
 nvN4//BLcvQfLXsXTEgkJItZsF2VOaZlUqzoxGxTLivb33hyeEE2Pr3QA7qhemnJAI0h
 5u+qYDD6jiKnfXnVGvp9Ggw17Kj5G+xn0k9a5iW6n03O9EU1UKzS3wdzWX1Ih2rLZkZm
 xAPA==
X-Gm-Message-State: AOAM533xAj4R/ySkML1oFlHlDlaCqe82fCROfKWkBPcXw46C9b0bdWDi
 vJxuiVxJcDBnUIMagaY3B63W+25DRiMDoW2jPxcfMCFZyu3xT/WQ93wEYhroe3ijywdPmOpYI7/
 F5uUO7H3289nQ8BN2SE8UQDWXaTkKeTPL6MFTpMRYuWEYCYI9HnROCkvHWmDN08EZKos=
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr2552239wrr.187.1652092223911; 
 Mon, 09 May 2022 03:30:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFXB/NSuKzhvy5DIp3gO9uaWiOd9mkpIgFtS55iXPfpQSI/O18ulIqDvEQ9fO5P59ybYJ2hA==
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr2552211wrr.187.1652092223525; 
 Mon, 09 May 2022 03:30:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003942a244f3asm15091584wmb.19.2022.05.09.03.30.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/26] block: remove incorrect coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:54 +0200
Message-Id: <20220509103019.215041-2-pbonzini@redhat.com>
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

This is incorrect because blk_pwritev_part() is called by
blk_pwrite_zeroes() and blk_pwrite(), neither of which has to be called
from a coroutine.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..fedf2eca83 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1391,10 +1391,10 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
-static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes,
-                                         QEMUIOVector *qiov, size_t qiov_offset,
-                                         BdrvRequestFlags flags)
+static int blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                            int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            BdrvRequestFlags flags)
 {
     int ret;
 
-- 
2.35.1


