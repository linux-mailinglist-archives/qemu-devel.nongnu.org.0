Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E0541F80
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:33:13 +0200 (CEST)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyihE-0004Qd-D9
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHr-0007mD-O7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHq-0005GC-39
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654643217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVuTnZmfWtxZ4QXxya2rZaIVRCmdCqRL6AV8ufV87M0=;
 b=OlXcntBcd0DLHYIbEwqs3gkXq0f4JR+ZQfDyg4clX/fzyekBTlQGKAV/j66F5csFuO+zK/
 mVPWJqkelCwCt79ICMg+gnf8xbhyGudG/fGDR0PM7v2/8AfomLq3DuppRF/oHJ5ReD8b95
 qWJzDlNjJRh5VgCriVYdWlh5CJoX4pY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-aZWRwcXrN3qzYCIzyK6DWg-1; Tue, 07 Jun 2022 19:06:56 -0400
X-MC-Unique: aZWRwcXrN3qzYCIzyK6DWg-1
Received: by mail-io1-f72.google.com with SMTP id
 w16-20020a5d8450000000b00669877b9ce2so1077008ior.20
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hVuTnZmfWtxZ4QXxya2rZaIVRCmdCqRL6AV8ufV87M0=;
 b=stVug6r6lX/eEmoXwgGsw5wmV7KL19eqQNM8xq1YhQi/3dyRyIWN7iTk8YTdo+7vL+
 YWnDC/U/BDdycZvWwD2lu+ojEvWn8CDzWTlxMFku73WeaqzMyLmJ0M4dj8LDBNJxIC6W
 3LxQluoTQeG42k08xcvMs/bznJCWqaKNevWKQAGzrtXJ7IQIX9oKDbxUGMXblBmTdBXw
 S/JavpwIhsZ1YcfeQCPDbjTQ2qUdSGJXWb9JHE8eqUsER00zD/QyEete+gKBWZhLcGvl
 KK64GzsMRYnhGO1r0VNzIYlkkLdKH0jiw2jKlW0vR2jXo37loNFFJ1a2B7WeuYE++VB5
 qx1w==
X-Gm-Message-State: AOAM533Esg6IDBrovumdWU7FrZ/agzp+IM4eRgMg4Krv+71+Nfc/w07Q
 HZ7y3Fkc/tbgrZLis+ZavvyXj+WjzlGE+XizJXr5TKBE7tHLVK1CWn9GvbSlfPfaRebB5nhY5GY
 v3ACL+LncU0gVpGMzekoo5uNjFLYY5c+5JUw1m+4bd7eJ75ZpKjCI/y4+NMLTsBAP
X-Received: by 2002:a05:6e02:1b0c:b0:2d3:bfdf:e3c5 with SMTP id
 i12-20020a056e021b0c00b002d3bfdfe3c5mr18242846ilv.138.1654643215633; 
 Tue, 07 Jun 2022 16:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzReFK3G/dsvopsshu544F2UsRS33cSv536GmHPdfgfoMZhppkKoZ0NlkPik9D6MRTZpBQ60A==
X-Received: by 2002:a05:6e02:1b0c:b0:2d3:bfdf:e3c5 with SMTP id
 i12-20020a056e021b0c00b002d3bfdfe3c5mr18242826ilv.138.1654643215337; 
 Tue, 07 Jun 2022 16:06:55 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056602038600b00665862d12bbsm7035375iov.46.2022.06.07.16.06.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jun 2022 16:06:54 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 4/5] cpu: Allow cpu_synchronize_all_post_init() to take an
 errp
Date: Tue,  7 Jun 2022 19:06:44 -0400
Message-Id: <20220607230645.53950-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607230645.53950-1-peterx@redhat.com>
References: <20220607230645.53950-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Allow cpu_synchronize_all_post_init() to fail with an errp when it's set.
Modify both precopy and postcopy to try to detect such error.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/core/machine.c     |  2 +-
 include/sysemu/cpus.h |  2 +-
 migration/savevm.c    | 20 +++++++++++++++++---
 softmmu/cpus.c        |  2 +-
 4 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index c53548d0b1..b5daad82f8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1447,7 +1447,7 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
 
 void qdev_machine_creation_done(void)
 {
-    cpu_synchronize_all_post_init();
+    cpu_synchronize_all_post_init(NULL);
 
     if (current_machine->boot_config.has_once) {
         qemu_boot_set(current_machine->boot_config.once, &error_fatal);
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index b5c87d48b3..a51ee46441 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -45,7 +45,7 @@ bool cpus_are_resettable(void);
 
 void cpu_synchronize_all_states(void);
 void cpu_synchronize_all_post_reset(void);
-void cpu_synchronize_all_post_init(void);
+void cpu_synchronize_all_post_init(Error **errp);
 void cpu_synchronize_all_pre_loadvm(void);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/migration/savevm.c b/migration/savevm.c
index d9076897b8..1175ddefd4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2005,7 +2005,17 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     /* TODO we should move all of this lot into postcopy_ram.c or a shared code
      * in migration.c
      */
-    cpu_synchronize_all_post_init();
+    cpu_synchronize_all_post_init(&local_err);
+    if (local_err) {
+        /*
+         * TODO: a better way to do this is to tell the src that we cannot
+         * run the VM here so hopefully we can keep the VM running on src
+         * and immediately halt the switch-over.  But that needs work.
+         */
+        error_report_err(local_err);
+        local_err = NULL;
+        autostart = false;
+    }
 
     trace_loadvm_postcopy_handle_run_bh("after cpu sync");
 
@@ -2772,7 +2782,11 @@ int qemu_loadvm_state(QEMUFile *f)
     }
 
     qemu_loadvm_state_cleanup();
-    cpu_synchronize_all_post_init();
+    cpu_synchronize_all_post_init(&local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return -EINVAL;
+    }
 
     return ret;
 }
@@ -2789,7 +2803,7 @@ int qemu_load_device_state(QEMUFile *f)
         return ret;
     }
 
-    cpu_synchronize_all_post_init();
+    cpu_synchronize_all_post_init(NULL);
     return 0;
 }
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 464c06201c..59c70fd496 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -146,7 +146,7 @@ void cpu_synchronize_all_post_reset(void)
     }
 }
 
-void cpu_synchronize_all_post_init(void)
+void cpu_synchronize_all_post_init(Error **errp)
 {
     CPUState *cpu;
 
-- 
2.32.0


