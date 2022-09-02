Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4C5AB164
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:29:21 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6jY-00043a-Hy
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oU6dP-0003Yj-MK; Fri, 02 Sep 2022 09:23:01 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:38506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oU6dL-0003vw-9d; Fri, 02 Sep 2022 09:22:57 -0400
Received: by mail-lf1-x12d.google.com with SMTP id q7so3293885lfu.5;
 Fri, 02 Sep 2022 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zc391TbnMfLCuJ5dr66T/2vdLqXYAYHTre6J+kwgXU4=;
 b=i4KplxUDVNHUHaqN51g/nR0IrUCEinT5WBxb77DhQHIxmxB7Xwn6qAOTuIOfO5WhLs
 MJbhezJyutZ95YOHACVSaWXvpM5hdbXT4nTViNAS5OdjZAvGynWclKHluq8qUM0QWKJK
 qwec4oZ2GXAmLc8LdsQRRXB6GH95FzuEa0GS3J6i8ZPjjNzI3lIlt4Dlh9DrG9NLw4Z+
 +gKbbwsTiQ1Z8cJ8oCjYzCnuA/VJTOTDlg7/G3xEXl4z4IRxR+WF/O/ve95G3Q9qtHbB
 0TQ8kIm6l54jhwh0ZIp0X88+L6QJx0nx25nM1Ayc4GXq8vWScTOsnqjvd++V+myLHZ+N
 VAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zc391TbnMfLCuJ5dr66T/2vdLqXYAYHTre6J+kwgXU4=;
 b=R6yznRldMt8sDdgZymjTy03HUvHwkY1hwXwLIstW2fqq6y75zGWaG8GJtaaN8+kZYz
 +MDxuthY4MxWi1isJD0XpVL8GSCSbjPvbNIvwEjGJ9yWw47JIfRfSG0ZxfSfH6vmeJs2
 fHyyssGpz/ad+4VXaGTuAKcGiKLKGlQU1SYH8R/ktQec/78Mw4fIw5O08MinFK4x8bBy
 mKxm5bPhkPR/Y0mZnL+5MRjqtNGA4gwpTfXAq6g8J8+xJ74SPGtF13WNkRIdSsbmmVhk
 oRQl/Bqp8f8BlCj89Jz1GlX1C3JVyYpxGLIRHvaC3VI/ftXpNFJ708DIdrg2uxd1/bj4
 eG3g==
X-Gm-Message-State: ACgBeo2/0EvPyAj9ZNH/HCgRTBlzvsNlpaTrhkp0raGL2eqX3tpv/Yv9
 PBfTjIVpw4LRNouqFEl74IaUkJK6Eyv5xRac6kY=
X-Google-Smtp-Source: AA6agR6z2h+HLJ3ofUk/YvuFUoSOEH1EmjUHy2fZgSawANHYYfigxSvUaU0cFEJJ4UIko84xLINPnrcYfe2AGd0zqZE=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr13521683lfu.167.1662124970491; Fri, 02
 Sep 2022 06:22:50 -0700 (PDT)
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
 <CAJ+F1C+DNUwtdwSgf+aAoAcJ6u_fn=txXfHG9QdGaC8o26cxkg@mail.gmail.com>
 <87o7vyt4b4.fsf@pond.sub.org>
In-Reply-To: <87o7vyt4b4.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 2 Sep 2022 17:22:38 +0400
Message-ID: <CAJ+F1CLpbpekNgaB6g+E6e2PPUtevvVJWG-9MxDzyoN=+UtnpA@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000070446705e7b1a0f6"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

