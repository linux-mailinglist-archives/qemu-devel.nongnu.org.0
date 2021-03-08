Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395FC3314EB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:32:54 +0100 (CET)
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJkT-00053Y-23
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJCv-0005q8-90
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:58:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJCq-0000Y0-K0
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imZ7YjcXDzoMY8quRB7d3LxIRp/S2IADptLGUD4685o=;
 b=CpVkCqeFQ1Z8pTZDFmY+iQYwvrzg7JiSF7cEsfCnFFDy6tfoYTLpdbno9obgS0XWjvWAvg
 NdQoXlby+McqB2+TvUVc6UA0xCzsvBRWKIlGt4WadDCpj3vM3O3hxFuSPzipemG/DdtOx7
 AQgKnp2g/78BwnHlwTWUS2pb1kYkR/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-uZKsX5wLNcSQ2vkCB1iSsg-1; Mon, 08 Mar 2021 11:58:04 -0500
X-MC-Unique: uZKsX5wLNcSQ2vkCB1iSsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0181018F7B;
 Mon,  8 Mar 2021 16:58:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 104885D9D3;
 Mon,  8 Mar 2021 16:57:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/30] qom: Drop QemuOpts based interfaces
Date: Mon,  8 Mar 2021 17:54:40 +0100
Message-Id: <20210308165440.386489-31-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

