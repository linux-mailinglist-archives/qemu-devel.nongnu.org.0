Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775EA5B17F7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:07:04 +0200 (CEST)
Received: from localhost ([::1]:40810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWDUw-0005NN-4X
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWDQU-00024l-N2
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:02:27 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWDQH-0006M5-Ra
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:02:20 -0400
Received: by mail-qk1-x72b.google.com with SMTP id g16so12349006qkl.11
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gOTcYuKNqyTsioFlJG9i7wr/ZC7Jd8xCsH2hXVPZMrE=;
 b=H0cScvSf6cLMuKGVnTw1x88IjTeWQcET/MCcjSu18lxz7vF/9SqnjzOiCYunao7MaG
 BIxy1NG1azVjr8Li5gMVrHR8sS2MnxVxehAAyPX5q/RKmBQ5Vr2afHvohuAduMro0nrC
 fX2IWwgbqaZfqtVJmEajUoR9G8wRonln75MfxhP9yeZovoJYFFmYWXp5L/iH0mG2lm7S
 cDaUTuJ8HiHnJEfAz3hHDtdJt6QfDvT3jvP7fioFkFM5mq8ZkphogI6+uz3kYPnj9v3v
 36jLC/teuSDW8h6mbOet+y64/9oEgw6FlapCC0jWI4DXNANBVGjIVhoZ2e/WiZ36jQAF
 DDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gOTcYuKNqyTsioFlJG9i7wr/ZC7Jd8xCsH2hXVPZMrE=;
 b=JGpwmcAso8SvEICj5DWjchUPuPky7tHkWEMbViHab1rKPBbUS35YVka023mEoJjQ7D
 miUgBjc/pzHSjQPii254UJpnOxo8o7MiXBur5tyhDWxUTcd13luqJE4ufZEKUgjHbLjV
 mi/+vGXBMKDg0RQYGBqlI70bdOX5mDbol240nsSvuFx4AVwUGCUIjQhptuQssRWR/bOE
 nSbmlu1iiN+ZQot4nShltZu34zMEjevwNk4DpXj2LX+x1zzs8O5rXyxqQWEfI8OKE1pN
 AmjYHPsSjqVyaALmB5QcvtSB3VEw5nRboIM2WlzQAZKeT/SLtyFsYFr6erS+zGpVRvd3
 3E0w==
X-Gm-Message-State: ACgBeo1e41bP48h3RiYuLhGbbEo2VelyysIH93Im799mGn4MYgzCdGhC
 B6Be5QFwG1hwvr8kiamZ+Lpurt1tOtDIk3tX9P71DA==
X-Google-Smtp-Source: AA6agR6eMpg0NRwW1j9dVIfTk8aDH9cILhASCRqKSzM0z4YutKbuHdNIS4Upcj8Do8WmhsebDmPbQmXrrXNGC3vzjCo=
X-Received: by 2002:a05:620a:248f:b0:6bb:89d1:3e85 with SMTP id
 i15-20020a05620a248f00b006bb89d13e85mr5617003qkn.408.1662627728034; Thu, 08
 Sep 2022 02:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-12-christoph.muellner@vrull.eu>
 <9eba2b9e-ebe0-bf2d-2dc7-75ae81b0592e@linaro.org>
 <CAEg0e7jEh+ix32xGs+BdpCZOCT9YAFC_Lb5Ti-FQcFJiDtHmnQ@mail.gmail.com>
 <aa79c76c-fc8c-ca76-6224-ba5d85f3d966@linaro.org>
In-Reply-To: <aa79c76c-fc8c-ca76-6224-ba5d85f3d966@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 8 Sep 2022 11:01:56 +0200
Message-ID: <CAEg0e7jmVX8uyke0aUOR+RFHNzBvh=DzJbLjeBd9poyNYon_BA@mail.gmail.com>
Subject: Re: [PATCH 11/11] RISC-V: Add initial support for T-Head C906 and
 C910 CPUs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson@rivosinc.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="0000000000001fa2cd05e826af75"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--0000000000001fa2cd05e826af75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2022 at 10:56 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/8/22 09:23, Christoph M=C3=BCllner wrote:
> >
> >
> > On Thu, Sep 8, 2022 at 9:46 AM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 9/6/22 13:22, Christoph Muellner wrote:
> >      > +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,
>  rv64_thead_c906_cpu_init),
> >      > +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,
>  rv64_thead_c906_cpu_init),
> >
> >     Why model both if they're identical?
> >
> >
> > I figured that users might expect that (existence of "thead-c906" and
> "thead-c910").
> > And using "thead-c9xx" feels like it would be regretted in the future.
> >
> > Should I drop "thead-c910"?
>
> Quite possibly.  For Arm, we don't try to supply every cpu model, only
> those that differ
> in some substantial way.
>

Ok, will do.

Thanks!


>
>
> r~
>

--0000000000001fa2cd05e826af75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 10:56 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/8/22 09:23, Christoph M=C3=BCllner wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Sep 8, 2022 at 9:46 AM Richard Henderson &lt;<a href=3D"mailto=
:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.o=
rg</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 9/6/22 13:22, Christoph Muellner wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 DEFINE_CPU(TYPE_RISCV_CPU_THEA=
D_C906,=C2=A0 =C2=A0 =C2=A0 =C2=A0rv64_thead_c906_cpu_init),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 DEFINE_CPU(TYPE_RISCV_CPU_THEA=
D_C910,=C2=A0 =C2=A0 =C2=A0 =C2=A0rv64_thead_c906_cpu_init),<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Why model both if they&#39;re identical?<br>
&gt; <br>
&gt; <br>
&gt; I figured that users might expect that (existence of &quot;thead-c906&=
quot; and &quot;thead-c910&quot;).<br>
&gt; And using &quot;thead-c9xx&quot; feels like it would be regretted in t=
he future.<br>
&gt; <br>
&gt; Should I drop &quot;thead-c910&quot;?<br>
<br>
Quite possibly.=C2=A0 For Arm, we don&#39;t try to supply every cpu model, =
only those that differ <br>
in some substantial way.<br></blockquote><div><br></div><div>Ok, will do.</=
div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000001fa2cd05e826af75--

