Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C931F1D1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:49:16 +0100 (CET)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCrAh-0002Is-2Q
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lCr8u-0001po-EG
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:47:24 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:38662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lCr8s-0002du-LX
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:47:24 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id k76so786374vka.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 13:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0GNhoZxGeW1KGoFGrM+126qT88U8JlWJhl98cIPkPzQ=;
 b=W4B1cm2UJ3p44NjT8urUVlnnp4yZG+TYF/2eQv8/Q4mnvpCnk08gbkCUIbehv22YSt
 FykE2LFPsSOyje7ThaYDujyn6y7mFjQRyuwzlrHUufOm5yeQglo7k3nJpwUM2nCgyYPe
 apuWPm2Tyn1QNwuN5vIvo3rqqHfTAYVt/aJJlHliVM+/kYLgBBQjDvMDl4/gIadBuS3T
 sF6MkwGyxg5VEI+48JMZVI/wpZAtcHLqMo12T8QyChEYtlLZQptsybQ29DC5IgOAgtwm
 Rdn5v6ZvuxkrZEXE5Jxpmc07ldFT3iNVyQcE0s+B8+xe0ESyZFoOk90ef5ApHtXn+ZbJ
 Oh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0GNhoZxGeW1KGoFGrM+126qT88U8JlWJhl98cIPkPzQ=;
 b=rM+Hg1QU1fWO5wmmtm85tmewoLdy4Hh70kyR9CyHbCUz8V8eeGqTz2D1bhnWDzgYSC
 /OgJnVmB6+n8C/v2siO3cuvGz/1Y8qYpx9l5jVBqd15W7YZ37CjlsInpydpbQM75KCPc
 2e+138J2idmlj4A0YNSVy87Yr5m9IBB944VkgFJeY4rxweSdix0ZFID4RRRXH9jw62YS
 9hAtnG1QpbzjJc3Xkh6JrybQJCfN5GeH22Gj8mmjaFaLEFP1xUQhnuk7drfm/qrpLV01
 LwiK76WBKtNB4n70+pHnx6BQMR8KJmWcPd6fQ67i/n7avT08IQkAnLvZLCPKSeUNH257
 UuXQ==
X-Gm-Message-State: AOAM533bttMmwTPftLU8JTwklrljOOAL7YG40R2wd2PNuwT5vEXEjVrS
 79cjVepKwlkHbzPF4sPVlXTHy3BIkQhjV3z5/F8fhA==
X-Google-Smtp-Source: ABdhPJzYWqM81GwxMDhSSuUsucxAa0RuXcNhPNbhOj6dCc/aVfTQvRkkcUdtuMbpWsRTpCbyWUQTinPnMBCAGVQP33U=
X-Received: by 2002:a1f:9855:: with SMTP id a82mr4901446vke.13.1613684841199; 
 Thu, 18 Feb 2021 13:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20210213002520.1374134-1-dje@google.com>
 <CAFEAcA-5LdAO+m8enMxxUc7TczrKV407VGCt4vS5PS3jdDr2XQ@mail.gmail.com>
 <CAFEAcA_jUD6u1hn-mmmekE0nzgWSCO-uR=rWemt2dYsjcGUYUA@mail.gmail.com>
In-Reply-To: <CAFEAcA_jUD6u1hn-mmmekE0nzgWSCO-uR=rWemt2dYsjcGUYUA@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Thu, 18 Feb 2021 13:46:44 -0800
Message-ID: <CADPb22RncvjApb_DC3E00Jmx2113YjxJYSmO0CnpG4EZTfF3SQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add npcm7xx emc model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000bda2dd05bba34750"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=dje@google.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bda2dd05bba34750
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 17, 2021 at 3:01 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 16 Feb 2021 at 14:28, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Sat, 13 Feb 2021 at 00:25, Doug Evans <dje@google.com> wrote:
> > >
> > > This is a 10/100 ethernet device that has several features.
> > > Only the ones needed by the Linux driver have been implemented.
> > > See npcm7xx_emc.c for a list of unimplemented features.
> > >
> > > Doug Evans (3):
> > >   hw/net: Add npcm7xx emc model
> > >   hw/arm: Add npcm7xx emc model
> > >   tests/qtests: Add npcm7xx emc model test
> > >
> >
> >
> > Applied to target-arm.next, thanks.
>
> Dropped again: it failed some oddball config in the gitlab CI:
> https://gitlab.com/qemu-project/qemu/-/jobs/1034174731#L12
>
> -- PMM
>


Yeah, the test needs to watch for --disable-slirp.
Fixed in v5:
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg06030.html

--000000000000bda2dd05bba34750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Feb 17, 2021 at 3:01 AM Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Tue, 16 Feb 2021 at 14:28, Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 13 Feb 2021 at 00:25, Doug Evans &lt;<a href=3D"mailto:dje@goo=
gle.com" target=3D"_blank">dje@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This is a 10/100 ethernet device that has several features.<br>
&gt; &gt; Only the ones needed by the Linux driver have been implemented.<b=
r>
&gt; &gt; See npcm7xx_emc.c for a list of unimplemented features.<br>
&gt; &gt;<br>
&gt; &gt; Doug Evans (3):<br>
&gt; &gt;=C2=A0 =C2=A0hw/net: Add npcm7xx emc model<br>
&gt; &gt;=C2=A0 =C2=A0hw/arm: Add npcm7xx emc model<br>
&gt; &gt;=C2=A0 =C2=A0tests/qtests: Add npcm7xx emc model test<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; Applied to target-arm.next, thanks.<br>
<br>
Dropped again: it failed some oddball config in the gitlab CI:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/1034174731#L12" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jo=
bs/1034174731#L12</a><br>
<br>
-- PMM<br></blockquote><div><br></div><div><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Yeah, the test needs to watch for --disabl=
e-slirp.</div><div class=3D"gmail_default" style=3D"font-size:small">Fixed =
in v5: <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2021-02/=
msg06030.html">https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg=
06030.html</a></div></div></div>

--000000000000bda2dd05bba34750--

