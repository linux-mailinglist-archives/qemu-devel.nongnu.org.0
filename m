Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438EA4913B0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 02:40:56 +0100 (CET)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dUU-0005EF-G7
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 20:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dRL-0004HW-OT
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:37:39 -0500
Received: from [2a00:1450:4864:20::52b] (port=45718
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dRJ-0006MY-VF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:37:39 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z22so72909703edd.12
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zANwqaYikcEkVu/zDLkkBwlnvUkDCVdJ2TCu37jQ1OM=;
 b=ZfoAoRNazQ3lnZ+zQbqmJOtQKmIt4D8yxe8YkCNGfw8mi9LNt2Pk9Pue6jcUsn14mU
 y9K3eGq8mz3O15TMLAWCVXglYJsD1yRI8RBaoy/78zuAxIPv5KhCffeoNSjMLsMtao/4
 /fghwHKG8l5t5OosAOUgyo4rc3zlHlu/TqhVNtVafzj8gXXnKSmm6gldizuTI6KHtqm4
 EVUOobGmrK9EYKG98gMMBXoETs4bNj8SHkDCt+V44vkd6KYbMpZxc07lTL14r9dGzsRX
 h4NC2MrSIkqp35ldP7/1a1py41nGF4syQGzZ/zgGvqTgp5tsBtCrsNmj8mGDjqtOGjZo
 jNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zANwqaYikcEkVu/zDLkkBwlnvUkDCVdJ2TCu37jQ1OM=;
 b=T7rAHdOuKOvQI/LE8B0u5x8whlm/Sxzr2uHWRndQ4UfupP+eD0v8QLzfRxj0gU/52S
 puSxAG58ypD1O3Aqt0EdEo7ptVqaeft9lC0sbOgF4tVSxk6ZmZ6C0XQLs/ej0c0Fimpk
 BKpjc7Ihjyh7BA7MflDwTyGCNrvy7qzptBo5eWvWDQteEadkJAAPLqYD7Y+piCSOsQpa
 C/XfIyLNqHA/bKShpcfB1MyRfg9cLkaGQlIUObl0q0JsTUcZ17ybuh9yEjensK643XN4
 DQ2feDYRE9FNgS+Z6lWQfytNOSouf13h8AHtuVhOJQzk8fMKitT3BU4HS58OwBMK18xE
 889Q==
X-Gm-Message-State: AOAM532IoRRUnhVMdsnVjObHRVDGYmjE0NXTY06vyaarKffumr7BOvVW
 HeT5CS+9DSJh6yhjzkmbEnS6GfACftICByP50tROog==
X-Google-Smtp-Source: ABdhPJw6LFh21VoRANe5o4exrjY0xpt/yGVuZB9Tw4Vp0PMEMEfDW9ZmuShKoPEDriNUtr1CuRDm40U80VgpFml0Oq8=
X-Received: by 2002:a05:6402:1258:: with SMTP id
 l24mr17689455edw.163.1642469856368; 
 Mon, 17 Jan 2022 17:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-4-frank.chang@sifive.com>
 <CAKmqyKPCCAzjkNGPe3E9etbKPzG3KS24eaqbo0nAjP7RpGaUJA@mail.gmail.com>
In-Reply-To: <CAKmqyKPCCAzjkNGPe3E9etbKPzG3KS24eaqbo0nAjP7RpGaUJA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 18 Jan 2022 09:37:25 +0800
Message-ID: <CAE_xrPjL8S5b86b8r=+3DEERqrj8Hqv-VgvTfxHh72LL4dwCNg@mail.gmail.com>
Subject: Re: [PATCH 03/17] target/riscv: rvv-1.0: Add Zve64f support for load
 and store insns
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000057f0dd05d5d15045"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057f0dd05d5d15045
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 18, 2022 at 6:27 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Dec 29, 2021 at 12:34 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > All Zve* extensions support all vector load and store instructions,
> > except Zve64* extensions do not support EEW=64 for index values when
> > XLEN=32.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvv.c.inc
> b/target/riscv/insn_trans/trans_rvv.c.inc
> > index 5b47729a21..820a3387db 100644
> > --- a/target/riscv/insn_trans/trans_rvv.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> > @@ -263,10 +263,19 @@ static bool vext_check_st_index(DisasContext *s,
> int vd, int vs2, int nf,
> >                                  uint8_t eew)
> >  {
> >      int8_t emul = eew - s->sew + s->lmul;
> > -    return (emul >= -3 && emul <= 3) &&
> > -            require_align(vs2, emul) &&
> > -            require_align(vd, s->lmul) &&
> > -            require_nf(vd, nf, s->lmul);
> > +    bool ret = (emul >= -3 && emul <= 3) &&
> > +               require_align(vs2, emul) &&
> > +               require_align(vd, s->lmul) &&
> > +               require_nf(vd, nf, s->lmul);
> > +#ifdef TARGET_RISCV32
>
> Don't use hardcoded macros for this, instead use get_xl()
>
> Alistair
>

Thanks for the review.
I'll fix it in my next revision patchset.

Regards,
Frank Chang


>
> > +    /*
> > +     * All Zve* extensions support all vector load and store
> instructions,
> > +     * except Zve64* extensions do not support EEW=64 for index values
> > +     * when XLEN=32. (Section 18.2)
> > +     */
> > +    ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
> > +#endif
> > +    return ret;
> >  }
> >
> >  /*
> > --
> > 2.31.1
> >
> >
>

--00000000000057f0dd05d5d15045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 18, 2022 at 6:27 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Dec 29, 2021 at 12:34 PM &lt;<a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; All Zve* extensions support all vector load and store instructions,<br=
>
&gt; except Zve64* extensions do not support EEW=3D64 for index values when=
<br>
&gt; XLEN=3D32.<br>
&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++++----<b=
r>
&gt;=C2=A0 1 file changed, 13 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/in=
sn_trans/trans_rvv.c.inc<br>
&gt; index 5b47729a21..820a3387db 100644<br>
&gt; --- a/target/riscv/insn_trans/trans_rvv.c.inc<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvv.c.inc<br>
&gt; @@ -263,10 +263,19 @@ static bool vext_check_st_index(DisasContext *s,=
 int vd, int vs2, int nf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t eew)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int8_t emul =3D eew - s-&gt;sew + s-&gt;lmul;<br>
&gt; -=C2=A0 =C2=A0 return (emul &gt;=3D -3 &amp;&amp; emul &lt;=3D 3) &amp=
;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require_align(vs2, emul) &a=
mp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require_align(vd, s-&gt;lmu=
l) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require_nf(vd, nf, s-&gt;lm=
ul);<br>
&gt; +=C2=A0 =C2=A0 bool ret =3D (emul &gt;=3D -3 &amp;&amp; emul &lt;=3D 3=
) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0require_align(=
vs2, emul) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0require_align(=
vd, s-&gt;lmul) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0require_nf(vd,=
 nf, s-&gt;lmul);<br>
&gt; +#ifdef TARGET_RISCV32<br>
<br>
Don&#39;t use hardcoded macros for this, instead use get_xl()<br>
<br>
Alistair<br></blockquote><div><br></div><div>Thanks for the review.</div><d=
iv>I&#39;ll fix it in my next revision patchset.</div><div><br></div><div>R=
egards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* All Zve* extensions support all vector load and=
 store instructions,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* except Zve64* extensions do not support EEW=3D6=
4 for index values<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* when XLEN=3D32. (Section 18.2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 ret &amp;=3D (!has_ext(s, RVV) &amp;&amp; s-&gt;ext_zve=
64f ? eew !=3D MO_64 : true);<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000057f0dd05d5d15045--

