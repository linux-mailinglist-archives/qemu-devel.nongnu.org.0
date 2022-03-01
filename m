Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B434C872D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:56:13 +0100 (CET)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyIm-0001Vf-L0
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy37-00045i-Hl
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy35-0007ww-Tv
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEwh2yYCSs1yyakfukGjUpFviOTSZCevdwq6ZVOn9N8=;
 b=XI7v3sG9dmONhHqmkzQ3CW/vmawtgD90nlxg4NKON5TocOHbd0G5TfAlDgfayaYv4b1b1Y
 6MdSbvbaCbW9tikGvPKUbyg8CyOTHztIh2W1h5Y726AP4uXD7YX3jvqt+dUeNml8i+i/RI
 7jjvxEJyKXEDshXpJ5tUDzbydopeJnE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-kpQYKNC0MIqnop3hHCszqA-1; Tue, 01 Mar 2022 03:39:58 -0500
X-MC-Unique: kpQYKNC0MIqnop3hHCszqA-1
Received: by mail-pj1-f72.google.com with SMTP id
 m3-20020a17090a3f8300b001bd33af55f2so1211265pjc.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEwh2yYCSs1yyakfukGjUpFviOTSZCevdwq6ZVOn9N8=;
 b=nMdl2hflZiofUVZNiTxDvSp2pW4blF0YFllaeb1lw1+aL0NQ2eRwU65zE1Jgur84KA
 3xUncNjCQaVs9Yi50g/BTQdu1zHgtSx35V8mLlJS479YGehVwABYpocj/YgfYjASoIfI
 jmIAORvQS5bvxoy8/ufcIIsTtrrNopo2vZe//k4E6OiLAjUfLE7n8saWXIKrDxX+/7AZ
 u/mHln/QEDujoe0jqydYaGodh+dDkP6h/epuyYviFErhs4qx9mNkq5VuM8vRIU1praJV
 TDuYsGF/t9QB9K7QP6ub2H3mxK2xy+hVhAHwXuFdMXEZOaeDUDobrXhCqmmrF9xDHanL
 FgOg==
X-Gm-Message-State: AOAM531SCklrmhWUHat/dSUvtQbKOhvtVTxkFFbtrONyRPhd9Ys2HmAO
 mlWtNLeowm3xT9Pddz3Lai1IEGEVatTvQO3g9FgU6zWI8mF1gxqI5s5ih1rZ6IVeoVHFjl+aoyY
 eBY4f59AA3pxWEq31nUJKrXUV6W/5JglcLAOv9F2i0Qsj8O/D2N5mH4NtOInc18zw
X-Received: by 2002:a63:4a4c:0:b0:375:6898:f6b6 with SMTP id
 j12-20020a634a4c000000b003756898f6b6mr20667064pgl.83.1646123996990; 
 Tue, 01 Mar 2022 00:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0LsGwMw8m9Ye9HNg7Y3Bg/woKeQ5x+KXV2boYQSCebqy7FPqNkOfU1zZvIcPig/PJ+mSHGw==
X-Received: by 2002:a63:4a4c:0:b0:375:6898:f6b6 with SMTP id
 j12-20020a634a4c000000b003756898f6b6mr20667040pgl.83.1646123996595; 
 Tue, 01 Mar 2022 00:39:56 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:56 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/25] migration: Add pss.postcopy_requested status
Date: Tue,  1 Mar 2022 16:39:08 +0800
Message-Id: <20220301083925.33483-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This boolean flag shows whether the current page during migration is triggered
by postcopy or not.  Then in ram_save_host_page() and deeper stack we'll be
able to have a reference on the priority of this page.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 9516dd655a..f1de1a06e4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -414,6 +414,8 @@ struct PageSearchStatus {
     unsigned long page;
     /* Set once we wrap around */
     bool         complete_round;
+    /* Whether current page is explicitly requested by postcopy */
+    bool         postcopy_requested;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -1487,6 +1489,9 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
+    /* This is not a postcopy requested page */
+    pss->postcopy_requested = false;
+
     pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
@@ -1981,6 +1986,7 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
          * really rare.
          */
         pss->complete_round = false;
+        pss->postcopy_requested = true;
     }
 
     return !!block;
-- 
2.32.0


