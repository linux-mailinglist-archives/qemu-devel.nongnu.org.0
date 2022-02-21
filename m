Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C14BDB42
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:24:25 +0100 (CET)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCQD-0007jM-04
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCF1-0007CO-Jd
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEi-0005uy-98
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qITtDmi/CshoFHl3ktwNzWW5aSGcuPJ/KTBANVZkZGk=;
 b=E+q1V9uQyRtge4NP1mmamPQysvzH5fxuWW/pzhvh+skqUensVJBvgsnNwBgdXgAuMdxaqE
 BfNTvFmj4b8oJ6XA4yvje+bSnedLxxd3XPhEcLzMNwwwLUFjYgiLFb1c6CcPhGxk4U1/SJ
 u4mxePcBwPLVYYAgg3Gw+0NwnVvWmy8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-YK0yqZPNPOaFRwLFs16Ycg-1; Mon, 21 Feb 2022 12:12:15 -0500
X-MC-Unique: YK0yqZPNPOaFRwLFs16Ycg-1
Received: by mail-wr1-f72.google.com with SMTP id
 g11-20020adfa48b000000b001e57dfb3c38so7643907wrb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qITtDmi/CshoFHl3ktwNzWW5aSGcuPJ/KTBANVZkZGk=;
 b=ieQ2W5hKwxaTxkcRT1FHqW3BKZ/W1t4QDHAqtGnWEXsvi99O7MMrRKAOTQ0gRCC0Yy
 e6RN9tKrzrgqZLssu/d+4SRCG7+VnV/eVPSwD/rTmVF7C3FUqyNQs13FUaMOy/vHPvno
 OQ/3QFt75kVU1PQih7Vpmky7hqPny535b9FuhhkY4xv0Hgrw6gaqdVBeWG4q8AV4EJgi
 gVHD/s+8VDrwvgsrLu/8/3HCAuzWUoV2GCWzTFTRclgIg1LlMDimKjcypA67pFPgzZ17
 J5KpQtZYdAdBtKNzp0Tc18sy50/f0dj2v9UvHDxB1q6SxYU9Evi+JcBsHKDjGyKJD/7F
 1BPw==
X-Gm-Message-State: AOAM530FJiFkF+mvqu5ZpsyPMgtla74sXre703vFi+AId+JBYWFusBES
 rxETSDtJc+M44gC0icNDnURd9ajwCQBZXWxpRqnY3JIGeGTGlT/g81ycETgj1abuMWBwj6FLyHF
 5ZIR88czhqc3q0lg=
X-Received: by 2002:a7b:c3d3:0:b0:37b:ea2b:55a4 with SMTP id
 t19-20020a7bc3d3000000b0037bea2b55a4mr18555699wmj.85.1645463534179; 
 Mon, 21 Feb 2022 09:12:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOQZul93EeSYgxbkWMqX3CpFbixOym88J5Ot3U5jSR0Sk5i7Ln1egxWXnZYUBVsD2X+h+gVA==
X-Received: by 2002:a7b:c3d3:0:b0:37b:ea2b:55a4 with SMTP id
 t19-20020a7bc3d3000000b0037bea2b55a4mr18555679wmj.85.1645463533854; 
 Mon, 21 Feb 2022 09:12:13 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1204:1500:37e7:8150:d9df:36f])
 by smtp.gmail.com with ESMTPSA id a10sm24402149wri.74.2022.02.21.09.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:12:13 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH 1/3] util & iothread: Introduce event-loop abstract class
Date: Mon, 21 Feb 2022 18:08:43 +0100
Message-Id: <20220221170843.849084-2-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221170843.849084-1-nsaenzju@redhat.com>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Introduce the 'event-loop-backend' abstract class, it'll hold the
properties common to all event loops and provide the necessary hooks for
their creation. Then have 'IOThread' inherit from it. The class is
defined as user creatable and provides a hook for its children to attach
themselves to the user creatable class 'complete' function.

The new 'event-loop-backend' class will live in the util directory, and
will be packed into the qom static library.

