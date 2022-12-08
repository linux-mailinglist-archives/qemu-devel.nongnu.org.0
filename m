Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7564774F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 21:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3NVs-0001NN-Mn; Thu, 08 Dec 2022 15:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keith.busch@gmail.com>)
 id 1p3NVm-0001ND-0M
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 15:28:54 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <keith.busch@gmail.com>)
 id 1p3NVi-0008KB-3E
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 15:28:52 -0500
Received: by mail-lj1-x232.google.com with SMTP id f20so2815584lja.4
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 12:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6I7F55D7ZpJz9S3/AUzZkhjqJo/NSMYUtWZYDwTf5BI=;
 b=TzAIN65UogNJNFUGnO85Gt71CkJ7IARtfxu6ZaP0xDCEgGwONmZW2Vmv/N44alwPAk
 HY+sK8z2hM0QQT6/ZMJWOtCpu8BWvMKx7IIGPJbH7bBh5zINQzA0kdYDunneCGMpfTZQ
 Gwphu5o7N9NgZPBUHYyYoceNGr4X3STtJlEOzH3OhikOrxNOqme19/MwmtAoIwxvewFZ
 QUNTbGwX+R+nwp3YqUQ8gHqGgsw1jy9A3g7gTtNj1o7wX4aiAXWUhZrhv2uHCfBvCri5
 BaxtQa6Hw9kPBqUmJTV/YeV6A2osmKdSf5Brgn4+2ihYZpbA/2QZMzE6qa4uDaMwo581
 delA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6I7F55D7ZpJz9S3/AUzZkhjqJo/NSMYUtWZYDwTf5BI=;
 b=mRatatsSjmQD8XAL8gvODsrprpBWnPPeaeDj/BRn/e+Hw5BgNlMMa9w+lO8XtCH0c1
 DHsxUgW1RDhU48S7xcdhEfacwOUHYC2hIh9k8eTKXsbe0bOA+0/+BrGvzRTxNMznC1G/
 NAUF9HSfCO7YkVcLeRKQAKhb1QxskmBcTM4Jv6o23yFqg8UfiY1uzxRfX3OgC0DMFzqS
 S0UjIalK4Jm0FQ6JgT2+Nr9FQW73q6a1ZnQeYbhlZ8jOizsTCgoUM6VcWCseE0iDC1hI
 gPZ19nTCR468pJJh9GBrQUsAC2NxHmAwH3ITrpnTL1GJJJT2U6253CX5TvU4sVwMWfgM
 6zGA==
X-Gm-Message-State: ANoB5plBznffWWqB5eGS0rLMsIt112S2SkyOgP+gKyRu+Qg6REY/0V+m
 JRjxW7MOiro8LqsXiDnKI7ZuAXK7b1NZK7NJfBk=
X-Google-Smtp-Source: AA0mqf7+F2hfzIDgrHTpTU1s9aVmCxqlkxo9SsmhaFgVnhAJ9qCqYAMBKfM3eFedlTnYNzwIusZzB++ADSaL62Yrwao=
X-Received: by 2002:a2e:b701:0:b0:27a:1872:3a55 with SMTP id
 j1-20020a2eb701000000b0027a18723a55mr2176336ljo.65.1670531326499; Thu, 08 Dec
 2022 12:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local> <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net> <20221208201353.GA928427@roeck-us.net>
In-Reply-To: <20221208201353.GA928427@roeck-us.net>
From: Keith Busch <keith.busch@gmail.com>
Date: Thu, 8 Dec 2022 20:28:33 +0000
Message-ID: <CAOSXXT40pBgP-ObMwK3d_=yRmQC8AH_mXrNJhb2XqdDMr8-uzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Klaus Jensen <its@irrelevant.dk>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000004d609f05ef56e275"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=keith.busch@gmail.com; helo=mail-lj1-x232.google.com
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

--0000000000004d609f05ef56e275
Content-Type: text/plain; charset="UTF-8"

When the request times out, the kernel should be printing the command ID.
What does that say? The driver thinks the 0 is invalid, so I'm just curious
what value it's expecting.

On Thu, Dec 8, 2022, 8:13 PM Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > >
> > > A cq head doorbell mmio is skipped... And it is not the fault of the
> > > kernel. The kernel is in it's good right to skip the mmio since the cq
> > > eventidx is not properly updated.
> > >
> > > Adding that and it boots properly on riscv. But I'm perplexed as to why
> > > this didnt show up on our regularly tested platforms.
> > >
> > > Gonna try to get this in for 7.2!
> >
> > I see another problem with sparc64.
> >
> > [    5.261508] could not locate request for tag 0x0
> > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> >
> > That is seen repeatedly until the request times out. I'll test with
> > your patch to see if it resolves this problem as well, and will bisect
> > otherwise.
> >
> The second problem is unrelated to the doorbell problem.
> It is first seen in qemu v7.1. I'll try to bisect.
>
> Guenter
>

--0000000000004d609f05ef56e275
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">When the request times out, the kernel should be printing=
 the command ID. What does that say? The driver thinks the 0 is invalid, so=
 I&#39;m just curious what value it&#39;s expecting.</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022, 8:=
13 PM Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net">linux@roeck-u=
s.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Dec 08=
, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:<br>
&gt; &gt; <br>
&gt; &gt; A cq head doorbell mmio is skipped... And it is not the fault of =
the<br>
&gt; &gt; kernel. The kernel is in it&#39;s good right to skip the mmio sin=
ce the cq<br>
&gt; &gt; eventidx is not properly updated.<br>
&gt; &gt; <br>
&gt; &gt; Adding that and it boots properly on riscv. But I&#39;m perplexed=
 as to why<br>
&gt; &gt; this didnt show up on our regularly tested platforms.<br>
&gt; &gt; <br>
&gt; &gt; Gonna try to get this in for 7.2!<br>
&gt; <br>
&gt; I see another problem with sparc64.<br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 5.261508] could not locate request for tag 0x0<br>
&gt; [=C2=A0 =C2=A0 5.261711] nvme nvme0: invalid id 0 completed on queue 1=
<br>
&gt; <br>
&gt; That is seen repeatedly until the request times out. I&#39;ll test wit=
h<br>
&gt; your patch to see if it resolves this problem as well, and will bisect=
<br>
&gt; otherwise.<br>
&gt; <br>
The second problem is unrelated to the doorbell problem.<br>
It is first seen in qemu v7.1. I&#39;ll try to bisect.<br>
<br>
Guenter<br>
</blockquote></div>

--0000000000004d609f05ef56e275--

