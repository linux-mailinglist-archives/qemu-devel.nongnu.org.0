Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6F50ECC8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:46:02 +0200 (CEST)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8P3-00076R-BI
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8ID-0006rH-OP
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IB-0007hm-GO
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4IWpV0bLKv2V8Tzv3MqkG3QZdqlBVwJmDqV3FtfObSI=;
 b=PE0qQdP8IYO3IvG2H0Hxi6u4h6ltuLVUvUwEoVqYaTkbdEc/oSSZq6wH1G70p3SpmdQtyL
 Y7JtAfQqsTwnGGjOyFV51TqmiAldor/2P7dkaPgeQ5l168JFazwN8e9yoEEzMWZf7HND4T
 nihC8azZ+IBrkDlfO2kKyAZBEXYtk+U=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-bIsJXW0sPEifw9C8oOi2fw-1; Mon, 25 Apr 2022 19:38:51 -0400
X-MC-Unique: bIsJXW0sPEifw9C8oOi2fw-1
Received: by mail-io1-f70.google.com with SMTP id
 t1-20020a056602140100b0065393cc1dc3so12552290iov.5
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IWpV0bLKv2V8Tzv3MqkG3QZdqlBVwJmDqV3FtfObSI=;
 b=2MjwRC3QAzdj6LtOO0AVraJDG0uAiGxxhE3gSts+58FHVnr+GoCR7GK6i1oNYFAIbQ
 /v/xBeTlgh0DzvQmc6ohgqMcnYDxwA4X30AMhirJA/TZ4wDQTzemavf0yW/+5Zfv8MuX
 Eb3s2l98ByGevTQknTRuWFNDlCE0JDnOx1DD2IGVUooHavnD/spS/tMACr18EE6hkBUM
 GzfaWo4GWhpaQT4I+syUciTZPDqhh7pa3oc0epEzwBuTl/9bZXQRzVeo/YsaK1h1MfGH
 SHL/dfmNFuipcHtwVI506/CoOps4dMBRs+5BTDOfmsjwlEsS8WCr7ytxdwmm8rGG4EEH
 vN2A==
X-Gm-Message-State: AOAM5311u1zvav3O+d4HqQWSGNNToQ0Yp3y68bJ+85NsoOJJtD8oG7if
 9+7Lb2M3x3TDWM0ifJCPH8MC4EW/Bw3B1hjRiLpJnNuiyMlAxF+T1x4TI9a5KhT0doo/ahOlqG6
 8Qe6iDvxhFNyiJUMkRAqnlQXzDu7RKs8qg7yc6wJxx8PE5eua/wmnARCnActFIHPc
X-Received: by 2002:a05:6638:3183:b0:32a:7cb1:a13 with SMTP id
 z3-20020a056638318300b0032a7cb10a13mr8505242jak.89.1650929931104; 
 Mon, 25 Apr 2022 16:38:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5ZAyHNGRimpeJvvw3JxiloGQipHpae1uS+K5wLvMmpeX9GYf5Whcy+3+g/g8mTScOzIXsvQ==
X-Received: by 2002:a05:6638:3183:b0:32a:7cb1:a13 with SMTP id
 z3-20020a056638318300b0032a7cb10a13mr8505228jak.89.1650929930771; 
 Mon, 25 Apr 2022 16:38:50 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:50 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/21] tests: fix encoding of IP addresses in x509 certs
Date: Mon, 25 Apr 2022 19:38:27 -0400
Message-Id: <20220425233847.10393-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

We need to encode just the address bytes, not the whole struct sockaddr
data. Add a test case to validate that we're matching on SAN IP
addresses correctly.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/crypto-tls-x509-helpers.c | 16 +++++++++++++---
 tests/unit/test-crypto-tlssession.c  | 11 +++++++++--
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/tests/unit/crypto-tls-x509-helpers.c b/tests/unit/crypto-tls-x509-helpers.c
index fc609b3fd4..e9937f60d8 100644
--- a/tests/unit/crypto-tls-x509-helpers.c
+++ b/tests/unit/crypto-tls-x509-helpers.c
@@ -168,9 +168,19 @@ test_tls_get_ipaddr(const char *addrstr,
     hints.ai_flags = AI_NUMERICHOST;
     g_assert(getaddrinfo(addrstr, NULL, &hints, &res) == 0);
 
-    *datalen = res->ai_addrlen;
-    *data = g_new(char, *datalen);
-    memcpy(*data, res->ai_addr, *datalen);
+    if (res->ai_family == AF_INET) {
+        struct sockaddr_in *in = (struct sockaddr_in *)res->ai_addr;
+        *datalen = sizeof(in->sin_addr);
+        *data = g_new(char, *datalen);
+        memcpy(*data, &in->sin_addr, *datalen);
+    } else if (res->ai_family == AF_INET6) {
+        struct sockaddr_in6 *in = (struct sockaddr_in6 *)res->ai_addr;
+        *datalen = sizeof(in->sin6_addr);
+        *data = g_new(char, *datalen);
+        memcpy(*data, &in->sin6_addr, *datalen);
+    } else {
+        g_assert_not_reached();
+    }
     freeaddrinfo(res);
 }
 
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index 5f0da9192c..a6935d8497 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -512,12 +512,19 @@ int main(int argc, char **argv)
                   false, true, "wiki.qemu.org", NULL);
 
     TEST_SESS_REG(altname4, cacertreq.filename,
+                  servercertalt1req.filename, clientcertreq.filename,
+                  false, false, "192.168.122.1", NULL);
+    TEST_SESS_REG(altname5, cacertreq.filename,
+                  servercertalt1req.filename, clientcertreq.filename,
+                  false, false, "fec0::dead:beaf", NULL);
+
+    TEST_SESS_REG(altname6, cacertreq.filename,
                   servercertalt2req.filename, clientcertreq.filename,
                   false, true, "qemu.org", NULL);
-    TEST_SESS_REG(altname5, cacertreq.filename,
+    TEST_SESS_REG(altname7, cacertreq.filename,
                   servercertalt2req.filename, clientcertreq.filename,
                   false, false, "www.qemu.org", NULL);
-    TEST_SESS_REG(altname6, cacertreq.filename,
+    TEST_SESS_REG(altname8, cacertreq.filename,
                   servercertalt2req.filename, clientcertreq.filename,
                   false, false, "wiki.qemu.org", NULL);
 
-- 
2.32.0


