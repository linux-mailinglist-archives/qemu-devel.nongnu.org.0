Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8E41FC0F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:08:01 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWekC-0004Ne-Hi
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeX5-0001t5-7X
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeX3-0000tK-GH
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4z6jUCebNJqEmNFJ/VStW7BTMEQNitBNtR46XouroI=;
 b=Fgg2WK/FoaEoFd1NraXoeMRhu0Ejvk+ZO18gpE195cVEbiWHmARp3Uq8HKHE8OdlUlC57w
 6f3R+TFJOgDiaojdEuLwOWj8r/n4wsZyI3erDBOB4f4EyFTp4zHiIpvMJnjDqsnlxok1kp
 iLtWb7iQ8gdu/2kxEm+AHe5cXpEK0IU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-mD1qi1iRPU2aDX5G65UJoA-1; Sat, 02 Oct 2021 08:54:24 -0400
X-MC-Unique: mD1qi1iRPU2aDX5G65UJoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u3-20020a7bcb03000000b0030d5228cbbdso2088953wmj.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4z6jUCebNJqEmNFJ/VStW7BTMEQNitBNtR46XouroI=;
 b=CjjmkInaFB5ka24+/mWRnv5BR9a9O9Ho0wFqqq7sbLabTIz3rMrlUZWDtR3bTnT/bP
 IWYxWxrPFUYeTxkbS49ndeSJyxl77HBMqp94fMtDFWxnzrlKcUb5JAp0wSu+gLG16kSJ
 Nqyp1+3eM5hd+itQ2E3HfcT+FGKHtmeQh4ypcMGccGiA2T1yHP4wKIAjhdNaUVz3lgAj
 bzJIJ4lMBZAlMIUu5k5H2UuUhf/j3eBZ4Bdx5OrtnZSbgxhEPNihxuc1VAnzmDflmjOR
 ZDc1RjSlKzYbcUjwgCvk/bFmvXMYFzVb5hIww4keC3rm5FDvoIhs1v/C5TlrUHCk7KQD
 5q9Q==
X-Gm-Message-State: AOAM532MujfsMasJbGU5CTIx359dIvvwaWKHM20CZu3mgMW4tBnK/xFc
 pLlhP4a5RjLRLUJ3+c8joIlSYy7nZzKblL0LM84qmg0lYXvdO4/uSJLvCqhoRW1CU2Lo7WKzoNn
 IW5+YF2DP2+NepL0ta2WYKTUpboDjuiVq4xyIYlEsm/qWPISyZhDBEq6oMzRe8XoM
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr3376275wry.292.1633179262714; 
 Sat, 02 Oct 2021 05:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPg2SUP1KRqKQDM976J1UW+bK/dVfMUDIEqkBzFMQ49KQqAlYHTXe/I8QRvH6n2Zfw+A1FBw==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr3376245wry.292.1633179262453; 
 Sat, 02 Oct 2021 05:54:22 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o19sm9025753wrg.60.2021.10.02.05.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/22] target/i386/sev: Move
 qmp_query_sev_attestation_report() to sev.c
Date: Sat,  2 Oct 2021 14:53:09 +0200
Message-Id: <20211002125317.3418648-15-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_attestation_report() from monitor.c to sev.c
and make sev_get_attestation_report() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        |  2 --
 target/i386/monitor.c         |  6 ------
 target/i386/sev-sysemu-stub.c |  7 ++++---
 target/i386/sev.c             | 12 ++++++++++--
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 2d9a1a0112e..5f367f78eb7 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -27,8 +27,6 @@
 extern SevInfo *sev_get_info(void);
 extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
-extern SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index a9f85acd473..c05d70252a2 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -764,12 +764,6 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
 
-SevAttestationReport *
-qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
-{
-    return sev_get_attestation_report(mnonce, errp);
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index d556b4f091f..813b9a6a03b 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev_i386.h"
 
@@ -52,9 +53,9 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     g_assert_not_reached();
 }
 
-SevAttestationReport *sev_get_attestation_report(const char *mnonce,
-                                                 Error **errp)
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
+                                                       Error **errp)
 {
-    error_setg(errp, "SEV is not available in this QEMU");
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index aefbef4bb63..91a217bbb85 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -31,6 +31,8 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/i386/pc.h"
 
@@ -487,8 +489,8 @@ out:
     return cap;
 }
 
-SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp)
+static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
+                                                        Error **errp)
 {
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
@@ -549,6 +551,12 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     return report;
 }
 
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
+                                                       Error **errp)
+{
+    return sev_get_attestation_report(mnonce, errp);
+}
+
 static int
 sev_read_file_base64(const char *filename, guchar **data, gsize *len)
 {
-- 
2.31.1


