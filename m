Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01B259BB41
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 10:21:32 +0200 (CEST)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ2gd-00051i-6x
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 04:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oQ2bc-0003Ij-HI; Mon, 22 Aug 2022 04:16:20 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oQ2ba-0007gL-5q; Mon, 22 Aug 2022 04:16:20 -0400
Received: by mail-lj1-x22e.google.com with SMTP id v10so9846523ljh.9;
 Mon, 22 Aug 2022 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=yYEGOsWoC9g9xfXQfkz9vofz7qOYVD3SIdNgqPXd3xc=;
 b=CcbM2zpmGvqauT7EZQmB6okyhvyd2bFGpfCWwikf15kwkOt43TfNzw/pCJjFRntriH
 yCM+2RcODlYiucRKYpJ2YuuNtWFcsS/z+sq57YU4pgSnNJF8dKPhgXEolQkZ3riqSQxn
 Ni6giKlsXXOZhBbvZ4FBHbNLUHlvEkFGhCaDddFCsdy9B8a1JMRuKtzD7KUFFV9ESBq/
 MdwIswtRys1zN4in+YpylsNMy2Pnq7TmORNpU9kMYPJ5TpSlW+qYX6wkb1nvX9EIRVgo
 wyXbW/VByYXnXj7W6octM7PNXL5W23fe52z657RdinZ6V1FdfLVMFmi73iFIBYmU8xu9
 QS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=yYEGOsWoC9g9xfXQfkz9vofz7qOYVD3SIdNgqPXd3xc=;
 b=MvuSZEcPKNqp5AVwbkk+vhYr85MFYudJv8dgjhaHaUFOxJr3KOK7WqycB8wRyUPaaI
 Fb9gCZB4Y7anm+dAeQbTBIc8ia3/BF9D6D9qqwnThgHZ+9YJkrrPLXIFhA1x2AYfOmEb
 f/eFPplxBjZEEL7gloqcXoTn60Co9KAo3yv9mtXCbUk3KIXjnfbrKe0cjGJBKkDIjZBo
 Gwx5+/9gH443dpZOW2jCENw5GsGEmxdsRunqgL/9z26vUjcAtwX2p625upKabCMgjSZg
 pHBq7CR9NtYQhx9hhy3vyKD02Ys6TduR/cGsAoagpfcg0n1QA5c3ztC57pY0DUiPFLuX
 tavw==
X-Gm-Message-State: ACgBeo2MnstA2L6o6YXWBIfjG41GJQWn4OxcsvgD70ZtzJaUHR+zgsJo
 prSSxWN/NVZLP6PScLvLhe8qIDbJnrm7Mv06ekI=
X-Google-Smtp-Source: AA6agR5AAXLuDNsV//CGBVIw/U/Qe8gU07vJ7/YU1R3nGgCYDyvG8UxpiFARZ9K28T51y19oLSfQQdxloGSHQFDqDdQ=
X-Received: by 2002:a2e:9049:0:b0:261:c790:948a with SMTP id
 n9-20020a2e9049000000b00261c790948amr2464864ljg.449.1661156174967; Mon, 22
 Aug 2022 01:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 <87o7wr5ew9.fsf@pond.sub.org>
 <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
 <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
 <CAJ+F1CLb=+gA=Keb3WgW3Mf84eWRikWVxV8HTjdQU8pFTVNMEg@mail.gmail.com>
 <YvTy8zYFQYAKqgoF@redhat.com> <87o7wqoqc1.fsf@pond.sub.org>
