Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD76AFBD5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKo-0000PV-Vb; Tue, 07 Mar 2023 20:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKn-0000Ko-AP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKl-0001WD-AS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M913g5KmMg2h4dGyCgCV10+MOAMlx7uevooxuvfZS4o=;
 b=RVKa07UB0Po6N9soTA358No056/VO1Ad3jR8gGJR4a2F8NYhyoHss4FTUSI0nSHUgNHhb9
 qgWypyNIbrISwCHn1MySdwHKQXt5dCzZ+G9Suq4Y+S10UJUuqve49qD/ca5PDO/fGW67q0
 044mI2zxjT8ulnqjW2Wl95wFJzfuj/s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-LR6Vs7FLNFKzjzo87W_Zig-1; Tue, 07 Mar 2023 20:11:09 -0500
X-MC-Unique: LR6Vs7FLNFKzjzo87W_Zig-1
Received: by mail-wr1-f69.google.com with SMTP id
 o3-20020a5d6483000000b002cc4fe0f7fcso2561860wri.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237868;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M913g5KmMg2h4dGyCgCV10+MOAMlx7uevooxuvfZS4o=;
 b=NA66AjJByo7l6CwwliUwGXU11CExDvJFRXVCPvpoMoWKjK1nA8VCEfxXqnHyz71ENv
 Xmb9M1LcXiIrEBSgoHT6W0UPBwwVyDBKw6XW5yWNReJaH1CFUHmQooQ74mBgKzY1WcWG
 1ni1J+hRzhEyNtahdnI+C6EiuCbH8KNYwN/JFN4C+ccNoBvOM2cQE2t2LxXScaRnyaH5
 DA33gDoBWwy6Y40GyhSR2Jqk+/hN/aU6mLAwsi/TCLMv18eOhH2+k/AXNTMtuFicubtv
 ieNYwjjOPHOTQYtD4SgaBC8ROnMEpOGbF8jEPg9puN8fEA5rTlf5d2tOWJjW+vwo/eTf
 H8kg==
X-Gm-Message-State: AO0yUKWhm+NMZSkupqriGebJocum4YiaPMzGyww/xw8OLlzzwI+GXXBZ
 14p+3pzYgLy6psG5LkDwp6NYN97qxJZxx2KhIpluXPl73+KV/lbjo4Lyk+46uBDSdAsrCj5m6Hh
 o+LRbL8NQBd+8KBNmaWwCd6TVXGWB18/vjSZgPBtLliCK9h5UgfHtBllaP7I5piXqu3jt
X-Received: by 2002:a05:600c:468b:b0:3ea:e554:77fe with SMTP id
 p11-20020a05600c468b00b003eae55477femr14156233wmo.12.1678237867902; 
 Tue, 07 Mar 2023 17:11:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+/klS09aWLVgtrjZORgHaucvIvn6ytkLKT/HXSfQ0MnLRtaUUs6kOrYI+9t4INHds/4mAROw==
X-Received: by 2002:a05:600c:468b:b0:3ea:e554:77fe with SMTP id
 p11-20020a05600c468b00b003eae55477femr14156211wmo.12.1678237867592; 
 Tue, 07 Mar 2023 17:11:07 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003e1fee8baacsm19108826wmo.25.2023.03.07.17.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:07 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 05/73] cryptodev: Introduce 'query-cryptodev' QMP command
Message-ID: <5dcb0198109429c9f54adce939ad825eabe857b4.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: zhenwei pi <pizhenwei@bytedance.com>

Now we have a QMP command to query crypto devices:
virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
{
  "return": [
    {
      "service": [
        "akcipher",
        "mac",
        "hash",
        "cipher"
      ],
      "id": "cryptodev1",
      "client": [
        {
          "queue": 0,
          "type": "builtin"
        }
      ]
    },
    {
      "service": [
        "akcipher"
      ],
      "id": "cryptodev0",
      "client": [
        {
          "queue": 0,
          "type": "lkcf"
        }
      ]
    }
  ],
  "id": "libvirt-417"
}

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-6-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/cryptodev.json  | 44 +++++++++++++++++++++++++++++++++++++++++++
 backends/cryptodev.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index 8732a30524..f33f96a692 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -43,3 +43,47 @@
 { 'enum': 'QCryptodevBackendType',
   'prefix': 'QCRYPTODEV_BACKEND_TYPE',
   'data': ['builtin', 'vhost-user', 'lkcf']}
+
+##
+# @QCryptodevBackendClient:
+#
+# Information about a queue of crypto device.
+#
+# @queue: the queue index of the crypto device
+#
+# @type: the type of the crypto device
+#
+# Since: 8.0
+##
+{ 'struct': 'QCryptodevBackendClient',
+  'data': { 'queue': 'uint32',
+            'type': 'QCryptodevBackendType' } }
+
+##
+# @QCryptodevInfo:
+#
+# Information about a crypto device.
+#
+# @id: the id of the crypto device
+#
+# @service: supported service types of a crypto device
+#
+# @client: the additional infomation of the crypto device
+#
+# Since: 8.0
+##
+{ 'struct': 'QCryptodevInfo',
+  'data': { 'id': 'str',
+            'service': ['QCryptodevBackendServiceType'],
+            'client': ['QCryptodevBackendClient'] } }
+
+##
+# @query-cryptodev:
+#
+# Returns information about current crypto devices.
+#
+# Returns: a list of @QCryptodevInfo
+#
+# Since: 8.0
+##
+{ 'command': 'query-cryptodev', 'returns': ['QCryptodevInfo']}
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index c2a053db0e..3a45d19823 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "sysemu/cryptodev.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-cryptodev.h"
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
@@ -33,6 +34,50 @@
 
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
+static int qmp_query_cryptodev_foreach(Object *obj, void *data)
+{
+    CryptoDevBackend *backend;
+    QCryptodevInfoList **infolist = data;
+    uint32_t services, i;
+
+    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
+        return 0;
+    }
+
+    QCryptodevInfo *info = g_new0(QCryptodevInfo, 1);
+    info->id = g_strdup(object_get_canonical_path_component(obj));
+
+    backend = CRYPTODEV_BACKEND(obj);
+    services = backend->conf.crypto_services;
+    for (i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
+        if (services & (1 << i)) {
+            QAPI_LIST_PREPEND(info->service, i);
+        }
+    }
+
+    for (i = 0; i < backend->conf.peers.queues; i++) {
+        CryptoDevBackendClient *cc = backend->conf.peers.ccs[i];
+        QCryptodevBackendClient *client = g_new0(QCryptodevBackendClient, 1);
+
+        client->queue = cc->queue_index;
+        client->type = cc->type;
+        QAPI_LIST_PREPEND(info->client, client);
+    }
+
+    QAPI_LIST_PREPEND(*infolist, info);
+
+    return 0;
+}
+
+QCryptodevInfoList *qmp_query_cryptodev(Error **errp)
+{
+    QCryptodevInfoList *list = NULL;
+    Object *objs = container_get(object_get_root(), "/objects");
+
+    object_child_foreach(objs, qmp_query_cryptodev_foreach, &list);
+
+    return list;
+}
 
 CryptoDevBackendClient *cryptodev_backend_new_client(void)
 {
-- 
MST


