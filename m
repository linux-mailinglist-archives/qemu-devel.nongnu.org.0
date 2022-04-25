Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406250ECF4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:54:53 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8Xc-0001Kf-Ha
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IT-0007af-RA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IS-0007lz-8O
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWB5t2bSp3j+jHVW/XuQFC5BecwH4sNtQvM+SEkuOr4=;
 b=Rx6eRz0/D2npzigpqUdXft7jAofTWcXVsf64p/q7CwgDUWXiP9Y+3+oBlxhPxktwQqeRb6
 uDDMgF3kcKWpmP3VkRMpzv4uWOBPQL7fksk5y/e++LPqzdPlBdBScP+WA+nwHoTrFb6zM3
 EcqCmh09bI+KkQoYb7uAQY38OR5Fp0A=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-_i5z48EeOy24h6m9CUtm5A-1; Mon, 25 Apr 2022 19:39:10 -0400
X-MC-Unique: _i5z48EeOy24h6m9CUtm5A-1
Received: by mail-io1-f70.google.com with SMTP id
 u18-20020a5d8712000000b0064c7a7c497aso12501997iom.18
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jWB5t2bSp3j+jHVW/XuQFC5BecwH4sNtQvM+SEkuOr4=;
 b=w8qVnpIPo553u6eoszXGNQy8EvoZkY01vLzQGlE2N8wi22TivPOIW4w+0fWxFUEaZT
 aAbDQmVZF9xCshBCE+ggzxqO8zjwFZt7PRTOLNWTCwODkOo26Jx85foMGlYWsUpvadYY
 TRlLf54UUpzQoOB1K72ia/KbqyuvyEvcs57N5tonIo9q/Dg1Gwla25HH4m/4sfOwC+57
 BnqMOdJHsJkNy/m4TUIoYAIZbYDa2Ekke7tpjqkdJZ3x612cWBJ6zLQYpQxu4g8CfaJn
 lmR7UZqwE8ZOwPLIZAqmhH1BezHwCXSYcrz2U11/hyI43mT8i5DO+cA8V4HuSOjT27ne
 dcHw==
X-Gm-Message-State: AOAM533bDRiwoc/HJkxvMvjWH2vsmKTqUXSh0dO2K/SxIUEJxFvVnqW5
 67558qYXDTlBE9RX/BSpe69tdTfIjs8lTQr1OUZSiiMqXi6dcjnr0COa52e+8gNhwHl3sqn54cN
 5X9Is711h5+uoK6thFxuT67Kjkf2oPotUXNCjRw1rJmQb5fxPeC3c7ShXvSkaKDaX
X-Received: by 2002:a05:6638:144b:b0:321:589b:a8ea with SMTP id
 l11-20020a056638144b00b00321589ba8eamr8702890jad.296.1650929949779; 
 Mon, 25 Apr 2022 16:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBxtpnS/9bPkha9BeXzonNEc3xMvBX4zwuoSsYbjDL7IWvAF6FlA3xe2PSCapWDE9z3AgcJA==
X-Received: by 2002:a05:6638:144b:b0:321:589b:a8ea with SMTP id
 l11-20020a056638144b00b00321589ba8eamr8702880jad.296.1650929949549; 
 Mon, 25 Apr 2022 16:39:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:09 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/21] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Mon, 25 Apr 2022 19:38:43 -0400
Message-Id: <20220425233847.10393-18-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 71a50b5c37..b0f2de1e09 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4339,6 +4339,9 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
                       postcopy_preempt_break_huge, true),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4372,12 +4375,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
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


