Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2E417780
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:28:18 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTn7Z-0007n6-DP
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mTn5H-0006zf-V1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:25:56 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mTn5G-0007xA-9G
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:25:55 -0400
Received: by mail-vs1-xe36.google.com with SMTP id 188so9413118vsv.0
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptYAPA8AnPoWgXdqza7M0AxbP78AdVpnbag0iGeF2SM=;
 b=1pPlSX2G3MxZtWnhilQ/GoDkE3b5WrzhHuWLXEcn0DCyDy7yZoyA08zZGsXyzpySVA
 YvKSq2B3ZmvIbd9R64KhOiFkmgbyHVEvQEhC7IitQVz69q5/cKW6wO8fLG7D3ASB7YZK
 epIWt3XBnwPiqBkzoRuxRnJaEW0BcWDbFtQdWrIIwdNsZOvOd5Jwg03ZBCRvoUUpws7R
 mTU2CJXgVPSUMF3II3M7yfpTVd1YCxymuR/uxXeIutFBINChWDNhteDT7acGxpz8s7e+
 grlXsM2TM695oGVL+9Zfv5UnfXzvMJt+47sUZjXOdHPLGSDhwIFsdw8laCPukeyWmWmM
 MkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptYAPA8AnPoWgXdqza7M0AxbP78AdVpnbag0iGeF2SM=;
 b=UtLhU5BUi/AsQnnybL0e//pDXJfnpF6VLd8knRO5EUrx2OHbnAL9DO1nSh7JSDiKvY
 nmLBXqWUGE1oHO6WJKHjJi2N/zlCrjRZIaI/XdIODFZxdccjjGdZv8siNvl8oGzjapZc
 fPKLruiAhOu6oNgtyZsU6dGfuk3sgDUDcJIbam9YhhXAopH4JDhdinHHQXyxsu54HmlP
 IrWPhyjNMpUB5acVKzsZ+Swg7xVOgHMScgB13TRfxD5Mu5Bv/0nQDTTpbmf7N01fxGQW
 OqKyW/XqVBqhP1rdW1A4gnfnIU/g31NY0Kv/7bS30yoHfSqaoH3HTV2+9ahc2/UFwcS2
 qZLQ==
X-Gm-Message-State: AOAM531mtB984HaXYR2ckU76ymRp9Iavbg2hQA3pnggARc6/WVtWqRZN
 JClbSukOBtRALC3A+F/3ONhxBqw5C8AQix+P9PDEZA==
X-Google-Smtp-Source: ABdhPJyea8BEsVgd2RZc0E/4BafwQhq9oWNQ47WJ5LrGrDN08wLs1Npdg+9UU5EU7WmZhSYXDr5dbZze1ZdtQFraHgA=
X-Received: by 2002:a67:eacf:: with SMTP id s15mr9804524vso.44.1632497152143; 
 Fri, 24 Sep 2021 08:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-12-imp@bsdimp.com>
 <fd9e834c-5b1e-762b-0af8-5afa0a08fea3@linaro.org>
In-Reply-To: <fd9e834c-5b1e-762b-0af8-5afa0a08fea3@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 24 Sep 2021 09:25:41 -0600
Message-ID: <CANCZdfqscG2awpm4PJKQF6YeXhica6OBPym_53cT3YmaHLdE7w@mail.gmail.com>
Subject: Re: [PATCH 11/14] bsd-user/sysarch: Move to using
 do_freebsd_arch_sysarch interface
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d9c5b505ccbf5c9e"
Received-SPF: none client-ip=2607:f8b0:4864:20::e36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe36.google.com
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

--000000000000d9c5b505ccbf5c9e
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/21/21 11:14 PM, Warner Losh wrote:
> > Convert the #ifdef'd i386 code to calling the i386 sysarch code we have
> > living in i386,x86_64/target_arch_sysarch.h do_freebsd_arch_sysarch
> > rather than having a separate copy. This is in preparation to remove it
> > entirely.
> >
> > Signed-Off-By: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/syscall.c | 45 +--------------------------------------------
> >   1 file changed, 1 insertion(+), 44 deletions(-)
>
> It wasn't clear to me that this target_arch_sysarch.h file already exists,
> and is already
> populated with the code being (re)"moved" here.  Perhaps the wording here
> can be improved?
>

Will do. Good suggestion.


> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks

Warner


>
> r~
>

--000000000000d9c5b505ccbf5c9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 6:00 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/21/21 11:14 PM, Warner Losh wrote:<br>
&gt; Convert the #ifdef&#39;d i386 code to calling the i386 sysarch code we=
 have<br>
&gt; living in i386,x86_64/target_arch_sysarch.h do_freebsd_arch_sysarch<br=
>
&gt; rather than having a separate copy. This is in preparation to remove i=
t<br>
&gt; entirely.<br>
&gt; <br>
&gt; Signed-Off-By: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/syscall.c | 45 +---------------------------------=
-----------<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 44 deletions(-)<br>
<br>
It wasn&#39;t clear to me that this target_arch_sysarch.h file already exis=
ts, and is already <br>
populated with the code being (re)&quot;moved&quot; here.=C2=A0 Perhaps the=
 wording here can be improved?<br></blockquote><div><br></div><div>Will do.=
 Good suggestion.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Anyway,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Thanks</div><div><br></div><div>Warner</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000d9c5b505ccbf5c9e--

