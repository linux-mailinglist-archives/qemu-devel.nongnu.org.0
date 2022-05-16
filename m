Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A5528B9B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:09:01 +0200 (CEST)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeDM-0001TK-Lx
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5O-0002mZ-2K
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5M-0003Pk-5I
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGv5/EkpBsBjxHEyqHZKoaua2z/A6zRcNcv8CTFdhh0=;
 b=Kjf2/CE2JYF18tTjaQBBZmlvUHYI6fG8AGqev7Gha5DY9FYQ4Ng43C/OMSzzHtfCDSMKB6
 BdtWxQdrv6D0ZooxB86vR/s83vLEyUVS/qYCwQbcYRIVmerzF6EHAzgHhIxmKQW5G3Szog
 mfWEjbKi0szjUdSm559nTNO7jWDP8WE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-eHtO-123ND-WOfOn4p9B-Q-1; Mon, 16 May 2022 11:56:38 -0400
X-MC-Unique: eHtO-123ND-WOfOn4p9B-Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 n9-20020aa7d049000000b0042aab725949so2944058edo.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGv5/EkpBsBjxHEyqHZKoaua2z/A6zRcNcv8CTFdhh0=;
 b=wSGdz/pWXok1M7vTzB7YghwK4Eprnzmz4mJRTWDeXwQAp76VhTXakJC4ifp1HdH7B3
 dMShcus0hKeoTmO5qv60emiqm9DSRiDzO+GEiAvmORsUtTIHXvmwAy40JZZmNAs1ORvp
 fkbreCcHiLKg4qjk8Dhlk2Vedu8IxR/sxOkEdj1qbjox9H0t8quL0Dzm2u+ZxKZJSzuA
 XZVVwlpUcts9eMwNehauJibspa1meBdZgSmGKlu6Q5kZBLYfAX+xM1EXrd4t7oBJqHrs
 cfK0Aq4ldevvcl5FHO1Grf2fl9fzAXNXtTs54saXrp3goT4ftms/Jb9M2QNBbKiwDGpa
 zAmQ==
X-Gm-Message-State: AOAM53093rng5elFaG8epFbHiT4KdJyGo1ulKmYWg7x8qo0X+YSQJxKY
 idAk5B/q4p1dXhXI1cR7V6H7Mr09ddNswNr/uWjLrviAHYX0gaSNbJMJeilwIVKfAk2s8/wPZ1a
 aNUAbnNSnGLKJjgtI7yJ2YkQrA0H5T4tFNCZY8OxS4DzbhXaBpMkr2LFKNX2tTyGHTEI=
X-Received: by 2002:a17:906:1845:b0:6f4:346f:f767 with SMTP id
 w5-20020a170906184500b006f4346ff767mr15431328eje.214.1652716596702; 
 Mon, 16 May 2022 08:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoMgs3lY2aI9VzA2v+aU598y3YQCUXGmlKRxz8iwPgIZOrg1tdHSK3B+wsJZqNdhIKU5+q/g==
X-Received: by 2002:a17:906:1845:b0:6f4:346f:f767 with SMTP id
 w5-20020a170906184500b006f4346ff767mr15431307eje.214.1652716596331; 
 Mon, 16 May 2022 08:56:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170906778700b006f3ef214ddfsm50070ejm.69.2022.05.16.08.56.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] soundhw: remove ability to create multiple soundcards
Date: Mon, 16 May 2022 17:55:56 +0200
Message-Id: <20220516155603.1234712-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The usefulness of enabling a dozen soundcards is dubious.  Simplify the
code by allowing a single instance of -soundhw, with no support for
parsing either comma-separated values or 'soundhw all'.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c | 88 +++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 56 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index f7d94d7dfa..097501fee1 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -25,6 +25,7 @@
 #include "qemu/option.h"
 #include "qemu/help_option.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 #include "qom/object.h"
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
@@ -34,7 +35,6 @@ struct soundhw {
     const char *name;
     const char *descr;
     const char *typename;
-    int enabled;
     int isa;
     int (*init_pci) (PCIBus *bus);
 };
@@ -64,10 +64,16 @@ void deprecated_register_soundhw(const char *name, const char *descr,
     soundhw_count++;
 }
 
+static struct soundhw *selected = NULL;
+
 void select_soundhw(const char *optarg)
 {
     struct soundhw *c;
 
+    if (selected) {
+        error_setg(&error_fatal, "only one -soundhw option is allowed");
+    }
+
     if (is_help_option(optarg)) {
     show_valid_cards:
 
@@ -84,44 +90,15 @@ void select_soundhw(const char *optarg)
         exit(!is_help_option(optarg));
     }
     else {
-        size_t l;
-        const char *p;
-        char *e;
-        int bad_card = 0;
-
-        if (!strcmp(optarg, "all")) {
-            for (c = soundhw; c->name; ++c) {
-                c->enabled = 1;
+        for (c = soundhw; c->name; ++c) {
+            if (g_str_equal(c->name, optarg)) {
+                selected = c;
+                break;
             }
-            return;
         }
 
-        p = optarg;
-        while (*p) {
-            e = strchr(p, ',');
-            l = !e ? strlen(p) : (size_t) (e - p);
-
-            for (c = soundhw; c->name; ++c) {
-                if (!strncmp(c->name, p, l) && !c->name[l]) {
-                    c->enabled = 1;
-                    break;
-                }
-            }
-
-            if (!c->name) {
-                if (l > 80) {
-                    error_report("Unknown sound card name (too big to show)");
-                }
-                else {
-                    error_report("Unknown sound card name `%.*s'",
-                                 (int) l, p);
-                }
-                bad_card = 1;
-            }
-            p += l + (e != NULL);
-        }
-
-        if (bad_card) {
+        if (!c->name) {
+            error_report("Unknown sound card name `%s'", optarg);
             goto show_valid_cards;
         }
     }
@@ -129,30 +106,29 @@ void select_soundhw(const char *optarg)
 
 void soundhw_init(void)
 {
-    struct soundhw *c;
+    struct soundhw *c = selected;
     ISABus *isa_bus = (ISABus *) object_resolve_path_type("", TYPE_ISA_BUS, NULL);
     PCIBus *pci_bus = (PCIBus *) object_resolve_path_type("", TYPE_PCI_BUS, NULL);
 
-    for (c = soundhw; c->name; ++c) {
-        if (c->enabled) {
-            if (c->typename) {
-                warn_report("'-soundhw %s' is deprecated, "
-                            "please use '-device %s' instead",
-                            c->name, c->typename);
-                if (c->isa) {
-                    isa_create_simple(isa_bus, c->typename);
-                } else {
-                    pci_create_simple(pci_bus, -1, c->typename);
-                }
-            } else {
-                assert(!c->isa);
-                if (!pci_bus) {
-                    error_report("PCI bus not available for %s", c->name);
-                    exit(1);
-                }
-                c->init_pci(pci_bus);
-            }
+    if (!c) {
+        return;
+    }
+    if (c->typename) {
+        warn_report("'-soundhw %s' is deprecated, "
+                    "please use '-device %s' instead",
+                    c->name, c->typename);
+        if (c->isa) {
+            isa_create_simple(isa_bus, c->typename);
+        } else {
+            pci_create_simple(pci_bus, -1, c->typename);
         }
+    } else {
+        assert(!c->isa);
+        if (!pci_bus) {
+            error_report("PCI bus not available for %s", c->name);
+            exit(1);
+        }
+        c->init_pci(pci_bus);
     }
 }
 
-- 
2.36.0


