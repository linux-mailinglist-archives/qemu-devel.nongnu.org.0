Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FB54F9B7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:57:12 +0200 (CEST)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DPL-0003ae-R5
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHb-0003k0-Mc
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHZ-0008Cu-Vg
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655477349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pP2NADRE9oOFEa/D5phGxp4aqs8ySJ4/3PmGOiorPaI=;
 b=ZIvszDdzJ3N2/4n4Y0ejoFyF0z0dLaZg5EFXoyG+3N2OJ1/+hL+0HG9ybz/leQK98Xx8Wd
 9p4ajl7EYrw9gqf91O9jh+1uPV1AbA2OKef1CQAjDnLLm2xIsIx6FUcUXqvZYSyBnV+2GU
 mituONwfZRpiZqpdMkaizS08lqqE4H8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-JQyx64t-PDuhRFLza_nRsg-1; Fri, 17 Jun 2022 10:49:08 -0400
X-MC-Unique: JQyx64t-PDuhRFLza_nRsg-1
Received: by mail-io1-f70.google.com with SMTP id
 e195-20020a6bb5cc000000b0066cc9ece80fso2647333iof.5
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pP2NADRE9oOFEa/D5phGxp4aqs8ySJ4/3PmGOiorPaI=;
 b=5uY0E1rRxJnU5XZSB/kClAisnFFRKFZ6jvbXybgzwyhrksrw4/s+L8oPwiSzmXaU47
 QUq89Rd4dsoonyqkIzIy1BZugSoD5Gj5Q1g7whchQlNPjpcraLuOwphrrYPoGOSZrEBB
 z2JTxUAdC7KAC8yuGSbzCHWCPyq3Uz18gFB9Ztrt7yv5kesj80kREf2aD4FBgjaPP6mv
 UCyZMsjvJCAaMoNsYnc2ur/uEunvQGsTXo5jDxAaFWzH6hSE4Jv5zpul5S762C3725tK
 Fgd3J1/I7BLrkFh/QWoo8GCvDB+PToXGqeuemGncAQrjQmy/W8Hq1fnQZ9kp9BgZLyPN
 uIMw==
X-Gm-Message-State: AJIora/J6m6qOiHMP2iHUZdQRpz5KrVuSv2rRyM/Q4gZoeK3hn0EMZ7e
 BSZKrfKxJ2YzlV3p5Yo9ub//VShFWrRGp+uDAewFeed6X41JLZ3V1hWdLX+idU0zO+cn3rEIiov
 LBgyJRDpPu9AVNj1w291fT5AkkAs9+uuKR4HYOobroEWO/2WO8MB4Kp4kvtb/s1kn
X-Received: by 2002:a5e:c307:0:b0:668:b809:ecbb with SMTP id
 a7-20020a5ec307000000b00668b809ecbbmr5074392iok.174.1655477347419; 
 Fri, 17 Jun 2022 07:49:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulTI5jf9v+SxLsKOm0xVjWjOhqBBUMtqTPrYVM5hTCGt4mVyXcz0pwN4eP4CRlSWGCrbaeHA==
X-Received: by 2002:a5e:c307:0:b0:668:b809:ecbb with SMTP id
 a7-20020a5ec307000000b00668b809ecbbmr5074366iok.174.1655477347096; 
 Fri, 17 Jun 2022 07:49:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm2294838jap.83.2022.06.17.07.49.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Jun 2022 07:49:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 4/5] cpu: Allow cpu_synchronize_all_post_init() to take an errp
Date: Fri, 17 Jun 2022 10:48:56 -0400
Message-Id: <20220617144857.34189-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617144857.34189-1-peterx@redhat.com>
References: <20220617144857.34189-1-peterx@redhat.com>
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
index a673302cce..e1a072080a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1419,7 +1419,7 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
 
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


