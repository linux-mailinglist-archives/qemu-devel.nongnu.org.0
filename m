Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AF2ED3CE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:57:27 +0100 (CET)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXfB-0004AW-V3
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxXe8-0003UX-AA; Thu, 07 Jan 2021 10:56:20 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:43180 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxXe3-0004oB-Lw; Thu, 07 Jan 2021 10:56:19 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E619F41277;
 Thu,  7 Jan 2021 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610034970;
 x=1611849371; bh=xdiQU9uODz3c4AuQODMNHs7+Gd0NMgoWOB+uCkPk3MM=; b=
 Wwvp6Ae3OGqNlb6neUQkOEbsEKtvsMY4efMUPdYK1IjXi3WK8cSTbFWUMpoLrtMo
 hnU4wvyLwl6x6g3OJKUlrOxabzYPFEp4Y2ByqhWPWk9cWHvRUl3szs6lsYAOfitH
 Ft1t0rBNGX8gs8XYxBoNeE8diHFrolChrDs6EX6kpw0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOOu5L9Wr3jF; Thu,  7 Jan 2021 18:56:10 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 21817411FD;
 Thu,  7 Jan 2021 18:56:10 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 7 Jan
 2021 18:56:09 +0300
Date: Thu, 7 Jan 2021 18:56:27 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
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

On Thu, Jan 07, 2021 at 12:41:40PM +0100, Paolo Bonzini wrote:
> On 05/01/21 15:37, Roman Bolshakov wrote:
> > Does it work if you do:
> > 
> > crypto_ss.add(authz, qom)
> > libcrypto = static_library('crypto', crypto_ss.sources() + genh,
> >                             dependencies: crypto_ss.dependencies(),
> >                             ...)
> > crypto = declare_dependency(link_whole: libcrypto,
> >                              dependencies: crypto_ss.dependencies())
> 
> Ok, so the final attempt is a mix of the three :)  Keep the link_whole
> dependencies in the declare_dependency, and add the sourceset dependencies
> there too.

Hi Paolo,

Thanks for the patch but unfortunately it doesn't resolve the issue.
io and other libraries can't still find gnutls.

I've also tried your meson trans-deps branch and wonder if it's supposed
to fix the issue without any changes to qemu build files?
Do you need any help with meson changes?

IMO duplication of dependencies shouldn't be needed for a build system.
Meta build system should allow private and public dependencies. Different
rules are applied to them. Private dependency is not propagated beyond a
target that uses it, public dependency is propagated. There's also
declare_dependency that has to be always public because it serves no
purpose on it's own. declare_dependency is like INTERFACE library in
CMake.

If a project specifies a dependency that is public, it should be
transitively passed downstream. Build system shouldn't obscurely hide
flags a dependency provides on case-by-case basis.

Right now it seems that meson is missing the notion of public and
private dependencies and that's where the problem arises. The post [1] (and
the related issue) summarizes what I'm trying to say.

If we resolve the issue, then we just specify gnutls as a public
dependency of crypto and all users of crypto would get gnutls headers.

Here's an example how clearly CMake approaches the issue [2][3]:

add_library(crypto OBJECT crypto-file1.c ...)
target_link_libraries(crypto PRIVATE aninternaldep
                             PUBLIC  gnutls
                                     anotherpublicdep)

1. https://github.com/mesonbuild/meson/issues/495#issuecomment-206178570
2. https://cmake.org/cmake/help/latest/command/target_link_libraries.html#linking-object-libraries
3. https://cmake.org/cmake/help/latest/command/target_link_libraries.html#libraries-for-a-target-and-or-its-dependents

Regards,
Roman

