Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88149418A86
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:40:38 +0200 (CEST)
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZ4n-0006XI-5H
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUZ2c-00056L-Ls
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:38:22 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUZ2a-0008MK-Th
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:38:22 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id x74so15685314vsx.13
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uAiD7RAJueWlbRUtpvTiNLaNfkn8WgzU69242ryt9RI=;
 b=Rc6JpiLsaleC34ROotmUdiilDDo5K5odMQjom+3K26Ajn6YD4bmNV9VaKFLLpE5rDg
 F3NT9T+wb6nmGFmbc5WNF1DupzuQTBCCr6hpMFxIQ4/GATwwaUgpuBu325oD5RKQLe01
 APBEkxNg3DSzx/52fYJtyjM6qefqJ0o+KGPkVpToll3TifR7FRH6o3WWQ+QnkkzAQZzG
 d9Y+lFR4T/GEmcBZGhjCHaDoxDtQPs6pKOFU9ySos4pAmqwtjVOwOjj0KjeSQ4Ahs75O
 tjAK3FrrtIBNWXSKYFQzGRKOU/jFpLAhfFWbwhsODp7e0yL2N02Y9AVzITI4ID52qKd4
 0ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uAiD7RAJueWlbRUtpvTiNLaNfkn8WgzU69242ryt9RI=;
 b=XuUg6zWgpCqh7esGH5BIZDR++xuJa/uD/dy18a5J7pbo55y2YvVcIRjXVwsFzHh+v7
 9PwVqqBPlu/E2Ab2qVzry/D/OYTOLCCzszbAvdvJ9O+gvULVEp+wdaGbu8VCa7C3S/yW
 D71+E1oA3Iuf7Ppm+86d7WbEN9y5bSgVZUyvzQNykH6rahluyGDnLW8FKbrolFe4AA6o
 7pGrPhnXOpKb0dyYInWnKBcK0lSxSjiCRbSKhNlkESwV7/fl4ZMtf0uk2ebvjiTG6Z2M
 UfBdTcY/qmiJJZunwTS/xjHWpRX5vX5/P9AUMqkqmkdVsqQai2+oQtJMTWdhsRe6ib1G
 hyeQ==
X-Gm-Message-State: AOAM5316KH/Q9vYguWGBwQpmHVcOD8bpRiJM1aV3p7KVf7P119cQefeA
 WNWRqQQwNmXi1whFViSbRjzCkJ7GJKHxfaI+dLwpoA==
X-Google-Smtp-Source: ABdhPJwAoRedCRnw2rNsZxc6jz127G8OJfR98SIRGa6XUxGX5TBU3SDS4jzbjTFqPlShBWgjaShBidEBXL72Z7h2W+U=
X-Received: by 2002:a05:6102:3648:: with SMTP id s8mr59387vsu.42.1632681499036; 
 Sun, 26 Sep 2021 11:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-9-imp@bsdimp.com>
 <4d7f5ce6-22c4-e9de-39c6-fb92d7096385@linaro.org>
In-Reply-To: <4d7f5ce6-22c4-e9de-39c6-fb92d7096385@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 12:38:08 -0600
Message-ID: <CANCZdfoYpA0ShW6G1+9WixbGsPFZLSN13i9qxgc6J3qu3t=aaw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] bsd-user/mmap.c: Implement MAP_EXCL, required by
 jemalloc in head
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c820ce05ccea4819"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c820ce05ccea4819
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/21/21 9:56 PM, Warner Losh wrote:
> > +        /* Reject the mapping if any page within the range is mapped */
> > +        if (flags & MAP_EXCL) {
> > +            for (addr = start; addr < end; addr++) {
> > +                if (page_get_flags(addr) != 0)
> > +                    goto fail;
> > +            }
> > +        }
>
> How about
>
>      if ((flags & MAP_EXCL) &&
>          page_check_range(start, len, 0) < 0) {
>         goto fail;
>      }
>
> Hmm.  This (and your page_get_flags check) could assert due to
> out-of-range guest address.
>   You're currently attempting that,
>
>          /*
>           * Test if requested memory area fits target address space
>           * It can fail only on 64-bit host with 32-bit target.
>           * On any other target/host host mmap() handles this error
> correctly.
>           */
> #if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
>          if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
>              errno = EINVAL;
>              goto fail;
>          }
> #endif
>
> but the test isn't correct.  Note that reserved_va may be applied to
> 64-bit guests, and
> certainly may be smaller than (abi_ulong)-1.
>
> You want guest_range_valid_untagged here.
>

Great! Thanks for the tip!

Warner

--000000000000c820ce05ccea4819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 6:00 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/21/21 9:56 PM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reject the mapping if any page within =
the range is mapped */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (flags &amp; MAP_EXCL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (addr =3D start; addr &=
lt; end; addr++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page_get_=
flags(addr) !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
How about<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ((flags &amp; MAP_EXCL) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_check_range(start, len, 0) &lt; 0) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
Hmm.=C2=A0 This (and your page_get_flags check) could assert due to out-of-=
range guest address. <br>
=C2=A0 You&#39;re currently attempting that,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Test if requested memory area fits tar=
get address space<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * It can fail only on 64-bit host with 3=
2-bit target.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * On any other target/host host mmap() h=
andles this error correctly.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
#if TARGET_ABI_BITS =3D=3D 32 &amp;&amp; HOST_LONG_BITS =3D=3D 64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((unsigned long)start + len - 1 &gt; (=
abi_ulong) -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
#endif<br>
<br>
but the test isn&#39;t correct.=C2=A0 Note that reserved_va may be applied =
to 64-bit guests, and <br>
certainly may be smaller than (abi_ulong)-1.<br>
<br>
You want guest_range_valid_untagged here.<br></blockquote><div><br></div><d=
iv>Great! Thanks for the tip!</div><div><br></div><div>Warner=C2=A0</div></=
div></div>

--000000000000c820ce05ccea4819--

