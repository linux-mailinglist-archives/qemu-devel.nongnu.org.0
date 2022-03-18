Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46E4DE306
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:58:00 +0100 (CET)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJfb-0008Qw-8l
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:57:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedaabouzied44@gmail.com>)
 id 1nVGrQ-0006DI-OV; Fri, 18 Mar 2022 13:58:03 -0400
Received: from [2607:f8b0:4864:20::a2b] (port=45757
 helo=mail-vk1-xa2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedaabouzied44@gmail.com>)
 id 1nVGrO-0005m0-DD; Fri, 18 Mar 2022 13:58:00 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id 134so2868513vkz.12;
 Fri, 18 Mar 2022 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Yjvkj3yqr41ZdAuasyMTbpIIeoAciKXaNTpV2FhFnM=;
 b=ijJptlpMDrdiapXccbSkO1W3DoU9rN+SiGlrxAmaEj7BzK0br+oTngKnWW8f1K2jgv
 x6PzToFixs1gcUl3U8IHhhk5hCexaZYSZeNxMqoGS1oAhqPPjFrHMn/opYjC6SOGd7Cc
 SLRR7CU4xMJs2h1bm077BB4T7LGKHgifFlA9siXTuMeIJfomZDqGsmy+b4ThBFbSthCu
 57+JTg2msPpABOAtnu3L/T6eZE4BMNy2yg5+YeXyGc1L7JSB3BKVC9NpTZY9UEuBljb+
 wOy8knBenmfviqVB1pMYAR8PePRIIxkJLB5cfntvDf2Z4P+X8D+tn5oXJ/iMokBmTXj+
 WgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Yjvkj3yqr41ZdAuasyMTbpIIeoAciKXaNTpV2FhFnM=;
 b=jVnJu4bPuuk5hQDSZeB7Ml+9uNw/dfZ+2zO5JO2l25FvPdF6JQ0dT9ygK4JDY1uxLl
 hF87LSq3h1R1m6+ETPY+E8j6UgwDJAff90ipWHG/TwMsVhRbu1i+XNrOpI6VF0yZcvod
 RuAr5y3vWcbeaYfFzN6QpeIf8o2CNQX8z/N3d4WXI41DO6LG5F37G8gnqNa8URP3h0eN
 AUFcLUUEzC899019jgeIrJiZad2lA8bsa3JKnLzhOGz+JY1vMufZcRFC7bO1by20A+7u
 f8GRHwzW/dxCwC2X8ehBGL7PlkG5KGiGo5AI9C8abMmS282Pg7RMVxomNMGMvrgDEw/b
 1BaA==
X-Gm-Message-State: AOAM533rmN3e/S/qyX1G3Q6TMBm8eQ7TQ7YX9QsA/4UKJem0c34ebx9g
 dAxaXCHxhtwZJzK3qrJgUqddOMEYBfv+a3Kg1jyQrLu0
X-Google-Smtp-Source: ABdhPJw6kvGerRhVG0FfIJ65psyU3ArPcpJPbUFqlLO9DJEtczIpHtlqwFJ1HosetjvH7TBtV+fQyqzn9RvvBjmKTY4=
X-Received: by 2002:a05:6122:78a:b0:337:5ba4:f588 with SMTP id
 k10-20020a056122078a00b003375ba4f588mr4077256vkr.27.1647626276674; Fri, 18
 Mar 2022 10:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210620175452.10076-1-email@aabouzied.com>
 <d9a8f15d-d582-5fc9-5ddd-206185f459c4@redhat.com>
In-Reply-To: <d9a8f15d-d582-5fc9-5ddd-206185f459c4@redhat.com>
From: Ahmed Abouzied <ahmedaabouzied44@gmail.com>
Date: Fri, 18 Mar 2022 19:57:45 +0200
Message-ID: <CANL98e-ZM322A4Lor3=ct2PbTMZnAoAUMPxxU9poYo0xLbEvjA@mail.gmail.com>
Subject: Re: [PATCH] sh4: Replace TAB indentations with spaces
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f1a19f05da81e2d4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=ahmedaabouzied44@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Mar 2022 16:57:06 -0400
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1a19f05da81e2d4
Content-Type: text/plain; charset="UTF-8"

