Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098ED43D964
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:36:54 +0200 (CEST)
Received: from localhost ([::1]:38694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvHh-00012U-4y
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvFe-0007Ph-QR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:34:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvFc-0001Ya-2U
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:34:46 -0400
Received: by mail-ed1-x52c.google.com with SMTP id r12so18565615edt.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3q7p2Kfz5SpCCLhrNbkaF8rASe1huHd1b/fICpGokU=;
 b=MlBrCFJ3ZXuIjjtYC+b7mxR4+tT+23rx20itVZUC041eA8mZJLO78gwdYkMWJft95v
 jjOSyp+KvVz5w/QLhadpmB/UhNHuvdSXqfqBEQdumoBe1yykXTO+9wEmhnIrUH8bhLXl
 CQFZm0KJa6JUNzXVrQP7YFQe51oGTc6jLeouU/Co1Vj3galGu8bfKZB5vXgxVCZzU1Qv
 uu1fArlgYGI/BDI/brvrLLirGjeuRczTUYrTN9jOba5pfzDJNdXY1RN9buGXKscrHzeY
 vwwCITPHD6Bwd1AWup5TOiTNBN6JrFMcrmS47dq0e8/oTyxP+f6I5D5JDckZGVbyzrQg
 s0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3q7p2Kfz5SpCCLhrNbkaF8rASe1huHd1b/fICpGokU=;
 b=oGZQbQgiqbLhiovt96F5MOvxLR7wvGNj6vAYbDIh4DCoTbWtvFsgRm+yuzSdCJYtzt
 T30IHM440nNzfdasXwSB3K5iEuWmG0CQC27aCyD9FTrGA81EkZ33uB3nDr+3YBhXGxOP
 BXLCqRhvyMqffs4CFJIhPBflktTbnlr0LeUjic9dLsgBDJrG3f/V/DuFVmjTwoC+tLhO
 zBspooHA9uUfsfDJJdCXGmqqZqKBB4avi/kQDSyjVAFUqtNuvK5aMh7poq+0ITuMn+ia
 iqnH+8Azb+Z0cbkoDkvE/JYpV93Y2Xel52GM2AqV14mMA5GeYBeSJ2QoO2t9jFIQReoo
 9FeA==
X-Gm-Message-State: AOAM533YpwRWTGW09PFLN9SIoWZKaW7DPOCKhWGixDGfihEsvsOb4ojx
 CtKk7khvV5EKPh2vDiDP6YXdI11oYfN148zVSu6DHA==
X-Google-Smtp-Source: ABdhPJzbfofDFI9Uno8kJTVLCyQu673W7GpzPcBYH8yNCwkvqlUc+GVISHD499JZ5z/9vVXftgd1c5IFXy/YBi1JC38=
X-Received: by 2002:a17:906:9501:: with SMTP id
 u1mr1725155ejx.496.1635388481316; 
 Wed, 27 Oct 2021 19:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
 <CAKmqyKNrje6W0kzHgfRf6k9gVAz4c12zdKYYbsSJaHNFdbnQXA@mail.gmail.com>
In-Reply-To: <CAKmqyKNrje6W0kzHgfRf6k9gVAz4c12zdKYYbsSJaHNFdbnQXA@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 28 Oct 2021 08:04:05 +0530
Message-ID: <CA+Oz1=aCVsyxV38QtfWa001Gr6M6iqyToR9mTzu_B4jh9fDqTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mconfigptr support
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007fc00305cf608dfc"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x52c.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007fc00305cf608dfc
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 8:14 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Oct 25, 2021 at 10:51 PM Rahul Pathak <rpathak@ventanamicro.com>
> wrote:
> >
> > Patches add the mconfigptr csr support.
> > mconfigptr is newly incorporated in risc-v privileged architecture
> > specification 1.12 version.
> > priv spec 1.12.0 version check is also added.
> >
> >
> > qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=v1.12.0
>
> Thanks for the patches!
>
> I gave some comments in line with the code changes. Overall this looks
> good, we just need to add the other v1.12.0 features.
>
> Alistair


Thanks Alistair, I will work on the comments and send the
next version.

>
>
>
> > Changelog:
> >
> > v1->v2
> > ------
> > 1. Added privileged architecture spec version 1.12 ("v1.12.0") check
> > 2. Added predicate function for mconfigptr which verifies
> > for priv spec version v1.12.0 or higher.
> >
> > Thanks
> > Rahul
> >
> > Rahul Pathak (2):
> >   target/riscv: Add priv spec 1.12.0 version check
> >   target/riscv: csr: Implement mconfigptr CSR
> >
> >  target/riscv/cpu.c      |  4 +++-
> >  target/riscv/cpu.h      |  1 +
> >  target/riscv/cpu_bits.h |  1 +
> >  target/riscv/csr.c      | 19 +++++++++++++++----
> >  4 files changed, 20 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
>

--0000000000007fc00305cf608dfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 8:14 AM Alis=
tair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, Oct 25, 2021 at 10:51 PM Rahul Pathak &lt;<a href=3D"mailto:rpath=
ak@ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Patches add the mconfigptr csr support.<br>
&gt; mconfigptr is newly incorporated in risc-v privileged architecture<br>
&gt; specification 1.12 version.<br>
&gt; priv spec 1.12.0 version check is also added.<br>
&gt;<br>
&gt;<br>
&gt; qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=3Dv1.=
12.0<br>
<br>
Thanks for the patches!<br>
<br>
I gave some comments in line with the code changes. Overall this looks<br>
good, we just need to add the other v1.12.0 features.<br>
<br>
Alistai<span class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f">r</span></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">Thanks Alistair, I will work on the com=
ments and send the=C2=A0</div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif">next version.</div><div class=3D"gmail_default" st=
yle=3D"font-family:verdana,sans-serif"></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-family:verd=
ana,sans-serif"></span>=C2=A0<br></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; v1-&gt;v2<br>
&gt; ------<br>
&gt; 1. Added privileged architecture spec version 1.12 (&quot;v1.12.0&quot=
;) check<br>
&gt; 2. Added predicate function for mconfigptr which verifies<br>
&gt; for priv spec version v1.12.0 or higher.<br>
&gt;<br>
&gt; Thanks<br>
&gt; Rahul<br>
&gt;<br>
&gt; Rahul Pathak (2):<br>
&gt;=C2=A0 =C2=A0target/riscv: Add priv spec 1.12.0 version check<br>
&gt;=C2=A0 =C2=A0target/riscv: csr: Implement mconfigptr CSR<br>
&gt;<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/cpu_bits.h |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++----<=
br>
&gt;=C2=A0 4 files changed, 20 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000007fc00305cf608dfc--

