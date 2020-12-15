Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80F2DB253
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:15:55 +0100 (CET)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDvV-0002jU-BJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpDtu-00023p-H1
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:14:14 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpDtt-0003p4-1F
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:14:14 -0500
Received: by mail-lf1-x142.google.com with SMTP id o17so38380309lfg.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwb33KDVUeuxveR0XnLxUJImmBOS1vIqA9nH4lvQrSc=;
 b=vQ/t2Vb4oR5liQ/356OFh7mHEPmTHn6pKRy2FGO9pLe27zfMY/thKpS9d10JdiiZef
 yVa9WF/WvDt1NHFF3Iu7yC1arpWp4JEmax7vzvVMs1TtUMQzgwFlF/0YfgmXYeFFoyQL
 xn58VXn908ooRkIyNHlsMqGQGIw/gx9UZNA/fbhPUctupwP2W3RPt26qucfmlLftPwv/
 WeDUa7Dz2vI6ELyOkwvtmL9aRHCkeIF/vVkeu3+wCbrsW8fwk1J0jpIapKKFrtVCrbin
 HmaVBImgKWaaU0QTc8V1oJZJsyG593OMRal0eNrf+AolKPhn+oxtZnoFQWKI1kHE6OY9
 OiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwb33KDVUeuxveR0XnLxUJImmBOS1vIqA9nH4lvQrSc=;
 b=Z9su76TWbN/1HuHWqmcRxijhHDvdkGRQzLfYo53UZx2YqSR3kSiMV9/F85cI5PwRsL
 L9Za+sseORahx88TuyhkCNezU6zW+ILDPSC/A5SErLN6V76G/lMvd3Re92JWR7pqDOHo
 V2wPZrkmKVQe2y3bO7mRmkAiKshDKFZLcaZHiu7mWHz1J7weSQOjy+a4tn4LrmsoRHQQ
 XUehYRIyzGtyQKLY7kI1jEhIUt6PxRzYA2RMCsrnbQOsBoEXQ9Ax0FFlOFUX+Ew2+EUx
 i9X2/jTUeU8NCRH5MCMCior9qyaZUMfkZdoxCyfxoikI5SVozofW1KBM/jLfMzp6Chcy
 wRXw==
X-Gm-Message-State: AOAM53033/wEjQl11iDI2HsScuWFzSc2AXrlZ2LRO4MX49B6RY37xHfe
 UqbCYnnT2pMQr25g6rNPsFQMqJoQ08gDd6OtIGrCuw==
X-Google-Smtp-Source: ABdhPJwTbVHDM9X+sNJUZ2m9kJUkFElBjd37iaCpH8CEsiPuQZpyWl5Kvu6p1ANb1/TQx/54FGBRUL51TfaEDRRPAR4=
X-Received: by 2002:a2e:8745:: with SMTP id q5mr12453800ljj.77.1608052450274; 
 Tue, 15 Dec 2020 09:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <b356d726-4b6c-ab4b-237a-c31dd658c5b2@amsat.org>
In-Reply-To: <b356d726-4b6c-ab4b-237a-c31dd658c5b2@amsat.org>
Date: Tue, 15 Dec 2020 09:13:58 -0800
Message-ID: <CAGcCb13sgLS+kRwtXoSKrVNxyfjbH_9-BwgJfo4rS7eE-BMoUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Additional NPCM7xx devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000014b6cb05b683e341"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x142.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, minyard@acm.org,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 f4bug@armsat.org, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--00000000000014b6cb05b683e341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip! I'll use that in the future.

Best,

Hao

On Tue, Dec 15, 2020 at 7:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 12/15/20 1:13 AM, Hao Wu via wrote:
> > This patch series include a few more NPCM7XX devices including
> >
> > - Analog Digital Converter (ADC)
> > - Pulse Width Modulation (PWM)
> >
> > We also modified the CLK module to generate clock values using
> qdev_clock.
> > These clocks are used to determine various clocks in NPCM7XX devices.
> >
> > Thank you for your review.
>
> The list is still rewriting your author ident.
>
> Maybe try 'git-format-patch --from' next time to force it
> on each patch?
>
> Regards,
>
> Phil.
>

--00000000000014b6cb05b683e341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the tip! I&#39;ll use that in the future.<br><d=
iv><br></div><div>Best,</div><div><br></div><div>Hao</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 15, 2=
020 at 7:17 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 12/15/20 1:13 AM, Hao Wu via wrote:<br>
&gt; This patch series include a few more NPCM7XX devices including<br>
&gt; <br>
&gt; - Analog Digital Converter (ADC)<br>
&gt; - Pulse Width Modulation (PWM)<br>
&gt; <br>
&gt; We also modified the CLK module to generate clock values using qdev_cl=
ock.<br>
&gt; These clocks are used to determine various clocks in NPCM7XX devices.<=
br>
&gt; <br>
&gt; Thank you for your review.<br>
<br>
The list is still rewriting your author ident.<br>
<br>
Maybe try &#39;git-format-patch --from&#39; next time to force it<br>
on each patch?<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div>

--00000000000014b6cb05b683e341--

