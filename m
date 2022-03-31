Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AE4EDC77
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:14:47 +0200 (CEST)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwVa-0002K7-AA
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:14:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQE-00027S-7n
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQB-0001Lk-1q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVKNqyq4weVAvwWKRPYdQpiVnLIi/a9PNfjk/yWRalU=;
 b=aYfLGcQhyApmoEntNr43vj9jiLK3KMXaYvfPXrY4XRwWDaqKQZvcRijYoXHTtd0P+dkMG4
 gb4k4NKlBOeUaK4rlyU82wI0H6/HceiLgNO386pmmcEEMbmWO6bbsdx841q6VUo9jybWRO
 0UC+wPGvpRhIabsr4Q+lMFlg0jn18VM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-iiFexE61MlaGiKE-9H6FnQ-1; Thu, 31 Mar 2022 11:09:07 -0400
X-MC-Unique: iiFexE61MlaGiKE-9H6FnQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 h11-20020ac87d4b000000b002e1c9a3ae51so20330425qtb.0
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVKNqyq4weVAvwWKRPYdQpiVnLIi/a9PNfjk/yWRalU=;
 b=wOlB2P89DIEub8if5dairTABqfcfr0vfeQ+aDBUpabbZXvB8nBsQ6WFCJGiJPPWhkR
 OngppxNTrkx2AL+O1aosz5gxcsMM+7qp541juS9BU8kvJtalpubTyNQJlnfkr/PFJ5RW
 FtrZeGeptKPJR3hT3NJzYoRJ7QSVbpvh2fBYnNsR9d5uEtrXQRFv4QTzqwOM+I5RqUY4
 6cyK4pcYyvBMjrSmWCFKApIZubQ8ITX92ii5ppm6Iw7bZ9Xx8NWX7iKdJ04WCXbWescp
 gxXCTP9XWBeH8OsnQC6QRX8D0t/rES7oFcIgzPAMVGW4ePkLoDMfYPJDW5qMyBZYffbn
 zcng==
X-Gm-Message-State: AOAM533q9OULAeUGQp4f7pB3ilPHFWrl9Z9wU9cC8M4SQk1plbtruaWU
 qgcA2Ix35W3le8OzVdLLbpvR2xPfzM33FSfDNQ0vSCkEkxFOF+YGBRTSoNRhyehnAxlUNhdxq8m
 M4Hem4v1Vr3gch3NUCn6TIL02bszcseCAACUXa2gEGB+qhXNBAumnfWsTUwtl3Pa3
X-Received: by 2002:a05:620a:4452:b0:67d:b94a:8c34 with SMTP id
 w18-20020a05620a445200b0067db94a8c34mr3655225qkp.167.1648739346811; 
 Thu, 31 Mar 2022 08:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCvz5Uvw0evkcyqodn5yY0IMEf8nFv5vWrKL0Mc5nwUlMJ8/spPr0SQbCYqunPgFUXHV2CqA==
X-Received: by 2002:a05:620a:4452:b0:67d:b94a:8c34 with SMTP id
 w18-20020a05620a445200b0067db94a8c34mr3655190qkp.167.1648739346475; 
 Thu, 31 Mar 2022 08:09:06 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/19] migration: Allow migrate-recover to run multiple
 times
Date: Thu, 31 Mar 2022 11:08:45 -0400
Message-Id: <20220331150857.74406-8-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Previously migration didn't have an easy way to cleanup the listening
transport, migrate recovery only allows to execute once.  That's done with a
trick flag in postcopy_recover_triggered.

Now the facility is already there.

Drop postcopy_recover_triggered and instead allows a new migrate-recover to
release the previous listener transport.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 13 ++-----------
 migration/migration.h |  1 -
 migration/savevm.c    |  3 ---
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 8ecf78f2c7..21fcf5102f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2164,11 +2164,8 @@ void qmp_migrate_recover(const char *uri, Error **errp)
         return;
     }
 
-    if (qatomic_cmpxchg(&mis->postcopy_recover_triggered,
-                       false, true) == true) {
-        error_setg(errp, "Migrate recovery is triggered already");
-        return;
-    }
+    /* If there's an existing transport, release it */
+    migration_incoming_transport_cleanup(mis);
 
     /*
      * Note that this call will never start a real migration; it will
@@ -2176,12 +2173,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * to continue using that newly established channel.
      */
     qemu_start_incoming_migration(uri, errp);
-
-    /* Safe to dereference with the assert above */
-    if (*errp) {
-        /* Reset the flag so user could still retry */
-        qatomic_set(&mis->postcopy_recover_triggered, false);
-    }
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index f17ccc657c..a863032b71 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -139,7 +139,6 @@ struct MigrationIncomingState {
     struct PostcopyBlocktimeContext *blocktime_ctx;
 
     /* notify PAUSED postcopy incoming migrations to try to continue */
-    bool postcopy_recover_triggered;
     QemuSemaphore postcopy_pause_sem_dst;
     QemuSemaphore postcopy_pause_sem_fault;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 02ed94c180..d9076897b8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2589,9 +2589,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
 
     assert(migrate_postcopy_ram());
 
-    /* Clear the triggered bit to allow one recovery */
-    mis->postcopy_recover_triggered = false;
-
     /*
      * Unregister yank with either from/to src would work, since ioc behind it
      * is the same
-- 
2.32.0


