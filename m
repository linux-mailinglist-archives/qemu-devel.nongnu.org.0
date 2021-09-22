Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88001414E37
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:38:27 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5GM-0005jo-IO
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4yo-0007eV-Ly
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4ym-0000cg-EB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632327615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cjd8utIBAh8JzqAuJRPGpgy/cy0qCGBlHK1sSTFBVI=;
 b=alhlQVmq8XS9vsdqxXnk1rRF1pjiDiE13VOyB2fBG5DavuYJBdcJsXj+gzb/b+4knMHoGz
 iCYbP6XqUFu3eIdHuDN6663fP92Qqgn1gh9cWPkRsKaa4JpAdm0QzybEoneDlcyuTS+HDv
 cC9eVJPBJOToNb3TnwkKgc+CXkzchi0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-PKU9zcDAPmSk-xsTZaJBgA-1; Wed, 22 Sep 2021 12:20:14 -0400
X-MC-Unique: PKU9zcDAPmSk-xsTZaJBgA-1
Received: by mail-qt1-f197.google.com with SMTP id
 w10-20020ac87e8a000000b002a68361412bso9840508qtj.7
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2cjd8utIBAh8JzqAuJRPGpgy/cy0qCGBlHK1sSTFBVI=;
 b=SfT17WHOnndXlMOikadruPZ9tkLhyA4LO7fJazOHz1FlNKaIRkt8IPlzZ/5aM4at8s
 HHfOJCXghTR6Q5zct/4h5ruSs+tSnIgjM83e+FzNY5W0cE+TW/PxCN0u8DDHNzNlHUrK
 OszAHI47uAFgNOHS/FHAzx/FYKxrGRG5+OJRskorJPPGKcdjDPjVgvl72HHGf/nhRK+w
 IcXDU1D5Bk5xewK6VbztHdGRG7A2QdEbDtZZ8VaXuSJ35KU1f1Yq8hVyl1VCVXCvqsYS
 bKrlVdg7GqbEB9jEhY/zyhxtkNTvEeYUddJynh3/QgD7NHkLyiSfBkZ5bGDamFwjNSLN
 ChrA==
X-Gm-Message-State: AOAM530L8qvFhLuquEdIIrLgr0RvbdQZ+yh5QW+5bWYKTIg1LHNIlUp9
 Zghm9ffkAxhu1x9xZ4EmkamkkBZNhnFn5y1JNEv6uaMYHQiwKuQcu6Juc18s5IUM/Auws0nipil
 mcpfmBbF+DmuCT2nO/EkoV65o6qt2YalL+UCcviqPgy4G4EgHtubKHKFAD+xta2LB
X-Received: by 2002:a37:6708:: with SMTP id b8mr31070qkc.283.1632327613848;
 Wed, 22 Sep 2021 09:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc7kkKzLDNTYSaPRglIrk4GOAIuUytdkK4VE5g4o8+6iXc6TR9jeSpJgfaBOFljJY+KsWRQA==
X-Received: by 2002:a37:6708:: with SMTP id b8mr31039qkc.283.1632327613604;
 Wed, 22 Sep 2021 09:20:13 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id z186sm2094811qke.59.2021.09.22.09.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:20:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] migration: Make migration blocker work for snapshots
 too
Date: Wed, 22 Sep 2021 12:20:07 -0400
Message-Id: <20210922162009.125622-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922162009.125622-1-peterx@redhat.com>
References: <20210922162009.125622-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bb909781b7..6f7177daa0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2048,15 +2048,16 @@ int migrate_add_blocker(Error *reason, Error **errp)
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


