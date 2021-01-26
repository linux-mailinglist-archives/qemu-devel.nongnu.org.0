Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7E303775
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:47:27 +0100 (CET)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4J4P-0001lR-E0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1l4J1B-0008Ln-CM
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:44:05 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:43324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1l4J18-0001xQ-9n
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:44:05 -0500
Received: by mail-oi1-x234.google.com with SMTP id i25so6187153oie.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etSaseQMnqDMoqnBOr4eNun84jxkl2tJf6RFDGSVsDE=;
 b=BWauU4joctdv1idWnr8KQgSD5PDKOYzmpz+ocniv3E33NhBjkEtw9sRxlyFEhtMrdc
 +PZBUUTvXSMHUp4Utk0dPBmlAF4wBvBzMenjtrPHDWW5GgSeZohu3QYcqweNzosUPrSw
 F1XhTonFWiaqqS4lBYGttizl9w56ZERrAh4PUXS3Go6AFLbFNG6FrkiCFn1uEXdZxm8t
 H7codkdwKsdj9i3WKdIaWqOZxLs7rt90Y48otDQxfd0u1oJ8IHr4dhSvaQTCY9lIolzm
 Yjg3Z95J/iAVLQbJeazd2kgmPffbIGgQ7qvt8eT6e/g48wqewEgu5J44LJQY+asb2gOh
 A0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etSaseQMnqDMoqnBOr4eNun84jxkl2tJf6RFDGSVsDE=;
 b=gAXde8Qe9o1aMKcfGo3Fbov2SDEUTYexFr9MtPYp7OyW2pllqx/PWEUb781he6M43c
 sVtdujxoqgb/UyZV/bY+ICyPSBRg//fzC1+41N0CZVwI4bpST3XJTZa8VWEvLl87fRHu
 ofyCCIHkrZDtgArroIITkihfgQpzCQSBTNwdAeXG8nyzn7y7IrAz3xmKgbcaa1FiI+6B
 +JMxv+NLXjH6AjtakJrMNleHrtMo7I5ohWOnKWNLlrs6t3PDHtoMBu3iWOqNrQ1qzf5M
 SOdgQcm/NEhnOGDcCQxWXIAIgpMVgZezXDd3XfsF8zirQvrEBHzdjQayxCTPl+O/3WOQ
 jWZQ==
X-Gm-Message-State: AOAM533+ZjKDs3qfwvDOBKPZg9XFKIjFOwwm9nx+E5+5Wc3PtGWpS9G8
 KmrsQZ52HyswEE7EDAT8q3B+lY961/bE9EevhF/G+g==
X-Google-Smtp-Source: ABdhPJypBS/sMKo3wE+ABNI3746YCzZFiHonFo/Duqb394mW3WOsj15jbRr4pAPf5pgwrTrPCFtJDXAYs8qpk/S5W/A=
X-Received: by 2002:aca:5088:: with SMTP id e130mr2398098oib.78.1611647040958; 
 Mon, 25 Jan 2021 23:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-69-frank.chang@sifive.com>
 <CAKmqyKM-XPcGMo0Z0549ojPSKqCbW3bq4+77JnzV5WQGS2Q3Fg@mail.gmail.com>
In-Reply-To: <CAKmqyKM-XPcGMo0Z0549ojPSKqCbW3bq4+77JnzV5WQGS2Q3Fg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 26 Jan 2021 15:43:49 +0800
Message-ID: <CAE_xrPh+Vi97vRPo_wh78F+YRGxKGH0G=Bm3K7cp1t+s87PqCQ@mail.gmail.com>
Subject: Re: [PATCH v6 68/72] target/riscv: gdb: modify gdb csr xml file to
 align with csr register map
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000614ff605b9c8d16c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Hsiangkai Wang <kai.wang@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000614ff605b9c8d16c
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 7:54 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Jan 12, 2021 at 2:50 AM <frank.chang@sifive.com> wrote:
> >
> > From: Hsiangkai Wang <kai.wang@sifive.com>
> >
> > Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
> > Acked-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>
> This patch won't apply any more, we have removed the hardcoded GDB
> register list.
>
> Alistair
>

Okay, I will update it in my next patchset.

Thanks,
Frank Chang


