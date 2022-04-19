Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15B506429
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:08:24 +0200 (CEST)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngh2F-0007fA-6K
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglr-000198-Ak
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglo-0004P5-5L
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bv16so3773485wrb.9
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7M2WNmROKkrtDZu1zii2mflUNkB7rQ5DR5Wl2tCpzqI=;
 b=fnlOdhha+yDtRT/z8YXBNIgQ4lH9t80vrswsOfCaqz4e+bdiaqODJlkHj3rScCoD2/
 GtAO5pS34zaN+THCsbQ4uQckrarC3JfHhZ2CkEEX9Y3uZ4tBCp7SXnL1Je5uhRZpzGwb
 oAyhfIxBQGQ8prrswwCpisPsAX1tIJLr2qQJw+u+YoU/7nwBJL3Y/O/FOEraY4ZieT/T
 zZVnZ4cDJsw/ODfScuGdnmXntWh69GnqupdMkNR3cGiApFdJm9RsaUQXWGJMLm7rOZkX
 mZRLp4NH5U85oR5z/aV+bEaHXfUYFNm1s/HJL1UMW18pzkMKsiuABefuuqRQ17NBGEMp
 MhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7M2WNmROKkrtDZu1zii2mflUNkB7rQ5DR5Wl2tCpzqI=;
 b=KClvkT35cvLoNMKLqP2RG11QLcwrdogfe/ZVqdMVwO85IakDXvaIPK+4tAL2s7XORP
 dPj/vKr+xGQXoHXqc01b5rcb+TbuIc8Zeyqeng1xpoExsmI8l6O1epvG0dL8qP7NXuiK
 y7TrHgTRaFSwcyqe32BzETZ74rwLZJZNQgGM4PQ8Fy1WNaD8h6NTvRS2VxK4lO/WRgSS
 px6y/2eq31aGPybiSc+kxjng2oXgYu/xU4n7tlyi92ZDFqaJuDAP+IG3RxQQWehzaun1
 8dmOFqgZgqTlC9gH05D16nnL6UW0Cyz/V4qi3+gGzWeiNsJkuWTdYl1VJmuYaIsYHehG
 2F5g==
X-Gm-Message-State: AOAM533vkozySM9D/MYs798KWe6ZeqmmD2UEMz6xff5c4W9HhO17RV6a
 EhCgIeZHFqM9vJmjwmcBIDB9yJPm4nrlJw==
X-Google-Smtp-Source: ABdhPJy6Q3Qx23Nxa/oFvRWjwNRP4UbPOZUsQovk5Iz/5hLKBLdfvF0Qjv15Z72Y8vJM8nTyyPJ0nA==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr10807809wri.39.1650347482865; 
 Mon, 18 Apr 2022 22:51:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/53] tests: replace free_all() usage with g_auto
Date: Tue, 19 Apr 2022 07:50:31 +0200
Message-Id: <20220419055109.142788-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use more idiomatic glib/auto-style code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-11-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/check-qobject.c | 127 ++++++++++++-------------------------
 1 file changed, 40 insertions(+), 87 deletions(-)

diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
index c3d50e9994..7903ebf4cf 100644
--- a/tests/unit/check-qobject.c
+++ b/tests/unit/check-qobject.c
@@ -74,21 +74,6 @@ static void do_test_equality(bool expected, int _, ...)
 #define check_unequal(...) \
     do_test_equality(false, 0, __VA_ARGS__, &test_equality_end_of_arguments)
 
