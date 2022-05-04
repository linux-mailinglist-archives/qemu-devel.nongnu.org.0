Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D551ADBB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:26:11 +0200 (CEST)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKdW-0006Sm-AE
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXm-0006FA-5s
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXk-00059O-Ca
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651692010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OldqSj6ZhjcEWqr35wQqdzeCrylOxSMHkGFbo7CK6Qo=;
 b=F5cwu6GrL5Nm32HuIdNJvvBXu/Owvzeikk/X20NqvPLdGM3ChnyFIfbZuHCgIULjQom8xZ
 l+CXuRhYANcv4n5D+KnHG+csSmRMqZty0M4Dsy0xucvMO3GKcZn+nddlne9t9I3kX8gqHm
 ct8unh4DBMM3jPFCb8FRTbZDeUpW7S0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-0FZPUHvuOPaBij2Q0YkLrQ-1; Wed, 04 May 2022 15:20:09 -0400
X-MC-Unique: 0FZPUHvuOPaBij2Q0YkLrQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 g20-20020a67e214000000b0032cdb80e1ffso158396vsa.17
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OldqSj6ZhjcEWqr35wQqdzeCrylOxSMHkGFbo7CK6Qo=;
 b=EcyDYNWR9MhVMAG6hCF///I9WcHQ0flHB6o+GuPOdUSP2CYE2pfnBU752R36QJqb9e
 jKf7EImQO/sm5n03BtVbPblKzjz5COWdzpLFaN4IRO4GcLVGWgg46i/6YF8gFjy0vtsR
 OAP4tpj8HfcR2syyINfSM2D+8oSfdW3O5LcBkjfnO2Hwq4XwqPQc7yURVYI188c2gaMF
 V9yCIP+F8glr/qLCQ3T+oSKpBNOpGIgAJ/tu/aT4/+5PZ5mtoGhZP0n/U777iSYH3dWl
 9P8PdjlgZoyhEia+iathOpBXUShzOdZQYdY7qPZUFwMzCPLuV+HvTFo8D6TeDemNhWYZ
 tQGw==
X-Gm-Message-State: AOAM532WsdivjIn0kAMZlGkf9BfJJHLka+1Uf+JV3e57BLoG7SnQXWM7
 hURRmvQW3ZRWiHzFCDyT84lmpgyTxGnfAsVY3vH2J6Listw8/rnd3B5D4yxAKM56WI0+ez+28Hj
 a6XddkgwwaXiVv7A=
X-Received: by 2002:ab0:240a:0:b0:360:7c96:2f8c with SMTP id
 f10-20020ab0240a000000b003607c962f8cmr6934555uan.48.1651692008813; 
 Wed, 04 May 2022 12:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznw5eVvQaL7yzMbmd2E79f7WhZS/CH5Kz/XyVPvvKqOn9yFRsCD+ti+isTRRErQTCN0hiXUw==
X-Received: by 2002:ab0:240a:0:b0:360:7c96:2f8c with SMTP id
 f10-20020ab0240a000000b003607c962f8cmr6934545uan.48.1651692008624; 
 Wed, 04 May 2022 12:20:08 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:1312:73ed:3343:f316:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o80-20020a1fa553000000b0034e6f1fd04esm1647302vke.24.2022.05.04.12.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:20:08 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v11 5/7] multifd: multifd_send_sync_main now returns negative
 on error
Date: Wed,  4 May 2022 16:18:34 -0300
Message-Id: <20220504191835.791580-6-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504191835.791580-1-leobras@redhat.com>
References: <20220504191835.791580-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Even though multifd_send_sync_main() currently emits error_reports, it's
callers don't really check it before continuing.

Change multifd_send_sync_main() to return -1 on error and 0 on success.
Also change all it's callers to make use of this change and possibly fail
earlier.

(This change is important to next patch on  multifd zero copy
implementation, to make it sure an error in zero-copy flush does not go
unnoticed.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/multifd.h |  2 +-
 migration/multifd.c | 10 ++++++----
 migration/ram.c     | 29 ++++++++++++++++++++++-------
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7d0effcb03..bcf5992945 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -20,7 +20,7 @@ int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
 bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-void multifd_send_sync_main(QEMUFile *f);
+int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
 
 /* Multifd Compression flags */
diff --git a/migration/multifd.c b/migration/multifd.c
index 2a8c8570c3..15fb668e64 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -566,17 +566,17 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
 
     if (!migrate_use_multifd()) {
-        return;
+        return 0;
     }
     if (multifd_send_state->pages->num) {
         if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
-            return;
+            return -1;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -589,7 +589,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return -1;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -608,6 +608,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
diff --git a/migration/ram.c b/migration/ram.c
index a2489a2699..5f5e37f64d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2909,6 +2909,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 {
     RAMState **rsp = opaque;
     RAMBlock *block;
+    int ret;
 
     if (compress_threads_save_setup()) {
         return -1;
@@ -2943,7 +2944,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    multifd_send_sync_main(f);
+    ret =  multifd_send_sync_main(f);
+    if (ret < 0) {
+        return ret;
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3052,7 +3057,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->f);
+        if (ret < 0) {
+            return ret;
+        }
+
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_transferred_add(8);
@@ -3112,13 +3121,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
-    if (ret >= 0) {
-        multifd_send_sync_main(rs->f);
-        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-        qemu_fflush(f);
+    if (ret < 0) {
+        return ret;
     }
 
-    return ret;
+    ret = multifd_send_sync_main(rs->f);
+    if (ret < 0) {
+        return ret;
+    }
+
+    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(f);
+
+    return 0;
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-- 
2.36.0


