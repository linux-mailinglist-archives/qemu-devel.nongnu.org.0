Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231CD97D1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 18:46:41 +0200 (CEST)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKmRZ-0007MR-M1
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 12:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36145)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3Y0inXQYKCoQ0iumqlowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--sameid.bounces.google.com>)
 id 1iKmNO-00048j-Ps
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3Y0inXQYKCoQ0iumqlowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--sameid.bounces.google.com>)
 id 1iKmNM-0006EG-LT
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:42:18 -0400
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a]:56536)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3Y0inXQYKCoQ0iumqlowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--sameid.bounces.google.com>)
 id 1iKmNK-0006Cb-Ke
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:42:15 -0400
Received: by mail-wr1-x44a.google.com with SMTP id s9so670171wrw.23
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Ba0ot1Tvsw4OGWynORYQWoMJh7SexhFWRbqwWG1oZNw=;
 b=A6PKUWsaQA7/TMzHltBbx9fkWsa8+71MiKRL5pFDVdgPpPq3kY+4/1Pi6L96IAWRDX
 lQZjKF073fVt6Wr8jju0W/iA1bqh2xVSgON1nUcCaMlhzmLC8ID+wFa9bmjcxcZHLFQg
 C2IVCr4WnEhf1K+lRjsrPXAdWJZpsw5u3EaZVsOaA6V5RjBcUASIwTW4HtQukhENZyrT
 0z+33urIivKXn5wPBh/RIpqxkpDB9dSGYIuY/3f/FAM82GQTcahOgQInkmmt+jQ5Pl6g
 uzrwgCauAP3z7kL9d1gqx8RI4YdJyXndiJTuOvtrYb2snRDTwZcRyKZMw8yQEVK+JPYo
 Zk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Ba0ot1Tvsw4OGWynORYQWoMJh7SexhFWRbqwWG1oZNw=;
 b=AbvVSBuST3SZJdumGsSSFomS20Io6SzC0vqcQS4ovbXqgvEE5PupVrLr3cisAKTEk0
 UFj9kHVUYXuBZsLl/79VJjpwWH9dvzw3SM8tTYPm7HLhOGuBzCT2smSk58b1e4G3waiB
 /kWV0KWyh758aEvaL3oWJEq71PoQqXSi/R1K+zG05NB6myqvph8YQZUMe7NLtWRJsxEU
 jKHLF8rLsjTK7oS910c/69bCciQZt5xUappIuP1W/+RY0kEZ8zHRlQQ4EUbqrjrDe1Rl
 wFgUwQJzFvY9ANH1TnD71nX09Q3GuF9Th83NcXguEYJzehEQezrEP3OYpLy1pMrzWhlv
 7zzA==
X-Gm-Message-State: APjAAAWbnU3MOkCtSojrm2eEbf7uWn4Sa8Ieu8Fb7oEixp81b2AiQBxx
 VzpHt9AgNRnEFgL43MzHo3LEoTK1BpZ120bhH5A0T6naitiDhhmlxMZYYQC1exqYEqRGeusPdOn
 Uyi18jeg2b2pjfAKCDjmQ1RlkbPv4D4IWAScWm7xU+RStnDN5Xl+l3z30iVSo
X-Google-Smtp-Source: APXvYqxjPOQ8OnAxBxoyfr61OmkNdNf0QPzoUpya4jxl5gOSh9eA3YLVY3k1IfzgnRLfTQMan9vt2FtVEck=
X-Received: by 2002:a5d:6685:: with SMTP id l5mr3412366wru.44.1571244131837;
 Wed, 16 Oct 2019 09:42:11 -0700 (PDT)
