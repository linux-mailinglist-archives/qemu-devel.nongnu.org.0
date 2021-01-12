Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7862F27DD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 06:28:58 +0100 (CET)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzCEi-00042Q-Sx
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 00:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzCDB-0003Wc-9l
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:27:21 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:45121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzCD8-0006RW-66
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:27:20 -0500
Received: by mail-ot1-x32f.google.com with SMTP id n42so1164355ota.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 21:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eT6Qj5wpFj//Yno8VsU9mOWQSG2LF3k3o0p1mC7FHoA=;
 b=f76MCK1f63jtmkmu2tDQ71zZoVv2tcasNQrSGkb7IFshHrBOpXSBJtkIGOXkuhisq+
 hKmoaA7u7tc28Qu/r2ONnaTFmnBLmOxU5sKTgM0NBpON1E46W8PPiapRTLNN3xPPcPDw
 J6yCFfr1xfN1hlpLU3HzmoPQCa5h1RD7WZANF/rTM3fHHBGY3qpW7FzZ46s4qrvbCy0z
 w5m/YZItAIez076DIAz2q+gnFcvXnTCv98tsNcenNBroHajegr8KzBvFsT9TzmwSHQIm
 LrTjktdeOTn9xiVnCSg6s5w1NqlGziKXhc7Gtrx6KalRSDHlDEMziYO6ksloRxlDXADr
 COpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eT6Qj5wpFj//Yno8VsU9mOWQSG2LF3k3o0p1mC7FHoA=;
 b=dFoXzuerrhyv/FU0Kn2BFnBE7xQU1wqHWaaUezG97ruhg5g3wneMnXPQ65f1zok75E
 F4mW2f+RiwJAoC5lUsj/GRH7xTky3UczFwKX3AxwfAU5s9cOfc7/iYpYUCLLRQ9eRqcX
 9c+SmdaOlcTulMlO13f7FRUxNyf0JOTHSAuQ51Rrgjr7RXgWmexRfqZPAhA6HRH8Xasg
 kxdCfC4iMCn8eHbblMf6DMZkjora1oJgoIwbPJsB3CXKmfZSZng5+1WrpyLUZDASeXLl
 wkJ9WJOyiZi5gMC4XeEtfG8mHG+Pao0mSpGM/jBPfMCBVfUFbWYXBNCprANQ/hOqcI8A
 qKNA==
X-Gm-Message-State: AOAM532oH0lr+VpkI7fR0SxM8AXMn4gurFzwZj6AK6FeOb20vCsG1GGm
 /wKvYk4kqivhIourLk7uyqW+LnTBPwJ9i9QD25M67g==
X-Google-Smtp-Source: ABdhPJzmfyvExmJhQVqGQK4H93Vc7dcBIWKDHNQHnU3KkmhTuUrVaTm7UK2nqlhh+AOOUO8d8mEOYVwXi4QSB087VKY=
X-Received: by 2002:a05:6830:1493:: with SMTP id
 s19mr1729605otq.175.1610429237062; 
 Mon, 11 Jan 2021 21:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-9-frank.chang@sifive.com>
 <2d0f3c27-8f0d-1386-7ab0-9e6e5e1a6c53@linaro.org>