> 
> diff --git a/meson.build b/meson.build
> index e9bf290966..774df4db8e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1904,7 +1904,8 @@ libqom = static_library('qom', qom_ss.sources() +
> genh,
>                          dependencies: [qom_ss.dependencies()],
>                          name_suffix: 'fa')
> 
> -qom = declare_dependency(link_whole: libqom)
> +qom = declare_dependency(link_whole: libqom,
> +                         dependencies: [qom_ss.dependencies()])
> 
>  authz_ss = authz_ss.apply(config_host, strict: false)
>  libauthz = static_library('authz', authz_ss.sources() + genh,
> @@ -1913,7 +1914,7 @@ libauthz = static_library('authz', authz_ss.sources()
> + genh,
>                            build_by_default: false)
> 
>  authz = declare_dependency(link_whole: libauthz,
> -                           dependencies: qom)
> +                          dependencies: [authz_ss.dependencies(), qom])
> 
>  crypto_ss = crypto_ss.apply(config_host, strict: false)
>  libcrypto = static_library('crypto', crypto_ss.sources() + genh,
> @@ -1922,7 +1923,7 @@ libcrypto = static_library('crypto',
> crypto_ss.sources() + genh,
>                             build_by_default: false)
> 
>  crypto = declare_dependency(link_whole: libcrypto,
> -                            dependencies: [authz, qom])
> +                            dependencies: [crypto_ss.dependencies(), authz,
> qom])
> 
>  io_ss = io_ss.apply(config_host, strict: false)
>  libio = static_library('io', io_ss.sources() + genh,
> @@ -1931,13 +1932,14 @@ libio = static_library('io', io_ss.sources() + genh,
>                         name_suffix: 'fa',
>                         build_by_default: false)
> 
> -io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
> +io = declare_dependency(link_whole: libio,
> +                        dependencies: [io_ss.dependencies(), crypto, qom])
> 
>  libmigration = static_library('migration', sources: migration_files + genh,
>                                name_suffix: 'fa',
>                                build_by_default: false)
>  migration = declare_dependency(link_with: libmigration,
> -                               dependencies: [zlib, qom, io])
> +                               dependencies: [qom, io])
>  softmmu_ss.add(migration)
> 
>  block_ss = block_ss.apply(config_host, strict: false)
> @@ -1949,7 +1951,7 @@ libblock = static_library('block', block_ss.sources()
> + genh,
> 
>  block = declare_dependency(link_whole: [libblock],
>                             link_args: '@block.syms',
> -                           dependencies: [crypto, io])
> +                           dependencies: [block_ss.dependencies(), crypto,
> io])
> 
>  blockdev_ss = blockdev_ss.apply(config_host, strict: false)
>  libblockdev = static_library('blockdev', blockdev_ss.sources() + genh,
> @@ -1958,7 +1960,7 @@ libblockdev = static_library('blockdev',
> blockdev_ss.sources() + genh,
>                               build_by_default: false)
> 
>  blockdev = declare_dependency(link_whole: [libblockdev],
> -                              dependencies: [block])
> +                              dependencies: [blockdev_ss.dependencies(),
> block])
> 
>  qmp_ss = qmp_ss.apply(config_host, strict: false)
>  libqmp = static_library('qmp', qmp_ss.sources() + genh,
> @@ -1966,7 +1968,8 @@ libqmp = static_library('qmp', qmp_ss.sources() +
> genh,
>                          name_suffix: 'fa',
>                          build_by_default: false)
> 
> -qmp = declare_dependency(link_whole: [libqmp])
> +qmp = declare_dependency(link_whole: [libqmp],
> +                         dependencies: qmp_ss.dependencies())
> 
>  libchardev = static_library('chardev', chardev_ss.sources() + genh,
>                              name_suffix: 'fa',
> diff --git a/migration/meson.build b/migration/meson.build
> index 9645f44005..e1f237b5db 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -9,6 +9,7 @@ migration_files = files(
>  )
>  softmmu_ss.add(migration_files)
> 
> +softmmu_ss.add(zlib)
>  softmmu_ss.add(files(
>    'block-dirty-bitmap.c',
>    'channel.c',
> 

