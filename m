Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274B1F94AD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 12:37:13 +0200 (CEST)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkmUK-0000To-0v
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 06:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jkmSr-0007X3-5I
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:35:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34393
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jkmSo-0007Gv-JU
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592217337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2//2J4H18E/Fi9e7Kie/K1mKXAE8svQXRc0XTzmRGE=;
 b=PZKjiRNTuwjBCZQcmDrLv8XshcT5bnnaeeaTsH1KOd6etCe8VLfQukgNw0fPe4tLv+ugZh
 ahFQeH9fMjV+yeFUGo/Z6limb7YBelr3wBF9XWEcVMyKDNSgPrHTezIx+dBKULVpTDEt42
 IKA2Xwx5erx2IT2wo/1Ug6xzNpmWEZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-FEsw12HoPbaY3v-HebGhWw-1; Mon, 15 Jun 2020 06:35:32 -0400
X-MC-Unique: FEsw12HoPbaY3v-HebGhWw-1
Received: by mail-wm1-f72.google.com with SMTP id b63so5895916wme.1
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 03:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P2//2J4H18E/Fi9e7Kie/K1mKXAE8svQXRc0XTzmRGE=;
 b=XMAEjO/mw4HXSriAHxEpMwq1Vyqm7ICldLmSWQEozRm0PqmMqYEmcmAbMg8Xy/49Gy
 0hGHAny4xXWwhhcJTnMKqgrl6UoNKTkafl0991o7KrNGthi4PKHM5QfQKxAR1b7cTt2h
 jhUM3wKSkG/GFoXvbZ235eqtnzU9BCmrtD3c1id+5Q0V8Zx+ej+NVumvr5LK7vvubb4R
 sNa/xOkJtgtrO6OcG5EumJRQl+nG6D5kPESQ4GzexcXdTgmBgnBqP8u2gCBp0DljT2PY
 sMIo7jw8eRW2CmThz/S3yjIGUdlG2aRwfoQkwX+WQ1SkCc9kb5B0DCXcjowjsln7UR5v
 oreA==
X-Gm-Message-State: AOAM531tAA99gIS9pLROPvJ5TnQGYBfOue/Qrpe/fjq2qMWwdEZdEeW7
 U4XmU9QwbNCBQOXv22+2LkwC20w2XAfIj3NGBxbTEfGv1PesfYy71R304kq2woMHiCF6mkcVt9m
 UsBFdghRdmFvgVnA=
X-Received: by 2002:adf:edc8:: with SMTP id v8mr27136185wro.176.1592217330437; 
 Mon, 15 Jun 2020 03:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9xrdM2nDQpdmaxcd96et9ePkx1P+V6+Vkg+F8tyjz1eZVMGSI97gDbnHT/ErJEg88VB9Xwg==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr27136150wro.176.1592217329951; 
 Mon, 15 Jun 2020 03:35:29 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id d191sm22637198wmd.44.2020.06.15.03.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 03:35:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v9 4/5] crypto: Add tls-cipher-suites object
Date: Mon, 15 Jun 2020 12:34:56 +0200
Message-Id: <20200615103457.25282-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200615103457.25282-1-philmd@redhat.com>
References: <20200615103457.25282-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:43:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the host OS, various aspects of TLS operation are configurable.
In particular it is possible for the sysadmin to control the TLS
cipher/protocol algorithms that applications are permitted to use.

* Any given crypto library has a built-in default priority list
  defined by the distro maintainer of the library package (or by
  upstream).

* The "crypto-policies" RPM (or equivalent host OS package)
  provides a config file such as "/etc/crypto-policies/config",
  where the sysadmin can set a high level (library-independent)
  policy.

  The "update-crypto-policies --set" command (or equivalent) is
  used to translate the global policy to individual library
  representations, producing files such as
  "/etc/crypto-policies/back-ends/*.config". The generated files,
  if present, are loaded by the various crypto libraries to
  override their own built-in defaults.

  For example, the GNUTLS library may read
  "/etc/crypto-policies/back-ends/gnutls.config".