No functional changes intended.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
---
 MAINTAINERS               |   1 +
 include/sysemu/iothread.h |  11 +--
 iothread.c                | 171 ++++----------------------------------
 qom/meson.build           |   1 +
 util/event-loop.c         | 142 +++++++++++++++++++++++++++++++
 util/event-loop.h         |  40 +++++++++
 6 files changed, 204 insertions(+), 162 deletions(-)
 create mode 100644 util/event-loop.c
 create mode 100644 util/event-loop.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b3ae2ab08..e5ffbea449 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2670,6 +2670,7 @@ F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
 F: util/main-loop.c
 F: util/qemu-timer.c
+F: util/event-loop*
 F: softmmu/vl.c
 F: softmmu/main.c
 F: softmmu/cpus.c
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 7f714bd136..aafef546b5 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -17,11 +17,12 @@
 #include "block/aio.h"
 #include "qemu/thread.h"
 #include "qom/object.h"
+#include "util/event-loop.h"
 
 #define TYPE_IOTHREAD "iothread"
 
 struct IOThread {
-    Object parent_obj;
+    EventLoopBackend parent_obj;
 
     QemuThread thread;
     AioContext *ctx;
@@ -32,14 +33,6 @@ struct IOThread {
     bool stopping;              /* has iothread_stop() been called? */
     bool running;               /* should iothread_run() continue? */
     int thread_id;
-
-    /* AioContext poll parameters */
-    int64_t poll_max_ns;
-    int64_t poll_grow;
-    int64_t poll_shrink;
-
-    /* AioContext AIO engine parameters */
-    int64_t aio_max_batch;
 };
 typedef struct IOThread IOThread;
 
diff --git a/iothread.c b/iothread.c
index 0f98af0f2a..fca5ee8f4c 100644
--- a/iothread.c
+++ b/iothread.c
@@ -23,22 +23,13 @@
 #include "qemu/error-report.h"
 #include "qemu/rcu.h"
 #include "qemu/main-loop.h"
+#include "util/event-loop.h"
 
 typedef ObjectClass IOThreadClass;
 
 DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
                        TYPE_IOTHREAD)
 
-#ifdef CONFIG_POSIX
-/* Benchmark results from 2016 on NVMe SSD drives show max polling times around
- * 16-32 microseconds yield IOPS improvements for both iodepth=1 and iodepth=32
- * workloads.
- */
-#define IOTHREAD_POLL_MAX_NS_DEFAULT 32768ULL
-#else
-#define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
-#endif
-
 static void *iothread_run(void *opaque)
 {
     IOThread *iothread = opaque;
@@ -105,7 +96,6 @@ static void iothread_instance_init(Object *obj)
 {
     IOThread *iothread = IOTHREAD(obj);
 
-    iothread->poll_max_ns = IOTHREAD_POLL_MAX_NS_DEFAULT;
     iothread->thread_id = -1;
     qemu_sem_init(&iothread->init_done_sem, 0);
     /* By default, we don't run gcontext */
@@ -152,28 +142,24 @@ static void iothread_init_gcontext(IOThread *iothread)
     iothread->main_loop = g_main_loop_new(iothread->worker_context, TRUE);
 }
 
-static void iothread_set_aio_context_params(IOThread *iothread, Error **errp)
+static void iothread_set_aio_context_params(EventLoopBackend *bc, Error **errp)
 {
+    IOThread *iothread = IOTHREAD(bc);
     ERRP_GUARD();
 
-    aio_context_set_poll_params(iothread->ctx,
-                                iothread->poll_max_ns,
-                                iothread->poll_grow,
-                                iothread->poll_shrink,
-                                errp);
+    aio_context_set_poll_params(iothread->ctx, bc->poll_max_ns, bc->poll_grow,
+                                bc->poll_shrink, errp);
     if (*errp) {
         return;
     }
 
-    aio_context_set_aio_params(iothread->ctx,
-                               iothread->aio_max_batch,
-                               errp);
+    aio_context_set_aio_params(iothread->ctx, bc->aio_max_batch, errp);
 }
 
-static void iothread_complete(UserCreatable *obj, Error **errp)
+static void iothread_init(EventLoopBackend *bc, Error **errp)
 {
     Error *local_error = NULL;
-    IOThread *iothread = IOTHREAD(obj);
+    IOThread *iothread = IOTHREAD(bc);
     char *thread_name;
 
     iothread->stopping = false;
@@ -189,7 +175,7 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
      */
     iothread_init_gcontext(iothread);
 
-    iothread_set_aio_context_params(iothread, &local_error);
+    iothread_set_aio_context_params(bc, &local_error);
     if (local_error) {
         error_propagate(errp, local_error);
         aio_context_unref(iothread->ctx);
@@ -201,7 +187,7 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
      * to inherit.
      */
     thread_name = g_strdup_printf("IO %s",
-                        object_get_canonical_path_component(OBJECT(obj)));
+                        object_get_canonical_path_component(OBJECT(bc)));
     qemu_thread_create(&iothread->thread, thread_name, iothread_run,
                        iothread, QEMU_THREAD_JOINABLE);
     g_free(thread_name);
@@ -212,141 +198,20 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
     }
 }
 
