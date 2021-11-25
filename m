Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026945D822
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:19:32 +0100 (CET)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBql-0004o4-Kg
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqBox-0001ya-QE
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:17:39 -0500
Received: from [2607:f8b0:4864:20::92f] (port=38476
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqBou-0000gj-RS
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:17:39 -0500
Received: by mail-ua1-x92f.google.com with SMTP id w23so11202455uao.5
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hNSY8P7cf0dwTXCHFL28N+5Nuw5WKfmOBvnENPOEisc=;
 b=rludKHQwqSf8G9DMzpwwYSDruaCApaIoa8mKWP6O478FoL+NF+Q8VcKYLNA0ttLRZJ
 IgGCA7cca0A/LEKootoDEQ9r32PMFH+vRKPTDWYR1u40GYNlpKm6b8dmJyYGdU0RsSms
 GfS0PqLtkXxejW5im0kqFd+iH5BLwWMvg8/cq6p9hKyX/1OMl9b+yMJA/jYlhR7ZoSOD
 wYWCBCjPjluhwdcHRtTOe2c2gdRulr+QSbGspBhBci6FVWA2yS/xWijizVy5mX5K0B5m
 rA+v26i8SxafzMLWfvcK61J2b9IKYhkjk04wZBCwEHleMB8lAaGO97ByB2a9FYI9h4mh
 8uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hNSY8P7cf0dwTXCHFL28N+5Nuw5WKfmOBvnENPOEisc=;
 b=y1WjYIxUJoNFB3+IoNsrkpYwXQqXuPqh1Rp5dlIAfY+/PiPqXA0S2Pc/AKSYXRt2rw
 2RvPr1Y4iCzwyFJ2Q4mjWacMGbDu+Rs1+llhJ4J7A4m5MGQuXVkIbrT7god/FFRDdi5I
 ruJ/iX1/fheDIhWBBCkbicwipWXl2YxirNZXlgSPk6czp7Uc/eXbbMmWssL/HCvmzkcO
 7B9g7fXaD9g8r49Nge2ZZ5VDb/tGKtDHckWLBmytTWac79i+lwW+Dwdmn8zN6T1zkRl4
 BJEZht79n1GqhK2W7APK3eK85j+jAo8Uz4wC8KQDkpRS08z+CJT+Ez89pQjmQ7rKW09c
 k2xw==
X-Gm-Message-State: AOAM5325k/aSrSkTEt4fZ05G1aig7UHMvJAi//wT/23uzfMjt8nC4CwA
 FVUs7swvlL/OC/Gh5LeG12FZOXRi1jSTYsip9LWyaw==
X-Google-Smtp-Source: ABdhPJyi1fPw5B/4HrLmIwLwetPNgueXKHrFxJwZ7QfN3JEdPuU2qwjhSbdcCxsICEmShyU9w6EqDC4jR8kb5NdQhX4=
X-Received: by 2002:a67:ec8f:: with SMTP id h15mr7527743vsp.42.1637835452255; 
 Thu, 25 Nov 2021 02:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-2-richard.henderson@linaro.org>
In-Reply-To: <20211123173759.1383510-2-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 25 Nov 2021 03:17:20 -0700
Message-ID: <CANCZdfpDXzNdDtQ47-Eq8+qX6uYC1aacPX6gf9ie8AjwEQDNaQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/16] linux-user: Untabify all safe-syscall.inc.S
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000055229a05d19a489c"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055229a05d19a489c
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 23, 2021 at 10:38 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 110 +++++++-------
>  linux-user/host/arm/safe-syscall.inc.S     | 134 ++++++++---------
>  linux-user/host/i386/safe-syscall.inc.S    | 158 ++++++++++-----------
>  linux-user/host/ppc64/safe-syscall.inc.S   | 134 ++++++++---------
>  linux-user/host/riscv/safe-syscall.inc.S   | 114 +++++++--------
>  linux-user/host/s390x/safe-syscall.inc.S   | 140 +++++++++---------
>  linux-user/host/x86_64/safe-syscall.inc.S  |   2 +-
>  7 files changed, 396 insertions(+), 396 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--00000000000055229a05d19a489c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 23, 2021 at 10:38 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Suggested-by: Peter Maydell &lt;<a href=3D"mailto:peter.=
maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/aarch64/safe-syscall.inc.S | 110 +++++++-------<br>
=C2=A0linux-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0| 134 +++++=
+++---------<br>
=C2=A0linux-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 | 158 ++++++++++=
-----------<br>
=C2=A0linux-user/host/ppc64/safe-syscall.inc.S=C2=A0 =C2=A0| 134 ++++++++--=
-------<br>
=C2=A0linux-user/host/riscv/safe-syscall.inc.S=C2=A0 =C2=A0| 114 +++++++---=
-----<br>
=C2=A0linux-user/host/s390x/safe-syscall.inc.S=C2=A0 =C2=A0| 140 +++++++++-=
--------<br>
=C2=A0linux-user/host/x86_64/safe-syscall.inc.S=C2=A0 |=C2=A0 =C2=A02 +-<br=
>
=C2=A07 files changed, 396 insertions(+), 396 deletions(-)<br></blockquote>=
<div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdi=
mp.com">imp@bsdimp.com</a>&gt;=C2=A0</div></div></div>

--00000000000055229a05d19a489c--

