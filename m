Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD53BDDB3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:01:39 +0200 (CEST)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0qK9-0007Ye-UC
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1m0qJ1-0006pN-8O; Tue, 06 Jul 2021 15:00:27 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1m0qIz-0003Eg-D7; Tue, 06 Jul 2021 15:00:26 -0400
Received: by mail-ed1-x532.google.com with SMTP id m1so19979edq.8;
 Tue, 06 Jul 2021 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJEISK8+jDVaCvGe0tp/3/x8RBFkwmgNzYWnIKfFPik=;
 b=XhpsJtyZk+7Uh5AI0hERS5a4pKgPjYbvwKlR/f9EeHYtMZnOEUaUlnZ4knJRv2TzVN
 EBYMfb8Hro0OGbcxZYxJlYMsZ+azM3s4gcJzrJhoYzgF6NOWXwG7AwKL0BHNaMOr8jna
 CatnJDSSWmhLEG5cEYiADgm/j5UXx+CzUzv033lb41F5Ixvqj8zGpGuKLxZBc4nUkz8B
 Xt1SYPI5hsBn3G/i6tHHIcEammiHvVOu37Qxl+oO1SQW1ef1e0TSf1CKrq63m4SZ/kK2
 h244n/OpRo1It4Ub1QLfsmLhJvkFkn3ZQFlqN9zwvGvTu1WdGH9D6Kbg5Xix3+pzIiEq
 sTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJEISK8+jDVaCvGe0tp/3/x8RBFkwmgNzYWnIKfFPik=;
 b=CHAjfHILB3GFSg8P/OkI7o85cejDsjWVbm8FJP8RAEsDU+novHnfhScYwl1+vgEZNH
 Jo6ZpeHjjzN1tIRENSwlXQY8Bd/LSV8mkz7fF+MH3JVbkD987XwuRE2vjC51Tip+AaCp
 ldxF2sU1vxVm64dczHj2IIYm0OVULcJLbtietFa/ReuxkHSuCR5KD1ESoPOwROfwxOAS
 5F7EOfAICxLmfDqMUAeumj1+EaEJMVmC7YwlH+I2h1q3vuOp9QWI+JSkTA258KjEDyQW
 7h5lc/e+2eIxq6pHmwVxAQN57TVuPY2HvEd16MwdHOX50IUNnMQqMkZvH/ssDuHzUrl+
 uaUA==
X-Gm-Message-State: AOAM530EzWiuYRo9IauKhtjPkIvBvLT55koKykD/qKcXc8JLc92sNNhT
 upLEVMcKMSctGPWuebbbu5+uNU521ZqoFdQFfNc=
X-Google-Smtp-Source: ABdhPJyNfIVXIwjcOyTLOG3nOm9CmmNsDyo1A3xQvN3PJhbGiopWsNgoaecBxu2znfecgs8N0lUFdf2Ilo96OKbvcGA=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr25333732edu.273.1625598022356; 
 Tue, 06 Jul 2021 12:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210623185921.24113-1-joannekoong@gmail.com>
 <063df3cc-cb5b-1181-6cfa-a6f02959e70d@amsat.org>
In-Reply-To: <063df3cc-cb5b-1181-6cfa-a6f02959e70d@amsat.org>
From: Joanne Koong <joannekoong@gmail.com>
Date: Tue, 6 Jul 2021 12:00:11 -0700
Message-ID: <CAFAxGOdqMY4+7SOZWfWzC0RXDvRUcq=4oVVx+of1x1s=kA0AhQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Enable 64-bit system bus capability in the
 default SD/MMC host controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000ab931705c67908e8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=joannekoong@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ab931705c67908e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome! Thank you, Philippe and Bin!

On Mon, Jul 5, 2021 at 2:54 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 6/23/21 8:59 PM, Joanne Koong wrote:
> > The default SD/MMC host controller uses SD spec v2.00. 64-bit system bu=
s
> capability
> > was added in v2.
> >
> > In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul
> << 28))
> > where 28 represents the BUS64BIT SDHC_CAPAB field.
> >
> > Signed-off-by: Joanne Koong <joannekoong@gmail.com>
> > ---
> >  hw/sd/sdhci-internal.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Thanks, series applied to sdmmc-next tree.
>

--000000000000ab931705c67908e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome! Thank you, Philippe and Bin!</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 =
at 2:54 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.or=
g">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 6/23/21 8:59 PM, Joanne Koong wrote:<br>
&gt; The default SD/MMC host controller uses SD spec v2.00. 64-bit system b=
us capability<br>
&gt; was added in v2.<br>
&gt; <br>
&gt; In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1u=
l &lt;&lt; 28))<br>
&gt; where 28 represents the BUS64BIT SDHC_CAPAB field.<br>
&gt; <br>
&gt; Signed-off-by: Joanne Koong &lt;<a href=3D"mailto:joannekoong@gmail.co=
m" target=3D"_blank">joannekoong@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/sd/sdhci-internal.h | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Thanks, series applied to sdmmc-next tree.<br>
</blockquote></div>

--000000000000ab931705c67908e8--