--00000000000070446705e7b1a0f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 2, 2022 at 3:16 PM Markus Armbruster <armbru@redhat.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Thu, Aug 11, 2022 at 5:35 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >>
> >> > On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-Andr=C3=A9 Lureau wro=
te:
> >> >> Hi
> >> >>
> >> >> On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell <
> peter.maydell@linaro.org
> >> >
> >> >> wrote:
> >>
> >> [...]
> >>
> >> >> > As Markus says, your branch ends up moving most of qobject into
> >> >> > qemu-common/. We are never going to let that out of QEMU proper,
> >> >> > because we are never going to allow ourselves to be tied to API
> >> >> > compatibility with it as an external library. So anything that
> >> >> >
> >> >>
> >> >> Why is that? We do it with a lot of dependencies already, with stab=
le
> >> APIs.
> >> >>
> >> >> Furthermore, we don't "have to" be tied to a specific ABI/API, we c=
an
> >> >> continue to link statically and compile against a specific version.
> like
> >> >> with libvfio-user today.
> >> >>
> >> >> And at this point, I am _not_ proposing to have an extra
> "qemu-common"
> >> >> repository. I don't think there are enough reasons to want that
> either.
> >> >>
> >> >>
> >> >>
> >> >> > needs qobject is never going to leave the QEMU codebase. Which
> >> >> > means that there's not much gain from shoving it into subproject/
> >> >> > IMHO.
> >> >>
> >> >>
> >> >> (just to be extra clear, it's qobject not QOM we are talking about)
> >> >>
> >> >> qobject is fundamental to all the QAPI related generated code. Why
> >> should
> >> >> that remain tight to QEMU proper?
> >> >
> >> > Neither qobject nor QOM have ever been designed to be public APIs.
> >> > Though admittedly qobject is quite a bit simpler as an API, I'm
> >> > not convinced its current design is something we want to consider
> >> > public. As an example, just last month Markus proposed changing
> >> > QDict's implementation
> >> >
> >> > https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html
> >> >
> >> >
> >> > If we want external projects to be able to take advantage of QAPI,
> >> > the bare minimum we need to be public is a QAPI parser, from which
> >> > people can then build any code generators desired.
> >>
> >> Basically scripts/qapi/ less the code generators.
> >>
> >>
> > The generated code is used by qemu-ga & storage daemon, at least. They
> are
> > the first potential consumers, after qemu.
> >
> >
> >> Not sure a subproject would be a good fit.
> >>
> >
> > (I won't repeat the arguments of structuring a project)
> >
> >
> >>
> >> Shot from the hip: could the build process spit out something external
> >> projects could consume?  It's how "consumables" are commonly delivered=
.
> >> E.g. .so + a bunch of headers.  Sometimes that gets packaged.  Sometim=
es
> >> it gets copied into the consuming tree ("vendored").
> >>
> >>
> > Not sure I follow, but that's just the "install" step isn't it ?
> >
> > Sure, we could have a "qemu-devel", that ships qapi-gen, I guess. But
> then,
> > you would expect stability/versioning. That's not what I am proposing (=
at
> > least at this point), which is just about the build system and project
> > structure, so we can build and work on subprojects independently. (for
> ex,
> > in my wip branch, qemu-ga meson.build is 115 lines, doesn't need QEMU
> > configure etc)
>
> I'm afraid I'm still wobbly on the benefits of subprojects, or even how
> to work with them.
>
> How exactly would we "build and work independently" on the subprojects
> involving QAPI?  git-clone all of QEMU, but build only a subproject (and
> its dependencies)?  Am I confused?
>

Yes, QEMU repository would hold some subprojects (like libvhost-user
today), that you can build/develop independently with just meson / ninja.


>
> >> > We don't neccessarily need the current QAPI C code generator. There
> >> > could be a new C generator that didn't use qobject, but instead used
> >> > some standard GLib types like GHashTable/GList instead of QDict/QLis=
t.
> >>
> >> Yes, that should be possible.
> >>
> >>
> > I can't see much benefit from doing that extra work. It would create tw=
o
> C
> > APIs, making future bindings efforts more difficult etc.
>
> We need to distinguish client-side and server-side APIs / bindings.
>

Indeed.. although imho, it's best when both are similar, or use similar
types / concepts. (gdbus does a pretty good job, for ex)


>
> The existing C generator targets internal, server-side use.  It
> generates everything defined in the schema.
>
> The existing introspection generator generates data for external,
> client-side use (via QMP).  It generates just the subset visible in QMP.
>
> The proposed Go generator also targets external, client-side use (client
> bindings for QMP), and should also generate just the subset visible in
> QMP.
>
> So should a future C generator of client bindings for QMP.
>
> And then we'd have two distinct C APIs: a server-side one to help us
> implement QMP, and a client-side one to help use use QMP (QMP bindings).
>

In the qga subproject split wip I did, I am interested in the server side,
at this point.


>
> Whether the two would profit from sharing QObject is not clear to me
> at this point.
>

I think it would be great to provide a QObject based C client side binding,
if only for internal testing at this point. Whether to make this public and
guarantee some stability is another question.

But for now, my goal is only internal reorganization, not any
public/external API / project etc.

thanks


> > QObject is very much like GValue though (the naming is better too :),
> just
> > like the QOM & GObject story.
> >
> > thanks
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000070446705e7b1a0f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 2, 2022 at 3:16 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" targe=
t=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Thu, Aug 11, 2022 at 5:35 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com"=
 target=3D"_blank">berrange@redhat.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-Andr=C3=A9 Lur=
eau wrote:<br>
&gt;&gt; &gt;&gt; Hi<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro=
.org</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; [...]<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; As Markus says, your branch ends up moving most of q=
object into<br>
&gt;&gt; &gt;&gt; &gt; qemu-common/. We are never going to let that out of =
QEMU proper,<br>
&gt;&gt; &gt;&gt; &gt; because we are never going to allow ourselves to be =
tied to API<br>
&gt;&gt; &gt;&gt; &gt; compatibility with it as an external library. So any=
thing that<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Why is that? We do it with a lot of dependencies already,=
 with stable<br>
&gt;&gt; APIs.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Furthermore, we don&#39;t &quot;have to&quot; be tied to =
a specific ABI/API, we can<br>
&gt;&gt; &gt;&gt; continue to link statically and compile against a specifi=
c version. like<br>
&gt;&gt; &gt;&gt; with libvfio-user today.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; And at this point, I am _not_ proposing to have an extra =
&quot;qemu-common&quot;<br>
&gt;&gt; &gt;&gt; repository. I don&#39;t think there are enough reasons to=
 want that either.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; needs qobject is never going to leave the QEMU codeb=
ase. Which<br>
&gt;&gt; &gt;&gt; &gt; means that there&#39;s not much gain from shoving it=
 into subproject/<br>
&gt;&gt; &gt;&gt; &gt; IMHO.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; (just to be extra clear, it&#39;s qobject not QOM we are =
talking about)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; qobject is fundamental to all the QAPI related generated =
code. Why<br>
&gt;&gt; should<br>
&gt;&gt; &gt;&gt; that remain tight to QEMU proper?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Neither qobject nor QOM have ever been designed to be public =
APIs.<br>
&gt;&gt; &gt; Though admittedly qobject is quite a bit simpler as an API, I=
&#39;m<br>
&gt;&gt; &gt; not convinced its current design is something we want to cons=
ider<br>
&gt;&gt; &gt; public. As an example, just last month Markus proposed changi=
ng<br>
&gt;&gt; &gt; QDict&#39;s implementation<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022=
-07/msg00758.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.o=
rg/archive/html/qemu-devel/2022-07/msg00758.html</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If we want external projects to be able to take advantage of =
QAPI,<br>
&gt;&gt; &gt; the bare minimum we need to be public is a QAPI parser, from =
which<br>
&gt;&gt; &gt; people can then build any code generators desired.<br>
&gt;&gt;<br>
&gt;&gt; Basically scripts/qapi/ less the code generators.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; The generated code is used by qemu-ga &amp; storage daemon, at least. =
They are<br>
&gt; the first potential consumers, after qemu.<br>
&gt;<br>
&gt;<br>
&gt;&gt; Not sure a subproject would be a good fit.<br>
&gt;&gt;<br>
&gt;<br>
&gt; (I won&#39;t repeat the arguments of structuring a project)<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Shot from the hip: could the build process spit out something exte=
rnal<br>
&gt;&gt; projects could consume?=C2=A0 It&#39;s how &quot;consumables&quot;=
 are commonly delivered.<br>
&gt;&gt; E.g. .so + a bunch of headers.=C2=A0 Sometimes that gets packaged.=
=C2=A0 Sometimes<br>
&gt;&gt; it gets copied into the consuming tree (&quot;vendored&quot;).<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Not sure I follow, but that&#39;s just the &quot;install&quot; step is=
n&#39;t it ?<br>
&gt;<br>
&gt; Sure, we could have a &quot;qemu-devel&quot;, that ships qapi-gen, I g=
uess. But then,<br>
&gt; you would expect stability/versioning. That&#39;s not what I am propos=
ing (at<br>
&gt; least at this point), which is just about the build system and project=
<br>
&gt; structure, so we can build and work on subprojects independently. (for=
 ex,<br>
&gt; in my wip branch, qemu-ga meson.build is 115 lines, doesn&#39;t need Q=
EMU<br>
&gt; configure etc)<br>
<br>
I&#39;m afraid I&#39;m still wobbly on the benefits of subprojects, or even=
 how<br>
to work with them.<br>
<br>
How exactly would we &quot;build and work independently&quot; on the subpro=
jects<br>
involving QAPI?=C2=A0 git-clone all of QEMU, but build only a subproject (a=
nd<br>
its dependencies)?=C2=A0 Am I confused?<br></blockquote><div><br></div><div=
>Yes, QEMU repository would hold some subprojects (like libvhost-user today=
), that you can build/develop independently with just meson / ninja.<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; &gt; We don&#39;t neccessarily need the current QAPI C code genera=
tor. There<br>
&gt;&gt; &gt; could be a new C generator that didn&#39;t use qobject, but i=
nstead used<br>
&gt;&gt; &gt; some standard GLib types like GHashTable/GList instead of QDi=
ct/QList.<br>
&gt;&gt;<br>
&gt;&gt; Yes, that should be possible.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I can&#39;t see much benefit from doing that extra work. It would crea=
te two C<br>
&gt; APIs, making future bindings efforts more difficult etc.<br>
<br>
We need to distinguish client-side and server-side APIs / bindings.<br></bl=
ockquote><div><br></div><div>Indeed.. although imho, it&#39;s best when bot=
h are similar, or use similar types / concepts. (gdbus does a pretty good j=
ob, for ex)<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
The existing C generator targets internal, server-side use.=C2=A0 It<br>
generates everything defined in the schema.<br>
<br>
The existing introspection generator generates data for external,<br>
client-side use (via QMP).=C2=A0 It generates just the subset visible in QM=
P.<br>
<br>
The proposed Go generator also targets external, client-side use (client<br=
>
bindings for QMP), and should also generate just the subset visible in<br>
QMP.<br>
<br>
So should a future C generator of client bindings for QMP.<br>
<br>
And then we&#39;d have two distinct C APIs: a server-side one to help us<br=
>
implement QMP, and a client-side one to help use use QMP (QMP bindings).<br=
></blockquote><div><br></div><div>In the qga subproject split wip I did, I =
am interested in the server side, at this point.</div><div>=C2=A0 <br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Whether the two would profit from sharing QObject is not clear to me<br>
at this point.<br></blockquote><div><br></div><div>I think it would be grea=
t to provide a QObject based C client side binding, if only for internal te=
sting at this point. Whether to make this public and guarantee some stabili=
ty is another question.</div><div><br></div><div>But for now, my goal is on=
ly internal reorganization, not any public/external API / project etc.<br><=
/div><div>=C2=A0</div><div>thanks</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; QObject is very much like GValue though (the naming is better too :), =
just<br>
&gt; like the QOM &amp; GObject story.<br>
&gt;<br>
&gt; thanks<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000070446705e7b1a0f6--

