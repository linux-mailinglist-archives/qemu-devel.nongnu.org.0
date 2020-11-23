Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8BE2BFE07
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 02:23:59 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh0aE-0006aE-6j
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 20:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kh0Yn-00065n-7a
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 20:22:29 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kh0Yl-0007jB-8T
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 20:22:28 -0500
Received: by mail-ot1-x341.google.com with SMTP id n12so10950564otk.0
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 17:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xz5JV58ML/qLTyosrHk2EZRsBiDkJ155VQ2FmXOan4k=;
 b=hNBbJnYPYlPRhRo5DgI/XXMaZ7uMi9wDXzr2n7Y1Og4JS0IBGxobwxuKA0/fvVmQfF
 oZmq/MXXdiGkGpk1303hSD7XJn3sMQnLe+d4CV5/W0ASWzm49T8uy7R33zKGllPjwf1j
 ThuLSqZWhhqInDPzF7f6y3staGMtXY4mUogwPLY/HJ58VLMiCWZ47t6siTSCwgSbHQ/C
 OsCsaIoW62nvTK1F3KSVOHO9j7vE9Zfo2N5qe1Kk8ByAOggAvsf8InXzkEg8BkcfWQcA
 qGaqgdWEcz0mZJRrIrNnsRN6FTPnZOTXs9iH4lxM5HptTqK2dHRWpjg4jGMttygwEuBM
 hHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xz5JV58ML/qLTyosrHk2EZRsBiDkJ155VQ2FmXOan4k=;
 b=XXmnHh+0lhEW2jVMZSFm0aSmD8BILNKdr3VsQY1Bo9kYGoFvrIMQ17vOWCUZMGP6mx
 UUAF7gUoCDoDNOsNKLjGAEhSUwUrXeoLVGFEie9UmhSqZ4nN8TuzNR2ZZIXQcEGUfbyG
 Z/wDPOvoJjP6DzaNNU0snR61wXIbaFfFCz08yMwQ2yKsD+lOS1xDz44BG+7nvAoJFC0i
 DWpX9qXcqUaVGNM/EN6IydNaoReUq1kfq3+jhSXpNrRpWcJqwg1ViMJxE+4nes4yq2IL
 k33d2Jm/NlyJkO1ien16fhZRuKuwd1rwa30WGk3fHC6zVpNQ/psa5RkhbnSOq2a/nBRg
 XLzQ==
X-Gm-Message-State: AOAM5332zLtvsbxuOAkwfE9DoiUKvlrf4XmMGCzvNIiXMClz1UitNqK8
 T/IXmEmlwKLgD+CIw79ppX+lLZT14MrQHi5FxXgUfA==
X-Google-Smtp-Source: ABdhPJz3kQmZZKLQ20m0NUeEucAymqsQkvIC7Z7qyVJdo4/40iUBUbsIJvaGKGLFdBTpzFytl+q88IzdkrENR97VAL8=
X-Received: by 2002:a05:6830:1493:: with SMTP id
 s19mr2749083otq.175.1606094545554; 
 Sun, 22 Nov 2020 17:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-16-frank.chang@sifive.com>
 <CALLt3TgGATbAK5TFw-QBUFYTcC_CeAZ1AkMeeYuqgVxcyktT7g@mail.gmail.com>
 <104fea2e-5c9a-8331-b9f5-4d5967651427@gmail.com>
In-Reply-To: <104fea2e-5c9a-8331-b9f5-4d5967651427@gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 23 Nov 2020 09:22:15 +0800
Message-ID: <CAE_xrPg71NQt0fSF6QrVAAG5XESnDQyfQUEs4e6FAS0XvXHt5w@mail.gmail.com>
Subject: Re: [RFC 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dd293d05b4bc0619"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x341.google.com
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dd293d05b4bc0619
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 21, 2020 at 12:24 AM Alistair Francis <alistair23@gmail.com>
wrote:

>
>
> On 19/11/2020 7:02 pm, Kito Cheng wrote:
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 0bbfd7f4574..bc29e118c6d 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >>           if (cpu->cfg.ext_h) {
> >>               target_misa |= RVH;
> >>           }
> >> +        if (cpu->cfg.ext_b) {
> >> +            target_misa |= RVB;
> >> +        }
> >>           if (cpu->cfg.ext_v) {
> >>               target_misa |= RVV;
> >>               if (!is_power_of_2(cpu->cfg.vlen)) {
> >> @@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] = {
> >>       DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
> >>       DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> >>       /* This is experimental so mark with 'x-' */
> >> +    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, true),
> >
> > I think the default value should be false?
>
> Good catch, I missed that.
>
> Yes it should be false.
>
> Alistair
>

Thanks, I'll fix it in my next patchset.

Frank Chang


>
> >
> >>       DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
> >>       DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> >>       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >
>

--000000000000dd293d05b4bc0619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Nov 21, 2020 at 12:24 AM Alistair=
 Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 19/11/2020 7:02 pm, Kito Cheng wrote:<br>
&gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; index 0bbfd7f4574..bc29e118c6d 100644<br>
&gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; @@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev=
, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.ext_h) {<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_misa =
|=3D RVH;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_b) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_misa |=3D RVB;<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.ext_v) {<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_misa =
|=3D RVV;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!is_powe=
r_of_2(cpu-&gt;cfg.vlen)) {<br>
&gt;&gt; @@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] =3D {<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;s&quot;, RISCVCPU=
, cfg.ext_s, true),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;u&quot;, RISCVCPU=
, cfg.ext_u, true),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is experimental so mark with &#3=
9;x-&#39; */<br>
&gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;x-b&quot;, RISCVCPU, cfg.ext=
_b, true),<br>
&gt; <br>
&gt; I think the default value should be false?<br>
<br>
Good catch, I missed that.<br>
<br>
Yes it should be false.<br>
<br>
Alistair<br></blockquote><div><br></div><div>Thanks, I&#39;ll fix it in my =
next patchset.</div><div><br></div><div>Frank Chang</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-h&quot;, RISCVC=
PU, cfg.ext_h, false),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-v&quot;, RISCVC=
PU, cfg.ext_v, false),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Counters&quot;, R=
ISCVCPU, cfg.ext_counters, true),<br>
&gt; <br>
</blockquote></div></div>

--000000000000dd293d05b4bc0619--

