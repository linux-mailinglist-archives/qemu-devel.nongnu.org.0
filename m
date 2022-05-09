Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1151FA08
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:35:27 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0je-0007Kf-Co
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ey-0004J1-68
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ew-0002lh-LH
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/mj1SaQTVCgoy08BW44Sedmj+eBxFuLCQj4Q1loEXI=;
 b=LbwyOkyOHQy5GX2tPtMHvdzCvrUrOoqxOGxe2iB8+j8TinEjQfbPuJyOWewMyysvH/KBTr
 obX2yaZ87CP480mBbVJtZcLAMaBJIBKNpNlJnKHZywChvRUNB3De4nMyGl1dnvWDPtCqZi
 ZHOIE7kj9DDN+ayitHGYzrkFUZr5y6w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-Pfa-zS_gOSmhxI8QVEs1nw-1; Mon, 09 May 2022 06:30:32 -0400
X-MC-Unique: Pfa-zS_gOSmhxI8QVEs1nw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso4097589wme.1
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/mj1SaQTVCgoy08BW44Sedmj+eBxFuLCQj4Q1loEXI=;
 b=bnLwBBSt9Wsqr36Cn8NZGPmj0kxfIYpW20YhbGLQ/1wic6yJ8OE44Ig+aYyuIWgLjt
 hxxLhBi7T43oA9SzqYqXUFJN4qgp057+e6EJCoE88wERyc74uT3paDmKtUX4a4tFrTfV
 BzpUQM7l3e6NCbR+aL6ciWsVx+oMc/BXhVjYiznj6kQ9XzYaPgg+Fp5U/lA8GC/7FBcS
 ZOMA3tUHkb4yPjhaCvblCVJReuQg1P//iFpnaqsvIhQgVDXeZiaAstvdB5GUE/Icd9IL
 VNKqX2GOAGtLlA9XFeFXNxjeMbyRFQVbKxP09nlh2QJ4v3pl5fqm9sXFSJSeotmC5+d/
 zJHA==
X-Gm-Message-State: AOAM532sly+wipEtbDQHHjl32ExUwL9OkWxRvskjXHZA1VciPr18VhSa
 BFaprxjAgLlKD7GGR4GB5hOATc7dn93hO6D1uA+rwNk47pbeYpO1gII15iotRLSJA1kUI1Xy8h8
 067zSoB6lMg4z4kvUHg1NJhmuLESPkhuOgs1nayXfkyZocFhsk4wNG2ZQ4aG7GxY3HPA=
X-Received: by 2002:a05:6000:168a:b0:20c:5bed:1c37 with SMTP id
 y10-20020a056000168a00b0020c5bed1c37mr13325663wrd.684.1652092231004; 
 Mon, 09 May 2022 03:30:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCh3AQOZ2PPh5SfMe6lQHKGdq7XvJw+nQPTLOOLq4sgF12m0AmnarsEOXLo3PxeqWpetsJWw==
X-Received: by 2002:a05:6000:168a:b0:20c:5bed:1c37 with SMTP id
 y10-20020a056000168a00b0020c5bed1c37mr13325623wrd.684.1652092230546; 
 Mon, 09 May 2022 03:30:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b0039429bfebeasm24129117wmq.2.2022.05.09.03.30.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/26] coroutine: remove incorrect coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:57 +0200
Message-Id: <20220509103019.215041-5-pbonzini@redhat.com>
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

qemu_coroutine_get_aio_context inspects a coroutine, but it does
not have to be called from the coroutine itself (or from any
coroutine).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 util/qemu-coroutine.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 284571badb..2d9211faff 100644
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
index f3e8300c8d..32c7ae8f21 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -207,7 +207,7 @@ bool qemu_coroutine_entered(Coroutine *co)
     return co->caller;
 }
 
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
-- 
2.35.1


