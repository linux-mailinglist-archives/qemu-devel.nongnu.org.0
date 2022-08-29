Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF85D5A52C5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:10:47 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiHe-0006Fb-Km
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4X-0002d8-JP
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4W-0008Fq-1i
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnBByk/sg3d5WrRRuIt463rDLN2iKCyHCcDizi40DdU=;
 b=ZBCi9hSkXUvkYxI1KbseyN+A1kd5qy7ROintCCkLPQt5PSA7YD17Wjxaj/mM/1sJ3+xWBa
 V21Qh/K1E3eLVh+SFv/UHJe/uBrblRdyeQjZt9nLuSd/tFNjoNrODJe2ce9xj+zY1zQfD5
 0EGPL1209a1uULqj7XE/vU7T/aBfTsc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-eNzzH4u8PeS1ZAlImPvLrg-1; Mon, 29 Aug 2022 12:57:10 -0400
X-MC-Unique: eNzzH4u8PeS1ZAlImPvLrg-1
Received: by mail-il1-f198.google.com with SMTP id
 l20-20020a056e02067400b002dfa7256498so6364573ilt.4
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RnBByk/sg3d5WrRRuIt463rDLN2iKCyHCcDizi40DdU=;
 b=jbVKinA1hpOa6ayIcow3EFoSiWaMSnTOxp6rSDwTAthrqDX54MzOo6H0tMKWhe4Hht
 xmupb4tBOhLApoO3W+LXmeBC3EtmQjFZMayS2LNS9BsaOSA0r6Kpr/jH0VoDTE1gWxnS
 gqKjw76Z0EDgWIJinbR4xXzbKGfNEaNabQGvM/7AaB7ULYUhWmfmu5NzRIEiUwQBHit/
 9Z8PUpIH6+QwEzrnAmZ9USMJpDmrv+QXiEV7myBWqdgsy1GJppA5ggCdV5jXSf54sWXU
 8JBaST/6vZeTpRjYMlQxNftajZHHCSv5UnxWWHrQkPTl2cBtYfS6PIuwmlHw12NSiEAl
 /5fw==
X-Gm-Message-State: ACgBeo38Dt0XGPYK9Kn5AiQjO1cayhwon7R4pdG2APIgnwfOO+FSnYWb
 KW7sUW3irNza1h4xRw9mSmywLCWEdvKfvB2sdwHx09Pzrnfv/Sg6oWyEujb2mY1R0sJJiROBu+P
 czeuMzcFPDEm9nQlm7ELFa6lfLpreA5kZR+dSYFwwd8FawDVOrEt9jYKFrd83xlZ2
X-Received: by 2002:a05:6638:3e17:b0:34a:49dc:48c3 with SMTP id
 co23-20020a0566383e1700b0034a49dc48c3mr2399988jab.158.1661792229508; 
 Mon, 29 Aug 2022 09:57:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Qk21U1y9qvjOiBy2eAeX9NJJ4MbXjk6MlS69URDLn0/r5/kM6T9Aqe3TWs25AeAOBVtpGbA==
X-Received: by 2002:a05:6638:3e17:b0:34a:49dc:48c3 with SMTP id
 co23-20020a0566383e1700b0034a49dc48c3mr2399970jab.158.1661792229125; 
 Mon, 29 Aug 2022 09:57:09 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 04/13] migration: Cleanup xbzrle zero page cache update
 logic
Date: Mon, 29 Aug 2022 12:56:50 -0400
Message-Id: <20220829165659.96046-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The major change is to replace "!save_page_use_compression()" with
"xbzrle_enabled" to make it clear.

Reasonings:

(1) When compression enabled, "!save_page_use_compression()" is exactly the
    same as checking "xbzrle_enabled".

(2) When compression disabled, "!save_page_use_compression()" always return
    true.  We used to try calling the xbzrle code, but after this change we
    won't, and we shouldn't need to.

Since at it, drop the xbzrle_enabled check in xbzrle_cache_zero_page()
because with this change it's not needed anymore.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9e96a46323..612c7dd708 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -741,10 +741,6 @@ void mig_throttle_counter_reset(void)
  */
 static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
 {
-    if (!rs->xbzrle_enabled) {
-        return;
-    }
-
     /* We don't care if this fails to allocate a new cache page
      * as long as it updated an old one */
     cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
@@ -2301,7 +2297,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
          */
-        if (!save_page_use_compression(rs)) {
+        if (rs->xbzrle_enabled) {
             XBZRLE_cache_lock();
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
-- 
2.32.0


