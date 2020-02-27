Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB5172847
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 20:02:45 +0100 (CET)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7OQm-00015F-LF
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 14:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7OPN-000066-Rz
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 14:01:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7OPL-0007Dj-W1
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 14:01:17 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:44251)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j7OPL-0007CA-O2; Thu, 27 Feb 2020 14:01:15 -0500
Received: by mail-io1-xd44.google.com with SMTP id z16so599620iod.11;
 Thu, 27 Feb 2020 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5l3Bwc/fnEXGSzXcqlc0f2oadIx4CJAI5DRQN8nBqc=;
 b=atyPQD75l9vjnt98pxG4JQeschOKU1LJ1MKLTooYIDJdQDrvtHNvwI3dZqYBVS44r9
 KSN93BoZUfgh13e57EVETbh+kFFY+KC4QMJA3vZ9BGXlyfPab9P1rA0eKpsosxebCOQT
 KdHKv9cmzKixvj9bGY3yKMXxTBu8SRRf3C9J9/lY9k7HWH5otMrTzZ3rHhWdpYVNb5JE
 HY9iUoR8sFbR0zYBFNFBkoqMKIObXfK5MtT2zMuWOJwApcsgedJ0qrUdF9kTsGl3ewAS
 rpZZSnF8CQ+SZ3XfVGkdEPYGB+lgjAicLRCLRxEWjBU+PDwBzgWSGsxcq5dFeTwSthH2
 9PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5l3Bwc/fnEXGSzXcqlc0f2oadIx4CJAI5DRQN8nBqc=;
 b=iJwKqdfbZbIdcMZ4qpXpqrWMrrlkcF8UTn20Ukz7qIXIdGg5+NdZQ3YiQXm1SgqMs0
 cFCZqnPcmaQ/6vvmkZPbvtDPepAjkKw68THkV3TGz8NlHZpyTeSXZnMD7mAFVoSgnBq9
 SErztTvRlesGi3vJ/RuAawzh3iiKI3ATK+Q07c4AOLvsGCrLf/hRsaN5E7ulisWDL9u0
 +6nL9zK67FPKQ0tsRwojEEkkJuKMBExbyBGwmH93EmJaLGNBxKyc70uqj8DZfDaFmE8U
 254XJRAol44oLv/dGie3cdb+2gP0dk4d30a+2SaIkZuiJQJ9fSdI1BR9tW94gVoWCGLL
 OpWg==
X-Gm-Message-State: APjAAAXIBpR5hVb3W9PDIa/Au1LBW+fvKgbLddQQdc1JLMHLEo0EX5rF
 r/M9VLIVJEfhBrjWq81JPq4rHfZ8pYyWa7HqeLM=
X-Google-Smtp-Source: APXvYqwrZxGPkZEpaZULqKtHyIZY2jTxBwSPYJe7HrS0j49iKLmJ1E82vj/qqR6sfk1dSpKnSHtWkT2QDvBiae/twxY=
X-Received: by 2002:a5d:8f17:: with SMTP id f23mr586109iof.265.1582830074431; 
 Thu, 27 Feb 2020 11:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org>
 <CAPan3WqTdC9+Vc3SvUEs+KUW7Ow-MuyJ0PewUH6aPNs44LdJsg@mail.gmail.com>
 <87tv3cw7c0.fsf@linaro.org>
In-Reply-To: <87tv3cw7c0.fsf@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 27 Feb 2020 20:01:03 +0100
Message-ID: <CAPan3WpgbdJmqZ4_9eRrZ-WoWaqLA0TiDXg-y0DetkJ8NgAorg@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005390e8059f9358a6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005390e8059f9358a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, Feb 27, 2020 at 1:19 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>
> > Hi Alex,
> >
> > On Wed, Feb 26, 2020 at 7:13 PM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g>
> wrote:
> >
> >> While 32mb is certainly usable a full system boot ends up flushing the
> >> codegen buffer nearly 100 times. Increase the default on 64 bit hosts
> >> to take advantage of all that spare memory. After this change I can
> >> boot my tests system without any TB flushes.
> >>
> >
> > That great, with this change I'm seeing a performance improvement when
> > running the avocado tests for cubieboard.
> > It runs about 4-5 seconds faster. My host is Ubuntu 18.04 on 64-bit.
> >
> > I don't know much about the internals of TCG nor how it actually uses t=
he
> > cache,
> > but it seems logical to me that increasing the cache size would improve
> > performance.
> >
> > What I'm wondering is: will this also result in TCG translating larger
> > chunks in one shot, so potentially
> > taking more time to do the translation? If so, could it perhaps affect
> more
> > latency sensitive code?
>
> No - the size of the translation blocks is governed by the guest code
> and where it ends a basic block. In system mode we also care about
> crossing guest page boundaries.
>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>
> > Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >
> >
> >> ---
> >>  accel/tcg/translate-all.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> >> index 4ce5d1b3931..f7baa512059 100644
> >> --- a/accel/tcg/translate-all.c
> >> +++ b/accel/tcg/translate-all.c
> >> @@ -929,7 +929,11 @@ static void page_lock_pair(PageDesc **ret_p1,
> >> tb_page_addr_t phys1,
> >>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
> >>  #endif
> >>
> >> +#if TCG_TARGET_REG_BITS =3D=3D 32
> >>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
> >> +#else
> >> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)
> >> +#endif
> >>
> >
> > The qemu process now takes up more virtual memory, about ~2.5GiB in my
> > test, which can be expected with this change.
> >
> > Is it very likely that the TCG cache will be filled quickly and
> completely?
> > I'm asking because I also use Qemu to do automated testing
> > where the nodes are 64-bit but each have only 2GiB physical RAM.
>
> Well so this is the interesting question and as ever it depends.
>
> For system emulation the buffer will just slowly fill-up over time until
> exhausted and which point it will flush and reset. Each time the guest
> needs to flush a page and load fresh code in we will generate more
> translated code. If the guest isn't under load and never uses all it's
> RAM for code then in theory the pages of the mmap that are never filled
> never need to be actualised by the host kernel.
>
> You can view the behaviour by running "info jit" from the HMP monitor in
> your tests. The "TB Flush" value shows the number of times this has
> happened along with other information about translation state.
>

