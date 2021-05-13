Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842137FB85
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:32:19 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEG2-00058m-3n
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED8-0002Jl-94
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED2-0003So-V6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBZjcIE5iW9BJe91mAf9MP8HatO8qabRsBFwx5nCBUA=;
 b=Xa0V4lKOzGpsVvi062kL8FVjhd94IWsYEGf7qhCe9zHCn4guyioAI5T44COPpM74OjKOAO
 /KUuoPlp1fZ8w5rTevyd7aRsZQxCUE89rXiJjn3V3knh93+beZh54cWIZs5m4oxEcJZzXJ
 rKosZGcTOgZIjlWAYbq2p6DbJahjxj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-qXWMVs5YOuWfO2rId7DHWg-1; Thu, 13 May 2021 12:29:10 -0400
X-MC-Unique: qXWMVs5YOuWfO2rId7DHWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE236D5CE;
 Thu, 13 May 2021 16:29:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92904687D7;
 Thu, 13 May 2021 16:29:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] qemu-option: remove now-dead code
Date: Thu, 13 May 2021 12:28:54 -0400
Message-Id: <20210513162901.1310239-8-pbonzini@redhat.com>
In-Reply-To: <20210513162901.1310239-1-pbonzini@redhat.com>
References: <20210513162901.1310239-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yang.zhong@intel.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-M was the sole user of qemu_opts_set and qemu_opts_set_defaults,
remove them and the arguments that they used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h       |  3 ---
 tests/unit/test-qemu-opts.c | 35 -------------------------
 util/qemu-option.c          | 51 ++++++++-----------------------------
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
diff --git a/tests/unit/test-qemu-opts.c b/tests/unit/test-qemu-opts.c
index 6568e31a72..828d40e928 100644
--- a/tests/unit/test-qemu-opts.c
+++ b/tests/unit/test-qemu-opts.c
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
@@ -1041,7 +1007,6 @@ int main(int argc, char *argv[])
     g_test_add_func("/qemu-opts/opt_get_size", test_qemu_opt_get_size);
     g_test_add_func("/qemu-opts/opt_unset", test_qemu_opt_unset);
     g_test_add_func("/qemu-opts/opts_reset", test_qemu_opts_reset);
-    g_test_add_func("/qemu-opts/opts_set", test_qemu_opts_set);
     g_test_add_func("/qemu-opts/opts_parse/general", test_opts_parse);
     g_test_add_func("/qemu-opts/opts_parse/bool", test_opts_parse_bool);
     g_test_add_func("/qemu-opts/opts_parse/number", test_opts_parse_number);
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 4944015a25..ee78e42216 100644
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
@@ -811,7 +797,7 @@ static const char *get_opt_name_value(const char *params,
 }
 
 static bool opts_do_parse(QemuOpts *opts, const char *params,
-                          const char *firstname, bool prepend,
+                          const char *firstname,
                           bool warn_on_flag, bool *help_wanted, Error **errp)
 {
     char *option, *value;
@@ -833,7 +819,7 @@ static bool opts_do_parse(QemuOpts *opts, const char *params,
             continue;
         }
 
-        opt = opt_create(opts, option, value, prepend);
+        opt = opt_create(opts, option, value);
         g_free(option);
         if (!opt_validate(opt, errp)) {
             qemu_opt_del(opt);
@@ -889,11 +875,11 @@ bool has_help_option(const char *params)
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
@@ -903,21 +889,13 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
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
@@ -936,7 +914,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
 QemuOpts *qemu_opts_parse(QemuOptsList *list, const char *params,
                           bool permit_abbrev, Error **errp)
 {
-    return opts_parse(list, params, permit_abbrev, false, false, NULL, errp);
+    return opts_parse(list, params, permit_abbrev, false, NULL, errp);
 }
 
 /**
@@ -954,7 +932,7 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
     QemuOpts *opts;
     bool help_wanted = false;
 
-    opts = opts_parse(list, params, permit_abbrev, false, true,
+    opts = opts_parse(list, params, permit_abbrev, true,
                       opts_accepts_any(list) ? NULL : &help_wanted,
                       &err);
     if (!opts) {
@@ -968,15 +946,6 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
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



