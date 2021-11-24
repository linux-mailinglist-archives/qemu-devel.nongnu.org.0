Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0B45B7F5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:01:47 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp61-0003l9-Ry
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0p-0003oY-5P
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0n-0004wn-94
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHo1ecYwtwo0REW0mCQmZS/6gX+5pwE/7n1NlC57ldY=;
 b=OJpF7v3scvTJBDwRW9wnd1JzMTfo5zO2+7+Ebw3WbodTjBkO3nLOscq2Oi2yFlMpOjibV5
 OUJlrKVwzRjbXUtRL1V/U0aAETwBHCebypaACpbq0peFrjwWN1pj5hI9fcRfhOC/qckcY5
 9qfw5Vx3jIV9HrlHPop4t0Wr2TAFAi0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-MtR3dFk0OHSvuGVvLkbf-w-1; Wed, 24 Nov 2021 04:56:19 -0500
X-MC-Unique: MtR3dFk0OHSvuGVvLkbf-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso1496052wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHo1ecYwtwo0REW0mCQmZS/6gX+5pwE/7n1NlC57ldY=;
 b=VG7AJ5O2NTJo6uMmPd+qbYH5PvlF4q/Qsb0sfcT+Z6V0fTArDig+P8G0zPc2aclDAq
 5MeMjAZkOpkDTLVA/8wU9Yy4nASPL66vRiDfcl4TCFbfw5c6TkK05pRX7CD9OL8T6JHs
 rcQIPhkogBDmgoQ2VdwyhbrN5pq7RGcIA+6eqTe54P6bnKMMKGzEBYvNYi1ch8BacurC
 0V/g3x+/7/bH5rRzb/ReM1UovbgxHmIKvsOzSr77BNEWMbB51ufYb0KEjw1qEtxW8G+H
 0cl91Vy4qnBIFoV5/lQZaTQvgbOTXwQRq1cxl35cktHPwQTQtRzvpCSrTd0m3PXoAPra
 SwyQ==
X-Gm-Message-State: AOAM533WGsvnfnjKR8UzjXiTWomT9zWJxxtC3aERbFffo+42Z3I03IDN
 c64kCsZK94AMXN7eqSkltRwGK5tzLbu4rAqtDSBhSlvGpIeaUe+Q+Y0Bm08k+YMJpV3PnRJN/Gw
 36Lse8cH31S+E5l5W9w1XIr9t7FnvJZw6gosRrt3ce0dtQXynkGreo7NCkOVEJu8JzxE=
X-Received: by 2002:a1c:4303:: with SMTP id q3mr13384581wma.78.1637747778477; 
 Wed, 24 Nov 2021 01:56:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfv0TweyIo9fMipJjNFOFTCgkeDoSDwpyJf6BnWkrVAgXNbf4nz268n4orktfMUIPl/8nHPQ==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr13384549wma.78.1637747778243; 
 Wed, 24 Nov 2021 01:56:18 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id e18sm14529175wrs.48.2021.11.24.01.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:56:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] multifd: Make zstd use iov's
Date: Wed, 24 Nov 2021 10:54:50 +0100
Message-Id: <20211124095500.42078-14-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zstd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 2d5b61106c..259277dc42 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -154,6 +154,9 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
             return -1;
         }
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = z->out.pos;
+    p->iovs_num++;
     p->next_packet_size = z->out.pos;
     p->flags |= MULTIFD_FLAG_ZSTD;
 
@@ -173,10 +176,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zstd_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.33.1


