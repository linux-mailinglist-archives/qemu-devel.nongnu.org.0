Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D65FBD93
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:04:03 +0200 (CEST)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNM2-0004sw-4a
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNER-0001ag-OL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEO-0003Uf-2P
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbBeFWrldpqnKRU67CogO6lNOkEQaMTBiKveeGJjChs=;
 b=Ok+2VwkzFcVBA/UAnMTTATSscFss9S/wYEzE1gBseuUy/86z6bz/2M1kb5t6VaAaHtVecn
 iGRUzkDFOCJcqMQ0nzmwWrk3F+9piiG6LzdB18v4gmyQHQ4IEOW791jYsypjEyah2KEO20
 pl33SyHRxf6nVcr7dawhJzgxuE53e5Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-MKvgiBWmP8mQEuhPXQ5JQg-1; Tue, 11 Oct 2022 17:56:06 -0400
X-MC-Unique: MKvgiBWmP8mQEuhPXQ5JQg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d1-20020ac80601000000b00388b0fc84beso9986488qth.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbBeFWrldpqnKRU67CogO6lNOkEQaMTBiKveeGJjChs=;
 b=WjA+VvTpU5b8i0cDowtnmZ7nRF+bN5BrEJZGstXx78u7UBpJOL0eXXutvtNUZEyB/o
 UWB4Y7N9PqkLL/almZBDTLo97fDEZge/fGGjr4vhCn/5G7+GkEmWX/Bcj7xiIMmpe83p
 jWYU2MIArQdb/a6UOKsUh08Dv2CNd32yhDEOna/mT/EadD+RjkXxd/4jA6oNd4uPgGoR
 lN9/605dfVic8x49mjzrzk22rN8ytNlyJoW2+V5ncmFZFW4e51xAjdoNGH5CJZzyDOaY
 Bc8gJB69w1/Y2N2E6991p7G2zi5Q34eCxl5tCTskgum5fYiwqjwOvxLwaDqLyMTr43Xu
 kG0A==
X-Gm-Message-State: ACrzQf3L99Dh2En5DINKMrlEJ1KWCrFgp0SsoJ9eN3qRIKohGpf4yX/I
 P5WoV7YEFT6h/u1yw6a52qiKuqzuS1aMG4a1zo8TvhsSTT/wfQkceNRhvbrkJW1eiBAGaeC46s/
 DlooKCfGdtrG5gwHK5BgEz4MKYxdvFOpk+l2RbF7kNgmtFQ5+3o1Izn0cISatWGK9
X-Received: by 2002:a37:b404:0:b0:6eb:ca54:db74 with SMTP id
 d4-20020a37b404000000b006ebca54db74mr12386595qkf.610.1665525365774; 
 Tue, 11 Oct 2022 14:56:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Kr82CIPKYnGxMDXRogwxKcDcVT7L0K29zDWdACputhr5bXMQKH3gAEmLQ+3FVmwLcutHA5w==
X-Received: by 2002:a37:b404:0:b0:6eb:ca54:db74 with SMTP id
 d4-20020a37b404000000b006ebca54db74mr12386581qkf.610.1665525365479; 
 Tue, 11 Oct 2022 14:56:05 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 03/15] migration: Cleanup xbzrle zero page cache update
 logic
Date: Tue, 11 Oct 2022 17:55:47 -0400
Message-Id: <20221011215559.602584-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7aaa843a21..562646609e 100644
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
2.37.3


