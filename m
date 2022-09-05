Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716F5AD40E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:38:00 +0200 (CEST)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCIY-0007By-Pr
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVCEk-0002gB-9V
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:34:02 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVCEh-0008Ga-Qj
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:34:01 -0400
Received: by mail-lj1-x22f.google.com with SMTP id bn9so9277083ljb.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iuwmLRG5SrgsWV3VDtmlCHMZcPleR/Ie8qIDQBP0RoY=;
 b=YQZNKqluYdiFs1wbtdeOuigDpCnuzr5FQ0Cm3EBEnR/ZNLpXjfUH9JijdGHUldo9q0
 POHuDDvhrywlrppeSc3g5wstx4qfDeS8uUtIp/AYAGb3NzuIXwL1FnxyVlKqxWUcXmLo
 NJnI0oknaBPP7qLnvJQP1XvFxOo1YFTo2iZEFyqMwmw8shJIqZLYgrZ4fESQkD951yL6
 38C2XuHP75Q+LZdo0d1Q4SVw/BOAJl7WMz6V3mO4p2t36R4NJYSBuwNT6oOL7SJdXckn
 PbLBUD1P16HV/ZnbAevPkGSBfMlkkZGumZ5THW6M2f4R+CXCD9ZiV8Xc61OnalpJR3kC
 J6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iuwmLRG5SrgsWV3VDtmlCHMZcPleR/Ie8qIDQBP0RoY=;
 b=wJtUmNsXRFGmOGFWI2QUcUmTmyd0QIpD+iTJS8J2t2JZ0fO2RqQZCC/GS/naof273H
 OAtLRKD/15wgt9o5G5dBdsGv2WZ7P2PIP22ypnXz3hCnKHOlW02nHbKdDUHGZnRJEUBu
 ILqdZFStbUZxf63/hTqwvvqV6ITewAlefVxfbGmF3epJCMmH6R1sbusW/z8R6lkkLGTZ
 8duIpsUyvh1VRedc93nAExwoqNdplDiIdrrvyXlY+J2VpsaQFGQPsl1BjSWU2M+M6gV6
 bFZn+wClT/dAVmPoSZqi+ZI+RIofWJFxgXJfEF6H9Lji9aek+zxRuvLd9R5wMsiKpILe
 oRLQ==
X-Gm-Message-State: ACgBeo2ANtxAyGIL5PhM/kulMXUm3Q1jggCNDcuKVnDGPYKNmBncGH0V
 qWmcohRR/8U0zjOnFmqh5M96mTC0WR+tN3sU/rk=
X-Google-Smtp-Source: AA6agR51rgfeYhReK0i4RmZRn7eSF/73fI13s/x3muSOfm/b7ImJnKXpt4WMt8OsOT+demixdZ9Z/8pWwjDfkKaGKN4=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr14641301ljq.529.1662384837707; Mon, 05
 Sep 2022 06:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
 <20220905125741.95516-2-marcandre.lureau@redhat.com>
 <CAFEAcA_PrFOTtY7OaoLpGJgdbvFHMt2jhaGKENaBHc2oaLCXDA@mail.gmail.com>
In-Reply-To: <CAFEAcA_PrFOTtY7OaoLpGJgdbvFHMt2jhaGKENaBHc2oaLCXDA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 17:33:46 +0400
Message-ID: <CAJ+F1C+9UsvoEx_y6s7=DrEhBjVoUnHcp8AO0v-nPfM2_v8MhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dump: simplify a bit kdump get_next_page()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb4ace05e7ee21df"
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

--000000000000bb4ace05e7ee21df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 5, 2022 at 5:28 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 5 Sept 2022 at 13:57, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This should be functionally equivalent, but slightly easier to read,
> > with simplified paths and checks at the end of the function.
> >
> > The following patch is a major rewrite to get rid of the assert().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  dump/dump.c | 21 ++++++++-------------
> >  roms/SLOF   |  2 +-
> >  2 files changed, 9 insertions(+), 14 deletions(-)
>
> > diff --git a/roms/SLOF b/roms/SLOF
> > index 6b6c16b4b4..5b4c5acdcd 160000
> > --- a/roms/SLOF
> > +++ b/roms/SLOF
> > @@ -1 +1 @@
> > -Subproject commit 6b6c16b4b40763507cf1f518096f3c3883c5cf2d
> > +Subproject commit 5b4c5acdcd552a4e1796aeca6bb700f6cbb0282d
>
> This shouldn't be in here, right? (I'm guessing a rebase
> accident -- git submodules have terrible ergonomics.)
>

indeed, my bad will fix in v3 (or eventually in PR?)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bb4ace05e7ee21df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 5:28 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div>On Mon, 5 Sept 2022 at 13:57, &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This should be functionally equivalent, but slightly easier to read,<b=
r>
&gt; with simplified paths and checks at the end of the function.<br>
&gt;<br>
&gt; The following patch is a major rewrite to get rid of the assert().<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 dump/dump.c | 21 ++++++++-------------<br>
&gt;=C2=A0 roms/SLOF=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 14 deletions(-)<br>
<br>
&gt; diff --git a/roms/SLOF b/roms/SLOF<br>
&gt; index 6b6c16b4b4..5b4c5acdcd 160000<br>
&gt; --- a/roms/SLOF<br>
&gt; +++ b/roms/SLOF<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 6b6c16b4b40763507cf1f518096f3c3883c5cf2d<br>
&gt; +Subproject commit 5b4c5acdcd552a4e1796aeca6bb700f6cbb0282d<br>
<br>
This shouldn&#39;t be in here, right? (I&#39;m guessing a rebase<br></div>
accident -- git submodules have terrible ergonomics.)<br></blockquote><div>=
<br></div><div>indeed, my bad will fix in v3 (or eventually in PR?)<br></di=
v><div>=C2=A0<br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bb4ace05e7ee21df--

