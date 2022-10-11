Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B45FBDBC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:17:16 +0200 (CEST)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNYp-0002iz-C3
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEY-0001ih-Rj
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEX-0003Wj-9H
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxfQO/4sHnW7QhOj2AN2X9RclF0rR+FjXdBj5STjEUY=;
 b=EC2KleJmS6vfgFQvBcPEAEfNWxaZtEeqcs8bBVrtpSiskmuoj6jbwzLoOsrYcEpYTxVHm9
 m/Y3qm0N1YGTmwJIXDnf72UmN0DtlnuXGwd3CvAFDAz5dusHI7AP7MvKEkKU3GbxnBwuzI
 vqv1Iio3d0i1FphZEahySPUwnBuzUHY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-03xybeSzObmwA7bFB21DDw-1; Tue, 11 Oct 2022 17:56:15 -0400
X-MC-Unique: 03xybeSzObmwA7bFB21DDw-1
Received: by mail-qv1-f69.google.com with SMTP id
 dn14-20020a056214094e00b004b1a231394eso8788514qvb.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxfQO/4sHnW7QhOj2AN2X9RclF0rR+FjXdBj5STjEUY=;
 b=TDyhXbVGtXh23489Tc2K9mHNpCcMRGi+EnpYdni7WCggQ3aXJoPfX8gePIqjeFIiv7
 GdwiN/oPMNG8n6B+Q5sqhfPyDwDIzSRihq5Bz1xhvHWz8wJrggB5ajze29T6L0Gd0ZUO
 PEo/c0zpsEObhSo1fnhZfblmUTQhfxqWou0nKqSMLOFpTXQ7tF2Tn7jIYKo4AunU0d4A
 Bps+tn2619pQGCnvn2Yr4pu8BZLoT6SLuuW88YrjSeY8FCiKkgEPAF0k9akx2JuwKx2k
 D6H/v7t1NQej/7v2JDBofCQu+FXXLOoMRLSjcVDXW+WPfgxZ/eanUSUW23VZ8FAWNIG9
 qJTA==
X-Gm-Message-State: ACrzQf194l69S27VHJ2I/JzlXL7i7+FSFoUoS+jm4bKyqvQIthVi4gJw
 JHTZZ47BfBe/Dfhxyq1sQKabPM5oErK1YsCbzhPCFsTzYwztmbduR2cudnZFCYWzJzL7WADHFeP
 I16/yROp6zyWeutj7PHNIvtbRx6Mg+fS4W3Jrfi7aqTDvRKi6o/T6OLDUMOl19FtG
X-Received: by 2002:a05:620a:204d:b0:6ec:7d7:c267 with SMTP id
 d13-20020a05620a204d00b006ec07d7c267mr11751157qka.590.1665525375037; 
 Tue, 11 Oct 2022 14:56:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bm54jY9dgdD8cOxq/0EAEq85cYFuKp45jPlHzhIZiADhr+nuwEdGWnCeAks+dq+LubWJppw==
X-Received: by 2002:a05:620a:204d:b0:6ec:7d7:c267 with SMTP id
 d13-20020a05620a204d00b006ec07d7c267mr11751140qka.590.1665525374768; 
 Tue, 11 Oct 2022 14:56:14 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 10/15] migration: Add pss_init()
Date: Tue, 11 Oct 2022 17:55:54 -0400
Message-Id: <20221011215559.602584-11-peterx@redhat.com>
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

Helper to init PSS structures.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d81dd3fdac..44967e72b2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -542,6 +542,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
                                      bool postcopy_requested);
 
+/* NOTE: page is the PFN not real ram_addr_t. */
+static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
+{
+    pss->block = rb;
+    pss->page = page;
+    pss->complete_round = false;
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2645,9 +2653,7 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss.block = rs->last_seen_block;
-    pss.page = rs->last_page;
-    pss.complete_round = false;
+    pss_init(&pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-- 
2.37.3


