Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837319548E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:56:33 +0100 (CET)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHlj6-0005qt-IP
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jHldB-0004Wi-P1
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jHldA-00058e-Gb
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:50:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jHld9-00054Z-OF
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:50:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id h15so10584466wrx.9
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+hAVwVJyNPukP1zpxcJvlEfHfmAq0QdWoSo/k67G30o=;
 b=fRlBlqCxnjwLHvE4GuYVPwQuqTKiZcD69unRIo8vgTXhSyLYaw+qzlenDInEbrABN7
 19aAJC6vbuIUKkZJTDVnRZ7Q9udWeoWQMFfoxYMzIHEfQh0frI528cuY6Oe/TZjUsbMu
 SfeCAJ1xd3vF7wQwKZ91jPFiNKM4q2nXyaAzLxtWgogGhoNj9ZzTHzzI3tQSRFC5yP+p
 /zZ01eyJU1vSVjSa51RqxZIR5N3sM8wEnIUxGPIVExVypUTe5uS3dR15qSV3uyr5acaA
 svJr5hctNft0Gu02tw8OJ9q56ePnCBfVbsSvZXiNe6rtKq1hCm0G4LdNxtu+M3YrUnsF
 mY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+hAVwVJyNPukP1zpxcJvlEfHfmAq0QdWoSo/k67G30o=;
 b=lzfe+sw1BYq7UcatJ9Iu864V2iQd7vTf9xlfTCPIS35mWWA/f8uSc9wIIPbCG76Bkj
 9iANLiAN8LsLPAOKI0iJncVdSCeOE8XbTswt+AHErW+yxPk2v6VcE/bM7qzpSi5nEzcA
 nn+Wnp5pAbnQEFoSm3bQkYpSx3r8kTX/m4MjEe6luUaSLtkaU/q981EgFNGOJbkXBYTO
 Bb8MF/KoaWWhLu9BAclput9fnRlDlgyl2CZuR3eKbVYRhS4RAqqkq5bcnh12qpJrH9b9
 /RYBvqqcsS7y6rQ3BfGykFRa6cnkfFvbY2/h4Ns4r6BHY2IzwoKRtZevhVmbub3Ttx18
 hPVw==
X-Gm-Message-State: ANhLgQ0+4g04imJ5CfJaYi1j7h1i0/k5u/F3OqXo45VdXTxeH896gZ06
 fYG6gEcaRfPyfqGsHT4IInaWToQqhCd8YcN+M0Y=
X-Google-Smtp-Source: ADFU+vsbJy/ARB0yWTi4IrxK1JtxTjswhpFPNAWpSPb5Pe1mGm9QLFm8vHlt9pnTKLopwbBMxZKw3juBzVJYog2RdSQ=
X-Received: by 2002:adf:e282:: with SMTP id v2mr1244059wri.329.1585302622853; 
 Fri, 27 Mar 2020 02:50:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:9c95:0:0:0:0:0 with HTTP; Fri, 27 Mar 2020 02:50:22
 -0700 (PDT)
In-Reply-To: <871rpennlp.fsf@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
 <CAHiYmc476rMd71t5ZSdz-pgVZ-i_3RBY=U3bO0aYEOOt5P3V_w@mail.gmail.com>
 <871rpennlp.fsf@linaro.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Fri, 27 Mar 2020 10:50:22 +0100
Message-ID: <CAHiYmc5zTyUtm570NxKS8crJKWgNmEhMk-FcvnkMHf928=9CdQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/74] per-CPU locks
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b25f2905a1d307dd"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
Cc: "peter.puhov@linaro.org" <peter.puhov@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Robert Foley <robert.foley@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b25f2905a1d307dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=B5=D1=82=D0=B0=D0=BA, 27. =D0=BC=D0=B0=D1=80=D1=82 2020., Alex Be=
nn=C3=A9e <alex.bennee@linaro.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BE/=D0=BB=D0=B0:

>
> Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> writes:
>
> > 21:37 =C4=8Cet, 26.03.2020. Robert Foley <robert.foley@linaro.org> =D1=
=98=D0=B5
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >>
> >> V7: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg00786.htm=
l
> >>
> >> This is a continuation of the series created by Emilio Cota.
> >> We are picking up this patch set with the goal to apply
> >> any fixes or updates needed to get this accepted.
> >>
> >
> > Thank for this work, Robert.
> >
> > However, I just hope you don't intend to request integrating the series
> in
> > 5.0. The right timing for such wide-influencing patch is at the beginin=
g
> of
> > dev cycle, not really at the end of (5.0) cycle, IMHO.
>
> It's not marked for 5.0 - I don't think all patch activity on the list
> has to stop during softfreeze. I don't think there is any danger of it
> getting merged and early visibility has already generated useful
> feedback and discussion.
>

OK, nobody ever said we can examine, discuss and test the series, but I
remain thinking that this series arrives too late for considering for 5.0.

Aleksandar



> --
> Alex Benn=C3=A9e
>

--000000000000b25f2905a1d307dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>=D0=BF=D0=B5=D1=82=D0=B0=D0=BA, 27. =D0=BC=D0=B0=D1=80=D1=82 2020.,=
 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee=
@linaro.org</a>&gt; =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE=
/=D0=BB=D0=B0:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.qemu.devel@gmail.com">=
aleksandar.qemu.devel@gmail.<wbr>com</a>&gt; writes:<br>
<br>
&gt; 21:37 =C4=8Cet, 26.03.2020. Robert Foley &lt;<a href=3D"mailto:robert.=
foley@linaro.org">robert.foley@linaro.org</a>&gt; =D1=98=D0=B5 =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;&gt;<br>
&gt;&gt; V7: <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-=
03/msg00786.html" target=3D"_blank">https://lists.gnu.org/archive/<wbr>html=
/qemu-devel/2019-03/<wbr>msg00786.html</a><br>
&gt;&gt;<br>
&gt;&gt; This is a continuation of the series created by Emilio Cota.<br>
&gt;&gt; We are picking up this patch set with the goal to apply<br>
&gt;&gt; any fixes or updates needed to get this accepted.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thank for this work, Robert.<br>
&gt;<br>
&gt; However, I just hope you don&#39;t intend to request integrating the s=
eries in<br>
&gt; 5.0. The right timing for such wide-influencing patch is at the begini=
ng of<br>
&gt; dev cycle, not really at the end of (5.0) cycle, IMHO.<br>
<br>
It&#39;s not marked for 5.0 - I don&#39;t think all patch activity on the l=
ist<br>
has to stop during softfreeze. I don&#39;t think there is any danger of it<=
br>
getting merged and early visibility has already generated useful<br>
feedback and discussion.<br></blockquote><div><br></div><div>OK, nobody eve=
r said we can examine, discuss and test the series, but I remain thinking t=
hat this series arrives too late for considering for 5.0.</div><div><br></d=
iv><div>Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
-- <br>
Alex Benn=C3=A9e<br>
</blockquote>

--000000000000b25f2905a1d307dd--