user_creatable_add_opts() has only a single user left, which is a test
case. Rewrite the test to use user_creatable_add_type() instead (which
is the remaining function that doesn't require a QAPI schema) and drop
the QemuOpts related functions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/qom/object_interfaces.h | 59 ------------------------
 qom/object_interfaces.c         | 81 ---------------------------------
 tests/check-qom-proplist.c      | 42 ++++++++---------
 3 files changed, 20 insertions(+), 162 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index fb32330901..ac6c33ceac 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -99,51 +99,6 @@ Object *user_creatable_add_type(const char *type, const char *id,
  */
 void user_creatable_add_qapi(ObjectOptions *options, Error **errp);
 
-/**
- * user_creatable_add_opts:
- * @opts: the object definition
- * @errp: if an error occurs, a pointer to an area to store the error
- *
- * Create an instance of the user creatable object whose type
- * is defined in @opts by the 'qom-type' option, placing it
- * in the object composition tree with name provided by the
- * 'id' field. The remaining options in @opts are used to
- * initialize the object properties.
- *
- * Returns: the newly created object or NULL on error
- */
-Object *user_creatable_add_opts(QemuOpts *opts, Error **errp);
-
-
-/**
- * user_creatable_add_opts_predicate:
- * @type: the QOM type to be added
- *
- * A callback function to determine whether an object
- * of type @type should be created. Instances of this
- * callback should be passed to user_creatable_add_opts_foreach
- */
-typedef bool (*user_creatable_add_opts_predicate)(const char *type);
-
-/**
- * user_creatable_add_opts_foreach:
- * @opaque: a user_creatable_add_opts_predicate callback or NULL
- * @opts: options to create
- * @errp: unused
- *
- * An iterator callback to be used in conjunction with
- * the qemu_opts_foreach() method for creating a list of
- * objects from a set of QemuOpts
- *
- * The @opaque parameter can be passed a user_creatable_add_opts_predicate
- * callback to filter which types of object are created during iteration.
- * When it fails, report the error.
- *
- * Returns: 0 on success, -1 when an error was reported.
- */
-int user_creatable_add_opts_foreach(void *opaque,
-                                    QemuOpts *opts, Error **errp);
-
 /**
  * user_creatable_parse_str:
  * @optarg: the object definition string as passed on the command line
@@ -190,20 +145,6 @@ bool user_creatable_add_from_str(const char *optarg, Error **errp);
  */
 void user_creatable_process_cmdline(const char *optarg);
 
-/**
- * user_creatable_print_help:
- * @type: the QOM type to be added
- * @opts: options to create
- *
- * Prints help if requested in @type or @opts. Note that if @type is neither
- * "help"/"?" nor a valid user creatable type, no help will be printed
- * regardless of @opts.
- *
- * Returns: true if a help option was found and help was printed, false
- * otherwise.
- */
-bool user_creatable_print_help(const char *type, QemuOpts *opts);
-
 /**
  * user_creatable_del:
  * @id: the unique ID for the object
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 62d7db7629..61d6d74a26 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -10,13 +10,10 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qom/object_interfaces.h"
-#include "qemu/help_option.h"
 #include "qemu/id.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/qemu-print.h"
-#include "qapi/opts-visitor.h"
-#include "qemu/config-file.h"
 
 bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
@@ -140,60 +137,6 @@ void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
     visit_free(v);
 }
 
-Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
-{
-    Visitor *v;
-    QDict *pdict;
-    Object *obj;
-    const char *id = qemu_opts_id(opts);
-    char *type = qemu_opt_get_del(opts, "qom-type");
-
-    if (!type) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return NULL;
-    }
-    if (!id) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        qemu_opt_set(opts, "qom-type", type, &error_abort);
-        g_free(type);
-        return NULL;
-    }
-
-    qemu_opts_set_id(opts, NULL);
-    pdict = qemu_opts_to_qdict(opts, NULL);
-
-    v = opts_visitor_new(opts);
-    obj = user_creatable_add_type(type, id, pdict, v, errp);
-    visit_free(v);
-
-    qemu_opts_set_id(opts, (char *) id);
-    qemu_opt_set(opts, "qom-type", type, &error_abort);
-    g_free(type);
-    qobject_unref(pdict);
-    return obj;
-}
-
-
-int user_creatable_add_opts_foreach(void *opaque, QemuOpts *opts, Error **errp)
-{
-    bool (*type_opt_predicate)(const char *, QemuOpts *) = opaque;
-    Object *obj = NULL;
-    const char *type;
-
-    type = qemu_opt_get(opts, "qom-type");
-    if (type && type_opt_predicate &&
-        !type_opt_predicate(type, opts)) {
-        return 0;
-    }
-
-    obj = user_creatable_add_opts(opts, errp);
-    if (!obj) {
-        return -1;
-    }
-    object_unref(obj);
-    return 0;
-}
-
 char *object_property_help(const char *name, const char *type,
                            QObject *defval, const char *description)
 {
@@ -269,20 +212,6 @@ static bool user_creatable_print_type_properites(const char *type)
     return true;
 }
 
-bool user_creatable_print_help(const char *type, QemuOpts *opts)
-{
-    if (is_help_option(type)) {
-        user_creatable_print_types();
-        return true;
-    }
-
-    if (qemu_opt_has_help_opt(opts)) {
-        return user_creatable_print_type_properites(type);
-    }
-
-    return false;
-}
-
 static void user_creatable_print_help_from_qdict(QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
@@ -343,7 +272,6 @@ void user_creatable_process_cmdline(const char *optarg)
 
 bool user_creatable_del(const char *id, Error **errp)
 {
-    QemuOptsList *opts_list;
     Object *container;
     Object *obj;
 
@@ -359,15 +287,6 @@ bool user_creatable_del(const char *id, Error **errp)
         return false;
     }
 
-    /*
-     * if object was defined on the command-line, remove its corresponding
-     * option group entry
-     */
-    opts_list = qemu_find_opts_err("object", NULL);
-    if (opts_list) {
-        qemu_opts_del(qemu_opts_find(opts_list, id));
-    }
-
     object_unparent(obj);
     return true;
 }
diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 1b76581980..3bf208ba8b 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -21,6 +21,8 @@
 #include "qemu/osdep.h"
 
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qobject-input-visitor.h"
 #include "qom/object.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -400,20 +402,30 @@ static void test_dummy_createlist(void)
 
 static void test_dummy_createcmdl(void)
 {
-    QemuOpts *opts;
     DummyObject *dobj;
-    Error *err = NULL;
+    QDict *args;
+    Visitor *v;
+    g_autofree const char *qom_type = NULL;
+    g_autofree const char *id = NULL;
     const char *params = TYPE_DUMMY \
                          ",id=dev0," \
                          "bv=yes,sv=Hiss hiss hiss,av=platypus";
 
-    qemu_add_opts(&qemu_object_opts);
-    opts = qemu_opts_parse(&qemu_object_opts, params, true, &err);
-    g_assert(err == NULL);
-    g_assert(opts);
+    args = keyval_parse(params, "qom-type", NULL, &error_abort);
+
+    qom_type = g_strdup(qdict_get_str(args, "qom-type"));
+    qdict_del(args, "qom-type");
+    g_assert(!strcmp(qom_type, TYPE_DUMMY));
+
+    id = g_strdup(qdict_get_str(args, "id"));
+    qdict_del(args, "id");
+    g_assert(!strcmp(id, "dev0"));
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(args));
+    dobj = DUMMY_OBJECT(user_creatable_add_type(TYPE_DUMMY, id, args, v,
+                                                &error_abort));
+    visit_free(v);
 
-    dobj = DUMMY_OBJECT(user_creatable_add_opts(opts, &err));
-    g_assert(err == NULL);
     g_assert(dobj);
     g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
     g_assert(dobj->bv == true);
@@ -422,20 +434,6 @@ static void test_dummy_createcmdl(void)
     user_creatable_del("dev0", &error_abort);
 
     object_unref(OBJECT(dobj));
-
-    /*
-     * cmdline-parsing via qemu_opts_parse() results in a QemuOpts entry
-     * corresponding to the Object's ID to be added to the QemuOptsList
-     * for objects. To avoid having this entry conflict with future
-     * Objects using the same ID (which can happen in cases where
-     * qemu_opts_parse() is used to parse the object params, such as
-     * with hmp_object_add() at the time of this comment), we need to
-     * check for this in user_creatable_del() and remove the QemuOpts if
-     * it is present.
-     *
-     * The below check ensures this works as expected.
-     */
-    g_assert_null(qemu_opts_find(&qemu_object_opts, "dev0"));
 }
 
 static void test_dummy_badenum(void)
-- 
2.29.2