-typedef struct {
-    const char *name;
-    ptrdiff_t offset; /* field's byte offset in IOThread struct */
-} IOThreadParamInfo;
-
-static IOThreadParamInfo poll_max_ns_info = {
-    "poll-max-ns", offsetof(IOThread, poll_max_ns),
-};
-static IOThreadParamInfo poll_grow_info = {
-    "poll-grow", offsetof(IOThread, poll_grow),
-};
-static IOThreadParamInfo poll_shrink_info = {
-    "poll-shrink", offsetof(IOThread, poll_shrink),
-};
-static IOThreadParamInfo aio_max_batch_info = {
-    "aio-max-batch", offsetof(IOThread, aio_max_batch),
-};
-
-static void iothread_get_param(Object *obj, Visitor *v,
-        const char *name, IOThreadParamInfo *info, Error **errp)
-{
-    IOThread *iothread = IOTHREAD(obj);
-    int64_t *field = (void *)iothread + info->offset;
-
-    visit_type_int64(v, name, field, errp);
-}
-
-static bool iothread_set_param(Object *obj, Visitor *v,
-        const char *name, IOThreadParamInfo *info, Error **errp)
-{
-    IOThread *iothread = IOTHREAD(obj);
-    int64_t *field = (void *)iothread + info->offset;
-    int64_t value;
-
-    if (!visit_type_int64(v, name, &value, errp)) {
-        return false;
-    }
-
-    if (value < 0) {
-        error_setg(errp, "%s value must be in range [0, %" PRId64 "]",
-                   info->name, INT64_MAX);
-        return false;
-    }
-
-    *field = value;
-
-    return true;
-}
-
-static void iothread_get_poll_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
+static void iothread_class_init(ObjectClass *oc, void *class_data)
 {
-    IOThreadParamInfo *info = opaque;
-
-    iothread_get_param(obj, v, name, info, errp);
-}
+    EventLoopBackendClass *bc = EVENT_LOOP_BACKEND_CLASS(oc);
 
-static void iothread_set_poll_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
-{
-    IOThread *iothread = IOTHREAD(obj);
-    IOThreadParamInfo *info = opaque;
-
-    if (!iothread_set_param(obj, v, name, info, errp)) {
-        return;
-    }
-
-    if (iothread->ctx) {
-        aio_context_set_poll_params(iothread->ctx,
-                                    iothread->poll_max_ns,
-                                    iothread->poll_grow,
-                                    iothread->poll_shrink,
-                                    errp);
-    }
-}
-
-static void iothread_get_aio_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
-{
-    IOThreadParamInfo *info = opaque;
-
-    iothread_get_param(obj, v, name, info, errp);
-}
-
-static void iothread_set_aio_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
-{
-    IOThread *iothread = IOTHREAD(obj);
-    IOThreadParamInfo *info = opaque;
-
-    if (!iothread_set_param(obj, v, name, info, errp)) {
-        return;
-    }
-
-    if (iothread->ctx) {
-        aio_context_set_aio_params(iothread->ctx,
-                                   iothread->aio_max_batch,
-                                   errp);
-    }
-}
-
-static void iothread_class_init(ObjectClass *klass, void *class_data)
-{
-    UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
-    ucc->complete = iothread_complete;
-
-    object_class_property_add(klass, "poll-max-ns", "int",
-                              iothread_get_poll_param,
-                              iothread_set_poll_param,
-                              NULL, &poll_max_ns_info);
-    object_class_property_add(klass, "poll-grow", "int",
-                              iothread_get_poll_param,
-                              iothread_set_poll_param,
-                              NULL, &poll_grow_info);
-    object_class_property_add(klass, "poll-shrink", "int",
-                              iothread_get_poll_param,
-                              iothread_set_poll_param,
-                              NULL, &poll_shrink_info);
-    object_class_property_add(klass, "aio-max-batch", "int",
-                              iothread_get_aio_param,
-                              iothread_set_aio_param,
-                              NULL, &aio_max_batch_info);
+    bc->init = iothread_init;
 }
 
 static const TypeInfo iothread_info = {
     .name = TYPE_IOTHREAD,
-    .parent = TYPE_OBJECT,
+    .parent = TYPE_EVENT_LOOP_BACKEND,
     .class_init = iothread_class_init,
     .instance_size = sizeof(IOThread),
     .instance_init = iothread_instance_init,
     .instance_finalize = iothread_instance_finalize,
-    .interfaces = (InterfaceInfo[]) {
-        {TYPE_USER_CREATABLE},
-        {}
-    },
 };
 
 static void iothread_register_types(void)
