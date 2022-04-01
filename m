Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184934EEA96
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:38:44 +0200 (CEST)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDjv-0003CI-35
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:38:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1naDgv-0000Jg-Qn
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1naDgs-00018H-7t
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648805733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4nOPBVODGKpV/5+BlWnHa6aQ8YdtUosuwn7pSCsyh8=;
 b=e7syRRAut+xyi6jgKflNS1UIGYDxryIU6WzFBxKZJlJbGiuM9/KqYdidxP9IW9PQoKfRXx
 2bWjQhFdXXn6YUPGF1m+PMbka9ROWGLIy+nN7xFV2bd7W0TdMDOQA+6Xf213RHRK3KJwWO
 x8Ko4XVFlt5qMamXgEIL4Mdapo7tg04=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-OrVOENw4N1yAGDwgA7pCxw-1; Fri, 01 Apr 2022 05:35:32 -0400
X-MC-Unique: OrVOENw4N1yAGDwgA7pCxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 2-20020a1c0202000000b0038c71e8c49cso2626616wmc.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4nOPBVODGKpV/5+BlWnHa6aQ8YdtUosuwn7pSCsyh8=;
 b=MXh27IheXBPSIDKpVeqrjU3YdEgbmDoT1tq9CAfFGGnvjDrWW4Ep1ICbpy7fdBqX0/
 nt5hbMB0kUus0354u9+/8FzUaxC6VCKNRb4gDFxcy/mQVaeYxqN8JiXC15r8K90/h4gH
 4365Q1EeIjJKR0DXu5cmUssPApIvAt0f7EehjGV6ro397395QJ/Op9lapxwcYiLRx/pl
 TQCnr4YTPTDpT0cpL+Vf7deRpmG4z1sXZZsDCNrCxxdPKao+6jxmNqKY4mHZp6X0ZZ2y
 x0oF9owL8JMoFr1Qcz8F2XXX9NKLS54kWWXXm899CGSuE4umWbD4DEPEgGB2kFBB50Y6
 mtxg==
X-Gm-Message-State: AOAM531/d5TJaqN7Gt6TMH1S4d219puHW8h8dqjfKpgV6h6ZTjx/84CH
 SVGriVW26S3XWOZJBY5VeSqRIqzu1b8610KzDTdS75uHPj9pZns3A/g6wBOVAk7x3MQPHbXC7HQ
 unNviGkYJE8sgoK8=
X-Received: by 2002:adf:f192:0:b0:203:e38f:afa1 with SMTP id
 h18-20020adff192000000b00203e38fafa1mr7234125wro.120.1648805731341; 
 Fri, 01 Apr 2022 02:35:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMOqo4WCDDkdkYAh+QJTL1byqlpwFWipxdEvCF9tadWtzdyMgIWYCm90VzfFPt1G8kySu2tg==
X-Received: by 2002:adf:f192:0:b0:203:e38f:afa1 with SMTP id
 h18-20020adff192000000b00203e38fafa1mr7234108wro.120.1648805731126; 
 Fri, 01 Apr 2022 02:35:31 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:1c1a:5300:ea85:f79:5235:c7fc])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm14009187wmb.36.2022.04.01.02.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:35:30 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v4 2/3] util/main-loop: Introduce the main loop into QOM
Date: Fri,  1 Apr 2022 11:35:22 +0200
Message-Id: <20220401093523.873508-3-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401093523.873508-1-nsaenzju@redhat.com>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'event-loop-base' provides basic property handling for all 'AioContext'
based event loops. So let's define a new 'MainLoopClass' that inherits
from it. This will permit tweaking the main loop's properties through
qapi as well as through the command line using the '-object' keyword[1].
Only one instance of 'MainLoopClass' might be created at any time.

'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
mark 'MainLoop' as non-deletable.

[1] For example:
      -object main-loop,id=main-loop,aio-max-batch=<value>

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
Changes since v3:
 - Rework qom.json

Changes since v2:
 - Fix mainloop's qapi versioning

Changes since v1:
 - Fix json files to differentiate between iothread and main-loop
 - Use OBJECT_DECLARE_TYPE()
 - Fix build dependencies

 event-loop-base.c                | 13 ++++++++
 include/qemu/main-loop.h         | 10 ++++++
 include/sysemu/event-loop-base.h |  1 +
 meson.build                      |  3 +-
 qapi/qom.json                    | 32 +++++++++++++++---
 util/main-loop.c                 | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+), 6 deletions(-)

diff --git a/event-loop-base.c b/event-loop-base.c
index a924c73a7c..e7f99a6ec8 100644
--- a/event-loop-base.c
+++ b/event-loop-base.c
@@ -73,10 +73,23 @@ static void event_loop_base_complete(UserCreatable *uc, Error **errp)
     }
 }
 
