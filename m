Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F14DCEC7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 20:22:51 +0100 (CET)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvhy-0008Pe-Qp
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 15:22:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUvh5-0007Hr-Nh; Thu, 17 Mar 2022 15:21:55 -0400
Received: from [2607:f8b0:4864:20::12e] (port=33329
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUvh2-0006O8-5E; Thu, 17 Mar 2022 15:21:55 -0400
Received: by mail-il1-x12e.google.com with SMTP id r2so4470947ilh.0;
 Thu, 17 Mar 2022 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Z8myTSmLap9Lja6utZAAENjGr9eXUq3wUbFpUXg5PY=;
 b=Aui8j1jsIF4OObxlAa+PMqlqNruGJjukLAkNIkmuQ9w43e2lrb6piQGsO/ZH4cqbk6
 nPhTtQU5XXegHMQEBZiQfYf2sObnpaNWZgfogxeBfcHwiMpusGccdlR4fz93ur7+7rXv
 Tr9RZo6ic3SR13kZubNC6q7oTf8tQPepih/72DNX3rXgQnZ/kngtS79k7D1SdHV61+UN
 aHuCxBtCHxk8YyvLpX0eX+Fj2a9PeCjzAhC16gSkGDLSjbfvUwHjDf1MfAdo7HiAZqUL
 C+X0zqUio5RicQ+2A4gLmRu0Cm/Q93P9ZJhD15vd8Ubxi9PrHXIR+pnQOACOTfQrnrKX
 Cp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Z8myTSmLap9Lja6utZAAENjGr9eXUq3wUbFpUXg5PY=;
 b=76ZZ1Jvz0JfDB6zd/FLe7XVE54vz4CeRUEDPjsai/Pe4a8iqe8En8AzD44g+raCwr3
 TDaDH+OA/QxWbGPCkRVNO+Qy0pEDHU6WjuqYHyRM0MkQ0lu9/BDLlpWVLunT6XSi6Cp9
 E8C4ypK0X5W8Pk8SqWeuW0KVS7UfY92DI9YZqMaiPynsy8uJLItCYqr/CCDcHJOH2ONv
 wJMa2nQl6GeGKExazGglX/qOQGtTCZmF7nVvEDMtT+os87Hy54DW54UftCDk13cK6Nao
 41Wf/xkhvZh3oCqChiQYXieAHeCK1WTT0FsNDyirAg0YJk8Hn+6DLuJHc9kE6JtxQ4yY
 +fpA==
X-Gm-Message-State: AOAM533PVqPVbsEIhhQUbPzBLwUverzN8ABq4t0UjdtM1LuaSD5bSTYS
 Cza0KtNkva7iMi5Lyy1E696QE3S2ytZwmy3QD8U=
X-Google-Smtp-Source: ABdhPJz7YuDG9Jl3J+D6fH+izGGUMLIeoEExrYA5B6VgMbleFQSmKHSByD8FZ7JqIMimK/e59Ze5n4iuDR787/GF6xc=
X-Received: by 2002:a92:c522:0:b0:2c6:3ddf:1b75 with SMTP id
 m2-20020a92c522000000b002c63ddf1b75mr2757102ili.293.1647544909871; Thu, 17
 Mar 2022 12:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
 <CAFEAcA9EYK7gS4bDToAXXD23uzhEazVeP--UGOrOX4wF3P-Fug@mail.gmail.com>
In-Reply-To: <CAFEAcA9EYK7gS4bDToAXXD23uzhEazVeP--UGOrOX4wF3P-Fug@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 17 Mar 2022 20:21:39 +0100
Message-ID: <CAJy5ezopSM=N+rdmPs=PTerJFju5286eBRy7qMNwSOB2ftU9_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: zynqmp: Add CRF and APU control to support
 PSCI
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001abf7605da6ef1a4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: luc@lmichel.fr, edgar.iglesias@amd.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 francisco iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001abf7605da6ef1a4
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 8:15 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 16 Mar 2022 at 16:46, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > This adds the necessary modeling to support some of our firmware
> > tests at EL3 implementing PSCI (TBM). These are the test-cases
> > that were previously relying on QEMU's builtin PSCI emulation.
>
> I wouldn't usually take patches new devices after softfreeze, but
> on the other hand this is addressing a regression, and it only
> affects the xilinx boards. Do you have a view on whether we should put
> this into 7.0 or defer to 7.1 ?
>
>
Hi Peter,

I'd lean slightly towards 7.0 (to allow our tests to pass cleanly on 7.0)
but it's not of huge importance.

Thanks,
Edgar

--0000000000001abf7605da6ef1a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 17, 2022 at 8:15 PM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Wed, 16 Mar 2022 at 16:46, Edgar E. Iglesia=
s<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.igl=
esias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@xilinx.com" target=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;<br>
&gt;<br>
&gt; This adds the necessary modeling to support some of our firmware<br>
&gt; tests at EL3 implementing PSCI (TBM). These are the test-cases<br>
&gt; that were previously relying on QEMU&#39;s builtin PSCI emulation.<br>
<br>
I wouldn&#39;t usually take patches new devices after softfreeze, but<br>
on the other hand this is addressing a regression, and it only<br>
affects the xilinx boards. Do you have a view on whether we should put<br>
this into 7.0 or defer to 7.1 ?<br><br></blockquote><div><br></div><div>Hi =
Peter,</div><div><br></div><div>I&#39;d lean slightly towards 7.0 (to allow=
 our tests to pass cleanly on 7.0) but it&#39;s not of huge importance.</di=
v><div><br></div><div>Thanks,</div><div>Edgar=C2=A0</div></div></div>

--0000000000001abf7605da6ef1a4--

