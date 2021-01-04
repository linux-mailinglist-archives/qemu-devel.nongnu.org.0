Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FF22E9C01
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:28:05 +0100 (CET)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTeG-0008DQ-5w
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwTai-0005NP-48; Mon, 04 Jan 2021 12:24:24 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:57292 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwTaf-0004Ck-Ij; Mon, 04 Jan 2021 12:24:23 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6D3F5412C6;
 Mon,  4 Jan 2021 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609781053;
 x=1611595454; bh=sMuZzf9cdPnUcmZixtJvJ+GgrwYzkoZbN3igPy3YWBU=; b=
 dEgedDCK+2u7hM+eSf/269mpJEBKzYngCtYL8+HD8sisI/HQ14rF4kGExE65pBtZ
 pqG/enkSVgXnbWNL4nd/j33+kM6na8ky1j88qOrNMtXflJF472iRw3DvzyexPHuK
 +mW5+uAeRK57xbNixViv/1nQ1Rs3EgJITVeXt8/izag=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJl-6SOEfT7F; Mon,  4 Jan 2021 20:24:13 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1A39D4120E;
 Mon,  4 Jan 2021 20:24:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 4 Jan
 2021 20:24:12 +0300
Date: Mon, 4 Jan 2021 20:24:22 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
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

On Sat, Jan 02, 2021 at 08:43:51PM +0100, Paolo Bonzini wrote:
> On 02/01/21 14:25, Peter Maydell wrote:
> > Question to Paolo -- it seems pretty fragile to have to explicitly
> > list "these source files need these extra CFLAGS" in half a dozen
> > meson.build files, because it's pretty non-obvious that adding
> > eg '#include "block/nbd.h"' to a .c file means that you also
> > need to update the meson.build file to say "and now it needs these
> > extra CFLAGS". Isn't there some way we can just have the CFLAGS
> > added more globally so that if we use gnutls.h directly or
> > indirectly from more .c files in future it Just Works ?
> > 
> > If the build failed for the common Linux case then it would be
> > at least more obvious that you needed to update the meson.build
> > files. I think it's better to avoid "you need to do this special
> > thing that you'll only notice you're missing if you happen to test
> > on a somewhat obscure host configuration" where we can.
> > 
> > (We don't want to link helper binaries etc against gnutls if
> > they don't need it, but that's LDFLAGS, not CFLAGS.)
> 
> The gnutls dependency will already propagate from
> 
> if 'CONFIG_GNUTLS' in config_host
>   crypto_ss.add(gnutls)
> endif
> 
> to
> 
> libcrypto = static_library('crypto', crypto_ss.sources() + genh,
>                           dependencies: [crypto_ss.dependencies()], ...)
> crypto = declare_dependency(link_whole: libcrypto,
>                             dependencies: [authz, qom])
> 

Hi Paolo,

I'm sorry I didn't reply earlier. As I showed in an example to Peter
(https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00085.html):
https://github.com/mesonbuild/meson/commit/ff5dc65ef841857dd306694dff1fb1cd2bf801e4

The approach doesn't propogate dependencies of crypto beyond libcrypto.
i.e. if you specify crypto somewhere else as depedency, it won't pull
CFLAGS needed for gnutls.

> That is, Meson does know that everything that needs crypto needs gnutls (see
> get_dependencies in mesonbuild/build.py if you're curious).
> 

Thanks. I've been thinking to tinker with it (that's why I made the test case).
Sounds like meson has some issues with transitive dependencies.

> I think the issue is that dependencies are listed too late---in the
> declare_dependency rather than the static_library.  Take io/ for example:
> 
> libio = static_library('io', io_ss.sources() + genh,
>                        dependencies: [io_ss.dependencies()],
>                        link_with: libqemuutil,
>                        name_suffix: 'fa',
>                        build_by_default: false)
> io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
> 
> Listing "crypto" in io's declare_dependency is enough to propagate the
> gnutls LDFLAGS down to the executables, but it does not add the CFLAGS to
> io/ files itself.  So for the io/ files we aren't telling meson that they
> need crypto (and thus in turn gnutls on the include path).
> 
> The fix should be pretty simple and localized to the "Library dependencies"
> section of meson.build.  For the two libraries above, the fixed version
> would look like:
> 
> crypto_ss.add(authz, qom)
> libcrypto = ... # same as above
> crypto = declare_dependency(link_whole: libcrypto)
> 
> io_ss.add(crypto, qom)
> ...
> libio = ... # same as above
> io = declare_dependency(link_whole: libio)
> 
> (Roman, feel free to plunder the above if you want to turn it into a commit
> message, and if it's correct of course).
> 

Unfortunately it doesn't work, even if crypto is added to io_ss. I think
that's the same issue as in shown in test case above. The patch is
below:

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
index 372576f82c..c293ee39e4 100644
--- a/meson.build
+++ b/meson.build
@@ -1538,6 +1538,33 @@ libqemuutil = static_library('qemuutil',
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
+crypto_ss = crypto_ss.apply(config_host, strict: false)
+libcrypto = static_library('crypto', crypto_ss.sources() + genh,
+                           dependencies: [crypto_ss.dependencies()],
+                           name_suffix: 'fa',
+                           build_by_default: false)
+
+crypto = declare_dependency(link_whole: libcrypto,
+                            dependencies: [authz, qom])
+
 decodetree = generator(find_program('scripts/decodetree.py'),
                        output: 'decode-@BASENAME@.c.inc',
                        arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
@@ -1652,31 +1679,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
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
@@ -1684,7 +1686,7 @@ libio = static_library('io', io_ss.sources() + genh,
                        name_suffix: 'fa',
                        build_by_default: false)
 
-io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
+io = declare_dependency(link_whole: libio, dependencies: [qom])
 
 libmigration = static_library('migration', sources: migration_files + genh,
                               name_suffix: 'fa',


