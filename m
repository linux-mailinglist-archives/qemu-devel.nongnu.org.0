Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F06810AE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:05:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUmj-0005Jg-6a; Mon, 30 Jan 2023 09:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMUmg-0005IY-ST
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:05:22 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMUmf-00076F-5b
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:05:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q10so11166463wrm.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4M4xtfnQMpx7jd/celDbU8GRpcb2Xrqa0e2A+umGAi0=;
 b=YuuIZWvRDP9+kd8cc+Mm2pGTX1ivhW8v9z1rZh3jTLYpEeSYbXg9VSovCpcmnoBT1y
 079m/xiAbxmgqjR7OfQ8Nu/RfBoWPZBXaIw3Lb3muU91qfCArGLsNOtWlEAvVwErR5re
 Uf15v7TU2XDB5TfXU9oD/Oct6rF2v3y1pPbBJp/WgjxHbkyZCGoITIa6nzL3xAv4LwyX
 5K1G7lAFttONHLiU2dT5r0qsXHpursaUphuPKZIozqt6UPylshn1+RyjjpKYD6k2v9nT
 MrLvXvWV4k7PD7VMdB+ovEXZt4eQY/ZqDZGuK6IeAbm805GXhtjh3nl7Z4wo4KjdhbqG
 8Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4M4xtfnQMpx7jd/celDbU8GRpcb2Xrqa0e2A+umGAi0=;
 b=O9Wuo5DOpuBGMc2BDgbzYH5my1HWBiCirEQftzLqdo8OVOml8NpH6xg5op2FCyjJlL
 dZ8UDVO1o5sUI/8TCgk9FXDAzRCKLZbSfsR/AQkLfI2k+RYO6ZRQJBHHE58q737IuX6W
 RwDJe117KmoB+/rMW94IOFB2HK6HjyK8Pc8xVrhA8V32IhuqUklMxHZbvj0nI65Acear
 G13YfojYtVOgtFl+B2wWRGdnPqWHSgO7PHmxDn4vkrA0YSaLdVZrWZaGWfch1LREgkNd
 s48zWW17CSrispTrQo/0HdijMT8xkD0UieJo68JgPETukmhEDzbdQbM9+tbFDrJeZWRB
 dH6A==
X-Gm-Message-State: AO0yUKXTry9XJYaamqojJRP3DAkrMx1Fj6BUEp95rMjFB2sA1ysAs0gx
 6weDbJjxpeetCR3dZCh2bQQqIuaNsTOAZF1t7LMIpQ==
X-Google-Smtp-Source: AK7set89Q8f0tQCO7L8KnaMx/wvZRhD+1hX2+UqTaA/zM5rpfc4hs3mWJFiXRzdMH89qrFWpxwQdAGtysgolmdggWuQ=
X-Received: by 2002:a5d:6a8b:0:b0:2bf:cd55:c9e with SMTP id
 s11-20020a5d6a8b000000b002bfcd550c9emr355968wru.674.1675087520430; Mon, 30
 Jan 2023 06:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-3-christoph.muellner@vrull.eu>
 <8a81e02c-5bb7-a82b-be16-e93362169a44@linaro.org>
In-Reply-To: <8a81e02c-5bb7-a82b-be16-e93362169a44@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 30 Jan 2023 15:05:08 +0100
Message-ID: <CAEg0e7hhMuXDqmUFZ87SYwHQ3otM0KgW-A3XYNWymiKTSh3o+g@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] RISC-V: Adding XTheadSync ISA extension
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
Content-Type: multipart/alternative; boundary="0000000000009f9df405f37bb43e"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42e.google.com
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

--0000000000009f9df405f37bb43e
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 9:21 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/24/23 09:59, Christoph Muellner wrote:
> > +static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas
> *a)
> > +{
> > +    (void) a;
> > +    REQUIRE_XTHEADSYNC(ctx);
> > +
> > +#ifndef CONFIG_USER_ONLY
> > +    REQUIRE_PRIV_MS(ctx);
> > +    decode_save_opc(ctx);
> > +    gen_helper_tlb_flush_all(cpu_env);
>
> Why are you using decode_save_opc() when helper_tlb_flush_all() cannot
> raise an exception?
>

No particular reason.
Will be dropped.

Thanks,
Christoph


>
>
> r~
>

--0000000000009f9df405f37bb43e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 9:21 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 1/24/23 09:59, Christoph Muellner wrote:<br>
&gt; +static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vma=
s *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 (void) a;<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_XTHEADSYNC(ctx);<br>
&gt; +<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_PRIV_MS(ctx);<br>
&gt; +=C2=A0 =C2=A0 decode_save_opc(ctx);<br>
&gt; +=C2=A0 =C2=A0 gen_helper_tlb_flush_all(cpu_env);<br>
<br>
Why are you using decode_save_opc() when helper_tlb_flush_all() cannot rais=
e an exception?<br></blockquote><div><br></div><div>No particular reason.</=
div><div>Will be dropped.</div><div><br></div><div>Thanks,</div><div>Christ=
oph</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000009f9df405f37bb43e--

