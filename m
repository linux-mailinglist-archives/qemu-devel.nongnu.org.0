Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA023A7004
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:17:15 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lst1H-0006Dr-0f
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuR-00023v-0g
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuO-00031X-3X
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=983yM9Ivhh0Jdv/knxi7k66F6inZsKoawfPPt/Wd0Sg=;
 b=Mg3IeQjAaEXNt6AIoRDocbPVsfKBXifJ8l7nsYkHcm/QaQRkgnYHWDsQGP5NV4YIaj1jOH
 hvulwSzEEb5QJ4Gdki7CQoF8caq5ytVbDZ3qgHYkMMlq5MGAVLekvL1QqYhopBjbVkOuzi
 FzEhIgHPh4QKDIlKIS9L9w9ADMe03wo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-IQhJ5XHuMw2vHtkbeTWJiQ-1; Mon, 14 Jun 2021 16:10:06 -0400
X-MC-Unique: IQhJ5XHuMw2vHtkbeTWJiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so7553622wrs.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=983yM9Ivhh0Jdv/knxi7k66F6inZsKoawfPPt/Wd0Sg=;
 b=JSP6fRNqqB46mJi3rsrjIEd8NXnn8/CYcZarCpEuW0HFneYoYo5/qG3atJD3SNBPj8
 6dA0VDvKA4Ha9ntyVRzNx0b1DYSTRWG89V3Y+791LSiarS7BM6QU6lonW4uXBNp0p9LV
 0iP/ZkG91PQXw5FwkbNZYfHRf8Wz4JiGraFfoxJyYHWro8Z+HyUkUTw+jKuS6OjZ68SG
 AqpP6O76TNy4STVKxKTsbHlgCSY+xaDvfvisBycTamEyEgUTBkPU7lT+o274WFZEhSlI
 ApLtpJD/BaN2TA8HFRRd/sREkJcQlSzPm9OI7Kz409QkvmBHs7ezBE+01GWR6h9vkeF5
 sLXw==
X-Gm-Message-State: AOAM532jaczeSZvZzRpMJTiGZVl10rW/eP2XCJwH2HvuGpCaGcqB/snZ
 IlCUgq/3HQaU/UUR6NpmGvjNqewgL4WIu+GlBpVPSOOPCg4NLz4mB0QEz0YAwO3vXu/EGKibYWK
 F5o0jzapZSjukgvU1f06lcra9ol+OSzNaHH1e5D1yGzvrWe6GgiogZp53KncyGe0t
X-Received: by 2002:a05:600c:214c:: with SMTP id v12mr7749wml.33.1623701404897; 
 Mon, 14 Jun 2021 13:10:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0PdR37Rt3bX/goJSOjRFbJug4PyP9k9icobUOSZ8HNzsU1MSjrwbTby5svQuPLqfFl9maaA==
X-Received: by 2002:a05:600c:214c:: with SMTP id v12mr7711wml.33.1623701404620; 
 Mon, 14 Jun 2021 13:10:04 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r3sm13478975wmq.8.2021.06.14.13.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:10:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tpm: Return QMP error when TPM is disabled in build
Date: Mon, 14 Jun 2021 22:09:40 +0200
Message-Id: <20210614200940.2056770-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the management layer queries a binary built using --disable-tpm
for TPM devices, it gets confused by getting empty responses:

  { "execute": "query-tpm" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-types" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-models" }
  {
      "return": [
      ]
  }

To make it clearer by returning an error:
- Make the TPM QAPI schema conditional
- Adapt the HMP command
- Remove stubs which became unnecessary

The management layer now gets a 'CommandNotFound' error:

  { "execute": "query-tpm" }
  {
      "error": {
          "class": "CommandNotFound",
          "desc": "The command query-tpm has not been found"
      }
  }

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/tpm.json      | 28 +++++++++++++++++++---------
 monitor/hmp-cmds.c |  4 ++++
 stubs/tpm.c        | 25 -------------------------
 stubs/meson.build  |  1 -
 4 files changed, 23 insertions(+), 35 deletions(-)
 delete mode 100644 stubs/tpm.c

diff --git a/qapi/tpm.json b/qapi/tpm.json
index 6a10c9ed8d2..75590979fde 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -17,7 +17,9 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
+{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
+  'if': 'defined(CONFIG_TPM)' }
+
 ##
 # @query-tpm-models:
 #
@@ -33,7 +35,8 @@
 # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
 #
 ##
-{ 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
+{ 'command': 'query-tpm-models', 'returns': ['TpmModel'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmType:
@@ -46,7 +49,8 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm-types:
@@ -63,7 +67,8 @@
 # <- { "return": [ "passthrough", "emulator" ] }
 #
 ##
-{ 'command': 'query-tpm-types', 'returns': ['TpmType'] }
+{ 'command': 'query-tpm-types', 'returns': ['TpmType'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMPassthroughOptions:
@@ -79,7 +84,8 @@
 ##
 { 'struct': 'TPMPassthroughOptions',
   'data': { '*path': 'str',
-            '*cancel-path': 'str' } }
+            '*cancel-path': 'str' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMEmulatorOptions:
@@ -90,7 +96,8 @@
 #
 # Since: 2.11
 ##
-{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' } }
+{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmTypeOptions:
@@ -104,7 +111,8 @@
 ##
 { 'union': 'TpmTypeOptions',
    'data': { 'passthrough' : 'TPMPassthroughOptions',
-             'emulator': 'TPMEmulatorOptions' } }
+             'emulator': 'TPMEmulatorOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMInfo:
@@ -122,7 +130,8 @@
 { 'struct': 'TPMInfo',
   'data': {'id': 'str',
            'model': 'TpmModel',
-           'options': 'TpmTypeOptions' } }
+           'options': 'TpmTypeOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm:
@@ -152,4 +161,5 @@
 #    }
 #
 ##
-{ 'command': 'query-tpm', 'returns': ['TPMInfo'] }
+{ 'command': 'query-tpm', 'returns': ['TPMInfo'],
+  'if': 'defined(CONFIG_TPM)' }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d10ee141109..f6cadede40f 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -901,6 +901,9 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
 
 void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 {
+#ifndef CONFIG_TPM
+    monitor_printf(mon, "TPM device not supported\n");
+#else
     TPMInfoList *info_list, *info;
     Error *err = NULL;
     unsigned int c = 0;
@@ -946,6 +949,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
         c++;
     }
     qapi_free_TPMInfoList(info_list);
+#endif /* CONFIG_TPM */
 }
 
 void hmp_quit(Monitor *mon, const QDict *qdict)
diff --git a/stubs/tpm.c b/stubs/tpm.c
deleted file mode 100644
index e79bd2a6c2d..00000000000
--- a/stubs/tpm.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * TPM stubs
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/qapi-commands-tpm.h"
-#include "hw/acpi/tpm.h"
-
-TPMInfoList *qmp_query_tpm(Error **errp)
-{
-    return NULL;
-}
-
-TpmTypeList *qmp_query_tpm_types(Error **errp)
-{
-    return NULL;
-}
-
-TpmModelList *qmp_query_tpm_models(Error **errp)
-{
-    return NULL;
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index 65c22c0568c..d4e9549dc99 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -38,7 +38,6 @@
 stub_ss.add(files('sysbus.c'))
 stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
-stub_ss.add(files('tpm.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
 stub_ss.add(files('vmgenid.c'))
-- 
2.31.1


