Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1523C15F3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:28:53 +0200 (CEST)
Received: from localhost ([::1]:49308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VxM-0001Pr-OG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmv-0000JI-UR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vms-0008Bc-IZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:05 -0400
Received: by mail-ed1-x52d.google.com with SMTP id m1so9029722edq.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wYj5YTefSRdoj37jl3ThZ/+4Z0cAMsLDlt2VT97eGFM=;
 b=Z22uljZ4wzy/XemRYsOK1vIRQlHjqJrA+IV7vgn55TVkELB1z+/IWUl//1oGoiaTGh
 6BuKdUatxrHrRMv+odI1OC8WpXZ/XZXZZZxzfkbUvD6OL3AuTydUIMks1dV3N38ZD/c8
 mYXom+YT9QKu4dkuO27tHjvcllg7ChOLkU8CfLjNyA7NBUjvx8wt9zggowKZfTw0Ul0G
 LArrh1ZEaDakgMQyjWjPD4KCZUSHdo7Ub7nwarfIwE/Xcl7iP9dTYroHFdf+XSL/69XF
 oyR1qt0+Tf6Mqklw6U6rrmwUVkSVnJORC+0grMidoWPd4KBWyDdfVtforWbhLcGIxC0f
 t1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wYj5YTefSRdoj37jl3ThZ/+4Z0cAMsLDlt2VT97eGFM=;
 b=L411wQAyR4lgqiCAidVNnXGVYGe+9DKs2QUzIeTzSq6GvyTVan2Pqep07OjwBECgVd
 CVI++80QGHRbTxhfusTeKK/FLzgGJHdRFrd1KqkrxlU382PGJDAySsBF3DGSzRukCNOE
 BlWeqoUT4s7ouO6cNUZqR0B5YQt0ENBuaB11OMLwyucHKF6JbPAqvZpNlxD3J/dAlvyD
 krThAzPGTPshxnKebk6iKof2vI+0OVcwPmMkZvuI10cugZYAIGSCFaheK2ohIvCu9nbD
 22l1OrIshT14fwjNzqv8IuEM2a2nZbztp4MGjBCGpI6Kf6AW+JWGLYxGa+cf1og1Lg2E
 m14Q==
X-Gm-Message-State: AOAM530mKYDFsxmxmN0HSUudcwKlqYX83DjZbeqo+9tDh7kFTYwbNByR
 KqPjnGvMuBt0lI6OhrLa+XGLf7DNjOY=
X-Google-Smtp-Source: ABdhPJxphkravPuHbfYrvQeLT5dl5h4aO4exAKPqabboomeEdDlMagJ45e1rEyV9bvdVdq+8PZQUZA==
X-Received: by 2002:a05:6402:6:: with SMTP id
 d6mr26864673edu.236.1625757480456; 
 Thu, 08 Jul 2021 08:18:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/48] modules: add ui module annotations
Date: Thu,  8 Jul 2021 17:17:15 +0200
Message-Id: <20210708151748.408754-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-12-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/egl-headless.c | 4 ++++
 ui/gtk.c          | 4 ++++
 ui/sdl2.c         | 4 ++++
 ui/spice-app.c    | 3 +++
 ui/spice-core.c   | 5 +++++
 5 files changed, 20 insertions(+)

diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index da377a74af..75404e0e87 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -213,3 +213,7 @@ static void register_egl(void)
 }
 
 type_init(register_egl);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..376b4d528d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2333,3 +2333,7 @@ static void register_gtk(void)
 }
 
 type_init(register_gtk);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/ui/sdl2.c b/ui/sdl2.c
index a203cb0239..36d9010cb6 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -918,3 +918,7 @@ static void register_sdl1(void)
 }
 
 type_init(register_sdl1);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/ui/spice-app.c b/ui/spice-app.c
index 4325ac2d9c..641f4a9d53 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -221,3 +221,6 @@ static void register_spice_app(void)
 }
 
 type_init(register_spice_app);
+
+module_dep("ui-spice-core");
+module_dep("chardev-spice");
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 272d19b0c1..86d43783ac 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -1037,3 +1037,8 @@ static void spice_register_config(void)
     qemu_add_opts(&qemu_spice_opts);
 }
 opts_init(spice_register_config);
+module_opts("spice");
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
-- 
2.31.1



