Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEAA644D2E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2eQk-0006XR-MF; Tue, 06 Dec 2022 15:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2eQb-0006Uo-1d
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:20:39 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2eQZ-0007CQ-8V
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:20:32 -0500
Received: by mail-ej1-x62a.google.com with SMTP id b2so9106758eja.7
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 12:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vAhruo4dT0FH50QtmZnQj2+AaA58EYVwYIlaDGQFBAw=;
 b=vmphjmjyLwZHAAhY/16JarBLrWCWJ6WMFeAchR+COYvNXyOB5Tet9Nj06pf+NhK4bq
 O6r2zWJ9IGPlyOU/YW7EKwz8nbZdh9DSQ1u+7T86vMTvral3CVkFWIr3yA/PBmVswNPG
 4mcaxVW+5Kjl67haiJwxek2jOmRdvSNZPt0sC0YOj758zemFI/ecJDlfWYFADhO+iquk
 pfb6Y7blXLcC4G+x4ebc1ELt9Fwi26zvdikFtW+8x9CZ7K689zwnEJBbvGnDQNHQ5hXx
 q5pN8y86hguc0fWWVFluMMRRl6lacQK4tP9n14gylvttwB0VxDc6XW0zHp/TskeO0A8c
 Ytfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vAhruo4dT0FH50QtmZnQj2+AaA58EYVwYIlaDGQFBAw=;
 b=7daLXyHJnHtDp3OYYijyf8RQaTGXvMxruWAFxmTQdtbAUBo/NWs/n38BMtdudogo8v
 FfD006gMcnVq5JXd+JLUk+a7Tmo3olhSsnjKwPcCHXwYNgyM3n6fowjRT8W8TIgWp0tl
 +DJ7lylvSum/lZmuLP1sbuvtkj0slZXfwB+tDWYoXPIK5y/WW4cTpEK5RQo+1VLvFGp5
 BsXSEOLFF65fOM1txdBzy8jZxNd2r8A7ghqLpUzooZ8LjC/sYzv0K2LH3Za54/xajw6j
 lo3IezrZlkO+5TH4x9YeO3+/2+nqTdlFn0vXpxkDWBIrshfkXk8plqy8BZhakykwEgFf
 UEeg==
X-Gm-Message-State: ANoB5pn5bZX1mwEQnfK5G16pJDmqDsy+J+TluiQLJJkllSyaotJJ70zd
 oazTWmflwWe/bPZDm0nCD8I103Csc+7z2hS3LOcS9Q==
X-Google-Smtp-Source: AA0mqf6Mhi7Xm5RHBNo3Y4XmY4FGx9ZfnRXTcz81F9mRbEilkVRj6J9PQ8fltFrgQNxSeFK7pWAo7LoFKKVymGMctzE=
X-Received: by 2002:a17:907:2387:b0:7c0:d6b2:1fd4 with SMTP id
 vf7-20020a170907238700b007c0d6b21fd4mr13867611ejb.703.1670358027810; Tue, 06
 Dec 2022 12:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-7-richard.henderson@linaro.org>
 <20221206200204.bxpzt6hecbazdobo@heavy>
In-Reply-To: <20221206200204.bxpzt6hecbazdobo@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Tue, 6 Dec 2022 14:20:16 -0600
Message-ID: <CAFXwXr=m0Y_GrERYbiSnOWQGFyTyEXzMeUgrMAps-of6s9zBdA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] tcg/s390x: Support MIE2 multiply single
 instructions
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e54fa505ef2e889b"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e54fa505ef2e889b
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Dec 2022, 14:02 Ilya Leoshkevich, <iii@linux.ibm.com> wrote:

