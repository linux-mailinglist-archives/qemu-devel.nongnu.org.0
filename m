Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F565BF1A2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:02:14 +0200 (CEST)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanBt-0006MX-7U
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6W-00064z-Db
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6U-0001Vc-NX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwOXFkTQrTibzA65OyWTTWJhrtaPwhXcDaZWJsbWqCY=;
 b=L7EILORtyl+QD9Aa0rFatIOaCwqNDEdg1I9GTjZ0hDh5bNfVDAmN+GsMFW9w7nK/Hei8Ok
 TAAgACFcN5RAl1cnppy0oJloRKE8/RXOj0li3jVYMNGJdM3IvGjtFCwv7SpFb1B38Nf41B
 6mutCyh8pmMPh7M1Gd30hx7Wl+NbZn4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-kut4LKlBN7SVF4f1XnnoGw-1; Tue, 20 Sep 2022 18:52:33 -0400
X-MC-Unique: kut4LKlBN7SVF4f1XnnoGw-1
Received: by mail-qv1-f72.google.com with SMTP id
 y16-20020a0cec10000000b004a5df9e16c6so3046133qvo.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iwOXFkTQrTibzA65OyWTTWJhrtaPwhXcDaZWJsbWqCY=;
 b=sziPieVvX7rRvwwjGvgeI4kFWAtNKj1cnL/YCX/O4hYeJZSDtOk8mvquuTu0isKW2n
 rKRDYpeJnmXWCGz97zkUraRXAvIWsAmor8gVEx9//dUeAMgo+fhOw6vxdmn9nO+vNryF
 yghC+8frZTfzj3MnX2nh3+jSXKAUMR76AJN2ppAwTvmcwSvBZyIgnw7KZI6WPvcBJg/B
 6EgFL7SB26SA+Y0aKHPFAkvcSoQr6k/sC5QVRUjBnGKB08v49y4F37SdfijawSYE9xqV
 awNk1zW0PawMrLrE6chOT3YWvGdJ9ro1uQz8IEGfSouOfCADxXYUq6ntX8CgMsurqVCZ
 BpNg==
X-Gm-Message-State: ACrzQf23ekGV0lGikO7/L3sIffIkf9yuoyAjp2+TkvNdxb5Dz6OwDsqC
 gaQMLu17rwHbo1kVEolw2pho/abwyZcTIY7VZShsc+7wmCAOoYFF2dRQzw7W9urbVvfFzQ/yI8G
 hXtZfcYq9S0b/7xQmkY6UP39uVHK3Dn9mR/JEcUbHnNk6J7VjoLV3nGvd3uN1sg5H
X-Received: by 2002:a05:622a:590:b0:35c:f3f0:f8dc with SMTP id
 c16-20020a05622a059000b0035cf3f0f8dcmr7118635qtb.440.1663714352078; 
 Tue, 20 Sep 2022 15:52:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57KSLNMXFPEnUQIXIzBCWRd07AM8fRBSx+8D6xo4Ww7OM/aAImGeVQGpnth6Z7Azw8jaOAcA==
X-Received: by 2002:a05:622a:590:b0:35c:f3f0:f8dc with SMTP id
 c16-20020a05622a059000b0035cf3f0f8dcmr7118618qtb.440.1663714351752; 
 Tue, 20 Sep 2022 15:52:31 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a37e103000000b006ce3fcee2bdsm675903qkm.50.2022.09.20.15.52.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:52:31 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 14/14] migration: Drop rs->f
Date: Tue, 20 Sep 2022 18:52:29 -0400
Message-Id: <20220920225229.49212-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f42efe02fc..03bf2324ab 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -345,8 +345,6 @@ struct RAMSrcPageRequest {
 
 /* State of RAM for migration */
 struct RAMState {
-    /* QEMUFile used for this migration */
-    QEMUFile *f;
     /*
      * PageSearchStatus structures for the channels when send pages.
      * Protected by the bitmap_mutex.
@@ -2555,8 +2553,6 @@ static int ram_find_and_save_block(RAMState *rs)
         }
 
         if (found) {
-            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss->pss_channel = rs->f;
             pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
@@ -3112,7 +3108,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
     ram_state_reset(rs);
 
     /* Update RAMState cache of output QEMUFile */
-    rs->f = out;
+    rs->pss[RAM_CHANNEL_PRECOPY].pss_channel = out;
 
     trace_ram_state_resume_prepare(pages);
 }
@@ -3203,7 +3199,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             return -1;
         }
     }
-    (*rsp)->f = f;
+    (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
         qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
@@ -3338,7 +3334,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
         if (ret < 0) {
             return ret;
         }
@@ -3406,7 +3402,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = multifd_send_sync_main(rs->f);
+    ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
     if (ret < 0) {
         return ret;
     }
-- 
2.32.0


