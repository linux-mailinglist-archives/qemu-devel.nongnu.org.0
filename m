Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E34D7700
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 17:58:28 +0100 (CET)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTRY3-0006QP-7S
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 12:58:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTRX5-0005lt-3e
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 12:57:27 -0400
Received: from [2607:f8b0:4864:20::a33] (port=35340
 helo=mail-vk1-xa33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTRX3-0007Xj-Bm
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 12:57:26 -0400
Received: by mail-vk1-xa33.google.com with SMTP id e188so7199985vkh.2
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MTkF4JVZobRb4J0WmY4N2HF0Cgj1ct8w5/pvhE4bDhY=;
 b=VXHjxNjGElnhW1mbrJgBTcQ/dn1ijpLzVFOxfLsOEhJtOD6YIyLLk2dekHWLhLB+Xg
 BniIokV29cOCH2nPBUvbGu17J6fKnmaRIVtUMkJTamxBOMmb+MaK+IAwM28WcQntajc5
 VsBt7GdaD440d1AHbHTFEdwjGSKJ1sdsihaYTGuosca0uo/4GGw+dc0y5zd4eG/wU9To
 PkUz/KE6J//9BGLaRs8RN2spbR4Z/iN5xJebhiflqjclI2ijG5uO4TRKaE5Ixxl0M7lG
 doKR3hJH96/xR6pDfaYFHZ2ndfst0zW9zw2Vb/1yO0b4S6oxtCbu1dDepFygj/+YfyTC
 nNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MTkF4JVZobRb4J0WmY4N2HF0Cgj1ct8w5/pvhE4bDhY=;
 b=JJRVi+1GZ4HJVKLMUgjXPUeJh73TRvgHACeFfxzAsMabcqRPz/brAk5UZ199pb4dPB
 9VauKhc0bmh9pJsEFlkqea9UQfrtiwoaiqywheEDVqxUoyrnZdoOyAciTyo8b5e2mvps
 h3xlXyclxiZK1oabRsHsVWdesvTYdoEMhhVGpW9cdaPr+mj0CYCCsskO4d0UsjilPqHD
 ToZlezL6DbCCDZ5yEjtwdo0XIVA589iTLSxoLtkGTnRTa2x/NVs0MWFgSYdJr5HWtKqW
 XOForUHtbP1ST/8qkvGBvGjC3gwp6a8zHyw+O5kM260ZPVnlssCqkzSjaNSaKReAnICL
 rQTg==
X-Gm-Message-State: AOAM533AVo5YyDLdQxERySkos43n38gmM+84XCXQjZ3B5jFb+vKTrDIn
 8K/m/0bX7WKp2dcasQYjLAaNFFtvmF7L9BfsvC7dkg==
X-Google-Smtp-Source: ABdhPJypTdoZDEC7A4GHcObpDlOh7Y995z8QxsXEgItGUT5bw3sElpvujdk7aGbpq+k09KkxzWPNC/DupT4TW/LiVOU=
X-Received: by 2002:a05:6122:2229:b0:32d:1642:b58b with SMTP id
 bb41-20020a056122222900b0032d1642b58bmr8338903vkb.27.1647190644098; Sun, 13
 Mar 2022 09:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
In-Reply-To: <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 13 Mar 2022 10:57:12 -0600
Message-ID: <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
Subject: Re: Question about atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003819d305da1c75e5"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003819d305da1c75e5
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 13, 2022, 10:47 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/12/22 20:59, Warner Losh wrote:
> > FreeBSD's pthread_mutex is shared between the kernel and user land.
> > So it does a compare and set to take the lock. Uncontested and unheld
> > locks will mean we've taken the lock and return. Contested locks
> > are kicked to the kernel to wait. When userland releases the lock
> > it signals the kernel to wakeup via a system call. The kernel then
> > does a cas to try to acquire the lock. It either returns with the lock
> > held, or goes back to sleep. This we have atomics operating both in
> > the kernel (via standard host atomics) and userland atomics done
> > via start/end_exclusive.
>
> You need to use standard host atomics for this case.
>

Or use the start/end_exclusive for both by emulating the kernel call, I
presume? It's the mixing that's the problem, right?

Warner

>

--0000000000003819d305da1c75e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Mar 13, 2022, 10:47 AM Richard Henderson &lt;<=
a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 3/12/22 20:59, W=
arner Losh wrote:<br>
&gt; FreeBSD&#39;s pthread_mutex is shared between the kernel and user land=
.<br>
&gt; So it does a compare and set to take the lock. Uncontested and unheld<=
br>
&gt; locks will mean we&#39;ve taken the lock and return. Contested locks<b=
r>
&gt; are kicked to the kernel to wait. When userland releases the lock<br>
&gt; it signals the kernel to wakeup via a system call. The kernel then<br>
&gt; does a cas to try to acquire the lock. It either returns with the lock=
<br>
&gt; held, or goes back to sleep. This we have atomics operating both in<br=
>
&gt; the kernel (via standard host atomics) and userland atomics done<br>
&gt; via start/end_exclusive.<br>
<br>
You need to use standard host atomics for this case.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Or use the start/end_ex=
clusive for both by emulating the kernel call, I presume? It&#39;s the mixi=
ng that&#39;s the problem, right?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Warner=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000003819d305da1c75e5--

