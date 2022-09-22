Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF65E5E84
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:26:20 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obITL-0008PR-O3
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu6-0004RU-B8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu3-0003DQ-LQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzS2L37BHSdIkyL6Vc6S10N2Cgc3pQRU3RHr2iDDn0Y=;
 b=Wc3nJKyUKaYBYbHfGq8zRDrjs7x+a9UxCkY7z/o1KcUrEVrbfxAblCTb2DH8gESDwWEbh5
 o7Dp2OnoqrNi8ryb/2k6JlFcac6rnRvjrT6zLyr9GW46MF3WsZ9xjDYAEfus7U9O4K5/zO
 xAvhFhawcdF1Jj0IBnn3bW0p0nKF15w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-Q_Sa2p4OPGy435tZbPdGCw-1; Thu, 22 Sep 2022 04:49:49 -0400
X-MC-Unique: Q_Sa2p4OPGy435tZbPdGCw-1
Received: by mail-ed1-f69.google.com with SMTP id
 b16-20020a056402279000b0044f1102e6e2so6318953ede.20
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UzS2L37BHSdIkyL6Vc6S10N2Cgc3pQRU3RHr2iDDn0Y=;
 b=GXBFoA9mbk10tTUktdNZBjBSdsHHD4heyuy8sVL3uf4aJNRhyxGV19OZsNOpHmh0qv
 dIeRxaytdTPGO2QUVgC0AP/wwo3snC1q1CpVCNnuMCJqsxANqBD1efyqTvPfaJxtTuyD
 D2JQMI4vJEBLiGgkcVFakFR3XgTWlWZuHjLWBimtmxEExEGby3C6DJ+2M4kHtc9Y5A/h
 A0dUyhr29i51K5PdyuVHfAbxFENl+KrXLpn1WXz9zIP3j5+I/O81uz/61OMLmLwd44QV
 7bgviWQygN86R3HVDxlshbCVVwaxq1FF7cRBNY+9vdU6WW/I0ieHUYlUnY6GeyeE2KSF
 PJxQ==
X-Gm-Message-State: ACrzQf3uVfXZmxvkU8HhKahwO/PxDF1rOVA+GIZkZtGh6xGaLzo2mlcE
 piU6brwjsBJriEFtoFTizrG7TtWWgW+pwwXuMJa7iUE7GQknmqAZQVxDP92oN0J+W5YccAcbiEM
 BhilnQ2gA2uLXtH88jnzCei5q+2y3FMlSLJ3sdjaX1b3e5yZFKIpiNgSRhkNEnYfqk5I=
X-Received: by 2002:a17:906:8a7b:b0:781:8016:2de1 with SMTP id
 hy27-20020a1709068a7b00b0078180162de1mr1871120ejc.54.1663836588528; 
 Thu, 22 Sep 2022 01:49:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sOWsV1VNzOM8Hh1YyXR0Xl6Ux2ORyugyl8PQW0TmHa8BR2w6VrsNgI+nOYgbIBHRvp18wtQ==
X-Received: by 2002:a17:906:8a7b:b0:781:8016:2de1 with SMTP id
 hy27-20020a1709068a7b00b0078180162de1mr1871099ejc.54.1663836588279; 
 Thu, 22 Sep 2022 01:49:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a50d757000000b004479cec6496sm3315629edj.75.2022.09.22.01.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 15/26] copy-before-write: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:13 +0200
Message-Id: <20220922084924.201610-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/copy-before-write.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c24b8dd117..14af7eb753 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -203,9 +203,9 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
  * It's guaranteed that guest writes will not interact in the region until
  * cbw_snapshot_read_unlock() called.
  */
-static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes,
-                                        int64_t *pnum, BdrvChild **file)
+static coroutine_fn BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
+                                                     int64_t offset, int64_t bytes,
+                                                     int64_t *pnum, BdrvChild **file)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BlockReq *req = g_new(BlockReq, 1);
@@ -240,7 +240,7 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static coroutine_fn void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-- 
2.37.3


