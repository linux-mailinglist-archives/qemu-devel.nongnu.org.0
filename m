Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C1562A17E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:43:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov0tJ-0007JA-0K; Tue, 15 Nov 2022 13:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov0t3-0007GW-OM
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:42:22 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov0t2-00072H-6b
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:42:21 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id i131so18056728ybc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 10:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+hSR0bM1Pravt+2PsYJO7qb6UIfJzDy3Se4I3jBqR/c=;
 b=Ri4N5ShPRoJLlW2GbukjpCAZcuGdwrlNR5Mnwh4iQ5pio6SP7OyjXqrAaaoRRH+oUz
 /wot0XWE0nB6TnoOz9X+qOnipBdJBjxiz5MLsrmmvJHZEKxgzgoohiFEpGhbsSWXKJPM
 DsfCw8Dyq9XmlUVMeNO5OOHmPPSMNPPUIcpr7ax8l41zgdgME6nfv8lgbNfF9EAbchxI
 gEI0ZWa+GgfSsWTpIxRYGFVDM7pSZUrsARItAkwxpG/3LaqQvmQ7aK/8vkyRJ+ghpA2H
 ep6BNlZ+RF1kEorjlIlBF0st2vXfkh1lIKzKF038KjO5ot8u5aBv5kbF1JHLOewsp6v6
 l41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+hSR0bM1Pravt+2PsYJO7qb6UIfJzDy3Se4I3jBqR/c=;
 b=7+bNpXxF29EeE1O0K/MsyMRomjmw+DHoQGpcIl6w5TIYGcsAPw48re9sjIrZsGNmbT
 ZuKYLbhSmKn6S03OK1pOU35nL3giZaeDL521FSiNXodzVu+xS/KQ8wK+2pJ/yacZ4FJr
 hE4H/YSPEnjXA8oLaQbhRgwIpT2g2zBFuj/VXHWv3bPhcW5tmUdXcRlXyeeuY2jFGSv3
 Z3ZavauHVABK/+Y0w/3NtwpnrA1CQoR/40gIEaL+GAZ+4Pvfg119Rx6owGf+8LThri65
 zqCiIvk6GiIGyXzqdIdbwmdaaf2br5hUf9UKgBG108lb3CWk6Mm5EPNwyRbcH5rDLSdw
 yL0w==
X-Gm-Message-State: ANoB5plubSe0Zw3r43Qy3OKIKqUlBc+RPhQUWlgvPrFlWZFhags6wik4
 RDVmPUVzujxka2F31RO04/wyAIk8D1KZAoc4kYQ=
X-Google-Smtp-Source: AA0mqf7cqYswwP9FfkykKxFIAo4+J/JTMITIsLkWekxhzdKz8FzQJ7+cFfmZG39xsZcmGbq9pFbeHNJeDjPJh0yeQlc=
X-Received: by 2002:a25:664a:0:b0:6d7:5e6f:2a46 with SMTP id
 z10-20020a25664a000000b006d75e6f2a46mr19159122ybm.118.1668537739094; Tue, 15
 Nov 2022 10:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20221111005214.22764-1-tsimpson@quicinc.com>
 <CAJSP0QXYdLGuX=dRUw2y4qn04K-SCn0eWjWfC2T+gnsq2_+OKQ@mail.gmail.com>
 <SN4PR0201MB8808E53696703AA2AA339763DE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <CAJSP0QVh0ynmSa5W2FSSR5T+8FRGmnC3kX-1o78qLXoiXn6O0A@mail.gmail.com>
 <SN4PR0201MB8808C57A38E108ECA717F17FDE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808C57A38E108ECA717F17FDE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 15 Nov 2022 13:42:05 -0500
Message-ID: <CAJSP0QU8MSoZnL2Zjo7xUHfcTG52w+ciipG2W5x1jt_87avM_A@mail.gmail.com>
Subject: Re: [PULL 00/11] Hexagon bug fixes and performance improvement
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>, 
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003badc005ed86b71d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000003badc005ed86b71d
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 15, 2022, 12:44 Taylor Simpson <tsimpson@quicinc.com> wrote:

