Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41E4002F7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:08:05 +0200 (CEST)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBjY-0004bh-4E
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBY1-00020q-FW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXz-0000n3-I2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTI1+D+SnN9eJYRwGvcqKaY5n2BrWD0pbmIa58pib0Q=;
 b=WVaiKTwWPIDwulQruLZxy1FW8WIt8h2Ft1zAQTR6ey4NZx2Z8gXx9zVFOl0u1GR9po5yxm
 cJ6fUKT0mJbnGonN3bmP83bk0vaT5cuF9912jXfyAZqT1XSkHLnvohfJIdzItTDAdvQTik
 j2jO20ppmdFX4MdbFw8xqbfcFolLrFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-EzL-5tLCN3KmvB-RCQirLw-1; Fri, 03 Sep 2021 11:56:05 -0400
X-MC-Unique: EzL-5tLCN3KmvB-RCQirLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67EF010054F6;
 Fri,  3 Sep 2021 15:56:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A93060916;
 Fri,  3 Sep 2021 15:56:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] hw/s390x/s390-skeys: rename skeys_enabled to
 skeys_are_enabled
Date: Fri,  3 Sep 2021 17:55:13 +0200
Message-Id: <20210903155514.44772-13-david@redhat.com>
In-Reply-To: <20210903155514.44772-1-david@redhat.com>
References: <20210903155514.44772-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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


