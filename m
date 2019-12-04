Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC533113628
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 21:08:32 +0100 (CET)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icawp-0005hE-Cq
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 15:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1icafE-0003yV-9E
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 14:50:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1icafD-00032G-2Y
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 14:50:20 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:39711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1icafC-0002ys-PY; Wed, 04 Dec 2019 14:50:18 -0500
Received: by mail-il1-x142.google.com with SMTP id a7so668142ild.6;
 Wed, 04 Dec 2019 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5pUPHYbr0BueGJe7F25s/VFQXDl8+ZiGmqPzGqYpgY=;
 b=jlnALiCZ9Pzedb7XVTPCJGOgZDTsT2BpiWWDkywevUOm0ns/61Cq7WElbVpLPQeBZD
 IbszXua3FwaREiCZc/dsXkyxOhRi6mxozA1ODc4NK9RFpYX9hHn4Z/0JUgu6DJ17UE8S
 7iLRPNrXfA861gA9oTEEKd46HQc1Dqdbn0jVHYqrJBsPXIDJQdG+H6j/effvSkxTmCyt
 Mmx7Fk9iRHxL4Q8YZL8lFvGSvsWxd/H/bmHdYb3eZAreKri0TRiZfc5fA2EUurbIkm7F
 SwztkkL6Cf1qdL1v7AA5JL5ZdEVdAKViuux9o0h+nCiOqhdfUp5y06FqtfzHqLZEqPTH
 PxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5pUPHYbr0BueGJe7F25s/VFQXDl8+ZiGmqPzGqYpgY=;
 b=CwxY4Z19/IzguWYRpqPGK+jECwm93Di3R+aPnv1gq5QLVDFrw+rs7AEUExcM0f/gqj
 8r/NlSYc57LyrtTOi4XS/vUabxe8MXjghl8BkjTe/O8zckjvgJ9KkJVNGxAl1Y36/ave
 1xlAUNpOb1s7PkmAZDH1qR4I3yxyoKVZ1Ln9gE5ecPMFhNpeMWTvToobF7aTja/1xXTV
 Ov6xZqvKLLVRNeyoNuU9p9HF7WI5FJ8whtE133CjVQ1nSnEU7B4lhBwNhyCmHWn7Efxe
 aRLc+2vaTdx/2pcgsjEzd5NGwj7Hl2WMvLw7uoSSrHm3qId+M35LyzxJvnxcp8WI5qmI
 i2zQ==
X-Gm-Message-State: APjAAAWrX31ArnkW9QUuASJKrRSHU5xpP5pPDSSxSC1PY0uWTv14k8d+
 mNbUr+fpwrWk98fT4Qz1lIifTKxKo4NWK91JgLU=
X-Google-Smtp-Source: APXvYqygCgdlSpjPHk7b/9w2aYIoxaLOeIq2rzsSj+EihENrU1Utr8ED/QHXVqK0gs2vQY4esecXTUQOVytCgvW8xaE=
X-Received: by 2002:a92:5a45:: with SMTP id o66mr4970679ilb.67.1575489017236; 
 Wed, 04 Dec 2019 11:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-3-nieklinnenbank@gmail.com>
 <b14e5a75-ebe3-311e-60a8-3f71b0874a10@redhat.com>
 <CAPan3Woz7+1K9Yth6MfHqLfjcDMh8xGVzTShN7gi3XM8W_BNnw@mail.gmail.com>
 <239606dc-3545-c3f7-1e11-429f53994147@redhat.com>
In-Reply-To: <239606dc-3545-c3f7-1e11-429f53994147@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 4 Dec 2019 20:50:05 +0100
Message-ID: <CAPan3Wr07TotY3zMXYba7M24Da5VShfsQR4jFTWkt6-Tk672bA@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw: arm: add Xunlong Orange Pi PC machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003852570598e61f67"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003852570598e61f67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2019 at 10:03 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 12/3/19 8:33 PM, Niek Linnenbank wrote:
> > Hello Philippe,
> >
> > Thanks for your quick review comments!
> > I'll start working on a v2 of the patches and include the changes you
> > suggested.
>
> Thanks, but I'd suggest to wait few more days to give time to others
> reviewers. Else having multiple versions of a big series reviewed at the
> same time is very confusing.
> I have other minor comments on others patches, but need to find the time
> to continue reviewing.
>
>
OK Philippe, I will follow your advise and wait a few more days before
submitting a new version.
I'll wait at least until you had a chance to review all the patches. I'm
new to the QEMU
community, so I will need to learn the process along the way.

Regards,
Niek





--=20
Niek Linnenbank

--0000000000003852570598e61f67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 4, 2019 at 10:03 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 12/3/19 8:33 PM, Niek Linnenbank wrote:<br>
&gt; Hello Philippe,<br>
&gt; <br>
&gt; Thanks for your quick review comments!<br>
&gt; I&#39;ll start working on a v2 of the patches and include the changes =
you <br>
&gt; suggested.<br>
<br>
Thanks, but I&#39;d suggest to wait few more days to give time to others <b=
r>
reviewers. Else having multiple versions of a big series reviewed at the <b=
r>
same time is very confusing.<br>
I have other minor comments on others patches, but need to find the time <b=
r>
to continue reviewing.<br>
<br>
</blockquote></div><div><br></div><div>OK Philippe, I will follow your advi=
se and wait a few more days before submitting a new version.</div><div>I&#3=
9;ll wait at least until you had a chance to review all the patches. I&#39;=
m new to the QEMU</div><div>community, so I will need to learn the process =
along the way.</div><div><br></div><div>Regards,</div><div>Niek<br></div><d=
iv><br></div><div><br></div><div><br></div><div><br></div><br>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<=
br><br></div></div></div></div>

--0000000000003852570598e61f67--

