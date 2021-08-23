Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00983F483D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:07:31 +0200 (CEST)
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6ra-0006IQ-VH
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6pN-00049o-5c
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:05:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6pH-00054v-58
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629713106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wfc/4Gz2Hjk+FPq0SDNJe+8m9GY+Hogbg+U7zMPUhXc=;
 b=D2MV/a1PD0YbZRjPiXrFUBDVvGBIrH76Mv2/Cn3ZsfZTEB6poYZDAV8YHzVuN2BN53AORy
 Lr69+frokmr4R41GufmN34hUTa3VP4RloMt13jwEVR54ZBKsB3EaUPJRijyukPI3ZVReGF
 LkEDSNF+fdH8RUh6FVfjqETKjzEsDdI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-DCqkG2gBNYCuttypFv68Jw-1; Mon, 23 Aug 2021 06:05:05 -0400
X-MC-Unique: DCqkG2gBNYCuttypFv68Jw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i204-20020a1c22d5000000b002e74466ad9bso2379325wmi.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wfc/4Gz2Hjk+FPq0SDNJe+8m9GY+Hogbg+U7zMPUhXc=;
 b=ZBY4tmlrfuLACeDB0rzF1g4Kk3tGisJdb5MwGuV4oWX0sTdxtTPvjc5SbGP1wFHeri
 63JezeoPQn1BuGjUDbhdi0fa298/zicLZ+Vx0Sgt+3n0Us9ZNTt/4HL3ugi+OrSHgFH8
 Jq1umHbO7kGoPpThgyFheFkHWTh22Q4rVWBLbPWGc6lDVUqgUV7XSdK+0z3tBSw5NO8m
 oMkayOZr67UNHCrbwwhkp6BaJXEmb6jVT4jsO4exNWBAyVoLH+PLaK0P0zsCJCnhnIOU
 Zi31c15gnKgruTzdB/qv7UYc6neyl6YSdN+D7uaXlJVCl3FOKtjrpP9tmOyZCbBm++ki
 DTUg==
X-Gm-Message-State: AOAM533IItLZXwuqXQE1W92H/kC8qXBCzf9jWaIgYVeJmLwKGB4qxoG0
 LffZTzYtYiSKGdx0xOSd2WCu7JnR+FIt3M4ZGoizL6vT3zsDK2DE8GM+Ji0EDnJJsskj+HWIcyf
 bD14sgqV8E7gidEJT7DY17sqM47KdRsk/vWuIgFoGv3Sj8NNIn7m9J/9YoheQXIVl
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr77266wrn.122.1629713104060;
 Mon, 23 Aug 2021 03:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTwrzVGPd0AsTzwGc+tS+6zMpBm9A8ymguDPudIDhmKaEke68cLC9EEidpdz2+/Ev45L4dyg==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr77245wrn.122.1629713103906;
 Mon, 23 Aug 2021 03:05:03 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y21sm2834538wmc.11.2021.08.23.03.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 03:05:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ui/console: Restrict udmabuf_fd() to Linux
Date: Mon, 23 Aug 2021 12:04:54 +0200
Message-Id: <20210823100454.615816-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823100454.615816-1-philmd@redhat.com>
References: <20210823100454.615816-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Maxim R ." <mrom06@ya.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/ui/console.h |  2 ++
 ui/udmabuf.c         | 11 -----------
 ui/meson.build       |  6 ++++--
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index b30b63976a5..3be21497a2e 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -471,7 +471,9 @@ bool vnc_display_reload_certs(const char *id,  Error **errp);
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
 
+#ifdef CONFIG_LINUX
 /* udmabuf.c */
 int udmabuf_fd(void);
+#endif
 
 #endif
diff --git a/ui/udmabuf.c b/ui/udmabuf.c
index 23abe1e7eb9..cebceb26100 100644
--- a/ui/udmabuf.c
+++ b/ui/udmabuf.c
@@ -8,8 +8,6 @@
 #include "qapi/error.h"
 #include "ui/console.h"
 
-#ifdef CONFIG_LINUX
-
 #include <fcntl.h>
 #include <sys/ioctl.h>
 
@@ -29,12 +27,3 @@ int udmabuf_fd(void)
     }
     return udmabuf;
 }
-
-#else
-
-int udmabuf_fd(void)
-{
-    return -1;
-}
-
-#endif
diff --git a/ui/meson.build b/ui/meson.build
index a3a187d633a..7d25c1b95b5 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -12,12 +12,14 @@
   'kbd-state.c',
   'keymaps.c',
   'qemu-pixman.c',
-  'udmabuf.c',
 ))
 softmmu_ss.add([spice_headers, files('spice-module.c')])
 softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
 
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
+softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files(
+  'input-linux.c',
+  'udmabuf.c',
+))
 softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
 
 vnc_ss = ss.source_set()
-- 
2.31.1


