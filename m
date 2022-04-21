Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2250A6AC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:09:40 +0200 (CEST)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaJH-0001Kf-6a
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nhZgB-0008Vy-KY
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:29:15 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nhZg8-0000sE-JZ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:29:15 -0400
Received: by mail-qt1-x832.google.com with SMTP id f22so3632955qtp.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=myhB9v39Fx3HMVXa3izErRcQ764iEzzk1xHStiXalFY=;
 b=RmqrpA6wGye7d96lqVuEsuYBvVo9K15POMg15OLzPRPNINOa2B8Upl8Pnkdluz7UzV
 BKT0RqULxHPIEiiHRkqI/G66T/BkwMf73zC/2Brp1D8OTBOl52Ld+d9bp9DVsXhAcTDG
 O1tvhrMCTc/NZUQ3+O3Csr2tLXNEtgCF8ST05xgXwOkhASwekKcUtyvJEiFMZxW3CmIO
 qr/zUQvadZuveghbyl1kNnbyAEAgBf42FwPNgEsOHIpsSpcsMW6p+SyFGCWXD9PsFovc
 goDoapeLJ3qYtvJRyVTyE3BEJgDkKFumJy/fUtBx3IPPj11m7DBa1+LEFewLh4JznBEd
 mdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=myhB9v39Fx3HMVXa3izErRcQ764iEzzk1xHStiXalFY=;
 b=N3J4lVIuPKF1SbTA0ndd5VHQhWJndfXidQuKN5yI46RLiBuVZw3trBLHHJ50LCNwGE
 Fu/4905lrfZUU4/KT5u+Mc4y2v/qBkF637z99ophVl9ZH8mI3UqFLZzbHW91tj4aQD2c
 udjzzoezP/oOZVWt8c5hQY/9N+kSFLQe51b1eJ486Jc0lcbYoNzMIGdGfayGNmRy3ObD
 /6+YlwJuBv+wD2T7VdRGNFon9QxFyt9gzRHxjvyher9ic4vh4+PORFmFBBjlL4Wu3nvd
 UDnirIlUkoF9o5X5WwCoGhR/8uoxi7yIWsH6bP6AvciJxcbp0eAPgt24yHWZWTuCnryb
 iCew==
X-Gm-Message-State: AOAM530abvdpryiXMtJb+XONBgteL95B71xFPOi2lTRjDbC4yumAAeo7
 UHWntgnlxSMaKhtjToLjCXDbi8LIWIDe1SHMNszOLw==
X-Google-Smtp-Source: ABdhPJxnwDCPI6u1lknEVi2zBFjRzFCrmLeIotkxOPfpZYs+o/WxP8aNb5k+zaCT/s3Ng3alRiaGQFI21wNvVPzmiX8=
X-Received: by 2002:a05:622a:191:b0:2f1:ffe6:283c with SMTP id
 s17-20020a05622a019100b002f1ffe6283cmr185502qtw.557.1650558549952; Thu, 21
 Apr 2022 09:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
In-Reply-To: <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 21 Apr 2022 09:28:58 -0700
Message-ID: <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Patrick Venture <venture@google.com>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Havard Skinnemoen <hskinnemoen@google.com>, 
 IV00 Uri Trichter <Uri.Trichter@nuvoton.com>, Vishal.Soni@microsoft.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="0000000000000d58ad05dd2c9c7e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=wuhaotsh@google.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--0000000000000d58ad05dd2c9c7e
Content-Type: text/plain; charset="UTF-8"

Thanks for all the comments you gave! I'll go over and address them
recently.

For this question, The actual CPU should be cortex A35. However, I don't see
them supported in QEMU. If I inserted CPU with "cortex-a35" QEMU will
complain:
qemu-system-aarch64: missing object type 'cortex-a35-arm-cpu'

What should I do here?

On Thu, Apr 21, 2022 at 3:45 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 5 Apr 2022 at 23:37, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature
> > quad-core ARM Cortex A35 that supports both 32 bits and 64 bits
> > operations.
>
> Here and in the documentation patch you say "Cortex-A35", but the
> patch implementing the new SoC creates Cortex-A53 CPUs. Which
> is correct ?
>
> thanks
> -- PMM
>

--0000000000000d58ad05dd2c9c7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for all the comments you gave! I&#39;ll go over and=
 address them recently.<div><br></div><div>For this question, The actual CP=
U should be cortex A35. However, I don&#39;t see</div><div>them supported i=
n QEMU. If I inserted CPU with &quot;cortex-a35&quot; QEMU will complain:</=
div><div>qemu-system-aarch64: missing object type &#39;cortex-a35-arm-cpu&#=
39;<br></div><div><br></div><div>What should I do here?</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 21=
, 2022 at 3:45 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Tue, 5 Apr 2022 at 23:37, Hao Wu &lt;<a hre=
f=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature<br>
&gt; quad-core ARM Cortex A35 that supports both 32 bits and 64 bits<br>
&gt; operations.<br>
<br>
Here and in the documentation patch you say &quot;Cortex-A35&quot;, but the=
<br>
patch implementing the new SoC creates Cortex-A53 CPUs. Which<br>
is correct ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000000d58ad05dd2c9c7e--

