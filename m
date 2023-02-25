Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088C6A2AB7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 17:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVxSt-0006wV-Fp; Sat, 25 Feb 2023 11:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSq-0006uG-ER
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSo-0007mb-Fg
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677342715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXvHcGHMrV8Q2tJ9gSCW5uYa04vLjGWzQ6ZoHYh7V+c=;
 b=IYr0SK2N2AVDk+YO+mwpPEUu5eahl9rsC0xsLDZu4tib+YwRJiWNAfBGtl5JcxqnnTKD2g
 3ghP/zxM5H6xTzL8xQ249NtF3PXq5+7FoQQRxOP3O3M3gzAQmt4PFEGs6p8EyW4SI7lGEh
 9VNzWMYL9QR3hhGwFnmdXpCSl43Ys8g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-4nzEZmT8P1yykUF5FnqPyw-1; Sat, 25 Feb 2023 11:31:54 -0500
X-MC-Unique: 4nzEZmT8P1yykUF5FnqPyw-1
Received: by mail-qv1-f71.google.com with SMTP id
 pv11-20020ad4548b000000b0056e96f4fd64so1020711qvb.15
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 08:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677342712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXvHcGHMrV8Q2tJ9gSCW5uYa04vLjGWzQ6ZoHYh7V+c=;
 b=nMrGJiGPiH9F3JX00m16i4ew0QkRVo+oZePSU4tdEl8J2D7S7DH6LxRKuidIlalu0R
 3vH3w9y8/G8puqTG9OOY1uHcVN+G4GfqLnXsKtBFTRhb+DVpyP8NsC8508W+8qo1oUfg
 QrON+x8NwFI/g5RVV4NmaDV08gHzU644H+e3G+W2ZG8xY9O/FNHFFybk/DEcKu8T8Q3b
 B2yMH+L1keFRToplOHNYoQ6tXSD3LKcgOi2NO9ubHNVbuLnsxC3OvTYT2t6QJCHOnGZD
 fWD2WNtxzfEYRWD/56ZL5x6Q1U2aHz0Lmw3V7mXV/bEvcAgPCsJe1Vhlk8D6psOHDOEn
 mXtw==
X-Gm-Message-State: AO0yUKVZESuUcof+fa13S/FBQW37Wv77LRdyGaQPLIUFlD6XkrStt0zE
 s1jlzXe4U/Fhu8IgDz/AonIAF1DVizJ+uGcoaz6HJn6VVxM37NsDDHQhI6MGb4KpvYXhjLh2vET
 1XnXhCFWXB2dXT+R0/6VSsEDaDNEBA/daXkSQQn/To3fvTuallQLML6DwT2n3dgDRlBUHqw==
X-Received: by 2002:a05:622a:13cc:b0:3bf:bfde:91bd with SMTP id
 p12-20020a05622a13cc00b003bfbfde91bdmr9887516qtk.5.1677342712525; 
 Sat, 25 Feb 2023 08:31:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8zySBkn8zfm26XmuLD0n+i7CUdBXd/vsR8DA3A6MnDj3AmewZmyWjya03UsZ+cCn2Z4tF8ww==
X-Received: by 2002:a05:622a:13cc:b0:3bf:bfde:91bd with SMTP id
 p12-20020a05622a13cc00b003bfbfde91bdmr9887454qtk.5.1677342712088; 
 Sat, 25 Feb 2023 08:31:52 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b003bb8c60cdf1sm1558142qta.78.2023.02.25.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:31:49 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 peterx@redhat.com
Subject: [PATCH RFC 2/4] memory: Use rcu list variance for address_spaces
 modifications
Date: Sat, 25 Feb 2023 11:31:39 -0500
Message-Id: <20230225163141.1209368-3-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230225163141.1209368-1-peterx@redhat.com>
References: <20230225163141.1209368-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

AddressSpace should be safe to RCU since it's released with call_rcu.
Change the list insert/removal to use RCU variances.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index a63e0bcbb7..c48e9cc6ed 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3079,7 +3079,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
     as->ioeventfd_nb = 0;
     as->ioeventfds = NULL;
     QTAILQ_INIT(&as->listeners);
-    QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
+    QTAILQ_INSERT_TAIL_RCU(&address_spaces, as, address_spaces_link);
     as->name = g_strdup(name ? name : "anonymous");
     address_space_update_topology(as);
     address_space_update_ioeventfds(as);
@@ -3103,7 +3103,7 @@ void address_space_destroy(AddressSpace *as)
     memory_region_transaction_begin();
     as->root = NULL;
     memory_region_transaction_commit();
-    QTAILQ_REMOVE(&address_spaces, as, address_spaces_link);
+    QTAILQ_REMOVE_RCU(&address_spaces, as, address_spaces_link);
 
     /* At this point, as->dispatch and as->current_map are dummy
      * entries that the guest should never use.  Wait for the old
-- 
2.39.1