Thanks for clarifying this, now it all starts to make more sense to me.

Regards,
Niek


>
> >
> > Regards,
> > Niek
> >
> >
> >>
> >>  #define DEFAULT_CODE_GEN_BUFFER_SIZE \
> >>    (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
> >> --
> >> 2.20.1
> >>
> >>
> >>
>
>
> --
> Alex Benn=C3=A9e
>


--=20
Niek Linnenbank

--0000000000005390e8059f9358a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27, 2020 at 1:19 PM Alex Benn=
=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; On Wed, Feb 26, 2020 at 7:13 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt;&gt; While 32mb is certainly usable a full system boot ends up flushing=
 the<br>
&gt;&gt; codegen buffer nearly 100 times. Increase the default on 64 bit ho=
sts<br>
&gt;&gt; to take advantage of all that spare memory. After this change I ca=
n<br>
&gt;&gt; boot my tests system without any TB flushes.<br>
&gt;&gt;<br>
&gt;<br>
&gt; That great, with this change I&#39;m seeing a performance improvement =
when<br>
&gt; running the avocado tests for cubieboard.<br>
&gt; It runs about 4-5 seconds faster. My host is Ubuntu 18.04 on 64-bit.<b=
r>
&gt;<br>
&gt; I don&#39;t know much about the internals of TCG nor how it actually u=
ses the<br>
&gt; cache,<br>
&gt; but it seems logical to me that increasing the cache size would improv=
e<br>
&gt; performance.<br>
&gt;<br>
&gt; What I&#39;m wondering is: will this also result in TCG translating la=
rger<br>
&gt; chunks in one shot, so potentially<br>
&gt; taking more time to do the translation? If so, could it perhaps affect=
 more<br>
&gt; latency sensitive code?<br>
<br>
No - the size of the translation blocks is governed by the guest code<br>
and where it ends a basic block. In system mode we also care about<br>
crossing guest page boundaries.<br>
<br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt;<br>
&gt; Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.=
com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 accel/tcg/translate-all.c | 4 ++++<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c=
<br>
&gt;&gt; index 4ce5d1b3931..f7baa512059 100644<br>
&gt;&gt; --- a/accel/tcg/translate-all.c<br>
&gt;&gt; +++ b/accel/tcg/translate-all.c<br>
&gt;&gt; @@ -929,7 +929,11 @@ static void page_lock_pair(PageDesc **ret_p1,=
<br>
&gt;&gt; tb_page_addr_t phys1,<br>
&gt;&gt;=C2=A0 # define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 ((size_t)-1)<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt; +#if TCG_TARGET_REG_BITS =3D=3D 32<br>
&gt;&gt;=C2=A0 #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)<br>
&gt;&gt; +#else<br>
&gt;&gt; +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)<br>
&gt;&gt; +#endif<br>
&gt;&gt;<br>
&gt;<br>
&gt; The qemu process now takes up more virtual memory, about ~2.5GiB in my=
<br>
&gt; test, which can be expected with this change.<br>
&gt;<br>
&gt; Is it very likely that the TCG cache will be filled quickly and comple=
tely?<br>
&gt; I&#39;m asking because I also use Qemu to do automated testing<br>
&gt; where the nodes are 64-bit but each have only 2GiB physical RAM.<br>
<br>
Well so this is the interesting question and as ever it depends.<br>
<br>
For system emulation the buffer will just slowly fill-up over time until<br=
>
exhausted and which point it will flush and reset. Each time the guest<br>
needs to flush a page and load fresh code in we will generate more<br>
translated code. If the guest isn&#39;t under load and never uses all it&#3=
9;s<br>
RAM for code then in theory the pages of the mmap that are never filled<br>
never need to be actualised by the host kernel.<br>
<br>
You can view the behaviour by running &quot;info jit&quot; from the HMP mon=
itor in<br>
your tests. The &quot;TB Flush&quot; value shows the number of times this h=
as<br>
happened along with other information about translation state.<br></blockqu=
ote><div><br></div><div>Thanks for clarifying this, now it all starts to ma=
ke more sense to me.</div><div><br></div><div>Regards,</div><div>Niek<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Niek<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define DEFAULT_CODE_GEN_BUFFER_SIZE \<br>
&gt;&gt;=C2=A0 =C2=A0 (DEFAULT_CODE_GEN_BUFFER_SIZE_1 &lt; MAX_CODE_GEN_BUF=
FER_SIZE \<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000005390e8059f9358a6--

