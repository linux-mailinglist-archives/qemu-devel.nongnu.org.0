Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCDA4AF340
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:50:57 +0100 (CET)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHnN0-000825-Gk
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHn6K-0001sD-Og
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:33:40 -0500
Received: from [2607:f8b0:4864:20::32a] (port=46806
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHn6I-0005oh-2x
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:33:40 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso1470705otv.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 05:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q0JWghIUiRjaQPA5WWdsa91hgpWtf9dwOzPmavocJG0=;
 b=UFzoA9wCq2iWLDcUVGYLX5DZdzs4+y7GF7i7M76wBRwRe7YAUT7OqBAHa5RI7PZbfK
 Sl+ILLvNEUn7I3+A4+shqUZR+EFUPDx6PKinepHnC9l7vUpG5cwVUvLMIxnDaYTjaYRI
 1QjuW4uV4Ivtuyy3XcTkL2i7xcBlakndXA1jOxEkFHcfj8MOa50dOie1jMLb775JjLns
 mMLJ+rXkjICLiincakW8WHFoTa5Bf45fvaSLlcrMP42qTekeCioqgtxMeaXUNSabA6UR
 IlJKl3zot1OZb712zBSPWnJmIbZvePbE+r8OVm4dvs6H6qOyIzHJ3D6jKfkhtLxW3B95
 4YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q0JWghIUiRjaQPA5WWdsa91hgpWtf9dwOzPmavocJG0=;
 b=UMnxVmj01CVq9uzpbylRHxryJvs14124m6FErB/oE4PEn7uv4//wNYtmsSecTQFxYp
 dS+oN0ZYGC2c0+j280nxt6q0nhGovS355FZGPh7iaCFK20ZN4CDwcCyRuTJyNrgR9k5d
 4JL7WF/fQ/XmbiTZSStwAm8/TIgZu6XF8UaXCDUpdN0H4fYxoXLUd2fwr6by86yZCmlt
 LrGT+Sl3AXBbTsqc4J0G9Zz3A7qyj6qXZOfZCy5/yDw2YP090ygiTMxFqg4E2thcX9RC
 yU4LwQrvGWal3Eop4TTO3DH2eacBNDweWjF4VwL6pdvwZAj5D4i7aSBnyhFZi7R+24pI
 WDsQ==
X-Gm-Message-State: AOAM531okznN3PNKq/WMnclttWRpUsiIY/wg+YPGpaOpht9ITmc0zb2k
 pjGgRxb+q1lnJ5RbiKF2BwgoPZh3jUl2NhD5QP4pB4LxLac=
X-Google-Smtp-Source: ABdhPJy0szqXX9PHm7VGq3ucj2Er6gHpHNra0zbu5LnQAEHOth3GWZhxddeROS3bipCZC5l9RQdi+AybLihZt2zN8t4=
X-Received: by 2002:a05:6830:22cd:: with SMTP id
 q13mr881706otc.186.1644413616802; 
 Wed, 09 Feb 2022 05:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV3e+WWqJrs7_fJ_xgEc99swYHBqUrY66XCrBFSsptwP5A@mail.gmail.com>
 <4809377.qIIDLkA7W8@silver> <4999355.dprqNvMIp6@silver>
 <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
In-Reply-To: <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 9 Feb 2022 22:33:25 +0900
Message-ID: <CAMVc7JXB4KUFbMDekXiVTVqT_UQVpy-y6C+Z8caaSC3FRwPjWg@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Will Cohen <wwcohen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 9, 2022 at 7:57 AM Will Cohen <wwcohen@gmail.com> wrote:
>
> On Tue, Feb 8, 2022 at 2:49 PM Christian Schoenebeck <qemu_oss@crudebyte.=
com> wrote:
>>
>> On Dienstag, 8. Februar 2022 19:28:21 CET Christian Schoenebeck wrote:
>> > On Dienstag, 8. Februar 2022 19:04:31 CET Will Cohen wrote:
>> > > On Tue, Feb 8, 2022 at 11:19 AM Will Cohen <wwcohen@gmail.com> wrote=
:
>> > > > On Tue, Feb 8, 2022 at 11:11 AM Christian Schoenebeck <
>> > > >
>> > > > qemu_oss@crudebyte.com> wrote:
>> > > >> On Dienstag, 8. Februar 2022 16:57:55 CET Will Cohen wrote:
>> > > >> > My inclination is to go with the __builtin_available(macOS 10.1=
2, *)
>> > > >>
>> > > >> path,
>> > > >>
>> > > >> > if acceptable, since it partially mirrors the API_AVAILABLE mac=
ro
>> > > >> > idea.
>> > > >>
>> > > >> I
>> > > >>
>> > > >> OTOH that's duplication of the ">=3D macOS 10.12" info, plus
>> > > >> __builtin_available
>> > > >> is direct use of a clang-only extension, whereas API_AVAILABLE() =
works
>> > > >> (or
>> > > >> more precisely: doesn't error out at least) with other compilers =
like
>> > > >> GCC
>> > > >> as
>> > > >> well. GCC is sometimes used for cross-compilation.
>> > > >>
>> > > >> Moreover, I would also add an error message in this case, e.g.:
>> > > >>     if (!pthread_fchdir_np) {
>> > > >>
>> > > >>         error_report_once("pthread_fchdir_np() is not available o=
n this
>> > > >>
>> > > >> macOS version");
>> > > >>
>> > > >>         return -ENOTSUPP;
>> > > >>
>> > > >>     }
>> > > >>
>> > > >> I should elaborate why I think this is needed: you are already do=
ing a
>> > > >> Meson
>> > > >> check for the existence of pthread_fchdir_np(), but the system wh=
ere
>> > > >> QEMU
>> > > >> is
>> > > >> compiled and the systems where the compiled binary will be runnin=
g,
>> > > >> might
>> > > >> be
>> > > >> different ones (i.e. different macOS versions).
>> > > >>
>> > > >> Best regards,
>> > > >> Christian Schoenebeck
>> > > >
>> > > > Agreed, that way actually closes the edge case. Something along th=
ese
>> > > > lines briefly crossed my mind during a previous version, but I qui=
ckly
>> > > > got
>> > > > passed it by assuming that the compiling entity would always be th=
e
>> > > > bottleneck, which makes no sense in hindsight, so I very much appr=
eciate
>> > > > that you caught this.
>> > >
>> > > Ah, rebuilding leads to a compiler error:
>> > >
>> > > ../os-posix.c:348:10: warning: address of function 'pthread_fchdir_n=
p'
>> > > will
>> > > always evaluate to 'true' [-Wpointer-bool-conversion]
>> > >
>> > >     if (!pthread_fchdir_np) {
>> > >
>> > >         ~^~~~~~~~~~~~~~~~~
>> > >
>> > > I don't have a machine that's pre-10.12 so I can't see what the resu=
lt is
>> > > there, but this might be why the __builtin_available approach got ta=
ken.
>> >
>> > I guess that's because you are compiling QEMU with minimum deployment =
target
>> > being macOS >=3D 10.12 already. In this case the compiler won't make
>> > pthread_fchdir_np a weak link, it only does emit a weak link if you ar=
e
>> > targeting macOS versions prior than the defined availablity attribute,
>> > hence the address would never be NULL here and hence the compiler warn=
ing.
>> >
>> > So I guess it is okay if you just omit checking presence of
>> > pthread_fchdir_np at runtime and just assume it exists.
>> >
>> > Added Akihiko on CC, just in case he would have something to add on th=
is
>> > macOS issue here. :)

Hi, Thanks for CCing me.

>>
>> On a second thought: this case a bit special. Are we worried that
>> pthread_fchdir_np() is "not yet" available on macOS, or "no longer" avai=
lable.
>> Probably both, right?
>>
>> So maybe it would make sense to replace the API_AVAILABLE() attribute di=
rectly
>> with a __attribute__((weak)) attribute. Then the runtime check with the
>> proposed error message would also trigger if a bleeding edge macOS versi=
on no
>> longer has pthread_fchdir_np().
>>
>> Also keep in mind: there are always also the MAC_OS_X_VERSION_MIN_REQUIR=
ED and
>> MAC_OS_X_VERSION_MAX_ALLOWED macros to query the deployment target at co=
mpile
>> time to wrap deployment target dependent code accordingly.
>>
>> On doubt you could just make some tests there by simply "inventing" a no=
n-
>> existent function.
>>
>> Best regards,
>> Christian Schoenebeck
>
>
> I like the idea of switching it to __attribute__((weak)). I should note t=
hat I'm not sure that I can actually fully test this out since I'm getting =
stuck with the linker noting my undefined fake function during the build, b=
ut the idea does make logical sense to me for the future fail case and the =
happy case builds again when implemented with actual pthread_fchdir_np:
>
> [1075/2909] Linking target qemu-nbd
> FAILED: qemu-nbd
> cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dead_strip_dylib=
s -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_load lib=
blockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto.fa -Wl,-f=
orce_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_load libio.fa -f=
stack-protector-strong -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib -Wl,-r=
path,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a libblockdev.fa libbl=
ock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms /usr/local/C=
ellar/gnutls/3.7.3/lib/libgnutls.dylib -lutil -L/usr/local/Cellar/glib/2.70=
.3/lib -L/usr/local/opt/gettext/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lin=
tl -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib -lgio-2=
.0 -lgobject-2.0 -lglib-2.0 -lintl -lm -L/usr/local/Cellar/glib/2.70.3/lib =
-L/usr/local/opt/gettext/lib -lgmodule-2.0 -lglib-2.0 -lintl /usr/local/Cel=
lar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2 -framework CoreFoundatio=
n -framework IOKit -lcurl -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/=
opt/gettext/lib -lgmodule-2.0 -lglib-2.0 -lintl -lbz2 /usr/local/Cellar/lib=
ssh/0.9.6/lib/libssh.dylib -lpam
> Undefined symbols for architecture x86_64:
>   "_pthread_fchdir_npfoo", referenced from:
>       _qemu_mknodat in libblockdev.fa(os-posix.c.o)
> ld: symbol(s) not found for architecture x86_64
> clang: error: linker command failed with exit code 1 (use -v to see invoc=
ation)
> ninja: build stopped: subcommand failed.
> make[1]: *** [run-ninja] Error 1
> make: *** [all] Error 2
>
> With that caveat re testing in mind, unless there's another recommended p=
ath forward, I think it makes sense to stick with __attribute__((weak)) and=
 prepare v6 which incorporates this and all the other feedback from this ro=
und.

__attribute__((weak_import)), which explicitly marks the function as
external, is more appropriate here. It is feature-equivalent with the
availability attribute when the minimum deployment target is lower
than the version which introduced the function.

Regards,
Akihiko Odaki

>
>>
>>
>> > > >> > guess it's perhaps a tradeoff between predicting the future unk=
nown
>> > > >> > availability of functions versus just ensuring a minimum macOS
>> > > >> > version
>> > > >>
>> > > >> and
>> > > >>
>> > > >> > hoping for the best. With any luck, the distinction between the=
 two
>> > > >> > approaches will be moot, if we try to assume that a future macO=
S
>> > > >> > version
>> > > >> > that removes this also provides mknodat.
>> > > >> >
>> > > >> > On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck <
>> > > >> >
>> > > >> > qemu_oss@crudebyte.com> wrote:
>> > > >> > > On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:
>> > > >> > > > On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck
>> > > >> > > > <qemu_oss@crudebyte.com>
>> > > >> > > >
>> > > >> > > > wrote:
>> > > >> > > > > On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
>> > > >> > > > > > From: Keno Fischer <keno@juliacomputing.com>
>> > > >> > > > > >
>> > > >> > > > > > Darwin does not support mknodat. However, to avoid race
>> > > >>
>> > > >> conditions
>> > > >>
>> > > >> > > > > > with later setting the permissions, we must avoid using=
 mknod
>> > > >> > > > > > on
>> > > >> > > > > > the full path instead. We could try to fchdir, but that=
 would
>> > > >>
>> > > >> cause
>> > > >>
>> > > >> > > > > > problems if multiple threads try to call mknodat at the=
 same
>> > > >>
>> > > >> time.
>> > > >>
>> > > >> > > > > > However, luckily there is a solution: Darwin includes a
>> > > >> > > > > > function
>> > > >> > > > > > that sets the cwd for the current thread only.
>> > > >> > > > > > This should suffice to use mknod safely.
>> > > >> > > > > >
>> > > >> > > > > > This function (pthread_fchdir_np) is protected by a che=
ck in
>> > > >> > > > > > meson in a patch later in tihs series.
>> > > >> > > > > >
>> > > >> > > > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
>> > > >> > > > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.=
com>
>> > > >> > > > > > [Will Cohen: - Adjust coding style
>> > > >> > > > > >
>> > > >> > > > > >              - Replace clang references with gcc
>> > > >> > > > > >              - Note radar filed with Apple for missing
>> > > >> > > > > >              syscall
>> > > >> > > > > >              - Replace direct syscall with pthread_fchd=
ir_np
>> > > >> > > > > >              and
>> > > >> > > > > >
>> > > >> > > > > >                adjust patch notes accordingly
>> > > >> > > > > >
>> > > >> > > > > >              - Move qemu_mknodat from 9p-util to osdep =
and
>> > > >>
>> > > >> os-posix]
>> > > >>
>> > > >> > > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
>> > > >> > > > > > ---
>> > > >> > > > >
>> > > >> > > > > Like already mentioned by me moments ago on previous v4 (=
just
>> > > >>
>> > > >> echoing)
>> > > >>
>> > > >> > > ...
>> > > >> > >
>> > > >> > > > > >  hw/9pfs/9p-local.c   |  4 ++--
>> > > >> > > > > >  include/qemu/osdep.h | 10 ++++++++++
>> > > >> > > > > >  os-posix.c           | 34 ++++++++++++++++++++++++++++=
++++++
>> > > >> > > > > >  3 files changed, 46 insertions(+), 2 deletions(-)
>> > > >> > > > > >
>> > > >> > > > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
>> > > >> > > > > > index a0d08e5216..d42ce6d8b8 100644
>> > > >> > > > > > --- a/hw/9pfs/9p-local.c
>> > > >> > > > > > +++ b/hw/9pfs/9p-local.c
>> > > >> > > > > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *f=
s_ctx,
>> > > >> > >
>> > > >> > > V9fsPath
>> > > >> > >
>> > > >> > > > > > *dir_path,
>> > > >> > > > > >
>> > > >> > > > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>> > > >> > > > > >
>> > > >> > > > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
>> > > >> > > > > >
>> > > >> > > > > > -        err =3D mknodat(dirfd, name, fs_ctx->fmode | S=
_IFREG,
>> > > >> > > > > > 0);
>> > > >> > > > > > +        err =3D qemu_mknodat(dirfd, name, fs_ctx->fmod=
e |
>> > > >>
>> > > >> S_IFREG,
>> > > >>
>> > > >> > > > > > 0);
>> > > >> > > > > >
>> > > >> > > > > >          if (err =3D=3D -1) {
>> > > >> > > > > >
>> > > >> > > > > >              goto out;
>> > > >> > > > > >
>> > > >> > > > > >          }
>> > > >> > > > > >
>> > > >> > > > > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *f=
s_ctx,
>> > > >> > >
>> > > >> > > V9fsPath
>> > > >> > >
>> > > >> > > > > > *dir_path, }
>> > > >> > > > > >
>> > > >> > > > > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHRO=
UGH ||
>> > > >> > > > > >
>> > > >> > > > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
>> > > >> > > > > >
>> > > >> > > > > > -        err =3D mknodat(dirfd, name, credp->fc_mode,
>> > > >>
>> > > >> credp->fc_rdev);
>> > > >>
>> > > >> > > > > > +        err =3D qemu_mknodat(dirfd, name, credp->fc_mo=
de,
>> > > >> > > > > > credp->fc_rdev);
>> > > >> > > > > >
>> > > >> > > > > >          if (err =3D=3D -1) {
>> > > >> > > > > >
>> > > >> > > > > >              goto out;
>> > > >> > > > > >
>> > > >> > > > > >          }
>> > > >> > > > > >
>> > > >> > > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.=
h
>> > > >> > > > > > index d1660d67fa..f3a8367ece 100644
>> > > >> > > > > > --- a/include/qemu/osdep.h
>> > > >> > > > > > +++ b/include/qemu/osdep.h
>> > > >> > > > > > @@ -810,3 +810,13 @@ static inline int
>> > > >> > > > > > platform_does_not_support_system(const char *command) #=
endif
>> > > >> > > > > >
>> > > >> > > > > >  #endif
>> > > >> > > > > >
>> > > >> > > > > > +
>> > > >> > > > > > +/*
>> > > >> > > > > > + * As long as mknodat is not available on macOS, this
>> > > >>
>> > > >> workaround
>> > > >>
>> > > >> > > > > > + * using pthread_fchdir_np is needed. qemu_mknodat is
>> > > >> > > > > > defined
>> > > >>
>> > > >> in
>> > > >>
>> > > >> > > > > > + * os-posix.c
>> > > >> > > > > > + */
>> > > >> > > > > > +#ifdef CONFIG_DARWIN
>> > > >> > > > > > +int pthread_fchdir_np(int fd);
>> > > >> > > > > > +#endif
>> > > >> > > > >
>> > > >> > > > > I would make that:
>> > > >> > > > >
>> > > >> > > > > #ifdef CONFIG_DARWIN
>> > > >> > > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12)=
);
>> > > >> > > > > #endif
>> > > >> > > > >
>> > > >> > > > > here and ...
>> > > >> > > > >
>> > > >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode=
_t
>> > > >> > > > > > mode,
>> > > >> > > > > > dev_t
>> > > >> > > > >
>> > > >> > > > > dev);
>> > > >> > > > >
>> > > >> > > > > > diff --git a/os-posix.c b/os-posix.c
>> > > >> > > > > > index ae6c9f2a5e..95c1607065 100644
>> > > >> > > > > > --- a/os-posix.c
>> > > >> > > > > > +++ b/os-posix.c
>> > > >> > > > > > @@ -24,6 +24,7 @@
>> > > >> > > > > >
>> > > >> > > > > >   */
>> > > >> > > > > >
>> > > >> > > > > >  #include "qemu/osdep.h"
>> > > >> > > > > >
>> > > >> > > > > > +#include <os/availability.h>
>> > > >> > > > > >
>> > > >> > > > > >  #include <sys/wait.h>
>> > > >> > > > > >  #include <pwd.h>
>> > > >> > > > > >  #include <grp.h>
>> > > >> > > > > >
>> > > >> > > > > > @@ -332,3 +333,36 @@ int os_mlock(void)
>> > > >> > > > > >
>> > > >> > > > > >      return -ENOSYS;
>> > > >> > > > > >
>> > > >> > > > > >  #endif
>> > > >> > > > > >  }
>> > > >> > > > > >
>> > > >> > > > > > +
>> > > >> > > > > > +/*
>> > > >> > > > > > + * As long as mknodat is not available on macOS, this
>> > > >>
>> > > >> workaround
>> > > >>
>> > > >> > > > > > + * using pthread_fchdir_np is needed.
>> > > >> > > > > > + *
>> > > >> > > > > > + * Radar filed with Apple for implementing mknodat:
>> > > >> > > > > > + * rdar://FB9862426
>> > > >> > > > > > (https://openradar.appspot.com/FB9862426)
>> > > >> > > > > > + */
>> > > >> > > > > > +#ifdef CONFIG_DARWIN
>> > > >> > > > > > +
>> > > >> > > > > > +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.=
12));
>> > > >> > > > >
>> > > >> > > > > ... drop the duplicate declaration of pthread_fchdir_np()=
 here.