In-Reply-To: <87o7wqoqc1.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Aug 2022 12:16:03 +0400
Message-ID: <CAJ+F1C+DNUwtdwSgf+aAoAcJ6u_fn=txXfHG9QdGaC8o26cxkg@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, John Snow <jsnow@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b9b98d05e6d00fec"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000b9b98d05e6d00fec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 11, 2022 at 5:35 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> >> Hi
> >>
> >> On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell <peter.maydell@linaro.or=
g
> >
> >> wrote:
>
> [...]
>
> >> > As Markus says, your branch ends up moving most of qobject into
> >> > qemu-common/. We are never going to let that out of QEMU proper,
> >> > because we are never going to allow ourselves to be tied to API
> >> > compatibility with it as an external library. So anything that
> >> >
> >>
> >> Why is that? We do it with a lot of dependencies already, with stable
> APIs.
> >>
> >> Furthermore, we don't "have to" be tied to a specific ABI/API, we can
> >> continue to link statically and compile against a specific version. li=
ke
> >> with libvfio-user today.
> >>
> >> And at this point, I am _not_ proposing to have an extra "qemu-common"
> >> repository. I don't think there are enough reasons to want that either=
.
> >>
> >>
> >>
> >> > needs qobject is never going to leave the QEMU codebase. Which
> >> > means that there's not much gain from shoving it into subproject/
> >> > IMHO.
> >>
> >>
> >> (just to be extra clear, it's qobject not QOM we are talking about)
> >>
> >> qobject is fundamental to all the QAPI related generated code. Why
> should
> >> that remain tight to QEMU proper?
> >
> > Neither qobject nor QOM have ever been designed to be public APIs.
> > Though admittedly qobject is quite a bit simpler as an API, I'm
> > not convinced its current design is something we want to consider
> > public. As an example, just last month Markus proposed changing
> > QDict's implementation
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html
> >
> >
> > If we want external projects to be able to take advantage of QAPI,
> > the bare minimum we need to be public is a QAPI parser, from which
> > people can then build any code generators desired.
>
> Basically scripts/qapi/ less the code generators.
>
>
The generated code is used by qemu-ga & storage daemon, at least. They are
the first potential consumers, after qemu.


> Not sure a subproject would be a good fit.
>

(I won't repeat the arguments of structuring a project)


>
> Shot from the hip: could the build process spit out something external
> projects could consume?  It's how "consumables" are commonly delivered.
> E.g. .so + a bunch of headers.  Sometimes that gets packaged.  Sometimes
> it gets copied into the consuming tree ("vendored").
>
>
Not sure I follow, but that's just the "install" step isn't it ?

Sure, we could have a "qemu-devel", that ships qapi-gen, I guess. But then,
you would expect stability/versioning. That's not what I am proposing (at
least at this point), which is just about the build system and project
structure, so we can build and work on subprojects independently. (for ex,
in my wip branch, qemu-ga meson.build is 115 lines, doesn't need QEMU
configure etc)



> > We don't neccessarily need the current QAPI C code generator. There
> > could be a new C generator that didn't use qobject, but instead used
> > some standard GLib types like GHashTable/GList instead of QDict/QList.
>
> Yes, that should be possible.
>
>
I can't see much benefit from doing that extra work. It would create two C
APIs, making future bindings efforts more difficult etc.

QObject is very much like GValue though (the naming is better too :), just
like the QOM & GObject story.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b9b98d05e6d00fec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 5:35 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Da=
niel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"=
_blank">berrange@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-Andr=C3=A9 Lureau wrote=
:<br>
&gt;&gt; Hi<br>
&gt;&gt; <br>
&gt;&gt; On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&=
gt;<br>
&gt;&gt; wrote:<br>
<br>
[...]<br>
<br>
&gt;&gt; &gt; As Markus says, your branch ends up moving most of qobject in=
to<br>
&gt;&gt; &gt; qemu-common/. We are never going to let that out of QEMU prop=
er,<br>
&gt;&gt; &gt; because we are never going to allow ourselves to be tied to A=
PI<br>
&gt;&gt; &gt; compatibility with it as an external library. So anything tha=
t<br>
&gt;&gt; &gt;<br>
&gt;&gt; <br>
&gt;&gt; Why is that? We do it with a lot of dependencies already, with sta=
ble APIs.<br>
&gt;&gt; <br>
&gt;&gt; Furthermore, we don&#39;t &quot;have to&quot; be tied to a specifi=
c ABI/API, we can<br>
&gt;&gt; continue to link statically and compile against a specific version=
. like<br>
&gt;&gt; with libvfio-user today.<br>
&gt;&gt; <br>
&gt;&gt; And at this point, I am _not_ proposing to have an extra &quot;qem=
u-common&quot;<br>
&gt;&gt; repository. I don&#39;t think there are enough reasons to want tha=
t either.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; &gt; needs qobject is never going to leave the QEMU codebase. Whic=
h<br>
&gt;&gt; &gt; means that there&#39;s not much gain from shoving it into sub=
project/<br>
&gt;&gt; &gt; IMHO.<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; (just to be extra clear, it&#39;s qobject not QOM we are talking a=
bout)<br>
&gt;&gt; <br>
&gt;&gt; qobject is fundamental to all the QAPI related generated code. Why=
 should<br>
&gt;&gt; that remain tight to QEMU proper?<br>
&gt;<br>
&gt; Neither qobject nor QOM have ever been designed to be public APIs.<br>
&gt; Though admittedly qobject is quite a bit simpler as an API, I&#39;m<br=
>
&gt; not convinced its current design is something we want to consider<br>
&gt; public. As an example, just last month Markus proposed changing<br>
&gt; QDict&#39;s implementation<br>
&gt;<br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00=
758.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2022-07/msg00758.html</a><br>
&gt;<br>
&gt;<br>
&gt; If we want external projects to be able to take advantage of QAPI,<br>
&gt; the bare minimum we need to be public is a QAPI parser, from which<br>
&gt; people can then build any code generators desired.<br>
<br>
Basically scripts/qapi/ less the code generators.<br>
<br></blockquote><div><br></div><div>The generated code is used by qemu-ga =
&amp; storage daemon, at least. They are the first potential consumers, aft=
er qemu.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Not sure a subproject would be a good fit.<br></blockquote><div><br></div><=
div>(I won&#39;t repeat the arguments of structuring a project)<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Shot from the hip: could the build process spit out something external<br>
projects could consume?=C2=A0 It&#39;s how &quot;consumables&quot; are comm=
only delivered.<br>
E.g. .so + a bunch of headers.=C2=A0 Sometimes that gets packaged.=C2=A0 So=
metimes<br>
it gets copied into the consuming tree (&quot;vendored&quot;).<br>
<br></blockquote><div><br></div><div>Not sure I follow, but that&#39;s just=
 the &quot;install&quot; step isn&#39;t it ?</div><div><br></div><div>Sure,=
 we could have a &quot;qemu-devel&quot;, that ships qapi-gen, I guess. But =
then, you would expect stability/versioning. That&#39;s not what I am propo=
sing (at least at this point), which is just about the build system and pro=
ject structure, so we can build and work on subprojects independently. (for=
 ex, in my wip branch, qemu-ga meson.build is 115 lines, doesn&#39;t need Q=
EMU configure etc)<br></div><div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; We don&#39;t neccessarily need the current QAPI C code generator. Ther=
e<br>
&gt; could be a new C generator that didn&#39;t use qobject, but instead us=
ed<br>
&gt; some standard GLib types like GHashTable/GList instead of QDict/QList.=
<br>
<br>
Yes, that should be possible.<br>
<br>
</blockquote></div><div><br></div><div>I can&#39;t see much benefit from do=
ing that extra work. It would create two C APIs, making future bindings eff=
orts more difficult etc.</div><div><br></div><div>QObject is very much like=
 GValue though (the naming is better too :), just like the QOM &amp; GObjec=
t story.<br></div><div><br></div><div>thanks</div><div><br></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></d=
iv>

--000000000000b9b98d05e6d00fec--

