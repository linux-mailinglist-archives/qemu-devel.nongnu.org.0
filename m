Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A545F9B27
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:39:59 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohoKL-0000vz-NN
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1ohoEq-0004lw-7x
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:34:16 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1ohoEi-00032P-2j
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:34:15 -0400
Received: by mail-ej1-x635.google.com with SMTP id 13so23344265ejn.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 01:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=euwXIDLgwlnZXzDVATCfmapVnwZszMNFxheoF+olP/8=;
 b=LxDAHqrHyWWxo0vKiQdc5uFwpmDTT6CMdWAyx2T9lknUVi9vDmtVLA7Svp5OnU1dck
 xc/vSj5on+Bj+VEURPQlj9UKWidDB6LIhoEJePRMNMmuhPJPlwL+9TGxreN/3odmZ1Ue
 MyitUivQPlVw2HGg1jSLZLN6r35rAZLzKIRkSPeLCJ8lP0DhYS0gJH3PUtTYHgxd+zC7
 B6qDREcmyKjA471v0z2nn3KXXJU6CXLBRJRGetzca6c+NbRbZJAyn+PJQ9ZQprhn52tu
 LyokfXAhxxaC+dlcP1/StoisLfRndPSEP1XRAh8tzUoRd3T0lU3qoA1GO+QMN8YjTIST
 r/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=euwXIDLgwlnZXzDVATCfmapVnwZszMNFxheoF+olP/8=;
 b=6lsHyiv542ONKMOr/sdXa85kZzOkfU5zmFixuS8G16r4wuZGkziOM4vnm0ER2aigYK
 SZWQMkwDO3+DqzRFPRvPQr0Hsl1lSDfISLTi4n91hYW1QUmpGbzDgDhzPEzFr5CsbtEg
 qX3Ll25+lC/EuBk8PtCnBgNLzv04yo1IDkaIgVKOdHAbrjyHI5u56DKe6Gdpx08SY+9Y
 ysQFpIa8rwTwLV+2Nuh3CT9kuiEiezrIkAzk/ttVfwLEo0ztop1fNjEbjJfMYNA3eXwD
 1dcj3V9DIVs6W1b3ROPpFBgoj68u9VlD83ed6Y6KO8fIu59iKps0gOTFfs5blAVmL0Ju
 Jy8A==
X-Gm-Message-State: ACrzQf3cN/ylgY/cwbydrLQp28M4GDGoYzL83VDKiJ6qzTwDKN/lvKf1
 xFCXyrymSKrk1Pzy1GRO2RbYhO7DHG9exdM/Nkmneg==
X-Google-Smtp-Source: AMsMyM6ZXcGEI2SKkUwDdrjcO2Rb9HahYplSbnJEbC6dmzxhAntw+BzRsDTC7YLAsp44Cj7wqFEH3QbIk8o9M1A1/jM=
X-Received: by 2002:a17:907:2c68:b0:78d:7981:3f8d with SMTP id
 ib8-20020a1709072c6800b0078d79813f8dmr12160613ejc.724.1665390844731; Mon, 10
 Oct 2022 01:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
 <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
 <1727925.InMztqvFxb@silver>
 <CAFEAcA9PcDk5pnRrKQf2zRaX8h8KSA9SDHODS102iK3jd_fpUQ@mail.gmail.com>
 <CAAJ4Ao8sxnuxgeUFwvdwceMn6=xy_QxYuOzhAJcGthnSd1pRgQ@mail.gmail.com>
 <CAFEAcA-jRHEGyW-oA1rSXDuYa81x2SNt+vqrvUPtgK6Wr93sJg@mail.gmail.com>
In-Reply-To: <CAFEAcA-jRHEGyW-oA1rSXDuYa81x2SNt+vqrvUPtgK6Wr93sJg@mail.gmail.com>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Mon, 10 Oct 2022 11:33:53 +0300
Message-ID: <CAAJ4Ao8wyZAE-r-ad9DwF-CrqNqTukZTYL5PYBX4_uUTrC3R7Q@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b6858805eaaa0508"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000b6858805eaaa0508
Content-Type: text/plain; charset="UTF-8"

Hi! Thanks for your notes. I'll try to send updated patches by the end of
the day.

On Fri, Oct 7, 2022 at 6:32 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> I think this patch is doing things in the wrong order. Instead of
> converting code to use the old macro that we don't like and then
> updating it again in patch 2 to use the new macro, we should
> first introduce the new macro, and then after that we can update
> code that's currently not using a macro at all to use the new one.
> This makes code review easier because we don't have to look at a
> change to this code which is then going to be rewritten anyway.


