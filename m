Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3955558C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:55:18 +0200 (CEST)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47Nd-0004Vi-Kg
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IN-0002vc-FU
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IL-0004J5-RN
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h49fYDlaUAK3N6Swc75rYz8rs8AyMgUxeFjc5byoIx4=;
 b=EYj5xDbHIS52ygc5nlDQw35vjCOVN2F+cG3iZgGLscTiQ2xi9lPxDLp3vZ7E2cPu5n5b74
 /GuNIvHPf6l/iYUdeLSFKQs5CASEe0ZETQ2sDOP2ay5drhensfbUaCMClMYx+R5jY6L6C0
 07f/KuMpdTbCvWQoThhkWDRTRmZhPKg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-Qd3-TOwlMQ2B5ZzWXHn0bw-1; Wed, 22 Jun 2022 16:49:48 -0400
X-MC-Unique: Qd3-TOwlMQ2B5ZzWXHn0bw-1
Received: by mail-io1-f69.google.com with SMTP id
 q13-20020a5d9f0d000000b00669c03397f7so9767468iot.10
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h49fYDlaUAK3N6Swc75rYz8rs8AyMgUxeFjc5byoIx4=;
 b=Ge69ppjo2OpoQlKCJD0OrtEmC2XkAu4sphui9PmGAm5k/UmtPkENa7J9R8ACwvy2n6
 9E9fWgKeJpDmVvQITMNSqQwDGiHzDaNwO946e0NjYSuez3Ic3SJ990Hc5dj7QIW00xBA
 A0GrSuVXib1znom0P3tCCTdhqzZp0OLehw/vGOQpsFBlfB0xTq4LL8lBE9YSZT2WhB9V
 izKJmyJT2R1sXjVaTr5+/TRofyxmq7lVtoL1/Ng/86rXF05Odau574+9vGs+0rTCYIM7
 0rS08WD1Xn3RvQ7HpGEnEKee2+K9NS8YJHnU8FNoA2xTahNKSxiQXM2pGvTn77FJJHSO
 ed/A==
X-Gm-Message-State: AJIora9LVJf8EE5+6Cm2AbDUr0s0pQNHsCgU+40cAczONc/8WCKodx0A
 ujdKaAJWrI1XO9XGAVcs6m22gf/mu/MPjZkz7YH/atFZq/96wRMcWritCMi6rUpPDg0l+4A4gRD
 NWIJLXL+KN9OBpEFl4D1cB8u1dWB43KC0pKq3NVYrrUgNuPUfT7MqNohQqR664aNz
X-Received: by 2002:a05:6e02:1a89:b0:2d9:2feb:da69 with SMTP id
 k9-20020a056e021a8900b002d92febda69mr3218843ilv.189.1655930987016; 
 Wed, 22 Jun 2022 13:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tntzEoPx0xDgUysrYMvYkCFI9gVzFo1QYTadt11PmbNBuHiQITvKVW3Qz/QhzgCYafjDqtsQ==
X-Received: by 2002:a05:6e02:1a89:b0:2d9:2feb:da69 with SMTP id
 k9-20020a056e021a8900b002d92febda69mr3218823ilv.189.1655930986679; 
 Wed, 22 Jun 2022 13:49:46 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:46 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 09/15] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Wed, 22 Jun 2022 16:49:14 -0400
Message-Id: <20220622204920.79061-10-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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


