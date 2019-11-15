Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6BCFE0CE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 16:05:02 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVd9h-0007UR-8Z
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 10:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <michael.goffioul@gmail.com>) id 1iVaFi-00078k-Ij
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <michael.goffioul@gmail.com>) id 1iVaFg-0000gJ-Ii
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:59:02 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44344)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <michael.goffioul@gmail.com>)
 id 1iVaFY-0000bG-3u; Fri, 15 Nov 2019 06:58:53 -0500
Received: by mail-pg1-x532.google.com with SMTP id f19so5900811pgk.11;
 Fri, 15 Nov 2019 03:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PiXi4UBRQ42F3qaUYYPAcpUcWadxVQHnItxf83NNYw=;
 b=GYg0r/F2LWcu9GlU8ZnUHD0vuhPJDzmIrxV14bPET1GJI8z+r5ILDY00t21eiRw5a3
 7J2VbDN3m17gavW1jtf+mTHfxPvXyzVTY0PKnr/YdwAEHAast5c+g72wZKlmnciEFkja
 ewZvEGc4vsBFIO1Z6hWlI+8aLJRo5/MtAY/wbJf/LIzS5rIwv9wxbR6NERnCbCWeacXq
 kGJyZ1FV5E3Hpf9W+7BN/bRwfuZpZJBBnJbwitLEKChyzYeu015AxYaxyxlddaoQnrmX
 N0TR0l6sQRp6oudCOnFkJTdH+ae9WTBOkASZk9EjWJ+Xl4XRdS7G6u+rAyksIvGfhe0E
 elWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PiXi4UBRQ42F3qaUYYPAcpUcWadxVQHnItxf83NNYw=;
 b=jj87UdKTJYg8mFext9iw0A4bBwnjbExidsA3Klabbf08XsJFQ6CYzoaBcpiBAuzRBS
 nWBIfM3iRfv3tMXY+zgyv90LUQsTfS5/3qEnEB0apLtni7pIp9mUdVIZjL8M/G8Du0p3
 WNw/olulbwFAVRy0o8OfAX9ydkk7BjL94G+WKdUBzUpXqABk2CCiubhHRPyxFM8i73TM
 //onr2XuuLY/pzAPwCQZ2mS3LWyfAQfuf2p0L0z1ne9J+diL/14fLXESMTjBKpR5mR9y
 UnqiQ7VDN3v5qF6TMTha8ckSik9E3Q7nMt6dp2NoShFPJfutBilrTwmGOFsizQmOeVIK
 3q0Q==
X-Gm-Message-State: APjAAAXpM1+9b7m9cBmYMSjWIz0FKIHW4P03Qs6aLNzBH0Ka1Gh9FRs2
 ZYH1Fra46iqIFVEaLqDFOFgfZiuo3K16OcpiSCI=
X-Google-Smtp-Source: APXvYqyTaqHfbuGerDofyIHlaMPVSRan4zxEhFIJN1BT8TE+e1Ii0UPQWwc/Gjqh+a7KMiMH3W6BBzqMreCdvYYKeIM=
X-Received: by 2002:a62:e914:: with SMTP id j20mr17339797pfh.245.1573819125984; 
 Fri, 15 Nov 2019 03:58:45 -0800 (PST)
MIME-Version: 1.0
References: <CAB-99Lv3LySps4MOoKEj7Sp0CBouv-KgZp2osbiokSq_Gdfj5Q@mail.gmail.com>
 <CAFEAcA-RXurz2OB24i1wypumCDWf5s__mC33mFzBA3SCsm4_VA@mail.gmail.com>
In-Reply-To: <CAFEAcA-RXurz2OB24i1wypumCDWf5s__mC33mFzBA3SCsm4_VA@mail.gmail.com>
From: Michael Goffioul <michael.goffioul@gmail.com>
Date: Fri, 15 Nov 2019 06:58:34 -0500
Message-ID: <CAB-99Ls6YfRv7zYLMCAmQ1jj6=2As9YtmgHwucvr5d5_eaCOPA@mail.gmail.com>
Subject: Re: Invalid ARM instruction for clang-compiled Android code
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f1f1d40597615187"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
X-Mailman-Approved-At: Fri, 15 Nov 2019 10:01:37 -0500
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1f1d40597615187
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 15, 2019 at 6:03 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 15 Nov 2019 at 05:03, Michael Goffioul
> <michael.goffioul@gmail.com> wrote:
> > When running QEMU user mode on some code compiled by clang (dynamic
> linker from AOSP-10), the emulator chokes on this instruction:
> >
> >    9aa92:       e8c0 2277       strexd  r7, r2, r2, [r0]
>
> I think that ought to be a valid insn...
>
> > From debugging, I determined that op_strex() calls
> unallocated_encoding(), which I think leads to the SIGILL signal generated.
> >
> > I run the emulator without specifying the ARM cpu type, I think it then
> defaults to "any", which should support all instructions, if I'm not
> mistaken.
> >
> > Is this instruction really invalid? Or am I doing something wrong?
>
> Which version of QEMU are you using? (Looking at the code I
> suspect we still have this bug in master, but it's always
> useful to specify what version you're using in a bug report.)
>

Yes sorry, I forgot to mention it. I'm using master branch
at 187f35512106501fe9a11057f4d8705431e0026d

--000000000000f1f1d40597615187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 15, 2019 at 6:03 AM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Fri, 15 Nov 2019 at 05:03, Michael Goffioul=
<br>
&lt;<a href=3D"mailto:michael.goffioul@gmail.com" target=3D"_blank">michael=
.goffioul@gmail.com</a>&gt; wrote:<br>
&gt; When running QEMU user mode on some code compiled by clang (dynamic li=
nker from AOSP-10), the emulator chokes on this instruction:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 9aa92:=C2=A0 =C2=A0 =C2=A0 =C2=A0e8c0 2277=C2=A0 =C2=A0 =
=C2=A0 =C2=A0strexd=C2=A0 r7, r2, r2, [r0]<br>
<br>
I think that ought to be a valid insn...<br>
<br>
&gt; From debugging, I determined that op_strex() calls unallocated_encodin=
g(), which I think leads to the SIGILL signal generated.<br>
&gt;<br>
&gt; I run the emulator without specifying the ARM cpu type, I think it the=
n defaults to &quot;any&quot;, which should support all instructions, if I&=
#39;m not mistaken.<br>
&gt;<br>
&gt; Is this instruction really invalid? Or am I doing something wrong?<br>
<br>
Which version of QEMU are you using? (Looking at the code I<br>
suspect we still have this bug in master, but it&#39;s always<br>
useful to specify what version you&#39;re using in a bug report.)<br></bloc=
kquote><div><br></div><div>Yes sorry, I forgot to mention it. I&#39;m using=
 master branch at=C2=A0187f35512106501fe9a11057f4d8705431e0026d</div><div><=
br></div></div></div>

--000000000000f1f1d40597615187--

