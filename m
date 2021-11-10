Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D644CD5E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 23:59:56 +0100 (CET)
Received: from localhost ([::1]:54716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwZP-0005NJ-EC
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 17:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwYX-0004Xw-Kh
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:59:01 -0500
Received: from [2607:f8b0:4864:20::92c] (port=36730
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwYV-0006x2-NC
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:59:01 -0500
Received: by mail-ua1-x92c.google.com with SMTP id e10so8209405uab.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LY10hO12MnbiQWZvit+LX/xKKZPZ6V465OOuNszOfp4=;
 b=b8zquV4OLx0fZLA+wyq3mCmn7sYVCu+oNxIdCISjEVhf+w8Vo4aYn1G37YVIJuu0Pc
 nhKqBfbBNOO2mmYHnQdnEIATNLUiYYRW9COnrU1z07vBNLLx2nvuoLjq35Em5d33QqLF
 qGpvlDciuN47n6wjJt/d/mtF8Q0fEtA2HZUBYG3GbzqnLUJkTcDXTNj2/L8mkQWvDdRg
 ZMxny0e7P3j8YsJc660y0dWj4dJKtqgtnw6qH4wzhW7x8Ysu84naGwfwmWKE8cdKcOoV
 cckbt2jzyFjOZolyFhRl9IFApUY6EU7gdn1ccheDNb5aDDXtEZ/HzGoj2sQv26LwroOH
 FBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LY10hO12MnbiQWZvit+LX/xKKZPZ6V465OOuNszOfp4=;
 b=ob9QOWJVcTr2oFy1ScqmSOJk/4Sdvc/p+SKQxGKMkgzmJmVibG0I9P51QSREhSIK9C
 hAX5ab3fPOtmY5uV7RzhIg7VCYMAgG2KdnuGnzunn0wF+wnsogdeczMTtErQFyhz69GX
 LQ73RPUD3gB7ci+yLFR4SQQd5xwfH2RstObnTckLbt9rECLSGIDXOeJldgPxnlVssnlX
 DKg74E+ixsp5XvBW9vtTDMcXqcpqOXWwgu0rr874Ph/3pup4EuoIkE+hlAGRtvXRGxmS
 Bmt41UKtbjGlBQVeVN/X5CiJ1zZpROcaSvyiudHJEUnRuM60Q1Qb7xBHCglre6CKSvPP
 X45g==
X-Gm-Message-State: AOAM5300+eLFKSB9q+HJgYge7txdDfBupjgds2GetapqiFDZWIchXu6J
 dNqYekzaQGzVEZCEJBoN49IoZF3sEBgAEYZF4xNGzQ==
X-Google-Smtp-Source: ABdhPJzBvHF5baBmVLFbj+naLimdIe/vShJWOuIiCnsDpdjMeyMq6Ui09vmadvDHW8CvboNMjdXYI+6b73oTyNFM5k8=
X-Received: by 2002:a67:e050:: with SMTP id n16mr4067583vsl.44.1636585138665; 
 Wed, 10 Nov 2021 14:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-6-imp@bsdimp.com>
 <c0bba3a4-093b-6441-22c6-76047461d8e6@linaro.org>
In-Reply-To: <c0bba3a4-093b-6441-22c6-76047461d8e6@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Nov 2021 15:58:47 -0700
Message-ID: <CANCZdfp__JeycMZVQrH+SLJrEVJ=PwWfderDXmQFgeok4uX1mQ@mail.gmail.com>
Subject: Re: [RFC v2 5/6] common-user/host/mips: create, though mips hosts
 likely don't work reliably
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5d28005d0772bdb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d5d28005d0772bdb
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 10:00 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/10/21 5:31 PM, Warner Losh wrote:
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   common-user/host/mips/safe-syscall.inc.S | 1 +
> >   1 file changed, 1 insertion(+)
> >   create mode 100644 common-user/host/mips/safe-syscall.inc.S
> >
> > diff --git a/common-user/host/mips/safe-syscall.inc.S
> b/common-user/host/mips/safe-syscall.inc.S
> > new file mode 100644
> > index 0000000000..72d9064acb
> > --- /dev/null
> > +++ b/common-user/host/mips/safe-syscall.inc.S
> > @@ -0,0 +1 @@
> > +     .asciiz "This file is not compiled and mips hosts are likely
> broken"
> >
>
> Let's not include this.  I have created
>
>    https://gitlab.com/qemu-project/qemu/-/issues/713
>
> for tracking.
>

Without including it, the mips CI jobs will fail. If you are OK with this
and dealing with that
issue in another way, then I'll drop it. It's easy enough.

Warner

--000000000000d5d28005d0772bdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 10, 2021 at 10:00 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 11/10/21 5:31 PM, Warner Losh wrote:<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0common-user/host/mips/safe-syscall.inc.S | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 common-user/host/mips/safe-syscall.inc.=
S<br>
&gt; <br>
&gt; diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/ho=
st/mips/safe-syscall.inc.S<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..72d9064acb<br>
&gt; --- /dev/null<br>
&gt; +++ b/common-user/host/mips/safe-syscall.inc.S<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.asciiz &quot;This file is not compiled and mips =
hosts are likely broken&quot;<br>
&gt; <br>
<br>
Let&#39;s not include this.=C2=A0 I have created<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/713" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-=
/issues/713</a><br>
<br>
for tracking.<br></blockquote><div><br></div><div>Without including it, the=
 mips CI jobs will fail. If you are OK with this and dealing with that</div=
><div>issue in another way, then I&#39;ll drop it. It&#39;s easy enough.</d=
iv><div><br></div><div>Warner</div></div></div>

--000000000000d5d28005d0772bdb--

