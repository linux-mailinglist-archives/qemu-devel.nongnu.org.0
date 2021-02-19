Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C5031FC5F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:47:28 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD807-00009w-3H
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lD7M3-0000h6-9T
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:06:03 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lD7Lz-0002e9-0S
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:06:03 -0500
Received: by mail-qk1-x72d.google.com with SMTP id x14so5794361qkm.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 07:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtz45ez5UJ4Esq8T4m+O0gevjutxqYc+XHLL1gapXPI=;
 b=T5HGSafG6F+DTpHkNaGVlN5zFB94kq3EAg9O7QVA9zpVTfWxrRmS9TYiyA8dMGbRe3
 mL8W8yguMrnsGbNYm5ORv1+6CbrdRLQUALTTKEfSoABLkjq65Of1BJDazufl7/O0Ao/F
 B//4+LiczBoxVtBUob4jFnLCpGnZVE+jWDJKrl3gp7Ei13Hq4+QlEoD+NdpPn/PzAz2V
 BlBXerl36XnT5vfW240Gb7E+vRb37uPSlyysy1G9Qcpu40rxra+o3vLRStpNDM4Qb5C9
 EbTAgcFqSFcS4kzSr9ZioXcchhn7yoD1sNpLz3PdMB6fNKR8Z9kWmp6R8SsRqqRghksL
 iA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtz45ez5UJ4Esq8T4m+O0gevjutxqYc+XHLL1gapXPI=;
 b=IiEjDQLnLCtvULrz9jyO8gBJ/IYicM81M2+2ErVJlEHbMQ+c421ZWNjovVCmJzaYTk
 GvY1kpZURcpXuCwm9aM9H3x/ODeL31GXr1dftBjb6BimoHXZCppHDI+w4HWMECTbrV0D
 b0iQgm4dF0sBUJ4Zojl0nWr+I/ArDRFT96NPeSNZH2AYKKgQJkHyWBs6G06s15TXZjCl
 AzPWdr/Jbbqg6Ammf2SvmOhfWU3SfrGKhqC5ru28FJGjCyzItiwVLMEmgZAHMfLRcJMs
 HjXvnNK/zcofZ5JgW0QTAdvdTOe/4OMxV8fnUJzO/llwaSny1LRRjv+ZsSyh1BH7KbZl
 TNxg==
X-Gm-Message-State: AOAM532riweZWPL2ZVzKU3XzuR0uUiUCIb8Qul3WiNJc3B1WFYFmsuA1
 ABJqOrvVHwppfBfdEvNlDHpJ26tmcBZb7p6M1j1C1w==
X-Google-Smtp-Source: ABdhPJzSRWpeP3D7MT+kJoSnueHql5a2jetEYXMWBs+JO2fKxekFgmENUtDt5Zp1bwU2rvW+LUE13zhqhInol27gtDA=
X-Received: by 2002:a05:620a:12d1:: with SMTP id
 e17mr9599610qkl.89.1613747155441; 
 Fri, 19 Feb 2021 07:05:55 -0800 (PST)
MIME-Version: 1.0
References: <8735xss5q3.fsf@linaro.org>
 <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
 <87wnv4qq6v.fsf@linaro.org>
In-Reply-To: <87wnv4qq6v.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 19 Feb 2021 08:05:43 -0700
Message-ID: <CANCZdfqpRgAwsF1zE-25vhzEreB2erNOoU7d6DLAbJnx3etDQg@mail.gmail.com>
Subject: Re: FreeBSD build regressions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f531c605bbb1c967"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <gerd@kraxel.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f531c605bbb1c967
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021, 3:59 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 19 Feb 2021 at 10:39, Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >>
> >>
> >> Hi,
> >>
> >> It looks like the build has been broken on Cirrus since at least 7b2c4=
c:
> >>
> >>   https://cirrus-ci.com/github/qemu/qemu
> >>
> >> I did attempt to have a look but "vm-build-freebsd" seems to be failin=
g
> >> with a different error
> >
> > FWIW the vm-build-freebsd build-and-test works for me, as I
> > continue to run it as part of the merge tests. Is this something
> > to do with whether you already have a freebsd image cached
> > as opposed to it getting re-built from scratch (perhaps with
> > a newer FreeBSD)?
>
> It did re-run the installation when I first called the target so I guess
> it was that.
>

Python was built against a newer FreeBSD that had symbols that weren't in
12.1. Where did the python build come from?

Warner

--=20
> Alex Benn=C3=A9e
>
>

--000000000000f531c605bbb1c967
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 19, 2021, 3:59 AM Alex Benn=C3=A9e &lt;<a =
href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Fri, 19 Feb 2021 at 10:39, Alex Benn=C3=A9e &lt;<a href=3D"mailto:a=
lex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@lin=
aro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; It looks like the build has been broken on Cirrus since at least 7=
b2c4c:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://cirrus-ci.com/github/qemu/qemu" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://cirrus-ci.com/github/q=
emu/qemu</a><br>
&gt;&gt;<br>
&gt;&gt; I did attempt to have a look but &quot;vm-build-freebsd&quot; seem=
s to be failing<br>
&gt;&gt; with a different error<br>
&gt;<br>
&gt; FWIW the vm-build-freebsd build-and-test works for me, as I<br>
&gt; continue to run it as part of the merge tests. Is this something<br>
&gt; to do with whether you already have a freebsd image cached<br>
&gt; as opposed to it getting re-built from scratch (perhaps with<br>
&gt; a newer FreeBSD)?<br>
<br>
It did re-run the installation when I first called the target so I guess<br=
>
it was that.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Python was built against a newer FreeBSD that had symbols that =
weren&#39;t in 12.1. Where did the python build come from?</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Warner=C2=A0</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div></div>

--000000000000f531c605bbb1c967--

