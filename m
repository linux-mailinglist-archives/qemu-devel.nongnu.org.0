Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89963C2780
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:24:32 +0200 (CEST)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tIl-0006RY-NH
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m1t6a-0004Ig-Iw
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:11:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m1t6W-0001jz-UF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:11:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id f9so7176339wrq.11
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jMx+BNBD202ys0bXdEj4hA/cG9eSE+8vfxEbRSHNx9g=;
 b=sfyb/XPCt7CLlxMZseIXnjEHsowSufdrt7Y5uYkYtjplHxmhR9DDx0mjZeatwED8C/
 FSOZN6lNDACekse6CYzK9lNI7obuKaF4DIdeR7yv7A/pMUyWQO1tivU9nUwWXvJ6sczN
 7mDdlDne0mp6qzDzEm4ZQUhCrfOHv1gKDjG9gr0RQx5QbOAG1jjeomccDDYHLUmSWqV+
 1c4bOYE+ZRyTRhveNrbdaConWQJ2SRGikhgv7XETv9Ovc8cPfbxXUP+A8rJ5fzQhEr+D
 ZlLrPuyEq7ZXopBCaCzBeN7TXZDuMJr7+HaIMMkQyVR5gWdaH1d96FldIurLhYxgTCtZ
 HNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMx+BNBD202ys0bXdEj4hA/cG9eSE+8vfxEbRSHNx9g=;
 b=MounB5tqZhI/fo12P3dWkjjrKJQ848HbOxjX45nLxsgiXnIH5HNd/9rVUitQu+vamV
 HSOZoAbXNoExRdiREhTZCC1oxWnP/REsO2OJAz2ymm3t98v7wXEg1YuUz+Guzn3BHcJl
 hWcIJY8Zm0Cx3muKlgKCU5l1w55v6gri2hzMvn1jGBrKVHHgJnZScJQ4RlQK7eKSBkTZ
 VGsMDeCzGfUe3T1ubjsr8WOU5MW8g53JQ36bDemCEta3mtDuOsGWUbsJwU0u2REOEwek
 sfxx2/IHmKgqBOQ0L7djtkcdrRgTC9Ae6lD6emxO6L4e6leTvl925+eYGKN1FKW5xMfu
 iHIw==
X-Gm-Message-State: AOAM530WSjiFPIeFzNyN2zDNxL3TwlpnWr8XKsJTLnSnTHN+qpMpTc4P
 XrF3ZLqQoPFsgbCzGzZU9xE=
X-Google-Smtp-Source: ABdhPJzpQL5v7U+JBjKfp6XLCTumhL2Z/EZF6BhLy0XgBBsJ0L+mubwdpn8so4gdljiWPPwRcAUTeA==
X-Received: by 2002:a05:6000:52:: with SMTP id
 k18mr9011234wrx.270.1625847110876; 
 Fri, 09 Jul 2021 09:11:50 -0700 (PDT)
Received: from lb01556.speedport.ip ([2003:f1:1706:da4a:4a24:a8e2:ab18:53c])
 by smtp.gmail.com with ESMTPSA id h15sm5652360wrq.88.2021.07.09.09.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:11:50 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
X-Google-Original-From: Li Zhang <li.zhang@ionos.com>
To: armbru@redhat.com, marcandre.lureau@gmail.com, pankaj.gupta@ionos.com,
 qemu-devel@nongnu.org
Subject: [PATCH v3 RESEND 2/2] chardev: refactor qmp_chardev_add and
 qmp_chardev_change
Date: Fri,  9 Jul 2021 18:08:43 +0200
Message-Id: <20210709160843.339796-2-li.zhang@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709160843.339796-1-li.zhang@ionos.com>
References: <20210709160843.339796-1-li.zhang@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=zhlcindy@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <li.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To improve the problematic source code in qmp_chardev_change
and some redundant source code, the functions qmp_chardev_add 
and qmp_chardev_change are refactored. It is mentioned in thread:
https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg03167.html

Signed-off-by: Li Zhang <li.zhang@ionos.com>
---
 chardev/char.c | 72 ++++++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index d959eec522..cb6f287cd2 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1028,23 +1028,10 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
     return chr;
 }
 
-ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
-                               Error **errp)
+static ChardevReturn *chardev_add(const char *id, Chardev *chr,
+                                  Error **errp)
 {
-    const ChardevClass *cc;
     ChardevReturn *ret;
-    Chardev *chr;
-
-    cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
-    if (!cc) {
-        return NULL;
-    }
-
-    chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, false, errp);
-    if (!chr) {
-        return NULL;
-    }
 
     if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr),
                                        errp)) {
@@ -1062,6 +1049,26 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     return ret;
 }
 
+ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
+                               Error **errp)
+{
+    const ChardevClass *cc;
+    Chardev *chr;
+
+    cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
+    if (!cc) {
+        return NULL;
+    }
+
+    chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
+                      backend, NULL, false, errp);
+    if (!chr) {
+        return NULL;
+    }
+
+    return chardev_add(id, chr, errp);
+}
+
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
@@ -1070,7 +1077,6 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
     Chardev *chr, *chr_new;
     bool closed_sent = false;
     bool handover_yank_instance;
-    ChardevReturn *ret;
 
     chr = qemu_chr_find(id);
     if (!chr) {
@@ -1089,11 +1095,22 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
         return NULL;
     }
 
+    cc = CHARDEV_GET_CLASS(chr);
+    cc_new = char_get_class(ChardevBackendKind_str(backend->type), errp);
+    if (!cc_new) {
+        return NULL;
+    }
+
     be = chr->be;
     if (!be) {
         /* easy case */
-        object_unparent(OBJECT(chr));
-        return qmp_chardev_add(id, backend, errp);
+        chr_new = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_new)),
+                              backend, NULL, false, errp);
+        if (!chr_new) {
+            return NULL;
+        }
+
+        goto out;
     }
 
     if (!be->chr_be_change) {
@@ -1101,12 +1118,6 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
         return NULL;
     }
 
-    cc = CHARDEV_GET_CLASS(chr);
-    cc_new = char_get_class(ChardevBackendKind_str(backend->type), errp);
-    if (!cc_new) {
-        return NULL;
-    }
-
     /*
      * The new chardev should not register a yank instance if the current
      * chardev has registered one already.
@@ -1147,18 +1158,9 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
      */
     chr->handover_yank_instance = handover_yank_instance;
 
+out:
     object_unparent(OBJECT(chr));
-    object_property_add_child(get_chardevs_root(), chr_new->label,
-                              OBJECT(chr_new));
-    object_unref(OBJECT(chr_new));
-
-    ret = g_new0(ChardevReturn, 1);
-    if (CHARDEV_IS_PTY(chr_new)) {
-        ret->pty = g_strdup(chr_new->filename + 4);
-        ret->has_pty = true;
-    }
-
-    return ret;
+    return chardev_add(id, chr_new, errp);
 }
 
 void qmp_chardev_remove(const char *id, Error **errp)
-- 
2.25.1


