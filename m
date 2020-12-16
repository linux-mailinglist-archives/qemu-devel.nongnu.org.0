Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDAE2DC4A4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:52:37 +0100 (CET)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa2W-0003jM-Ru
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyg-0007v2-Vz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:39 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZye-0002OP-Rk
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id n16so2306616wmc.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+yVXnhCi8nxgBbuZe7LUforhT3RhLUfoY188yCYeYY=;
 b=AAGBPu8+fj3ei0DyCd0pxkqVXTvxDFghQtDTc5jdlVcW2iPIgWX4HgUKg2eyA5EXvd
 trKcGjdJ/RkwPWLTD7DjnYl0BNHZg7k7pq9xyvL7ZK9VKBkFOVAed4kcoxx7uK9xR06L
 eiOFQRfp9533JuhWBfqbRUwIABKVFCRyc6k9UO1lo+PXtuh2pCC6KTNlpLb1Lma7WTS6
 Ea5Z+aP/jZF7OB1esf3Na9bL9g7unhoH9+zD3+WYMmtpuYA0oJGYhP6Ihy34vd+kbxSk
 gMtLFlRI2u5XBtYIM8LDhExlb0xM9fxkOC2hIJDk3L91EP4PsohVK5NJJ+9u4DHxWK5A
 ItRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+yVXnhCi8nxgBbuZe7LUforhT3RhLUfoY188yCYeYY=;
 b=U6kpSmy4zS3nyGk2xOQXyo518toc9lGJozpUu8JrCOTUqoOPoQJVBMvjExd4qpLqSJ
 haJYtuUJqISRI93qCorOeRNyCoz+jTMU60g8u72t8U6GowEb1EVqL+Oq/Faecd3LeUFr
 yckhexxIEmeClirCFDujG4SjNjyWAcdhEXa65/UNvsSUqOJIXkt+sKmS2s7pDP+E/Y6p
 iRrQ9cAqMTGbPdFt0ncKkaEm2ILFnvLoC8tqBIC1yy8lRxeN7fWEaRovxMA0rZEEBTfS
 3E/pbXRNm7frNtwJBK8nV04/KF0FrgrYThB7vnTt8BJSxXg6YyaFO6E1VTBAiwqs/cCk
 VXag==
X-Gm-Message-State: AOAM530SBk2egrUVU/PryC/1f3TWECcv8MKYJ+8dyhBwD50uVEYzKXRO
 kIlpJtm1YGiH0Q4bljCxMo/T9Q==
X-Google-Smtp-Source: ABdhPJw5/htfREhxJeU1+dpEHTxnIyIphikyBhUOwyCXYZy+pgKCkeP+I9362rsP6l8HIW7NfI05wg==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr4295012wmd.118.1608137314804; 
 Wed, 16 Dec 2020 08:48:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm3498238wmc.13.2020.12.16.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2BA3A1FF8F;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/11] configure: move gettext detection to meson.build
Date: Wed, 16 Dec 2020 16:48:19 +0000
Message-Id: <20201216164827.24457-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow meson to honour -Dauto_features=disabled later.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201210190417.31673-4-alex.bennee@linaro.org>

diff --git a/configure b/configure
index d37ec98aa9..f9b1e4fbb0 100755
--- a/configure
+++ b/configure
@@ -448,7 +448,7 @@ libdaxctl=""
 meson=""
 ninja=""
 skip_meson=no
-gettext=""
+gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
 
@@ -1016,9 +1016,9 @@ for opt do
   ;;
   --enable-vnc) vnc="enabled"
   ;;
-  --disable-gettext) gettext="false"
+  --disable-gettext) gettext="disabled"
   ;;
-  --enable-gettext) gettext="true"
+  --enable-gettext) gettext="enabled"
   ;;
   --oss-lib=*) oss_lib="$optarg"
   ;;
@@ -2847,19 +2847,6 @@ if test "$xen_pci_passthrough" != "disabled"; then
   fi
 fi
 
-##########################################
-# gettext probe
-if test "$gettext" != "false" ; then
-  if has xgettext; then
-    gettext=true
-  else
-    if test "$gettext" = "true" ; then
-      feature_not_found "gettext" "Install xgettext binary"
-    fi
-    gettext=false
-  fi
-fi
-
 ##########################################
 # X11 probe
 if $pkg_config --exists "x11"; then
diff --git a/meson_options.txt b/meson_options.txt
index 74ac853548..f8f053b5c8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -9,7 +9,7 @@ option('sphinx_build', type : 'string', value : '',
 
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
-option('gettext', type : 'boolean', value : true,
+option('gettext', type : 'feature', value : 'auto',
        description: 'Localization of the GTK+ user interface')
 option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
diff --git a/po/meson.build b/po/meson.build
index 1387fd979a..a863f0575f 100644
--- a/po/meson.build
+++ b/po/meson.build
@@ -1,6 +1,6 @@
 i18n = import('i18n')
 
-if get_option('gettext')
+if find_program('xgettext', required: get_option('gettext')).found()
   i18n.gettext(meson.project_name(),
                args: '--msgid-bugs-address=qemu-devel@nongnu.org',
                preset: 'glib')
-- 
2.20.1


