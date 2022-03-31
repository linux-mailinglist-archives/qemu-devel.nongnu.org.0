Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4364EDCB3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:22:01 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwca-0005tm-Ef
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:22:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQL-0002Id-C0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQI-0001Na-5H
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWpfOPDWJiir2kbNPeHaebJZkVlgkAHklNyvbakimFg=;
 b=WemTrl1WU50a/WfANkmz9jthK7HyoBmL2V5z7NwVHTNQTWuF4Wy0Va0CqvlMdroNDbJSER
 2Q6i0GEmJcn/QgBZuSBigxlI9JkmO0UtnnlxDS9X3NctR/+hQ4xWRGQGLAs6tuv5TxJNeZ
 ODVy8fQUKMDDNi86/iz1IxfnTRw72XQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-ojeGOXlEMWihP8oNDXNBLQ-1; Thu, 31 Mar 2022 11:09:16 -0400
X-MC-Unique: ojeGOXlEMWihP8oNDXNBLQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 a66-20020ae9e845000000b0067b308a9f56so14989245qkg.21
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWpfOPDWJiir2kbNPeHaebJZkVlgkAHklNyvbakimFg=;
 b=T7FM9Kwja2Jp5SjFxBceop3tbA7gt4JUbgKiK9dmRhL66AA6BHnAz+HJRcP4Gbfcso
 +7gCW1GHnoxZkLLQZkgDxwmOKVYG51lswYaVuoNbnknE3jRnzXIphYvKkm96Nq+C+DzI
 LL5JgOy2xobVxUyKOFBnrHnLXSGMciGywk9fbj4gpc0gkDkOF/kP1t/rPLed7Oue+mnT
 cysKQXJwAfM6jasg9FpGeAq2lQ2/JlgJnpJvcZlEgW2lDGAiyl5v2/qzGC0CUDOzc/Qz
 Zl/6IivUORlm6pV9tAzdVnbEzGx0X6+nVRmpnXOcomwPnHX+VVYSr7VZZQn2ilTZUIWy
 VBmA==
X-Gm-Message-State: AOAM531NVMWMW/a4j5LI1J+wOmkUrYtMcfiUMgWuhdP3iD4IR65RsatJ
 aXtKBf7CxicDExe+DQwrV1OK6LSsqEB4xFheGCtCmS8OIfKLvnA6iUJ0tpZjQBM2ARMkgNKBcCj
 8CToaJGwJbaQJ6wkOTmPPw1kBxnr2tBQLD9Vx+oUD3Yo8iyqYYkO58htUxQJIXpoB
X-Received: by 2002:a0c:fc46:0:b0:440:f78f:f4c4 with SMTP id
 w6-20020a0cfc46000000b00440f78ff4c4mr35470677qvp.108.1648739355554; 
 Thu, 31 Mar 2022 08:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQKeWWRrIroLoP/PNAKI1D+oZqMQQ7jOJjMWX1aTRVNaT72M0Z9XpuHgVAXd5iMSIp264VhA==
X-Received: by 2002:a0c:fc46:0:b0:440:f78f:f4c4 with SMTP id
 w6-20020a0cfc46000000b00440f78ff4c4mr35470643qvp.108.1648739355195; 
 Thu, 31 Mar 2022 08:09:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/19] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Thu, 31 Mar 2022 11:08:53 -0400
Message-Id: <20220331150857.74406-16-peterx@redhat.com>
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 899084f993..1dc80be1f4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4349,6 +4349,9 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
                       postcopy_preempt_break_huge, true),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4382,12 +4385,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
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