-static void do_free_all(int _, ...)
-{
-    va_list ap;
-    QObject *obj;
-
-    va_start(ap, _);
-    while ((obj = va_arg(ap, QObject *)) != NULL) {
-        qobject_unref(obj);
-    }
-    va_end(ap);
-}
-
-#define free_all(...) \
-    do_free_all(0, __VA_ARGS__, NULL)
-
 static void qobject_is_equal_null_test(void)
 {
     check_unequal(qnull(), NULL);
@@ -96,15 +81,14 @@ static void qobject_is_equal_null_test(void)
 
 static void qobject_is_equal_num_test(void)
 {
-    QNum *u0, *i0, *d0, *dnan, *um42, *im42, *dm42;
+    g_autoptr(QNum) u0 = qnum_from_uint(0u);
+    g_autoptr(QNum) i0 = qnum_from_int(0);
+    g_autoptr(QNum) d0 = qnum_from_double(0.0);
+    g_autoptr(QNum) dnan = qnum_from_double(NAN);
+    g_autoptr(QNum) um42 = qnum_from_uint((uint64_t)-42);
+    g_autoptr(QNum) im42 = qnum_from_int(-42);
+    g_autoptr(QNum) dm42 = qnum_from_double(-42.0);
 
-    u0 = qnum_from_uint(0u);
-    i0 = qnum_from_int(0);
-    d0 = qnum_from_double(0.0);
-    dnan = qnum_from_double(NAN);
-    um42 = qnum_from_uint((uint64_t)-42);
-    im42 = qnum_from_int(-42);
-    dm42 = qnum_from_double(-42.0);
 
     /* Integers representing a mathematically equal number should
      * compare equal */
@@ -121,60 +105,45 @@ static void qobject_is_equal_num_test(void)
     check_unequal(um42, im42);
     check_unequal(um42, dm42);
     check_unequal(im42, dm42);
-
-    free_all(u0, i0, d0, dnan, um42, im42, dm42);
 }
 
 static void qobject_is_equal_bool_test(void)
 {
-    QBool *btrue_0, *btrue_1, *bfalse_0, *bfalse_1;
-
-    btrue_0 = qbool_from_bool(true);
-    btrue_1 = qbool_from_bool(true);
-    bfalse_0 = qbool_from_bool(false);
-    bfalse_1 = qbool_from_bool(false);
+    g_autoptr(QBool) btrue_0 = qbool_from_bool(true);
+    g_autoptr(QBool) btrue_1 = qbool_from_bool(true);
+    g_autoptr(QBool) bfalse_0 = qbool_from_bool(false);
+    g_autoptr(QBool) bfalse_1 = qbool_from_bool(false);
 
     check_equal(btrue_0, btrue_1);
     check_equal(bfalse_0, bfalse_1);
     check_unequal(btrue_0, bfalse_0);
-
-    free_all(btrue_0, btrue_1, bfalse_0, bfalse_1);
 }
 
 static void qobject_is_equal_string_test(void)
 {
-    QString *str_base, *str_whitespace_0, *str_whitespace_1, *str_whitespace_2;
-    QString *str_whitespace_3, *str_case, *str_built;
-
-    str_base = qstring_from_str("foo");
-    str_whitespace_0 = qstring_from_str(" foo");
-    str_whitespace_1 = qstring_from_str("foo ");
-    str_whitespace_2 = qstring_from_str("foo\b");
-    str_whitespace_3 = qstring_from_str("fooo\b");
-    str_case = qstring_from_str("Foo");
-
+    g_autoptr(QString) str_base = qstring_from_str("foo");
+    g_autoptr(QString) str_whitespace_0 = qstring_from_str(" foo");
+    g_autoptr(QString) str_whitespace_1 = qstring_from_str("foo ");
+    g_autoptr(QString) str_whitespace_2 = qstring_from_str("foo\b");
+    g_autoptr(QString) str_whitespace_3 = qstring_from_str("fooo\b");
+    g_autoptr(QString) str_case = qstring_from_str("Foo");
     /* Should yield "foo" */
-    str_built = qstring_from_substr("buffoon", 3, 6);
+    g_autoptr(QString) str_built = qstring_from_substr("buffoon", 3, 6);
 
     check_unequal(str_base, str_whitespace_0, str_whitespace_1,
                   str_whitespace_2, str_whitespace_3, str_case);
 
     check_equal(str_base, str_built);
-
-    free_all(str_base, str_whitespace_0, str_whitespace_1, str_whitespace_2,
-             str_whitespace_3, str_case, str_built);
 }
 
 static void qobject_is_equal_list_test(void)
 {
-    QList *list_0, *list_1, *list_cloned;
-    QList *list_reordered, *list_longer, *list_shorter;
-
-    list_0 = qlist_new();
-    list_1 = qlist_new();
-    list_reordered = qlist_new();
-    list_longer = qlist_new();
-    list_shorter = qlist_new();
+    g_autoptr(QList) list_0 = qlist_new();
+    g_autoptr(QList) list_1 = qlist_new();
+    g_autoptr(QList) list_reordered = qlist_new();
+    g_autoptr(QList) list_longer = qlist_new();
+    g_autoptr(QList) list_shorter = qlist_new();
+    g_autoptr(QList) list_cloned = NULL;
 
     qlist_append_int(list_0, 1);
     qlist_append_int(list_0, 2);
@@ -205,26 +174,20 @@ static void qobject_is_equal_list_test(void)
      * itself */
     qlist_append(list_0, qnum_from_double(NAN));
     g_assert(qobject_is_equal(QOBJECT(list_0), QOBJECT(list_0)) == false);
-
-    free_all(list_0, list_1, list_cloned, list_reordered, list_longer,
-             list_shorter);
 }
 
 static void qobject_is_equal_dict_test(void)
 {
-    QDict *dict_0, *dict_1, *dict_cloned;
-    QDict *dict_different_key, *dict_different_value, *dict_different_null_key;
-    QDict *dict_longer, *dict_shorter, *dict_nested;
-    QDict *dict_crumpled;
-
-    dict_0 = qdict_new();
-    dict_1 = qdict_new();
-    dict_different_key = qdict_new();
-    dict_different_value = qdict_new();
-    dict_different_null_key = qdict_new();
-    dict_longer = qdict_new();
-    dict_shorter = qdict_new();
-    dict_nested = qdict_new();
+    g_autoptr(QDict) dict_cloned = NULL;
+    g_autoptr(QDict) dict_crumpled = NULL;
+    g_autoptr(QDict) dict_0 = qdict_new();
+    g_autoptr(QDict) dict_1 = qdict_new();
+    g_autoptr(QDict) dict_different_key = qdict_new();
+    g_autoptr(QDict) dict_different_value = qdict_new();
+    g_autoptr(QDict) dict_different_null_key = qdict_new();
+    g_autoptr(QDict) dict_longer = qdict_new();
+    g_autoptr(QDict) dict_shorter = qdict_new();
+    g_autoptr(QDict) dict_nested = qdict_new();
 
     qdict_put_int(dict_0, "f.o", 1);
     qdict_put_int(dict_0, "bar", 2);
@@ -284,31 +247,21 @@ static void qobject_is_equal_dict_test(void)
      * itself */
     qdict_put(dict_0, "NaN", qnum_from_double(NAN));
     g_assert(qobject_is_equal(QOBJECT(dict_0), QOBJECT(dict_0)) == false);
-
-    free_all(dict_0, dict_1, dict_cloned, dict_different_key,
-             dict_different_value, dict_different_null_key, dict_longer,
-             dict_shorter, dict_nested, dict_crumpled);
 }
 
 static void qobject_is_equal_conversion_test(void)
 {
-    QNum *u0, *i0, *d0;
-    QString *s0, *s_empty;
-    QBool *bfalse;
-
-    u0 = qnum_from_uint(0u);
-    i0 = qnum_from_int(0);
-    d0 = qnum_from_double(0.0);
-    s0 = qstring_from_str("0");
-    s_empty = qstring_new();
-    bfalse = qbool_from_bool(false);
+    g_autoptr(QNum) u0 = qnum_from_uint(0u);
+    g_autoptr(QNum) i0 = qnum_from_int(0);
+    g_autoptr(QNum) d0 = qnum_from_double(0.0);
+    g_autoptr(QString) s0 = qstring_from_str("0");
+    g_autoptr(QString) s_empty = qstring_new();
+    g_autoptr(QBool) bfalse = qbool_from_bool(false);
 
     /* No automatic type conversion */
     check_unequal(u0, s0, s_empty, bfalse, qnull(), NULL);
     check_unequal(i0, s0, s_empty, bfalse, qnull(), NULL);
     check_unequal(d0, s0, s_empty, bfalse, qnull(), NULL);
-
-    free_all(u0, i0, d0, s0, s_empty, bfalse);
 }
 
 int main(int argc, char **argv)
-- 
2.35.1



