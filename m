Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2EB323484
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 01:46:00 +0100 (CET)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEiJS-0008QE-PW
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 19:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lEiHe-0007p3-EG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:44:06 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:41013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lEiHb-000175-9l
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:44:06 -0500
Received: by mail-ot1-x330.google.com with SMTP id s107so542603otb.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 16:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EE/srU3Oa/6tIABDfnNyF/+QIdWdgTUfcnz/0/9SQ3c=;
 b=JgNbotGKrP98peWjksVeZJV4RPE71DkCfxpmONYbnT2Ex0ilwT4RQohD1o8iyqv96W
 NXPd6ej3mXb2NwdKXPihmqtwlA7baUfVMJoRznImmE9CKLUK3OIQevI9r1e/6w/EedLp
 n7Dp9aBx9ZAq7TlKIqBOLVu63vcnuR+ugKwcp5zGYxRLk61sEOoRzQv6NcONBYEdAnz0
 hLtVEoKHIPuKGom7cNoVF9UwQyRM1J22HH9zoCJ1CNSbUR3D4upu+n+Zqfi8/y9Fa7MM
 msCkh2HvkE8w1Pwo7fswZ2pDAKwXxpxEFfgQ5jsKA+g10BspTolT66wDE6F0Jjwa4l+K
 0+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EE/srU3Oa/6tIABDfnNyF/+QIdWdgTUfcnz/0/9SQ3c=;
 b=pCMZbNxOWII+7EpBbPaD0xGUZv0VERRtMp1YfDjl9eLHXZ/6AY4oY5bnNS5BipW+Nq
 bxz4xEWvjs+QB3DMKTFWy9r4kvfV2Rx+HGbDfN9IICE8bX5PH612/2EaKpZpioSNjEC2
 bngROOP891pfEfs/IDkIk4DGOFnjZ+gA3tON2tSwX+zzoWpnEOpa2x6YzChcs/TEoQPQ
 BwrSPRlti+kwTQC12GdyPTMFIXPOxExYVuk0t0JwSxbqC0MBaISvGGnOoLVTH4sWPDyY
 c2FCOWGItnPh6JtK+/ga+PaYTI/5zBRjfMGHoN9Ei+goj5q2QI6RvzDi55BO/Pu8AudW
 2QmQ==
X-Gm-Message-State: AOAM532/seiiAonQ8E7Ut0bfkaMGLo4j/2cx2hibdwLGAG4sXRK5asbv
 gzSgHi+QYLgAZ02UjF/1ykVE2q9vhi+09SQk9kniUQ==
X-Google-Smtp-Source: ABdhPJyRp946nhCPUX3KkJrkl8UTY+xlOSs0vSazwIiFqMa6KDu/7bx6PJn96g2XZFjLwKFQOnri0MkERDVDkcXvUTA=
X-Received: by 2002:a9d:2ac4:: with SMTP id e62mr23062371otb.139.1614127438698; 
 Tue, 23 Feb 2021 16:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20210223081951.20226-1-frank.chang@sifive.com>
 <500b1f4a-1fe8-9e4f-cdee-2c2b35a53edb@linaro.org>
