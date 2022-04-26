Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB6510C73
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:11:56 +0200 (CEST)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njULb-00016j-KF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUI0-0003Jc-8r
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUHy-0000Cn-Hj
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651014490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OldqSj6ZhjcEWqr35wQqdzeCrylOxSMHkGFbo7CK6Qo=;
 b=Eckgb7egdgAgYKBo7acPTe/amhOvENZujr5R8/wTKfCzLBF2ChrgoQuripID5h7IdaX2qV
 E+ZHFFwzYFtleWUb3awpFkk4Zt0Y67VOdn2JDDebW2EROpJK6d0kbgZ9jeUErQs/ciaUOZ
 2pzmGjfStgS/a4FvyIo2UqBJ8x5pziY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-I7-nyvJ8MyWmhATTiRciCQ-1; Tue, 26 Apr 2022 19:08:08 -0400
X-MC-Unique: I7-nyvJ8MyWmhATTiRciCQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 q11-20020a9d57cb000000b006059c31dc26so4936836oti.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OldqSj6ZhjcEWqr35wQqdzeCrylOxSMHkGFbo7CK6Qo=;
 b=LVDZeBlDsWIZ1/HVYbqD5epDX0+DmfGqphgD3q9iZ5e+vZ9grJpe1oUpZ/DvLxtnPU
 cWfcBp25Zfps6Zm5ES8vYsJB8u/eTR30Op+MEoIV4nj97mZyRClOBNIzjKHQrUk0qqrW
 e6rOxBGDQuV4zeBwAh7r1ulBB4xY12EzL08OGc2bNLOcbLfrTL7IzXxvmWhJjyWaBQ4l
 0DPYbC8o8J5dF9iDO5iZAVSG6NGUNSXxT6Fm7hHMKt+BpgZvE5lpS2j4D2qxCo2i7DrP
 mgyqsm423uEocsN/QRAzi6k5O5U1rI0dEPdE7kDzKCN1QKFwlxYP3j0xMoa4cv7G6xHt
 knpQ==
X-Gm-Message-State: AOAM5322SAo31cGi44uz3zPyaIx9Y3zWD88QZ//sZyhgDFnA4fmKByrI
 4Pt0sbwZ0gOfdTy/L9SndauKFG24xuBdz8V+bG0B47uV9+VfdNLnWCuZZQ1LO3AlXRb9G8OF6kz
 khtzRdK/DuGEUnA4=
X-Received: by 2002:a05:6808:2228:b0:322:8cd4:874 with SMTP id
 bd40-20020a056808222800b003228cd40874mr16186054oib.123.1651014487966; 
 Tue, 26 Apr 2022 16:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYTH/ZWjjDC5cBA1CeK+Ee7dY2ty4IO+4LXCfpIZ4G1ohtWyvfOMWSJxC0uDruXKpgO0MG6A==
X-Received: by 2002:a05:6808:2228:b0:322:8cd4:874 with SMTP id
 bd40-20020a056808222800b003228cd40874mr16186045oib.123.1651014487787; 
 Tue, 26 Apr 2022 16:08:07 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a4a3004000000b0035e974ec923sm419855oof.2.2022.04.26.16.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:08:07 -0700 (PDT)
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
Subject: [PATCH v10 5/7] multifd: multifd_send_sync_main now returns negative
 on error
Date: Tue, 26 Apr 2022 20:06:54 -0300
Message-Id: <20220426230654.637939-6-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426230654.637939-1-leobras@redhat.com>
References: <20220426230654.637939-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
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


