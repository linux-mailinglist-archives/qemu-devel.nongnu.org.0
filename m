Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447714C56CA
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 17:26:45 +0100 (CET)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNzu7-0002hA-Rp
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 11:26:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nNzsW-0001Gb-LD
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 11:25:04 -0500
Received: from [2607:f8b0:4864:20::e32] (port=36856
 helo=mail-vs1-xe32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nNzsU-0006WS-3Z
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 11:25:04 -0500
Received: by mail-vs1-xe32.google.com with SMTP id e26so8726214vso.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kq1kcOg10t565R3Q//rizC2Z7i5Pgw7FCBf5eOdrI/A=;
 b=8MT9josYozy8SFlAzt09I7Dw6qq2DpXzYQYhtxxamEjp4nMm67tIi/n59xwq+T4H/n
 iW7GAF0kOfKJeDv4shFpSuJMDBJJ2oUh3xQP7Nshv2NCjTKrK2+kSkjmPD8N6AsBpqWy
 6kLobq7P0ArV2b60h/q+YO4eZF3B4K3ii4eFEv6WOYTyBlvOhNBmvz+MykV/50Lgpko+
 /496hVd6sSEy7jIiiRwHG7E6paPprSgQx9zCaBpxlHyYhFuLhOlZz37iwRZ2oXFe90go
 67LnLXFHQaZFbT60bWJfNvalikqRlQYFOk/GPoC7isBHfrFuywgrzcMbdrWMerQpc3Zi
 OLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kq1kcOg10t565R3Q//rizC2Z7i5Pgw7FCBf5eOdrI/A=;
 b=e869mpscTfWvSFZmByr6U+5jWCBxxPUHgkRMsQubVDHcdHrvNxaedK5abgCTKTRAM8
 X/xg05/WInSNatf60W/RH5z8dVz5aF8QcCl2rKLhkcxQGVSEBkfkMomUyANti7auZW0N
 fsZC8zVnLYENM1OTT5tems8Q0TwpA2T6mr+qArfoXpxrYQ4zDio2qFPo3YmpGVK0pY2J
 b2nHvC9KFMnsRQveMq2QlumRabK+vyGlyCShca96blZJf3IjolBX3Ak97glrFPP0viyg
 KqJT73Mpy+dw9+1BRSuKHGXCf11tLbXGg3ua8pd7Um4FZ9khGMYItrfDNJ8LPEVfa8MM
 pCUw==
X-Gm-Message-State: AOAM533QhmzWT3U2miohOmhdqq5BcNSGqPol+i1iVffxd3PXaUlmgVNp
 bCmawRruLDshMoQdOR0UdsftMQnFvJsCgoA3QXO1YQ==
X-Google-Smtp-Source: ABdhPJz10nF5EJ2uf0FAJ882r7qwVKracyQh1ZfjczKN90/zYoVQRq0OilJ8Sx4aEkgn/qrZffjrPO8w+OjpLt6FFg8=
X-Received: by 2002:a05:6102:6c7:b0:31a:da3b:e9fe with SMTP id
 m7-20020a05610206c700b0031ada3be9femr5172548vsg.68.1645892699672; Sat, 26 Feb
 2022 08:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-14-imp@bsdimp.com>
 <021f966e-b664-b27f-f24a-fc6dc9f960bb@linaro.org>
In-Reply-To: <021f966e-b664-b27f-f24a-fc6dc9f960bb@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 26 Feb 2022 09:24:48 -0700
Message-ID: <CANCZdfpiBNTygi77SzE2vy34+0sjPqHdaoYz7dZMBSkgOBb+tw@mail.gmail.com>
Subject: Re: [PATCH 13/22] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b3e88305d8ee4163"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::e32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
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

--000000000000b3e88305d8ee4163
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 10:43 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/1/22 22:14, Warner Losh wrote:
> > +#ifndef BSD_FILE_H_
> > +#define BSD_FILE_H_
> > +
> > +#include <sys/types.h>
> > +#include <sys/mount.h>
> > +#include <sys/uio.h>
> > +#include <fcntl.h>
> > +#include <poll.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
>
> Many of these should be done by "qemu/osdep.h" already.  Otherwise I
> question putting them
> into this header, as opposed to as needed by other syscall handling c
> files.
>

Indeed. None of these are needed here. I've removed them.

--000000000000b3e88305d8ee4163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 10:43 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/1/22 22:14, Warner Losh wrote:<br>
&gt; +#ifndef BSD_FILE_H_<br>
&gt; +#define BSD_FILE_H_<br>
&gt; +<br>
&gt; +#include &lt;sys/types.h&gt;<br>
&gt; +#include &lt;sys/mount.h&gt;<br>
&gt; +#include &lt;sys/uio.h&gt;<br>
&gt; +#include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
<br>
Many of these should be done by &quot;qemu/osdep.h&quot; already.=C2=A0 Oth=
erwise I question putting them <br>
into this header, as opposed to as needed by other syscall handling c files=
.<br></blockquote><div><br></div><div>Indeed. None of these are needed here=
. I&#39;ve removed them.=C2=A0</div></div></div>

--000000000000b3e88305d8ee4163--

