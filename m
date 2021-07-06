Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F53BCA3F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:40:47 +0200 (CEST)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iVS-0007Tb-7h
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu6-0001Tp-2c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu4-0002Uo-5T
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1246870wmc.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaWfNNyaVagDad1eRt/V1RCmBUTKiX/vUI2Ausu/1+0=;
 b=QI2++XN4IUd1VlQJ2jN1mUV8m468n/RDdUXdVFAC0Xmv0q2xcUM0UqNbKl94ElqiEv
 VOHthdtY4SX8iD6ztICJCw82tsJjEp6G9vQzt6JzN3tJlNWJnKOwqfADP7F79SOU8Yeq
 /oWI7RyF42Xhcvd6vjryJoKPvOX9kJo6kt8M6VM2WL6A7VdFgiKtAiTFG6KwF2fNg/9D
 0hjB+0h5T9K59n6tiwDUHMzD5uoq/n68gB55iVad/yi3197nXND/vMKwyuvndXiBgdov
 XVFnxd0FIABHHH09oc5/+cCj++qqiUiVTjsbZDBkhr0s0z0KSMFcFn/9IUEzrxzISyH5
 XzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eaWfNNyaVagDad1eRt/V1RCmBUTKiX/vUI2Ausu/1+0=;
 b=mLK8EoDjcKIQyW/9ypksIgRO/KtuVgeO6htHLthcWiywcMci0MZ5cb3ueEcbYZAC+o
 QznTlRSONmhcjCBTo0tHcYva5rnyh73ww8K3+Z9mZxtIA9p94SbtNZ5KP+u6dX4cr3z+
 sz1WoBLs5vH7SIm/MDIA/RPxqORclj5E23BrC6ddmjlpINOQ+EYsY+lCc9M1E4XVi+U6
 AdS636oFo9oXM6w3Ux0XTWY60oe4DpbZE4JGf+Wf7HLN7Ui55zki/II68uiaE+7G9UzN
 RCaY4sUZP9R03tH+Fra9aZ0grUTXW64DHTVtQ27FGQGsbxoQSJbusd8ub5jtn4VAhkf8
 6qlw==
X-Gm-Message-State: AOAM530dIvkgJZp7SwnXAwqgJqLFq+kuRNeQFy0qCdj7qoCkTBaxm1F1
 qpyURi+lqFkA0L4+9X4XIykh9KQY2ug=
X-Google-Smtp-Source: ABdhPJzPZ4N+qNKKd8CiQ2Xyv2IGH/gjKNF+pgKfWKpPR6d9OMZyyZLMNgZLxZZxW0oaecPbWv6ORg==
X-Received: by 2002:a05:600c:4ecd:: with SMTP id
 g13mr16298912wmq.50.1625565725752; 
 Tue, 06 Jul 2021 03:02:05 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.05 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/40] qom: export more functions for use with
 non-UserCreatable objects
Date: Tue,  6 Jul 2021 12:01:34 +0200
Message-Id: <20210706100141.303960-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines and accelerators are not user-creatable but they are going
to share similar command-line parsing machinery.  Export functions
that will be used with -machine and -accel in softmmu/vl.c.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object.h    | 23 ++++++++++++++++
 qom/object_interfaces.c | 58 +++++++++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 16 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 6721cd312e..faae0d841f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -861,6 +861,29 @@ static void do_qemu_init_ ## type_array(void)                               \
 }                                                                           \
 type_init(do_qemu_init_ ## type_array)
 
+/**
+ * type_print_class_properties:
+ * @type: a QOM class name
+ *
+ * Print the object's class properties to stdout or the monitor.
+ * Return whether an object was found.
+ */
+bool type_print_class_properties(const char *type);
+
+/**
+ * object_set_properties_from_keyval:
+ * @obj: a QOM object
+ * @qdict: a dictionary with the properties to be set
+ * @from_json: true if leaf values of @qdict are typed, false if they
+ * are strings
+ * @errp: pointer to error object
+ *
+ * For each key in the dictionary, parse the value string if needed,
+ * then set the corresponding property in @obj.
+ */
+void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
+                                       bool from_json, Error **errp);
+
 /**
  * object_class_dynamic_cast_assert:
  * @klass: The #ObjectClass to attempt to cast.
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 4479ee693a..ad9b56b59a 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -42,6 +42,44 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
     }
 }
 
+static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
+                                             Visitor *v, Error **errp)
+{
+    const QDictEntry *e;
+    Error *local_err = NULL;
+
+    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
+        goto out;
+    }
+    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
+        if (!object_property_set(obj, e->key, v, &local_err)) {
+            break;
+        }
+    }
+    if (!local_err) {
+        visit_check_struct(v, &local_err);
+    }
+    visit_end_struct(v, NULL);
+
+out:
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+}
+
+void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
+                                       bool from_json, Error **errp)
+{
+    Visitor *v;
+    if (from_json) {
+        v = qobject_input_visitor_new(QOBJECT(qdict));
+    } else {
+        v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    }
+    object_set_properties_from_qdict(obj, qdict, v, errp);
+    visit_free(v);
+}
+
 Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp)
@@ -49,7 +87,6 @@ Object *user_creatable_add_type(const char *type, const char *id,
     ERRP_GUARD();
     Object *obj;
     ObjectClass *klass;
-    const QDictEntry *e;
     Error *local_err = NULL;
 
     if (id != NULL && !id_wellformed(id)) {
@@ -78,18 +115,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
 
     assert(qdict);
     obj = object_new(type);
-    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
-        goto out;
-    }
-    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-        if (!object_property_set(obj, e->key, v, &local_err)) {
-            break;
-        }
-    }
-    if (!local_err) {
-        visit_check_struct(v, &local_err);
-    }
-    visit_end_struct(v, NULL);
+    object_set_properties_from_qdict(obj, qdict, v, &local_err);
     if (local_err) {
         goto out;
     }
@@ -178,7 +204,7 @@ static void user_creatable_print_types(void)
     g_slist_free(list);
 }
 
-static bool user_creatable_print_type_properites(const char *type)
+bool type_print_class_properties(const char *type)
 {
     ObjectClass *klass;
     ObjectPropertyIterator iter;
@@ -224,7 +250,7 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts)
     }
 
     if (qemu_opt_has_help_opt(opts)) {
-        return user_creatable_print_type_properites(type);
+        return type_print_class_properties(type);
     }
 
     return false;
@@ -234,7 +260,7 @@ static void user_creatable_print_help_from_qdict(QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
 
-    if (!type || !user_creatable_print_type_properites(type)) {
+    if (!type || !type_print_class_properties(type)) {
         user_creatable_print_types();
     }
 }
-- 
2.31.1



