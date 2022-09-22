Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E25E5E82
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:26:09 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obITA-0008Dn-C0
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtq-0004He-UM
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtp-00039U-Bi
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFJ3L77TUFEjwbt4CSDQpeKFnuI2dm866x9il+JnnG4=;
 b=Ad0ZdpwQwFUMhe/hxzVvhlevviGqMV4KxGpEOJjfDX5FpAfKfZjmS/uzzjJW5lnCA3qG4e
 qQwE8PXywEBRtx+iXCu806LbVga+IWi5oxN5V2wairk7MpRay9TY3+S2y2ZFrScYyjabA2
 Y4i5N+O1mKorhZ8/X+9XSO4MlO5VREA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-keO7TpS-Pvyy6edIEUfAPA-1; Thu, 22 Sep 2022 04:49:35 -0400
X-MC-Unique: keO7TpS-Pvyy6edIEUfAPA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so6153405edc.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aFJ3L77TUFEjwbt4CSDQpeKFnuI2dm866x9il+JnnG4=;
 b=CwPifyRrd7Xw1dC5dRGMr6CpFyZkkDGqD2z3T9342mDmt68Fn1WliRdRQWyYvstTo7
 DkC2yeHdkTmwWUXCa326PGPb9I4OjLIUL0OVZ0DuEPPb2nSjFW1fTfvQlpQh6fFauOYu
 6V6ixOAC2pdSxjM+dulG6EHtcQlFuUmS3f7BJRj1WJxd1s4IE6pHz2x+p62Nxwmg6+wl
 MC/VHdZSNuj3c+oczcLISD2QKH5SjLDgkXtECAkNPr0VOK8do2EeWxefYMsGDN0RMqok
 n1mLRFT5p3sV69z/CBdegRF2wu2wsgmxTwKHovOSIdFxhaiU+a/GXVp0jiTcoMYUFQEF
 8piw==
X-Gm-Message-State: ACrzQf0Vtx3jZpc1MWIkVlM6FnHNIS2Vvup+E3765rGfqAVpGn3qzfd5
 1fwJkQxGh/RvpxwoTFWHxhH4j4xOG/mB/lLdzvLoLW2LebOkx96c0/2S8E1aVPxuDphBhPmPYDG
 4n6becEk6Ib8aHdDaq9IgMcQpfDNkKymCPuvnkAiexE2lVmKTPj2uTZQUWT0m7Cy1X8g=
X-Received: by 2002:a05:6402:2547:b0:450:668c:9d93 with SMTP id
 l7-20020a056402254700b00450668c9d93mr2208898edb.92.1663836574148; 
 Thu, 22 Sep 2022 01:49:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52fDR1xV3dK4bcx1QCPcgSon0iz4sYkG4s8LPisrLwvUKc3TPAI+cmdzsYYya9YNJRyOojyw==
X-Received: by 2002:a05:6402:2547:b0:450:668c:9d93 with SMTP id
 l7-20020a056402254700b00450668c9d93mr2208868edb.92.1663836573856; 
 Thu, 22 Sep 2022 01:49:33 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a170906945a00b0077016f4c6d4sm2308997ejx.55.2022.09.22.01.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 05/26] coroutine: remove incorrect coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:03 +0200
Message-Id: <20220922084924.201610-6-pbonzini@redhat.com>
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

qemu_coroutine_get_aio_context inspects a coroutine, but it does
not have to be called from the coroutine itself (or from any
coroutine).

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 util/qemu-coroutine.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 08c5bb3c76..e55b36f49a 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -92,7 +92,7 @@ void coroutine_fn qemu_coroutine_yield(void);
 /**
  * Get the AioContext of the given coroutine
  */
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
 
 /**
  * Get the currently executing coroutine
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 4a8bd63ef0..356b746f0b 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -213,7 +213,7 @@ bool qemu_coroutine_entered(Coroutine *co)
     return co->caller;
 }
 
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
-- 
2.37.3


