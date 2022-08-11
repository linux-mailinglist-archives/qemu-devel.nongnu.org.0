Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE358F838
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 09:18:03 +0200 (CEST)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM2S9-0000cD-GC
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 03:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oM2Lt-0004D3-Ha; Thu, 11 Aug 2022 03:11:33 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oM2Lq-0006M7-C3; Thu, 11 Aug 2022 03:11:32 -0400
Received: by mail-lj1-x22f.google.com with SMTP id j3so11246127ljo.0;
 Thu, 11 Aug 2022 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1VD50tSs9SkeVrV4KBX2C6wBbZWP1djoTjHkUX2vtD4=;
 b=ni248imdGorA1a7LtifeAW4pO8iIYPpn899cNBX81qAPbedXJFb4/Tc0sn/zglddEU
 xBtxhfTb35MdZTH3DKBiA7dOxib+XkxWSJO1AVbn3W+AcET7W2cxAcRY0FjumWVTSimG
 4QUrjWupkB5a+xsDZusb32/qAvP60XDuUBdWGNtZfgWwvJQ9zITc/3Ni3D9n9vFSd4ZJ
 fwiysgX2MyHmLEwzVdPzQS0Pq2VaLzUZtASF5fUCyXKUbtNNl7YLIf2R1UHIAZSODTCh
 pzWEUeBufg5fZar31EOF0PNKys9x+9cKqyWiTsyanaVdvwm0tEJnjlarmZZfYyGLzDPn
 uh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1VD50tSs9SkeVrV4KBX2C6wBbZWP1djoTjHkUX2vtD4=;
 b=oQ2v3u+W0RB7TaR1cHyPHCMyiUt05VHcGB5/B4IBXAMjvx/SgMT/YiRavWX1RyOvbK
 TKtRJLmJoPJvkSwGVYDUACxRWc/x+xG4V42VKRGaEH8VQCTXQajFhiD1XhSwLw3Qqdnn
 OOmb+ARKExTKONTfjtupY9a1GLEl6neMODwM9K3INeNiU8DJgZONk81/DV6MMEdZP5yR
 HoiP4OPgSoB1i+B0qV+NphRKPlhpJtCE/WiKFvWl/xHvVunH4RP+77RYpJ6tkMGQqL6m
 GIrhr55T1ea4rYPHu1H0CADjAwHm6Hd+bjm3vhcE539xmdQ8auUhc8AZJaTkEWQSROSE
 s1TQ==
X-Gm-Message-State: ACgBeo1sm9ry2ClazD+8NNUUuDwRpEBHD9W212fpd63RruFzZ7SNy+T7
 II7S+AKR0qKRWP5BOe7RkGhq8Ogm6obXJu9vmnA=
X-Google-Smtp-Source: AA6agR4lVm6fmApuihLJCU4uSMMi6ajfjGtTQ0s+QCNX8Gu8yaSEWweaajYZqiX7T0SF6ndrnVc593V32vcnn+EvOTk=
X-Received: by 2002:a2e:5455:0:b0:25e:4b87:9714 with SMTP id
 y21-20020a2e5455000000b0025e4b879714mr9181119ljd.463.1660201887539; Thu, 11
 Aug 2022 00:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
In-Reply-To: <8735e38e6t.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Aug 2022 11:11:15 +0400
Message-ID: <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Warner Losh <imp@bsdimp.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3282405e5f1df26"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

--000000000000c3282405e5f1df26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 11, 2022 at 10:52 AM Markus Armbruster <armbru@redhat.com>
wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > This is just moving qapi-gen.py and related subdir to qemu-common, t=
o
> >> > ease review and proceed step by step. The following patches will mov=
e
> >> > related necessary code, tests etc.
> >> >
> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> As moved files tend to become low-level annoyances for a long time, I'=
d
> >> like to understand why you want to move them.  The commit message says
> >> "to ease review", which I suspect isn't the real reason.  Perhaps you
> >> explained all that elsewhere already, but I missed it.
> >>
> >>
> >>
> > The end goal is to split some projects, such as qemu-ga, to standalone
> > meson projects/subprojects. We will be able to build them independently
> > from the rest of QEMU, and later on perhaps handle them outside of QEMU
> > main repository. To achieve this, I first introduce a qemu-common
> > subproject, where qapi and common units are provided. You can check
> > https://gitlab.com/marcandre.lureau/qemu/-/commits/qga for a sneak peek
> at
> > current end result.
>
> I worry this move of the QAPI generator code into
> subjprojects/common/scripts/qapi/ will be followed by a move into its
> own subproject.
>