In-Reply-To: <500b1f4a-1fe8-9e4f-cdee-2c2b35a53edb@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 24 Feb 2021 08:43:48 +0800
Message-ID: <CAE_xrPiU0kL5nkcL3RbRSNyRv1FCVYk1pOVXp_rVFFB8dhaMCg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009b30e205bc0a5421"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x330.google.com
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
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b30e205bc0a5421
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 24, 2021 at 2:24 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/23/21 12:19 AM, frank.chang@sifive.com wrote:
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
> > commit: c445593, but other TB_FLAGS bits for rvv and rvh were
> > not shift as well so these bits may overlap with each other when
> > rvv is enabled.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > -#define TB_FLAGS_MMU_MASK   7
> >  #define TB_FLAGS_PRIV_MMU_MASK                3
> >  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> >  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> ...
> > +FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> > +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
> > +FIELD(TB_FLAGS, LMUL, 4, 2)
> > +FIELD(TB_FLAGS, SEW, 6, 3)
> > +FIELD(TB_FLAGS, VILL, 9, 1)
> >  /* Is a Hypervisor instruction load/store allowed? */
> > -FIELD(TB_FLAGS, HLSX, 9, 1)
> > +FIELD(TB_FLAGS, HLSX, 10, 1)
>
> The only other thing that I'd add at this point is a comment about
> MSTATUS_FS
> -- a 2-bit field at bit 13 -- for the benefit of the next person that adds
> something to TB_FLAGS.
>
>
In fact, in RVV patchset, both MSTATUS_FS and MSTATUS_VS are skipped
and I also add the comments to state that.
The bits are also rearranged to fill the empty bit holes in RVV patchset on
my local branch:

  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
  FIELD(TB_FLAGS, LMUL, 3, 3)
  FIELD(TB_FLAGS, SEW, 6, 3)
  /* Skip MSTATUS_VS (0x600) bits */
  FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
  FIELD(TB_FLAGS, VILL, 12, 1)
  /* Skip MSTATUS_FS (0x6000) bits */
  /* Is a Hypervisor instruction load/store allowed? */
  FIELD(TB_FLAGS, HLSX, 15, 1)

Thanks for the review.
Frank Chang


>
> r~
>

--0000000000009b30e205bc0a5421
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 24, 2021 at 2:24 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 2/23/21 12:19 AM, <a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> w=
rote:<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; <br>
&gt; TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in<br>
&gt; commit: c445593, but other TB_FLAGS bits for rvv and rvh were<br>
&gt; not shift as well so these bits may overlap with each other when<br>
&gt; rvv is enabled.<br>
&gt; <br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt; -#define TB_FLAGS_MMU_MASK=C2=A0 =C2=A07<br>
&gt;=C2=A0 #define TB_FLAGS_PRIV_MMU_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt;=C2=A0 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK=C2=A0 =C2=A0(1 &lt;&lt; 2)=
<br>
&gt;=C2=A0 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS<br>
...<br>
&gt; +FIELD(TB_FLAGS, MEM_IDX, 0, 3)<br>
&gt; +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)<br>
&gt; +FIELD(TB_FLAGS, LMUL, 4, 2)<br>
&gt; +FIELD(TB_FLAGS, SEW, 6, 3)<br>
&gt; +FIELD(TB_FLAGS, VILL, 9, 1)<br>
&gt;=C2=A0 /* Is a Hypervisor instruction load/store allowed? */<br>
&gt; -FIELD(TB_FLAGS, HLSX, 9, 1)<br>
&gt; +FIELD(TB_FLAGS, HLSX, 10, 1)<br>
<br>
The only other thing that I&#39;d add at this point is a comment about MSTA=
TUS_FS<br>
-- a 2-bit field at bit 13 -- for the benefit of the next person that adds<=
br>
something to TB_FLAGS.<br>
<br></blockquote><div><br></div><div>In fact, in RVV patchset, both MSTATUS=
_FS and MSTATUS_VS are skipped</div><div>and I also add the comments to sta=
te that.</div><div>The bits are also rearranged to fill the empty bit holes=
 in RVV patchset on my local branch:</div><div><br></div><div>=C2=A0 FIELD(=
TB_FLAGS, MEM_IDX, 0, 3)<br>=C2=A0 FIELD(TB_FLAGS, LMUL, 3, 3)<br>=C2=A0 FI=
ELD(TB_FLAGS, SEW, 6, 3)<br>=C2=A0 /* Skip MSTATUS_VS (0x600) bits */<br>=
=C2=A0 FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)<br>=C2=A0 FIELD(TB_FLAGS, VILL, =
12, 1)<br>=C2=A0 /* Skip MSTATUS_FS (0x6000) bits */<br>=C2=A0 /* Is a Hype=
rvisor instruction load/store allowed? */<br>=C2=A0 FIELD(TB_FLAGS, HLSX, 1=
5, 1)<br></div><div><br></div><div>Thanks for the review.</div><div>Frank C=
hang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
r~<br>
</blockquote></div></div>

--0000000000009b30e205bc0a5421--

