Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB270524ACE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:52:32 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6Qp-0007Hq-CF
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IY-0004BL-K7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IV-0003JU-Tc
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652352235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEUjVCbP7E9+0iLTdLAwCl6ilV5z1Ymdz2a6B1RFVzE=;
 b=HaJsfpL70wnTRHnfY90dj6OwjrwtKXBvc4hv53LSa5LQJ1y98ycH3HZw3Ac+tu80Wh6Ywk
 yuXtbFbwKR7BUp3XBSudZzz19MnYdozcZVLrnw6CAJqkwBX/TD6/jWO/Ybk3MskghJkvSK
 YdS7yBy+P1uGcnw1AxOkQoAWuSqQLtE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-2AHNqbUGO3SQsPfH66J__g-1; Thu, 12 May 2022 06:43:54 -0400
X-MC-Unique: 2AHNqbUGO3SQsPfH66J__g-1
Received: by mail-ed1-f71.google.com with SMTP id
 cf16-20020a0564020b9000b00425d543c75dso2914745edb.11
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 03:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEUjVCbP7E9+0iLTdLAwCl6ilV5z1Ymdz2a6B1RFVzE=;
 b=YWkTcgExOPIb7QnBKaIAqp+J3gsCrq6m8wKaYI0VdZ9B8vGmQbiLgUOMttthJCXByN
 X+0Scii5PFHgnJmf3v0qhOPYWKbs+zqWAyr6UE0Dsr2AwaShgJkpCorJ80van+1Sg535
 wOWPbd7+hwejwiZ6yqakuhwpKkux7OFE40ItmWMPilV3ZjZX1nclN4MmT0uxdoe1sgw5
 5+12by23iVgEgQBGGvrYVgjHLBIyRa9BwwsJqaiCpBag+bGoS+3qGJtYlU57v8A9iXcg
 S/zyK7DrmJbkBJX7vGN4GzIOujOFgMPQpYHwO3WDQdIhj2Fl85pjiyf3TBglsleZmL+L
 Ke3A==
X-Gm-Message-State: AOAM531jms0h0G1aG5hNeKgpdBBIgdb5Lf4iuWzVz6bc2WYPoadhl/QV
 WA/Bo3D/TX+quvrCyuYvzQFgm2kmlO/8N1gCt1lFJdinzZfdD3bY9WpHvCrrxKzxuLy64bB82ry
 reW1oF746eSI96QDPNbEQshYEwZIRFDemyn875ycB6WujAIBDdJxOfZk8H8qwmtGmO7M=
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr29884952ejb.177.1652352232654; 
 Thu, 12 May 2022 03:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmmNExFAJUJpo1zFIMOvLyTPcJKTZDJj8/JzY9foqPQlx4JWK6cinVLOzqELhXuT45hHTv5g==
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr29884932ejb.177.1652352232357; 
 Thu, 12 May 2022 03:43:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 cb13-20020a0564020b6d00b0042617ba639asm2418820edb.36.2022.05.12.03.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:43:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: nsaenzju@redhat.com,
	stefanha@redhat.com
Subject: [PATCH v2 1/3] thread-pool: optimize scheduling of completion bottom
 half
Date: Thu, 12 May 2022 12:43:44 +0200
Message-Id: <20220512104346.865536-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512104346.865536-1-pbonzini@redhat.com>
References: <20220512104346.865536-1-pbonzini@redhat.com>
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

The completion bottom half was scheduled within the pool->lock
critical section.  That actually results in worse performance,
because the worker thread can run its own small critical section
and go to sleep before the bottom half starts running.

Note that this simple change does not produce an improvement without
changing the thread pool QemuSemaphore to a condition variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 196835b4d3..4979f30ca3 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -127,9 +127,8 @@ static void *worker_thread(void *opaque)
         smp_wmb();
         req->state = THREAD_DONE;
 
-        qemu_mutex_lock(&pool->lock);
-
         qemu_bh_schedule(pool->completion_bh);
+        qemu_mutex_lock(&pool->lock);
     }
 
     pool->cur_threads--;
-- 
2.36.0


