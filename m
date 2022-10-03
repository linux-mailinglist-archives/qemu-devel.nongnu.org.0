Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1B5F363D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 21:23:42 +0200 (CEST)
Received: from localhost ([::1]:55686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofR2S-0004MM-NS
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 15:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ofQuT-0001KF-CR
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 15:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ofQuJ-0001Xy-VY
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 15:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664824513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdsHMeaBA+VOgYj3fOm19AtmfykyTnZmp2/00Yysd8s=;
 b=USABrAI8UirDHs7RMMt58R/LCSgl+unC9CcwAqB5kQlDXXtckuVUthmapoGnnhwg64XpOT
 wwCoS1x25wuiF4ELf9H4nI8q79dDQI3kML+Zmre5kOdg3PNgtoTTUcbtmZTXAyMPY50Ilp
 5TqXSKjUzZ+kM5irULoPczdubPMxYfw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-UMFhuuYtNoOJTTuw0PrdKg-1; Mon, 03 Oct 2022 15:15:11 -0400
X-MC-Unique: UMFhuuYtNoOJTTuw0PrdKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so6684402wma.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 12:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QdsHMeaBA+VOgYj3fOm19AtmfykyTnZmp2/00Yysd8s=;
 b=Y8byvR8N0QE3vvYUE9MHCQGoBkoQqKfgkFzsZUeeMrowuQadAWP5mMMPVfxjStjnR4
 lRBgUtPAlnxN9brcxgzKP9Pw329pNl/BRfcAYG9rjIQVOd9geWeQ/mzVNBFhMTC/IN+H
 +QLqEMphtPcUDGU318yGyAHlZPqgd54JrLy/fnYyyqyy2sToWTI5QLeY+HJBBdMsMwvB
 +U0cFdXFgm2NAuMnXy10+9gyQjfv2ejLlQlaJRghpty8FDp2ZEkuGSeY97DWoBkRE5Ub
 HtS5wAwdbgs2CpotUHoCRlNcwrsV1I27MGv3a1yC+xmB+rYZg76wPltLSTZp7/NoYYzM
 jLBA==
X-Gm-Message-State: ACrzQf3u0Wc0Ar2QTZZbhdMEFoc4gjcniwoN9TF2xaDKktcW+kta/bBC
 9JM9uVZIp/RlZ/1wXmsZ/AGmsGkeuHDaJS4DiNO0jEwedl8aEeBB4M3G2JX3NqBnvEUotxj5htN
 Voli43WbVzgmjEi14hnMuGEAtXxN2Q/IlpuOOIY56Or3ewx7lblP+zSrVi/kY1XDqYsw=
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id
 y12-20020adfe6cc000000b0022ce0b9ef60mr11034212wrm.404.1664824510344; 
 Mon, 03 Oct 2022 12:15:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PdKxSB61ktu8W7a17Z+q2Y8RAW4pRIwCCilVjnCBUHd3apQq5uf7ZTa2dRb2aIxNi5PptWw==
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id
 y12-20020adfe6cc000000b0022ce0b9ef60mr11034203wrm.404.1664824510027; 
 Mon, 03 Oct 2022 12:15:10 -0700 (PDT)
Received: from avogadro.local ([66.187.232.65])
 by smtp.gmail.com with ESMTPSA id
 bt4-20020a056000080400b0022cd96b3ba6sm13608392wrb.90.2022.10.03.12.15.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 12:15:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] meson: -display dbus and CFI are incompatible
Date: Mon,  3 Oct 2022 21:15:04 +0200
Message-Id: <20221003191504.203181-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003191504.203181-1-pbonzini@redhat.com>
References: <20221003191504.203181-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The generated skeletons for DBus call the finalize method of the parent
type using code like

    G_OBJECT_CLASS (qemu_dbus_display1_chardev_skeleton_parent_class)->finalize (object);

However, the finalize method is defined in a shared library that is not
compiled with CFI.  Do not enable anything that uses gdbus-codegen if
--enable-cfi was specified.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3885fc1076..ca47ecbffe 100644
--- a/meson.build
+++ b/meson.build
@@ -487,6 +487,7 @@ meson.override_dependency('glib-2.0', glib)
 
 gio = not_found
 gdbus_codegen = not_found
+gdbus_codegen_error = '@0@ requires gdbus-codegen, please install libgio'
 if not get_option('gio').auto() or have_system
   gio = dependency('gio-2.0', required: get_option('gio'),
                    method: 'pkg-config', kwargs: static_kwargs)
@@ -511,6 +512,10 @@ if not get_option('gio').auto() or have_system
                              version: gio.version())
   endif
 endif
+if gdbus_codegen.found() and get_option('cfi')
+  gdbus_codegen = not_found
+  gdbus_codegen_error = '@0@ uses gdbus-codegen, which does not support control flow integrity'
+endif
 
 lttng = not_found
 if 'ust' in get_option('trace_backends')
@@ -1676,7 +1681,7 @@ dbus_display = get_option('dbus_display') \
   .require(enable_modules,
            error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
-           error_message: '-display dbus requires gdbus-codegen') \
+           error_message: gdbus_codegen_error.format('-display dbus')) \
   .require(opengl.found() and gbm.found(),
            error_message: '-display dbus requires epoxy/egl and gbm') \
   .allowed()
-- 
2.37.3


