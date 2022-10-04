Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7235F4947
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 20:30:09 +0200 (CEST)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofmgB-0003Rx-QQ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 14:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmb3-0007Sq-A3
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmax-0005fF-7i
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664907879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuI0g2SiMu8yyfxOSQmN2tHqirIL8PEq/zBM9j5AHm4=;
 b=dU4pVsmgdMLe0UjOWi6jZ3D+Bui+PSKr25c1udpfqzumwrVXVT4+p6ThDV/HPaYhDUs13m
 2SXA44PLAK5PPEi74fEySF+TyMagh2CBbdnizl1LjS7FLciDgKgUIln1v0WFunfjg37cQD
 Lc39UKd60DxaMFH0MdPlxIxySauO928=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-ecc3KnR8MJ2owOsyE1S97Q-1; Tue, 04 Oct 2022 14:24:38 -0400
X-MC-Unique: ecc3KnR8MJ2owOsyE1S97Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 m7-20020a0ce6e7000000b004ad69308f01so9263591qvn.9
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 11:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kuI0g2SiMu8yyfxOSQmN2tHqirIL8PEq/zBM9j5AHm4=;
 b=z+LN3ibLNz2Uk/1uj1mFbyzRXCXFwsnsI9CdLRUFituZrl+zJSZcSmz6Zp6az6K8NC
 GXKnwjxBtF2weqc0t7hiIaA/8iU+MN1CrQ8TgQXakseYjgFOp5rt7ETrNzHnkoSqx4lJ
 A6yzZhR/pRE0pq9y+4Fh1ICd9JcSa/dFu11uTs2S0hano2ilhfORyjRupCIs2SRQ9cao
 iapnk4h7303wsYWhnO9DTT4sO91d8ce7izc2HGJJWJTnbaftJicr7jivLC8Iez9ZQJRu
 urstmoeWAgVr+ijXoS5qECtXDvgYc1J8SZqGr1N5uPzU4cyOq3WFkf2uOmxXNpoaxddM
 sBfg==
X-Gm-Message-State: ACrzQf2bMCjIWwohmERuDzTkhK7NYdWqi4kFr1BN81mEQ6wWCrS1Ouug
 imS4fkkjzVYY17Jdd2TIZxq+BQ11YT8+TIr7ceriZM71irOcUu8groSzJ2LraIqjpkw4a0EIxPP
 jkdONXZwMNJolYIkK2XNzuONMXNe6BqBQ6T1GR3PleA3W80tIeFTsdDBapt6L8qtB
X-Received: by 2002:a05:6214:242d:b0:4b1:862f:49e0 with SMTP id
 gy13-20020a056214242d00b004b1862f49e0mr10411674qvb.65.1664907878064; 
 Tue, 04 Oct 2022 11:24:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DVufVW3ehnQey8eIKTIn9T4R7oyyfVSBGpKdCbrPzQdV/UTuB3/mxFENOoAPJiZkGKGAQ/w==
X-Received: by 2002:a05:6214:242d:b0:4b1:862f:49e0 with SMTP id
 gy13-20020a056214242d00b004b1862f49e0mr10411659qvb.65.1664907877809; 
 Tue, 04 Oct 2022 11:24:37 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i1-20020ac813c1000000b0035c1e18762csm12334514qtj.84.2022.10.04.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 11:24:37 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 5/5] migration: Disable multifd explicitly with compression
Date: Tue,  4 Oct 2022 14:24:30 -0400
Message-Id: <20221004182430.97638-6-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004182430.97638-1-peterx@redhat.com>
References: <20221004182430.97638-1-peterx@redhat.com>
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

Multifd thread model does not work for compression, explicitly disable it.

Note that previuosly even we can enable both of them, nothing will go
wrong, because the compression code has higher priority so multifd feature
will just be ignored.  Now we'll fail even earlier at config time so the
user should be aware of the consequence better.

Note that there can be a slight chance of breaking existing users, but
let's assume they're not majority and not serious users, or they should
have found that multifd is not working already.

With that, we can safely drop the check in ram_save_target_page() for using
multifd, because when multifd=on then compression=off, then the removed
check on save_page_use_compression() will also always return false too.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c |  7 +++++++
 migration/ram.c       | 11 +++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 844bca1ff6..ef00bff0b3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1349,6 +1349,13 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Multifd is not compatible with compress");
+            return false;
+        }
+    }
+
     return true;
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index 1d42414ecc..1338e47665 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2305,13 +2305,12 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     }
 
     /*
-     * Do not use multifd for:
-     * 1. Compression as the first page in the new block should be posted out
-     *    before sending the compressed page
-     * 2. In postcopy as one whole host page should be placed
+     * Do not use multifd in postcopy as one whole host page should be
+     * placed.  Meanwhile postcopy requires atomic update of pages, so even
+     * if host page size == guest page size the dest guest during run may
+     * still see partially copied pages which is data corruption.
      */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()
-        && !migration_in_postcopy()) {
+    if (migrate_use_multifd() && !migration_in_postcopy()) {
         return ram_save_multifd_page(rs, block, offset);
     }
 
-- 
2.37.3


