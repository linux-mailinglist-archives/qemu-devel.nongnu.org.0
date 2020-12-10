Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F592D660C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:12:08 +0100 (CET)
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRMF-0000CI-AG
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREu-0005X2-Is
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:32 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREr-0003RM-HS
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id a6so5588008wmc.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9WUJiJmld4s3sHaKN9tOH+lZYonDBgJUTA33cJhtVE=;
 b=FcnOWv9XJJO/IKf9yje/bGJPghtScCuGsyvX2XSl+hXuI7RXHQPS0+t5J9osdm70GX
 TYo1u7h4qc4VlCevEbvgPZknR3VGbDVMcNGtdn8pIPx8ag1yT2Z7zjhZx2ZfFsLS2EX+
 Ww36pWJJfZdeNNAN1IoGE9xumccaCsNTRAPCIXOsGFTwnXB5dgoz0HNEwQHxc1NISIh6
 L6tlS59mGzRISJegr8S2uVRa1rEaRditiYLL377iuNrKHnbGzvghKElZUFSh0Y8Xpmfl
 PGOJMjOq0uqY+PPLr37qKvJNxHn1DU8++iLHXnPExU/xO6y4P4/XXilYzJoeB7VBmS3n
 IMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9WUJiJmld4s3sHaKN9tOH+lZYonDBgJUTA33cJhtVE=;
 b=fGnbwkZQuWfqi8XcW/n5D1GYEDPSiKRpQVXbBMLZuuEoHAfzSHQaw1kCgvSS7AqjPa
 j1gblK6s5Vwpe67zUaHqEr1VSogz7kJhp51BcGQZBAzs7g5wvpHnu32gAQ4EKkGH+tOp
 z5lUDi06Bqdbo0wl9DxAfX5aNNfV0QVjiJkyCtrn+QRnhAsuVpZJzXIqUATDX/ynMEU4
 7s7HvINFV+ew73TS4tlsoB6UvpgQ81OwXLf0hh5xQmqONKh1l/fEcxyJk3azvjaskwH0
 rO5ZSMo/H8jWK/Q/ymoq0vELYANdxV77R9upnEtLRq5ikOrwuScdOCS45HaMBTebEJd/
 ZCCA==
X-Gm-Message-State: AOAM530cBFq/UHYTTgyNRUSyN2NUfnjDQrcEpTgrlCBqomduZNEXr3R4
 jVXxdAnSouVovBFiKqTsTg134g==
X-Google-Smtp-Source: ABdhPJzvevohSKJ2xViIYAeqXL5VIvGTkAwwf6XfXZTrkO3TC4ag8NeIHM8vWvTUSTHdrZpGwONChA==
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr9770573wmi.95.1607627068141; 
 Thu, 10 Dec 2020 11:04:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h98sm11987061wrh.69.2020.12.10.11.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BE411FF8F;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 3/8] configure: move gettext detection to meson.build
Date: Thu, 10 Dec 2020 19:04:12 +0000
Message-Id: <20201210190417.31673-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow meson to honour -Dauto_features=disabled later.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure         | 19 +++----------------
 meson_options.txt |  2 +-
 po/meson.build    |  2 +-
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 8f2095a2db..46fdea88c7 100755
--- a/configure
+++ b/configure
@@ -448,7 +448,7 @@ libdaxctl=""
 meson=""
 ninja=""
 skip_meson=no
-gettext=""
+gettext="auto"
 
 bogus_os="no"
 malloc_trim="auto"
@@ -1014,9 +1014,9 @@ for opt do
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
@@ -2839,19 +2839,6 @@ if test "$xen_pci_passthrough" != "disabled"; then
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
index f6f64785fe..191e848600 100644
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


