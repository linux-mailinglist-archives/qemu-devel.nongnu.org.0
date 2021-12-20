Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B947B1C8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:03:12 +0100 (CET)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzM47-0005k8-KH
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:03:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKPr-0001jI-Dt
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKPM-0004ui-N5
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrllebeXjhwn2QrPCOBd7fyW3DoTWKpL8HkzryqB5PE=;
 b=gMZZr/Oy9Nu0pCv6BeUuxUJ9qGwP4Z237fJVTQvlRNkavAmz57KuyLlWMTb5eAkNCnVPve
 fnx9hDz3+ypvmPuVZlsnDOnKpDo1u0eUvXyIWs3FOcTB8FbOQj3Q3ZHAEuYLeiHrpGUU/5
 6ZtJo+erchcLFLjhmcXXpcGR/tF5jkI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-rzeIZf81OUaZrPE-vcXvNQ-1; Mon, 20 Dec 2021 03:54:19 -0500
X-MC-Unique: rzeIZf81OUaZrPE-vcXvNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so6171077wma.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrllebeXjhwn2QrPCOBd7fyW3DoTWKpL8HkzryqB5PE=;
 b=fIwVqAvTAinE6iKutG0pNeIxHTu+zJuHzNCWoFYryO+cM8xOsIc3wfNRRWNI0Ez/m1
 1pNxqbc3PYBVvrflTGt7qoOFH0nhk0E55tRet1TlnCgOTEqWBYTLxNoyfPVKWkYM0hog
 K7aCwlPEw6xO5WPMjJOt1+ltZ+a7F2LDjlmLNTlPgj5of3OszPVR8uIE8MWDqqWUGuMF
 nALt3P6WSL1XxORpGsb9dR8iV5PRXv8LzYyYXf2Noomo3T74WRRinSvLP+Ce+s1yKjEo
 XppxZYzrAQ9RUnJZk/xWq8au31pfGeBK3QuN4lkTB9zYT9rweiq+ZYPbDVPd1D/ByM5F
 rg6w==
X-Gm-Message-State: AOAM531oCikeVc+nbRyV3NgccXaU8QVnqU5rtLNyKtffFk4NJEX+/SOY
 ipwh9zWqhdHB7/Udb78MH44+WJ4vV81SpHUdiRMbTijI/iUptUzjwGbzbPQsclmxq/h78xVgvBF
 eNQudGOOYo9i5MKuGmxHrqv9yNT+mzIj21hw/0OY+nbQyYcX0W1RJBBTCxyjON17E
X-Received: by 2002:a1c:9851:: with SMTP id a78mr4382704wme.181.1639990457782; 
 Mon, 20 Dec 2021 00:54:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjghb4H4Dp9iY9wlG6Denvub5R2zsUIRBSgY6SFvlxptPOWE1JVoPA2AYi6TNIN8C5IjXl5A==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr4382692wme.181.1639990457562; 
 Mon, 20 Dec 2021 00:54:17 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:17 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] migration: Drop postcopy_chunk_hostpages()
Date: Mon, 20 Dec 2021 16:53:50 +0800
Message-Id: <20211220085355.2284-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220085355.2284-1-peterx@redhat.com>
References: <20211220085355.2284-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function calls three functions:

  - postcopy_discard_send_init(ms, block->idstr);
  - postcopy_chunk_hostpages_pass(ms, block);
  - postcopy_discard_send_finish(ms);

However only the 2nd function call is meaningful.  It's major role is to make
sure dirty bits are applied in host-page-size granule, so there will be no
partial dirty bits set for a whole host page if huge pages are used.

The 1st/3rd call are for latter when we want to send the disgard ranges.
They're mostly no-op here besides some tracepoints (which are misleading!).

Drop them, then we can directly drop postcopy_chunk_hostpages() as a whole
because we can call postcopy_chunk_hostpages_pass() directly.

There're still some nice comments above postcopy_chunk_hostpages() that explain
what it does.  Copy it over to the caller's site.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0ed0f51a09..b22c9e7432 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2571,30 +2571,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
     }
 }
 
-/**
- * postcopy_chunk_hostpages: discard any partially sent host page
- *
- * Utility for the outgoing postcopy code.
- *
- * Discard any partially sent host-page size chunks, mark any partially
- * dirty host-page size chunks as all dirty.  In this case the host-page
- * is the host-page for the particular RAMBlock, i.e. it might be a huge page
- *
- * @ms: current migration state
- * @block: block we want to work with
- */
-static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
-{
-    postcopy_discard_send_init(ms, block->idstr);
-
-    /*
-     * Ensure that all partially dirty host pages are made fully dirty.
-     */
-    postcopy_chunk_hostpages_pass(ms, block);
-
-    postcopy_discard_send_finish(ms);
-}
-
 /**
  * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
  *
@@ -2626,8 +2602,13 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_page = 0;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /* Deal with TPS != HPS and huge pages */
-        postcopy_chunk_hostpages(ms, block);
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.32.0


