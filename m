Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99A301604
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:43:49 +0100 (CET)
Received: from localhost ([::1]:33476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K8h-0002iL-Uy
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxH-0003eA-Gr
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxE-0005sb-Vn
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSrajdloYtBXXusQwffYuhgCbO9SE478kXkazx+6f2c=;
 b=FpqFQh0G/zQEDXMOukoRrMpeyRaBZEKffkGjfEE7SSBTWBHrHc445P2nYlR4tp9gI95XYb
 G9xg2Y5KkxXDCdmGH0PnVGX0UI6Kqk7/Bv1R7eKFFm0jDVF/j12xpGctCP8WNvmjAvvwxp
 cXVstk9aTJIU/xVtqYkVMp8WH6W6brY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-DCywZU1HM8-13t4nUnYaug-1; Sat, 23 Jan 2021 09:31:54 -0500
X-MC-Unique: DCywZU1HM8-13t4nUnYaug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5807E801A03
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 125751F060;
 Sat, 23 Jan 2021 14:31:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/31] meson: Summarize overall features altogether
Date: Sat, 23 Jan 2021 09:31:14 -0500
Message-Id: <20210123143128.1167797-18-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 54 +++++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/meson.build b/meson.build
index bda28de52c..b1d12d8c74 100644
--- a/meson.build
+++ b/meson.build
@@ -2274,6 +2274,36 @@ if slirp_opt != 'disabled'
 endif
 summary(summary_info, bool_yn: true, section: 'Host binaries')
 
+# Configurable features
+summary_info = {}
+summary_info += {'Documentation':     build_docs}
+summary_info += {'Install blobs':     get_option('install_blobs')}
+summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
+if config_host.has_key('CONFIG_MODULES')
+  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
+endif
+summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
+summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
+if have_system
+  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+endif
+summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
+if config_host['TRACE_BACKENDS'].split().contains('simple')
+  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
+endif
+summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
+summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
+summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
+summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
+summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
+summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
+summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
+summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
+summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
+summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
+summary(summary_info, bool_yn: true, section: 'Configurable features')
+
 summary_info = {}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
@@ -2302,10 +2332,6 @@ summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
-if config_host.has_key('CONFIG_MODULES')
-  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
-endif
 summary_info += {'host CPU':          cpu}
 summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'target list':       ' '.join(target_dirs)}
@@ -2347,7 +2373,6 @@ summary_info += {'curses support':    curses.found()}
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
 summary_info += {'mingw32 support':   targetos == 'windows'}
-summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
 summary_info += {'VirtFS support':    have_virtfs}
@@ -2364,14 +2389,12 @@ if config_host.has_key('CONFIG_XEN_BACKEND')
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
 summary_info += {'brlapi support':    brlapi.found()}
-summary_info += {'Documentation':     build_docs}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
 summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
 summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
 summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
@@ -2392,19 +2415,6 @@ summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
 summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
 summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
 summary_info += {'libcap-ng support': libcap_ng.found()}
-summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
-summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
-summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
-summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
-summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
-summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
-if config_host['TRACE_BACKENDS'].split().contains('simple')
-  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
-endif
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
 summary_info += {'rbd support':       rbd.found()}
@@ -2417,7 +2427,6 @@ summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
-summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 if targetos == 'windows'
   if 'WIN_SDK' in config_host
     summary_info += {'Windows SDK':       config_host['WIN_SDK']}
@@ -2439,7 +2448,6 @@ summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
-summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
@@ -2466,8 +2474,6 @@ summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'default devices':   get_option('default_devices')}
-summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
-summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
-- 
2.26.2



