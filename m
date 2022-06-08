Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6133543948
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:41:51 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyykg-0000ai-H6
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyybe-0001uC-MG
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:32:30 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyybb-0005VK-Q8
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:32:29 -0400
Received: by mail-vk1-xa31.google.com with SMTP id b81so9234049vkf.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zt+HGVQV0BUUJcMyJxol2ei+8VFqS5isXr4RZbmNk7c=;
 b=cmBMonRlknwMIVLfZ9UN8+Zbj+iWrJIjNDV3k0EKs4xUll2SBMgCFUg5FTV9WMftWv
 4wMMUq45rJhNOPwLxDEdlY95HoP8XUIX1zrpg0vL/6HApUop7kCApELR+MbHykoi5z2A
 Gocl5Xu8hP/6xQF9PZVe13Sc74LoHG1PXokkeKN6sssAJCgCZcYdajK9IrwLx+7/e98P
 v+Vf7uMLTRLG7L20RFoNKDTRKSiwM8pAGLefF6y0x++/OwwrSAZaSlsArASZCmE9UTdn
 /IfaFf8C0WRTQ22Oh6TwPQdN3apAMtcVYuqExINy7bPJN9XApoVBy89zJIfU8X+pQZ78
 8Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zt+HGVQV0BUUJcMyJxol2ei+8VFqS5isXr4RZbmNk7c=;
 b=m+g1uimHap6kqqRPwWAplC4+imxp40bxkBKYphs5GC/Um7/85UEfRRa3qvkTaGIFvJ
 lYj2XcjVIB2oQW/TsAhyNFBb9+mM7kl7T0GYRcRTgi4DswjNcsPidhowokmFr0PiVQak
 55euRuweGeWLJo43Smn01gLg3nGZrw9cH5OuqNvw4TbQYQQoHnHtIfdrDWcwMdj2F9Av
 cGa5yzI8P6lO+yp7+2lLHdavczLgGodDRbOzTFWbw9qHr7+AsWasKT7SXxgZMBEvHnBK
 GeysQYLfFbAy/Ky9JNZ1VB2XMiyjY3I1OYI6ULA9AJtYf5rqnJ4Utgv5re9s3F6IGUvy
 7YzQ==
X-Gm-Message-State: AOAM533qHQY0eNG7fuyDOM4ygW83lyy0Z0q7662lUWHEBPyOrvlW9GuW
 Br+zrdjtbkFzkNJJjLbcMmNf6TH67SJtdpnfXqKSxw==
X-Google-Smtp-Source: ABdhPJyuP1InOSGgItRKNxH6DkyTZ8EGFhEwFiLkBmhQdxd1RJD/sTQ9lMjfA41+6B373kqDn3Ij0vnzXPYNbTT/L1k=
X-Received: by 2002:ac5:cb56:0:b0:35d:f905:e98a with SMTP id
 s22-20020ac5cb56000000b0035df905e98amr7788109vkl.29.1654705944799; Wed, 08
 Jun 2022 09:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-3-imp@bsdimp.com>
 <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
 <CANCZdfq5L5Q3ePmdF6_ap73h5CGgtc6ZVK0e+tPfUOqW5SKBkw@mail.gmail.com>
 <35407e39-ac93-b5c0-c634-975ab8609a92@linaro.org>
 <7CD189F5-3536-4B7D-B7C1-AE5E74B90D03@bsdimp.com>
 <3bfb791b-f6fa-ebad-8195-43ce653a73be@linaro.org>
