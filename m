Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF984ECF06
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:48:36 +0200 (CEST)
Received: from localhost ([::1]:48210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgB6-00041F-5K
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:48:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2B-0005ft-PW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg28-0005Dl-UY
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAPpR8IngvwRIk9gz5ypRjMNFfZ9AK4pYA9cueZ///o=;
 b=EP0TPcYQ9m/Ex71ytNTcPfUHB/TRLazszbQLTCo9jbLQljkQADvaGO4MWL4PIwlkf4JavZ
 YvQf5jfuHbSt2Pu4XPAsqui+HTcFRAVsrZKf2cLo4sBt6fpvZEoDmxTNgg1kgO0KBxj6z/
 zaEzi8AOzaZOzHjj7rz5pKray+nPvmc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-QWgCdjpKO96NdaWNcmXHSQ-1; Wed, 30 Mar 2022 17:39:15 -0400
X-MC-Unique: QWgCdjpKO96NdaWNcmXHSQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 p6-20020a05622a00c600b002e1cb9508e8so18425359qtw.20
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAPpR8IngvwRIk9gz5ypRjMNFfZ9AK4pYA9cueZ///o=;
 b=zYa5HAry2lycWLCxBm9C5BxN1p3Iews5wAcnVuzSxMtyh9SOkW70D11WaXYaE8azHF
 ZqBUZlts+RLnRoqZu04/xMN6JvV6aAY0siohfesyYj0BYnghN7ys3FZ7wK1dOjMCqYU0
 BjdRKJySH8w34UEdBbVFofzdDqKWnS//OELfzUNYuYll9yWq0wfDddHaAvq4FBkcK71K
 pPoBAZS2/hwj8/EY/y5zlXKkafHgYzXY0Zb5o1bgtLLXAbqkpobBnrmnwS+jUrDhjwo4
 ohN192yQZKhWRgC7X97mHjAJTBPXtt0TbjYyeTI4KHKFkvytuYAqEyytIxKYGUDxy/ze
 x9gg==
X-Gm-Message-State: AOAM5320ew5jLtstKAVBHZl7zbaBojyoRHidQ4TUm0OH96eH54Teb590
 Rt06YlsR+7kGB61i4cWRj9ebKRWrG7Txo9papaqh/m7qL8A/fSh8gowA6gU6YxxxuERN5lczwXZ
 ULH99QmFUpv/OeUT2Kls3OftgNtNgSbSJyq+iZRIRzH4ifMGh2N3knTmdqbAeOAD1
X-Received: by 2002:ac8:584f:0:b0:2e1:bab9:d362 with SMTP id
 h15-20020ac8584f000000b002e1bab9d362mr1570161qth.408.1648676354519; 
 Wed, 30 Mar 2022 14:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOy4Vgdx6JGxfy+Hn3nTBpQRQ6hWk278srohpPN8XT2zwwMtx9D2q1H87OexsMzfgAmgMgfg==
X-Received: by 2002:ac8:584f:0:b0:2e1:bab9:d362 with SMTP id
 h15-20020ac8584f000000b002e1bab9d362mr1570140qth.408.1648676354253; 
 Wed, 30 Mar 2022 14:39:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/19] migration: Add pss.postcopy_requested status
Date: Wed, 30 Mar 2022 17:38:52 -0400
Message-Id: <20220330213908.26608-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
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
index 3532f64ecb..bfcd45a36e 100644
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