Sounds smooth. I'll refactor patches accordingly.


> >      if (ret < 0) {
> >          ret = -errno;
>
>
> > @@ -1472,8 +1472,8 @@ static ssize_t
> handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
> >  {
> >      ssize_t len;
> >
> > -    TFR(
> > -        len = (aiocb->aio_type & QEMU_AIO_WRITE) ?
> > +    len = TEMP_FAILURE_RETRY(
> > +        (aiocb->aio_type & QEMU_AIO_WRITE) ?
> >              qemu_pwritev(aiocb->aio_fildes,
> >                             aiocb->io.iov,
> >                             aiocb->io.niov,
>
> I'm not sure why you've put the TEMP_FAILURE_RETRY on the outside here
> rather than just on the individual function calls.
>

The original code contained both branches in one while loop, so I was
afraid that
value `aiocb->aio_type & QEMU_AIO_WRITE` would change somehow during the
loop.
If you'll say that this is impossible, I'll adjust the code as you propose.

> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index b1c161c035..6e244f15fa 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
> >  #define ESHUTDOWN 4099
> >  #endif
> >
> > -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> > +#define TEMP_FAILURE_RETRY(expr) \
>
> We can't call the macro this, because the glibc system headers already
> may define a macro of that name, so the compiler will complain if they're
> both defined at the same time, and depending on header ordering it might
> not be clear which version you're getting.
>

Sorry, my fault. I will rename it to "RETRY_ON_EINTR" as it was proposed
earlier in this thread.
-- 
Best Regards,
*Nikita Ivanov* | C developer

--000000000000b6858805eaaa0508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi! Thanks for your notes. I&#39;ll try t=
o send updated patches by the end of the day.=C2=A0<br></div><div dir=3D"lt=
r"><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Oct 7, 2022 at 6:32 PM Peter Maydell &lt;<a href=3D"mailto:peter=
.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I think this patch is doing th=
ings in the wrong order. Instead of<br>
converting code to use the old macro that we don&#39;t like and then<br>
updating it again in patch 2 to use the new macro, we should<br>
first introduce the new macro, and then after that we can update<br>
code that&#39;s currently not using a macro at all to use the new one.<br>
This makes code review easier because we don&#39;t have to look at a<br>
change to this code which is then going to be rewritten anyway.</blockquote=
><div><br></div><div>Sounds smooth. I&#39;ll refactor patches=C2=A0accordin=
gly.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -errno;<br>
<br>
<br>
&gt; @@ -1472,8 +1472,8 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAI=
OData *aiocb)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 TFR(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D (aiocb-&gt;aio_type &amp; QEMU_AI=
O_WRITE) ?<br>
&gt; +=C2=A0 =C2=A0 len =3D TEMP_FAILURE_RETRY(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (aiocb-&gt;aio_type &amp; QEMU_AIO_WRITE)=
 ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_pwritev(aiocb-&gt=
;aio_fildes,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.iov,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>
<br>
I&#39;m not sure why you&#39;ve put the TEMP_FAILURE_RETRY on the outside h=
ere<br>
rather than just on the individual function calls.<br></blockquote><div>=C2=
=A0</div><div>The original code contained both branches in one while loop, =
so I was afraid that</div><div>value `aiocb-&gt;aio_type &amp; QEMU_AIO_WRI=
TE` would change somehow during the loop.</div><div>If you&#39;ll say that =
this is impossible, I&#39;ll adjust the code as you propose.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; index b1c161c035..6e244f15fa 100644<br>
&gt; --- a/include/qemu/osdep.h<br>
&gt; +++ b/include/qemu/osdep.h<br>
&gt; @@ -243,7 +243,13 @@ void QEMU_ERROR(&quot;code path is reachable&quot=
;)<br>
&gt;=C2=A0 #define ESHUTDOWN 4099<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; -#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=
=3D EINTR)<br>
&gt; +#define TEMP_FAILURE_RETRY(expr) \<br>
<br>
We can&#39;t call the macro this, because the glibc system headers already<=
br>
may define a macro of that name, so the compiler will complain if they&#39;=
re<br>
both defined at the same time, and depending on header ordering it might<br=
>
not be clear which version you&#39;re getting.<br></blockquote><div>=C2=A0<=
/div><div>Sorry, my fault. I will rename it to &quot;RETRY_ON_EINTR&quot; a=
s it was proposed earlier in this thread.</div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iv=
anov</b> | C developer</div></div></div></div>

--000000000000b6858805eaaa0508--

