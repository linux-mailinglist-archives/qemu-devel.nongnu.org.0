Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94436A8CA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 20:15:53 +0200 (CEST)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lajIO-0007az-Iw
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 14:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lajDQ-0005Xy-98
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:10:44 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lajDO-0004HI-2d
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:10:43 -0400
Received: by mail-qt1-x82f.google.com with SMTP id 18so26667411qtz.6
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KRyHzXBgFSXuJm1y1vQjnbW2YGwDStJGFAwmnKHJ2ZM=;
 b=bo9D9iXCRa3Pb6TGWYZXFBCNi4bl2lDp4ndn+xtPCZ3RfJ2LrZgAa16aMVhXYTHpbf
 Fqtlm9383F4PD0XBwEDYvef4tPckaKSP8z8ONKXMe5sXbv4+S89tS8zU9rcGur74lMJO
 alWgKICR8SQgjSChlpbaEbrsyNsdIpO8odybHxogrRVN8xWMnQAf78xiJxCm26hCq6x/
 BT3QeOT4TVtd0em/0LTQhLbtTz6mJUhuYrjWDicNo+UcA89Vz1PqTPZf30WEEMFDU+K1
 LW5UjAFaAs/FmfyFGuV+y2lSHMC5h4UAAXTuLSNA9ANwpdTfXFv2hPHPvd4JY8w/V7GK
 KJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KRyHzXBgFSXuJm1y1vQjnbW2YGwDStJGFAwmnKHJ2ZM=;
 b=NCEpN8ibI5QgK+EUhOVw+qwVlEe5wRJO9G9l0ptWPn1XxZvcxPkkfELeNIICEDmZCJ
 PY11/JvgZgZUtTqurHek54drtEpAne4f4vOv7kkY9j+9iWgixhA8nWSnosaK7GYRIQNe
 fWVO7GV550O5+AQCuNrpJdNeBLu21F/foKHxqoq0GiaXR8HJ0Y09uFG8wfXnmr+P3Oj4
 zF9j+HZefNOl/zHP78yVvOGBZ942F3zKWuSSEmA+cGG0vehdCtlU/r8TJ8Q922TTytww
 MgnJKblhFO1AlivX/dzN0FTmxdCGLF7MYcD506Rm+IZ3xsaUWcZ7nwttOnWXUuepdvA5
 /Qtg==
X-Gm-Message-State: AOAM530yz5UduNQ8gQVOOhaCt6LArq1gJFtAt6LXUAgTz3Ed9e7jzMLH
 Tz9t/XJSVAqan+M4Hjp+y8WEBRPaabwlN+GpukbbQEgwXsEMBA==
X-Google-Smtp-Source: ABdhPJxSqEApN8yDsAtxrxg6jekqxvAmJ1cbmawT1hBiyA1EFXLbRSA9M2QCd/fKTpMvyxkGcjA50TYTwcBMU51VvyQ=
X-Received: by 2002:ac8:675a:: with SMTP id n26mr985070qtp.101.1619374240662; 
 Sun, 25 Apr 2021 11:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210425155749.896330-1-richard.henderson@linaro.org>
 <20210425155749.896330-6-richard.henderson@linaro.org>
In-Reply-To: <20210425155749.896330-6-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 25 Apr 2021 12:10:29 -0600
Message-ID: <CANCZdfocSi8ioMU82=h8=fmuCkn68jEOv1zu1RK8kQyYpn5OyA@mail.gmail.com>
Subject: Re: [PATCH 5/8] linux-user/sparc64: Move sparc64 code out of sparc32
 signal.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005f9a9b05c0cff2e5"
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005f9a9b05c0cff2e5
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 25, 2021 at 10:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The bulk of the code goes to sparc64/signal.c, with
> TARGET_SPARC_BIAS going to target_cpu.h, as we will
> shortly need this define beyond signal.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/target_cpu.h |   6 +
>  linux-user/sparc/signal.c     | 280 ----------------------------------
>  linux-user/sparc64/signal.c   | 278 +++++++++++++++++++++++++++++++++
>  3 files changed, 284 insertions(+), 280 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--0000000000005f9a9b05c0cff2e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 25, 2021 at 10:03 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The bulk of the code goes to sparc64/signal.c, with<br>
TARGET_SPARC_BIAS going to target_cpu.h, as we will<br>
shortly need this define beyond signal.c.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/sparc/target_cpu.h |=C2=A0 =C2=A06 +<br>
=C2=A0linux-user/sparc/signal.c=C2=A0 =C2=A0 =C2=A0| 280 ------------------=
----------------<br>
=C2=A0linux-user/sparc64/signal.c=C2=A0 =C2=A0| 278 +++++++++++++++++++++++=
++++++++++<br>
=C2=A03 files changed, 284 insertions(+), 280 deletions(-)<br></blockquote>=
<div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdi=
mp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0<br></div></div></div>

--0000000000005f9a9b05c0cff2e5--