Do you mean: it could be moved again to another smaller subproject? not
really, see below


> Ignorant question: could we turn the QAPI generator into a subproject in
> place?
>

If it's just the generator, probably the target would then be a python
project (not meson), similar to python-qemu-qmp.

But I don't see much point, since it's not really a standalone python
module, it generates code, and that code needs most of what is in
qemu-common (see
https://gitlab.com/marcandre.lureau/qemu/-/tree/qga/subprojects/qemu-common=
).
It's best to have it together imho. Maybe we can consider a different
naming or to be more careful not to add stuff that is not strictly needed
by qapi?

(fwiw, it's a bit of a shame python-qemu-qmp didn't import git history from
qemu.. we did better with libslirp. If we ever move code in standalone
repositories again, we should be careful to keep history with it)


> > I said "to ease review and proceed step by step" simply because there a=
re
> > no other changes: I don't move the rest of the qapi code & tests all
> > together, it's in the subsequent series.
>
> I'd recommend to provide a bit more context in the commit message, even
> if you copy it to several messages in a row.  Our future selves will
> likely be grateful.
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c3282405e5f1df26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 10:52 AM Ma=
rkus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">M=
arc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" tar=
get=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">m=
arcandre.lureau@redhat.com</a> writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is just moving qapi-gen.py and related subdir to qemu-co=
mmon, to<br>
&gt;&gt; &gt; ease review and proceed step by step. The following patches w=
ill move<br>
&gt;&gt; &gt; related necessary code, tests etc.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; As moved files tend to become low-level annoyances for a long time=
, I&#39;d<br>
&gt;&gt; like to understand why you want to move them.=C2=A0 The commit mes=
sage says<br>
&gt;&gt; &quot;to ease review&quot;, which I suspect isn&#39;t the real rea=
son.=C2=A0 Perhaps you<br>
&gt;&gt; explained all that elsewhere already, but I missed it.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; The end goal is to split some projects, such as qemu-ga, to standalone=
<br>
&gt; meson projects/subprojects. We will be able to build them independentl=
y<br>
&gt; from the rest of QEMU, and later on perhaps handle them outside of QEM=
U<br>
&gt; main repository. To achieve this, I first introduce a qemu-common<br>
&gt; subproject, where qapi and common units are provided. You can check<br=
>
&gt; <a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/commits/qga" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/marcandre.lureau/qemu/=
-/commits/qga</a> for a sneak peek at<br>
&gt; current end result.<br>
<br>
I worry this move of the QAPI generator code into<br>
subjprojects/common/scripts/qapi/ will be followed by a move into its<br>
own subproject.<br></blockquote><div><br></div><div>Do you mean: it could b=
e moved again to another smaller subproject? not really, see below<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Ignorant question: could we turn the QAPI generator into a subproject in<br=
>
place?<br></blockquote><div><br></div><div>If it&#39;s just the generator, =
probably the target would then be a python project (not meson), similar to =
python-qemu-qmp.<br></div><div>=C2=A0</div><div>But I don&#39;t see much po=
int, since it&#39;s not really a standalone python module, it generates cod=
e, and that code needs most of what is in qemu-common (see <a href=3D"https=
://gitlab.com/marcandre.lureau/qemu/-/tree/qga/subprojects/qemu-common">htt=
ps://gitlab.com/marcandre.lureau/qemu/-/tree/qga/subprojects/qemu-common</a=
>). It&#39;s best to have it together imho. Maybe we can consider a differe=
nt naming or to be more careful not to add stuff that is not strictly neede=
d by qapi?<br></div><div><br></div><div>(fwiw, it&#39;s a bit of a shame py=
thon-qemu-qmp didn&#39;t import git history from qemu.. we did better with =
libslirp. If we ever move code in standalone repositories again, we should =
be careful to keep history with it)<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
&gt; I said &quot;to ease review and proceed step by step&quot; simply beca=
use there are<br>
&gt; no other changes: I don&#39;t move the rest of the qapi code &amp; tes=
ts all<br>
&gt; together, it&#39;s in the subsequent series.<br>
<br>
I&#39;d recommend to provide a bit more context in the commit message, even=
<br>
if you copy it to several messages in a row.=C2=A0 Our future selves will<b=
r>
likely be grateful.<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c3282405e5f1df26--

