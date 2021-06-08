Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FC39F2AF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:43:19 +0200 (CEST)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYGU-0007Ud-0F
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDm-0004Yk-FR
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDi-0001pZ-Up
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:29 -0400
Received: by mail-wr1-x433.google.com with SMTP id a11so18949762wrt.13
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDPNHb+HPzR8VO7xPUhdfTuo9DK5TmK3Ukrht2Or98o=;
 b=m4HM9/9HjlVd0G5zJLxBa5tGnWGGie2cMklPB2rUc2/FOHD63NF9gcuDaxmgcVrKDE
 vnh+hgBhclw4tINkdxmEF+7LPLmLf6FUgWkow0NaBLaIENcY2FY2HKXeuVudDkksXyaN
 Gd8rUTLL1s2mhDtHdvGe8KrzT78Bcy3cXrP1SxLlRDg/f4xKBb2K2m9hRK35kqjwwho2
 olERJiZvl1d7qwWHeAV5AXskfHguKDp+R7wZICi36kizh0k3EIbI1fS70eepEEKvSfJt
 A3eAvGToNbf1YYCcQGx4DKXOkt1RV9gcESJFbrnN70xtxNJ3CmjROpXnSz2l0q+m4vYn
 jP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IDPNHb+HPzR8VO7xPUhdfTuo9DK5TmK3Ukrht2Or98o=;
 b=rxOtHl863ntAxCXXLtxKJHI3uKBL4H5Wh4yKvGlM2suRaKfRHfL5hRggoY0MtvbttT
 ByJOkgci7PnHcOmS48sENsjk3cRTVxO5DfT6QwWdJeEgwSuQbuSZpRKUbfOIvo3mbEkk
 t0KuUXUiyRmRDj8a4J98TdaGArbimglfUjRlkGGnZD6P+Cbq532nOpP7f5SJifhD0ISY
 DPMjLt6NvEkWpwOse5fQtWFG+At/vy6HjII2IYf9eXhHoqySUv2OyWZ2KgNpMDeS4jVl
 cxduo0fwGI8xu1BkQyVypzWbANnSyoo25mFj2wKK+/H9uSbfSaDdax1zZ0um3OB3FbzI
 +6hw==
X-Gm-Message-State: AOAM531akJ8jkBibYtH5QZByFf5mn/RnzlBSVmE9D4Ftj4HVjXdCMP87
 Qzuj04lWlQZALk62KGoI0M4Yel3z1qo=
X-Google-Smtp-Source: ABdhPJzgy7yuZfDbwI0Ljf809J6h9IuCzGndJmdPsnm1NQIk/mnh2RzJ6OV8N0fX8oajfZXfABwleQ==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr20993496wrp.383.1623145224646; 
 Tue, 08 Jun 2021 02:40:24 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] qemu-option: remove now-dead code
Date: Tue,  8 Jun 2021 11:40:10 +0200
Message-Id: <20210608094017.392673-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
2.31.1



