Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD79430154
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 10:54:14 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfSH-0003Gk-RL
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 04:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfR0-0002SM-Fg
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:52:54 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfQy-0003sR-OV
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:52:54 -0400
Received: by mail-il1-x135.google.com with SMTP id s3so9709628ild.0
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T9u1nm+CwLhB5jIRVog43fyVg5RFc3gabjxZL45eFMo=;
 b=drMuEa7aOb+ltn+PkGuEStIsSFzDfrZIxiIo7wAoen7zptr8Wnm0x3nh6fevsvdP7G
 QgpkByB4uO8T13zheiiTblDxAFBV7h3DOE41jpzg7Cwp2DaiGyykf9zjrzIQtOkUTHOq
 UbO2J3f6RI47+rtblKrCoyTOyyrdYJH3znFEczmZp6B5lWwnoCYZB1N6obNKc0Ba4+XP
 WsBQOzwuE0yvWzvnGvDo6DFzJLQ73JPJtC9JyuKdFXnvzSExOHSAEBry1H6VyJFzbgFD
 aKo5u2wTGT3vHJmoSG79Fzd86wdUz0vnqmVlvKEFQlIalklOzCUXa40q57nobI+Fn0AQ
 NDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T9u1nm+CwLhB5jIRVog43fyVg5RFc3gabjxZL45eFMo=;
 b=h1j6mrEmCGZ2eg7xAvuuzvfoBbPUxviM8COooQO4OuJaTABqhHkhknsY2YE1AviwTT
 dQze0u+T6qa4DnMr3tZWlMlBw/fHayNp7XxUzJPJ+lnHvNdOkn2ZVPHu+Gg4YEh/k3Gd
 5cPbAMK34LkFPCUImdEVOddaW2S86FN6ImZluqgB2Unyw8jkjyJfIrd6yJuiSeKpJsog
 bgKgykrXNhCdUra1bC2p/hH1bMz0DKqoct/2c+ulTTEesD91NorQI9Qug/erIsZ85jE0
 tSW9XqvywqYTOX52Qg+Uf/PE3ReO943CzKd8RPjVCcTg18XP4m+UtjXPSu4FYBeBIOsQ
 DGbQ==
X-Gm-Message-State: AOAM532bkJ4X/OXzrFMOPO1fLi/C0StgZWoDOkkXd00yWrZPzQNtN7aa
 ISFXyQOXCycDDP4CnY/qXRuCle09G547RmXhiTfKKA==
X-Google-Smtp-Source: ABdhPJyOMYavmsBV/9CNup2HmuAHG4mt4zLcl4ZJXEI7wRxydERQnw+TpJB3bXw8372+e2Msw82cFODJK4MXgaD3jHg=
X-Received: by 2002:a05:6e02:b2a:: with SMTP id
 e10mr6873416ilu.53.1634374371656; 
 Sat, 16 Oct 2021 01:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
 <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
In-Reply-To: <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 16 Oct 2021 16:52:40 +0800
Message-ID: <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000da59e705ce746ffb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000da59e705ce746ffb
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/14/21 11:54 PM, frank.chang@sifive.com wrote:
> > From: Chih-Min Chao<chihmin.chao@sifive.com>
> >
> > The sNaN propagation behavior has been changed since
> > cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
> >
> > Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> > ---
> >   target/riscv/fpu_helper.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> > index 8700516a14c..1472ead2528 100644
> > --- a/target/riscv/fpu_helper.c
> > +++ b/target/riscv/fpu_helper.c
> > @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env,
> uint64_t rs1, uint64_t rs2)
> >   {
> >       float32 frs1 = check_nanbox_s(rs1);
> >       float32 frs2 = check_nanbox_s(rs2);
> > -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> > +    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
> >   }
>
> Don't you need to conditionalize behaviour on the isa revision?
>
>
I will pick the right API based on CPU privilege spec version.

Thanks,
Frank Chang


>
> r~
>

--000000000000da59e705ce746ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 16, 2021 at 1:05 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/14/21 11:54 PM, <a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> =
wrote:<br>
&gt; From: Chih-Min Chao&lt;<a href=3D"mailto:chihmin.chao@sifive.com" targ=
et=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; <br>
&gt; The sNaN propagation behavior has been changed since<br>
&gt; cd20cee7 inhttps://<a href=3D"http://github.com/riscv/riscv-isa-manual=
" rel=3D"noreferrer" target=3D"_blank">github.com/riscv/riscv-isa-manual</a=
><br>
&gt; <br>
&gt; Signed-off-by: Chih-Min Chao&lt;<a href=3D"mailto:chihmin.chao@sifive.=
com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/fpu_helper.c | 8 ++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c<br>
&gt; index 8700516a14c..1472ead2528 100644<br>
&gt; --- a/target/riscv/fpu_helper.c<br>
&gt; +++ b/target/riscv/fpu_helper.c<br>
&gt; @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint6=
4_t rs1, uint64_t rs2)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
&gt; -=C2=A0 =C2=A0 return nanbox_s(float32_minnum(frs1, frs2, &amp;env-&gt=
;fp_status));<br>
&gt; +=C2=A0 =C2=A0 return nanbox_s(float32_minnum_noprop(frs1, frs2, &amp;=
env-&gt;fp_status));<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
Don&#39;t you need to conditionalize behaviour on the isa revision?<br>
<br></blockquote><div><br></div><div>I will pick the right API based on CPU=
 privilege spec version.</div><div><br></div><div>Thanks,</div><div>Frank C=
hang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
r~<br>
</blockquote></div></div>

--000000000000da59e705ce746ffb--

