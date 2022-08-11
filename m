Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B230C58FAF5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:53:21 +0200 (CEST)
Received: from localhost ([::1]:53118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM5oW-0005GS-AC
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oM5lZ-0002Vs-PD; Thu, 11 Aug 2022 06:50:17 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:38890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oM5lX-0002ED-UN; Thu, 11 Aug 2022 06:50:17 -0400
Received: by mail-lj1-x229.google.com with SMTP id x25so18885926ljm.5;
 Thu, 11 Aug 2022 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1gZWtclOB4MbUdhj5n25JfvNxLaA5EuvMg/3N7lzN14=;
 b=QF5BRAzXE6jAFqKCJWG0CIcetrl1J4GqPj0rxNK87a9VE0P05HKrefdTLFhJfCYm7K
 q9rukXzE0j1AzgZazdoVIGJtqpTUP1xDxEoNuOrPNIBv5ql/R0wFqufkeHhn1RVlzW7E
 +TSIHLSN4mVbIw83vO6P2hEdq+1XWqzQRe+fRr6gi7i7wQNRyW2adMwf+5jE49TTgs3y
 S4LOr4VjjWT6njjdec8vYpf+IZkuUB6smtiFaQBB22Sys2KI2ZHLJ0/nECXn4n7dmuhC
 kXxPqDoPob2cEXVMko+1nwZdYZVydFeYkWyGro/nuks7kssigtkmR/8ZSbQPCG5KnUzG
 qPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1gZWtclOB4MbUdhj5n25JfvNxLaA5EuvMg/3N7lzN14=;
 b=g1pGnc/CwDdiRUc59h1lhIFFiiGosc9L2UkWj6vQqWrBJVWn0YB8+e6SiMDFkCACRO
 clwyxqlheQiG7mHXiIHMA5Q6q8fNMg7M8OUxRuqIG4AblSt7uf4m8tlbGZQarCLMoW7C
 4QSJBKPJiP3qpPNpdL1RpBZSaBBfqjrObbwLGZlVI/UDoW2c0TkTi2Em8xyDcEJ8aV8Z
 zbp7Dok/HYxDCcq1jWue4Jodb2++5jC947kICvR2U4DxUYrPAf6qG2atOkW4haBLmizn
 loiGPFnShGln+sI04350jaRcMlpIKcDSc38LD8F/LiPqipINp1PNoH4D+WhkQYOnlENd
 MRnQ==
X-Gm-Message-State: ACgBeo34PDATgWLAFrgCiJCOgUPHMoEFYDqbsvlcRnUe3Rl7XKZh34/b
 fgDgleoDpe2Bps4G0oPb/U02UyMZbb6Z5r6XutQ=
X-Google-Smtp-Source: AA6agR5vvxs4+SEkK/H30HUM2sCer1wBfXqK0YU+nhGttUZk3m5q/swMJsF6229nJUAIMBRuwSycwWPmRHmL/GNLVtw=
X-Received: by 2002:a05:651c:4cf:b0:25e:690b:ab3e with SMTP id
 e15-20020a05651c04cf00b0025e690bab3emr9770695lji.94.1660215012707; Thu, 11
 Aug 2022 03:50:12 -0700 (PDT)
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
In-Reply-To: <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Aug 2022 14:50:01 +0400
Message-ID: <CAJ+F1CLb=+gA=Keb3WgW3Mf84eWRikWVxV8HTjdQU8pFTVNMEg@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
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
Content-Type: multipart/alternative; boundary="00000000000015537b05e5f4ee09"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

--00000000000015537b05e5f4ee09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 11 Aug 2022 at 11:09, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> > On Thu, Aug 11, 2022 at 1:05 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >> Your moves tear closely related code apart.  This is going to be a dra=
g
> >> for developers in general and maintainers in particular.
> >>
> >> Ergonomics suffer when related code is in multiple places.  Having to
> >> switch between directories and remember where is what will a constant
> >> low-level pain.  Things that used to be simple & quick, like git-grep
> >> qapi/*.c, become more involved.
> >>
> >
> > It's inevitable when a project grows. QEMU is already a very large
> project. Over the years, we have structured the project, by moving things
> and splitting in subdirectories. Imho, this is actually helpful in many
> ways, and we got used to it easily hopefully.
>
> I agree with this. But generally we've tried to do that by
> having the subdirectory splitting and naming match the
> structure of the codebase. The exception, which I strongly
> dislike, is that contrib/ is a grabbag of random stuff.
> subprojects/ is starting to feel like it is also turning
> into "place where random stuff ends up"...
>

Yes, most of contrib/* should probably be standalone projects. If only we
had some kind of common library/subproject :)

subproject/* is a meson *cough* convention (imposed location for
subprojects). If we don't want to depend on external released libraries,
that's just the way it is.


>
> > Do you see fundamental reasons why qemu-ga or (qemu-img, qemu-nbd,
> storage-daemon, virtiofsd, vhost-user-*, *helper, ivshmem* etc) need to b=
e
> tight to qemu code, release and management process? I am not saying it's
> time to move them out of qemu project, but I believe it's helpful to have
> code that is structured and can be compiled indepently.
> >
> > And by having "standalone" subprojects, we can more easily evolve in ne=
w
> directions, without touching the rest of the projects.
>
> As Markus says, your branch ends up moving most of qobject into
> qemu-common/. We are never going to let that out of QEMU proper,
> because we are never going to allow ourselves to be tied to API
> compatibility with it as an external library. So anything that
>

Why is that? We do it with a lot of dependencies already, with stable APIs.

Furthermore, we don't "have to" be tied to a specific ABI/API, we can
continue to link statically and compile against a specific version. like
with libvfio-user today.

And at this point, I am _not_ proposing to have an extra "qemu-common"
repository. I don't think there are enough reasons to want that either.



> needs qobject is never going to leave the QEMU codebase. Which
>
means that there's not much gain from shoving it into subproject/
> IMHO.


(just to be extra clear, it's qobject not QOM we are talking about)

qobject is fundamental to all the QAPI related generated code. Why should
that remain tight to QEMU proper?


thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000015537b05e5f4ee09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 2:22 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, 11 Aug 2022 at 11:09, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, Aug 11, 2022 at 1:05 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;&gt; Your moves tear closely related code apart.=C2=A0 This is going to=
 be a drag<br>
&gt;&gt; for developers in general and maintainers in particular.<br>
&gt;&gt;<br>
&gt;&gt; Ergonomics suffer when related code is in multiple places.=C2=A0 H=
aving to<br>
&gt;&gt; switch between directories and remember where is what will a const=
ant<br>
&gt;&gt; low-level pain.=C2=A0 Things that used to be simple &amp; quick, l=
ike git-grep<br>
&gt;&gt; qapi/*.c, become more involved.<br>
&gt;&gt;<br>
&gt;<br>
&gt; It&#39;s inevitable when a project grows. QEMU is already a very large=
 project. Over the years, we have structured the project, by moving things =
and splitting in subdirectories. Imho, this is actually helpful in many way=
s, and we got used to it easily hopefully.<br>
<br>
I agree with this. But generally we&#39;ve tried to do that by<br>
having the subdirectory splitting and naming match the<br>
structure of the codebase. The exception, which I strongly<br>
dislike, is that contrib/ is a grabbag of random stuff.<br>
subprojects/ is starting to feel like it is also turning<br>
into &quot;place where random stuff ends up&quot;...<br></blockquote><div><=
br></div><div>Yes, most of contrib/* should probably be standalone projects=
. If only we had some kind of common library/subproject :)<br></div><div>=
=C2=A0</div><div>subproject/* is a meson *cough* convention (imposed locati=
on for subprojects). If we don&#39;t want to depend on external released li=
braries, that&#39;s just the way it is.<br></div><div>=C2=A0 <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Do you see fundamental reasons why qemu-ga or (qemu-img, qemu-nbd, sto=
rage-daemon, virtiofsd, vhost-user-*, *helper, ivshmem* etc) need to be tig=
ht to qemu code, release and management process? I am not saying it&#39;s t=
ime to move them out of qemu project, but I believe it&#39;s helpful to hav=
e code that is structured and can be compiled indepently.<br>
&gt;<br>
&gt; And by having &quot;standalone&quot; subprojects, we can more easily e=
volve in new directions, without touching the rest of the projects.<br>
<br>
As Markus says, your branch ends up moving most of qobject into<br>
qemu-common/. We are never going to let that out of QEMU proper,<br>
because we are never going to allow ourselves to be tied to API<br>
compatibility with it as an external library. So anything that<br></blockqu=
ote><div><br></div><div>Why is that? We do it with a lot of dependencies al=
ready, with stable APIs.<br></div><div><br></div><div>Furthermore, we don&#=
39;t &quot;have to&quot; be tied to a specific ABI/API, we can continue to =
link statically and compile against a specific version. like with libvfio-u=
ser today.</div><div><br></div><div>And at this point, I am _not_ proposing=
 to have an extra &quot;qemu-common&quot; repository. I don&#39;t think the=
re are enough reasons to want that either.<br></div><div><br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
needs qobject is never going to leave the QEMU codebase. Which <br></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
means that there&#39;s not much gain from shoving it into subproject/<br></=
div>
IMHO.</blockquote><div><br></div></div><div class=3D"gmail_quote">(just to =
be extra clear, it&#39;s qobject not QOM we are talking about)<br></div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">qobject is fun=
damental to all the QAPI related generated code. Why should that remain tig=
ht to QEMU proper?<br></div><div><br></div><div><br></div><div>thanks</div>=
<div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000015537b05e5f4ee09--

