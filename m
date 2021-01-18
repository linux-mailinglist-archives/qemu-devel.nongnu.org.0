Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A62FA70B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:08:25 +0100 (CET)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Y0u-0000fZ-EJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRX-0002Yy-K1
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRQ-0001XA-RO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVSAt+JC/EVUcBHcgT4IPILlkgKmN3CFwJcHNPkAiRI=;
 b=UvKaZJ8Ubjh1hxk6Csrk8KVbIbRgl33Iki4BFgTKjEwbNzLBVW4YpEWnikMJ5FcTK/wjlL
 SMfU+Jg6vqJoeMmAJv2cDhUHqm1QEXha6enTnLCYLH76PMw1+uGRn2hghepcOpFcNNme4Z
 LVhO8aCIzZ0eyhEgHczRJgfYis3qT70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-bzp2RwOQO8OQThnz0f_P4A-1; Mon, 18 Jan 2021 11:31:41 -0500
X-MC-Unique: bzp2RwOQO8OQThnz0f_P4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66426800D53
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E105A19C66;
 Mon, 18 Jan 2021 16:31:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/25] qemu-option: remove now-dead code
Date: Mon, 18 Jan 2021 11:31:12 -0500
Message-Id: <20210118163113.780171-25-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-M was the sole user of qemu_opts_set and qemu_opts_set_defaults,
remove them and the arguments that they used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h  |  3 ---
 tests/test-qemu-opts.c | 35 -----------------------------
 util/qemu-option.c     | 51 +++++++++---------------------------------
 3 files changed, 10 insertions(+), 79 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index fffb03d848..306bf07575 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -119,7 +119,6 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
                            int fail_if_exists, Error **errp);
 void qemu_opts_reset(QemuOptsList *list);
 void qemu_opts_loc_restore(QemuOpts *opts);
-bool qemu_opts_set(QemuOptsList *list, const char *name, const char *value, Error **errp);
 const char *qemu_opts_id(QemuOpts *opts);
 void qemu_opts_set_id(QemuOpts *opts, char *id);
 void qemu_opts_del(QemuOpts *opts);
@@ -130,8 +129,6 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
                                   bool permit_abbrev);
 QemuOpts *qemu_opts_parse(QemuOptsList *list, const char *params,
                           bool permit_abbrev, Error **errp);
-void qemu_opts_set_defaults(QemuOptsList *list, const char *params,
-                            int permit_abbrev);
 QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
                                Error **errp);
 QDict *qemu_opts_to_qdict_filtered(QemuOpts *opts, QDict *qdict,
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 8bbb17b1c7..0239876e36 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -410,40 +410,6 @@ static void test_qemu_opts_reset(void)
     g_assert(opts == NULL);
 }
 
-static void test_qemu_opts_set(void)
-{
-    QemuOptsList *list;
-    QemuOpts *opts;
-    const char *opt;
-
-    list = qemu_find_opts("opts_list_04");
-    g_assert(list != NULL);
-    g_assert(QTAILQ_EMPTY(&list->head));
-    g_assert_cmpstr(list->name, ==, "opts_list_04");
-
-    /* should not find anything at this point */
-    opts = qemu_opts_find(list, NULL);
-    g_assert(opts == NULL);
-
-    /* implicitly create opts and set str3 value */
-    qemu_opts_set(list, "str3", "value", &error_abort);
-    g_assert(!QTAILQ_EMPTY(&list->head));
-
-    /* get the just created opts */
-    opts = qemu_opts_find(list, NULL);
-    g_assert(opts != NULL);
-
-    /* check the str3 value */
-    opt = qemu_opt_get(opts, "str3");
-    g_assert_cmpstr(opt, ==, "value");
-
-    qemu_opts_del(opts);
-
-    /* should not find anything at this point */
-    opts = qemu_opts_find(list, NULL);
-    g_assert(opts == NULL);
-}
-
 static int opts_count_iter(void *opaque, const char *name, const char *value,
                            Error **errp)
 {
@@ -1030,7 +996,6 @@ int main(int argc, char *argv[])
     g_test_add_func("/qemu-opts/opt_get_size", test_qemu_opt_get_size);
     g_test_add_func("/qemu-opts/opt_unset", test_qemu_opt_unset);
     g_test_add_func("/qemu-opts/opts_reset", test_qemu_opts_reset);
-    g_test_add_func("/qemu-opts/opts_set", test_qemu_opts_set);
     g_test_add_func("/qemu-opts/opts_parse/general", test_opts_parse);
     g_test_add_func("/qemu-opts/opts_parse/bool", test_opts_parse_bool);
     g_test_add_func("/qemu-opts/opts_parse/number", test_opts_parse_number);
diff --git a/util/qemu-option.c b/util/qemu-option.c
index afba08d92e..94a6bea767 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -479,19 +479,14 @@ int qemu_opt_unset(QemuOpts *opts, const char *name)
     }
 }
 
