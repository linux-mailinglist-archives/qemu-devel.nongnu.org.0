Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25735089FB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:03:05 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhAvA-0005FP-S1
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMb-0005tQ-Gh
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMZ-0004UR-V5
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEfU1bc2ElvYd5D3HtkXcZQnRYmVAlcRo2MDgzheDWY=;
 b=H7swXVT4HPO+RmEfd9pBYMoqlEbNcLTAWP1L8FB21l4RvcdjoMhUdvN9K5vBRYxx+FozwE
 0Ee8dg4vtXJBJx7Vd2HDG4JOpZ1C4/S1RKAqEWMwaVX4iysW1OpXQqodDvNTzhDPgOLNkX
 y+8+xjYKCO4PwZcHUtTyiAXRCqisEqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-_8nEWpFdOkai60yxJ39EZA-1; Wed, 20 Apr 2022 09:27:18 -0400
X-MC-Unique: _8nEWpFdOkai60yxJ39EZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D42511C05132;
 Wed, 20 Apr 2022 13:27:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9F82145BA55;
 Wed, 20 Apr 2022 13:27:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 10/41] build-sys: drop MSI's QEMU_GA_DISTRO
Date: Wed, 20 Apr 2022 17:25:53 +0400
Message-Id: <20220420132624.2439741-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

The variable doesn't have much use, and is not easily discoverable (from
configure time option, or as installed registry value).

Eventually, QEMU_GA_MANUFACTURER customization could cover the need for
a specialized registry key or directory path, but as in its current
form, they don't really help.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                 | 5 -----
 qga/installer/qemu-ga.wxs | 6 +-----
 qga/meson.build           | 1 -
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/configure b/configure
index 321e66809234..3fd2c91e0d76 100755
--- a/configure
+++ b/configure
@@ -2694,10 +2694,6 @@ fi
 
 # Guest agent Windows MSI package
 
-if test "$QEMU_GA_DISTRO" = ""; then
-  QEMU_GA_DISTRO=Linux
-fi
-
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
@@ -2784,7 +2780,6 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
 else
   echo "CONFIG_POSIX=y" >> $config_host_mak
 fi
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 2c49a2336e11..768bc35d1159 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -4,10 +4,6 @@
     <?error Variable QEMU_GA_VERSION undefined ?>
   <?endif?>
 
-  <?ifndef env.QEMU_GA_DISTRO ?>
-    <?error Environment variable QEMU_GA_DISTRO undefined?>
-  <?endif?>
-
   <?define QEMU_GA_MANUFACTURER = "QEMU" ?>
 
   <?ifndef var.Arch?>
@@ -131,7 +127,7 @@
           </Component>
           <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
             <RegistryKey Root="HKLM"
-                         Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
+                         Key="Software\$(var.QEMU_GA_MANUFACTURER)\Tools\QemuGA">
               <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
               <RegistryValue Type="string" Name="Version" Value="$(var.QEMU_GA_VERSION)" />
             </RegistryKey>
diff --git a/qga/meson.build b/qga/meson.build
index fb437062612e..40a7baabfde3 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -122,7 +122,6 @@ if targetos == 'windows'
                             depends: deps,
                             command: [
                               find_program('env'),
-                              'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
                               'BUILD_DIR=' + meson.build_root(),
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
-- 
2.35.1.693.g805e0a68082a


