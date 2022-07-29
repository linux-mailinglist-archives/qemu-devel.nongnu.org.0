Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB2F585211
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:07:46 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRab-0007ia-HA
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXo-0003cy-Sd
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXl-0005WF-Ho
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKem1gFTaYZEfwKiLIIk3p12yz13r44iWz46N1Yc1K4=;
 b=JOexsHrWzWaYReNvloxdProcymHWph+n7X3874ZCtIdOQhj/2ZEPXKH8bDROi1lx1qvdlo
 4lMoh2lgpUrvQGChOLWHuz5stVc9ZpbTL9yRHIjMliHZmFEOVnSMv3o5duX4mNMbioHICq
 zB0xybQNut9GrR4Er2u/Ez0plaGuxtg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-sgMBYId5ODe8LKVaAFANKA-1; Fri, 29 Jul 2022 11:04:45 -0400
X-MC-Unique: sgMBYId5ODe8LKVaAFANKA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso3124871ede.21
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKem1gFTaYZEfwKiLIIk3p12yz13r44iWz46N1Yc1K4=;
 b=0afvgbXMK+8/+b8g292PpA45Mfe59ssLiCyN9jYjImAy7VWwboeuXYb9Q53PINZjSC
 66R0a1AG/P31N1RlL8usiha9qW4GLxvXe2Q1k5q6cAVLuEbQrXYwBmf2xwW487bzYLG/
 TjYJ+0wb+VGv4SNEOo2pTAO6Qywb71zlGAjR9ixIf6nhc0yYENaPNTAN0QZbqFX8W68g
 46dkaYJDWmp1hQ/wGXgIKeg4if6zUqiticUUTpbSbOMUJxZ8dtrx6GV65wCp9IP2gF4z
 dTc/qUs1cqqOJM/unt4aJL6E1dp9jWb56ROsVKQ5xvSwET4aVYHBZHM0d49Lv13b6htk
 Ol/A==
X-Gm-Message-State: AJIora/bFHr25QXpDAUA8fHAIgbG6RA2bP/OtOepRqA1ohp4do/a3oJE
 B/0VRAhdgYxJIzMDJQF8claLXTT30dUfT6ZxH+p8/YPXufpyQSOCbBN8UJqLNAUtAqzbgB0rBzq
 YYHhLWrW7S1qSforfJhRCdW2bf73DBBVgVhKdtW+A7bBZZoHdfNUA3n1x1hKf1kVUJ3I=
X-Received: by 2002:a05:6402:2687:b0:43a:6025:1658 with SMTP id
 w7-20020a056402268700b0043a60251658mr3902508edd.271.1659107083543; 
 Fri, 29 Jul 2022 08:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLBTIwC0L1BJO0niVrYPzbs11JPcGz2eCbSDYUBwbLIpVCXHCHBTJZ6+abo8EPLVt/eHsgsw==
X-Received: by 2002:a05:6402:2687:b0:43a:6025:1658 with SMTP id
 w7-20020a056402268700b0043a60251658mr3902460edd.271.1659107082992; 
 Fri, 29 Jul 2022 08:04:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a50fc1a000000b0043cf1c6bb10sm2437134edr.25.2022.07.29.08.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/6] ui: dbus-display requires CONFIG_GBM
Date: Fri, 29 Jul 2022 17:04:33 +0200
Message-Id: <20220729150438.20293-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
References: <20220729150438.20293-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without CONFIG_GBM, compiling dbus-display fails with

../ui/dbus.c: In function ‘dbus_create_context’:
../ui/dbus.c:47:20: error: ‘qemu_egl_rn_ctx’ undeclared (first use in this function); did you mean ‘qemu_egl_init_ctx’?
   47 |                    qemu_egl_rn_ctx);
      |                    ^~~~~~~~~~~~~~~
      |                    qemu_egl_init_ctx
../ui/dbus.c:47:20: note: each undeclared identifier is reported only once for each function it appears in

and many other similar errors, because include/ui/egl-helpers.h only has
these declaration if gbm is found on the system.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1108
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build    | 4 ++--
 ui/meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 75aaca8462..294e9a8f32 100644
--- a/meson.build
+++ b/meson.build
@@ -1677,8 +1677,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
-  .require(opengl.found(),
-           error_message: '-display dbus requires epoxy/egl') \
+  .require(opengl.found() and gbm.found(),
+           error_message: '-display dbus requires epoxy/egl and gbm') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
diff --git a/ui/meson.build b/ui/meson.build
index e9f48c5315..ec13949776 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -81,7 +81,7 @@ if dbus_display
                                           '--interface-prefix', 'org.qemu.',
                                           '--c-namespace', 'QemuDBus',
                                           '--generate-c-code', '@BASENAME@'])
-  dbus_ss.add(when: [gio, pixman, opengl],
+  dbus_ss.add(when: [gio, pixman, opengl, gbm],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
-- 
2.36.1