>
>
> > -----Original Message-----
> > From: Stefan Hajnoczi <stefanha@gmail.com>
> > Sent: Tuesday, November 15, 2022 10:52 AM
> > To: Taylor Simpson <tsimpson@quicinc.com>
> > Cc: qemu-devel@nongnu.org; richard.henderson@linaro.org;
> > philmd@linaro.org; peter.maydell@linaro.org; Brian Cain
> > <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> > <quic_mathbern@quicinc.com>; stefanha@redhat.com
> > Subject: Re: [PULL 00/11] Hexagon bug fixes and performance improvement
> >
> > On Tue, 15 Nov 2022 at 11:16, Taylor Simpson <tsimpson@quicinc.com>
> > wrote:
> > >
> > > OK.  I wasn't sure if performance improvements would be considered new
> > features or not.
> >
> > No problem! If there is a performance regression in the upcoming release,
> > then fixes will be accepted. For example, if QEMU 7.1 was fast but the
> > upcoming QEMU 7.2 release is going to be slow then a performance fix will
> > be accepted to avoid a regression in 7.2.
> >
> > On the other hand, if it's a fix for something that was already slow in
> the last
> > release (7.1), then it's less likely to be accepted during freeze.
>
> The performance improvements fall into this bucket.
>
> >
> > These are general guidelines and maintainers have a say in what gets
> > merged. In this case I looked at the pull request and I wasn't sure if
> you had
> > decided based on these guidelines or not. It helps when it's clear from
> the
> > commit message (or from the commit description in more involved cases)
> > that the commit fixes a bug or has some other justification.
>
> I'm the maintainer for the directories touched by these patches
> (target/hexagon and tests/tcg/hexagon), but I'll defer you as a more senior
> maintainer to decide not to merge if it is too risky at this stage.
>

Thanks!

Stefan


> Taylor
>
>
>

--0000000000003badc005ed86b71d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Nov 15, 2022, 12:44 Taylor Simpson &lt;<a href=
=3D"mailto:tsimpson@quicinc.com">tsimpson@quicinc.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">stefanha@gmail.com</a>&gt;<br>
&gt; Sent: Tuesday, November 15, 2022 10:52 AM<br>
&gt; To: Taylor Simpson &lt;<a href=3D"mailto:tsimpson@quicinc.com" target=
=3D"_blank" rel=3D"noreferrer">tsimpson@quicinc.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"=
noreferrer">qemu-devel@nongnu.org</a>; <a href=3D"mailto:richard.henderson@=
linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.o=
rg</a>;<br>
&gt; <a href=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=3D"noreferr=
er">philmd@linaro.org</a>; <a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>; Brian Cain<b=
r>
&gt; &lt;<a href=3D"mailto:bcain@quicinc.com" target=3D"_blank" rel=3D"nore=
ferrer">bcain@quicinc.com</a>&gt;; Matheus Bernardino (QUIC)<br>
&gt; &lt;<a href=3D"mailto:quic_mathbern@quicinc.com" target=3D"_blank" rel=
=3D"noreferrer">quic_mathbern@quicinc.com</a>&gt;; <a href=3D"mailto:stefan=
ha@redhat.com" target=3D"_blank" rel=3D"noreferrer">stefanha@redhat.com</a>=
<br>
&gt; Subject: Re: [PULL 00/11] Hexagon bug fixes and performance improvemen=
t<br>
&gt; <br>
&gt; On Tue, 15 Nov 2022 at 11:16, Taylor Simpson &lt;<a href=3D"mailto:tsi=
mpson@quicinc.com" target=3D"_blank" rel=3D"noreferrer">tsimpson@quicinc.co=
m</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; OK.=C2=A0 I wasn&#39;t sure if performance improvements would be =
considered new<br>
&gt; features or not.<br>
&gt; <br>
&gt; No problem! If there is a performance regression in the upcoming relea=
se,<br>
&gt; then fixes will be accepted. For example, if QEMU 7.1 was fast but the=
<br>
&gt; upcoming QEMU 7.2 release is going to be slow then a performance fix w=
ill<br>
&gt; be accepted to avoid a regression in 7.2.<br>
&gt; <br>
&gt; On the other hand, if it&#39;s a fix for something that was already sl=
ow in the last<br>
&gt; release (7.1), then it&#39;s less likely to be accepted during freeze.=
<br>
<br>
The performance improvements fall into this bucket.<br>
<br>
&gt; <br>
&gt; These are general guidelines and maintainers have a say in what gets<b=
r>
&gt; merged. In this case I looked at the pull request and I wasn&#39;t sur=
e if you had<br>
&gt; decided based on these guidelines or not. It helps when it&#39;s clear=
 from the<br>
&gt; commit message (or from the commit description in more involved cases)=
<br>
&gt; that the commit fixes a bug or has some other justification.<br>
<br>
I&#39;m the maintainer for the directories touched by these patches (target=
/hexagon and tests/tcg/hexagon), but I&#39;ll defer you as a more senior ma=
intainer to decide not to merge if it is too risky at this stage.<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks!=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Taylor<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000003badc005ed86b71d--

