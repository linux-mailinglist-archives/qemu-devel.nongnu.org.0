Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568695FDA2A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:16:44 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiy4p-0008MD-Bw
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTP-0001fC-2d
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTN-0004DR-G6
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZgPHv5HXmmvEvP18d2RTE8qvepuBhdcIwk0L2mSSJY=;
 b=HEEM4B+/w7lYrU6RWo02fEkKBE49W+hF/W9IUpGwpbi5yI9fww1acKzoXdrVjdkvoqcxDS
 2Y/quvkV9k4mIwRINhym407x5vWi8ktEpmBeh4VjNsxFT2AmBRhQr0BG3DQ1UC2aLjkGH8
 4mw+qZEJOaVAyPgasDIPFqCqcJ+sM5M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-yZigkx0ONGiVBKbPPZzvpQ-1; Thu, 13 Oct 2022 08:37:59 -0400
X-MC-Unique: yZigkx0ONGiVBKbPPZzvpQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq13-20020a1709073f0d00b0078dce6a32fcso825400ejc.13
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ZgPHv5HXmmvEvP18d2RTE8qvepuBhdcIwk0L2mSSJY=;
 b=gx1dLTvG3ioSa339rKQkeOMd0QqICPMidKm2DLdgln61pUQ+w4a3VTidhOvjAJIW6z
 G8UhKAKEjx/YF1s2qkW3tV/SNqLCR4ZcqWaYVPiIwl3IDAJTo9jCqp77NWNhkzq5BMr6
 zwh6SqlJHYC6OIFLmloTfI8PnMrNFn7b5wNfQQ3tTVGx7ASIZGjssJqEUoo/rSly+T1u
 wHpoOXiB0p2f3kAvNKg6tIyIwoBsfReV7tYDF1bSBgtE6VIVnkdVcA9ZpmOYF90FEOXD
 X9RFDIIEzc+o2yrp3eXiOij4pwhH0vg/uXqeSstcxDhIje4AE/BKjjJ4I20dtJTxoLHi
 +QYg==
X-Gm-Message-State: ACrzQf1Hsg5vDe302Hy26Xao6P9k9qlL3yIiyOmUL2Oacgw0UfuGnXkY
 8tWAKm/YiRlJXBoSEXSkGgJWZrri2Giv0Oy+elEPasMzdtblq+kdEQX2Nl4Op1MuPWX4H5ZGQxR
 uuY1hZIGgCFuIswS0g/6Ata8mH5XSGZQb08qqUycIl6dpZfMWOXECzy7JtEf45TmJKuw=
X-Received: by 2002:a05:6402:1205:b0:458:c1b2:e428 with SMTP id
 c5-20020a056402120500b00458c1b2e428mr31401489edw.94.1665664677862; 
 Thu, 13 Oct 2022 05:37:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GC0+PBDTPjrIJsIVsWDAz9MP8SZRwng7uZk/zC+qzpfKmpWkf65oRp1pofoUh4ajQYDjb2A==
X-Received: by 2002:a05:6402:1205:b0:458:c1b2:e428 with SMTP id
 c5-20020a056402120500b00458c1b2e428mr31401464edw.94.1665664677627; 
 Thu, 13 Oct 2022 05:37:57 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a0564020f1800b0045cba869e84sm3025480eda.26.2022.10.13.05.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 15/24] block: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:02 +0200
Message-Id: <20221013123711.620631-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c    | 2 +-
 block/io.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 1fbf6b9e69..e44801fd28 100644
--- a/block.c
+++ b/block.c
@@ -643,7 +643,7 @@ create_file_fallback_zero_first_sector(BlockBackend *blk,
 
     bytes_to_clear = MIN(current_size, BDRV_SECTOR_SIZE);
     if (bytes_to_clear) {
-        ret = blk_pwrite_zeroes(blk, 0, bytes_to_clear, BDRV_REQ_MAY_UNMAP);
+        ret = blk_co_pwrite_zeroes(blk, 0, bytes_to_clear, BDRV_REQ_MAY_UNMAP);
         if (ret < 0) {
             error_setg_errno(errp, -ret,
                              "Failed to clear the new image's first sector");
diff --git a/block/io.c b/block/io.c
index 236b12da2a..5518a9d1e6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2729,8 +2729,8 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
         return 1;
     }
 
-    ret = bdrv_common_block_status_above(bs, NULL, false, false, offset,
-                                         bytes, &pnum, NULL, NULL, NULL);
+    ret = bdrv_co_common_block_status_above(bs, NULL, false, false, offset,
+                                            bytes, &pnum, NULL, NULL, NULL);
 
     if (ret < 0) {
         return ret;
-- 
2.37.3


