Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A146BA6D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:52:17 +0100 (CET)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ16-0008AL-8J
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:52:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzY-0005CF-Hv
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzV-0004mW-Jd
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAhbUGVptyLQwm179+saNf2aDx6aW3dcDYCvczFtWqQ=;
 b=YtwDJ/eLLwO+dbq4Ax03AsLC/U3frgqAX4Qk0fZ1+DDfMkibGAWBDRt5SVSOEdlSrSZaF0
 EezguxxbeIR9sVNosXtUgtC6Wh5K1pgoouSdyImHYlKTNstcqQDlFhqNF+pAmJ77iP/bdk
 3cs4aCqNYpES3r6rccizxOIyoIjHuNI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-GMY0QYkKNpmNnOx7w4W_KA-1; Tue, 07 Dec 2021 06:50:36 -0500
X-MC-Unique: GMY0QYkKNpmNnOx7w4W_KA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso2853489wrx.15
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAhbUGVptyLQwm179+saNf2aDx6aW3dcDYCvczFtWqQ=;
 b=Xwr4zydQx7BEtHfwmeIu6P+1P7wjvtKqJZvdgiq2wadYv+/AUAtMTAaERnKHayiUG/
 EykhTOmmyhuN4PUpzYkPQxoDQl1V9GDv40FjxblMkcb4XSSyglZ5kcFMANoOrzZsdY2n
 RLzxSuusNuXs8t1UGmOtf8hEOUAv1gGzarQnQXHqRrUSLb9SCswZrkyj0hRcPx8rLhGf
 gd+qcKff+pVZPh972xEMIua/pyrEDND6eNfu/12vvKkRCt38WFOr9WCZJtjV0h2y2C7f
 k5cvaAZj4ioDiY/a637Ucu/+A1e/TBTn+0MDeRLFDrzX4teEpyJT9ChqfTSk7YSiFofR
 2eUg==
X-Gm-Message-State: AOAM531wg6YsqaYVIVBO1wuChZHrmN1jm9ZR8GOXdZzxYwztv9mTz8KP
 wN7wY4XGCIee0taKKGp5xmit5dSOHLG1rpocFnxKUrv+VPAAhMOR1UnRtZIKT0CGIZmdESqbix0
 yIXt+pGVxqyxQRJncgngZ7DG3xmWIQBLdbQ1YdEFkGVIpgS4ULNjMkj07yG4dGnxF
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr6497707wmq.122.1638877834519; 
 Tue, 07 Dec 2021 03:50:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZNu2t6Er06ZZETWwWloWtg613yfsEnN/7hfhvtpzfTdqXYas9RrIzN/ImEj71+Jpo8c5Q+w==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr6497658wmq.122.1638877834145; 
 Tue, 07 Dec 2021 03:50:34 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:33 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] migration: Drop postcopy_chunk_hostpages()
Date: Tue,  7 Dec 2021 19:50:12 +0800
Message-Id: <20211207115016.73195-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207115016.73195-1-peterx@redhat.com>
References: <20211207115016.73195-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fb8c1a887e..e3876181ab 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2576,30 +2576,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
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
@@ -2631,8 +2607,13 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
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


