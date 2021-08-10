Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2203E861A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 00:35:40 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDaLT-0003cD-OI
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 18:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaKa-0002vi-Ky
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:34:44 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaKZ-0001MJ-6g
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:34:44 -0400
Received: by mail-qk1-x72b.google.com with SMTP id f12so166425qkh.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9Vf/B1e9N9x7bMjMgOM4ZS6EG21B+/baUalZ/QbgjQ=;
 b=Rm2ygwRGZYatuneHzTzDIruC2BpE1zdTpheBLBr98aDCmucQ5k58oJZ93+MLOgsd+Y
 VoAigej3rgXR4ZXpl9QjWkah1a26XtxDJ+jx1kroCAmn/ShgBJ+GHoo8egMNL9drrx0E
 1QCCcWRQ5/fIwzETpZgAD3xQr96A5cG3oSqq61Vkgg/oUKClMBYpVxr9TJJBXktoRQ3y
 7L8lfRDZWU6wUlaz7dBlO8qRfszjva6dmVtDzrn/O/Bw15W7pLf6I71uxT97WgPksso5
 Q0xn7v5Cd9HyTxltvirNTTWk3f+7u2x97ULlFrVE3pthwqnz1IpjKiZBtnh3O5D1yMUK
 fV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9Vf/B1e9N9x7bMjMgOM4ZS6EG21B+/baUalZ/QbgjQ=;
 b=ipu1Tj1DdOqA0CJxL+IHBqV1diujsmW/NhpvWGwuH2d6Hyav+Z7ZfXSunE4T57SZz4
 6UGMErwzGnwm/WvTKAm1BLsTdlPACq/phgLlnhCD5CMdNKYwcJgFF9aVvPWhoixBH2UG
 aAjy0lNEfX8V/cfIM2xi5G6E4/ekTXDILfWUM1vsfHG8jrxwVpuXR7diVaJzfQ6C7CI8
 pwGER07xpirQY5uzSVQkz7dKmoWOvCw/XNUVFOoeM/tR/GGe7+AXAEhuCeAVlL6tKqNU
 XU7HUzpia43zpIk+OksHMECkKWI5IrJVZA1r7V4lDbUCspqmb9Nq4Q2wiTsQiigLcA1d
 G2Ww==
X-Gm-Message-State: AOAM533Mwzxa99zF1pJ8QMDBpsNhUEdLufAHUQt/55HctIDqf+aaMccs
 77JCInRcFZtLf0MJhSWk/e3vjx5DgUm4UBjBPQxVGg==
X-Google-Smtp-Source: ABdhPJxCjTOOEMkcHp6Q+jguegD3zO1lUIQI65dQxuEo2lgqJkSisYDQTweGT7+ipSlrK0h2bAN/lGoGqWBUHKNe8Aw=
X-Received: by 2002:a37:7806:: with SMTP id t6mr23088007qkc.44.1628634881719; 
 Tue, 10 Aug 2021 15:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-38-imp@bsdimp.com>
 <426c50f9-0f17-ab31-0964-a8a6461bbd92@linaro.org>
In-Reply-To: <426c50f9-0f17-ab31-0964-a8a6461bbd92@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 10 Aug 2021 16:34:30 -0600
Message-ID: <CANCZdfo80jhQw4BOK=5nfZtyer+G0tp=_fyPM_GeW2YGNYwBmA@mail.gmail.com>
Subject: Re: [PATCH for 6.2 37/49] bsd-user: update debugging in mmap.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009811b705c93c1b97"
Received-SPF: none client-ip=2607:f8b0:4864:20::72b;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72b.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Sean Bruno <sbruno@freebsd.org>,
 Warner Losh <imp@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009811b705c93c1b97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 10:19 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh<imp@FreeBSD.org>
> >
> > Update the debugging code for new features and different targets.
> >
> > Signed-off-by: Mika=C3=ABl Urankar<mikael.urankar@gmail.com>
> > Signed-off-by: Sean Bruno<sbruno@FreeBSD.org>
> > Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/mmap.c | 49 ++++++++++++++++++++++++++++++------------------=
-
> >   1 file changed, 30 insertions(+), 19 deletions(-)
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks


> For the to-do list: convert to qemu_log_mask or tracepoints.
>

Will do. Should I create a bsd-user/TODO file with all these in it (or
rather, should I
upstream the one I've already created)?

Warner

--0000000000009811b705c93c1b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 10:19 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh&lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Update the debugging code for new features and different targets.<br>
&gt; <br>
&gt; Signed-off-by: Mika=C3=ABl Urankar&lt;<a href=3D"mailto:mikael.urankar=
@gmail.com" target=3D"_blank">mikael.urankar@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Sean Bruno&lt;sbruno@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans&lt;kevans@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/mmap.c | 49 ++++++++++++++++++++++++++++++-------=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 30 insertions(+), 19 deletions(-)<br>
<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockquote=
><div><br></div><div>Thanks</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
For the to-do list: convert to qemu_log_mask or tracepoints.<br></blockquot=
e><div><br></div><div>Will do. Should I create a bsd-user/TODO file with al=
l these in it (or rather, should I</div><div>upstream the one I&#39;ve alre=
ady created)?</div><div><br></div><div>Warner=C2=A0</div></div></div>

--0000000000009811b705c93c1b97--

