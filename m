Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4595684B8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:08:13 +0200 (CEST)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91x6-0008Pv-BK
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o91kr-0000uc-MK
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o91ko-00048r-6V
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657101329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsMVx0eSLuwqtgBHt6UOAuJZbeeQAffG+xkrZYImL9U=;
 b=OtpexlYqE64AHgVB7i0MHKD7HIfkF6QkgtJgTNWgs72bVkge/Yl/AJBiSY+ce1VueAJiuO
 C3IWoYOxAEtfpU8an4/6qx5gPdOVEVA3LWpevImYLwE9DAxhCN0qZHkwh1z8sv2WMWShmx
 +31vlFJR6sgZEtowwBZ87EXapUSm61I=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-8uYsHO-7MlqCi1dnocz9Ew-1; Wed, 06 Jul 2022 05:55:28 -0400
X-MC-Unique: 8uYsHO-7MlqCi1dnocz9Ew-1
Received: by mail-il1-f197.google.com with SMTP id
 h28-20020a056e021d9c00b002dc15a95f9cso3983806ila.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WsMVx0eSLuwqtgBHt6UOAuJZbeeQAffG+xkrZYImL9U=;
 b=wsD/IzatSEWvbBPcyW+iH1vD/wUD8RBY0CMmQQ1gDXeaEWMqXbVFVHYlkG6b91dSne
 G2YkPgnxCf0n0eoObLuCXIg8h9+/iwA+ri2ET7W8mApBOE7FLZfEdRkT3kQYPtmLabaq
 fL7xtZwn6JQuo9j4StvHMvYLj+R6cd/GB65e9h2uCoKahWwTuQUCpYrJYomitAAIklhZ
 puoNIr1Zc3qWM/3NxpXWbUbZHK/+n3JnbeROO5vwD3aE0XPYkMcB9yYuuVX99pvIuj6G
 dQikbVjPknrwwMODn+VGys7tUnCCDA3wEwXFCU7Vu0XJ6CpL2TtfBlN+ZDMdisGTWslt
 DSHw==
X-Gm-Message-State: AJIora+56d49OEWSUOWfiK6mtwZXfXk8sNqZ9Zguxtes3MiQkJ1COoMM
 8dg+I0Ry//PZRmq0a7j+wEjevLgQ7qA2DmiWUMe3DQ77tPE+Jw88Uiss6k1JI5zSM3FwEvRUcp4
 NnDNNQwGqR2L9Fbfxnria7DMeArbyCiE=
X-Received: by 2002:a92:c7d3:0:b0:2dc:21e8:e2ff with SMTP id
 g19-20020a92c7d3000000b002dc21e8e2ffmr5287592ilk.3.1657101327794; 
 Wed, 06 Jul 2022 02:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ve+H32jxpB//qTYVAFor6X+XpZOY0+NA++F0P0t+AoPFBXlvQVRQDHwmsaJ5SLNfSxyn7HPJo/nJJCT1ZAlWc=
X-Received: by 2002:a92:c7d3:0:b0:2dc:21e8:e2ff with SMTP id
 g19-20020a92c7d3000000b002dc21e8e2ffmr5287558ilk.3.1657101327546; Wed, 06 Jul
 2022 02:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
 <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
 <YsPlP6t0ALDkF4MU@redhat.com>
 <CAELaAXxdBvtxf2fXu1OxerBH+dTY_iti8CF-GMgGZpaWxgK_Gg@mail.gmail.com>
 <YsRi0SfAK3SVwQ2H@redhat.com>
