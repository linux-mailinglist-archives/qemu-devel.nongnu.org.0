Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4034B0111
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:17:55 +0100 (CET)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwDi-0004Br-TY
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHw6l-0005qS-AK
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:10:43 -0500
Received: from [2607:f8b0:4864:20::234] (port=46797
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHw6j-00071z-1b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:10:42 -0500
Received: by mail-oi1-x234.google.com with SMTP id y23so4129149oia.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=efypP2B3dM6boxstCMKwlIIVkcj4DzZ+bQQs61rbt+s=;
 b=LQoE5gO0cVDJYC3jGR7pDngCmMD/8WAjIYmuVmZNuotpe5SHCPj6D7ISXhx+4MN67r
 x2/VdX7+PteWgjzSlUOGGlQHR947rmJYW8ptfxyATyXL5qCxdI72chEAEg/JGaj0TFUo
 tEHBFZNls1WEX6esyAPO14e/3Gra79V8sDrKor0UncvDRCdLal1mV9bXr3HnTBJDt8+p
 Vlr7Z+mVvWhx6EiAhpmmAPW2pfHnHW7a7aAVdvQCAED9aBPAfaxnETB4LiLi9Nwn9E9r
 b38n61ZJOUI8rWrknkA48iS0gz9Pplt4gVtpWcvkNd2h3FTnAaHaoCGNRiEDZU733/vD
 NaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=efypP2B3dM6boxstCMKwlIIVkcj4DzZ+bQQs61rbt+s=;
 b=fbco6Omvx1oeLf2oDBv89VOMRiwJDl0OdnwFaMS6X8QekG5HpDhkE4v7bQQpImJxBn
 +6IIuCPmJJKQow02TAYxC+sk9afE9TYRkm30h+M9xka6uynhNdKPQBF61C9zq+JCaCpZ
 6nujuZpEU/cYX11zDrAQ5BpY8wnEeLx5irg6Kd84voZ9SGpohIQoyeyKvCwIKo8ZMpJD
 7Keods9P0pFBu154K1pPpjxOqLMEM66yyWsNtasfs68F56Xyq75C0yPe4Q+YRRZUvHwQ
 b4Z3LkAKwSDcK0u6zCZY8HquW9WLw65KfpAHv3d+YmKBhsAaIq8eohQeluGH1Q+OPrLC
 xg4A==
X-Gm-Message-State: AOAM5316DU0/H1zd73cEBgBho+Y9lSRH+OQW1gUF5YY5Iu1rUQCZqz1X
 sBjUQksbFFeltC5KYTZTZKRi2LiJECBbFs8q460=
X-Google-Smtp-Source: ABdhPJzO1uJoAUXdlKnHdPAanVbvNhsfiMHEeVLD03YPzLmv/k+FIeo33Bs7vFQJaLYi8NGJYDByslIIBUo8RigQcsw=
X-Received: by 2002:a05:6808:1283:: with SMTP id
 a3mr2502803oiw.57.1644448239730; 
 Wed, 09 Feb 2022 15:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
 <CAMVc7JXB4KUFbMDekXiVTVqT_UQVpy-y6C+Z8caaSC3FRwPjWg@mail.gmail.com>
 <7028769.ONZ7M9ntUb@silver>
 <CAB26zV2sdVq41CFdp3uJV76af9T=osNUHKiRpMr0kxS6OH5fGw@mail.gmail.com>
In-Reply-To: <CAB26zV2sdVq41CFdp3uJV76af9T=osNUHKiRpMr0kxS6OH5fGw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 10 Feb 2022 08:10:29 +0900
Message-ID: <CAMVc7JVw-ATMfFTMCBgZEa+xEZFso1=QJAz9JP4AMf86YmRKEg@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Will Cohen <wwcohen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x234.google.com
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

On Thu, Feb 10, 2022 at 3:20 AM Will Cohen <wwcohen@gmail.com> wrote:
>
> On Wed, Feb 9, 2022 at 9:08 AM Christian Schoenebeck <qemu_oss@crudebyte.=
com> wrote:
>>
>> On Mittwoch, 9. Februar 2022 14:33:25 CET Akihiko Odaki wrote:
>> > > I like the idea of switching it to __attribute__((weak)). I should n=
ote
>> > > that I'm not sure that I can actually fully test this out since I'm
>> > > getting stuck with the linker noting my undefined fake function duri=
ng
>> > > the build, but the idea does make logical sense to me for the future=
 fail
>> > > case and the happy case builds again when implemented with actual
>> > > pthread_fchdir_np:
>> > >
>> > > [1075/2909] Linking target qemu-nbd
>> > > FAILED: qemu-nbd
>> > > cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dead_strip_=
dylibs
>> > > -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_loa=
d
>> > > libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto=
.fa
>> > > -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_loa=
d
>> > > libio.fa -fstack-protector-strong
>> > > -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib
>> > > -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a
>> > > libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.=
fa
>> > > @block.syms /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -luti=
l
>> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
>> > > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl
>> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
>> > > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm
>> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
>> > > -lgmodule-2.0 -lglib-2.0 -lintl
>> > > /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2
>> > > -framework CoreFoundation -framework IOKit -lcurl
>> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
>> > > -lgmodule-2.0 -lglib-2.0 -lintl -lbz2
>> > > /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam>
>> > > Undefined symbols for architecture x86_64:
>> > >   "_pthread_fchdir_npfoo", referenced from:
>> > >       _qemu_mknodat in libblockdev.fa(os-posix.c.o)
>> > >
>> > > ld: symbol(s) not found for architecture x86_64
>> > > clang: error: linker command failed with exit code 1 (use -v to see
>> > > invocation) ninja: build stopped: subcommand failed.
>> > > make[1]: *** [run-ninja] Error 1
>> > > make: *** [all] Error 2
>> > >
>> > > With that caveat re testing in mind, unless there's another recommen=
ded
>> > > path forward, I think it makes sense to stick with __attribute__((we=
ak))
>> > > and prepare v6 which incorporates this and all the other feedback fr=
om
>> > > this round.
>> > __attribute__((weak_import)), which explicitly marks the function as
>> > external, is more appropriate here. It is feature-equivalent with the
>> > availability attribute when the minimum deployment target is lower
>> > than the version which introduced the function.
>>
>> Thanks for chiming in on this macOS issue Akihiko!
>>
>> Are you sure that "weak_import" is still the preferred way? From behavio=
ur PoV
>> I do not see any difference at all. I can't even tell what the intended
>> difference was, and QEMU currently only seems to use "weak" in the entir=
e code
>> base.
>>
>> Googling around, "weak_import" seems to be required on ancient OS X vers=
ions
>> only and that it's now deprecated in favour of the more common "weak", n=
o?
>>
>> Best regards,
>> Christian Schoenebeck
>
>
> Either way seems reasonable to me. For reference, what I'm seeing on Goog=
le and what Christian may be referring to is a circa-2016 conversation on G=
CC bugzilla, where a tentative conclusion seems to be that the distinction =
between the two is small and weak is probably preferred now: https://gcc.gn=
u.org/bugzilla/show_bug.cgi?id=3D69179
>

GCC doesn't maintain features specific to Apple well so we should look
at clang. Compiling QEMU for macOS with GCC would result in errors
anyway because QEMU uses clang extensions like availability checks and
blocks for Apple's ABIs/APIs. clang still distinguishes
__attribute__((weak)) and __attribute__((weak_import)).

The present uses of __attribute__((weak)) in QEMU are correct and
shouldn't be replaced with __attribute__((weak_import)) even when
targeting macOS since they have default implementations and are
statically resolved.

Regards,
Akihiko Odaki

