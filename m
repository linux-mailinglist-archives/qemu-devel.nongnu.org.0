Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B213E8622
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 00:41:45 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDaRM-0006y1-AO
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 18:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaQQ-0006Bi-EQ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:40:46 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaQO-0005RR-0Z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:40:46 -0400
Received: by mail-qk1-x736.google.com with SMTP id t66so290079qkb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 15:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pjq5WjqThEDH0XbPrOivEILeU7e8OJAwIC+/TH1hQB8=;
 b=UeZHWF0IznbcbejF/RSNN8Zq+LUMlqcj2DfPLds9M7oW18SEog5iPkXLyBDUoCXb4Y
 6UOt0szTSqoejIfRtogV9DDOKBq6L/fZ1hTIVNjvvDlRdhm1W4vD3DZBqYqnk+/AdFj4
 Cf9PPVZyBNC0pV4JbKOljmDJ/RcmcOySyqoE2ECu8Wlc6sHXjxc4jsssoy/uiaHcG9jn
 P7aEcRn2XiMB57x80Dft3n8VhvIXuLfDvCuqtgKlLB6vXLkA8i1fFtueYGGxffTnt5Os
 nTar+MGf29KQUNBrx8lMRVkxgqx9e4ovdU67p/q8Rp1zw7/Q3TB73Vg0n1xnHE0Qb0E9
 ZYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pjq5WjqThEDH0XbPrOivEILeU7e8OJAwIC+/TH1hQB8=;
 b=tfsjrrHLrrZ/7teO4HxTiQWEsIzTlCF62Qr/gAk0DDU5oZj8yeDFQzZV6nUBerpd40
 gh6Q7qLzGM0y+BH660gjZgMD9QRsnkWJcMsOBre5vINWufgWrRDOn5vqyddC8ZGJ1DaV
 qzA3V/RnbuseEYKPAK4o9z6pvctLq1tN2oGfXbmlFjcs2uTAXxsZ6oeQM00ZQVTYVqLv
 YWJDPED7MaO7PKRzXLKXI3oHitmW1LcZJnIlwOtWXYMmse74SkXDJI6FUxudRmCOfxuJ
 hCwNbSw/fKPgz5lBBU1gkJ2JiQ5RLkeuUxzOtv/Ficn5p4/iOUtpzVDmIAx2OSyuYt7q
 VNmQ==
X-Gm-Message-State: AOAM530M/O4d8h+KfjqDQUWQKrmhkwXcYEgvhIcwtiafh6CrS8roy6bM
 qeJO8cpDTkLzDKsIpB+nSexVqcibfgPWqPxTpcZsiQ==
X-Google-Smtp-Source: ABdhPJx7ded4V8Osf69LyU/a0dBWhEEDfij9c3DfDtbiZccS/O7wWRAuOLo2l4dFmsB5eGwcsb3wTtk64u0VNHgphBM=
X-Received: by 2002:a05:620a:a11:: with SMTP id
 i17mr13720111qka.359.1628635242753; 
 Tue, 10 Aug 2021 15:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-40-imp@bsdimp.com>
 <4614b70d-4950-6689-82cc-66b743329889@linaro.org>
In-Reply-To: <4614b70d-4950-6689-82cc-66b743329889@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 10 Aug 2021 16:40:31 -0600
Message-ID: <CANCZdfp4uZVyKU46cTF8QD1P82xRqKuVdPDnQYteEvXLN2ptag@mail.gmail.com>
Subject: Re: [PATCH for 6.2 39/49] bsd-user: Need to reset CPU after creation.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001d035f05c93c31dd"
Received-SPF: none client-ip=2607:f8b0:4864:20::736;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x736.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001d035f05c93c31dd
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 10, 2021 at 10:32 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh<imp@FreeBSD.org>
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/main.c | 2 ++
> >   1 file changed, 2 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Slightly amusing that the line was removed in patch 1, because it was
> ifdefed.
>

Worth folding?

And good eye!

Warner

--0000000000001d035f05c93c31dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 10:32 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh&lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
Slightly amusing that the line was removed in patch 1, because it was ifdef=
ed.<br></blockquote><div><br></div><div>Worth folding?</div><div><br></div>=
<div>And good eye!</div><div><br></div><div>Warner<br></div></div></div>

--0000000000001d035f05c93c31dd--

