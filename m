Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A64ECF31
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:55:00 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgHL-0001HH-Mh
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:54:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2R-00066L-3u
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2P-0005IW-Df
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7cg24gbIDVfatkh+h2kS8W8/k5egsPyKjSZg4lvrLM=;
 b=igBMZXrMkGL/gFQtXoF2Nln6M9uHuNWa0IQR0SQQhyRjQFpt+oEESqBvVCZaQ6f30D2OlS
 dsi9Hd6yzE3gA6I8fwBqHKCZX65z7u5lcCw10vaffqpFgqkap3evmQXmQNybk0rLdOubuN
 Y3bog6BaC/Ts6OIp7Wl5oikgQU9gCJM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-Uuh_OBMWM3GgfI7QyH1fRg-1; Wed, 30 Mar 2022 17:39:30 -0400
X-MC-Unique: Uuh_OBMWM3GgfI7QyH1fRg-1
Received: by mail-qt1-f197.google.com with SMTP id
 a24-20020ac81098000000b002e1e06a72aeso18444470qtj.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7cg24gbIDVfatkh+h2kS8W8/k5egsPyKjSZg4lvrLM=;
 b=uM97W3qHJkbxxASbKy37UxIgHjBzDQs5J+UbMkxpoBzW3UeYUzGhOEPECjxteP0HyA
 mFqI/xBwVPp4w+BDARlU19JV7tLwf00RSRcjS5hyQs4bNeW4WPqdOkC9Ar4b1CKwmqi0
 bKgDTVyyKEHx/Z+glBXLc1Tp+SNpp83xlf/k75rZ38EKrHqOuoVfvpZEVzWe3YdfRJaH
 6L5/AEIxFGRM1GeZKf28PD8GsVpcgb4fhEd2AF5z3q/ghzKOLIDuS1Ex99NNiPHnRdyT
 2UbJfP19c7iG5aHdXdn8jE5zjnIsLmEdPrVjroe5jEaqcVXKPoBoahbrlBFCCxhXqBVF
 /RsQ==
X-Gm-Message-State: AOAM533fgm1Ujqi9cQsPyOvKyCquJARKRFboquRcvtLV7xljJp3FqQ8d
 HAur/xovAr3HUfJRkxS9+m2FppJcinHgw4MfdONY2efjFcI8EJzaXZaLIjcVYE26JuJlipQlzRH
 LTOylRDwn3MeD5z3yxyqynVRqbO0v3JHTl5aFjBzaeUJ7Lid5Lyh6sijKW+IV1Rs1
X-Received: by 2002:ae9:e852:0:b0:67d:36cd:98dc with SMTP id
 a79-20020ae9e852000000b0067d36cd98dcmr1306626qkg.296.1648676369593; 
 Wed, 30 Mar 2022 14:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3kb774FkvJNvjaslMtFHPeWLTPMzYykDM5YUzozdfqjOjPj5z/FTIQk4GAj83kbK2XQnsgg==
X-Received: by 2002:ae9:e852:0:b0:67d:36cd:98dc with SMTP id
 a79-20020ae9e852000000b0067d36cd98dcmr1306602qkg.296.1648676369286; 
 Wed, 30 Mar 2022 14:39:29 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:29 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/19] tests: Add postcopy tls recovery migration test
Date: Wed, 30 Mar 2022 17:39:07 -0400
Message-Id: <20220330213908.26608-19-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's easy to build this upon the postcopy tls test.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 80c4244871..7288c64e97 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1058,15 +1058,15 @@ static void test_postcopy_tls(void)
     test_postcopy_common(&args);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateStart *args)
 {
-    MigrateStart args = {
-        .hide_stderr = true,
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1117,7 +1117,21 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateStart args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls(void)
+{
+    MigrateStart args = { .postcopy_tls = true };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2164,6 +2178,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
+    qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);
 #endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
-- 
2.32.0