@@ -380,10 +245,10 @@ static int query_one_iothread(Object *object, void *opaque)
     info = g_new0(IOThreadInfo, 1);
     info->id = iothread_get_id(iothread);
     info->thread_id = iothread->thread_id;
-    info->poll_max_ns = iothread->poll_max_ns;
-    info->poll_grow = iothread->poll_grow;
-    info->poll_shrink = iothread->poll_shrink;
-    info->aio_max_batch = iothread->aio_max_batch;
+    info->poll_max_ns = iothread->parent_obj.poll_max_ns;
+    info->poll_grow = iothread->parent_obj.poll_grow;
+    info->poll_shrink = iothread->parent_obj.poll_shrink;
+    info->aio_max_batch = iothread->parent_obj.aio_max_batch;
 
     QAPI_LIST_APPEND(*tail, info);
     return 0;
diff --git a/qom/meson.build b/qom/meson.build
index 062a3789d8..c20e5dd1cb 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -4,6 +4,7 @@ qom_ss.add(files(
   'object.c',
   'object_interfaces.c',
   'qom-qobject.c',
+  '../util/event-loop.c',
 ))
 
 qmp_ss.add(files('qom-qmp-cmds.c'))
diff --git a/util/event-loop.c b/util/event-loop.c
new file mode 100644
index 0000000000..f3e50909a0
--- /dev/null
+++ b/util/event-loop.c
@@ -0,0 +1,142 @@
+/*
+ * QEMU event-loop backend
+ *
+ * Copyright (C) 2022 Red Hat Inc
+ *
+ * Authors:
+ *  Nicolas Saenz Julienne <nsaenzju@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "util/event-loop.h"
+#include "qom/object_interfaces.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+
+#ifdef CONFIG_POSIX
+/*
+ * Benchmark results from 2016 on NVMe SSD drives show max polling times around
+ * 16-32 microseconds yield IOPS improvements for both iodepth=1 and iodepth=32
+ * workloads.
+ */
+#define EVENT_LOOP_BACKEND_POLL_MAX_NS_DEFAULT 32768ULL
+#else
+#define EVENT_LOOP_BACKEND_POLL_MAX_NS_DEFAULT 0ULL
+#endif
+
+static void event_loop_backend_instance_init(Object *obj)
+{
+    EventLoopBackend *event_loop_backend = EVENT_LOOP_BACKEND(obj);
+
+    event_loop_backend->poll_max_ns = EVENT_LOOP_BACKEND_POLL_MAX_NS_DEFAULT;
+}
+
+typedef struct {
+    const char *name;
+    ptrdiff_t offset; /* field's byte offset in EventLoopBackend struct */
+} EventLoopBackendParamInfo;
+
+static EventLoopBackendParamInfo poll_max_ns_info = {
+    "poll-max-ns", offsetof(EventLoopBackend, poll_max_ns),
+};
+static EventLoopBackendParamInfo poll_grow_info = {
+    "poll-grow", offsetof(EventLoopBackend, poll_grow),
+};
+static EventLoopBackendParamInfo poll_shrink_info = {
+    "poll-shrink", offsetof(EventLoopBackend, poll_shrink),
+};
+static EventLoopBackendParamInfo aio_max_batch_info = {
+    "aio-max-batch", offsetof(EventLoopBackend, aio_max_batch),
+};
+
+static void event_loop_backend_get_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    EventLoopBackendParamInfo *info = opaque;
+    EventLoopBackend *event_loop_backend = EVENT_LOOP_BACKEND(obj);
+    int64_t *field = (void *)event_loop_backend + info->offset;
+
+    visit_type_int64(v, name, field, errp);
+}
+
+static void event_loop_backend_set_param(Object *obj, Visitor *v,
+                                         const char *name, void *opaque,
+                                         Error **errp)
+{
+    EventLoopBackend *event_loop_backend = EVENT_LOOP_BACKEND(obj);
+    EventLoopBackendParamInfo *info = opaque;
+    int64_t *field = (void *)event_loop_backend + info->offset;
+    int64_t value;
+
+    if (!visit_type_int64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value < 0) {
+        error_setg(errp, "%s value must be in range [0, %" PRId64 "]",
+                   info->name, INT64_MAX);
+        return;
+    }
+
+    *field = value;
+
+    return;
+
+}
+
+static void
+event_loop_backend_complete(UserCreatable *uc, Error **errp)
+{
+    EventLoopBackend *backend = EVENT_LOOP_BACKEND(uc);
+    EventLoopBackendClass *bc = EVENT_LOOP_BACKEND_GET_CLASS(uc);
+
+    if (bc->init) {
+        bc->init(backend, errp);
+    }
+}
+
+static void event_loop_backend_class_init(ObjectClass *klass, void *class_data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
+    ucc->complete = event_loop_backend_complete;
+
+    object_class_property_add(klass, "poll-max-ns", "int",
+                              event_loop_backend_get_param,
+                              event_loop_backend_set_param,
+                              NULL, &poll_max_ns_info);
+    object_class_property_add(klass, "poll-grow", "int",
+                              event_loop_backend_get_param,
+                              event_loop_backend_set_param,
+                              NULL, &poll_grow_info);
+    object_class_property_add(klass, "poll-shrink", "int",
+                              event_loop_backend_get_param,
+                              event_loop_backend_set_param,
+                              NULL, &poll_shrink_info);
+    object_class_property_add(klass, "aio-max-batch", "int",
+                              event_loop_backend_get_param,
+                              event_loop_backend_set_param,
+                              NULL, &aio_max_batch_info);
+}
+
+static const TypeInfo event_loop_backend_info = {
+    .name = TYPE_EVENT_LOOP_BACKEND,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(EventLoopBackend),
+    .instance_init = event_loop_backend_instance_init,
+    .class_size = sizeof(EventLoopBackendClass),
+    .class_init = event_loop_backend_class_init,
+    .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&event_loop_backend_info);
+}
+type_init(register_types);
diff --git a/util/event-loop.h b/util/event-loop.h
new file mode 100644
index 0000000000..8883a0d086
--- /dev/null
+++ b/util/event-loop.h
@@ -0,0 +1,40 @@
+/*
+ * QEMU event-loop backend
+ *
+ * Copyright (C) 2022 Red Hat Inc
+ *
+ * Authors:
+ *  Nicolas Saenz Julienne <nsaenzju@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_EVENT_LOOP_H
+#define QEMU_EVENT_LOOP_H
+
+#include "qom/object.h"
+#include "block/aio.h"
+#include "qemu/typedefs.h"
+
+#define TYPE_EVENT_LOOP_BACKEND         "event-loop-backend"
+OBJECT_DECLARE_TYPE(EventLoopBackend, EventLoopBackendClass,
+                    EVENT_LOOP_BACKEND)
+
+struct EventLoopBackendClass {
+    ObjectClass parent_class;
+
+    void (*init)(EventLoopBackend *backend, Error **errp);
+};
+
+struct EventLoopBackend {
+    Object parent;
+
+    /* AioContext poll parameters */
+    int64_t poll_max_ns;
+    int64_t poll_grow;
+    int64_t poll_shrink;
+
+    /* AioContext AIO engine parameters */
+    int64_t aio_max_batch;
+};
+#endif
-- 
2.35.1