>> > > >> > > >
>> > > >> > > > Trying this out, it reminds me that this use of API_AVAILAB=
LE in
>> > > >> > >
>> > > >> > > os-posix.c
>> > > >> > >
>> > > >> > > > relies on the added #include <os/availability.h>.
>> > > >> > > >
>> > > >> > > > Leaving the include out leads to:
>> > > >> > > > .../include/qemu/osdep.h:820:31: error: expected function b=
ody
>> > > >> > > > after
>> > > >> > > > function declarator
>> > > >> > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
>> > > >> > > >
>> > > >> > > >                               ^
>> > > >> > > >
>> > > >> > > > 1 error generated.
>> > > >> > > > ninja: build stopped: subcommand failed.
>> > > >> > > > make[1]: *** [run-ninja] Error 1
>> > > >> > > > make: *** [all] Error 2
>> > > >> > > >
>> > > >> > > > The admonition against modifying osdep.h's includes too muc=
h led
>> > > >> > > > me
>> > > >>
>> > > >> to
>> > > >>
>> > > >> > > > steer away from putting it all in there. If there's no issu=
e with
>> > > >>
>> > > >> adding
>> > > >>
>> > > >> > > > +#include <os/availability.h> to osdep.h, then this change =
makes
>> > > >>
>> > > >> sense
>> > > >>
>> > > >> > > > to
>> > > >> > > > me.
>> > > >> > >
>> > > >> > > If you embed that include into ifdefs, sure!
>> > > >> > >
>> > > >> > > #ifdef CONFIG_DARWIN
>> > > >> > > /* defines API_AVAILABLE(...) */
>> > > >> > > #include <os/availability.h>
>> > > >> > > #endif
>> > > >> > >
>> > > >> > > One more thing though ...
>> > > >> > >
>> > > >> > > > > > +
>> > > >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode=
_t
>> > > >> > > > > > mode,
>> > > >> > > > > > dev_t
>> > > >> > > > >
>> > > >> > > > > dev)
>> > > >> > > > >
>> > > >> > > > > > +{
>> > > >> > > > > > +    int preserved_errno, err;
>> > > >> > >
>> > > >> > > pthread_fchdir_np() is weakly linked. So I guess here should =
be a
>> > > >>
>> > > >> check
>> > > >>
>> > > >> > > like:
>> > > >> > >         if (!pthread_fchdir_np) {
>> > > >> > >
>> > > >> > >                 return -ENOTSUPP;
>> > > >> > >
>> > > >> > >         }
>> > > >> > >
>> > > >> > > Before trying to call pthread_fchdir_np() below. As already
>> > > >> > > discussed
>> > > >>
>> > > >> with
>> > > >>
>> > > >> > > the
>> > > >> > > Chromium [1] example, some do that a bit differently by using
>> > > >> > >
>> > > >> > > __builtin_available():
>> > > >> > >         if (__builtin_available(macOS 10.12, *)) {
>> > > >> > >
>> > > >> > >                 return -ENOTSUPP;
>> > > >> > >
>> > > >> > >         }
>> > > >> > >
>> > > >> > > Which makes me wonder why they are not doing a simple NULL ch=
eck?
>> > > >> > >
>> > > >> > > [1]
>> > > >>
>> > > >> https://chromium.googlesource.com/chromium/src/+/lkgr/base/proces=
s/laun
>> > > >> ch
>> > > >> _
>> > > >>
>> > > >> > > mac.cc#110>
>> > > >> > >
>> > > >> > > > > > +    if (pthread_fchdir_np(dirfd) < 0) {
>> > > >> > > > > > +        return -1;
>> > > >> > > > > > +    }
>> > > >> > > > > > +    err =3D mknod(filename, mode, dev);
>> > > >> > > > > > +    preserved_errno =3D errno;
>> > > >> > > > > > +    /* Stop using the thread-local cwd */
>> > > >> > > > > > +    pthread_fchdir_np(-1);
>> > > >> > > > > > +    if (err < 0) {
>> > > >> > > > > > +        errno =3D preserved_errno;
>> > > >> > > > > > +    }
>> > > >> > > > > > +    return err;
>> > > >> > > > > > +}
>> > > >> > > > > > +#else
>> > > >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode=
_t
>> > > >> > > > > > mode,
>> > > >> > > > > > dev_t
>> > > >> > > > >
>> > > >> > > > > dev)
>> > > >> > > > >
>> > > >> > > > > > +{
>> > > >> > > > > > +    return mknodat(dirfd, filename, mode, dev);
>> > > >> > > > > > +}
>> > > >> > > > > > +#endif
>> >
>> > Best regards,
>> > Christian Schoenebeck
>>
>>
>> Best regards,
>> Christian Schoenebeck
>>
>>

