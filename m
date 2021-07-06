Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF9D3BCA0D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:35:24 +0200 (CEST)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iQF-0006Eg-HF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu8-0001a5-3q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu4-0002VA-NV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1246921wmc.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPKh7lIKm+SGPL0+HFk+8YhEYmWyPFDkPiymEwO3vwM=;
 b=ejT1++htkKn3Mgs8xIPXfp9dhSvljmnBHjN8oKyUSq8JxWU9gi85xxnep8bqT59bgr
 gVjL24rOnLyDeBb0qaU1J9nT4IR9EbH4K3Z6BfrLOm3pUMk1VbzH8U5PI3kgbx3puWP2
 8JhTIRHxeYvhcJ9GU494rp6thlBV/DZimVr+Yv3VAo/h8cvkM8c8NCMZn3hjSS8hmsdy
 lEhUeM3crOQEAJn90rf/C+i+8hQQ/5XZQY/rsj2fHNyBN5UjEwTNGDSsaIiWFY0eFQPX
 mBId8SwN2gsEe0CWlzk0MtIKvFa85G9w5dhIQhp6R0YjyH7AQS5fCBi5SDm+s1Hi63RK
 Vt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pPKh7lIKm+SGPL0+HFk+8YhEYmWyPFDkPiymEwO3vwM=;
 b=T4LJ7dZ7P5iq1ZLayHnX/qSlA8aBcKWpJVjRNNcYb/34J3gyC4zreSWXpZFyKOvSkx
 C/tN1iZc5+n6UCNWAf4Dn5NlsHreEz9cf9NrGhBfqP0pd700o04wWvZpBLB9SQpFjdFU
 +xjUgoitZAe/4BTKisqj5LjnHki3CA1PKeEf6jFZwo7yAS1fTODsVpcoGqFPJ9FRYAsk
 Q+1KNSMLDmxKq76koxDpLv9bHvNqS/hp8mCS9IzUQSc6faNDyUpYnRbL/1eK4qMR8cIy
 dwi0PQrmX+/vKZYtrguBm9jUo2lLqCINpoic75Xc4txORBS2OT1rjidiqgA+eYTa9DXw
 8Lag==
X-Gm-Message-State: AOAM530Cky/fmqwNJX41/vnX4lLT4IvdrFq2MOHRTWm6RJLn6ef4+InD
 fNWjCjSsrIXEp1SOpgdA5oKnFBu880A=
X-Google-Smtp-Source: ABdhPJyBcqHG1K1iTGPIvhXisOGvjj8drcRd0miSndotYIovV/8wYuDkJs7FIIZ62+aN+LEjlSgBlg==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr3875798wmr.123.1625565727100; 
 Tue, 06 Jul 2021 03:02:07 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.06 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/40] keyval: introduce keyval_parse_into
Date: Tue,  6 Jul 2021 12:01:36 +0200
Message-Id: <20210706100141.303960-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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

Allow parsing multiple keyval sequences into the same dictionary.
This will be used to simplify the parsing of the -M command line
option, which is currently a .merge_lists = true QemuOpts group.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h |  2 ++
 util/keyval.c         | 43 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index d89c66145a..fffb03d848 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -147,6 +147,8 @@ void qemu_opts_print_help(QemuOptsList *list, bool print_caption);
 void qemu_opts_free(QemuOptsList *list);
 QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
 
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp);
 QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
 void keyval_merge(QDict *old, const QDict *new, Error **errp);
diff --git a/util/keyval.c b/util/keyval.c
index 9bc380686a..904337c8a1 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -511,13 +511,14 @@ static QObject *keyval_listify(QDict *cur, GSList *key_of_cur, Error **errp)
  * If @p_help is not NULL, store whether help is requested there.
  * If @p_help is NULL and help is requested, fail.
  *
- * On success, return a dictionary of the parsed keys and values.
- * On failure, store an error through @errp and return NULL.
+ * On success, return @dict, now filled with the parsed keys and values.
+ *
+ * On failure, store an error through @errp and return NULL.  Any keys
+ * and values parsed so far will be in @dict nevertheless.
  */
-QDict *keyval_parse(const char *params, const char *implied_key,
-                    bool *p_help, Error **errp)
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp)
 {
-    QDict *qdict = qdict_new();
     QObject *listified;
     const char *s;
     bool help = false;
@@ -526,7 +527,6 @@ QDict *keyval_parse(const char *params, const char *implied_key,
     while (*s) {
         s = keyval_parse_one(qdict, s, implied_key, &help, errp);
         if (!s) {
-            qobject_unref(qdict);
             return NULL;
         }
         implied_key = NULL;
@@ -536,15 +536,42 @@ QDict *keyval_parse(const char *params, const char *implied_key,
         *p_help = help;
     } else if (help) {
         error_setg(errp, "Help is not available for this option");
-        qobject_unref(qdict);
         return NULL;
     }
 
     listified = keyval_listify(qdict, NULL, errp);
     if (!listified) {
-        qobject_unref(qdict);
         return NULL;
     }
     assert(listified == QOBJECT(qdict));
     return qdict;
 }
+
+/*
+ * Parse @params in QEMU's traditional KEY=VALUE,... syntax.
+ *
+ * If @implied_key, the first KEY= can be omitted.  @implied_key is
+ * implied then, and VALUE can't be empty or contain ',' or '='.
+ *
+ * A parameter "help" or "?" without a value isn't added to the
+ * resulting dictionary, but instead is interpreted as help request.
+ * All other options are parsed and returned normally so that context
+ * specific help can be printed.
+ *
+ * If @p_help is not NULL, store whether help is requested there.
+ * If @p_help is NULL and help is requested, fail.
+ *
+ * On success, return a dictionary of the parsed keys and values.
+ * On failure, store an error through @errp and return NULL.
+ */
+QDict *keyval_parse(const char *params, const char *implied_key,
+                    bool *p_help, Error **errp)
+{
+    QDict *qdict = qdict_new();
+    QDict *ret = keyval_parse_into(qdict, params, implied_key, p_help, errp);
+
+    if (!ret) {
+        qobject_unref(qdict);
+    }
+    return ret;
+}
-- 
2.31.1



