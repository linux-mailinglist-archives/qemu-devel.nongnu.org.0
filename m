Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617A3E8CF3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:12:02 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkHJ-0001Bm-1o
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBr-00055P-6V
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBp-0008Ic-FA
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628672780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTI1+D+SnN9eJYRwGvcqKaY5n2BrWD0pbmIa58pib0Q=;
 b=jJ4e+Akf21pUm7Zr/NzozTY23vqQbEenP++iAL8GcS22kKwzEZiaUYZ9EfIveWXtt+OcGU
 7/9CM7Z3VwA9bUxmdQwyCn67Lv93WDa8xXp9S0+VJlslCEKA8EWOih1QOqd815oWBcsnr4
 U4+ItF+SUvmQjUsbPpzIZtDI8zNmCek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ULnfdBMxP0ydnWFI32nE3A-1; Wed, 11 Aug 2021 05:06:19 -0400
X-MC-Unique: ULnfdBMxP0ydnWFI32nE3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21DAE800EB8;
 Wed, 11 Aug 2021 09:06:18 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F21E5B4BC;
 Wed, 11 Aug 2021 09:06:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/13] hw/s390x/s390-skeys: rename skeys_enabled to
 skeys_are_enabled
Date: Wed, 11 Aug 2021 11:05:26 +0200
Message-Id: <20210811090527.30556-13-david@redhat.com>
In-Reply-To: <20210811090527.30556-1-david@redhat.com>
References: <20210811090527.30556-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... and make it return a bool instead.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-skeys-kvm.c       |  4 ++--
 hw/s390x/s390-skeys.c           | 12 ++++++------
 include/hw/s390x/storage-keys.h |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/s390x/s390-skeys-kvm.c b/hw/s390x/s390-skeys-kvm.c
index 1c4d805ad8..3ff9d94b80 100644
--- a/hw/s390x/s390-skeys-kvm.c
+++ b/hw/s390x/s390-skeys-kvm.c
@@ -15,7 +15,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 
-static int kvm_s390_skeys_enabled(S390SKeysState *ss)
+static bool kvm_s390_skeys_are_enabled(S390SKeysState *ss)
 {
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
     uint8_t single_key;
@@ -57,7 +57,7 @@ static void kvm_s390_skeys_class_init(ObjectClass *oc, void *data)
     S390SKeysClass *skeyclass = S390_SKEYS_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    skeyclass->skeys_enabled = kvm_s390_skeys_enabled;
+    skeyclass->skeys_are_enabled = kvm_s390_skeys_are_enabled;
     skeyclass->get_skeys = kvm_s390_skeys_get;
     skeyclass->set_skeys = kvm_s390_skeys_set;
 
diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index db73e9091d..9e994a5582 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -82,7 +82,7 @@ void hmp_info_skeys(Monitor *mon, const QDict *qdict)
     int r;
 
     /* Quick check to see if guest is using storage keys*/
-    if (!skeyclass->skeys_enabled(ss)) {
+    if (!skeyclass->skeys_are_enabled(ss)) {
         monitor_printf(mon, "Error: This guest is not using storage keys\n");
         return;
     }
@@ -128,7 +128,7 @@ void qmp_dump_skeys(const char *filename, Error **errp)
     FILE *f;
 
     /* Quick check to see if guest is using storage keys*/
-    if (!skeyclass->skeys_enabled(ss)) {
+    if (!skeyclass->skeys_are_enabled(ss)) {
         error_setg(errp, "This guest is not using storage keys - "
                          "nothing to dump");
         return;
@@ -200,9 +200,9 @@ static void qemu_s390_skeys_init(Object *obj)
     skeys->keydata = g_malloc0(skeys->key_count);
 }
 
-static int qemu_s390_skeys_enabled(S390SKeysState *ss)
+static bool qemu_s390_skeys_are_enabled(S390SKeysState *ss)
 {
-    return 1;
+    return true;
 }
 
 static int qemu_s390_skeys_set(S390SKeysState *ss, uint64_t start_gfn,
@@ -250,7 +250,7 @@ static void qemu_s390_skeys_class_init(ObjectClass *oc, void *data)
     S390SKeysClass *skeyclass = S390_SKEYS_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    skeyclass->skeys_enabled = qemu_s390_skeys_enabled;
+    skeyclass->skeys_are_enabled = qemu_s390_skeys_are_enabled;
     skeyclass->get_skeys = qemu_s390_skeys_get;
     skeyclass->set_skeys = qemu_s390_skeys_set;
 
@@ -277,7 +277,7 @@ static void s390_storage_keys_save(QEMUFile *f, void *opaque)
     int error = 0;
     uint8_t *buf;
 
-    if (!skeyclass->skeys_enabled(ss)) {
+    if (!skeyclass->skeys_are_enabled(ss)) {
         goto end_stream;
     }
 
diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
index 2888d42d0b..eb091842c8 100644
--- a/include/hw/s390x/storage-keys.h
+++ b/include/hw/s390x/storage-keys.h
@@ -28,7 +28,7 @@ struct S390SKeysState {
 
 struct S390SKeysClass {
     DeviceClass parent_class;
-    int (*skeys_enabled)(S390SKeysState *ks);
+    bool (*skeys_are_enabled)(S390SKeysState *ks);
     int (*get_skeys)(S390SKeysState *ks, uint64_t start_gfn, uint64_t count,
                      uint8_t *keys);
     int (*set_skeys)(S390SKeysState *ks, uint64_t start_gfn, uint64_t count,
-- 
2.31.1


