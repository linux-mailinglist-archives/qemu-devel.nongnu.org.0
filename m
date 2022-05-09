Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A830F51FA49
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:47:26 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0vF-0002D3-Ju
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fG-0004np-TA
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fF-0002pL-9I
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqP5juE8so3NQtrdckWYrtnqcc5LeThHKJxEEA5BQq0=;
 b=DhgGhJXifaZuMzMf4Hw3JShXpoMpfmkbRSiGVnf7oMGKh8+ln8w2MOwHa6VlYryxa3O3gT
 75bc92rgMG9lV1457p1DTuCFTrixCA9PCM9VVc2NRV7hRJzURdbVx+v1GcpdzuMYqxYUMX
 uwtc96Jy2jiWimNlWzAOeEAzVqk+x9U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-B78m-dhtMcKZq5VBKMh4JA-1; Mon, 09 May 2022 06:30:51 -0400
X-MC-Unique: B78m-dhtMcKZq5VBKMh4JA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so4080006wmk.9
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YqP5juE8so3NQtrdckWYrtnqcc5LeThHKJxEEA5BQq0=;
 b=A0pALLf4ppwXweRfNPBkkZVowgQEz9BdXbgiu64EodmwNH/lbYJ69D6FCtL9vDBfIz
 0ENkJnwz59xuUyq28hy9dgAl4MnLCQeol/YfGjSlO8gZdX3cHx9c+T0250r088bW0QAh
 3AD+GG0zY0Fc59bG1rN/bo8xD49/f4WeAAdCj93AyNQN/nFK37aTLWwe6KErJ6E84iKM
 o2P+zendwvnXeV23x6izIwULLY5VQ2LpomTEw8hjoxVslhYY8zGNTTo1ndoiT42QJ6rY
 NtJunHEk9S9t//wmy2GfQCWaY0EUHLs9FXkM2QMtppliQCd1ZxFQNbu4K3+bcJqyVB/n
 vmmg==
X-Gm-Message-State: AOAM5336aCHHATgBHw6Rr7B9H1dI1LWl/HKcu5CFL1QRElBiboHZcTL6
 3yV9+V2Gynv6DEJ1sVKslKNZZRcFkVO+JdsJFMfvG4YwYrJA7NuxFn5/YZFOQcRVNrp+coM3KNx
 S72NbLL7CevtKENrtfZ8v8qMYi6j89Ftj4ORcjcQbvfYgk/DYVui6oW6Cs2/8nB5ErUE=
X-Received: by 2002:adf:ce89:0:b0:20a:d917:5234 with SMTP id
 r9-20020adfce89000000b0020ad9175234mr13419851wrn.265.1652092250056; 
 Mon, 09 May 2022 03:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc0KYdvqSYkqQxM6ZzA/Imb2ojX9f5uii1KNZpCqAfeD4in5mVePTfpctwKztwBTDdC96tBQ==
X-Received: by 2002:adf:ce89:0:b0:20a:d917:5234 with SMTP id
 r9-20020adfce89000000b0020ad9175234mr13419821wrn.265.1652092249695; 
 Mon, 09 May 2022 03:30:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adfce8e000000b0020c5253d8ddsm10714304wrn.41.2022.05.09.03.30.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/26] parallels: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:06 +0200
Message-Id: <20220509103019.215041-14-pbonzini@redhat.com>
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
 block/parallels.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8879b7027a..bee2ff023d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,8 +165,9 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
-static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
-                                 int nb_sectors, int *pnum)
+static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
+					      int64_t sector_num,
+					      int nb_sectors, int *pnum)
 {
     int ret = 0;
     BDRVParallelsState *s = bs->opaque;
-- 
2.35.1


