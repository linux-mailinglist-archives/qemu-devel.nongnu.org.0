Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4A3DF02D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:22:04 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvIx-0004u4-9D
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mAvHR-0002et-E1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:20:29 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mAvHP-0006Co-BW
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:20:29 -0400
Received: by mail-qk1-x731.google.com with SMTP id o13so19949638qkk.9
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gyRXEUQcIdUPz7E/82ZFg1gUGueqSLdbQqUkp1Bh9Ks=;
 b=SuxAlpa4mkphx2pwVjQNKu/991BqPRbugVbagihDuSDECnbr8WIj8wbyg32/XBGFKJ
 zpnLlHNuAQJNxpvkQY8yxFzMkiZRXL+uGOyCNlhCtmOEYNnbvJoy3YvOV651nNPBBEad
 apCKsT708oMuwPXMmOWgJkKzf2oelV1eBiAxY8T3nW06l/YrLcTf0NCOXJHO6MgJX3+k
 1Rw9s3N7FWMh/WJPSgsvONY9hn9SKifnburYds/LtrvRrXIgYTJrRQ6SwleM7Kp3ibhK
 ykAUWYyy4hdUevrkWAAZRz48fh00guOfi/2BbeUu4q3oT7BhB2YL3sKX+INN/mS/8Jvm
 YD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyRXEUQcIdUPz7E/82ZFg1gUGueqSLdbQqUkp1Bh9Ks=;
 b=RXXqfu2P9lx8Fi6WH8BKBvxq7Vrnr3+gh79HpM6bHqbCn5ipVAiEXIkkOxNHe0/C7d
 0JjhWo58yt7GDJCaqKSBwymhVV+M2zfS+hN9RaB4oK85Ke7rm96sWaBbBwyZphEuvofI
 dqDhYhKZ6eAUOfKP6svMDmxs1kXi7+jb+5t2IVvkdhXki7KNOxIHEJ3jr2GI6KygEjwQ
 zs4I/L7zqxWzx9rPgzWtxituWKqI5m4DoR6pe9dickvsGtEAtHAKBRvD9L4pIp6HLcd5
 NAjGztT1gT0DKD4ekAR7oqhUdngGUx/IH3V20mnEfFpIdDql1iq17lWIoTlsol6KKX6y
 q4RQ==
X-Gm-Message-State: AOAM5324UAOipOayJwP+ns00BUrWokp0H9saFozTN9YVd1+ItItEtcld
 1oBjDyJMWftHr3NQIQQqlnxfxRYERwleFv/leww8Zw==
X-Google-Smtp-Source: ABdhPJzSorGJclH/PiJ2SAuIVDAvRcNwODSD745dg+JMR+wqiPO8mxHUTzqBn9INwWa2dYc1XOZDDjq+rkxU0Jc4lSU=
X-Received: by 2002:a05:620a:5f6:: with SMTP id
 z22mr20554804qkg.195.1628000426195; 
 Tue, 03 Aug 2021 07:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-3-alex.bennee@linaro.org>
 <CANCZdfr+LLSiXZcmUHyNJNuLkb60StWJpWwtvQw2GY3+TwoHrw@mail.gmail.com>
In-Reply-To: <CANCZdfr+LLSiXZcmUHyNJNuLkb60StWJpWwtvQw2GY3+TwoHrw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 3 Aug 2021 08:20:15 -0600
Message-ID: <CANCZdfrnStM7-4qrO8FOhU3NnoRsBvJzrH5C=PdrwLfaLsDxDg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] tests/tcg/sha1: remove endian include
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000190db705c8a8630a"
Received-SPF: none client-ip=2607:f8b0:4864:20::731;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x731.google.com
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
Cc: fam@euphon.net, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000190db705c8a8630a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 7:55 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Tue, Aug 3, 2021, 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>> This doesn't exist in BSD world and doesn't seem to be needed by
>> either.
>>
>
> Sys/endian.h is common. FreeBSD has endian.h, but others don't.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Warner Losh <imp@bsdimp.com>
>>
>
> Acked by: Warner Losh <imp@bsdimp.com>
>

On second thought, this is

Reviewed by: Warner Losh <imp@bsdimp.com>

since I know the change is good.

Warner


> ---
>>  tests/tcg/multiarch/sha1.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
>> index 87bfbcdf52..0081bd7657 100644
>> --- a/tests/tcg/multiarch/sha1.c
>> +++ b/tests/tcg/multiarch/sha1.c
>> @@ -43,7 +43,6 @@ void SHA1Init(SHA1_CTX* context);
>>  void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t
>> len);
>>  void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
>>  /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D end of sha1.h =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>> -#include <endian.h>
>>
>>  #define rol(value, bits) (((value) << (bits)) | ((value) >> (32 -
>> (bits))))
>>
>> --
>> 2.30.2
>>
>>

--000000000000190db705c8a8630a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 7:55 AM Warner=
 Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"=
><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Aug 3, 2021, 5:02 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:ale=
x.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This doesn&#39=
;t exist in BSD world and doesn&#39;t seem to be needed by<br>
either.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Sys/endian.h is common. FreeBSD has endian.h, but others don&#39;t.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" rel=3D"noreferrer" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" rel=3D"noreferrer" ta=
rget=3D"_blank">imp@bsdimp.com</a>&gt;<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Acked by: Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div>=
</blockquote><div><br></div><div>On second thought, this is</div><div><br><=
/div><div>Reviewed by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">im=
p@bsdimp.com</a>&gt;</div><div><br></div><div>since I know the change is go=
od.</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/tcg/multiarch/sha1.c | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c<br>
index 87bfbcdf52..0081bd7657 100644<br>
--- a/tests/tcg/multiarch/sha1.c<br>
+++ b/tests/tcg/multiarch/sha1.c<br>
@@ -43,7 +43,6 @@ void SHA1Init(SHA1_CTX* context);<br>
=C2=A0void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_=
t len);<br>
=C2=A0void SHA1Final(unsigned char digest[20], SHA1_CTX* context);<br>
=C2=A0/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D end of sha1.h =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */<br>
-#include &lt;endian.h&gt;<br>
<br>
=C2=A0#define rol(value, bits) (((value) &lt;&lt; (bits)) | ((value) &gt;&g=
t; (32 - (bits))))<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div></div>
</blockquote></div></div>

--000000000000190db705c8a8630a--

