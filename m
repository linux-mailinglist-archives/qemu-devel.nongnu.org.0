Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C203AA160
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:33:22 +0200 (CEST)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYTh-0005hd-Ht
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJS-0000qn-T1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJP-0002BK-V5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUQdFiF4I9usEoqcWuw9jovz2j6QkV4ypfDpy+yQNBk=;
 b=RmsGY+/pBsau6FlogKjoYzJxKLQ5T6w4s4XkXhstsVQMDJEjrLApLx1GVrYhKapZ+3ECCT
 eour5VWLHCgbL8PYShbmy3OuEYO26nwYqYJzhOovuJLfE8LjpBXjcgzGDBposvLOi/OC3c
 10HpSRr7gjWWEZKSGtpYxO8/fV0yD0c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-alCKvH-DMSKkO4aV832LYA-1; Wed, 16 Jun 2021 12:22:36 -0400
X-MC-Unique: alCKvH-DMSKkO4aV832LYA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020a5d61820000b029011a6a8149b5so1064383wru.14
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUQdFiF4I9usEoqcWuw9jovz2j6QkV4ypfDpy+yQNBk=;
 b=T021SwoA064eHrIzelfPyjkslfv1sS51yOEQaigm2pSgMd2Ftuibc0nTNCaxTrlmQ2
 bppn6uA0UBFOsqMbxAP7qJf0s0GQrzAaZ0LdIZ02J22c8J1xvzmEO/xe38LXQef9rKdD
 5cwy70bpRfJb5FGTv4biOdWks8WRSz6qXU6QtCjArADStQ1oDPZZ8JP9KDXK2F1qfocQ
 NDcWQ2eVYq5rYbmPlPZ8WKFsq7V1wybe/gfriLGGEb6M4vTvvLrzFgAaWV8ENJLWouMe
 RQpKkazPRXv9CBg3jme2o5RYNC+R4KQKbkXCGtF1nLRaeOnDrpqhw0+RGcxldtPtHHOC
 38gg==
X-Gm-Message-State: AOAM533fyGeP0f1jrAbBoiBuAkxVZFqjCUrKty6zBn6sxh/5WNEd8rR5
 in2EpOwfc66KdQdTh9kDXDOxHLWWJO+RWslDFB85p7fJTZ/YwCHCOEYg8s3g0LNvC4cbft3abTi
 YFdi/P1GArOKwc7ifFmrEJFwy/Wn6nnaYkz8FKfRNMilWfw4LQi9NmoVBWLJ/6JfF
X-Received: by 2002:adf:a284:: with SMTP id s4mr225641wra.397.1623860555433;
 Wed, 16 Jun 2021 09:22:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzerqdDFU+hrqhimAnDSgDiDsfgbQps0VofL3pbs+7SiCYB6M5sh6Z0xAMETkiwiKp9ceV3bA==
X-Received: by 2002:adf:a284:: with SMTP id s4mr225615wra.397.1623860555199;
 Wed, 16 Jun 2021 09:22:35 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p11sm2597966wrx.85.2021.06.16.09.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Wed, 16 Jun 2021 18:22:20 +0200
Message-Id: <20210616162225.2517463-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616162225.2517463-1-philmd@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nbd.c    | 6 +++---
 blockdev-nbd.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 616f9ae6c4d..b13a33c3d21 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2159,9 +2159,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a client endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b264620b98d..bdfa7ed3a5a 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -108,9 +108,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a server endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
-- 
2.31.1