* A management application (or the QEMU user) may overide the
  system-wide crypto-policies config via their own config, if
  they need to diverge from the former.

Thus the priority order is "QEMU user config" > "crypto-policies
system config" > "library built-in config".

Introduce the "tls-cipher-suites" object for exposing the ordered
list of permitted TLS cipher suites from the host side to the
guest firmware, via fw_cfg. The list is represented as an array
of IANA_TLS_CIPHER objects. The firmware uses the IANA_TLS_CIPHER
array for configuring guest-side TLS, for example in UEFI HTTPS
Boot.

The priority at which the host-side policy is retrieved is given
by the "priority" property of the new object type. For example,
"priority=@SYSTEM" may be used to refer to
"/etc/crypto-policies/back-ends/gnutls.config" (given that QEMU
uses GNUTLS).

[Description from Daniel P. Berrangé, edited by Laszlo Ersek.]

Example of use to dump the cipher suites:

  $ qemu-system-x86_64 -S \
    -object tls-cipher-suites,id=mysuite,priority=@SYSTEM \
    -trace qcrypto\*
  1590664444.197123:qcrypto_tls_cipher_suite_priority priority: @SYSTEM
  1590664444.197219:qcrypto_tls_cipher_suite_info data=[0x13,0x02] version=TLS1.3 name=TLS_AES_256_GCM_SHA384
  1590664444.197228:qcrypto_tls_cipher_suite_info data=[0x13,0x03] version=TLS1.3 name=TLS_CHACHA20_POLY1305_SHA256
  1590664444.197233:qcrypto_tls_cipher_suite_info data=[0x13,0x01] version=TLS1.3 name=TLS_AES_128_GCM_SHA256
  1590664444.197236:qcrypto_tls_cipher_suite_info data=[0x13,0x04] version=TLS1.3 name=TLS_AES_128_CCM_SHA256
  1590664444.197240:qcrypto_tls_cipher_suite_info data=[0xc0,0x30] version=TLS1.2 name=TLS_ECDHE_RSA_AES_256_GCM_SHA384
  1590664444.197245:qcrypto_tls_cipher_suite_info data=[0xcc,0xa8] version=TLS1.2 name=TLS_ECDHE_RSA_CHACHA20_POLY1305
  1590664444.197250:qcrypto_tls_cipher_suite_info data=[0xc0,0x14] version=TLS1.0 name=TLS_ECDHE_RSA_AES_256_CBC_SHA1
  1590664444.197254:qcrypto_tls_cipher_suite_info data=[0xc0,0x2f] version=TLS1.2 name=TLS_ECDHE_RSA_AES_128_GCM_SHA256
  1590664444.197258:qcrypto_tls_cipher_suite_info data=[0xc0,0x13] version=TLS1.0 name=TLS_ECDHE_RSA_AES_128_CBC_SHA1
  1590664444.197261:qcrypto_tls_cipher_suite_info data=[0xc0,0x2c] version=TLS1.2 name=TLS_ECDHE_ECDSA_AES_256_GCM_SHA384
  1590664444.197266:qcrypto_tls_cipher_suite_info data=[0xcc,0xa9] version=TLS1.2 name=TLS_ECDHE_ECDSA_CHACHA20_POLY1305
  1590664444.197270:qcrypto_tls_cipher_suite_info data=[0xc0,0xad] version=TLS1.2 name=TLS_ECDHE_ECDSA_AES_256_CCM
  1590664444.197274:qcrypto_tls_cipher_suite_info data=[0xc0,0x0a] version=TLS1.0 name=TLS_ECDHE_ECDSA_AES_256_CBC_SHA1
  1590664444.197278:qcrypto_tls_cipher_suite_info data=[0xc0,0x2b] version=TLS1.2 name=TLS_ECDHE_ECDSA_AES_128_GCM_SHA256
  1590664444.197283:qcrypto_tls_cipher_suite_info data=[0xc0,0xac] version=TLS1.2 name=TLS_ECDHE_ECDSA_AES_128_CCM
  1590664444.197287:qcrypto_tls_cipher_suite_info data=[0xc0,0x09] version=TLS1.0 name=TLS_ECDHE_ECDSA_AES_128_CBC_SHA1
  1590664444.197291:qcrypto_tls_cipher_suite_info data=[0x00,0x9d] version=TLS1.2 name=TLS_RSA_AES_256_GCM_SHA384
  1590664444.197296:qcrypto_tls_cipher_suite_info data=[0xc0,0x9d] version=TLS1.2 name=TLS_RSA_AES_256_CCM
  1590664444.197300:qcrypto_tls_cipher_suite_info data=[0x00,0x35] version=TLS1.0 name=TLS_RSA_AES_256_CBC_SHA1
  1590664444.197304:qcrypto_tls_cipher_suite_info data=[0x00,0x9c] version=TLS1.2 name=TLS_RSA_AES_128_GCM_SHA256
  1590664444.197308:qcrypto_tls_cipher_suite_info data=[0xc0,0x9c] version=TLS1.2 name=TLS_RSA_AES_128_CCM
  1590664444.197312:qcrypto_tls_cipher_suite_info data=[0x00,0x2f] version=TLS1.0 name=TLS_RSA_AES_128_CBC_SHA1
  1590664444.197316:qcrypto_tls_cipher_suite_info data=[0x00,0x9f] version=TLS1.2 name=TLS_DHE_RSA_AES_256_GCM_SHA384
  1590664444.197320:qcrypto_tls_cipher_suite_info data=[0xcc,0xaa] version=TLS1.2 name=TLS_DHE_RSA_CHACHA20_POLY1305
  1590664444.197325:qcrypto_tls_cipher_suite_info data=[0xc0,0x9f] version=TLS1.2 name=TLS_DHE_RSA_AES_256_CCM
  1590664444.197329:qcrypto_tls_cipher_suite_info data=[0x00,0x39] version=TLS1.0 name=TLS_DHE_RSA_AES_256_CBC_SHA1
  1590664444.197333:qcrypto_tls_cipher_suite_info data=[0x00,0x9e] version=TLS1.2 name=TLS_DHE_RSA_AES_128_GCM_SHA256
  1590664444.197337:qcrypto_tls_cipher_suite_info data=[0xc0,0x9e] version=TLS1.2 name=TLS_DHE_RSA_AES_128_CCM
  1590664444.197341:qcrypto_tls_cipher_suite_info data=[0x00,0x33] version=TLS1.0 name=TLS_DHE_RSA_AES_128_CBC_SHA1
  1590664444.197345:qcrypto_tls_cipher_suite_count count: 29

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v9: Replaced 'backends' -> 'frontends' (lersek)
---
 include/crypto/tls-cipher-suites.h |  38 +++++++++
 crypto/tls-cipher-suites.c         | 127 +++++++++++++++++++++++++++++
 crypto/Makefile.objs               |   1 +
 crypto/trace-events                |   5 ++
 qemu-options.hx                    |  19 +++++
 5 files changed, 190 insertions(+)
 create mode 100644 include/crypto/tls-cipher-suites.h
 create mode 100644 crypto/tls-cipher-suites.c