-static QemuOpt *opt_create(QemuOpts *opts, const char *name, char *value,
-                           bool prepend)
+static QemuOpt *opt_create(QemuOpts *opts, const char *name, char *value)
 {
     QemuOpt *opt = g_malloc0(sizeof(*opt));
 
     opt->name = g_strdup(name);
     opt->str = value;
     opt->opts = opts;
-    if (prepend) {
-        QTAILQ_INSERT_HEAD(&opts->head, opt, next);
-    } else {
-        QTAILQ_INSERT_TAIL(&opts->head, opt, next);
-    }
+    QTAILQ_INSERT_TAIL(&opts->head, opt, next);
 
     return opt;
 }
@@ -518,7 +513,7 @@ static bool opt_validate(QemuOpt *opt, Error **errp)
 bool qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
                   Error **errp)
 {
-    QemuOpt *opt = opt_create(opts, name, g_strdup(value), false);
+    QemuOpt *opt = opt_create(opts, name, g_strdup(value));
 
     if (!opt_validate(opt, errp)) {
         qemu_opt_del(opt);
@@ -662,15 +657,6 @@ void qemu_opts_loc_restore(QemuOpts *opts)
     loc_restore(&opts->loc);
 }
 
-bool qemu_opts_set(QemuOptsList *list, const char *name, const char *value, Error **errp)
-{
-    QemuOpts *opts;
-
-    assert(list->merge_lists);
-    opts = qemu_opts_create(list, NULL, 0, &error_abort);
-    return qemu_opt_set(opts, name, value, errp);
-}
-
 const char *qemu_opts_id(QemuOpts *opts)
 {
     return opts->id;
@@ -807,7 +793,7 @@ static const char *get_opt_name_value(const char *params,
 }
 
 static bool opts_do_parse(QemuOpts *opts, const char *params,
-                          const char *firstname, bool prepend,
+                          const char *firstname,
                           bool warn_on_flag, bool *help_wanted, Error **errp)
 {
     char *option, *value;
@@ -829,7 +815,7 @@ static bool opts_do_parse(QemuOpts *opts, const char *params,
             continue;
         }
 
-        opt = opt_create(opts, option, value, prepend);
+        opt = opt_create(opts, option, value);
         g_free(option);
         if (!opt_validate(opt, errp)) {
             qemu_opt_del(opt);
@@ -885,11 +871,11 @@ bool has_help_option(const char *params)
 bool qemu_opts_do_parse(QemuOpts *opts, const char *params,
                        const char *firstname, Error **errp)
 {
-    return opts_do_parse(opts, params, firstname, false, false, NULL, errp);
+    return opts_do_parse(opts, params, firstname, false, NULL, errp);
 }
 
 static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
-                            bool permit_abbrev, bool defaults,
+                            bool permit_abbrev,
                             bool warn_on_flag, bool *help_wanted, Error **errp)
 {
     const char *firstname;
@@ -899,21 +885,13 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
     assert(!permit_abbrev || list->implied_opt_name);
     firstname = permit_abbrev ? list->implied_opt_name : NULL;
 
-    /*
-     * This code doesn't work for defaults && !list->merge_lists: when
-     * params has no id=, and list has an element with !opts->id, it
-     * appends a new element instead of returning the existing opts.
-     * However, we got no use for this case.  Guard against possible
-     * (if unlikely) future misuse:
-     */
-    assert(!defaults || list->merge_lists);
     opts = qemu_opts_create(list, id, !list->merge_lists, errp);
     g_free(id);
     if (opts == NULL) {
         return NULL;
     }
 
-    if (!opts_do_parse(opts, params, firstname, defaults,
+    if (!opts_do_parse(opts, params, firstname,
                        warn_on_flag, help_wanted, errp)) {
         qemu_opts_del(opts);
         return NULL;
@@ -932,7 +910,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
 QemuOpts *qemu_opts_parse(QemuOptsList *list, const char *params,
                           bool permit_abbrev, Error **errp)
 {
-    return opts_parse(list, params, permit_abbrev, false, false, NULL, errp);
+    return opts_parse(list, params, permit_abbrev, false, NULL, errp);
 }
 
 /**
@@ -950,7 +928,7 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
     QemuOpts *opts;
     bool help_wanted = false;
 
-    opts = opts_parse(list, params, permit_abbrev, false, true,
+    opts = opts_parse(list, params, permit_abbrev, true,
                       opts_accepts_any(list) ? NULL : &help_wanted,
                       &err);
     if (!opts) {
@@ -964,15 +942,6 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
     return opts;
 }
 
-void qemu_opts_set_defaults(QemuOptsList *list, const char *params,
-                            int permit_abbrev)
-{
-    QemuOpts *opts;
-
-    opts = opts_parse(list, params, permit_abbrev, true, false, NULL, NULL);
-    assert(opts);
-}
-
 static bool qemu_opts_from_qdict_entry(QemuOpts *opts,
                                        const QDictEntry *entry,
                                        Error **errp)
-- 
2.26.2



