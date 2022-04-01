Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8CA4EEA12
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:01:03 +0200 (CEST)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naD9R-0005Nh-Vj
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1naD01-00035F-EL
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1naCzw-0002uk-QE
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648803071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DAHX40TEnSU2RnZHTb2T36Lccu7NDJXr3oaOexKXWak=;
 b=KvOQyrdD2fgYbEO1NoikLm2vn35PN2ebzCFZeNZF7zHE6+b8dedYa4Fpkv3SK/iFoFf+45
 s4ZtPMYmXdcnWE0mbYIpCKyV+HfW6Gjv+kwe+J9JUJpPb9Vl4bicX6pYDBlq5gC3ZUlfX4
 dGnqNlzvfR3VCn7UKyK/sPhEelvD27s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-9wGhggB5PzK2TcyEn-Q8NA-1; Fri, 01 Apr 2022 04:51:10 -0400
X-MC-Unique: 9wGhggB5PzK2TcyEn-Q8NA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11AD9101AA42;
 Fri,  1 Apr 2022 08:51:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09EE3552F0C;
 Fri,  1 Apr 2022 08:51:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: drop ntddscsi.h check
Date: Fri,  1 Apr 2022 12:51:06 +0400
Message-Id: <20220401085106.2167374-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The header has been part of MinGW-w64 since the introduction of the
project (2007). While on MinGW(32), the legacy project, it was imported
in 2014 from w32api-3.17 (commit e4803e0da2).

According to build-platform.rst and our CI coverage, we only support
building with MinGW-w64 (from Debian/Fedora).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build          | 17 -----------------
 qga/commands-win32.c | 19 -------------------
 qga/meson.build      |  6 ++----
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/meson.build b/meson.build
index c06fe5e02737..46b5e938b196 100644
--- a/meson.build
+++ b/meson.build
@@ -2019,22 +2019,6 @@ if targetos == 'windows' and link_language == 'cpp'
 endif
 config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
-have_ntddscsi = false
-if targetos == 'windows'
-  have_ntddscsi = cc.compiles('''
-    #include <windows.h>
-    #include <ntddscsi.h>
-    int main(void) {
-    #if !defined(IOCTL_SCSI_GET_ADDRESS)
-    #error Missing required ioctl definitions
-    #endif
-      SCSI_ADDRESS addr = { .Lun = 0, .TargetId = 0, .PathId = 0 };
-      return addr.Lun;
-    }
-''')
-endif
-config_host_data.set('HAVE_NTDDSCSI', have_ntddscsi)
-
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
@@ -3722,7 +3706,6 @@ summary_info += {'libnfs support':    libnfs}
 if targetos == 'windows'
   if have_ga
     summary_info += {'QGA VSS support':   have_qga_vss}
-    summary_info += {'QGA w32 disk info': have_ntddscsi}
   endif
 endif
 summary_info += {'seccomp support':   seccomp}
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3c428213db0a..ebec5536340a 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -18,10 +18,8 @@
 #include <ws2tcpip.h>
 #include <iptypes.h>
 #include <iphlpapi.h>
-#ifdef HAVE_NTDDSCSI
 #include <winioctl.h>
 #include <ntddscsi.h>
-#endif
 #include <setupapi.h>
 #include <cfgmgr32.h>
 #include <initguid.h>
@@ -474,8 +472,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-#ifdef HAVE_NTDDSCSI
-
 static GuestDiskBusType win2qemu[] = {
     [BusTypeUnknown] = GUEST_DISK_BUS_TYPE_UNKNOWN,
     [BusTypeScsi] = GUEST_DISK_BUS_TYPE_SCSI,
@@ -1098,21 +1094,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
     return ret;
 }
 
-#else
-
-static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
-{
-    return NULL;
-}
-
-GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return NULL;
-}
-
-#endif /* HAVE_NTDDSCSI */
-
 static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
 {
     DWORD info_size;
diff --git a/qga/meson.build b/qga/meson.build
index 4d5de843abf6..40a7baabfde3 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -83,14 +83,12 @@ qga_ss = qga_ss.apply(config_host, strict: false)
 gen_tlb = []
 qga_libs = []
 if targetos == 'windows'
-  qga_libs += ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32', '-lwininet', '-liphlpapi', '-lnetapi32']
+  qga_libs += ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32', '-lwininet', '-liphlpapi', '-lnetapi32',
+               '-lsetupapi', '-lcfgmgr32']
   if have_qga_vss
     qga_libs += ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++', '-Wl,--enable-stdcall-fixup']
     subdir('vss-win32')
   endif
-  if have_ntddscsi
-    qga_libs += ['-lsetupapi', '-lcfgmgr32']
-  endif
 endif
 
 qga = executable('qemu-ga', qga_ss.sources(),
-- 
2.35.1.693.g805e0a68082a


