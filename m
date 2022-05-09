Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1E51FA93
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:54:49 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no12O-0008Ht-EQ
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f8-0004aI-UV
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f7-0002nk-Gn
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3AnHmju2hIPtw+GM/uquKBqddxRaGnG3NoRPbGj8oU=;
 b=e3fLX35jlz6I2nUFqj6Udkt1iL6d4LWxD81eYP4/xcKWSChU0EGNO542M5nZ/IJGfIKwzk
 vkLm5nr+evLAb023TfemgxiydndSvwmE7tdsjc0dor9s0pjZdgMK3k7myPJreRD4BEYZoO
 0tkzjtKEXuJdPpuJW1x5uydXInUefcU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-uSFv66MLM2e1CCtjIvRLBQ-1; Mon, 09 May 2022 06:30:43 -0400
X-MC-Unique: uSFv66MLM2e1CCtjIvRLBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i18-20020a1c5412000000b0039491a8298cso517612wmb.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3AnHmju2hIPtw+GM/uquKBqddxRaGnG3NoRPbGj8oU=;
 b=1qT1Bd1jlnpcI0lQYcuHMRI9QLVGlhPKCNe/MKQdzcnL7dpnyqeNJN+GQ3N6t5mKkC
 F7+lK9ELEPTvT5lBCzvLEPbrUsH9JCjS9KS3fW9gRDmclVHK7fH2s6PqYqphKnYR82NL
 W8kkNAATuds4LV9JtDc9dfR/PXytBJqgTuW183raDdWaiG4Up3bsL2I3Hd1eX7lB02zZ
 wCyUVR2CTs2ykAExD7Usw5Ao2qmjOYdMB+m0F1y3no0VLg6FmQzsZDwbZrHh5X9iQKFi
 Nue4mPlNvhTmj9jqo5ecRVXdUJGNzFcdOwU0KNjdqzBjmKRAMyLDPOcivHuj4I7gpncU
 ZrIw==
X-Gm-Message-State: AOAM532sLSc9c6sKRV2JEGCkFDi5LXs6KAxvXyQcQR97iHWLgHtNtjTI
 Fx6YjEIewsfaBf97T0475K+hmYP39Fy8o032O502O1qoHjEFFyVfJm8bDAs0JguKsXIQp15mix2
 XumaiOLCH/0dY6JO90AJczQYWYL2uRnCJ1jQQyyJIJySzNEzCmoDgRT5g8KWdUiFgb/E=
X-Received: by 2002:adf:db46:0:b0:20a:c903:4711 with SMTP id
 f6-20020adfdb46000000b0020ac9034711mr12907510wrj.625.1652092241736; 
 Mon, 09 May 2022 03:30:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1CDkkfY29l4xUQsc8XceMS+iavOOSLEZBE70723gr4687PLIm9zo8yU+MFZNpQ9wkjr1QLQ==
X-Received: by 2002:adf:db46:0:b0:20a:c903:4711 with SMTP id
 f6-20020adfdb46000000b0020ac9034711mr12907475wrj.625.1652092241227; 
 Mon, 09 May 2022 03:30:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a7bc183000000b003942a244ee0sm11884757wmi.37.2022.05.09.03.30.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/26] nbd: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:03 +0200
Message-Id: <20220509103019.215041-11-pbonzini@redhat.com>
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
 block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6085ab1d2c..fe913a6db4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -983,11 +983,11 @@ static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
  * nbd_reply_chunk_iter_receive
  * The pointer stored in @payload requires g_free() to free it.
  */
-static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
-                                         NBDReplyChunkIter *iter,
-                                         uint64_t handle,
-                                         QEMUIOVector *qiov, NBDReply *reply,
-                                         void **payload)
+static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
+                                                      NBDReplyChunkIter *iter,
+                                                      uint64_t handle,
+                                                      QEMUIOVector *qiov, NBDReply *reply,
+                                                      void **payload)
 {
     int ret, request_ret;
     NBDReply local_reply;
-- 
2.35.1


