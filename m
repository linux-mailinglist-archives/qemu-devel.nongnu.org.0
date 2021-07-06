Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C867F3BC95A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:17:25 +0200 (CEST)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i8q-0000ik-Ow
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hto-0000bo-7g
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hti-0002DV-Pi
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1268444wmh.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqkpOzXNDVoioE/wzcKHpmpI16VQA1KtqPlT6A2EvBI=;
 b=Q6PYb1UH/xRmXdZ9EuaLHe1tMHgm6hooCUsJ2NsqgLpDFPvPK169OgWOm4s4up0iuD
 BGK8Nl26eIT8a2zh0QEpQ8SoqX0F07dzd9bL2HN5LZHXjHZ7S9NAGRnXfPd4Z6o0Ur7N
 5ftiU3ECwizikcjG8YjwoLNCsIfMKonWCNEMvOJbNftp18L26foIn2BG1XbH3B3EqLA9
 2Z7rmBeqJScWw9pQLC9b9Hsyr+xZExVHIdRgcv1d8j8sU3DOockI/+bXwWZCC2yC399w
 ktWVIf/AMA7qCev2L9h0qtGozx3s6ZqkMQ6puuAnXVRf1mWdv7pN6D8app6L0MZlLF08
 D/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xqkpOzXNDVoioE/wzcKHpmpI16VQA1KtqPlT6A2EvBI=;
 b=VBNF7v4CBiySk+6qdc5QuI+J/3A32oVzggFKJmMayuu4gGzwYsm5ctjDrxmZHO6yyb
 KLZAtQmbB6PwdWhimBUjTcIhehgfKUfZ7UfxorHo3+/XxLjoJAVTmqSoGH/W2RUKRbkB
 iUZy/A73+Go/Zwti6xuVGhzj2u3ful6ax4hTP1PxtZAl9aYilH4ESfWB88Ka/O+NVl1I
 k4hNCtVBiSq1PTb8d35b5UkJCoD3mN751WMaLs+pBzuQRtVMEVZ1ZD2tWFqZZQ5vpBF2
 kKSuyF08lhEaHppSQquiHIPSK3bueZ4vQb3Urn6MqHKxPfgUh0yzWgBwnHj6T5WDZG33
 XVyA==
X-Gm-Message-State: AOAM533YlNuX5yQAfWm0T72o/sn3j+fVQIhUB2Ley+J60wxjj+4bjIy1
 dWbbeEBChi6OZ3MsINRQZA/ysp4nPBI=
X-Google-Smtp-Source: ABdhPJwyhqXY+ZYmdKAa7Kl/oQfvmmfl7s0hsbcpzUReRqm/p2zbfb4a1KQUSQu0tZHUgGQ8wpEYDA==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr3762183wme.43.1625565705528; 
 Tue, 06 Jul 2021 03:01:45 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/40] ui: Mark the '-no-quit' option as deprecated
Date: Tue,  6 Jul 2021 12:01:05 +0200
Message-Id: <20210706100141.303960-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

It's just a wrapper around the -display ...,window-close=off parameter,
and the name "no-quit" is rather confusing compared to "window-close"
(since there are still other means to quit the emulator), so we should
rather tell our users to use the "window-close" parameter instead.

While we're at it, update the documentation to state that
"-no-quit" is available for GTK, too, not only for SDL.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210630163231.467987-4-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 qemu-options.hx            | 5 +++--
 softmmu/vl.c               | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bb624d3170..70e08baff6 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -132,6 +132,12 @@ specified.
 Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
 an underscore between "window" and "close").
 
+``-no-quit`` (since 6.1)
+''''''''''''''''''''''''
+
+The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
+should be used instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index ae56fa4f28..c862f1fa57 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1910,10 +1910,11 @@ SRST
 ERST
 
 DEF("no-quit", 0, QEMU_OPTION_no_quit,
-    "-no-quit        disable SDL window close capability\n", QEMU_ARCH_ALL)
+    "-no-quit        disable SDL/GTK window close capability (deprecated)\n", QEMU_ARCH_ALL)
 SRST
 ``-no-quit``
-    Disable SDL window close capability.
+    Disable window close capability (SDL and GTK only). This option is
+    deprecated, please use ``-display ...,window-close=off`` instead.
 ERST
 
 DEF("sdl", 0, QEMU_OPTION_sdl,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 36b761677d..7dd2d72d0b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3237,6 +3237,8 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_quit:
                 dpy.has_window_close = true;
                 dpy.window_close = false;
+                warn_report("-no-quit is deprecated, please use "
+                            "-display ...,window-close=off instead.");
                 break;
             case QEMU_OPTION_sdl:
 #ifdef CONFIG_SDL
-- 
2.31.1



