Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBE3BAA73
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 00:08:05 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lznnv-0004Hw-Lv
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 18:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lznmx-0003cS-Ec
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 18:07:03 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:35737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lznmv-000881-Cz
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 18:07:03 -0400
Received: by mail-vs1-xe32.google.com with SMTP id h18so4109833vsj.2
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 15:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9j8ZOJSCXCIsgKyjZaeCIK5LfIBKcHSHUenW9JMvYQ=;
 b=MnYoXRqwCalIeBDtngfEqCWR0Lbk9RaX0G07hda8W8u+FQ+d6yopA+AXM97tUAkzN4
 OvEnqpqULMTnmIjfCZrREcl1EGFzK/ukvzSFo1+1tJVQ/4F3i0vNf+FEzlF/MQAoV5RI
 tv50HDxFSSsFfqf/I/eTTzksVCunkAvDM3TafzhF9/ufji4/OGSnG43v/jW8GJwUHyaE
 xdIexBCRikyR2uNmy0PPHZZKDshD97Ps99spqiHF2BXlic2oB2NSFVV/3Ht//1Ed8Aaj
 JhiCMs74FHtkB/vB1ssID9xgL5BBNhsG5uzk578qJ4gh99yZOmPBmGp5ZUZ3FICsia/6
 zTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9j8ZOJSCXCIsgKyjZaeCIK5LfIBKcHSHUenW9JMvYQ=;
 b=lK8trg510jyUcHGebugkoHI6R71iPTNjITGnuda2SCQqmxyafbhuL18x/5g4/aqoeX
 hy8aGufNIkm8IIr9VtC6itQceCuaaYMx/cYxwEKBR8Gt34KIqv7uVSOaEmcgNlrsc0TL
 wCcGj3TwLPnHI7TbRQPAag93AoKHee7S9tN22+etGN0KxQtN0OpNDuKLmbzL9p+r+bVU
 6JqqQujSG7wD1FCrJN8L5WdGv2OQnUuqOmr8EzVSCA0oYjSq+UHRRe8SlHqd9PbpY4Oe
 b1IV+onLJDK7csohy/yH4gCqBUJENihtA2psHCaoxp+zVvLR56ndBEH0fp/krOi3yViE
 Aqkw==
X-Gm-Message-State: AOAM531urfuY1pO0UNlMtQ6K8reKWmqVFVvRkR/2iQu6L6XkWjuZjB/H
 A1QWp1KapHXFxaHAfq3/0BC/PhPha1nC4SvCqxg=
X-Google-Smtp-Source: ABdhPJxTFRu5KaawhvwLIoH/hW2iLRW1MdJ00eAHp0ot50MBVH5M23m8bTT8mCn9hDqT55H5YxfBiCHp0a9EY5fQEkM=
X-Received: by 2002:a67:770d:: with SMTP id s13mr5316206vsc.40.1625350020341; 
 Sat, 03 Jul 2021 15:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sat, 3 Jul 2021 18:06:49 -0400
Message-ID: <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009924c805c63f4a3d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009924c805c63f4a3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the compiler
complains about running out of memory. Best I can see, that's not what
actually happens, but that's the error message. I was going to investigate
this later, but this was the error which was causing the test with the
Haiku VM with that corresponding make target. My desktop & laptop have 64
GB, and I'm pretty sure it didn't get to that point.

/boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../=
../../x86_64-unknown-haiku/bin/ld:
error:
libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is
too large (0xffff405a bytes)
/boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../=
../../x86_64-unknown-haiku/bin/ld:
final link failed: memory exhausted
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
Makefile:158: recipe for target 'run-ninja' failed
make: *** [run-ninja] Error 1

/boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../=
../../x86_64-unknown-haiku/bin/ld:
final link failed: memory exhausted
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
Makefile:158: recipe for target 'run-ninja' failed
make: *** [run-ninja] Error 1

TPM is disabled as it's not supported in Haiku. Using that "finddir"
command for capstone was done that way in Haiku's build recipe, so I copied
it into the configure script. A quick test shows that pkg-config does find
it properly, so I'll remove the "finddir" command and test again.

TPM and "finddir" command in Haiku's recipe for qemu:
https://github.com/haikuports/haikuports/blob/master/app-emulation/qemu/qem=
u-6.0.0.recipe

=C3=8En s=C3=A2m., 3 iul. 2021 la 17:40, Peter Maydell <peter.maydell@linar=
o.org> a
scris:

