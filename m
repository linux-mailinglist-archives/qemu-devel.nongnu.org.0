Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97A391E88
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:59:32 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxoS-000251-3n
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llxOs-00009z-RX; Wed, 26 May 2021 13:33:03 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llxOo-0001OB-FX; Wed, 26 May 2021 13:32:58 -0400
Received: by mail-oi1-x235.google.com with SMTP id b25so2306647oic.0;
 Wed, 26 May 2021 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHDjWt30kfTo7P1kTFosF2FYBb6vy0T0nTwkFqadCB4=;
 b=Jp2dEGrSNiQittVBMJs8fuZcufSgLqhcq+/OfxcFjogovBvNwDNOB3V+XTrhc1vkmt
 jXwJot96YWXSmV+xlEvePk1M/0hxuHaaEBepVfFZxy//5vqKpktSzb7rKvT7qo2IxQ5H
 enYlIAuuNnkoOAyKhrIlrILUd7KSZKLZBJsDQ3DbOTqzpWbUbqxaekm34mIKec0yJert
 q1AiyW6aILrmWDctFM4ZSiCDSnPCf+xHRLn8KUb7qAw8Exrys/b5VtQoytKbFz/cU+0S
 eYGdwagH2CsQmIYnCQJn18FNG4EqAJwBjxM9H0d1+k2BqyvmegbsFdtcAA5QgTqNG+sn
 taRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHDjWt30kfTo7P1kTFosF2FYBb6vy0T0nTwkFqadCB4=;
 b=lVFIJyaL/cN1tASwr5sShsVUPfe38ODyz2e0EWx/EFFK/8kH7YH2Aq8mz10sRZ5iWg
 2XIVolQwEEJ4YyRYnaAlGI4mBCgZNbJtmr2+XZ6bD46/hh1+5jQ6nCMuERbN8/1Zp4zh
 zLWrX82ILJSgeqXHkhLwFQPkgJ2tSAbg0foqAA7Op0Kr/WTTO8mr4RDN0d57LQZqidfU
 9S8j8uGDUzSPWjEMiB6ITt+HniGUiVtdMkL8SyTyCtZgdWU/Rd5yDE4svyZg5R184JcC
 CBUuX6fMT4kYywRfzX5A+Gx/C0i14uh2g2GM9TaZfMpsOdR49l4jdzPZOXqdQGovUN3L
 owsg==
X-Gm-Message-State: AOAM530IrMpWh/GU/dNScUX2YIpEmIcSL/e3ey+S3z4/FDJ3kmnpqD4b
 MwHYyas74dKugobbxx2vGSWnlvk26YId8vG9JpE=
X-Google-Smtp-Source: ABdhPJzKRsJR/mbMGkiCtopfOQf9W/gqe95X0l7q2y4f1K8w4LpmcIi9jeONDTc2WEgyXi/2sprZ+mDG3bndMbm08cM=
X-Received: by 2002:aca:2417:: with SMTP id n23mr2682344oic.111.1622050366786; 
 Wed, 26 May 2021 10:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
In-Reply-To: <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Wed, 26 May 2021 10:32:36 -0700
Message-ID: <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000eb8f7d05c33f07f7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=swethajoshi139@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eb8f7d05c33f07f7
Content-Type: text/plain; charset="UTF-8"

Hello,

One of the qemu machines we use has KVM enabled, but we don't want the
CONFIG_ARM_VIRT enabled as it pulls in emulation of a variety of physical
hardware that we don't need. The compilation errors I mentioned are not in
the qemu mainline per say but we see them in one of the qemu derived
machines we use.

Thanks,
Swetha.

On Tue, May 25, 2021 at 10:16 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 25 May 2021 at 17:28, Swetha Joshi <swethajoshi139@gmail.com>
> wrote:
> >
> > Hey Peter, Phil,
> >
> > Yeah like Peter mentioned, when KVM is enabled and we don't want VIRT
> enabled, there are a couple of routines that are being called from virt.h
> and ghes.h, which is resulting in errors. I came up with this simple fix
> but if you think there is a better solution to it I'll let you/ other
> developers who own it decide and fix it because I don't have much
> experience or visibility into what happens internally, my knowledge is
> restricted to just using the configs.
>
> Well, QEMU builds fine for me as-is, because the default config
> always enables the virt board. Do you have repro instructions for
> reproducing the build failure ?
>
> thanks
> -- PMM
>


-- 
Regards

Swetha Joshi.

--000000000000eb8f7d05c33f07f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>One of the qemu machines we use =
has KVM enabled, but we don&#39;t want the CONFIG_ARM_VIRT enabled as it pu=
lls in emulation of a variety of physical hardware that we don&#39;t need. =
The compilation errors I mentioned are not in the qemu mainline per say but=
 we see them in one of the qemu derived machines we use.=C2=A0<div><br></di=
v><div>Thanks,</div><div>Swetha.</div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 25, 2021 at 10:16 A=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 25 May 2021 at 17:28, Swetha Joshi &lt;<a href=3D"mail=
to:swethajoshi139@gmail.com" target=3D"_blank">swethajoshi139@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Hey Peter, Phil,<br>
&gt;<br>
&gt; Yeah like Peter mentioned, when KVM is enabled and we don&#39;t want V=
IRT enabled, there are a couple of routines that are being called from virt=
.h and ghes.h, which is resulting in errors. I came up with this simple fix=
 but if you think there is a better solution to it I&#39;ll let you/ other =
developers who own it decide and fix it because I don&#39;t have much exper=
ience or visibility into what happens internally, my knowledge is restricte=
d to just using the configs.<br>
<br>
Well, QEMU builds fine for me as-is, because the default config<br>
always enables the virt board. Do you have repro instructions for<br>
reproducing the build failure ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><div>Swet=
ha Joshi.</div></div></div>

--000000000000eb8f7d05c33f07f7--

