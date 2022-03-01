Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893674C8720
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:51:55 +0100 (CET)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyEc-0005N6-Bv
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:51:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3H-0004EZ-PV
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3G-0008Aj-9Y
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8U+0chEqOoO2WXEq/PMFQNiVpucDS0U2rAdxkt/8Jg=;
 b=C6VnYjD+V9cvsPY7KJcd3+CfWQNlsSbyCZiDaAe8itns22sjstbZfCxBnJJlHdGzVqp76E
 OGYe1l1NPyRsOOmEBkYE0ZnbjfEotpAMb4TQGoTPedfxaL0wlHqhHTjIYXCHKlRaQHNlDO
 a79zUii51JHNlEx9Xqb/vi4KG8mouvs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-_5nI2PkZOYeEUtEaX5faiw-1; Tue, 01 Mar 2022 03:40:09 -0500
X-MC-Unique: _5nI2PkZOYeEUtEaX5faiw-1
Received: by mail-pg1-f200.google.com with SMTP id
 a12-20020a65640c000000b003756296df5cso8168127pgv.19
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8U+0chEqOoO2WXEq/PMFQNiVpucDS0U2rAdxkt/8Jg=;
 b=ETavxuMsUzaev9+xt5pjQfCbULN6oUme8Nb7ibpXvvVz+PgznLE5zlmwbJrEJfJD2Y
 1PVLtYIbdY9rhOVN8Z9VAyeH/mVuPaJ3lkjdbjWFpylnicyyT6t1viAxVa6LLebu4AM/
 TMgwidUrAuaACmmsQJieWe06N384rWPb2e7jXegOsGRpVkeB2KuSz5rqZbqOLzpl96vU
 AONcSi7m8IcAb2saw5B3w4PmHdmN+nqU5AgR05iZHfuvJyakivqbC/FhKZKEhCjgJgCU
 ncaCuFh7dDh6HUkNBFaWv73CEz1ztHShOW0eWUz3CwVSxqJL+3ctE9qpN9DMNGkwyj4/
 wpIg==
X-Gm-Message-State: AOAM532sl82N/vMNGCrlnZUXw8V2FR12zjxwGEgM1S8hhuAAv/roGGBa
 40yJplKPFJQtmUGvzUoiDODEIEGiO6Loe7Ej8OgHgYZSgqvOE5YNcUtO/WzZZ++YWnJXxqJbkf4
 1TP/M1JVPjguogu7fiXOyZUYJ6e2FehJv1KTm5hCfGK8U5kuIi4YHlIu4CJlA/Wvx
X-Received: by 2002:a63:e758:0:b0:378:8511:cfe7 with SMTP id
 j24-20020a63e758000000b003788511cfe7mr9866199pgk.126.1646124007843; 
 Tue, 01 Mar 2022 00:40:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL9H0eXhDUAcQ89AwZExrMzUTGCge2rDoPYg2aJzMRHrZLzLSjVcLiUedxXc879M2IDaOt0A==
X-Received: by 2002:a63:e758:0:b0:378:8511:cfe7 with SMTP id
 j24-20020a63e758000000b003788511cfe7mr9866180pgk.126.1646124007560; 
 Tue, 01 Mar 2022 00:40:07 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:07 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/25] migration: Export ram_load_postcopy()
Date: Tue,  1 Mar 2022 16:39:12 +0800
Message-Id: <20220301083925.33483-13-peterx@redhat.com>
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

Will be reused in postcopy fast load thread.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 2 +-
 migration/ram.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index f1de1a06e4..5cb5dfc2cc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3645,7 +3645,7 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
  *
  * @f: QEMUFile where to send the data
  */
-static int ram_load_postcopy(QEMUFile *f)
+int ram_load_postcopy(QEMUFile *f)
 {
     int flags = 0, ret = 0;
     bool place_needed = false;
diff --git a/migration/ram.h b/migration/ram.h
index 2c6dc3675d..ded0a3a086 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -61,6 +61,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
 int ram_postcopy_incoming_init(MigrationIncomingState *mis);
+int ram_load_postcopy(QEMUFile *f);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
-- 
2.32.0