> On Thu, Dec 01, 2022 at 10:51:53PM -0800, Richard Henderson wrote:
> > The MIE2 facility adds 3-operand versions of multiply.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  tcg/s390x/tcg-target-con-set.h |  1 +
> >  tcg/s390x/tcg-target.h         |  1 +
> >  tcg/s390x/tcg-target.c.inc     | 34 ++++++++++++++++++++++++----------
> >  3 files changed, 26 insertions(+), 10 deletions(-)
>
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
>
> I have one small suggestion, see below.
>
> > diff --git a/tcg/s390x/tcg-target-con-set.h
> b/tcg/s390x/tcg-target-con-set.h
> > index 00ba727b70..33a82e3286 100644
> > --- a/tcg/s390x/tcg-target-con-set.h
> > +++ b/tcg/s390x/tcg-target-con-set.h
> > @@ -23,6 +23,7 @@ C_O1_I2(r, 0, ri)
> >  C_O1_I2(r, 0, rI)
> >  C_O1_I2(r, 0, rJ)
> >  C_O1_I2(r, r, ri)
> > +C_O1_I2(r, r, rJ)
> >  C_O1_I2(r, rZ, r)
> >  C_O1_I2(v, v, r)
> >  C_O1_I2(v, v, v)
> > diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> > index 645f522058..bfd623a639 100644
> > --- a/tcg/s390x/tcg-target.h
> > +++ b/tcg/s390x/tcg-target.h
> > @@ -63,6 +63,7 @@ typedef enum TCGReg {
> >  #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
> >  #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
> >  #define FACILITY_LOAD_ON_COND2        53
> > +#define FACILITY_MISC_INSN_EXT2       58
> >  #define FACILITY_VECTOR               129
> >  #define FACILITY_VECTOR_ENH1          135
> >
> > diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> > index d02b433271..cd39b2a208 100644
> > --- a/tcg/s390x/tcg-target.c.inc
> > +++ b/tcg/s390x/tcg-target.c.inc
> > @@ -180,6 +180,8 @@ typedef enum S390Opcode {
> >      RRE_SLBGR   = 0xb989,
> >      RRE_XGR     = 0xb982,
> >
> > +    RRFa_MSRKC  = 0xb9fd,
> > +    RRFa_MSGRKC = 0xb9ed,
> >      RRFa_NRK    = 0xb9f4,
> >      RRFa_NGRK   = 0xb9e4,
> >      RRFa_ORK    = 0xb9f6,
> > @@ -2140,14 +2142,18 @@ static inline void tcg_out_op(TCGContext *s,
> TCGOpcode opc,
> >          break;
> >
> >      case INDEX_op_mul_i32:
> > +        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
> >          if (const_args[2]) {
> > -            if ((int32_t)args[2] == (int16_t)args[2]) {
> > -                tcg_out_insn(s, RI, MHI, args[0], args[2]);
> > +            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
>
> Should we consider a0 == a1 case here as well, in order to get rid of
> this extra move when possible?
>

tcg_out_mov already does that.


r~

--000000000000e54fa505ef2e889b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Tue, 6 De=
c 2022, 14:02 Ilya Leoshkevich, &lt;<a href=3D"mailto:iii@linux.ibm.com">ii=
i@linux.ibm.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Thu, Dec 01, 2022 at 10:51:53PM -0800, Richard Hender=
son wrote:<br>
&gt; The MIE2 facility adds 3-operand versions of multiply.<br>
&gt; <br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linar=
o.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tcg/s390x/tcg-target-con-set.h |=C2=A0 1 +<br>
&gt;=C2=A0 tcg/s390x/tcg-target.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
&gt;=C2=A0 tcg/s390x/tcg-target.c.inc=C2=A0 =C2=A0 =C2=A0| 34 +++++++++++++=
+++++++++++----------<br>
&gt;=C2=A0 3 files changed, 26 insertions(+), 10 deletions(-)<br>
<br>
Reviewed-by: Ilya Leoshkevich &lt;<a href=3D"mailto:iii@linux.ibm.com" targ=
et=3D"_blank" rel=3D"noreferrer">iii@linux.ibm.com</a>&gt;<br>
<br>
I have one small suggestion, see below.<br>
<br>
&gt; diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con=
-set.h<br>
&gt; index 00ba727b70..33a82e3286 100644<br>
&gt; --- a/tcg/s390x/tcg-target-con-set.h<br>
&gt; +++ b/tcg/s390x/tcg-target-con-set.h<br>
&gt; @@ -23,6 +23,7 @@ C_O1_I2(r, 0, ri)<br>
&gt;=C2=A0 C_O1_I2(r, 0, rI)<br>
&gt;=C2=A0 C_O1_I2(r, 0, rJ)<br>
&gt;=C2=A0 C_O1_I2(r, r, ri)<br>
&gt; +C_O1_I2(r, r, rJ)<br>
&gt;=C2=A0 C_O1_I2(r, rZ, r)<br>
&gt;=C2=A0 C_O1_I2(v, v, r)<br>
&gt;=C2=A0 C_O1_I2(v, v, v)<br>
&gt; diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h<br>
&gt; index 645f522058..bfd623a639 100644<br>
&gt; --- a/tcg/s390x/tcg-target.h<br>
&gt; +++ b/tcg/s390x/tcg-target.h<br>
&gt; @@ -63,6 +63,7 @@ typedef enum TCGReg {<br>
&gt;=C2=A0 #define FACILITY_FAST_BCR_SER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F=
ACILITY_LOAD_ON_COND<br>
&gt;=C2=A0 #define FACILITY_DISTINCT_OPS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F=
ACILITY_LOAD_ON_COND<br>
&gt;=C2=A0 #define FACILITY_LOAD_ON_COND2=C2=A0 =C2=A0 =C2=A0 =C2=A0 53<br>
&gt; +#define FACILITY_MISC_INSN_EXT2=C2=A0 =C2=A0 =C2=A0 =C2=A058<br>
&gt;=C2=A0 #define FACILITY_VECTOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0129<br>
&gt;=C2=A0 #define FACILITY_VECTOR_ENH1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
35<br>
&gt;=C2=A0 <br>
&gt; diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc<b=
r>
&gt; index d02b433271..cd39b2a208 100644<br>
&gt; --- a/tcg/s390x/tcg-target.c.inc<br>
&gt; +++ b/tcg/s390x/tcg-target.c.inc<br>
&gt; @@ -180,6 +180,8 @@ typedef enum S390Opcode {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RRE_SLBGR=C2=A0 =C2=A0=3D 0xb989,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RRE_XGR=C2=A0 =C2=A0 =C2=A0=3D 0xb982,<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 RRFa_MSRKC=C2=A0 =3D 0xb9fd,<br>
&gt; +=C2=A0 =C2=A0 RRFa_MSGRKC =3D 0xb9ed,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RRFa_NRK=C2=A0 =C2=A0 =3D 0xb9f4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RRFa_NGRK=C2=A0 =C2=A0=3D 0xb9e4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RRFa_ORK=C2=A0 =C2=A0 =3D 0xb9f6,<br>
&gt; @@ -2140,14 +2142,18 @@ static inline void tcg_out_op(TCGContext *s, T=
CGOpcode opc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case INDEX_op_mul_i32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 a0 =3D args[0], a1 =3D args[1], a2 =3D (i=
nt32_t)args[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (const_args[2]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((int32_t)args[2] =3D=3D=
 (int16_t)args[2]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_out_insn(=
s, RI, MHI, args[0], args[2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_out_mov(s, TCG_TYPE_I32=
, a0, a1);<br>
<br>
Should we consider a0 =3D=3D a1 case here as well, in order to get rid of<b=
r>
this extra move when possible?<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">tcg_out_mov already does that.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">r~</div><=
/div>

--000000000000e54fa505ef2e889b--

