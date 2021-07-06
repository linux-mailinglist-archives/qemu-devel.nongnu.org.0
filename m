Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE93BDDEE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:18:16 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0qaF-000560-TL
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m0qXQ-00031d-6B
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:15:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m0qXO-0003vu-6R
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:15:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id p8so251025wrr.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhEYnp3bVi89arzNzlyGinB4KyibAFhtXkK1ythb5+I=;
 b=ZwBylfXQLnIfYzKV24KEqNqtYl4Rj1eVfGMxqlK9sckRnkfvEHXXinvl+4TSnxsUdb
 Pm/ezoHThjiR9Q1QeA6wsmvKzZEo50qNajCtQXUrh1QcCXaMJVpRBtZkqFlImK2Sq1bC
 DjdgRCXOLsoryR+p/HT70TAf9JcZcU0AnDvl9L6qADG8OjQNWwz8fNOrbdpqhMP6H4YD
 o0VGwY4fhFH9pUhK0rNSdnvj9KMcT4hWCRH2cJAVe2fQdT+kZjCOmvrLxXc6nIKhgVz4
 TaImA5cWrp7jLDTmYCfVLQcc49shCjoKIvSvodecLeXWXXx/1lN/wdy6zpAhgSylWtDt
 iSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhEYnp3bVi89arzNzlyGinB4KyibAFhtXkK1ythb5+I=;
 b=S8+MKRDe9uboBEeBKvYtmzLycO+VLdezR6/CVisf1JF+SinN4VqntT/RyHcJUPwbTo
 Wu0dT3pmTjSg6dvmWNvlZcDQ3LR+o6laFu9rvcw3/wz4AD+If9clynmtgXDZlymHkGkl
 2tjtRO55gbiUsWtNc2xYB7arI55MIlA5AlDjhZrwslMH2CRgKnc9xlq0kVIgb2KV0wS0
 kuVj4NdrabLkGKThLge00yvD8M7gmIHN0qgsAQlx5qWHj2Tu6b3/gtKOOoa57OX/QoIx
 d0owHc/LHlNsqzG4ApE9W8mZ1vE2T4LWj7Vxbln4lAo357BAFKDG/bou+De4OdUqaf6c
 X91Q==
X-Gm-Message-State: AOAM531BstGf9UBG8HgjUudqwzL1WjYH2wE03CL6oLxcpO3XevCx0CZC
 +u36oA0+QBPmR5Qi+/6eZcY=
X-Google-Smtp-Source: ABdhPJytF6jc9ZQuZfNB5M32Dy+17fQkXxBNNYqz/Hch7DSw/ZvVO2btEy86xEOC7R0Zby4sovYAUQ==
X-Received: by 2002:a5d:548a:: with SMTP id h10mr23208721wrv.273.1625598915255; 
 Tue, 06 Jul 2021 12:15:15 -0700 (PDT)
Received: from lb01556.speedport.ip
 (p200300f11706da9e87913749ebbd0132.dip0.t-ipconnect.de.
 [2003:f1:1706:da9e:8791:3749:ebbd:132])
 by smtp.gmail.com with ESMTPSA id p3sm3791522wmq.17.2021.07.06.12.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 12:15:14 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
X-Google-Original-From: Li Zhang <li.zhang@ionos.com>
To: armbru@redhat.com, marcandre.lureau@gmail.com,
 pankaj.gupta.linux@gmail.com, qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] chardev: refactor qmp_chardev_add and
 qmp_chardev_change
Date: Tue,  6 Jul 2021 21:14:52 +0200
Message-Id: <20210706191452.127893-2-li.zhang@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706191452.127893-1-li.zhang@ionos.com>
References: <20210706191452.127893-1-li.zhang@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=zhlcindy@gmail.com; helo=mail-wr1-x42f.google.com
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

To improve the problematic source code as Markus mentioned
before and some redundant source code, it is refactored
in the functions qmp_chardev_add and qmp_chardev_change.
https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg03167.html

Signed-off-by: Li Zhang <li.zhang@ionos.com>
---
 chardev/char.c | 72 ++++++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index d959eec522..da23e1bd71 100644
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
@@ -1078,6 +1084,12 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
         return NULL;
     }
 
+    cc = CHARDEV_GET_CLASS(chr);
+    cc_new = char_get_class(ChardevBackendKind_str(backend->type), errp);
+    if (!cc_new) {
+        return NULL;
+    }
+
     if (CHARDEV_IS_MUX(chr)) {
         error_setg(errp, "Mux device hotswap not supported yet");
         return NULL;
@@ -1092,8 +1104,13 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
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


