Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE0E3F8E60
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:00:53 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJKcN-0004pp-Hs
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKZy-0002od-Rw
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKZw-00018M-Ox
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630004299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c869mJqUNKr64ls6+3RLF7ISrAtPh0abNoLZorTZv4=;
 b=GQSBhxsqVx/LJKjHlTQDdtiCgA9XozVJveNhlisQ53lZibul04jOeoNRag1ZfooJVjc0dZ
 x7R1nDkyTL4bRbLjlrAkZlHHqTgbT5xDionDoXCNdvI6f8HV6Lv1pKVsS084RRkiCAkhDu
 U351sR5KUT8AOci2IMBG5GNwchXghck=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-EkAYYaUvNDeeiXLd8dNMvw-1; Thu, 26 Aug 2021 14:58:19 -0400
X-MC-Unique: EkAYYaUvNDeeiXLd8dNMvw-1
Received: by mail-qt1-f198.google.com with SMTP id
 o22-20020ac872d60000b029029817302575so2384840qtp.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5c869mJqUNKr64ls6+3RLF7ISrAtPh0abNoLZorTZv4=;
 b=bDynABBugWeobtQsDioFS211fKNcLEpb4O59Ty0xq8+YljKEmDepmEAMifD7Y37+sA
 MQYwU5sXFm7OKU7r0dn8OOLJVgiPkIGctF0VpQYZ4IK7Qkv2w+o2WZDha4125S1tVLVl
 3mO3XTNYlWkccByQpN2kqPB8BkrsXb+WLE6uTHj8pBEDMfSNQBJBiuf/RFSaKKnJWpcP
 HwR4QidO/PN5OdvwxQ5modeFr3XCc9IEDwyo+rfDQF/VfJSEbwBHWp9yK9xmE4KX+HXM
 V0stcD3r+zAaytkhlmTABc/xwp9UcxBcj9avtsOSpcCdpJ6ZyPZvUapV36ZuWAHXEm8L
 xGbQ==
X-Gm-Message-State: AOAM5336ehqZwqE6NCPkw749bRU71lMOo+hacA8t7Wr0TlBxcRfXjTNJ
 ZhWpXUPE/efFyQa0AK6NNTkSv5tpbvs93Kztc1AhYEFdSxVwtwPiygtq9e+9YrKIluKYWtvNC1B
 dCL/xgg/Agd184CAgZhFsNDjhcGe76fXZIytDsqqPCTarnd3kvViFeMB9zJ3p37QN
X-Received: by 2002:ac8:7ca3:: with SMTP id z3mr4801421qtv.109.1630004298097; 
 Thu, 26 Aug 2021 11:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0NBs0yoXCVDhxxyvIoSuVZI46Ki2za1WCud6R7Fwc1JTJ8N/NQyxN0YL5fi6eZQo9sQmd/w==
X-Received: by 2002:ac8:7ca3:: with SMTP id z3mr4801391qtv.109.1630004297827; 
 Thu, 26 Aug 2021 11:58:17 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id t8sm2328195qtn.37.2021.08.26.11.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:58:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] migration: Make migration blocker work for snapshots
 too
Date: Thu, 26 Aug 2021 14:58:11 -0400
Message-Id: <20210826185813.248441-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826185813.248441-1-peterx@redhat.com>
References: <20210826185813.248441-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

save_snapshot() checks migration blocker, which looks sane.  At the meantime we
should also teach the blocker add helper to fail if during a snapshot, just
like for migrations.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 041b8451a6..f476e2101e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2062,15 +2062,16 @@ int migrate_add_blocker(Error *reason, Error **errp)
         return -EACCES;
     }
 
-    if (migration_is_idle()) {
-        migration_blockers = g_slist_prepend(migration_blockers, reason);
-        return 0;
+    /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
+    if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(migration/snapshot in progress) for: ");
+        return -EBUSY;
     }
 
-    error_propagate_prepend(errp, error_copy(reason),
-                            "disallowing migration blocker "
-                            "(migration in progress) for: ");
-    return -EBUSY;
+    migration_blockers = g_slist_prepend(migration_blockers, reason);
+    return 0;
 }
 
 void migrate_del_blocker(Error *reason)
-- 
2.31.1


