Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BA48CB5F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 19:56:17 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7in9-0003Ax-PX
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 13:56:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrin@gorski.net>) id 1n7ihh-0002Ds-S6
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 13:50:38 -0500
Received: from [2a00:1450:4864:20::52e] (port=39739
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrin@gorski.net>) id 1n7ihd-0005OZ-QD
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 13:50:35 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c71so13686495edf.6
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 10:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gorski-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x5Lw2qEIW7KE9LbnPpBKvc2olPEWPZ9POK5w9DQ9KX0=;
 b=mq5PFTUN4YY8A6GHvLl8Dxf/zOVr4HkxK88DP7h9GOoqN89gyjZVqG+RAmq72YJyv9
 ytNw9uWvzQgTzfcGSgPVaqJR6LuntIMvr9IfBpPY9NuCEo/wmqWk3Mvcv5F47QWvxUPc
 2nFkogL+LBJ2x3uXASf2RtIEwGodZ71YkSDZ7w6HaLU0sjByHiQPS5xDZpKBHzQfxCPf
 sTSaEOpOyZJ4KSqE3P+FK+clBJVFuTy1izQBTFi1N5dsuqtomWJynL+6lLMir+z30GBY
 oOaEuGYuzABEa73eLyEnqypxk0KM1otS6Dt59eX5RvzQrHXVyVcZeuKbCxyElc9EEN9r
 InYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x5Lw2qEIW7KE9LbnPpBKvc2olPEWPZ9POK5w9DQ9KX0=;
 b=c+wGzbkQZX7eGjl4Td5IS4SflneG82/nTzfJl/DqlyvIEAL51qC8GEXg1qZZENzpIV
 OR5+hkOx5sKTy4g0zXnv23Kce9hyChkYo4lWZY6deoY26yCeTtar/SM0BEoV9WHHndSA
 KcQyBSGoQogbBhe4KIVjjG2m4VZyY+xXpy6qAjE1Vj+hlQE2hJ3B+bDaXtVd+SxtM/VZ
 dgeA/VrtPNEh13tLh1Q9ZBCGHjWfggFA6tHr5Qj6mCU23GBlp18ah4C9ajLIY7hii5Op
 dfYu8PZR/EXHDd5LXQTmiVeQEZmXvmDP42kQLzQ1ac6vaZ9H4cIJ9HEa3C6jSFWjzCA5
 ZJ4w==
X-Gm-Message-State: AOAM533cxMVIZ7BegXIJKg9UxVxMXoXWcxufw5DpsgkKfmv48VrKe2zC
 Vt4TB80Za+fDUDaxmBWkql+71VVOs0sH23nslQo9jA==
X-Google-Smtp-Source: ABdhPJz26of//MVnSCq1utakMmYRi6kuKbXCQWIm1KSkcnp/x4RCiiQuHBBL7jkvkOFogQNO/FwUQZ/9tTG98+MIstU=
X-Received: by 2002:a17:907:76db:: with SMTP id
 kf27mr841793ejc.28.1642013431147; 
 Wed, 12 Jan 2022 10:50:31 -0800 (PST)
MIME-Version: 1.0
References: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
 <20220112152042.GD1827489@darkstar.musicnaut.iki.fi>
In-Reply-To: <20220112152042.GD1827489@darkstar.musicnaut.iki.fi>
From: "Darrin M. Gorski" <darrin@gorski.net>
Date: Wed, 12 Jan 2022 13:50:19 -0500
Message-ID: <CACdcev+_b=k8z4bgHLqmfPDCkwYJy7kDSep_NPkdbrYHRpmvOg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via
 DTR and DCD
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: multipart/alternative; boundary="000000000000481ef005d5670b1f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=darrin@gorski.net; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000481ef005d5670b1f
Content-Type: text/plain; charset="UTF-8"

Unfortunately I ran out of cycles at the time.  Adding test cases seems
like it was the roadblock - I don't think I ever figured out how to
implement the needed build tests for this additional feature in chardev.
I'm not that strong of a C developer, unfortunately.

I haven't looked at picking this up in probably a year, so I don't even
remember if I was able to get *anywhere* with it.

I did end up using a patched build myself,  and it worked fine for what I
was doing which is probably why I didn't get back to it.

Sorry, I'm sure that's not the answer you were hoping for.  But the day job
takes priority ;)

- Darrin


On Wed, Jan 12, 2022 at 10:20 AM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:

> Hi,
>
> On Wed, Dec 16, 2020 at 05:06:51PM -0500, Darrin M. Gorski wrote:
> > This patch adds a 'modemctl' option to "-chardev socket" to enable
> control
> > of the socket via the guest serial port.
> > The default state of the option is disabled.
> >
> > 1. disconnect a connected socket when DTR transitions to low, also reject
> > new connections while DTR is low.
> > 2. provide socket connection status through the carrier detect line (CD
> or
> > DCD) on the guest serial port
> >
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1213196
> >
> > Signed-off-by: Darrin M. Gorski <darrin@gorski.net>
>
> Is there any plans to continue working with this patch? Having the DCD
> status would be very useful.
>
> A.
>

--000000000000481ef005d5670b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Unfortunately I ran out of cycles at the time.=C2=
=A0 Adding test cases seems like it was the roadblock - I don&#39;t think I=
 ever figured out how to implement the needed build tests for this addition=
al=C2=A0feature in chardev.=C2=A0 I&#39;m not that strong of a C developer,=
 unfortunately.</div><div><br></div><div>I haven&#39;t looked at picking th=
is=C2=A0up in probably a year, so I don&#39;t even remember if I was able t=
o get *anywhere* with it.</div><div><br></div><div>I did end up using a pat=
ched build myself,=C2=A0 and it worked fine for what I was doing which is p=
robably why I didn&#39;t get back to it.</div><div><br></div><div>Sorry, I&=
#39;m sure that&#39;s not the answer you were hoping for.=C2=A0 But the day=
 job takes priority ;)</div><div><br></div><div>- Darrin</div><div><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Jan 12, 2022 at 10:20 AM Aaro Koskinen &lt;<a href=3D"mailto:aaro=
.koskinen@iki.fi">aaro.koskinen@iki.fi</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Dec 16, 2020 at 05:06:51PM -0500, Darrin M. Gorski wrote:<br>
&gt; This patch adds a &#39;modemctl&#39; option to &quot;-chardev socket&q=
uot; to enable control<br>
&gt; of the socket via the guest serial port.<br>
&gt; The default state of the option is disabled.<br>
&gt; <br>
&gt; 1. disconnect a connected socket when DTR transitions to low, also rej=
ect<br>
&gt; new connections while DTR is low.<br>
&gt; 2. provide socket connection status through the carrier detect line (C=
D or<br>
&gt; DCD) on the guest serial port<br>
&gt; <br>
&gt; Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1213196" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1213=
196</a><br>
&gt; <br>
&gt; Signed-off-by: Darrin M. Gorski &lt;<a href=3D"mailto:darrin@gorski.ne=
t" target=3D"_blank">darrin@gorski.net</a>&gt;<br>
<br>
Is there any plans to continue working with this patch? Having the DCD<br>
status would be very useful.<br>
<br>
A.<br>
</blockquote></div>

--000000000000481ef005d5670b1f--