> On Sat, 3 Jul 2021 at 22:10, Richard Zak <richard.j.zak@gmail.com> wrote:
> >
> > For Haiku: turn off TPM, disable mips & xtensa emulators as they won't
> compile on Haiku, use Haiku's capstone. I'm resending this as I previousl=
y
> sent to the wrong address. This should resolve the memory issue with "mak=
e
> vm-build-haiku.x86_64"
>
>
> So why don't the mips and xtensa emulators compile on Haiku?
> What goes wrong ?
>
> > Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
> > ---
> >  configure | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index e799d908a3..a965c6c72e 100755
> > --- a/configure
> > +++ b/configure
> > @@ -358,6 +358,7 @@ oss_lib=3D""
> >  bsd=3D"no"
> >  linux=3D"no"
> >  solaris=3D"no"
> > +haiku=3D"no"
> >  profiler=3D"no"
> >  cocoa=3D"auto"
> >  softmmu=3D"yes"
> > @@ -769,7 +770,10 @@ SunOS)
> >  ;;
> >  Haiku)
> >    haiku=3D"yes"
> > -  QEMU_CFLAGS=3D"-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFL=
AGS"
> > +  tpm=3D"no"
>
> Why do we need to disable tpm?
>
> > +  capstone=3D"system"
> > +  target_list_exclude=3D"mips-softmmu mipsel-softmmu mips64-softmmu
> mips64el-softmmu xtensa-softmmu xtensaeb-softmmu"
> > +  QEMU_CFLAGS=3D"-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -I`finddi=
r
> B_SYSTEM_HEADERS_DIRECTORY`/capstone $QEMU_CFLAGS"
>
> It seems a bit odd that we have to manually put the capstone headers
> on the include path. meson.build runs pkg-config to ask where the system
> capstone headers are: does Haiku return the wrong value there?
>
> thanks
> -- PMM
>


--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--0000000000009924c805c63f4a3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For MIPS (all sub-targets, 64-bit and EL) &amp; xtens=
a(eb), the compiler complains about running out of memory. Best I can see, =
that&#39;s not what actually happens, but that&#39;s the error message. I w=
as going to investigate this later, but this was the error which was causin=
g the test with the Haiku VM with that corresponding make target. My deskto=
p &amp; laptop have 64 GB, and I&#39;m pretty sure it didn&#39;t get to tha=
t point.<br></div><div><br></div><div>/boot/system/develop/tools/bin/../lib=
/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld: er=
ror: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata=
) is too large (0xffff405a bytes)<br>/boot/system/develop/tools/bin/../lib/=
gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld: fin=
al link failed: memory exhausted<br>collect2: error: ld returned 1 exit sta=
tus<br>ninja: build stopped: subcommand failed.<br>Makefile:158: recipe for=
 target &#39;run-ninja&#39; failed<br>make: *** [run-ninja] Error 1<br><br>=
/boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../=
../../x86_64-unknown-haiku/bin/ld: final link failed: memory exhausted<br>c=
ollect2: error: ld returned 1 exit status<br>ninja: build stopped: subcomma=
nd failed.<br>Makefile:158: recipe for target &#39;run-ninja&#39; failed<br=
>make: *** [run-ninja] Error 1</div><div><br></div><div>TPM is disabled as =
it&#39;s not supported in Haiku. Using that &quot;finddir&quot; command for=
 capstone was done that way in Haiku&#39;s build recipe, so I copied it int=
o the configure script. A quick test shows that pkg-config does find it pro=
perly, so I&#39;ll remove the &quot;finddir&quot; command and test again.</=
div><div><br></div><div>TPM and &quot;finddir&quot; command in Haiku&#39;s =
recipe for qemu: <a href=3D"https://github.com/haikuports/haikuports/blob/m=
aster/app-emulation/qemu/qemu-6.0.0.recipe">https://github.com/haikuports/h=
aikuports/blob/master/app-emulation/qemu/qemu-6.0.0.recipe</a></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En=
 s=C3=A2m., 3 iul. 2021 la 17:40, Peter Maydell &lt;<a href=3D"mailto:peter=
.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; a scris:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 3 Jul 2021 at 22:10,=
 Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.com" target=3D"_blan=
k">richard.j.zak@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; For Haiku: turn off TPM, disable mips &amp; xtensa emulators as they w=
on&#39;t compile on Haiku, use Haiku&#39;s capstone. I&#39;m resending this=
 as I previously sent to the wrong address. This should resolve the memory =
issue with &quot;make vm-build-haiku.x86_64&quot;<br>
<br>
<br>
So why don&#39;t the mips and xtensa emulators compile on Haiku?<br>
What goes wrong ?<br>
<br>
&gt; Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.c=
om" target=3D"_blank">richard.j.zak@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 configure | 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/configure b/configure<br>
&gt; index e799d908a3..a965c6c72e 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -358,6 +358,7 @@ oss_lib=3D&quot;&quot;<br>
&gt;=C2=A0 bsd=3D&quot;no&quot;<br>
&gt;=C2=A0 linux=3D&quot;no&quot;<br>
&gt;=C2=A0 solaris=3D&quot;no&quot;<br>
&gt; +haiku=3D&quot;no&quot;<br>
&gt;=C2=A0 profiler=3D&quot;no&quot;<br>
&gt;=C2=A0 cocoa=3D&quot;auto&quot;<br>
&gt;=C2=A0 softmmu=3D&quot;yes&quot;<br>
&gt; @@ -769,7 +770,10 @@ SunOS)<br>
&gt;=C2=A0 ;;<br>
&gt;=C2=A0 Haiku)<br>
&gt;=C2=A0 =C2=A0 haiku=3D&quot;yes&quot;<br>
&gt; -=C2=A0 QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURC=
E $QEMU_CFLAGS&quot;<br>
&gt; +=C2=A0 tpm=3D&quot;no&quot;<br>
<br>
Why do we need to disable tpm?<br>
<br>
&gt; +=C2=A0 capstone=3D&quot;system&quot;<br>
&gt; +=C2=A0 target_list_exclude=3D&quot;mips-softmmu mipsel-softmmu mips64=
-softmmu mips64el-softmmu xtensa-softmmu xtensaeb-softmmu&quot;<br>
&gt; +=C2=A0 QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURC=
E -I`finddir B_SYSTEM_HEADERS_DIRECTORY`/capstone $QEMU_CFLAGS&quot;<br>
<br>
It seems a bit odd that we have to manually put the capstone headers<br>
on the include path. meson.build runs pkg-config to ask where the system<br=
>
capstone headers are: does Haiku return the wrong value there?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--0000000000009924c805c63f4a3d--

