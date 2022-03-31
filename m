Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4FD4EDCD0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:31:57 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwmC-00062j-Bb
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:31:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQr-0003yd-Ch
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQp-0001R7-Pe
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAPpR8IngvwRIk9gz5ypRjMNFfZ9AK4pYA9cueZ///o=;
 b=e9ijK2x1x/+SKl4Q8HpeDQycIp9QDXYphV+fqQwFu8pww2p/Obg8UpOMzzGCjrvx66Qxtc
 Yxql1ZUb7nDkcIT+X8rQp/7QbSgNWYDvZD2xsbKDmyi1o1Q26X2D6KJdXmfdMJ05UFqRU4
 dOz/WtnRyFNiJizp3lTfb3ceaSM8nF0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-2c659Ta4P1mp6HYRkW512g-1; Thu, 31 Mar 2022 11:09:04 -0400
X-MC-Unique: 2c659Ta4P1mp6HYRkW512g-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj2-20020a05620a190200b005084968bb24so14966996qkb.23
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAPpR8IngvwRIk9gz5ypRjMNFfZ9AK4pYA9cueZ///o=;
 b=tBfARVGguRkk7J9u9Ihccm3VBiaTLjXIRgdfuKUKpoXmq7KFoWZ6hXvzem2q8guews
 ItyDrrgyIYHJUqu0m3+qRH5XsiqGFp7BNbSbyAE2iJ9vvMMVJi3YM/YQiBYnXU+hTxNp
 mYChEWPuZ9kYudCP7MKF8UUN+vnErr91g4Yq2hvk2jitGfzlIzGlS6Fg411rI8Zn5lQX
 SWLUsdDiEd7wOrK59lAiahdpdzCOavu6ND6ASvDCOvXSaKBfuQOmJY10lwKhoef72C1B
 Ptf06+8F8HMqwXCfFBABiyITOIOvqtacUZqz38rmH1l2iKqMmtNC+f/pSiJsrMmQQaYZ
 pLHA==
X-Gm-Message-State: AOAM532Ihga7AOyh4SxzneQbtnFuz1za6lU2D3zUeJTB8cZ600DGr4Na
 B9Vy6Kpn+Z61FynylJOlqthmcvW73x3OnaV0ZLB+CYH9AgJ/V6Lzzek0Yay5Gyzj3ObmBySrC2F
 tHI2jNCM9+yonJilcwZ45LO1s+oThigU0DRDS7AnikywXoA7ztiTGqO+rQIi6GHTr
X-Received: by 2002:a05:620a:4305:b0:67e:8b39:201d with SMTP id
 u5-20020a05620a430500b0067e8b39201dmr3549513qko.741.1648739342491; 
 Thu, 31 Mar 2022 08:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKmSREqRik0P4Le3TkHxf1SXMHp52hrdTAmI5/RF2bUdfd6ZJklHGTzvau93ZYfWNjtjc98Q==
X-Received: by 2002:a05:620a:4305:b0:67e:8b39:201d with SMTP id
 u5-20020a05620a430500b0067e8b39201dmr3549465qko.741.1648739342010; 
 Thu, 31 Mar 2022 08:09:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/19] migration: Add pss.postcopy_requested status
Date: Thu, 31 Mar 2022 11:08:41 -0400
Message-Id: <20220331150857.74406-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
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


