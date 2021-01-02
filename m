Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94002E8799
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:18:09 +0100 (CET)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhjM-0006GV-8F
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvhi3-0005ja-G9; Sat, 02 Jan 2021 09:16:48 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:41458 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvhhz-0003td-ST; Sat, 02 Jan 2021 09:16:46 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6366241303;
 Sat,  2 Jan 2021 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609596999;
 x=1611411400; bh=poNrHgbN/WHDVYtaHsmEPwIoA0kNGy5ug5R37XAMnwQ=; b=
 vdLJsQmfT9AlNCCLnwPVGOWdQ57nU0Zi+CB2WxVbGYDEH5n81f1V9L8oz0vYhMHL
 vX0yoCQgZADIX0d9DLIlAujfiBvFJqxFn5q9j0YFmzT2qXnqMvUFrJY+JTcuv4Ct
 p+EIi34QY4o0kK07T7fLXQsfj6/h9GfI6jxR7t/pLf4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAt86KKTm6Ww; Sat,  2 Jan 2021 17:16:39 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9AD53412FD;
 Sat,  2 Jan 2021 17:16:39 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 2 Jan
 2021 17:16:39 +0300
Date: Sat, 2 Jan 2021 17:16:44 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/CATD8eBc/szGmM@SPB-NB-133.local>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, "open
 list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 02, 2021 at 01:25:07PM +0000, Peter Maydell wrote:
> On Sat, 2 Jan 2021 at 12:54, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > crypto/tlscreds.h includes GnuTLS headers if CONFIG_GNUTLS is set, but
> > GNUTLS_CFLAGS, that describe include path, are not propagated
> > transitively to all users of crypto and build fails if GnuTLS headers
> > reside in non-standard directory (which is a case for homebrew on Apple
> > Silicon).
> >
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> Ah, this is https://bugs.launchpad.net/qemu/+bug/1909256
> -- thanks for finding a fix.
> 

No problem :)

> > ---
> >  block/meson.build          | 2 +-
> >  io/meson.build             | 2 +-
> >  meson.build                | 5 +++--
> >  storage-daemon/meson.build | 2 +-
> >  tests/meson.build          | 6 +++---
> >  ui/meson.build             | 2 +-
> >  6 files changed, 10 insertions(+), 9 deletions(-)
> 
> > diff --git a/ui/meson.build b/ui/meson.build
> > index 013258a01c..e6655c94a6 100644
> > --- a/ui/meson.build
> > +++ b/ui/meson.build
> > @@ -29,7 +29,7 @@ vnc_ss.add(files(
> >    'vnc-ws.c',
> >    'vnc-jobs.c',
> >  ))
> > -vnc_ss.add(zlib, png, jpeg)
> > +vnc_ss.add(zlib, png, jpeg, gnutls)
> >  vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
> >  softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
> >  softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
> 
> Question to Paolo -- it seems pretty fragile to have to explicitly
> list "these source files need these extra CFLAGS" in half a dozen
> meson.build files, because it's pretty non-obvious that adding
> eg '#include "block/nbd.h"' to a .c file means that you also
> need to update the meson.build file to say "and now it needs these
> extra CFLAGS". Isn't there some way we can just have the CFLAGS
> added more globally so that if we use gnutls.h directly or
> indirectly from more .c files in future it Just Works ?
> 

Right. I converted a big C++ project to CMake 3 a few years ago and was
able to solve the problem in CMake because it properly supports
transitive dependencies.

In CMake I'd specify that crypto has public dependency on gnutls only
once and then all users of crypto (direct or indirect) would get
required CFLAGS, LDFLAGS and include directories.

I spent a few hours trying to figure out how to achieve the same in
meson (without code duplication and failed miserably). Here's a meson
project test that illustrates the problem of dependency duplication:

https://github.com/mesonbuild/meson/commit/ff5dc65ef841857dd306694dff1fb1cd2bf801e4

The project doesn't build because dependency on foo is not propagated
beyond foobar.

The only way to build it is to specify foo twice - in source set of
foobar and in declared_dependency (i.e. appending "dependencies: [foo]"
to declare_dependency helps).

Unfortunately, the approach doesn't work for meson/qemu because it
introduces duplicate symbols in different static libraries. That's why I
used much more uglier "specify headers where needed all over the code
base".

I'd be happy to hear what's the proper way to fix it.

Thanks,
Roman

> If the build failed for the common Linux case then it would be
> at least more obvious that you needed to update the meson.build
> files. I think it's better to avoid "you need to do this special
> thing that you'll only notice you're missing if you happen to test
> on a somewhat obscure host configuration" where we can.
> 
> (We don't want to link helper binaries etc against gnutls if
> they don't need it, but that's LDFLAGS, not CFLAGS.)
> 
> thanks
> -- PMM

