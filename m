Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DF43B1FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 19:37:45 +0200 (CEST)
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw6oq-0005xe-3F
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 13:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1lw6nc-000544-CT; Wed, 23 Jun 2021 13:36:28 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1lw6na-0003hy-Oi; Wed, 23 Jun 2021 13:36:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gn32so5267746ejc.2;
 Wed, 23 Jun 2021 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQkxxIrNjz7Jvkkbm24kegFDeKrdBclMMTJQe9FN9o0=;
 b=flJWktrHGZsfKq8mqdO04DNELQz04QryVWv28PXZoMAg6w5+Y+cNwfgNHZkWJ5gxwo
 8OaHxikzpdecYUhmmMty3qfU1vWjU0PcHNULDSlwBdwKnIVtsmQ4sRg2j2rIuTD2vTQ/
 zgomwPaYlLTJ42hHqOfcUngz74jU5KU+LbTQAwt5MsR001uAWiX4XpoFN3O/3GvJ2Ysn
 HHJ+6K0aNCql2LlArM39O0yVVi5WmY5Nui1IF/XFE+VeCxuqr7yPCXgUdbU6tht0V2f3
 W+gAAcxjx3toFDzcXkbkw2XgK/p3jaLopczjx/d4JAOMNB+USx5IwnloTtBo3kKMJYFm
 pL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQkxxIrNjz7Jvkkbm24kegFDeKrdBclMMTJQe9FN9o0=;
 b=eahzrFkil4O4YNdNFdDSsdAQ60g2ct241j2GFjiXu6+dlx3KU8OyT8/QxsNHA3zTLi
 Av9ikF54xpQzmHYkqrrdC2B7u4389YcGYnc7ZrV4p6GpO6x49BcQKMe/2yXYg62ma3G/
 JNhIUZd32hxGaZh3H6sc4djbQeko/CJg40vWu02xjwIEGBILOE4CJwNelWBde7SaGKEi
 dz0DIna4EWUhV+mLpqgCAi5je9eUt5NCy9427XpBLWkduuHIx/FbZ/f8zhg1Z96UaCgJ
 VU5ltwXWk9ncvtha0KkZ6zliBUka6KQdiQs9gPvr1arCd9ihQjmRNR8Ju3uXb6pNZXQR
 yqKw==
X-Gm-Message-State: AOAM532xXVSxD80II336Wht7qVqXu8VzvUwwDanOcs73oERzTiuqd8y3
 VN2oJZDmR2Zox/RFudH8sr92W0Ppark34DgGrIk=
X-Google-Smtp-Source: ABdhPJyGf+4zhczpZpEo4u/RDxscpJlyoHucSCSASxJpdPDu8Bt/Ryv9UJYCf8qB8YHi6oO3FYxB8svIKBXnvtatdGc=
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr1212698ejc.51.1624469785038; 
 Wed, 23 Jun 2021 10:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFAxGOcxET9j7VkDmcmUXmx3t9eSAM2a5RWSpCVmDfkOQPPfgA@mail.gmail.com>
 <774c11e6-401f-d7ac-a021-44857ea6c620@amsat.org>
In-Reply-To: <774c11e6-401f-d7ac-a021-44857ea6c620@amsat.org>
From: Joanne Koong <joannekoong@gmail.com>
Date: Wed, 23 Jun 2021 10:36:14 -0700
Message-ID: <CAFAxGOcsEUTFgKH3nLsKDaA4Mxs7PsLArjd3aR-L2KZNLxzhCA@mail.gmail.com>
Subject: Re: SD/MMC host controller + 64-bit system bus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007c548105c5725812"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=joannekoong@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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

--0000000000007c548105c5725812
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great!! I'm happy to do so. Thanks for the reply!

On Tue, Jun 22, 2021 at 1:51 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Hi Joanne,
>
> On 6/22/21 8:07 PM, Joanne Koong wrote:
> > Hello! I noticed that the default SD/MMC host controller only supports =
a
> > 32-bit system bus. Is there a reason 64-bit system buses aren't
> > supported by default?
>
> We aim to support the spec v2.00, so this is a bug in the model, 64-bit
> system bus should be supported. Do you mind sending a patch?
>
> Thanks,
>
> Phil.
>

--0000000000007c548105c5725812
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great!! I&#39;m happy to do so. Thanks for the reply!=C2=
=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Jun 22, 2021 at 1:51 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Joanne,<br>
<br>
On 6/22/21 8:07 PM, Joanne Koong wrote:<br>
&gt; Hello! I noticed that the default SD/MMC host controller only supports=
 a<br>
&gt; 32-bit system bus. Is there a reason 64-bit system buses aren&#39;t<br=
>
&gt; supported by default?<br>
<br>
We aim to support the spec v2.00, so this is a bug in the model, 64-bit<br>
system bus should be supported. Do you mind sending a patch?<br>
<br>
Thanks,<br>
<br>
Phil.<br>
</blockquote></div>

--0000000000007c548105c5725812--

