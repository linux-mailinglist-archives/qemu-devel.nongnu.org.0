Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF82FE70D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:05:46 +0100 (CET)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WqX-00046b-Dh
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiA-000301-Kn
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Wi3-0007qC-TZ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SzV1XJWUrs+3Hbd6rgw2jk3AnTycYzM33TBBMwY4GI=;
 b=KrOI3gF0K3dVVzPEZk69f7A90ejBf1JBKR0pK8UD/8io/PGJKqlSbHsyUAR5aqKnXGkjBF
 pWBu6nRmpKLfBVdWDiJ0adVbPv71wYNCcC1Ar1mSiHhet8zeBTCfK6PTIqgubJoQsaG0hk
 dCF22qnO5jb+eFNdnoVn5kofTC8L2ZU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-vf7UbdPZNe2z1LxssyZaBQ-1; Thu, 21 Jan 2021 04:56:57 -0500
X-MC-Unique: vf7UbdPZNe2z1LxssyZaBQ-1
Received: by mail-ej1-f69.google.com with SMTP id z2so547707ejf.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SzV1XJWUrs+3Hbd6rgw2jk3AnTycYzM33TBBMwY4GI=;
 b=HzqWehJpZzD37vMyX13zE/j/p+ub1czwwJyW0lHbjalVFlvL/Xk8yvXm5c63wjDNa2
 VbuaE5HXAw6e7YQNW2NRKHe1YGImaTNjEpfqSXHHTvJpTMWgfcUZYb2X6QfXDzCvQLLa
 WOmb/SUyFFT5X36PWnpaAodV6glpArrbhP7Kmu9Ya2IAxo3hGVm12Y+VEv5wptt0RKPV
 9HboqET04ap96p5d4GQUvZDAeiaaYRCxPeuN/Shzh6hheaxNvWi4qhha/ry3e7j6a/LM
 QqFuLFxbMIV0YtqOUTSpLXlAvxGv/M6Gp9ugVMeolq7vudDLzixbFt+D16bc41hdjgAm
 XdUA==
X-Gm-Message-State: AOAM530rBklaPNgxCSCyWPB4Q7KnRyEPYe5JJNDXN8HjtSbFnQZUflO6
 sMUmQw76ZUx+e09hF3gDcj8RriFmkU98ZDxGnkWGgUh8VU2oK98KztmSUOgv/NwQToZtdsiX2cV
 37PdB7rIBOzDPo6FOzIafmo/njWwBGZG+eqGfaRQED14inqz3drqmkHss2RY2qLSb
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr8986100ejc.529.1611223015681; 
 Thu, 21 Jan 2021 01:56:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVvwWR9ExfnuaEDs5Q4q7xQOV/G7NGm8P7b6P3h8vEqLn0fQ4aUMIMzuxMRh6teBMxq8e8dA==
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr8986085ejc.529.1611223015434; 
 Thu, 21 Jan 2021 01:56:55 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z25sm2010982ejd.23.2021.01.21.01.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:56:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] meson: Summarize compilation-related information
 altogether
Date: Thu, 21 Jan 2021 10:56:12 +0100
Message-Id: <20210121095616.1471869-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 63 +++++++++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/meson.build b/meson.build
index 4b600315ba4..194b8523f77 100644
--- a/meson.build
+++ b/meson.build
@@ -2341,7 +2341,10 @@
 endif
 summary(summary_info, bool_yn: true, section: 'Overall')
 
+# Compilation information
 summary_info = {}
+summary_info += {'host CPU':          cpu}
+summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2352,6 +2355,11 @@
 if targetos == 'darwin'
   summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
 endif
+if targetos == 'windows'
+  if 'WIN_SDK' in config_host
+    summary_info += {'Windows SDK':   config_host['WIN_SDK']}
+  endif
+endif
 summary_info += {'ARFLAGS':           config_host['ARFLAGS']}
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
@@ -2367,16 +2375,36 @@
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
-# TODO: add back version
-summary_info += {'host CPU':          cpu}
-summary_info += {'host endianness':   build_machine.endian()}
-summary_info += {'target list':       ' '.join(target_dirs)}
-summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
-summary_info += {'sparse enabled':    sparse.found()}
-summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
+summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
+summary_info += {'malloc trim support': has_malloc_trim}
+summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
+summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
+summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
+summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
+summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
+summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
+summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
+summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
+summary_info += {'memory allocator':  get_option('malloc')}
+summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
+summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
+summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
+summary_info += {'gcov':              get_option('b_coverage')}
+summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
+summary_info += {'CFI support':       get_option('cfi')}
+if get_option('cfi')
+  summary_info += {'CFI debug support': get_option('cfi_debug')}
+endif
+summary_info += {'strip binaries':    get_option('strip')}
+summary_info += {'mingw32 support':   targetos == 'windows'}
+summary(summary_info, bool_yn: true, section: 'Compilation')
+
+summary_info = {}
+summary_info += {'target list':       ' '.join(target_dirs)}
+summary_info += {'sparse enabled':    sparse.found()}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
 endif
@@ -2408,7 +2436,6 @@
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-summary_info += {'mingw32 support':   targetos == 'windows'}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
 summary_info += {'VirtFS support':    have_virtfs}
@@ -2425,7 +2452,6 @@
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
 summary_info += {'brlapi support':    brlapi.found()}
-summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
@@ -2440,16 +2466,9 @@
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
   summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
 endif
-summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
-summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
-summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
-summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
-summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
-summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
-summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
 summary_info += {'libcap-ng support': libcap_ng.found()}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
@@ -2474,23 +2493,15 @@
 summary_info += {'libnfs support':    libnfs.found()}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 if targetos == 'windows'
-  if 'WIN_SDK' in config_host
-    summary_info += {'Windows SDK':       config_host['WIN_SDK']}
-  endif
   summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
   summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'CFI support':       get_option('cfi')}
-summary_info += {'CFI debug support': get_option('cfi_debug')}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
-summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
-summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
-summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
@@ -2502,9 +2513,6 @@
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'memory allocator':  get_option('malloc')}
-summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
-summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
 summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
 summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
 summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
@@ -2520,7 +2528,6 @@
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'default devices':   get_option('default_devices')}
-summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
-- 
2.26.2


