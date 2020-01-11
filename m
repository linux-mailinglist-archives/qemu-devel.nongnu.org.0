Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CD1383B8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 22:37:59 +0100 (CET)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqOSD-0005BJ-Vu
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 16:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iqORG-0004E7-Bx
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 16:36:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iqORF-0001Sm-74
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 16:36:58 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:44979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1iqORE-0001KB-Te
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 16:36:57 -0500
Received: by mail-lj1-x235.google.com with SMTP id u71so5824611lje.11
 for <qemu-devel@nongnu.org>; Sat, 11 Jan 2020 13:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IZrbz1qPzUfOjWwGQilDQmIGnIjiqpUq7UtE+eIQXPE=;
 b=m9SU25/QVqp+ZZdcRqxN4lmO6zxay5mBAwywRdyF8yEbIAaL6m9ThN/f8913dIJ1zB
 w+SvhTKNnadvMeFumhFPbVQPnCP4tayIzusx91HbP2fnHxCUEMg+lN3jsYc0uMPFG3rB
 IZTy91RKky9xTgXCYdavcIK2tYiwqQ4qOcLkQjTu7vP5dCeIRokFvSHQtnbsmxhLKL3B
 VzcLFntAlIDK8a2P5GDh2PXjkvFtEk/3OnsTdo+d61nrEuT9TuxNaVRdn+PKPS0nwpX1
 xucRlaY78vy3pGLg8WzzmriO0kdXGMII7pox0bSE6FiBYILqfEOde2a2VZCXp73Iz4YP
 nzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZrbz1qPzUfOjWwGQilDQmIGnIjiqpUq7UtE+eIQXPE=;
 b=UIzr8ejsi0qTh25ZtJg8MpqX9dDUT6PtKM3aZO/1HwKo5g6HDb3abGwcD+TxODqdUt
 +QWDGR8IeZd5++WqdnpsUnSj1LGXKU0knf5W6Zt+2ZbVcosuMo7GKJ5hnDfBS1GfaiMH
 LtRpPp2VaTS6QIu5dK0uKmnXeoPCdS+ywJvnrC4yVBo9MlY6YvL6yPmpIFdXA/0WP983
 A+5r0yC/aPT9N5vKQm0gJ49TAQ3SMPkeow8Y1zk7/U2eByz1jCeGLxf06IYTNdj1wCvG
 89rxUJoP/3dMXWJkwqjtRgGI1pyH67xXTZyyw/9hdCUrfYsk9sI93ubF9I3ovQanFu/X
 yhzw==
X-Gm-Message-State: APjAAAXGVHeXCzmr99JmkeLNkcNB+y/lnA2p/RytKrLGIfBXUTXRpkFP
 UyP/7fgra7chxL5ugjIGrkKhh0CRED8NnMXgXQM=
X-Google-Smtp-Source: APXvYqxtyuTb5Ki4jNJFNG+lUkAbGoMgU+FRqsNoyt/8O2HQYLKOckrLnYK+1p/z5nykIVnKRPDdHIuCSypd2YA3I7A=
X-Received: by 2002:a2e:943:: with SMTP id 64mr6554376ljj.17.1578778615196;
 Sat, 11 Jan 2020 13:36:55 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-dz7f_12QU1_YSkfuKKEk9YYcq8jwLRu90Z85UZ+YKRQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-dz7f_12QU1_YSkfuKKEk9YYcq8jwLRu90Z85UZ+YKRQ@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sat, 11 Jan 2020 14:36:44 -0700
Message-ID: <CAJy5ezpLwSMFzzt-wBUak89RJWQYC-4yyKrADsp6y6Q6oSRsvA@mail.gmail.com>
Subject: Re: xlnx-zynqmp doesn't set psci-conduit on the R-cores
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000089b1af059be40ab5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::235
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000089b1af059be40ab5
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan. 2020, 08:42 Peter Maydell, <peter.maydell@linaro.org> wrote:

> Hi; somebody pointed out to me that hw/arm/xlnx-zynqmp.c only
> sets the psci-conduit on the A-profile cores, not the R. This
> means you can't set the boot-cpu to an R-profile core and
> use PSCI to wake up the other one. Is the omission deliberate?
>
> thanks
> -- PMM
>


Hi,

I don't think this was given much thought.

AFAIK, we don't have any r5 software that implements PSCI (should that be
done over svc? Hmm not sure if that's possible). The ATF port that runs on
the a53s only handles the A cores IIRC.

I'll need to double check but in our sw stack the R5s are controlled via
EEMI, a SoC specific smc interface that runs on the PMU (MicroBlaze).

Do you know how other SoCs with heterogeneous cores handle this?

Best regards,
Edgar

--00000000000089b1af059be40ab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 10 Jan. 2020, 08:42 Peter Maydell, &lt;<a href=
=3D"mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi; somebody pointed out to me that hw/arm/xlnx-zynqmp.c only<br>
sets the psci-conduit on the A-profile cores, not the R. This<br>
means you can&#39;t set the boot-cpu to an R-profile core and<br>
use PSCI to wake up the other one. Is the omission deliberate?<br>
<br>
thanks<br>
-- PMM<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Hi,=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I don&#39;t think this was given much thought.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">AFAIK, we don&#39;t have any r5 =
software that implements PSCI (should that be done over svc? Hmm not sure i=
f that&#39;s possible). The ATF port that runs on the a53s only handles the=
 A cores IIRC.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll =
need to double check but in our sw stack the R5s are controlled via EEMI, a=
 SoC specific smc interface that runs on the PMU (MicroBlaze).</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Do you know how other SoCs with hete=
rogeneous cores handle this?=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Best regards,</div><div dir=3D"auto">Edgar=C2=A0</div></div>

--00000000000089b1af059be40ab5--

