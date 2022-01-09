Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC53488C48
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 21:29:59 +0100 (CET)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6epC-0003ds-EL
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 15:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1n6enk-0002ln-DM
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:28:28 -0500
Received: from [2a00:1450:4864:20::12f] (port=37570
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scrameta@googlemail.com>)
 id 1n6enj-00007A-0S
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:28:28 -0500
Received: by mail-lf1-x12f.google.com with SMTP id m1so4063678lfq.4
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 12:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+iOB6vnLyJXM5jHLANxbEDzL7q5+QDHGzi6q8S4Joc=;
 b=KjRFyD/NfAHMzx7TBG3ngc3+JJ0u4XzodK/TOLEcTJLtGoGj1RfBRkVhOgOgfOXT8t
 vSh03xVA3/QR+dVCzwXyC+leRDtDfbBjsdbn2Up710/sF9JLkU+wlEi2GHGy/AcwcmZX
 6jxg3+/OoNt070UtIQOnQ0SJ+DMhzOrbK+nHEMSydSoaLXt17HZ1qoyOnLDWt1whBBB5
 eLZlQYRc+5g8WxL4GJwl/mWiUhpTdv68iNJxeI4XtCYx5KlsU4eMUyo1fdJSPS5JsbgF
 yy/+8nX9emaNAEf86S7zLqtsBmxFDIgHwJwiOcauUESZ61USYfHVXI+UMjRChDBkSqNv
 f9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+iOB6vnLyJXM5jHLANxbEDzL7q5+QDHGzi6q8S4Joc=;
 b=2ecJ9ozasg27C8Sr5ZeRDM+DQ3OsbVh3dmuSN7E+6kPaLYgRRqSO36zX9GLNP6wrkO
 jxlHvwQJj7N82N4lBPB+v/C/BjFMseiZd7ZQU5pdGLp2NydbNzrLmzcrw5paGRzC8teL
 ul8xsn/9bT+/UE78J/st2HVCFvN/0hDlEcGPEsrD/Br0esRuBcF9gs1TSLu2T6xndQBQ
 sPfrru/AoGoNw0RZ46LlaqDvWD4uttlo33X5YfDPJ3x0MjGnlz+Tb4ypBUosG1vCQa8X
 zmYQRKf4MzvQ1KBRx9on/RUJjLFJfZtIOo1207yop9Krl2BThz8NiFDhJ3RzUkoYZLl6
 LCPQ==
X-Gm-Message-State: AOAM532A9VYgWu/q6vIEUfL1C8RfWrLZqNC+N5yWO+m/LZxRSmxNSuUp
 8gsEmzrQBGD4qggu2IG1mt47+odU044JpKBTsE0=
X-Google-Smtp-Source: ABdhPJyxeWC3+soQ+eP9MOcVnBHUJhzovEvEAxT6jU83xiMO4/sPi9bA9Citv9DwWkb9YPKS1w6ONxEXGoQ9wv5vjd0=
X-Received: by 2002:a05:6512:3b24:: with SMTP id
 f36mr64348753lfv.545.1641760104769; 
 Sun, 09 Jan 2022 12:28:24 -0800 (PST)
MIME-Version: 1.0
References: <CAOG2ctwLQhtezS80vKWZOJQs5k4qr3PsD2UK+cx8Ce+Sa_HRww@mail.gmail.com>
 <CAFEAcA-67WPBrZsnOE10UmrEq3ce5LvuiL3VT9TfSffnM-_UaQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-67WPBrZsnOE10UmrEq3ce5LvuiL3VT9TfSffnM-_UaQ@mail.gmail.com>
From: Mark Watson <scrameta@googlemail.com>
Date: Sun, 9 Jan 2022 21:28:13 +0100
Message-ID: <CAOG2ctyBb7MbJB=1jSCbDLFydJAUpkj=cp6+gC5mp9GmJrktsw@mail.gmail.com>
Subject: Re: New arm alignment issue with 6.2.0 - bisected to single revision
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d9eb5105d52c0f2c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=scrameta@googlemail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000d9eb5105d52c0f2c
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jan 2022 at 18:09, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 29 Dec 2021 at 20:15, Mark Watson <scrameta@googlemail.com> wrote:
> > I'm seeing a repeatable alignment exception running m68k system mode on
> armv7l (arm cortex a9) following this commit:
> > "fa947a667fceab02f9f85fc99f54aebcc9ae6b51 is the first bad commit
> > commit fa947a667fceab02f9f85fc99f54aebcc9ae6b51
> > Author: Richard Henderson <richard.henderson@linaro.org>
> > Date: Thu Jul 29 10:45:10 2021 -1000
> >
> > hw/core: Make do_unaligned_access noreturn
>
> cc'ing Richard as this was his commit. Do you have a repro case
> (QEMU command line, any necessary files/images, etc) ?
>

I've just been trying but unfortunately do not yet have a simple enough
repro case to send. I have a custom machine which is backed by an fpga
version of the amiga hardware. It's somewhere fairly early in running the
amiga system rom. I'll keep trying to get something simple.

Thanks,

Mark

--000000000000d9eb5105d52c0f2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 6 Jan 2022 at 18:09, Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, 29 Dec 2021 at 20:15, Mark Watson &lt;<a =
href=3D"mailto:scrameta@googlemail.com" target=3D"_blank">scrameta@googlema=
il.com</a>&gt; wrote:<br>
&gt; I&#39;m seeing a repeatable alignment exception running m68k system mo=
de on armv7l (arm cortex a9) following this commit:<br>
&gt; &quot;fa947a667fceab02f9f85fc99f54aebcc9ae6b51 is the first bad commit=
<br>
&gt; commit fa947a667fceab02f9f85fc99f54aebcc9ae6b51<br>
&gt; Author: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; Date: Thu Jul 29 10:45:10 2021 -1000<br>
&gt;<br>
&gt; hw/core: Make do_unaligned_access noreturn<br>
<br>
cc&#39;ing Richard as this was his commit. Do you have a repro case<br>
(QEMU command line, any necessary files/images, etc) ?<br></blockquote><div=
><br></div><div>I&#39;ve just been trying but unfortunately do not yet have=
 a simple enough repro case to send. I have a custom machine which is backe=
d by an fpga version of the amiga hardware. It&#39;s somewhere fairly early=
 in running the amiga system rom. I&#39;ll keep trying to get something sim=
ple.</div><div><br></div><div>Thanks,</div><div><br></div><div>Mark<br></di=
v></div></div>

--000000000000d9eb5105d52c0f2c--

