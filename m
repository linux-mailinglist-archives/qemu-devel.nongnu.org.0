Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F84EE26F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:13:00 +0200 (CEST)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1AB-0007uR-Cc
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:12:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1na18t-0006RS-4F
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:11:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1na18p-0000qi-Jw
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648757494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0qxPJ3bhIs2UUdDprhxpBn/irNWplzO+32yvIOk26+4=;
 b=b33gHV4ISu2CmI7RtAAdkYFyz1E5gvC1y+Kg2roNSSweooYNhesROG3c364Q7eEmMWsLbj
 r3UxYO/zm2BMgmwwY9ZMmWY26dvhmT9quYyCqJDOC10s7GGQaQCDjxXwY73yAb/EEx5Ldo
 6wYFGxD11E/ElWdTfass/jamVTXLR24=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-TSO3_Co1Phiha-Ctbgwd0w-1; Thu, 31 Mar 2022 16:11:31 -0400
X-MC-Unique: TSO3_Co1Phiha-Ctbgwd0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4A681C0783F;
 Thu, 31 Mar 2022 20:11:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C63B40CF8EB;
 Thu, 31 Mar 2022 20:11:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
Date: Fri,  1 Apr 2022 00:11:27 +0400
Message-Id: <20220331201127.2006038-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since the introduction of the variable in commit 9dacf32d2cb ("qemu-ga:
Building Windows MSI installation with configure/Makefile"), nothing
makes use of the Mingw_dlls variable in the .wxs file.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure       | 3 ---
 qga/meson.build | 1 -
 2 files changed, 4 deletions(-)

diff --git a/configure b/configure
index 7c08c18358be..8cbe55ac82e8 100755
--- a/configure
+++ b/configure
@@ -2704,8 +2704,6 @@ if test "$QEMU_GA_VERSION" = ""; then
     QEMU_GA_VERSION=$(cat $source_path/VERSION)
 fi
 
-QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
-
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
@@ -2792,7 +2790,6 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
   echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
   echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
   echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
diff --git a/qga/meson.build b/qga/meson.build
index 62472747f1bb..94fa64eb9bd8 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -131,7 +131,6 @@ if targetos == 'windows'
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
-                              '-D', 'Mingw_dlls=' + config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
                             ])
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
-- 
2.35.1.693.g805e0a68082a


