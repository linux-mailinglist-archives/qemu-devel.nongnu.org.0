Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A11793B8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 16:39:13 +0100 (CET)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9W76-0000ka-Ts
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 10:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j9W4x-0004rr-OS
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:37:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j9W4w-0007UD-OY
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:36:59 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:34080)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1j9W4w-0007Tm-KQ
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:36:58 -0500
Received: by mail-qt1-x82b.google.com with SMTP id 59so1667455qtb.1
 for <qemu-devel@nongnu.org>; Wed, 04 Mar 2020 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trxjSXYPcti45ms1Cha0AI1B/luNHwL1RcWczvkLpcY=;
 b=I+HKpWknb+evH3XGuajRsq54ECWa/fNzHkQoNv0SMtPH584rId7jBV+jPxtnGJOYCK
 VarRhXs92yg81kGMMMjTBQ4nXl8JCLtkpSUfDmK+nwUlI+HvgKbsHKZKpueksJdNIxHA
 um7G+DIEZDDxeU/gnXaqq9QDFKY0QI1MiDwF/A6MP6NPId6l2avq8+vktAEilP+v/966
 LZkZp/VBcBL6Jn8s8jD/N+7mogXNcdzP89/kUm5V0PiHl0Tneri/hl7BTfDeAgAByHn+
 EbV2u/lWftLl4WV0+ixm3RE/9voQnKYgHyQzXKrnL9bdJJwLSTtQLaL5oIHwfHK1caJ7
 Rk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trxjSXYPcti45ms1Cha0AI1B/luNHwL1RcWczvkLpcY=;
 b=HhnodEz+sSQypp9HWaUc4UbV/Yu0yjUauP7ljejNvSE1L4ngqXxipCQEK9BIong4au
 dOYmlRt+OJ8Luuh3cxFcHM+L/G8zZWNCy2nDDiHVA/7zwtpRQMEk2F7QPzuSXsQyzmdi
 tHjLc1BO5uEBN1kewrYf2oSIURGhquFHbAEp9Wb/CYZttUAtS2rbgif3d+zubV5KQae4
 wlx5W2moeI22iWqdMOrYek9k98BrxNjtiUr/yv4FDYIciGgX3M2b01QaYguHvzhvlPqM
 V1qh6Mt8l393+tndR7AqBe14z9hLnhW8ttC7XFjcCbQslcEtFf9l/nLwiGmLDsKwrnty
 LnEQ==
X-Gm-Message-State: ANhLgQ1scLYxBlcjvuiRTvB9SbpSXR3r8Dhlt2wUr2jxH+DFzJm4QhPc
 9QYXowg15L0Zj35xzoQUbx90AELrDW81dJfnof8=
X-Google-Smtp-Source: ADFU+vustSpseFMVsML7f9h00rJf4J5QfUhMMB8SFKglPfi348NGoHzu+VvD3Be8ab4gO/ufBYcB8tMmSG2fUYBdnJc=
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr2679514qtu.213.1583336217832; 
 Wed, 04 Mar 2020 07:36:57 -0800 (PST)
MIME-Version: 1.0
References: <CAPV47zf2Bz1xNTcD_1M=hf7tyVnCYh8yLagN=r8ocgrz2GT2Hw@mail.gmail.com>
 <20200302173604.GB682016@stefanha-x1.localdomain>
 <CAPV47zdPz+Z5=bOFNGjTG8nEWgH4gb78_AE3SGU0TD_7TNmSLw@mail.gmail.com>
 <CAJSP0QXd9fhz45OdA190XizdiwYF84UzHhD7QQVdzh9293iH9A@mail.gmail.com>
 <CAPV47zdueruup1R0yCv9adLSTJTF-qmZiUotyL3G7udL732AuQ@mail.gmail.com>
 <CAJSP0QW2ooLK_0Hr52h8HYdmm2j6CunTAnhFxS3De=azMutUeA@mail.gmail.com>
 <CAPV47zc6R1fX_RrEzLQkQuRtjKK87HNtmkgnxazZGOESGERwxw@mail.gmail.com>
 <CAJSP0QUoqdRiQp6zCWpsPQ_iM4K-BgAFCDoqU4ca0dafd3-rNw@mail.gmail.com>
 <CAPV47zd19obqLMFKeOhvaD9AbThyii_QqtHSHE57YxLW7_8JEQ@mail.gmail.com>
 <CAPV47zc70CZnqqXdmZmsP0p-gLV_Ko4VKQDdSUuS-3+Kd285zQ@mail.gmail.com>
 <CAPV47zfx2_Q0i=ysjfqBB2ZwhPcbu-dd-NMJxAiMPbNUFgEcgQ@mail.gmail.com>
In-Reply-To: <CAPV47zfx2_Q0i=ysjfqBB2ZwhPcbu-dd-NMJxAiMPbNUFgEcgQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 4 Mar 2020 15:36:43 +0000
Message-ID: <CAJSP0QUA6R-TkUZq3j7EFjd=r+iPHkhQ66Cizu4b8gVhMU3iOQ@mail.gmail.com>
Subject: Re: New Hardware model emulation
To: Priyamvad Acharya <priyamvad.agnisys@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d2f02005a0093082"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::82b
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d2f02005a0093082
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020, 13:04 Priyamvad Acharya <priyamvad.agnisys@gmail.com>
wrote:

> Hello,
>
> I tried to boot linux on qemu for RISCV(32 bit) with busybear-linux image.
> When I run script containing qemu command line configuration it just hangs
> with following message shown by attached image.
>
> How to fix it?
>
> I am also attaching script for you reference
>

Unfortunately I don't have time to help further.  Maybe someone else is
willing to help.

Good luck!

Stefan

>

--000000000000d2f02005a0093082
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Mar 4, 2020, 13:04 Priyamvad Acharya &lt;<a href=3D"ma=
ilto:priyamvad.agnisys@gmail.com">priyamvad.agnisys@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hello,</div=
><div><br></div><div>I tried to boot linux on qemu for RISCV(32 bit) with b=
usybear-linux image.</div><div>When I run script containing qemu command li=
ne configuration it just hangs with following message shown by attached ima=
ge.</div><div><br></div><div>How to fix it?</div><div><br></div><div>I am a=
lso attaching script for you reference</div></div></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Unfortunately I don&#39;t hav=
e time to help further.=C2=A0 Maybe someone else is willing to help.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Good luck!</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Stefan</div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d2f02005a0093082--