Hello,

I remember this PR. It was a long time ago. I'll take a look at it and
propose a fix.

Thanks,
Ahmed

On Fri, 18 Mar 2022 at 19:25, Thomas Huth <thuth@redhat.com> wrote:

> On 20/06/2021 19.54, Ahmed Abouzied wrote:
> > Replaces TABs with spaces, making sure to have a consistent coding style
> > of 4 space indentations in the SH4 subsystem.
> >
> > Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/376
> > ---
> ...
> > @@ -1705,101 +1705,101 @@ static void _decode_opc(DisasContext * ctx)
> >           }
> >           return;
> >       case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
> > -     CHECK_FPU_ENABLED
> > +    CHECK_FPU_ENABLED
> >           tcg_gen_mov_i32(FREG(B11_8), cpu_fpul);
> > -     return;
> > +    return;
> >       case 0xf01d: /* flds FRm,FPUL - FPSCR: Nothing */
> > -     CHECK_FPU_ENABLED
> > +    CHECK_FPU_ENABLED
> >           tcg_gen_mov_i32(cpu_fpul, FREG(B11_8));
> > -     return;
> > +    return;
>
> Sorry, it's a very late reply ... but in case you're still interested in
> fixing this: It seems like at least some of these files used TABs as 8
> spaces, not as 4 spaces, so after applying your patch, the indentation
> seems
> to be wrong in all places. Please double-check the look of the files
> before
> sending! Thanks!
>
>   Thomas
>
>

--000000000000f1a19f05da81e2d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default"><font size=3D"2"><span style=
=3D"font-family:arial,sans-serif">Hello,</span></font></div><div class=3D"g=
mail_default"><font size=3D"2"><span style=3D"font-family:arial,sans-serif"=
><br></span></font></div><div class=3D"gmail_default"><font size=3D"2"><spa=
n style=3D"font-family:arial,sans-serif">I remember this PR. It was a long =
time ago. I&#39;ll take a look at it and propose a fix. <br></span></font><=
/div><div class=3D"gmail_default"><font size=3D"2"><span style=3D"font-fami=
ly:arial,sans-serif"><br></span></font></div><div class=3D"gmail_default"><=
font size=3D"2"><span style=3D"font-family:arial,sans-serif">Thanks,</span>=
</font></div><div class=3D"gmail_default" style=3D"font-family:monospace;fo=
nt-size:large"><font size=3D"2"><span style=3D"font-family:arial,sans-serif=
">Ahmed</span></font><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 18 Mar 2022 at 19:25, Thomas Huth &l=
t;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 20/06/2021 19.54, =
Ahmed Abouzied wrote:<br>
&gt; Replaces TABs with spaces, making sure to have a consistent coding sty=
le<br>
&gt; of 4 space indentations in the SH4 subsystem.<br>
&gt; <br>
&gt; Signed-off-by: Ahmed Abouzied &lt;<a href=3D"mailto:email@aabouzied.co=
m" target=3D"_blank">email@aabouzied.com</a>&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/376=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/376</a><br>
&gt; ---<br>
...<br>
&gt; @@ -1705,101 +1705,101 @@ static void _decode_opc(DisasContext * ctx)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothi=
ng */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0CHECK_FPU_ENABLED<br>
&gt; +=C2=A0 =C2=A0 CHECK_FPU_ENABLED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_i32(FREG(B11_8), c=
pu_fpul);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0xf01d: /* flds FRm,FPUL - FPSCR: Nothi=
ng */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0CHECK_FPU_ENABLED<br>
&gt; +=C2=A0 =C2=A0 CHECK_FPU_ENABLED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_i32(cpu_fpul, FREG=
(B11_8));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 return;<br>
<br>
Sorry, it&#39;s a very late reply ... but in case you&#39;re still interest=
ed in <br>
fixing this: It seems like at least some of these files used TABs as 8 <br>
spaces, not as 4 spaces, so after applying your patch, the indentation seem=
s <br>
to be wrong in all places. Please double-check the look of the files before=
 <br>
sending! Thanks!<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div>

--000000000000f1a19f05da81e2d4--

