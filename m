Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF35FBDB2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:12:30 +0200 (CEST)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNUD-0003eI-4L
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEe-0001rJ-SX
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEd-0003YM-4W
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jD7tsKbZ/y7WJ9tIIuvB2nn8zEDHeThpW1yJ/5VkuHs=;
 b=JRBZTYUfLez5ja6k10+4C6loC885FB+nbaf8T7mPusUcZ11b7EtI7DRArp2XWI/dkxT0vt
 7fp8QBhTVlaCurMO10gCcN7MnqRr+BWjlK4fU05rNVEGminBbJVPkjT6HiX+8OBaXiXmYn
 4NR4bdktF87g+5rgK9NrkxpByKvj+0s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-QDjEt3ZINUmfJ_es7l2hqw-1; Tue, 11 Oct 2022 17:56:21 -0400
X-MC-Unique: QDjEt3ZINUmfJ_es7l2hqw-1
Received: by mail-qt1-f197.google.com with SMTP id
 bz12-20020a05622a1e8c00b0039ae6e887ffso3833489qtb.8
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jD7tsKbZ/y7WJ9tIIuvB2nn8zEDHeThpW1yJ/5VkuHs=;
 b=xMCb8fhFp+Fx/HJz489E1hlZXJvLeHYitxQ5qn4rrwRSwpK4BZXxAuD4tKcJvNelyj
 Gp9tipV3M4Sbc8WIjYv4gKmcug3AgWOSRet5a+NNYTxHHZJJu8gPyuJ8xRTYMERifybe
 25Xh4efr2rkmvNCOw1+6ioxEWW8C/8Uv2Jm0ofyqVuKzSQIfX8VQtU0m7YubquL04Ovb
 +1p+DgoO5XPf89iZBENUAw4I0aA8ZErCqgHq5nlQ+gVVMmHCjF9cttEsEJ5ya+Mpbha0
 CgZMjsZ5DtCnfNJmLFr6FUZAh4lg/AqrAMCoPkklSzCrqR6QvqlXBlKf828VK/Uc9GJK
 Lexw==
X-Gm-Message-State: ACrzQf1nt+PJsL0qxqqjs3nldmkE0UfMF+zyrOOQsjQSJHvtX8jdVRVU
 Sjx+sXHsQy68L8XFnoCfuCh3CSdVC4rw3ShJlsMSP3HZfkdkrd2OfxreEt1bCjqZMyyq74VFBPA
 2jc+ruwxW2lWpPkwc8aEUGfMcNDGA3gX74frFr07lMQ7fHqtpKRqm/bjUNJOrQ9c7
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr17973290qkl.320.1665525380878; 
 Tue, 11 Oct 2022 14:56:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7t0dtiPlqrHrYcxZX10L2zlFeHiCzt9ZMvXhaXG4xUM5m++creuOF4Tn1u2IOXSgVngmbZpA==
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr17973272qkl.320.1665525380590; 
 Tue, 11 Oct 2022 14:56:20 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:20 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 15/15] migration: Drop rs->f
Date: Tue, 11 Oct 2022 17:55:59 -0400
Message-Id: <20221011215559.602584-16-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now with rs->pss we can already cache channels in pss->pss_channels.  That
pss_channel contains more infromation than rs->f because it's per-channel.
So rs->f could be replaced by rss->pss[RAM_CHANNEL_PRECOPY].pss_channel,
while rs->f itself is a bit vague now.

Note that vanilla postcopy still send pages via pss[RAM_CHANNEL_PRECOPY],
that's slightly confusing but it reflects the reality.

Then, after the replacement we can safely drop rs->f.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index db3bf51dad..538667b974 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -323,8 +323,6 @@ struct RAMSrcPageRequest {
 
 /* State of RAM for migration */
 struct RAMState {
-    /* QEMUFile used for this migration */
-    QEMUFile *f;
     /*
      * PageSearchStatus structures for the channels when send pages.
      * Protected by the bitmap_mutex.
@@ -2527,8 +2525,6 @@ static int ram_find_and_save_block(RAMState *rs)
         }
 
         if (found) {
-            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss->pss_channel = rs->f;
             pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
@@ -3084,7 +3080,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
     ram_state_reset(rs);
 
     /* Update RAMState cache of output QEMUFile */
-    rs->f = out;
+    rs->pss[RAM_CHANNEL_PRECOPY].pss_channel = out;
 
     trace_ram_state_resume_prepare(pages);
 }
@@ -3175,7 +3171,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             return -1;
         }
     }
-    (*rsp)->f = f;
+    (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
         qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
@@ -3310,7 +3306,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
         if (ret < 0) {
             return ret;
         }
@@ -3380,7 +3376,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = multifd_send_sync_main(rs->f);
+    ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
     if (ret < 0) {
         return ret;
     }
-- 
2.37.3