diff --git a/include/crypto/tls-cipher-suites.h b/include/crypto/tls-cipher-suites.h
new file mode 100644
index 0000000000..3848393a20
--- /dev/null
+++ b/include/crypto/tls-cipher-suites.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU TLS Cipher Suites Registry (RFC8447)
+ *
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * Author: Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QCRYPTO_TLSCIPHERSUITES_H
+#define QCRYPTO_TLSCIPHERSUITES_H
+
+#include "qom/object.h"
+#include "crypto/tlscreds.h"
+
+#define TYPE_QCRYPTO_TLS_CIPHER_SUITES "tls-cipher-suites"
+#define QCRYPTO_TLS_CIPHER_SUITES(obj) \
+    OBJECT_CHECK(QCryptoTLSCipherSuites, (obj), TYPE_QCRYPTO_TLS_CIPHER_SUITES)
+
+/*
+ * IANA registered TLS ciphers:
+ * https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#tls-parameters-4
+ */
+typedef struct {
+    uint8_t data[2];
+} QEMU_PACKED IANA_TLS_CIPHER;
+
+typedef struct QCryptoTLSCipherSuites {
+    /* <private> */
+    QCryptoTLSCreds parent_obj;
+
+    /* <public> */
+    IANA_TLS_CIPHER *cipher_list;
+    unsigned cipher_count;
+} QCryptoTLSCipherSuites;
+
+#endif /* QCRYPTO_TLSCIPHERSUITES_H */
diff --git a/crypto/tls-cipher-suites.c b/crypto/tls-cipher-suites.c
new file mode 100644
index 0000000000..f02a041f9a
--- /dev/null
+++ b/crypto/tls-cipher-suites.c
@@ -0,0 +1,127 @@
+/*
+ * QEMU TLS Cipher Suites
+ *
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * Author: Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "crypto/tlscreds.h"
+#include "crypto/tls-cipher-suites.h"
+#include "trace.h"
+
+static void parse_cipher_suites(QCryptoTLSCipherSuites *s,
+                                const char *priority_name, Error **errp)
+{
+    int ret;
+    const char *err;
+    gnutls_priority_t pcache;
+    enum { M_ENUMERATE, M_GENERATE, M_DONE } mode;
+
+    assert(priority_name);
+    trace_qcrypto_tls_cipher_suite_priority(priority_name);
+    ret = gnutls_priority_init(&pcache, priority_name, &err);
+    if (ret < 0) {
+        error_setg(errp, "Syntax error using priority '%s': %s",
+                   priority_name, gnutls_strerror(ret));
+        return;
+    }
+
+    for (mode = M_ENUMERATE; mode < M_DONE; mode++) {
+        size_t i;
+
+        for (i = 0;; i++) {
+            int ret;
+            unsigned idx;
+            const char *name;
+            IANA_TLS_CIPHER cipher;
+            gnutls_protocol_t protocol;
+
+            ret = gnutls_priority_get_cipher_suite_index(pcache, i, &idx);
+            if (ret == GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
+                break;
+            }
+            if (ret == GNUTLS_E_UNKNOWN_CIPHER_SUITE) {
+                continue;
+            }
+
+            name = gnutls_cipher_suite_info(idx, (unsigned char *)&cipher,
+                                            NULL, NULL, NULL, &protocol);
+            if (name == NULL) {
+                continue;
+            }
+
+            if (mode == M_GENERATE) {
+                const char *version;
+
+                version = gnutls_protocol_get_name(protocol);
+                trace_qcrypto_tls_cipher_suite_info(cipher.data[0],
+                                                    cipher.data[1],
+                                                    version, name);
+                s->cipher_list[s->cipher_count] = cipher;
+            }
+            s->cipher_count++;
+        }
+
+        if (mode == M_ENUMERATE) {
+            if (s->cipher_count == 0) {
+                break;
+            }
+            s->cipher_list = g_new(IANA_TLS_CIPHER, s->cipher_count);
+            s->cipher_count = 0;
+        }
+    }
+    trace_qcrypto_tls_cipher_suite_count(s->cipher_count);
+    gnutls_priority_deinit(pcache);
+}
+
+static void qcrypto_tls_cipher_suites_complete(UserCreatable *uc, Error **errp)
+{
+    QCryptoTLSCreds *s = QCRYPTO_TLS_CREDS(uc);
+
+    if (!s->priority) {
+        error_setg(errp, "'priority' property is not set");
+        return;
+    }
+    parse_cipher_suites(QCRYPTO_TLS_CIPHER_SUITES(s), s->priority, errp);
+}
+
+static void qcrypto_tls_cipher_suites_finalize(Object *obj)
+{
+    QCryptoTLSCipherSuites *s = QCRYPTO_TLS_CIPHER_SUITES(obj);
+
+    g_free(s->cipher_list);
+}
+
+static void qcrypto_tls_cipher_suites_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = qcrypto_tls_cipher_suites_complete;
+}
+
+static const TypeInfo qcrypto_tls_cipher_suites_info = {
+    .parent = TYPE_QCRYPTO_TLS_CREDS,
+    .name = TYPE_QCRYPTO_TLS_CIPHER_SUITES,
+    .instance_size = sizeof(QCryptoTLSCipherSuites),
+    .instance_finalize = qcrypto_tls_cipher_suites_finalize,
+    .class_size = sizeof(QCryptoTLSCredsClass),
+    .class_init = qcrypto_tls_cipher_suites_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void qcrypto_tls_cipher_suites_register_types(void)
+{
+    type_register_static(&qcrypto_tls_cipher_suites_info);
+}
+
+type_init(qcrypto_tls_cipher_suites_register_types);
diff --git a/crypto/Makefile.objs b/crypto/Makefile.objs
index c2a371b0b4..1c1b5e21ff 100644
--- a/crypto/Makefile.objs
+++ b/crypto/Makefile.objs
@@ -13,6 +13,7 @@ crypto-obj-y += cipher.o
 crypto-obj-$(CONFIG_AF_ALG) += afalg.o
 crypto-obj-$(CONFIG_AF_ALG) += cipher-afalg.o
 crypto-obj-$(CONFIG_AF_ALG) += hash-afalg.o
+crypto-obj-$(CONFIG_GNUTLS) += tls-cipher-suites.o
 crypto-obj-y += tlscreds.o
 crypto-obj-y += tlscredsanon.o
 crypto-obj-y += tlscredspsk.o
diff --git a/crypto/trace-events b/crypto/trace-events
index 9e594d30e8..798b6067ab 100644
--- a/crypto/trace-events
+++ b/crypto/trace-events
@@ -21,3 +21,8 @@ qcrypto_tls_creds_x509_load_cert_list(void *creds, const char *file) "TLS creds
 # tlssession.c
 qcrypto_tls_session_new(void *session, void *creds, const char *hostname, const char *authzid, int endpoint) "TLS session new session=%p creds=%p hostname=%s authzid=%s endpoint=%d"
 qcrypto_tls_session_check_creds(void *session, const char *status) "TLS session check creds session=%p status=%s"
+
+# tls-cipher-suites.c
+qcrypto_tls_cipher_suite_priority(const char *name) "priority: %s"
+qcrypto_tls_cipher_suite_info(uint8_t data0, uint8_t data1, const char *version, const char *name) "data=[0x%02x,0x%02x] version=%s name=%s"
+qcrypto_tls_cipher_suite_count(unsigned count) "count: %u"
diff --git a/qemu-options.hx b/qemu-options.hx
index 93bde2bbc8..4f519f35fd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4566,6 +4566,25 @@ SRST
         string as described at
         https://gnutls.org/manual/html_node/Priority-Strings.html.
 
+    ``-object tls-cipher-suites,id=id,priority=priority``
+        Creates a TLS cipher suites object, which can be used to control
+        the TLS cipher/protocol algorithms that applications are permitted
+        to use.
+
+        The ``id`` parameter is a unique ID which frontends will use to
+        access the ordered list of permitted TLS cipher suites from the
+        host.
+
+        The ``priority`` parameter allows to override the global default
+        priority used by gnutls. This can be useful if the system
+        administrator needs to use a weaker set of crypto priorities for
+        QEMU without potentially forcing the weakness onto all
+        applications. Or conversely if one wants wants a stronger
+        default for QEMU than for all other applications, they can do
+        this through this parameter. Its format is a gnutls priority
+        string as described at
+        https://gnutls.org/manual/html_node/Priority-Strings.html.
+
     ``-object filter-buffer,id=id,netdev=netdevid,interval=t[,queue=all|rx|tx][,status=on|off][,position=head|tail|id=<id>][,insert=behind|before]``
         Interval t can't be 0, this filter batches the packet delivery:
         all packets arriving in a given interval on netdev netdevid are
-- 
2.21.3


