Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925114A6917
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:11:06 +0100 (CET)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3En-0006pr-5u
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2Yh-0005Ju-MU
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:27:35 -0500
Received: from [2607:f8b0:4864:20::92f] (port=34349
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2Yf-0004Rj-Lc
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:27:35 -0500
Received: by mail-ua1-x92f.google.com with SMTP id y4so16135277uad.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BK2prcw/0Z6Vwmf3ztPdp1tC56+f5xlGh5ssJkvR/pE=;
 b=UCkx4kDuF67lYDFB9o+9TRyuBD/jbYthQfe1AEq2eeF37pI3hALmo7B0zqTZ106O2q
 dDOJ/yVhRGOIvXO1edqE3K6BY2d9wKTXkJ+FiYO62S56xfPgXSWkpw5CUYDabvKcQfvo
 LErffs7fHa+je9hHxLtRGqsJuLkeZOQ3Q3igOILi9yd3in9WvTr9xPem1AL1oWUNhb4g
 Nq5DO+USBPm1pq0OB1JWHvVvxEY+B7S/AHlBEhBzpels8ToYKqO9R0uW9jLOxZOY8lqC
 MLPbvWH+VRakhKx20rCT1mvys7ZRRp8Gt4A7C+i8e8W2TQwnfMU1yL7gcQMdZgsOG2em
 DgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BK2prcw/0Z6Vwmf3ztPdp1tC56+f5xlGh5ssJkvR/pE=;
 b=k57Pp0pSsB6jSBElPzalZtmsLLbAW/j0g5BpOUe1HdkWcp5+CSFqp//UZBP/BkXN4g
 6YYKtoghg0tmHMDdgPlHEDrDTpnUfuWfwfYQM3KkWp0OWYP6SIRIe3vlhUmPatW0dxy1
 kvWI2kbqORlvTye9DIHQqKDOCxaO12RsK0+H1NDCh19T6VsFwtV58/mYWeubmI6TcBDT
 oe25684dXqbt/zqbRCo+zEqzIOzZGibvpZSvwVKB4vh16Qo3ciIHM7dxy2KwSKddh8cB
 t82ZFWQLp5WlKuGOrFRKyWP5bmnY1kJUOg3AeeXj8ym4b3+YIjmy1O9/VDNWgSoSts1Z
 0SQg==
X-Gm-Message-State: AOAM531baYXH+QgvpAEgH0N6gB53dWrSI2MvnJp1eYfmk5Sm0ful2i9o
 6IvQrMAK3JB5lk5RoAXR7qwdl0OTWoEARAYJyyM/0A==
X-Google-Smtp-Source: ABdhPJzHRj9PJymhi+sZm53ish+R8N9seHD4VBNg8ynU0k4bypjry23fObw64HSWwlmv0A/J/XhsFP5yIJhEZD5ycpI=
X-Received: by 2002:ab0:b3:: with SMTP id 48mr10543607uaj.85.1643758052444;
 Tue, 01 Feb 2022 15:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-13-imp@bsdimp.com>
 <e4f4935b-f591-5062-fae2-bbdddd677d1a@linaro.org>
In-Reply-To: <e4f4935b-f591-5062-fae2-bbdddd677d1a@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 16:27:21 -0700
Message-ID: <CANCZdfqVGGYmN_7siNV1hzZ8KF4fW0t6fQ1x-Gt8VJ=5b2C5rQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] bsd-user/freebsd/os-syscall.c: Add get_errno and
 host_to_target_errno
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d01f3e05d6fd3ed7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Popov <arrowd@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d01f3e05d6fd3ed7
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 10:40 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/1/22 22:14, Warner Losh wrote:
> > +/*
> > + * errno conversion.
> > + */
> > +abi_long get_errno(abi_long ret)
> > +{
> > +
> > +    if (ret == -1) {
>
> Watch the extra blank lines.
>

Will do.  It's a FreeBSD fetish that has infected this code... :)


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks!

Warner


>
>
> r~
>

--000000000000d01f3e05d6fd3ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 10:40 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/1/22 22:14, Warner Losh wrote:<br>
&gt; +/*<br>
&gt; + * errno conversion.<br>
&gt; + */<br>
&gt; +abi_long get_errno(abi_long ret)<br>
&gt; +{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
<br>
Watch the extra blank lines.<br></blockquote><div><br></div><div>Will do.=
=C2=A0 It&#39;s a FreeBSD fetish that has infected this code... :)</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Thanks!</div><div><br></div><div>Warner</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000d01f3e05d6fd3ed7--