In-Reply-To: <YsRi0SfAK3SVwQ2H@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 6 Jul 2022 10:54:51 +0100
Message-ID: <CAELaAXz_xmBDQzCK3SdkryoAnynE0CRUBg4TNv6ZwntuenANkA@mail.gmail.com>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 5, 2022 at 5:12 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> On Tue, Jul 05, 2022 at 12:28:55PM +0100, Alberto Faria wrote:
> > On Tue, Jul 5, 2022 at 8:16 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> > >      for i in `git ls-tree --name-only -r HEAD:`
> > >      do
> > >         clang-tidy $i 1>/dev/null 2>&1
> > >      done
> >
> > All of those invocations are probably failing quickly due to missing
> > includes and other problems, since the location of the compilation
> > database and some other arguments haven't been specified.
>
> Opps yes, I was waaaay too minimalist in testing that.
>
> >
> > Accounting for those problems (and enabling just one random C++ check):
> >
> >     $ time clang-tidy -p build \
> >         --extra-arg-before=3D-Wno-unknown-warning-option \
> >         --extra-arg=3D'-isystem [...]' \
> >         --checks=3D'-*,clang-analyzer-cplusplus.Move' \
> >         $( find block -name '*.c' )
> >     [...]
> >
> >     real    3m0.260s
> >     user    2m58.041s
> >     sys     0m1.467s
>
> Only analysing the block tree, but if we consider a static analysis
> framework is desirable to use for whole of qemu.git, lets see the
> numbers for everything.
>
> What follows was done on  my P1 Gen2 thinkpad with 6 core / 12 threads,
> where I use 'make -j 12' normally.
>
> First as a benchmark, lets see a full compile of whole of QEMU (with
> GCC) on Fedora 36 x86_64
>
>     =3D> 14 minutes
>
>
> I find this waaaaay too slow though, so I typically configure QEMU with
> --target-list=3Dx86_64-softmmu since that suffices 90% of the time.
>
>    =3D> 2 minutes
>
>
> A 'make check' on this x86_64-only build takes another 2 minutes.
>
>
> Now, a static analysis baseline across the whole tree with default
> tests enabled
>
>  $ clang-tidy --quiet -p build $(git ls-tree -r --name-only HEAD: | grep =
'\.c$')
>
>   =3D> 45 minutes
>
> wow, wasn't expecting it to be that slow !
>
> Lets restrict to just the block/ dir
>
>  $ clang-tidy --quiet -p build $(find block -name '*.c')
>
>   =3D> 4 minutes
>
> And further restrict to just 1 simple check
>
>  $ clang-tidy --quiet   --checks=3D'-*,clang-analyzer-cplusplus.Move'  -p=
 build $(find block -name '*.c')
>   =3D> 2 minutes 30
>
>
> So extrapolated just that single check would probably work out
> at 30 mins for the whole tree.
>
> Overall this isn't cheap, and in the same order of magnitude
> as a full compile. I guess this shouldn't be that surprising
> really.
>
>
>
> > Single-threaded static-analyzer.py without any checks:
> >
> >     $ time ./static-analyzer.py build block -j 1
> >     Analyzed 79 translation units in 16.0 seconds.
> >
> >     real    0m16.665s
> >     user    0m15.967s
> >     sys     0m0.604s
> >
> > And with just the 'return-value-never-used' check enabled for a
> > somewhat fairer comparison:
> >
> >     $ time ./static-analyzer.py build block -j 1 \
> >         -c return-value-never-used
> >     Analyzed 79 translation units in 61.5 seconds.
> >
> >     real    1m2.080s
> >     user    1m1.372s
> >     sys     0m0.513s
> >
> > Which is good news!

(Well, good news for the Python libclang approach vs others like
clang-tidy plugins; bad news in absolute terms.)

>
> On my machine, a whole tree analysis allowing parallel execution
> (iiuc no -j arg means use all cores):
>
>   ./static-analyzer.py build  $(git ls-tree -r --name-only HEAD: | grep '=
\.c$'
>
>    =3D> 13 minutes
>
> Or just the block layer
>
>   ./static-analyzer.py build  $(find block -name '*.c')
>
>    =3D> 45 seconds
>
>
> So your script is faster than clang-tidy, which suggests python probably
> isn't the major dominating factor in speed, at least at this point in
> time.
>
>
> Still, a full tree analysis time of 13 minutes, compared to  my normal
> 'make' time of 2 minutes is an order of magnitude.

There goes my 10% overhead target...

>
>
> One thing that I noticed when doing this is that we can only really
> do static analysis of files that we can actually compile on the host.
> IOW, if on a Linux host, we don't get static analysis of code that
> is targetted at FreeBSD / Windows platforms. Obvious really, since
> libclang has to do a full parse and this will lack header files
> for those platforms. That's just the tradeoff you have to accept
> when using a compiler for static analysis, vs a tool that does
> "dumb" string based regex matching to detect mistakes. Both kinds
> of tools likely have their place for different tasks.

Right, I don't think there's anything reasonable we can do about this
limitation.

>
>
> Overall I think a libclang based analysis tool will be useful, but
> I can't see us enabling it as a standard part of 'make check'
> given the time penalty.
>
>
> Feels like something that'll have to be opt-in to a large degree
> for regular contributors. In terms of gating CI though, it is less
> of an issue, since we massively parallelize jobs. As long as we
> have a dedicated build job just for running this static analysis
> check in isolation, and NOT as 'make check' in all existing jobs,
> it can happen in parallel with all the other build jobs, and we
> won't notice the speed.
>
> In summary, I think this approach is viable despite the speed
> penalty provided we dont wire it into 'make check' by default.

Agreed. Thanks for gathering these numbers.

Making the script use build dependency information, to avoid
re-analyzing translation units that weren't modified since the last
analysis, should make it fast enough to be usable iteratively during
development. Header precompilation could also be worth looking into.
Doing that + running a full analysis in CI should be good enough.

Alberto

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


