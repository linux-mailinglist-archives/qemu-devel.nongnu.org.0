Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F056AB39
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:16 +0200 (CEST)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WnP-0003Yw-4r
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Weq-0005vU-Gw
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Weo-0001eL-Sn
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h49fYDlaUAK3N6Swc75rYz8rs8AyMgUxeFjc5byoIx4=;
 b=DJ5heUQCYQIlN4/iSQv3/WjPZT3P/AYbMQMdAH9eOeF+QAJ7MJU+1emIgTlosp2NgZTGO6
 wJNCrEau0hvStNM69GxVeQZno88R3A2lcfSdwjhbsujF6DKlTEiusOAH7enQFvJEJqILZB
 C/qKwgP2o2lHcSUxrFjf/AbqzcrAjE0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-Ifix50PXN7ijK97t8AtAeA-1; Thu, 07 Jul 2022 14:55:19 -0400
X-MC-Unique: Ifix50PXN7ijK97t8AtAeA-1
Received: by mail-qk1-f199.google.com with SMTP id
 q184-20020a378ec1000000b006b14460be35so18896382qkd.22
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h49fYDlaUAK3N6Swc75rYz8rs8AyMgUxeFjc5byoIx4=;
 b=dbiuvD+5Fsm5RrkBEjlx3wg1KScgC7u5uYu4233dV56W6GaIBGMn58+5FvGbvLWcct
 Np3iij6P1njYmDZSfn/5e1lLEiRo98bD6Bs0fx9D6ldhNQGQjSTXzR1N81aM5D1C9+wU
 UlZIStalCmRI+L4WLVWQGeBxLo6KE52C6MpQJ8e9jtszenMrm+7+DO4vX82+doK2ul+G
 2DWO6TLKJtELT5H7TkaN/PSn5FlPmTFT1l4dGyWgfExOg/CYWSka9ZY8OQwgTEiO3HFp
 GU0wlK+XGQLX/geMPKvrAJF+IhkCSOkJqSHOnUm/YB2ImMB1y3figwr+ktk/0uNJciR6
 l6Vg==
X-Gm-Message-State: AJIora/bEIkjd4dsnR2sLQP5aoc7qLIy9he6p3kxRzx2h3S9AvReO7HZ
 HnH4sdYFl3q0/0F83sJsvCGy69HCPNplA23pxrgNIfT8z/AC+54KW/uHEjk5krclAKlmCBymbiy
 qcWyaELOAKW63q4yvoNSxiA9TilFKHmWDHd8FQUVT36R4mCcOrf9yPzQph5R1jx1A
X-Received: by 2002:a0c:9c03:0:b0:473:2e3b:509d with SMTP id
 v3-20020a0c9c03000000b004732e3b509dmr4133794qve.131.1657220118338; 
 Thu, 07 Jul 2022 11:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjq4dfy6gWkb1Plvw4sB+beCM1QJl4w8lX2VhXJuYvWCpLvXMkYuT9ZxQ0LGi80IfUC5SmEw==
X-Received: by 2002:a0c:9c03:0:b0:473:2e3b:509d with SMTP id
 v3-20020a0c9c03000000b004732e3b509dmr4133774qve.131.1657220118108; 
 Thu, 07 Jul 2022 11:55:18 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 de16-20020a05620a371000b006b46997c0a9sm9506389qkb.72.2022.07.07.11.55.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 08/14] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Thu,  7 Jul 2022 14:55:15 -0400
Message-Id: <20220707185515.27475-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's useful for specifying tls credentials all in the cmdline (along with
the -object tls-creds-*), especially for debugging purpose.

The trick here is we must remember to not free these fields again in the
finalize() function of migration object, otherwise it'll cause double-free.

The thing is when destroying an object, we'll first destroy the properties
that bound to the object, then the object itself.  To be explicit, when
destroy the object in object_finalize() we have such sequence of
operations:

    object_property_del_all(obj);
    object_deinit(obj, ti);

So after this change the two fields are properly released already even
before reaching the finalize() function but in object_property_del_all(),
hence we don't need to free them anymore in finalize() or it's double-free.

This also fixes a trivial memory leak for tls-authz as we forgot to free it
before this patch.

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index fe77c7d0ef..76cf2a72c0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4365,6 +4365,9 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
                       postcopy_preempt_break_huge, true),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4402,12 +4405,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
 static void migration_instance_finalize(Object *obj)
 {
     MigrationState *ms = MIGRATION_OBJ(obj);
-    MigrationParameters *params = &ms->parameters;
 
     qemu_mutex_destroy(&ms->error_mutex);
     qemu_mutex_destroy(&ms->qemu_file_lock);
-    g_free(params->tls_hostname);
-    g_free(params->tls_creds);
     qemu_sem_destroy(&ms->wait_unplug_sem);
     qemu_sem_destroy(&ms->rate_limit_sem);
     qemu_sem_destroy(&ms->pause_sem);
-- 
2.32.0


