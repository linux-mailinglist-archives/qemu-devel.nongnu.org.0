Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA44B13FE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:17:17 +0100 (CET)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nID4G-00056w-DM
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nIBf6-0005Fm-JQ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:47:12 -0500
Received: from [2a00:1450:4864:20::12c] (port=35726
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nIBf4-0002gV-9W
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:47:12 -0500
Received: by mail-lf1-x12c.google.com with SMTP id i34so11296274lfv.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vwu/WfbRlyFgIB4vXVMAKk3KDvxsTrSoR/OzH5sCu50=;
 b=pE1hNzHbe9qhRVt9Emz6s02CWodII2Rg+kWNYugT8Ke0YxTZDvvoGEsT59qBCI7Urd
 1lyu29/g31uxXoObBKwL0jyFnLbAvp51t81KB7vN1avO+X77XuzmWYMlVMXTa7MKUVlH
 SOU1Nftr7MdZlpF0ReKHq18B8UFoeTK6HtONzjp4qoJPqR2gFBr4fi5hsz2baPcNmPnf
 pZrQQj8tP+zjx6y9NEaPcSsf9d+BBGgt0Is9obojNkB7yAXaplWxROTmzFtdtCi5KlUo
 yOg9y0p34jyGJhrj11LPL85lUYwtQ/DRc6ca9HjlDYH6qo2jJDALXQ68yD8V6hjOt7Xb
 nNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vwu/WfbRlyFgIB4vXVMAKk3KDvxsTrSoR/OzH5sCu50=;
 b=PC3PHYdzuXrcQG5ZOZx++/5AIAhKDDHsZuvyLkrRY/9ahd2n+muWp+GA+PEw1LOGI6
 BOHu1fGHoSemimmR9kNZbfs3LhD6cwdZ+skDXlYIbebMcYTpjW9xyU8H/T1jF+BJsnFQ
 P5lD/sqdcPyCiWv/zw6XS/sVxfL6eJNwFKtn+jXb1PMNni+lfjC2xPMKCAfJPlZ6SLUB
 iGNEInnE8K7qNAeMWLkD3Kn/8rs/Ucod2kutHrcbzPk6zS//iqX70PTdmfw6HsVpQbSC
 I+OUFKOd7MBT4Ok/sX0+sTLk0bJXm/Bl92CdwwTvqMDoL6srNzZfWbsTjBT4aEuEtsgU
 8iHg==
X-Gm-Message-State: AOAM530lcFR2L1r/FN616f904BCzZT+E6FEze8eDy8G4bkliWJoR46XC
 6T/ADLDf+6/hYsI45VXLPvXcxjYAp4yZJ0UUmfE=
X-Google-Smtp-Source: ABdhPJy1Yip8Gm8eZaiKQ2PAU3T23j4+oAAH5+3Opevij3Wo2J5ytol/QQh+IVsDDSzeBLGBs1srthnNgU94EhdJ92Q=
X-Received: by 2002:a05:6512:33d4:: with SMTP id
 d20mr5589433lfg.108.1644508027925; 
 Thu, 10 Feb 2022 07:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
 <CAMVc7JXB4KUFbMDekXiVTVqT_UQVpy-y6C+Z8caaSC3FRwPjWg@mail.gmail.com>
 <7028769.ONZ7M9ntUb@silver>
 <CAB26zV2sdVq41CFdp3uJV76af9T=osNUHKiRpMr0kxS6OH5fGw@mail.gmail.com>
 <CAMVc7JVw-ATMfFTMCBgZEa+xEZFso1=QJAz9JP4AMf86YmRKEg@mail.gmail.com>
In-Reply-To: <CAMVc7JVw-ATMfFTMCBgZEa+xEZFso1=QJAz9JP4AMf86YmRKEg@mail.gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 10 Feb 2022 10:46:55 -0500
Message-ID: <CAB26zV2Z1bhQsYPsa4u5GaFfJn5=tR_jv49gdAeg8dvMyCJ0NA@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d5b8f405d7abdc19"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--000000000000d5b8f405d7abdc19
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 9, 2022 at 6:10 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On Thu, Feb 10, 2022 at 3:20 AM Will Cohen <wwcohen@gmail.com> wrote:
> >
> > On Wed, Feb 9, 2022 at 9:08 AM Christian Schoenebeck <
> qemu_oss@crudebyte.com> wrote:
> >>
> >> On Mittwoch, 9. Februar 2022 14:33:25 CET Akihiko Odaki wrote:
> >> > > I like the idea of switching it to __attribute__((weak)). I should
> note
> >> > > that I'm not sure that I can actually fully test this out since I'm
> >> > > getting stuck with the linker noting my undefined fake function
> during
> >> > > the build, but the idea does make logical sense to me for the
> future fail
> >> > > case and the happy case builds again when implemented with actual
> >> > > pthread_fchdir_np:
> >> > >
> >> > > [1075/2909] Linking target qemu-nbd
> >> > > FAILED: qemu-nbd
> >> > > cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o
> -Wl,-dead_strip_dylibs
> >> > > -Wl,-headerpad_max_install_names -Wl,-undefined,error
> -Wl,-force_load
> >> > > libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load
> libcrypto.fa
> >> > > -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa
> -Wl,-force_load
> >> > > libio.fa -fstack-protector-strong
> >> > > -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib
> >> > > -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a
> >> > > libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa
> libio.fa
> >> > > @block.syms /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib
> -lutil
> >> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> >> > > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl
> >> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> >> > > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm
> >> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> >> > > -lgmodule-2.0 -lglib-2.0 -lintl
> >> > > /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2
> >> > > -framework CoreFoundation -framework IOKit -lcurl
> >> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> >> > > -lgmodule-2.0 -lglib-2.0 -lintl -lbz2
> >> > > /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam>
> >> > > Undefined symbols for architecture x86_64:
> >> > >   "_pthread_fchdir_npfoo", referenced from:
> >> > >       _qemu_mknodat in libblockdev.fa(os-posix.c.o)
> >> > >
> >> > > ld: symbol(s) not found for architecture x86_64
> >> > > clang: error: linker command failed with exit code 1 (use -v to see
> >> > > invocation) ninja: build stopped: subcommand failed.
> >> > > make[1]: *** [run-ninja] Error 1
> >> > > make: *** [all] Error 2
> >> > >
> >> > > With that caveat re testing in mind, unless there's another
> recommended
> >> > > path forward, I think it makes sense to stick with
> __attribute__((weak))
> >> > > and prepare v6 which incorporates this and all the other feedback
> from
> >> > > this round.
> >> > __attribute__((weak_import)), which explicitly marks the function as
> >> > external, is more appropriate here. It is feature-equivalent with the
> >> > availability attribute when the minimum deployment target is lower
> >> > than the version which introduced the function.
> >>
> >> Thanks for chiming in on this macOS issue Akihiko!
> >>
> >> Are you sure that "weak_import" is still the preferred way? From
> behaviour PoV
> >> I do not see any difference at all. I can't even tell what the intended
> >> difference was, and QEMU currently only seems to use "weak" in the
> entire code
> >> base.
> >>
> >> Googling around, "weak_import" seems to be required on ancient OS X
> versions
> >> only and that it's now deprecated in favour of the more common "weak",
> no?
> >>
> >> Best regards,
> >> Christian Schoenebeck
> >
> >
> > Either way seems reasonable to me. For reference, what I'm seeing on
> Google and what Christian may be referring to is a circa-2016 conversation
> on GCC bugzilla, where a tentative conclusion seems to be that the
> distinction between the two is small and weak is probably preferred now:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69179
> >
>
> GCC doesn't maintain features specific to Apple well so we should look
> at clang. Compiling QEMU for macOS with GCC would result in errors
> anyway because QEMU uses clang extensions like availability checks and
> blocks for Apple's ABIs/APIs. clang still distinguishes
> __attribute__((weak)) and __attribute__((weak_import)).
>
> The present uses of __attribute__((weak)) in QEMU are correct and
> shouldn't be replaced with __attribute__((weak_import)) even when
> targeting macOS since they have default implementations and are
> statically resolved.
>
> Regards,
> Akihiko Odaki
>

Noted. v6 adjusts to use weak_import. Many thanks!

--000000000000d5b8f405d7abdc19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 9, 2022 at 6:10 PM Akihiko Od=
aki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Feb 10, 2022 at 3:20 AM Will Cohen &lt;<a=
 href=3D"mailto:wwcohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; On Wed, Feb 9, 2022 at 9:08 AM Christian Schoenebeck &lt;<a href=3D"ma=
ilto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mittwoch, 9. Februar 2022 14:33:25 CET Akihiko Odaki wrote:<br>
&gt;&gt; &gt; &gt; I like the idea of switching it to __attribute__((weak))=
. I should note<br>
&gt;&gt; &gt; &gt; that I&#39;m not sure that I can actually fully test thi=
s out since I&#39;m<br>
&gt;&gt; &gt; &gt; getting stuck with the linker noting my undefined fake f=
unction during<br>
&gt;&gt; &gt; &gt; the build, but the idea does make logical sense to me fo=
r the future fail<br>
&gt;&gt; &gt; &gt; case and the happy case builds again when implemented wi=
th actual<br>
&gt;&gt; &gt; &gt; pthread_fchdir_np:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; [1075/2909] Linking target qemu-nbd<br>
&gt;&gt; &gt; &gt; FAILED: qemu-nbd<br>
&gt;&gt; &gt; &gt; cc -m64 -mcx16=C2=A0 -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o=
 -Wl,-dead_strip_dylibs<br>
&gt;&gt; &gt; &gt; -Wl,-headerpad_max_install_names -Wl,-undefined,error -W=
l,-force_load<br>
&gt;&gt; &gt; &gt; libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_lo=
ad libcrypto.fa<br>
&gt;&gt; &gt; &gt; -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -W=
l,-force_load<br>
&gt;&gt; &gt; &gt; libio.fa -fstack-protector-strong<br>
&gt;&gt; &gt; &gt; -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib<br>
&gt;&gt; &gt; &gt; -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuut=
il.a<br>
&gt;&gt; &gt; &gt; libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libq=
om.fa libio.fa<br>
&gt;&gt; &gt; &gt; @block.syms /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls=
.dylib -lutil<br>
&gt;&gt; &gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/get=
text/lib<br>
&gt;&gt; &gt; &gt; -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl<br>
&gt;&gt; &gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/get=
text/lib<br>
&gt;&gt; &gt; &gt; -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm<br>
&gt;&gt; &gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/get=
text/lib<br>
&gt;&gt; &gt; &gt; -lgmodule-2.0 -lglib-2.0 -lintl<br>
&gt;&gt; &gt; &gt; /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -l=
z -lxml2<br>
&gt;&gt; &gt; &gt; -framework CoreFoundation -framework IOKit -lcurl<br>
&gt;&gt; &gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/get=
text/lib<br>
&gt;&gt; &gt; &gt; -lgmodule-2.0 -lglib-2.0 -lintl -lbz2<br>
&gt;&gt; &gt; &gt; /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam&gt=
;<br>
&gt;&gt; &gt; &gt; Undefined symbols for architecture x86_64:<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0&quot;_pthread_fchdir_npfoo&quot;, reference=
d from:<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_qemu_mknodat in libblockdev.f=
a(os-posix.c.o)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; ld: symbol(s) not found for architecture x86_64<br>
&gt;&gt; &gt; &gt; clang: error: linker command failed with exit code 1 (us=
e -v to see<br>
&gt;&gt; &gt; &gt; invocation) ninja: build stopped: subcommand failed.<br>
&gt;&gt; &gt; &gt; make[1]: *** [run-ninja] Error 1<br>
&gt;&gt; &gt; &gt; make: *** [all] Error 2<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; With that caveat re testing in mind, unless there&#39;s =
another recommended<br>
&gt;&gt; &gt; &gt; path forward, I think it makes sense to stick with __att=
ribute__((weak))<br>
&gt;&gt; &gt; &gt; and prepare v6 which incorporates this and all the other=
 feedback from<br>
&gt;&gt; &gt; &gt; this round.<br>
&gt;&gt; &gt; __attribute__((weak_import)), which explicitly marks the func=
tion as<br>
&gt;&gt; &gt; external, is more appropriate here. It is feature-equivalent =
with the<br>
&gt;&gt; &gt; availability attribute when the minimum deployment target is =
lower<br>
&gt;&gt; &gt; than the version which introduced the function.<br>
&gt;&gt;<br>
&gt;&gt; Thanks for chiming in on this macOS issue Akihiko!<br>
&gt;&gt;<br>
&gt;&gt; Are you sure that &quot;weak_import&quot; is still the preferred w=
ay? From behaviour PoV<br>
&gt;&gt; I do not see any difference at all. I can&#39;t even tell what the=
 intended<br>
&gt;&gt; difference was, and QEMU currently only seems to use &quot;weak&qu=
ot; in the entire code<br>
&gt;&gt; base.<br>
&gt;&gt;<br>
&gt;&gt; Googling around, &quot;weak_import&quot; seems to be required on a=
ncient OS X versions<br>
&gt;&gt; only and that it&#39;s now deprecated in favour of the more common=
 &quot;weak&quot;, no?<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Christian Schoenebeck<br>
&gt;<br>
&gt;<br>
&gt; Either way seems reasonable to me. For reference, what I&#39;m seeing =
on Google and what Christian may be referring to is a circa-2016 conversati=
on on GCC bugzilla, where a tentative conclusion seems to be that the disti=
nction between the two is small and weak is probably preferred now: <a href=
=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D69179" rel=3D"noreferrer=
" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D69179</a=
><br>
&gt;<br>
<br>
GCC doesn&#39;t maintain features specific to Apple well so we should look<=
br>
at clang. Compiling QEMU for macOS with GCC would result in errors<br>
anyway because QEMU uses clang extensions like availability checks and<br>
blocks for Apple&#39;s ABIs/APIs. clang still distinguishes<br>
__attribute__((weak)) and __attribute__((weak_import)).<br>
<br>
The present uses of __attribute__((weak)) in QEMU are correct and<br>
shouldn&#39;t be replaced with __attribute__((weak_import)) even when<br>
targeting macOS since they have default implementations and are<br>
statically resolved.<br>
<br>
Regards,<br>
Akihiko Odaki<br></blockquote><div><br></div><div>Noted. v6 adjusts to use =
weak_import. Many thanks! <br></div></div></div>

--000000000000d5b8f405d7abdc19--

