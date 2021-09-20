Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9F4120B8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:58:07 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNYM-0005wo-R3
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSNQz-0002PX-1Q
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:50:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSNQx-0000Jq-BF
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:50:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x6so32034142wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5D9/hUbpfe3lho7FRbFeFDvVKgG5nQoCZQRHdvl9JcE=;
 b=vEJKU0r04sA7tfz8TL+7C4afPyd8F5wV1iAkudSsJAWoGJpozlrxSyFwxRdrSAs7Cn
 /Auna+I0wxwIK3UcOKiqxrHbksgTArg01YqALNpPsTi6oHXlNilrqLdj+iXJGmGQJfbd
 dhIbdkpGZo1sA+2dvGzAP8jDdk6Zef5c1zR8r1HbYqSBogtkN8gc5Oetna+RhJtNNA6V
 khrCsgi12p2Mp9S5V8eDZEpOVIAVz24GiyO4sINw308wXPAZtKE8Te/rbaDysNJME3zl
 4Ii7lD5UeeNHCywEk6UTJki1DHGZyGvnXgeY9JZZ+5hxbyj6cRzhPFLDcrkyc3pir8+G
 p0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5D9/hUbpfe3lho7FRbFeFDvVKgG5nQoCZQRHdvl9JcE=;
 b=xYmnbmnOHpLmIumKptbvHilSp5n8THluvMzTH2eO/Ow7krtM0V+WwXpw/aj7wxyNyn
 Nq3poumOXJ3xbZfVP8ptdFaybSI4g4/TUkZdWU2kSI4mksVXGb3LrYBMHAjNp1Z6Y6vA
 zVguMrUGWP8tQ/PK+EJ7uv987NHDSpL0T04Vdlh8zLvpg1ag/oa+53/JBvA5nXaGCmK6
 DpBowkmJrkKUBg2joP+iErm58jh77Tqp96WNlY5S03B9FKVJ/4W0TaaB1lSBKc/hibcO
 pQ921EiDpOcCMTMOeCFsjjCNx+fWMpAgycJJfDsNzOeDXih/KKJcDmGhEz9wTVBuEZLs
 vPHQ==
X-Gm-Message-State: AOAM533osoxrb/Ax0O6RwxoD6Un/llCDdAnp/vPlRhIZiNgLbV9jnJVQ
 hOoEtlVGjXJoWgXzS7eh3T1fT4eT2vRLpVNkjwh4uRbFaQI=
X-Google-Smtp-Source: ABdhPJzB88DRf4W0iTYeQWNqhuve2SFSe1olU1YvMTIsf8Lrp8ShwbxWHft7XY7y0BcqeG6dsjHCrV/b7w7RyoEjYwI=
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr21457343wri.288.1632160225344; 
 Mon, 20 Sep 2021 10:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
 <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
 <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
 <CAFPHj6OWBhBg_SfXQ0MbjJ-Lfg3-=6=sLeY9zTaVU=LAMdSmBA@mail.gmail.com>
 <CAFEAcA-Fi4ZVdXMv-HZ5EPMGpj_fH2VmY+ZFeKKXvVYp4OkP0A@mail.gmail.com>
 <CAFPHj6PhOxcXjxHnW33iO2z+Z72LyFOeg5Z5uDBCTM-RVz7Q6A@mail.gmail.com>
 <CAFEAcA_JU9C4-9y=V4p4rokdS6=y9CH1bF5pcCg+VO8mbPeQ9w@mail.gmail.com>
In-Reply-To: <CAFEAcA_JU9C4-9y=V4p4rokdS6=y9CH1bF5pcCg+VO8mbPeQ9w@mail.gmail.com>
From: Kevin Townsend <kevin.townsend@linaro.org>
Date: Mon, 20 Sep 2021 19:50:14 +0200
Message-ID: <CAFPHj6O2n9Gd==8E4N-4Hc3Bbu7XZSXYF5+yiEaxyXiOhVyp1A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000072d54c05cc70eaa0"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000072d54c05cc70eaa0
Content-Type: text/plain; charset="UTF-8"

HI Peter,

On Mon, 20 Sept 2021 at 19:20, Peter Maydell <peter.maydell@linaro.org>
wrote:

> > Is 0.001 uT OK to use as a starting point? I think that's enough for most
> > sensors I'm aware of.
>
> The thing is that the starting point is also the finishing point:
> once we have released something that uses a particular set of
> units, we can't change it in future without breaking backwards
> compatibility. So we need to get it right now.
>
>
I think 1000 = 1 uT is an appropriate value. In theory we could also just
indicate nT, but that's just a weird unit and everyone thinks in either
gauss or uT with magnetometers.

1000000 = 1 uT just feels excessive and outside a sensible
range for any sensors I'm aware of.

That this matches temp sensors is an added bonus.

Kevin

--00000000000072d54c05cc70eaa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Peter,<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Sept 2021 at 19:20, Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">&gt; Is 0.001 uT OK to use as a starting point? I think that&#39;s enough=
 for most<br>
&gt; sensors I&#39;m aware of.<br>
<br>
The thing is that the starting point is also the finishing point:<br>
once we have released something that uses a particular set of<br>
units, we can&#39;t change it in future without breaking backwards<br>
compatibility. So we need to get it right now.<br>
<br></blockquote><div><br></div><div>I think 1000 =3D 1 uT is an appropriat=
e value. In theory we could also just</div><div>indicate nT, but that&#39;s=
 just a weird unit and everyone thinks in either</div><div>gauss or uT with=
 magnetometers.</div><div><br></div><div>1000000 =3D 1 uT just feels excess=
ive and outside a sensible</div><div>range for any sensors I&#39;m aware of=
.</div><div><br></div><div>That this matches temp sensors is an added bonus=
.<br></div><div><br></div><div>Kevin<br></div></div></div>

--00000000000072d54c05cc70eaa0--

