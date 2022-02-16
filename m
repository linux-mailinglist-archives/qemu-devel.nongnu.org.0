Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6114B825C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:56:49 +0100 (CET)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFBA-0005ik-6c
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoy-0004iy-SU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDow-0006Ir-T3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKq1F7ChzJUEmtQ4wXBaDdmq6gB9HiH3cqClItWEPtI=;
 b=dgfI2IJupI7swmqj/5F9DJCEvgCZZA5ghRHqvUZyvloSXnGao06B74nTuQtqf0iWzKkF39
 hPMyHw2qAAGJuGpBqg3aLqvAWvCdCsH17NyPW/LGz2CcgH9aFafclxoYL0t/YVS5qRb7NC
 mEzed0HdqQHMsLQVGs5Ej7uGAMVXz34=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-tRb1MBR4NyKt2Dju88U4nw-1; Wed, 16 Feb 2022 01:29:45 -0500
X-MC-Unique: tRb1MBR4NyKt2Dju88U4nw-1
Received: by mail-pl1-f199.google.com with SMTP id
 a13-20020a170902ee8d00b0014f308fed09so693823pld.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKq1F7ChzJUEmtQ4wXBaDdmq6gB9HiH3cqClItWEPtI=;
 b=iRAtPZ4BWJYB7VCASJxOK4r0rVMboVKtMKwknMImCxivvYpo02Hfst6kd92sleZHHX
 FViaEwUzMtmsE79dISz4jDatVPD7KA3mDI9w141Xdd3lIn96H0revpijsVRtqNPEeJbH
 +31HzEYP5tOCNs70HAS/v8JJRxRbDJd0RprPnbHY8yHYvfdLmPvfD0f55WrFa04fE/lP
 rKt9kd9PeRVapiOxIpwK7mMpZ5cptht79WXwBS6t2yx4zPuubPudHD+PXfdjh89YaV6z
 dzlQBwZKtfBNTCAtxyMTo/TJA98FdWJpjzT8cEF2ar4QvYeBKaPqcYXY7gs73L1yzBYn
 iJzA==
X-Gm-Message-State: AOAM5314Oo7j1ewd44gfGb6n4dz7LtN4jzH+n+8T/+Dysdwvtob/GfON
 KC4KAy8C92O6htawSScpTc2z2J6bAaaK954H4+lXlYuZpLvAbxCTnNmdCYacSvtY0oOek0gJ8S8
 f7/a2clKzDh9SHYCOJh7aCEV7S+3ZELBQcCqSUQCokzxbyB2TilTt1vnrfgZ4ECod
X-Received: by 2002:a63:1826:0:b0:373:41d9:b14e with SMTP id
 y38-20020a631826000000b0037341d9b14emr1067625pgl.197.1644992984000; 
 Tue, 15 Feb 2022 22:29:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqMPu4+JoKFzVnIfuVE0n5y/W/w0WK2mZI66JWyDjeXEA0Qp7RPvFMlS5qGMGqhD+4Ovwakg==
X-Received: by 2002:a63:1826:0:b0:373:41d9:b14e with SMTP id
 y38-20020a631826000000b0037341d9b14emr1067608pgl.197.1644992983636; 
 Tue, 15 Feb 2022 22:29:43 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:43 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/20] migration: postcopy_pause_fault_thread() never fails
Date: Wed, 16 Feb 2022 14:28:00 +0800
Message-Id: <20220216062809.57179-12-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the title, remove the return code and simplify the callers as the errors
will never be triggered.  No functional change intended.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 6be510fea4..738cc55fa6 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -890,15 +890,11 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
                                       affected_cpu);
 }
 
-static bool postcopy_pause_fault_thread(MigrationIncomingState *mis)
+static void postcopy_pause_fault_thread(MigrationIncomingState *mis)
 {
     trace_postcopy_pause_fault_thread();
-
     qemu_sem_wait(&mis->postcopy_pause_sem_fault);
-
     trace_postcopy_pause_fault_thread_continued();
-
-    return true;
 }
 
 /*
@@ -958,13 +954,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
              * broken already using the event. We should hold until
              * the channel is rebuilt.
              */
-            if (postcopy_pause_fault_thread(mis)) {
-                /* Continue to read the userfaultfd */
-            } else {
-                error_report("%s: paused but don't allow to continue",
-                             __func__);
-                break;
-            }
+            postcopy_pause_fault_thread(mis);
         }
 
         if (pfd[1].revents) {
@@ -1038,15 +1028,8 @@ retry:
                                         msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
-                if (postcopy_pause_fault_thread(mis)) {
-                    /* We got reconnected somehow, try to continue */
-                    goto retry;
-                } else {
-                    /* This is a unavoidable fault */
-                    error_report("%s: postcopy_request_page() get %d",
-                                 __func__, ret);
-                    break;
-                }
+                postcopy_pause_fault_thread(mis);
+                goto retry;
             }
         }
 
-- 
2.32.0


