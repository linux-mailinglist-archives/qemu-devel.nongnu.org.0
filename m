Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D796E45AAB6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:01:51 +0100 (CET)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa74-0001fT-V0
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZx2-0006Rh-CL
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZx0-0006ls-DP
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wKjbCKx6KWbCQkGZiOp80kwA296KWgFK4fMiq7yOmg=;
 b=UkyrijqRiQz4rqDl1W9FIC+cRhllZG1DGg+1Wfq0LZSaPNI7LPxYvuSLfolt4wn9G9z6Ei
 mcepK3FRc40txhjgW7SnImrSR7WYqkcnkZLMVsddqVXnn0upvZPCgNYYmzMrmlRd1BpOos
 l2rzrR/nzdai2zox4OQlp+AQp75oRCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-RUCTHVUjMFWREHZShd9qIg-1; Tue, 23 Nov 2021 12:51:24 -0500
X-MC-Unique: RUCTHVUjMFWREHZShd9qIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so1916880wms.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wKjbCKx6KWbCQkGZiOp80kwA296KWgFK4fMiq7yOmg=;
 b=a1DJYLe1XJDRhyimIv5ia9n4QX/t5QDuMrEVgEZp2pBhSICz+JGmTYgNeyTS324VMf
 vRwUSgj81SFi//WE4X0J8mvPqiGqp9qonOB2zPUNVlWSoIQKnGiXzgbTaLQfik+r0OiF
 R4gWd9sGQ0afaDcD2cruxPYk9a9tOboOG0iKsWUpH/M8BpPw13Qu676vGQ0dvPwnbLX6
 0SZ3P5zJ1bBj25cbYcxkYOLh0zX2knxsGWaw1udf10ATC1qH2+UirDmI3x+8a92Hl9p0
 /hiaTyJjn4sV02nUqRFKfZbRXe6Z34vvK7RTZ8enIQnY+mFcYO3Deu3i+bVaiKAD/xhR
 paHQ==
X-Gm-Message-State: AOAM5323x6pdauO6zijq+9YQtuGDrKZvk//zqXkk2125v/lC0CIKNHx8
 9HWlQ2g6v5bM2st9Z90TKTwrGz4+HnEq/ZuDnWHbVoVTeSSNLItAXoZomOHuK4Wof9BbSvbijD2
 mgNFFS6h9G71tysDJyf9WgzMne/wJeoRK0ZpK9nRg3OKiYerrkZCStQiyjHCIFS/a+YQ=
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr5399389wmq.144.1637689883282; 
 Tue, 23 Nov 2021 09:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybd0/UmKx0Kwutp45VjDe7rHNvSs2L66P3hVWEBTC1Hkqn3ASGVoJTOvvtp9nJgpESdHmOSQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr5399355wmq.144.1637689883076; 
 Tue, 23 Nov 2021 09:51:23 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f13sm2250599wmq.29.2021.11.23.09.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/23] multifd: The variable is only used inside the loop
Date: Tue, 23 Nov 2021 18:50:55 +0100
Message-Id: <20211123175113.35569-6-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cdeffdc4c5..ce7101cf9d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -629,7 +629,6 @@ static void *multifd_send_thread(void *opaque)
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
     int ret = 0;
-    uint32_t flags = 0;
 
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
@@ -652,7 +651,7 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
-            flags = p->flags;
+            uint32_t flags = p->flags;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, used,
-- 
2.33.1


