Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFC3A78A1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:59:01 +0200 (CEST)
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3yO-0006qA-E1
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt3wN-0004jk-3E
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:56:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt3wJ-0004tV-W5
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQmItMFXeTytuhx7BQwjwPM0J6xYyGQbwIGr/94vqs0=;
 b=V71mc+N43sKTuPE66T3NeFulPcnb/jdX3CRKY/yZbqKg8eeUGtQ8JX1RTNiXhiK0Iw+nH5
 YM7RkRPlpnzBVsfF9dUziZoUdCzL15lRAJGU4CAh9MsbtY5JIaBHk6NMLAwwMpTz0BniVg
 WHPyYbO0LdCj/RdF7FoDDwhC8mg8b6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-WT7cduaVOcWNRHCCnQuKIA-1; Tue, 15 Jun 2021 03:56:49 -0400
X-MC-Unique: WT7cduaVOcWNRHCCnQuKIA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16680800D55
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:56:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA2C05D9DC;
 Tue, 15 Jun 2021 07:56:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E00018000B2; Tue, 15 Jun 2021 09:56:46 +0200 (CEST)
Date: Tue, 15 Jun 2021 09:56:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210615075646.vcv3bhbrffs5exez@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
 <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 06:49:15AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > Another possibility to eschew .o parsing is to add something like this to
> > the sources
> > 
> > #ifdef QEMU_MODINFO
> > #define MODULE_METADATA(key, value) \
> >    =<>= MODINFO key value
> > #else
> > #define MODULE_METADATA(key, value)
> > #endif
> > 
> > MODULE_METADATA("opts", "spice")
> > 
> > A Python script could parse compile_commands.json, add -E -DQEMU_MODINFO to
> > the command-line option, and look in the output for the metadata.
> 
> Hmm, worth trying, although I guess it would be easier to code this up
> straight in meson.build and pull the information you need out of the
> source set, especially as you'll know then which source files are
> compiled into which module.

Hmm, looks like I actually need both.  Seems there is no easy way to get
the cflags out of a source_set to construct a cpp command line.  Pulling
this out of compile_commands.json with jq works though.

With the patch below I get nice ${module}.modinfo files with the
metadata, now I only need a (probably python) script to collect
them and create a modinfo.c which we can link into qemu.

take care,
  Gerd

From 3edc033935d2dd4ec607ac6395548a327151ad06 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 15 Jun 2021 09:23:52 +0200
Subject: [PATCH] try -DQEMU_MODINFO

---
 include/qemu/module.h | 22 ++++++----------------
 meson.build           |  7 +++++++
 scripts/modinfo.sh    |  8 ++++++++
 3 files changed, 21 insertions(+), 16 deletions(-)
 create mode 100644 scripts/modinfo.sh

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 7825f6d8c847..5acfa423dc4f 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -74,22 +74,12 @@ void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
-/*
- * macros to store module metadata in a .modinfo section.
- * qemu-modinfo utility will collect the metadata.
- *
- * Use "objdump -t -s -j .modinfo ${module}.so" to inspect.
- */
-
-#define ___PASTE(a, b) a##b
-#define __PASTE(a, b) ___PASTE(a, b)
-
-#define modinfo(kind, value)                             \
-    static const char __PASTE(kind, __LINE__)[]          \
-        __attribute__((__used__))                        \
-        __attribute__((section(".modinfo")))             \
-        __attribute__((aligned(1)))                      \
-        = stringify(kind) "=" value
+#ifdef QEMU_MODINFO
+# define modinfo(kind, value) \
+    MODINFO_START kind value MODINFO_END
+#else
+# define modinfo(kind, value)
+#endif
 
 #define module_obj(name) modinfo(obj, name)
 #define module_dep(name) modinfo(dep, name)
diff --git a/meson.build b/meson.build
index 46ebc07dbb67..d8661755adf9 100644
--- a/meson.build
+++ b/meson.build
@@ -2050,12 +2050,19 @@ target_modules += { 'accel' : { 'qtest': qtest_module_ss,
 
 block_mods = []
 softmmu_mods = []
+modinfo = find_program('scripts/modinfo.sh')
 foreach d, list : modules
   foreach m, module_ss : list
     if enable_modules and targetos != 'windows'
       module_ss = module_ss.apply(config_all, strict: false)
       sl = static_library(d + '-' + m, [genh, module_ss.sources()],
                           dependencies: [modulecommon, module_ss.dependencies()], pic: true)
+      custom_target(d + '-' + m + '.modinfo',
+                    output: d + '-' + m + '.modinfo',
+                    input: module_ss.sources(),
+                    build_by_default: true, # to be removed when added to a target
+                    capture: true,
+                    command: [modinfo, '@INPUT@'])
       if d == 'block'
         block_mods += sl
       else
diff --git a/scripts/modinfo.sh b/scripts/modinfo.sh
new file mode 100644
index 000000000000..8f4495d4523d
--- /dev/null
+++ b/scripts/modinfo.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+for input in "$@"; do
+    command=$(jq  -r ".[] | select(.file == \"$input\") | .command " compile_commands.json)
+    command="${command%% -M*}"
+    command="$command -DQEMU_MODINFO -E $input"
+    $command
+done | grep MODINFO
+exit 0
-- 
2.31.1