Date: Wed, 16 Oct 2019 19:41:40 +0300
In-Reply-To: <20191016164145.115898-1-sameid@google.com>
Message-Id: <20191016164145.115898-5-sameid@google.com>
Mime-Version: 1.0
References: <20191016164145.115898-1-sameid@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH v8 3/8] bootdevice: Add interface to gather LCHS
From: Sam Eiderman <sameid@google.com>
To: qemu-devel@nongnu.org
Cc: arbel.moshe@oracle.com, karl.heubaum@oracle.com, kevin@koconnor.net, 
 kraxel@redhat.com, kwolf@redhat.com, liran.alon@oracle.com, 
 qemu-block@nongnu.org, sameid@google.com, seabios@seabios.org, 
 lersek@redhat.com, philmd@redhat.com, jsnow@redhat.com, 
 Sam Eiderman <shmuel.eiderman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::44a
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

From: Sam Eiderman <shmuel.eiderman@oracle.com>

Add an interface to provide direct logical CHS values for boot devices.
We will use this interface in the next commits.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
Signed-off-by: Sam Eiderman <sameid@google.com>
---
 bootdevice.c            | 55 +++++++++++++++++++++++++++++++++++++++++
 include/sysemu/sysemu.h |  3 +++
 2 files changed, 58 insertions(+)

diff --git a/bootdevice.c b/bootdevice.c
index 1d225202f9..bc5e1c2de4 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -343,3 +343,58 @@ void device_add_bootindex_property(Object *obj, int32_t *bootindex,
     /* initialize devices' bootindex property to -1 */
     object_property_set_int(obj, -1, name, NULL);
 }
+
+typedef struct FWLCHSEntry FWLCHSEntry;
+
+struct FWLCHSEntry {
+    QTAILQ_ENTRY(FWLCHSEntry) link;
+    DeviceState *dev;
+    char *suffix;
+    uint32_t lcyls;
+    uint32_t lheads;
+    uint32_t lsecs;
+};
+
+static QTAILQ_HEAD(, FWLCHSEntry) fw_lchs =
+    QTAILQ_HEAD_INITIALIZER(fw_lchs);
+
+void add_boot_device_lchs(DeviceState *dev, const char *suffix,
+                          uint32_t lcyls, uint32_t lheads, uint32_t lsecs)
+{
+    FWLCHSEntry *node;
+
+    if (!lcyls && !lheads && !lsecs) {
+        return;
+    }
+
+    assert(dev != NULL || suffix != NULL);
+
+    node = g_malloc0(sizeof(FWLCHSEntry));
+    node->suffix = g_strdup(suffix);
+    node->dev = dev;
+    node->lcyls = lcyls;
+    node->lheads = lheads;
+    node->lsecs = lsecs;
+
+    QTAILQ_INSERT_TAIL(&fw_lchs, node, link);
+}
+
+void del_boot_device_lchs(DeviceState *dev, const char *suffix)
+{
+    FWLCHSEntry *i;
+
+    if (dev == NULL) {
+        return;
+    }
+
+    QTAILQ_FOREACH(i, &fw_lchs, link) {
+        if ((!suffix || !g_strcmp0(i->suffix, suffix)) &&
+             i->dev == dev) {
+            QTAILQ_REMOVE(&fw_lchs, i, link);
+            g_free(i->suffix);
+            g_free(i);
+
+            break;
+        }
+    }
+}
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 44f18eb739..5bc5c79cbc 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -103,6 +103,9 @@ void device_add_bootindex_property(Object *obj, int32_t *bootindex,
                                    DeviceState *dev, Error **errp);
 void restore_boot_order(void *opaque);
 void validate_bootdevices(const char *devices, Error **errp);
+void add_boot_device_lchs(DeviceState *dev, const char *suffix,
+                          uint32_t lcyls, uint32_t lheads, uint32_t lsecs);
+void del_boot_device_lchs(DeviceState *dev, const char *suffix);
 
 /* handler to set the boot_device order for a specific type of MachineClass */
 typedef void QEMUBootSetHandler(void *opaque, const char *boot_order,
-- 
2.23.0.700.g56cf767bdb-goog


