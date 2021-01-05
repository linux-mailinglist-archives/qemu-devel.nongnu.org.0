Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E732EAD8D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 15:44:39 +0100 (CET)
Received: from localhost ([::1]:50298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwnZe-0007Zj-A5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 09:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwnTB-0003Wb-GC; Tue, 05 Jan 2021 09:37:57 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:42046 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwnT7-000783-HV; Tue, 05 Jan 2021 09:37:55 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6ACBF41209;
 Tue,  5 Jan 2021 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609857467;
 x=1611671868; bh=9Fo6rWflNlAx9Hb6ZAIigu1t1V1k5NfJWDzpIAvSzFg=; b=
 BYJarXt7VbOHbv6dXDgp36+V7lG4iUkuO7LE18nlbf1CdR3ARngHRM1ZWr+An8w7
 WfyjP/iA1Q0HpvSvVMX49A9lo1aGNDOs11yk1tGM2tTMZt1trJq0SbLTr4+WLb4B
 InhMxejIXwDR6wmKZ3/QE1slXY2/2626Oz5jtwgFx8k=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9465apptBmW; Tue,  5 Jan 2021 17:37:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C0A21411D9;
 Tue,  5 Jan 2021 17:37:46 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 5 Jan
 2021 17:37:46 +0300
Date: Tue, 5 Jan 2021 17:37:58 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "open list:Block
 layer core" <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 04, 2021 at 09:50:32PM +0100, Paolo Bonzini wrote:
> On 04/01/21 18:24, Roman Bolshakov wrote:
> > Hi Paolo,
> > 
> > I'm sorry I didn't reply earlier. As I showed in an example to Peter
> > (https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00085.html):
> > https://github.com/mesonbuild/meson/commit/ff5dc65ef841857dd306694dff1fb1cd2bf801e4
> > 
> > The approach doesn't propogate dependencies of crypto beyond libcrypto.
> > i.e. if you specify crypto somewhere else as depedency, it won't pull
> > CFLAGS needed for gnutls.
> 
> Hi Roman,
> 
> After writing the meson patch in fact I noticed that get_dependencies() is
> used only for linker flags.  I got a very quick reply from the Meson
> maintainer (https://github.com/mesonbuild/meson/pull/8151):
> 

Thanks for providing a PR! I'll try if it works for QEMU with previous
proposal of fixing it (where we specify dependency in source set only
once and don't duplicate in declare_dependency).

I wonder if we should add a source set method like public_add to allow
the behavior we want and permit propogation of a dependency beyond
static_library without breaking all other users of meson out there?

>    The fact that header flags are not passed transitively but libraries
>    are (in some cases) is intentional. Otherwise compiler flag counts
>    explode in deep hierarchies. Because of this include paths must be
>    exported manually, typically by adding the appropriate bits to a
>    declare_dependency.
> 
>    Libs are a bit stupid, because you need to add direct dependencies
>    if, for example, you link to a static library.
> 
> Does it work if you do:
> 
> crypto_ss.add(authz, qom)
> libcrypto = static_library('crypto', crypto_ss.sources() + genh,
>                            dependencies: crypto_ss.dependencies(),
>                            ...)
> crypto = declare_dependency(link_whole: libcrypto,
>                             dependencies: crypto_ss.dependencies())
> 

I tried that approach before I sent the patch in the subject. It
produces duplicate symbols:

  duplicate symbol '_qauthz_pam_new' in:
      libcrypto.fa(authz_pamacct.c.o)
      libauthz.fa(authz_pamacct.c.o)
  [...]
  duplicate symbol '_object_property_set_qobject' in:
      libcrypto.fa(qom_qom-qobject.c.o)                                                                                                                                                                                                                            libqom.fa(qom_qom-qobject.c.o)

My impression that it links in every static library that's mentioned in
dependencies of static_library, so they grow like a snow ball. Patch
below:

diff --git a/block/meson.build b/block/meson.build
index 7595d86c41..7eaf48c6dc 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -40,7 +40,7 @@ block_ss.add(files(
   'vmdk.c',
   'vpc.c',
   'write-threshold.c',
-), zstd, zlib)
+), crypto, zstd, zlib)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
 
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index fd2951a860..1f2ed013b2 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,6 +1,3 @@
-# QOM interfaces must be available anytime QOM is used.
-qom_ss.add(files('fw_cfg-interface.c'))
-
 softmmu_ss.add(files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
 softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
diff --git a/io/meson.build b/io/meson.build
index bcd8b1e737..a844271b17 100644
--- a/io/meson.build
+++ b/io/meson.build
@@ -12,4 +12,4 @@ io_ss.add(files(
   'dns-resolver.c',
   'net-listener.c',
   'task.c',
-))
+), crypto)
diff --git a/meson.build b/meson.build
index 372576f82c..1a8c653067 100644
--- a/meson.build
+++ b/meson.build
@@ -1538,6 +1538,34 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
+# QOM interfaces must be available anytime QOM is used.
+qom_ss.add(files('hw/nvram/fw_cfg-interface.c'))
+qom_ss = qom_ss.apply(config_host, strict: false)
+libqom = static_library('qom', qom_ss.sources() + genh,
+                        dependencies: [qom_ss.dependencies()],
+                        name_suffix: 'fa')
+
+qom = declare_dependency(link_whole: libqom)
+
+authz_ss = authz_ss.apply(config_host, strict: false)
+libauthz = static_library('authz', authz_ss.sources() + genh,
+                          dependencies: [authz_ss.dependencies()],
+                          name_suffix: 'fa',
+                          build_by_default: false)
+
+authz = declare_dependency(link_whole: libauthz,
+                           dependencies: qom)
+
+crypto_ss.add(authz)
+crypto_ss = crypto_ss.apply(config_host, strict: false)
+libcrypto = static_library('crypto', crypto_ss.sources() + genh,
+                           dependencies: crypto_ss.dependencies(),
+                           name_suffix: 'fa',
+                           build_by_default: false)
+
+crypto = declare_dependency(link_whole: libcrypto,
+                            dependencies: crypto_ss.dependencies())
+
 decodetree = generator(find_program('scripts/decodetree.py'),
                        output: 'decode-@BASENAME@.c.inc',
                        arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
@@ -1652,31 +1680,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
                              capture: true,
                              command: [undefsym, nm, '@INPUT@'])
 
-qom_ss = qom_ss.apply(config_host, strict: false)
-libqom = static_library('qom', qom_ss.sources() + genh,
-                        dependencies: [qom_ss.dependencies()],
-                        name_suffix: 'fa')
-
-qom = declare_dependency(link_whole: libqom)
-
-authz_ss = authz_ss.apply(config_host, strict: false)
-libauthz = static_library('authz', authz_ss.sources() + genh,
-                          dependencies: [authz_ss.dependencies()],
-                          name_suffix: 'fa',
-                          build_by_default: false)
-
-authz = declare_dependency(link_whole: libauthz,
-                           dependencies: qom)
-
-crypto_ss = crypto_ss.apply(config_host, strict: false)
-libcrypto = static_library('crypto', crypto_ss.sources() + genh,
-                           dependencies: [crypto_ss.dependencies()],
-                           name_suffix: 'fa',
-                           build_by_default: false)
-
-crypto = declare_dependency(link_whole: libcrypto,
-                            dependencies: [authz, qom])
-
 io_ss = io_ss.apply(config_host, strict: false)
 libio = static_library('io', io_ss.sources() + genh,
                        dependencies: [io_ss.dependencies()],

> ?  If so, that is also a good option.  If not, I will try to extend the test
> case to pitch the Meson change.
> 

This one seems the only sane approach left.

Thanks,
Roman