+static bool event_loop_base_can_be_deleted(UserCreatable *uc)
+{
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_GET_CLASS(uc);
+    EventLoopBase *backend = EVENT_LOOP_BASE(uc);
+
+    if (bc->can_be_deleted) {
+        return bc->can_be_deleted(backend);
+    }
+
+    return true;
+}
+
 static void event_loop_base_class_init(ObjectClass *klass, void *class_data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
     ucc->complete = event_loop_base_complete;
+    ucc->can_be_deleted = event_loop_base_can_be_deleted;
 
     object_class_property_add(klass, "aio-max-batch", "int",
                               event_loop_base_get_param,
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index d3750c8e76..20c9387654 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -26,9 +26,19 @@
 #define QEMU_MAIN_LOOP_H
 
 #include "block/aio.h"
+#include "qom/object.h"
+#include "sysemu/event-loop-base.h"
 
 #define SIG_IPI SIGUSR1
 
+#define TYPE_MAIN_LOOP  "main-loop"
+OBJECT_DECLARE_TYPE(MainLoop, MainLoopClass, MAIN_LOOP)
+
+struct MainLoop {
+    EventLoopBase parent_obj;
+};
+typedef struct MainLoop MainLoop;
+
 /**
  * qemu_init_main_loop: Set up the process so that it can run the main loop.
  *
diff --git a/include/sysemu/event-loop-base.h b/include/sysemu/event-loop-base.h
index 8e77d8b69f..fced4c9fea 100644
--- a/include/sysemu/event-loop-base.h
+++ b/include/sysemu/event-loop-base.h
@@ -25,6 +25,7 @@ struct EventLoopBaseClass {
 
     void (*init)(EventLoopBase *base, Error **errp);
     void (*update_params)(EventLoopBase *base, Error **errp);
+    bool (*can_be_deleted)(EventLoopBase *base);
 };
 
 struct EventLoopBase {
diff --git a/meson.build b/meson.build
index 89aa3a2518..b8046b5b35 100644
--- a/meson.build
+++ b/meson.build
@@ -2830,7 +2830,8 @@ libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
                              dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
-                              sources: genh + version_res)
+                              sources: genh + version_res,
+                              dependencies: [event_loop_base])
 
 if have_system or have_user
   decodetree = generator(find_program('scripts/decodetree.py'),
diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..e5f31c4469 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -499,6 +499,17 @@
             '*repeat': 'bool',
             '*grab-toggle': 'GrabToggleKeys' } }
 
+##
+# @EventLoopBaseProperties:
+#
+# Common properties for objects derived from EventLoopBase
+#
+# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
+#                 0 means that the engine will use its default.
+##
+{ 'struct': 'EventLoopBaseProperties',
+  'data': { '*aio-max-batch': 'int' } }
+
 ##
 # @IothreadProperties:
 #
@@ -516,17 +527,26 @@
 #               algorithm detects it is spending too long polling without
 #               encountering events. 0 selects a default behaviour (default: 0)
 #
-# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
-#                 0 means that the engine will use its default
-#                 (default:0, since 6.1)
+# The @aio-max-batch option is available since 6.1.
 #
 # Since: 2.0
 ##
 { 'struct': 'IothreadProperties',
+  'base': 'EventLoopBaseProperties',
   'data': { '*poll-max-ns': 'int',
             '*poll-grow': 'int',
-            '*poll-shrink': 'int',
-            '*aio-max-batch': 'int' } }
+            '*poll-shrink': 'int' } }
+
+##
+# @MainLoopProperties:
+#
+# Properties for the main-loop object.
+#
+# Since: 7.1
+##
+{ 'struct': 'MainLoopProperties',
+  'base': 'EventLoopBaseProperties',
+  'data': {} }
 
 ##
 # @MemoryBackendProperties:
@@ -818,6 +838,7 @@
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
     'iothread',
+    'main-loop',
     { 'name': 'memory-backend-epc',
       'if': 'CONFIG_LINUX' },
     'memory-backend-file',
@@ -883,6 +904,7 @@
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },
       'iothread':                   'IothreadProperties',
+      'main-loop':                  'MainLoopProperties',
       'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-file':        'MemoryBackendFileProperties',
diff --git a/util/main-loop.c b/util/main-loop.c
index b7b0ce4ca0..5b13f456fa 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/compiler.h"
+#include "qom/object.h"
 
 #ifndef _WIN32
 #include <sys/wait.h>
@@ -184,6 +185,61 @@ int qemu_init_main_loop(Error **errp)
     return 0;
 }
 
+static void main_loop_update_params(EventLoopBase *base, Error **errp)
+{
+    if (!qemu_aio_context) {
+        error_setg(errp, "qemu aio context not ready");
+        return;
+    }
+
+    aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch, errp);
+}
+
+MainLoop *mloop;
+
+static void main_loop_init(EventLoopBase *base, Error **errp)
+{
+    MainLoop *m = MAIN_LOOP(base);
+
+    if (mloop) {
+        error_setg(errp, "only one main-loop instance allowed");
+        return;
+    }
+
+    main_loop_update_params(base, errp);
+
+    mloop = m;
+    return;
+}
+
+static bool main_loop_can_be_deleted(EventLoopBase *base)
+{
+    return false;
+}
+
+static void main_loop_class_init(ObjectClass *oc, void *class_data)
+{
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_CLASS(oc);
+
+    bc->init = main_loop_init;
+    bc->update_params = main_loop_update_params;
+    bc->can_be_deleted = main_loop_can_be_deleted;
+}
+
+static const TypeInfo main_loop_info = {
+    .name = TYPE_MAIN_LOOP,
+    .parent = TYPE_EVENT_LOOP_BASE,
+    .class_init = main_loop_class_init,
+    .instance_size = sizeof(MainLoop),
+};
+
+static void main_loop_register_types(void)
+{
+    type_register_static(&main_loop_info);
+}
+
+type_init(main_loop_register_types)
+
 static int max_priority;
 
 #ifndef _WIN32
-- 
2.35.1


