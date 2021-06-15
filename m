Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132BF3A8828
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:57:18 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDJN-0003xJ-2Y
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltDHi-0001x7-DJ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltDHe-0004Ea-5B
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623779728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+7lR4ZSOE1bgIfWEFQD9lnw+uneTSFqnuyVWt7WOzk=;
 b=SHgrV8SDVmsofQck86fHBly+MW/ApMsehMvDhsA9KhPfD2s9JFJzo5XMZVpKoGH3VQuO1x
 jJYhFHn2x/+YV/nqUagEr6cOQb7PJ8K6R/BB2LptwI3mgXWYJ7GUejGX6qoj9oYZ/QoJz4
 EHzOWFucXcUZC6jALrr1Pg8hxr0hNt8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-kwclb1_sO1GErEfZG1-BQA-1; Tue, 15 Jun 2021 13:55:28 -0400
X-MC-Unique: kwclb1_sO1GErEfZG1-BQA-1
Received: by mail-qt1-f200.google.com with SMTP id
 a5-20020ac84d850000b029024998e61d00so9886337qtw.14
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+7lR4ZSOE1bgIfWEFQD9lnw+uneTSFqnuyVWt7WOzk=;
 b=AMSYxtgWK98ufd6ItDUHEzOSYwLjr5osEw4pmmMH2DZ1BKVvq2YrB9rdbZk3CXMUdG
 7BDA9DyeqnmYIAzu0X0U57mdbm98BPzgvDdE7R1RFf6CfqOZ7eRbBMHeL9w8TEwg7prm
 +QLbfpXo3odqzOvDtL1njo3IIFVu8OP2/rasVwOTrsiLNIi6q/Sjcndf6m3tnEnCBeW4
 wGDP2f/bTR6NlhFF7AposRNRj2uG4HCEzzSbUbZU17lgPyZLu2qO88JwPCVpQuR8YdIg
 oiNXlY/3l8ZdgnvtX+ymPTiJOEkoGT/LhrnWLk3FFHs8v761ETWmVAFCKw1nmUilZaEr
 QKIg==
X-Gm-Message-State: AOAM531kL570ZWVuJXLCNn4oAJGJZBMzeyVolvOJVO6rJyvMD3nFUXyX
 Ue/R8WF4rdTQwFegP4XplEm8mT6VqN12CX3wfMM/UzsPSGGk1Bl6cwGd3ByUiPwd89lHcKWT2h1
 OiRyCzaUsNnEBYyUZ7j21LaYTNBaccpniqNvpjlQm/1fSJdWnMrl9M6vdcKfLhKHP
X-Received: by 2002:a05:620a:1424:: with SMTP id
 k4mr829050qkj.299.1623779727148; 
 Tue, 15 Jun 2021 10:55:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDTBFNB9KiIz1+rq4CApddBBAcLdmQN/DeB9jATEgq92oCxMmqAit/JPsYB+8li2K3G5D5RA==
X-Received: by 2002:a05:620a:1424:: with SMTP id
 k4mr829020qkj.299.1623779726888; 
 Tue, 15 Jun 2021 10:55:26 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d81sm12908578qke.32.2021.06.15.10.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:55:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] tests: migration-test: Still run the rest even if uffd
 missing
Date: Tue, 15 Jun 2021 13:55:22 -0400
Message-Id: <20210615175523.439830-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615175523.439830-1-peterx@redhat.com>
References: <20210615175523.439830-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we'll skip the whole migration-test if uffd missing.

It's a bit harsh - we can still run the rest besides postcopy!  Enable them
when we still can.

It'll happen more frequently now after kernel UFFD_USER_MODE_ONLY introduced in
commit 37cd0575b8510159, as qemu test normally requires kernel faults.  One
alternative is we disable kvm and create the uffd with UFFD_USER_MODE_ONLY for
all postcopy tests, however to be simple for now just skip postcopy tests only
by default.  If we wanna run them use "sudo" or root, they'll still work.  In
all cases, it's still better than running nothing for migration-test.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2b028df6875..d9225f58d4d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1376,10 +1376,6 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-    if (!ufd_version_check()) {
-        return g_test_run();
-    }
-
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
@@ -1416,8 +1412,11 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    if (ufd_version_check()) {
+        qtest_add_func("/migration/postcopy/unix", test_postcopy);
+        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    }
+
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix", test_precopy_unix);
     qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
-- 
2.31.1