In-Reply-To: <2d0f3c27-8f0d-1386-7ab0-9e6e5e1a6c53@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 12 Jan 2021 13:27:06 +0800
Message-ID: <CAE_xrPg2J8rzcSEw8xvaTHJQsqwbvuGTyNv=t8zhd=C=DBBodQ@mail.gmail.com>
Subject: Re: [RFC v3 08/16] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009c81bc05b8ad4603"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009c81bc05b8ad4603
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 12:54 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> >  static bool trans_slli(DisasContext *ctx, arg_slli *a)
> >  {
> > -    if (a->shamt >= TARGET_LONG_BITS) {
> > -        return false;
> > -    }
> > -
> >      if (a->rd != 0) {
> > -        TCGv t = tcg_temp_new();
> > -        gen_get_gpr(t, a->rs1);
> > -
> > -        tcg_gen_shli_tl(t, t, a->shamt);
> > -
> > -        gen_set_gpr(a->rd, t);
> > -        tcg_temp_free(t);
> > +        return gen_shifti(ctx, a, tcg_gen_shl_tl);
> >      } /* NOP otherwise */
> >      return true;
> >  }
> >
> >  static bool trans_srli(DisasContext *ctx, arg_srli *a)
> >  {
> > -    if (a->shamt >= TARGET_LONG_BITS) {
> > -        return false;
> > -    }
> > -
> >      if (a->rd != 0) {
> > -        TCGv t = tcg_temp_new();
> > -        gen_get_gpr(t, a->rs1);
> > -
> > -        tcg_gen_shri_tl(t, t, a->shamt);
> > -        gen_set_gpr(a->rd, t);
> > -        tcg_temp_free(t);
> > +        return gen_shifti(ctx, a, tcg_gen_shr_tl);
> >      } /* NOP otherwise */
> >      return true;
> >  }
> >
> >  static bool trans_srai(DisasContext *ctx, arg_srai *a)
> >  {
> > -    if (a->shamt >= TARGET_LONG_BITS) {
> > -        return false;
> > -    }
> > -
> >      if (a->rd != 0) {
> > -        TCGv t = tcg_temp_new();
> > -        gen_get_gpr(t, a->rs1);
> > -
> > -        tcg_gen_sari_tl(t, t, a->shamt);
> > -        gen_set_gpr(a->rd, t);
> > -        tcg_temp_free(t);
> > +        return gen_shifti(ctx, a, tcg_gen_sar_tl);
> >      } /* NOP otherwise */
> >      return true;
> >  }
>
> This removes the illegal instruction check for rd == 0.
>
> In general you don't need the rd != 0 check, because gen_set_gpr will
> handle it
> (and it'll be exceedingly rare, and therefore not worth checking by hand).
>

> r~
>

Sure, I'll remove a->rd != 0 check in the next patchset.
Thanks,

Frank Chang

--0000000000009c81bc05b8ad4603
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 12, 2021 at 12:54 PM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 1/11/21 4:19 PM, <a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> w=
rote:<br>
&gt;=C2=A0 static bool trans_slli(DisasContext *ctx, arg_slli *a)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 if (a-&gt;shamt &gt;=3D TARGET_LONG_BITS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (a-&gt;rd !=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv t =3D tcg_temp_new();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_gpr(t, a-&gt;rs1);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shli_tl(t, t, a-&gt;shamt);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, t);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gen_shifti(ctx, a, tcg_gen_shl_tl)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } /* NOP otherwise */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static bool trans_srli(DisasContext *ctx, arg_srli *a)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 if (a-&gt;shamt &gt;=3D TARGET_LONG_BITS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (a-&gt;rd !=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv t =3D tcg_temp_new();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_gpr(t, a-&gt;rs1);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shri_tl(t, t, a-&gt;shamt);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, t);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gen_shifti(ctx, a, tcg_gen_shr_tl)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } /* NOP otherwise */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static bool trans_srai(DisasContext *ctx, arg_srai *a)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 if (a-&gt;shamt &gt;=3D TARGET_LONG_BITS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (a-&gt;rd !=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv t =3D tcg_temp_new();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_gpr(t, a-&gt;rs1);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_sari_tl(t, t, a-&gt;shamt);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, t);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gen_shifti(ctx, a, tcg_gen_sar_tl)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } /* NOP otherwise */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 }<br>
<br>
This removes the illegal instruction check for rd =3D=3D 0.<br>
<br>
In general you don&#39;t need the rd !=3D 0 check, because gen_set_gpr will=
 handle it<br>
(and it&#39;ll be exceedingly rare, and therefore not worth checking by han=
d).=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
r~<br></blockquote><div><br></div><div>Sure, I&#39;ll remove a-&gt;rd !=3D =
0 check in the next patchset.</div><div>Thanks,</div><div><br></div><div>Fr=
ank Chang</div></div></div>

--0000000000009c81bc05b8ad4603--

