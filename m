Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121515BD43D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:56:36 +0200 (CEST)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL0V-0003Fj-4b
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg7-0003Id-L6
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfv-000387-QC
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCfeDcg7stRxSdw0AePAnW4YvAKF+QFscneJiFL2iUo=;
 b=NjRJc/1rZNNz3xdatFGw3h+pulzFbtVOMV4FdHhzHZKXhAEfYTTlQyIivbu+eoUfc51F3T
 IeaeUoWmmzdRHfJlCgXAj3xS3bln2i1g/qUqBiQb2mJKX78ErP2Bm/QXV9Q3zF9JPJygWf
 2wun07UXrR5+DjoTciKfWj/W2szLtuY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-bu0NVx5sPw-QAA80gqJ49w-1; Mon, 19 Sep 2022 13:35:17 -0400
X-MC-Unique: bu0NVx5sPw-QAA80gqJ49w-1
Received: by mail-wm1-f70.google.com with SMTP id
 62-20020a1c0241000000b003b4922046e5so13280wmc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DCfeDcg7stRxSdw0AePAnW4YvAKF+QFscneJiFL2iUo=;
 b=e3RUtee3AWatfS85f6YTz8UHnwCSYXCmN4IdGNgncsMjRaDFKgRiKAVpFnd2pf0Oe0
 d0Ko0sm07A7YgW47jMM7oWEKfGKhpyBUlJclqrrZionCmV8ni+H3MP753pd1w+Z65OO2
 sw/UM7zLfNgJRvYw6Vfangu4arJGTiKlZ+XcV4SpI+nloXx+kWlx0jFCNZ9u6TL6qMNL
 yz76QTSoTmAvn7kXUJrLpBTOQaMyXHBFT4tZvMsOVPluZ24QpG4g390n8nPiIxHOJndy
 Xl4/kyD7Sbdon1dr4NaIYH8mkjqzvG/sXFA2/8Es5wdAPtkRpKSkIxPALUFdVGKUMjfo
 ZPxw==
X-Gm-Message-State: ACgBeo2Px9VEV2csamM5I/20WAOIb4ol/VTlmCARlFle3tPGRYo1gjI6
 FR5RkdLnvsCDkaOeMZyi0IwYETjr9X7EyYIDPASMRg7veeRudzyK6BKmLgO5U+jXBeMXezdpVTf
 PMJxbcxt1cE6ZATE+WtTmIg6WCiGaEGkbmaXyMEh2u2p74pJXmflqyebvGnkjwOsp6XA=
X-Received: by 2002:a05:600c:1d8f:b0:3b4:90c1:e23a with SMTP id
 p15-20020a05600c1d8f00b003b490c1e23amr19895357wms.122.1663608916390; 
 Mon, 19 Sep 2022 10:35:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6iT9t6JzRfk36BuomlF5vSLbkEmSCeO3/2G17YSf2mlW0k6hhgFAG9AMgAo+iDmr8uR9Aaiw==
X-Received: by 2002:a05:600c:1d8f:b0:3b4:90c1:e23a with SMTP id
 p15-20020a05600c1d8f00b003b490c1e23amr19895343wms.122.1663608916112; 
 Mon, 19 Sep 2022 10:35:16 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c4f8d00b003a5537bb2besm15069381wmq.25.2022.09.19.10.35.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] target/i386: correctly mask SSE4a bit indices in
 register operands
Date: Mon, 19 Sep 2022 19:34:44 +0200
Message-Id: <20220919173449.5864-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

SSE4a instructions EXTRQ and INSERTQ have two bit index operands, that can be
immediates or taken from an XMM register.  In both cases, the fields are
6-bit wide and the top two bits in the byte are ignored.  translate.c is
doing that correctly for the immediate case, but not for the XMM case, so
fix it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index c0766de18d..3504bca36a 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -926,7 +926,7 @@ static inline uint64_t helper_extrq(uint64_t src, int shift, int len)
 
 void helper_extrq_r(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_Q(0) = helper_extrq(d->ZMM_Q(0), s->ZMM_B(1), s->ZMM_B(0));
+    d->ZMM_Q(0) = helper_extrq(d->ZMM_Q(0), s->ZMM_B(1) & 63, s->ZMM_B(0) & 63);
 }
 
 void helper_extrq_i(CPUX86State *env, ZMMReg *d, int index, int length)
@@ -948,7 +948,7 @@ static inline uint64_t helper_insertq(uint64_t src, int shift, int len)
 
 void helper_insertq_r(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_Q(0) = helper_insertq(s->ZMM_Q(0), s->ZMM_B(9), s->ZMM_B(8));
+    d->ZMM_Q(0) = helper_insertq(s->ZMM_Q(0), s->ZMM_B(9) & 63, s->ZMM_B(8) & 63);
 }
 
 void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
-- 
2.37.2