In-Reply-To: <3bfb791b-f6fa-ebad-8195-43ce653a73be@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 8 Jun 2022 09:32:14 -0700
Message-ID: <CANCZdfrxxZ2edahbAmaBGXq8-sYQ-=xYZ+Mdo1j4c34pjGSHtA@mail.gmail.com>
Subject: Re: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gleb Popov <arrowd@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000000c415405e0f240d9"
Received-SPF: none client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000c415405e0f240d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2022 at 7:02 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/7/22 16:35, Warner Losh wrote:
> >
> >
> >> On Jun 7, 2022, at 3:23 PM, Richard Henderson <
> richard.henderson@linaro.org> wrote:
> >>
> >> On 6/7/22 14:51, Warner Losh wrote:
> >>>     void unlock_iovec(IOVecMap *map, bool copy_out)
> >>>     {
> >>>           for (int i =3D 0, count =3D map->count; i < count; ++i) {
> >>>               if (map->host[i].iov_base) {
> >>>                   abi_ulong target_base =3D
> tswapal(map->target[i].iov_base);
> >>>                   unlock_user(map->host[i].iov_base, target_base,
> >>>                               copy_out ? map->host[i].iov_len : 0);
> >>>               }
> >>> And wouldn't we want to filter out the iov_base that =3D=3D 0 since
> >>> we may terminate the loop before we get to the count. When the
> >>> I/O is done, we'll call it not with the number we mapped, but with
> >>> the original number...  Or am I not understanding something here...
> >>
> >> I'm not following -- when and why are you adjusting count?
> >
> > When we hit a memory range we can=E2=80=99t map after the first one,
> > we effectively stop mapping in (in the current linux code we
> > do map after, but then destroy the length). So that means
> > we=E2=80=99ll have entries in the iovec that are zero, and this code
> > doesn=E2=80=99t account for that. We=E2=80=99re not changing the count,=
 per
> > se, but have a scenario where they might wind up NULL.
>
> ... and so skip them with the if.
>
> I mean, I suppose you could set map->count on error, as you say, so that
> we don't iterate
> so far, but... duh, error case.  So long as you don't actively fail,
> there's no point in
> optimizing for it.
>

Setting the count would be hard because we'd have to allocate and free
state that we're not currently doing. Better to just skip it with an if. We
allocate
a vector that's used in a number of places, and we'd have to change that
code if we did things differently. While I'm open to suggestions here, I
think
that just accounting for the possible error with an if is our best bet for
now.
I have a lot of code to get in, and am hoping to not rewrite things unless
there's
some clear benefit over the existing structure (like fixing bugs, matching
linux-user,
or increasing performance).

Warner

--0000000000000c415405e0f240d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 7:02 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 6/7/22 16:35, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt;&gt; On Jun 7, 2022, at 3:23 PM, Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 6/7/22 14:51, Warner Losh wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0void unlock_iovec(IOVecMap *map, bool copy_=
out)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0, coun=
t =3D map-&gt;count; i &lt; count; ++i) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (map-=
&gt;host[i].iov_base) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0abi_ulong target_base =3D tswapal(map-&gt;target[i].iov_base);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0unlock_user(map-&gt;host[i].iov_base, target_base,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copy_out ? map-&gt;host[i].=
iov_len : 0);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; And wouldn&#39;t we want to filter out the iov_base that =3D=
=3D 0 since<br>
&gt;&gt;&gt; we may terminate the loop before we get to the count. When the=
<br>
&gt;&gt;&gt; I/O is done, we&#39;ll call it not with the number we mapped, =
but with<br>
&gt;&gt;&gt; the original number...=C2=A0 Or am I not understanding somethi=
ng here...<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not following -- when and why are you adjusting count?<br>
&gt; <br>
&gt; When we hit a memory range we can=E2=80=99t map after the first one,<b=
r>
&gt; we effectively stop mapping in (in the current linux code we<br>
&gt; do map after, but then destroy the length). So that means<br>
&gt; we=E2=80=99ll have entries in the iovec that are zero, and this code<b=
r>
&gt; doesn=E2=80=99t account for that. We=E2=80=99re not changing the count=
, per<br>
&gt; se, but have a scenario where they might wind up NULL.<br>
<br>
... and so skip them with the if.<br>
<br>
I mean, I suppose you could set map-&gt;count on error, as you say, so that=
 we don&#39;t iterate <br>
so far, but... duh, error case.=C2=A0 So long as you don&#39;t actively fai=
l, there&#39;s no point in <br>
optimizing for it.<br></blockquote><div><br></div><div>Setting the count wo=
uld be hard because we&#39;d have to allocate and free</div><div>state that=
 we&#39;re not currently doing. Better to just skip it with an if. We alloc=
ate</div><div>a vector that&#39;s used in a number of places, and we&#39;d =
have to change that</div><div>code if we did things differently. While I&#3=
9;m open to suggestions here, I think</div><div>that just accounting for th=
e possible error with an if is our best bet for now.</div><div>I have a lot=
 of code to get in, and am hoping to not rewrite things unless there&#39;s<=
/div><div>some clear benefit over the existing structure (like fixing bugs,=
 matching linux-user,</div><div>or increasing performance).</div><div><br><=
/div><div>Warner=C2=A0</div></div></div>

--0000000000000c415405e0f240d9--

