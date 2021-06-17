Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA333AB94F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:14:04 +0200 (CEST)
Received: from localhost ([::1]:51240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltueZ-00077v-4o
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKT-0006k6-RE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKR-0001TF-IL
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:17 -0400
Received: by mail-ed1-x534.google.com with SMTP id t3so4687764edc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDPNHb+HPzR8VO7xPUhdfTuo9DK5TmK3Ukrht2Or98o=;
 b=cQPCOXJcQKbCGVpqBm4Bso5iyPRXz8tqeSU7oBqkO/cqXq4mygtf23jPO8g/oqOiWg
 bjr6PbcFzTUZJTEyUa30ZzbX62RZwcahzI8TL1suDJAGUDO86drW4QAL45aQ3djFhpiM
 NWMEysNtYapSKD5ZJhC0hdRwin96uFvzat6G9QHtaLYizb3P/krNvSLt1QsQ1HGC4Tk+
 PvraqhaCS4h4YMSne9rxTNpG8L2ecZOeJTPmCpqGdAFYsuFLRyAkTwkJfIsfBbqc6AaI
 Z4+2pG5gN8ZLsADg+nL4dpX5qxBYIFhsGqGk6qELnxxW1HS4LD7FTeVZiAJL5dq1elxw
 mwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IDPNHb+HPzR8VO7xPUhdfTuo9DK5TmK3Ukrht2Or98o=;
 b=MR7ru/q8HaWy4670/DT/zEskAnYUJFXpviu5jRZdpz/xU2eHy9ERNXMObd7SnAWBzi
 xKJsUVLxOIcpFfBvxhIl8c5YwLerp4WslBDGTRVa8e2R319/Zhx69YK98/g2jr5ZiM8o
 YhI0c6hYeAZbu/pKmy+TMriBdcL/8h/N2dtW4XTWsReY/OfCXGa5XuJNT8f+tF+h8UFK
 3SQ9wIBhnAMUX34l/42UtXG4w1+NMCxAR+fjBsQPTBpim4SdjWMbACAaaF5YmAYh5IOd
 hDxBlzH/UE7Uacq3qY2xYnV80CfyngfEC4NhQ4hv4c17Mv9BE4dtE7NB5aL/j5F+ly/h
 KHrA==
X-Gm-Message-State: AOAM532jE5nOKZkj5p9tr+N6HmSGBtK72YYazldvUSPMmBkeBRpTAnVD
 EaX+Yrm7wR7M5uI4trPBrnsJ7oTgbBQ=
X-Google-Smtp-Source: ABdhPJwHgi4pQ7ylFHtgCPekbThSxw0vjyZ3Jocj5fmM4vFZ4eEUszPYPT+Z1ZUa+JxwDXj/qTz0eA==
X-Received: by 2002:a05:6402:28a:: with SMTP id
 l10mr7436062edv.365.1623945194039; 
 Thu, 17 Jun 2021 08:53:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] qemu-option: remove now-dead code
Date: Thu, 17 Jun 2021 17:53:02 +0200
Message-Id: <20210617155308.928754-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: armbru@redhat.com
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



