Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E1508AA3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:19:26 +0200 (CEST)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBAz-000821-HX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMP-0005oB-Ac
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMN-0004RS-O2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wicTNQp/IaVlMv1RQiC/bgR4h3VzdckTwi9VwOIFmv8=;
 b=F4F7keNogFO1GxybIxUvlzZZ36Sw6MnlHoYM34ZBXZKvv7IEgDSfFyUbI24/IcwVukjxzk
 8GiFgg4LnSIDSJHQMyqOYtJdHJ3DU8DJZWSxfc1gJWMemYf4QsgVlB8znWEvwCRK16yqCC
 MuL3fP/Tn7i/V5oXZCpRsWJKVMz1+mE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-xGSRZxAwO3SKr47tDP-Ytw-1; Wed, 20 Apr 2022 09:27:04 -0400
X-MC-Unique: xGSRZxAwO3SKr47tDP-Ytw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD5BB3806739;
 Wed, 20 Apr 2022 13:27:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AAC112131E;
 Wed, 20 Apr 2022 13:27:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/41] build-sys: simplify MSI's QEMU_GA_MANUFACTURER
Date: Wed, 20 Apr 2022 17:25:51 +0400
Message-Id: <20220420132624.2439741-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

If there is any reason to allow customization of this variable, we
should provide a proper configure option.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                 |  4 ----
 qga/installer/qemu-ga.wxs | 10 ++++------
 qga/meson.build           |  1 -
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 8cbe55ac82e8..5ac653b21351 100755
--- a/configure
+++ b/configure
@@ -2694,9 +2694,6 @@ fi
 
 # Guest agent Windows MSI package
 
-if test "$QEMU_GA_MANUFACTURER" = ""; then
-  QEMU_GA_MANUFACTURER=QEMU
-fi
 if test "$QEMU_GA_DISTRO" = ""; then
   QEMU_GA_DISTRO=Linux
 fi
@@ -2790,7 +2787,6 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
   echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
   echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
 else
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 0950e8c6becc..53d836c06a96 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -8,9 +8,7 @@
     <?error Environment variable QEMU_GA_DISTRO undefined?>
   <?endif?>
 
-  <?ifndef env.QEMU_GA_MANUFACTURER ?>
-    <?error Environment variable QEMU_GA_MANUFACTURER undefined?>
-  <?endif?>
+  <?define QEMU_GA_MANUFACTURER = "QEMU" ?>
 
   <?ifndef var.Arch?>
     <?error Define Arch to 32 or 64?>
@@ -43,14 +41,14 @@
     Name="QEMU guest agent"
     Id="*"
     UpgradeCode="{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
-    Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
+    Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
     Version="$(env.QEMU_GA_VERSION)"
     Language="1033">
     <?if $(var.Arch) = 32 ?>
     <Condition Message="Error: 32-bit version of Qemu GA can not be installed on 64-bit Windows.">NOT VersionNT64</Condition>
     <?endif?>
     <Package
-      Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
+      Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
       InstallerVersion="200"
       Languages="1033"
       Compressed="yes"
@@ -133,7 +131,7 @@
           </Component>
           <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
             <RegistryKey Root="HKLM"
-                         Key="Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
+                         Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
               <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
               <RegistryValue Type="string" Name="Version" Value="$(env.QEMU_GA_VERSION)" />
             </RegistryKey>
diff --git a/qga/meson.build b/qga/meson.build
index da5e5efb19e8..6e57de430d29 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -123,7 +123,6 @@ if targetos == 'windows'
                             command: [
                               find_program('env'),
                               'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
-                              'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
                               'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
                               'BUILD_DIR=' + meson.build_root(),
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
-- 
2.35.1.693.g805e0a68082a


