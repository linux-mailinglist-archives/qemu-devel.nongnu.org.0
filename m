Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C6433242
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:31:58 +0200 (CEST)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclTR-00069A-65
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQr-0003dI-4G
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQp-0005c9-Ip
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOX7nqARL3VBZUhOlMwCyMghOR6R49bsh/b43icc/og=;
 b=c5ukPO0a6rUZqlPnGmU6R77xZYnhK7/WCzSl2HDaVhD2Jy5vRFn32pqyfjsUP7BkLyd9+O
 LGCVtQZgtafxmWHKFx7kkpjU/WHjoZxfKWv6i6jeqdIMUIvj0zbhad3ekEzIGh7qqFp7RM
 DMi8h+YBwKeYcP6bWbyBBbtcL51aqrA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-8li7iqUlNIOO3G5OBZXjvg-1; Tue, 19 Oct 2021 05:29:13 -0400
X-MC-Unique: 8li7iqUlNIOO3G5OBZXjvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y142-20020a1c7d94000000b00322f2e380f2so542574wmc.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOX7nqARL3VBZUhOlMwCyMghOR6R49bsh/b43icc/og=;
 b=Qd6dzp9F5VwaTpo16fr/f27FyVnyiPTohPiUXJyfphnetOMyJSdWmfrkwTYtlQDG8O
 MkXNwuLMUQZpsSTK/+K06/Vej99rppxxda14uXDMoH5SpezLjW4my00At8Cl1ZrompZw
 yZaAOhW3ydwuOyMexq5Fo5uga8n/GBlLPbEj/mHtoUgkavXSJJwrtzfLKIN7B9pQr1Dx
 Im6eh82OmThur1UmbEic9s+P+tkBECnQTz5G5Htux5dfHt891pzlShuImAr/w/8wfrWk
 oX1K5cqMT0+qcU6gvFs9eNP6hp2iMRbt2vogFHR58BUDjsri3ftwGxCe+9Job3zY2yJ5
 /tmg==
X-Gm-Message-State: AOAM531thkWLA+muOkJicaI9zj+IckQSqIJJluPeG8TXkDv8PEDlp8OS
 /w5HmQisxJ+mbWHTuLZFw3BKwJAhEo7IxtrTpnLbhLjdBDRIx5s4I1qd+Ai+dYfOFeod3Qg8cJW
 zwCNJgU4QbgjaEpUoYILZwbTwPTx66uyRT8+12EBhf1egfXzXIgqF5w1IjZUHUuqqEcg=
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr25586285wrf.181.1634635751910; 
 Tue, 19 Oct 2021 02:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcgWt6Wy2h78Dt3EjrNXMy3t9CdHC8VdiKtKJKnYlbx1NwV8JODdn0l/WUlpIGetzgSkDHig==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr25586249wrf.181.1634635751560; 
 Tue, 19 Oct 2021 02:29:11 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id k27sm1717984wms.21.2021.10.19.02.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] multifd: Implement yank for multifd send side
Date: Tue, 19 Oct 2021 11:29:01 +0200
Message-Id: <20211019092907.5255-2-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
References: <20211019092907.5255-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Date: Wed, 1 Sep 2021 17:58:57 +0200 (1 week, 15 hours, 17 minutes ago)

[[PGP Signed Part:No public key for 35AB0B289C5DB258 created at 2021-09-01T17:58:57+0200 using RSA]]
When introducing yank functionality in the migration code I forgot
to cover the multifd send side.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h | 2 ++
 migration/multifd.c | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed..16c4d112d1 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -85,6 +85,8 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
+    /* is the yank function registered */
+    bool registered_yank;
     /* thread has work to do */
     int pending_job;
     /* array of pages to sent */
diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..5a4f158f3c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -546,6 +546,9 @@ void multifd_save_cleanup(void)
         MultiFDSendParams *p = &multifd_send_state->params[i];
         Error *local_err = NULL;
 
+        if (p->registered_yank) {
+            migration_ioc_unregister_yank(p->c);
+        }
         socket_send_channel_destroy(p->c);
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
@@ -813,7 +816,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                 return false;
             }
         } else {
-            /* update for tls qio channel */
+            migration_ioc_register_yank(ioc);
+            p->registered_yank = true;
             p->c = ioc;
             qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                                    QEMU_THREAD_JOINABLE);
-- 
2.31.1


