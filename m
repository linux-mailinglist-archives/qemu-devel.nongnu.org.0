Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56788541F7A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:26:39 +0200 (CEST)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyias-0002TR-DN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyhBp-0005T8-ML
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:56:41 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:41576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyhBn-0003gt-0W
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:56:40 -0400
Received: by mail-vs1-xe33.google.com with SMTP id r12so15274175vsg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFywBcFY28WjAfOJLlEoPcB/eo0G+XB+E4yXrBM6vaQ=;
 b=kg00tRI8IA9A83m++WI8xhAD/qkn0hLtfKVlcPm+VhnDvP6owjfVqXvglgZUxMDt88
 Vd1WgryKwHhRsyucdEYFvW/pRlG1BSAOgfC6iE0nvwaiOeBdB2b6QM9j1fbmcx7cT+z2
 0wYBHhJcoJRZvb347UXmVKNIcnE/xNERe2HCQhZQOjgj6dzZJM2tKppIaueEG21rXY3O
 djiEahd0TsZbFKOrNZ06a7Z5FEJkDxOO3LlGquZGp64wtYtqvs8zOllaE5P9xu+LOcHf
 FTFr2dRP9Fci3j9no0BTFtWiDRiccpEu33UjTKXlEJm/tE2/saIHWKcxN7qjTs2eZ6Ve
 5Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFywBcFY28WjAfOJLlEoPcB/eo0G+XB+E4yXrBM6vaQ=;
 b=KUolp703CTJ1lSh3awK5JoVPlx9H37RiINliLTqC+T/jeKQoFtZ6F4PfD/ABIfL5CV
 iJq3sw9ps6UfSdByMaWA6bgGFLkqP8HNFOHkBqk9o1V4IFF8ZaGvBg+5S4I9UbUBxmTl
 jhujTT9KQ1bDvL2LW1EdgOxf6XoH5BBbq9WnlcqGv6Vy81GbNajHCNdoFtv4iuR1I1uX
 vvely1BJQIzBLfJIsRgqRHVBr6NZZJh19Memz21M+cI++QuNiqwxFhkXCaPRfzYSvVuk
 fToDQNj5VMkNi0+i4SQNV7qb6hGIgej4qu+z+G5EsLrgbOSwXOiOaVrqQXFIQW25fByh
 3bEA==
X-Gm-Message-State: AOAM5323z/RiB69he0S4o1bKshTRnDS5a0miv14UMgCEEk1WspHlCrqP
 ilXI5KivDF5zZsnmLKw11gS1H1EUXjh0XZHwtMtEBQ==
X-Google-Smtp-Source: ABdhPJwt3n4dVUZf8Dzjqh76a+//VPM9TT+gvXahOqfL1J/oj5w13fTSX/kkSAopURK/dSVvZp0OPKsy97f/2CrvTCw=
X-Received: by 2002:a05:6102:3f49:b0:335:d6cb:f2e4 with SMTP id
 l9-20020a0561023f4900b00335d6cbf2e4mr13816586vsv.12.1654638997984; Tue, 07
 Jun 2022 14:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-4-imp@bsdimp.com>
 <d00133d6-4c1f-637e-6a36-a68558bbefb0@linaro.org>
In-Reply-To: <d00133d6-4c1f-637e-6a36-a68558bbefb0@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 7 Jun 2022 14:56:27 -0700
Message-ID: <CANCZdfrqWiK15nHzDu8GyyYCGX8=HBAuNVg7LKRt7EX7FweynQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gleb Popov <arrowd@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000b4f17805e0e2a9d8"
Received-SPF: none client-ip=2607:f8b0:4864:20::e33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe33.google.com
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

--000000000000b4f17805e0e2a9d8
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 2:34 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/7/22 13:14, Warner Losh wrote:
> > +static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
> > +                                abi_long arg2, abi_long arg3, abi_long
> arg4,
> > +                                abi_long arg5, abi_long arg6, abi_long
> arg7,
> > +                                abi_long arg8)
> > +{
> > +    abi_long ret;
> > +
> > +    switch (num) {
> > +    default:
> > +        gemu_log("qemu: unsupported syscall: %d\n", num);
>
> qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>

Agreed.


>
> > +#ifdef DEBUG
> > +    gemu_log("freebsd syscall %d\n", num);
> > +#endif
>
> Drop this.  It's redundant with strace.
>

Yea, it was a quick hack in the past that the wrapper function highlighted
nicely..


> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


Thanks!

Warner

--000000000000b4f17805e0e2a9d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 2:34 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 6/7/22 13:14, Warner Losh wrote:<br>
&gt; +static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_long arg2, abi_long arg3, ab=
i_long arg4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_long arg5, abi_long arg6, ab=
i_long arg7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_long arg8)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (num) {<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gemu_log(&quot;qemu: unsupported syscall:=
 %d\n&quot;, num);<br>
<br>
qemu_log_mask(LOG_UNIMP, &quot;Unsupported syscall: %d\n&quot;, num);<br></=
blockquote><div><br></div><div>Agreed.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +#ifdef DEBUG<br>
&gt; +=C2=A0 =C2=A0 gemu_log(&quot;freebsd syscall %d\n&quot;, num);<br>
&gt; +#endif<br>
<br>
Drop this.=C2=A0 It&#39;s redundant with strace.<br></blockquote><div><br><=
/div><div>Yea, it was a quick hack in the past that the wrapper function hi=
ghlighted nicely..</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;</blockquote>=
<div><br></div><div>Thanks!<br></div><div><br></div><div>Warner</div></div>=
</div>

--000000000000b4f17805e0e2a9d8--