>
> > ---
> >  gdb-xml/riscv-32bit-csr.xml | 11 ++++++-----
> >  gdb-xml/riscv-64bit-csr.xml | 11 ++++++-----
> >  target/riscv/gdbstub.c      |  4 ++--
> >  3 files changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
> > index da1bf19e2f4..3d2031da7dc 100644
> > --- a/gdb-xml/riscv-32bit-csr.xml
> > +++ b/gdb-xml/riscv-32bit-csr.xml
> > @@ -110,6 +110,8 @@
> >    <reg name="mcause" bitsize="32"/>
> >    <reg name="mtval" bitsize="32"/>
> >    <reg name="mip" bitsize="32"/>
> > +  <reg name="mtinst" bitsize="32"/>
> > +  <reg name="mtval2" bitsize="32"/>
> >    <reg name="pmpcfg0" bitsize="32"/>
> >    <reg name="pmpcfg1" bitsize="32"/>
> >    <reg name="pmpcfg2" bitsize="32"/>
> > @@ -232,12 +234,11 @@
> >    <reg name="hedeleg" bitsize="32"/>
> >    <reg name="hideleg" bitsize="32"/>
> >    <reg name="hie" bitsize="32"/>
> > -  <reg name="htvec" bitsize="32"/>
> > -  <reg name="hscratch" bitsize="32"/>
> > -  <reg name="hepc" bitsize="32"/>
> > -  <reg name="hcause" bitsize="32"/>
> > -  <reg name="hbadaddr" bitsize="32"/>
> > +  <reg name="hcounteren" bitsize="32"/>
> > +  <reg name="htval" bitsize="32"/>
> >    <reg name="hip" bitsize="32"/>
> > +  <reg name="htinst" bitsize="32"/>
> > +  <reg name="hgatp" bitsize="32"/>
> >    <reg name="mbase" bitsize="32"/>
> >    <reg name="mbound" bitsize="32"/>
> >    <reg name="mibase" bitsize="32"/>
> > diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
> > index 6aa4bed9f50..90394562930 100644
> > --- a/gdb-xml/riscv-64bit-csr.xml
> > +++ b/gdb-xml/riscv-64bit-csr.xml
> > @@ -110,6 +110,8 @@
> >    <reg name="mcause" bitsize="64"/>
> >    <reg name="mtval" bitsize="64"/>
> >    <reg name="mip" bitsize="64"/>
> > +  <reg name="mtinst" bitsize="64"/>
> > +  <reg name="mtval2" bitsize="64"/>
> >    <reg name="pmpcfg0" bitsize="64"/>
> >    <reg name="pmpcfg1" bitsize="64"/>
> >    <reg name="pmpcfg2" bitsize="64"/>
> > @@ -232,12 +234,11 @@
> >    <reg name="hedeleg" bitsize="64"/>
> >    <reg name="hideleg" bitsize="64"/>
> >    <reg name="hie" bitsize="64"/>
> > -  <reg name="htvec" bitsize="64"/>
> > -  <reg name="hscratch" bitsize="64"/>
> > -  <reg name="hepc" bitsize="64"/>
> > -  <reg name="hcause" bitsize="64"/>
> > -  <reg name="hbadaddr" bitsize="64"/>
> > +  <reg name="hcounteren" bitsize="64"/>
> > +  <reg name="htval" bitsize="64"/>
> >    <reg name="hip" bitsize="64"/>
> > +  <reg name="htinst" bitsize="64"/>
> > +  <reg name="hgatp" bitsize="64"/>
> >    <reg name="mbase" bitsize="64"/>
> >    <reg name="mbound" bitsize="64"/>
> >    <reg name="mibase" bitsize="64"/>
> > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> > index eba12a86f2e..f7c5212e274 100644
> > --- a/target/riscv/gdbstub.c
> > +++ b/target/riscv/gdbstub.c
> > @@ -418,13 +418,13 @@ void
> riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> >      }
> >  #if defined(TARGET_RISCV32)
> >      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> > -                             240, "riscv-32bit-csr.xml", 0);
> > +                             241, "riscv-32bit-csr.xml", 0);
> >
> >      gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
> riscv_gdb_set_virtual,
> >                               1, "riscv-32bit-virtual.xml", 0);
> >  #elif defined(TARGET_RISCV64)
> >      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> > -                             240, "riscv-64bit-csr.xml", 0);
> > +                             241, "riscv-64bit-csr.xml", 0);
> >
> >      gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
> riscv_gdb_set_virtual,
> >                               1, "riscv-64bit-virtual.xml", 0);
> > --
> > 2.17.1
> >
> >
>

