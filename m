Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58D43E6C3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:03:35 +0200 (CEST)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8oQ-0002cS-Kj
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg8iG-0003RG-1n
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:57:12 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg8iE-0006O8-LL
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:57:11 -0400
Received: by mail-ua1-x92f.google.com with SMTP id ba32so12843641uab.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZA18NKCmrY10xwoVTixtHZwCgyO+4bwLQGVIGIxHZZA=;
 b=4y/tD5UzFYlqEAPOS+E/DxLk+qsDYkQuQi2a9rhDvtUmS6JHg0SW7yLqc6ArW2gJK+
 Tk5EMEGSHPxWV/m6HlII1JC21hkzp7OXnhKPFLbok1ofC94xxr3YfM9zoL163WxDN6CA
 if3JWWiIS+c7MpKjyAJc1Byx2BAg1JA4GT4qoMxU/ZnNIkbxBwA9QQQyrLlKEXAmOkIz
 9RS6cAl8NcS8UYIxya/5hUxnt8LG3KN7p1jrWJ9Uc3UetfszN7TIWzKmQ1j7BmTAoz5z
 rVxfM2oIsqzS1h9nYb7bEyrjbg9Findle9fHVUEYc9xt1ibSVrrZbhuCSl8iHF8UZ9M0
 bkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZA18NKCmrY10xwoVTixtHZwCgyO+4bwLQGVIGIxHZZA=;
 b=XV3T7z0Vaq14moAQhlxtnUMk2QfTXZ2l2W4d/+ltU6bcGqPknUrkDweh0qhBgAMcB6
 ZPu64z+ofsrTyrpKnfJI5r/7OCks49goNpj4sBggm0W76RTRfuUFM3jcEGUXV6jDwf+h
 ew8KOEwjnoUfzVCb5+ATnWT5PfuF6nrvKjy62Qn7o9FDprdiEO24BdIrsBWLsKfauIOR
 Fy5BE4dNQB4A71gRgXmHT/T//eOPsaI+rk0fdZ8nw/KhiYUHy4QJeo2ToQ2ha5KH74MV
 KNShW7LB3VVG0GXNoRwFayF46WtjsCidNoJZ8pg5XCz/YKHA/i3g2FTZUrw4Ny2JkuZF
 JFPQ==
X-Gm-Message-State: AOAM531+pbi7atJXeWXXwz9JezwtKOJWN5YAWCMrtRQ0vPYLBYVbU539
 XhMsr1pmjUB6D8McZ4Ue+ZToOGGIrxwYI9FhZ7rhnA==
X-Google-Smtp-Source: ABdhPJwvSLyWC0I6T93B9oS67PTbSJUn6WyqSCOV3fLIUwbdT7ACQxzlhlFgAP2/HyefYAw5E1LGh1DUS+MYcXYN/ac=
X-Received: by 2002:ab0:3010:: with SMTP id f16mr5842725ual.11.1635440229545; 
 Thu, 28 Oct 2021 09:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-9-imp@bsdimp.com>
 <e1b16626-1b3f-0867-43ee-ee085a881c21@linaro.org>
In-Reply-To: <e1b16626-1b3f-0867-43ee-ee085a881c21@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 10:56:58 -0600
Message-ID: <CANCZdfozny+iuc1qVBtjzLVDBwF42rdkSM2LnGSVLjB1Z9ODwg@mail.gmail.com>
Subject: Re: [PATCH 08/24] bsd-user/arm/target_arch_cpu.h: Implement data
 abort exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ef0c8405cf6c9948"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Klye Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef0c8405cf6c9948
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 9:29 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
> > exceptions cause a SIGSEGV.
> >
> > Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> > Signed-off-by: Olivier Houchard<cognet@ci0.org>
> > Signed-off-by: Stacey Son<sson@FreeBSD.org>
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
>
> Short-term:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I hope to have the patches that make this obsolete go in this week.
>

I both look forward to that and dread it a little. Should we try to order
our PULL requests
to make less work for both of us?

Warner

--000000000000ef0c8405cf6c9948
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 9:29 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data<=
br>
&gt; exceptions cause a SIGSEGV.<br>
&gt; <br>
&gt; Signed-off-by: Klye Evans&lt;kevans@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Olivier Houchard&lt;<a href=3D"mailto:cognet@ci0.org" t=
arget=3D"_blank">cognet@ci0.org</a>&gt;<br>
&gt; Signed-off-by: Stacey Son&lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/arm/target_arch_cpu.h | 11 +++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 11 insertions(+)<br>
<br>
Short-term:<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
I hope to have the patches that make this obsolete go in this week.<br></bl=
ockquote><div><br></div><div>I both look forward to that and dread it a lit=
tle. Should we try to order our PULL requests</div><div>to make less work f=
or both of us?</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000ef0c8405cf6c9948--

