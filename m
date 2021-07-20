Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278343CFD03
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rLx-0007yj-OX
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m5rKe-0006eU-5i
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:06:52 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:36697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m5rKc-0006NC-GW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:06:51 -0400
Received: by mail-oi1-x22e.google.com with SMTP id u15so24844086oiw.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N2VvByfYRjrS4PqW77+LTNOlJVvLD/+JzRv+AAWZZj8=;
 b=pc4dIDIvrjo7v3fQbJczsxOAVTrxlcz4nP4whLDdXZN0CxO8+GjI1aMZE4Ue7yzAz7
 SGQmRlBlT+8dsFL9stwGeASe3yZ3ryz23wErWg9UIyM2BHMzPNEAspJ5WBdHo5aTB+1E
 /GmhzZsXqK5yrh4/d1wE9WRoFgBWXs7s4TkYxwv7tzVeyo01KF72zbACsn18JsiArJhw
 ibCuD1tK6AliAw/jYrIJ0Zb8JCCKl8P0bME+nG8bQ1zqzdzZg7pbVwwog07QT8sQOMfv
 9mlZljiv+f/s3/0TCv5mB3SgXWBvU4h9hoSe3wOgbyymRjI7LoT+RbBI53o0/xm/HWIr
 1XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2VvByfYRjrS4PqW77+LTNOlJVvLD/+JzRv+AAWZZj8=;
 b=FmCn8ucTpCrNotPCbyAebtoQkXnkYHfH2RktZh8lCQ7Ctkdv1q0xa8ZXsHJZfe1o7c
 uTyYjHQ/7nudvq7Ad/4a9RcNdn+SO+grCZtuWBFGuTQrsKpUJoNIh8h8jMadenJRlm5k
 KngfSh0RNU+nZVqL+bZWV3p0FvbZOEAyEjg479XnQb7wVTJUtUMiUFJHYA9Fj1S3ZZIP
 n+krBvYMNoKpJ1H+C+XPeYeARXGnoNhlHNHWYrQmTBIgT4SygZuITMkLdE4K6Vpyzt4/
 r3o087NP4qdyivIbFOE6LqMs77adMskc/khWyvwwp9hmdBFxm5bA6O0mPA3APEBxESdv
 XNiQ==
X-Gm-Message-State: AOAM532uEB+A2Wu55YaYsGuxgG4HInYSdG7I8zQ7VJzfIoh5oEJaKGXL
 S7aD6pcWIeuEJETMiLOGqDW1bQ8vXGzBFFr7xPg=
X-Google-Smtp-Source: ABdhPJwHHGV5O9m3NLwPoG8aqRNmUxizGEk1Q4pqt+/JrKdDDDTQTUSW4tDv8SjIv0CZgRLbXOhz77TkU5VB3XHrNRY=
X-Received: by 2002:a05:6808:1494:: with SMTP id
 e20mr9183308oiw.111.1626793607049; 
 Tue, 20 Jul 2021 08:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
 <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 20 Jul 2021 11:06:36 -0400
Message-ID: <CAK7rcp-Hb-ms6EUh6tGcWwq9BS9bO9StPLuDnBsDd2snuhsQCw@mail.gmail.com>
Subject: Re: Error in accel/tcg?
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001236f505c78f6753"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001236f505c78f6753
Content-Type: text/plain; charset="UTF-8"

I saw that TARGET_PAGE_SIZE gets a value that depends on TARGET_PAGE_BITS
using tags and grep, but I did not see either of them take a value that is
beyond the idxmap size.

On Tue, Jul 20, 2021 at 5:07 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> >
> > Hello,
> >
> > I get the following error:
> >
> > <long cmd here> -c ../accel/tcg/cputlb.c
> > ../qemu/accel/tcg/cputlb.c: In function 'tlb_flush_page_by_mmuidx':
> > ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true due
> to limited range of data type [-Werror=type-limits]
> >     } else if (idxmap < TARGET_PAGE_SIZE) {
> >
> > I don't know why that suddenly shows up.
>
> So, which target are you building for, which host, and which
> compiler version? (TARGET_PAGE_SIZE gets a value that depends
> on the TARGET_PAGE_BITS setting for the target.)
>
> > In other parts of the code, I think somehow the meson build system
> >is triggering errors for warnings
>
> The QEMU build system defaults to warnings-are-errors when
> building from git. You can turn this off by passing
> configure '--disable-werror'. (Note that that's a bad idea if
> you're working on the QEMU source code, because you want to
> be able to see and fix the warnings in the code you're working on.)
>
> thanks
> -- PMM
>

--0000000000001236f505c78f6753
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I saw that TARGET_PAGE_SIZE gets a value that depends on T=
ARGET_PAGE_BITS using tags and grep, but I did not see either of them take =
a value that is beyond the=C2=A0idxmap size.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 5:07 AM=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydel=
l@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I get the following error:<br>
&gt;<br>
&gt; &lt;long cmd here&gt; -c ../accel/tcg/cputlb.c<br>
&gt; ../qemu/accel/tcg/cputlb.c: In function &#39;tlb_flush_page_by_mmuidx&=
#39;:<br>
&gt; ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true du=
e to limited range of data type [-Werror=3Dtype-limits]<br>
&gt;=C2=A0 =C2=A0 =C2=A0} else if (idxmap &lt; TARGET_PAGE_SIZE) {<br>
&gt;<br>
&gt; I don&#39;t know why that suddenly shows up.<br>
<br>
So, which target are you building for, which host, and which<br>
compiler version? (TARGET_PAGE_SIZE gets a value that depends<br>
on the TARGET_PAGE_BITS setting for the target.)<br>
<br>
&gt; In other parts of the code, I think somehow the meson build system<br>
&gt;is triggering errors for warnings<br>
<br>
The QEMU build system defaults to warnings-are-errors when<br>
building from git. You can turn this off by passing<br>
configure &#39;--disable-werror&#39;. (Note that that&#39;s a bad idea if<b=
r>
you&#39;re working on the QEMU source code, because you want to<br>
be able to see and fix the warnings in the code you&#39;re working on.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000001236f505c78f6753--