--000000000000614ff605b9c8d16c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 26, 2021 at 7:54 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Jan 12, 2021 at 2:50 AM &lt;<a href=3D"mail=
to:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Hsiangkai Wang &lt;<a href=3D"mailto:kai.wang@sifive.com" target=
=3D"_blank">kai.wang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Hsiangkai Wang &lt;<a href=3D"mailto:kai.wang@sifive.co=
m" target=3D"_blank">kai.wang@sifive.com</a>&gt;<br>
&gt; Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
This patch won&#39;t apply any more, we have removed the hardcoded GDB<br>
register list.<br>
<br>
Alistair<br></blockquote><div><br></div><div>Okay, I will update it in my n=
ext patchset.</div><div><br></div><div>Thanks,</div><div>Frank Chang</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 gdb-xml/riscv-32bit-csr.xml | 11 ++++++-----<br>
&gt;=C2=A0 gdb-xml/riscv-64bit-csr.xml | 11 ++++++-----<br>
&gt;=C2=A0 target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 3 files changed, 14 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml=
<br>
&gt; index da1bf19e2f4..3d2031da7dc 100644<br>
&gt; --- a/gdb-xml/riscv-32bit-csr.xml<br>
&gt; +++ b/gdb-xml/riscv-32bit-csr.xml<br>
&gt; @@ -110,6 +110,8 @@<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mcause&quot; bitsize=3D&quot;32&quot=
;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mtval&quot; bitsize=3D&quot;32&quot;=
/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mip&quot; bitsize=3D&quot;32&quot;/&=
gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;mtinst&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;mtval2&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;pmpcfg0&quot; bitsize=3D&quot;32&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;pmpcfg1&quot; bitsize=3D&quot;32&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;pmpcfg2&quot; bitsize=3D&quot;32&quo=
t;/&gt;<br>
&gt; @@ -232,12 +234,11 @@<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hedeleg&quot; bitsize=3D&quot;32&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hideleg&quot; bitsize=3D&quot;32&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hie&quot; bitsize=3D&quot;32&quot;/&=
gt;<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;htvec&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hscratch&quot; bitsize=3D&quot;32&quot;/&=
gt;<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hepc&quot; bitsize=3D&quot;32&quot;/&gt;<=
br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hcause&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hbadaddr&quot; bitsize=3D&quot;32&quot;/&=
gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;hcounteren&quot; bitsize=3D&quot;32&quot;=
/&gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;htval&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hip&quot; bitsize=3D&quot;32&quot;/&=
gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;htinst&quot; bitsize=3D&quot;32&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;hgatp&quot; bitsize=3D&quot;32&quot;/&gt;=
<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mbase&quot; bitsize=3D&quot;32&quot;=
/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mbound&quot; bitsize=3D&quot;32&quot=
;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mibase&quot; bitsize=3D&quot;32&quot=
;/&gt;<br>
&gt; diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml=
<br>
&gt; index 6aa4bed9f50..90394562930 100644<br>
&gt; --- a/gdb-xml/riscv-64bit-csr.xml<br>
&gt; +++ b/gdb-xml/riscv-64bit-csr.xml<br>
&gt; @@ -110,6 +110,8 @@<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mcause&quot; bitsize=3D&quot;64&quot=
;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mtval&quot; bitsize=3D&quot;64&quot;=
/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mip&quot; bitsize=3D&quot;64&quot;/&=
gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;mtinst&quot; bitsize=3D&quot;64&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;mtval2&quot; bitsize=3D&quot;64&quot;/&gt=
;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;pmpcfg0&quot; bitsize=3D&quot;64&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;pmpcfg1&quot; bitsize=3D&quot;64&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;pmpcfg2&quot; bitsize=3D&quot;64&quo=
t;/&gt;<br>
&gt; @@ -232,12 +234,11 @@<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hedeleg&quot; bitsize=3D&quot;64&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hideleg&quot; bitsize=3D&quot;64&quo=
t;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hie&quot; bitsize=3D&quot;64&quot;/&=
gt;<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;htvec&quot; bitsize=3D&quot;64&quot;/&gt;=
<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hscratch&quot; bitsize=3D&quot;64&quot;/&=
gt;<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hepc&quot; bitsize=3D&quot;64&quot;/&gt;<=
br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hcause&quot; bitsize=3D&quot;64&quot;/&gt=
;<br>
&gt; -=C2=A0 &lt;reg name=3D&quot;hbadaddr&quot; bitsize=3D&quot;64&quot;/&=
gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;hcounteren&quot; bitsize=3D&quot;64&quot;=
/&gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;htval&quot; bitsize=3D&quot;64&quot;/&gt;=
<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;hip&quot; bitsize=3D&quot;64&quot;/&=
gt;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;htinst&quot; bitsize=3D&quot;64&quot;/&gt=
;<br>
&gt; +=C2=A0 &lt;reg name=3D&quot;hgatp&quot; bitsize=3D&quot;64&quot;/&gt;=
<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mbase&quot; bitsize=3D&quot;64&quot;=
/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mbound&quot; bitsize=3D&quot;64&quot=
;/&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;reg name=3D&quot;mibase&quot; bitsize=3D&quot;64&quot=
;/&gt;<br>
&gt; diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c<br>
&gt; index eba12a86f2e..f7c5212e274 100644<br>
&gt; --- a/target/riscv/gdbstub.c<br>
&gt; +++ b/target/riscv/gdbstub.c<br>
&gt; @@ -418,13 +418,13 @@ void riscv_cpu_register_gdb_regs_for_features(CP=
UState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdb_register_coprocessor(cs, riscv_gdb_get_csr, ri=
scv_gdb_set_csr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0240, &quot;riscv-32bit-csr.xml&quot;, 0)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0241, &quot;riscv-32bit-csr.xml&quot;, 0)=
;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdb_register_coprocessor(cs, riscv_gdb_get_virtual=
, riscv_gdb_set_virtual,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01, &quot;riscv-32bit-virtual.xml&q=
uot;, 0);<br>
&gt;=C2=A0 #elif defined(TARGET_RISCV64)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdb_register_coprocessor(cs, riscv_gdb_get_csr, ri=
scv_gdb_set_csr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0240, &quot;riscv-64bit-csr.xml&quot;, 0)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0241, &quot;riscv-64bit-csr.xml&quot;, 0)=
;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdb_register_coprocessor(cs, riscv_gdb_get_virtual=
, riscv_gdb_set_virtual,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01, &quot;riscv-64bit-virtual.xml&q=
uot;, 0);<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000614ff605b9c8d16c--

