Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA2571AD6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:08:02 +0200 (CEST)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFcP-0002SL-8W
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLQ-0003Af-5u
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLN-0001U1-EQ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mYAXtu9QqChUwSoBVw/A2QmHhKrw9riHG3v6wKjbGo=;
 b=ZFjtF9eMH4iXg/hW6aZpciMuhXhHhOVpvhm6S9SkrLU2KfPcdCyOU0GGhT9G86PVQTk4Uf
 zMGtIKJ9zVLRF/Z3cUqAVkDUGKU44MFjFW3lpRcJAccrzmnqaOhRj+8hA4OJFbBxewGdx/
 mT4VQMqIl0/RHG3GgRfq+rEo3wjuTq4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-KquNBRq8PWiz4M-qBg5nXw-1; Tue, 12 Jul 2022 08:50:23 -0400
X-MC-Unique: KquNBRq8PWiz4M-qBg5nXw-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb28-20020a1709077e9c00b0072af6ccc1aeso2238243ejc.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mYAXtu9QqChUwSoBVw/A2QmHhKrw9riHG3v6wKjbGo=;
 b=XD73HsMWoiXGE6KT9PBooeuEl1DgVvtxFPmJRjT7Dc8T3HfGK8+hqHaY2E7NbCgW4l
 zxm+RO8q3dl6+HoOGypAgdOiv0hFLM/2zxSfVSPK5qTcaifSZZEUnoEqdmn6X75tTP6L
 ricm4q+lAfRvzd1NjZ2Z9jQD1xETUMybFKErtR3H4xkSKXmvvciORLZSc8/aIOzAkZ39
 Ai3h/AR2nNj36nQVQBqHi6vG+sp23KOP01iXd5w1si59ktbLe16J1TFN/cQbYKMSuUCC
 sJ5HWbsfK1nJUclec9QlH85iNdzXdK0t8PSBCQrYO5qxO6InI8snFNCc7Be5kKuzf862
 cn9Q==
X-Gm-Message-State: AJIora+K+IqwaJEpnWGn5JnW80qDnZ+sipNMZ8Un8VcHzertps34Euzf
 5r9499cpGXM+LJItk2lKMcPhByjAvKPamMpGlRuqrqlrQ/k+9xR6L8xTH9IPHfCxXIPjwX7hXsa
 bcYtI20sDmQV7CoUBhQTjemu0NG3XXrirAzShLYOE+V+EfU/5E1UQBnG6smf85aCCTpI=
X-Received: by 2002:a17:907:1c12:b0:72b:4a03:2290 with SMTP id
 nc18-20020a1709071c1200b0072b4a032290mr13631200ejc.163.1657630221482; 
 Tue, 12 Jul 2022 05:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMptqa0O5Z0T/1yIKRWTyd/rfyf/a793pjiBZDIq5SqCbov+fw29LSr1GRExV5eVEXGRn1Zg==
X-Received: by 2002:a17:907:1c12:b0:72b:4a03:2290 with SMTP id
 nc18-20020a1709071c1200b0072b4a032290mr13631184ejc.163.1657630221257; 
 Tue, 12 Jul 2022 05:50:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa7d841000000b0043a2b8ab377sm6014984eds.88.2022.07.12.05.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 14/18] audio/dbus: fix building
Date: Tue, 12 Jul 2022 14:49:52 +0200
Message-Id: <20220712124956.150451-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Commit c9c847481 broken dbus audio module compilation with bad
'CONFIG_GIO' usage. Furthermore, it implied extra dependency on audio
module which aren't necessary.

The problem was that 'dbus_display' is not correctly automatically set
on MacOS, because opengl dependency wasn't taken into account.

Fixes: c9c847481 ("audio/dbus: Fix building with modules on macOS")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220622154918.560870-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/meson.build | 2 +-
 meson.build       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/audio/meson.build b/audio/meson.build
index 94dab16891..3abee90860 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -28,7 +28,7 @@ endforeach
 
 if dbus_display
     module_ss = ss.source_set()
-    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true: files('dbusaudio.c'))
+    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
     audio_modules += {'dbus': module_ss}
 endif
 
diff --git a/meson.build b/meson.build
index 013c694a49..ad92d288a6 100644
--- a/meson.build
+++ b/meson.build
@@ -1672,6 +1672,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
+  .require(opengl.found(),
+           error_message: '-display dbus requires epoxy/egl') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-- 
2.36.1



