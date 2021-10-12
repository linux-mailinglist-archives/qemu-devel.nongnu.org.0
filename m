Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE14A42ABF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 20:35:28 +0200 (CEST)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maMcZ-0004zu-8y
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 14:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maMax-0004Jh-B8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 14:33:47 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maMar-0001Z3-RW
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 14:33:46 -0400
Received: by mail-lf1-x136.google.com with SMTP id j5so808294lfg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BIVq4j6iPoLkCDeSTl5SjvNP1IRJgmDXzAixvhE0+1U=;
 b=sJQTNHcsm4CFF4mLV0BcVWka1btG+0dzol4JpTXf7zD9OA/sRS392rH3/QKm5dEGhz
 UlBJaegV5hruISDtC8E9SQShDYe2Tpbya4e2oIIxyFxsbkkGSRz/+Eh12CApA9vfwldK
 Zy3J70qEoM1nsM7zOD+HqIMrUj3b2NkJPH7Lj9RcugUvHoHYc2kUCrJjQXP9ZKUZd9CM
 USyDHVUIMNtkFqbKw0Y2W3uHOrA6GnyvY0/uLyLUB3YBFydnofly3rjKpuSJdg7TjGhf
 BnwoFawIvhdCHePLPBr/UKrdcLZ3wVOe7xVaeOy5W/DUYAhglozHykaZX5VZvCXE+2PS
 IXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIVq4j6iPoLkCDeSTl5SjvNP1IRJgmDXzAixvhE0+1U=;
 b=oKfCPqmZwISKZYxH5WQ9/vKoOwTNPVF0fjyM8YYeCYxM7PrEEcAp16jbCrYtLFzANR
 r7+iTPF7tdr+Ns6iqy0gSnz80CoHYAuZwp5SCH1byGGx2IN/BWQdmp5COIAc1c4aVvXH
 X79CjECqq5rMtEMl0n56FkEKhKYYV8UB6dRUjQT4D83d3CTVi+ZWWZyqE95NTcKoXN1W
 XFldZt9jaJbHIcrzuS7BJ+VxRjgP2WXDbrSc1C3wbCOe0nEHqGgWbTBU2TUtNymcd0w6
 O8sfn6aLNT1mIxfMjnhRphGjA/bGNBF+Qmy9vQmu53KGI4zUczI1T/cf2nX53jJgq+Sc
 zCLw==
X-Gm-Message-State: AOAM532xel5PR0gMqaFP8FBKescu03aKTTPx/GfUslqp4ueV6PhABnRF
 O+2r2R4Xasmd7dH2HkIqhSEvBTGCipl1GIUGOxPCdg==
X-Google-Smtp-Source: ABdhPJyoahxZXlQ7SZzev6kfWnqGHAOfrnzXTppYkQxC53JkUYOyLU/xqhIK+BZBUj6gql9q6sbMuOl6w5bS65hzxE4=
X-Received: by 2002:a05:651c:12c6:: with SMTP id
 6mr30305120lje.256.1634063619584; 
 Tue, 12 Oct 2021 11:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-2-richard.henderson@linaro.org>
 <87h7dmw4kn.fsf@linaro.org>
 <38b675d8-e885-27ef-0feb-8955be0e750f@linaro.org>
In-Reply-To: <38b675d8-e885-27ef-0feb-8955be0e750f@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Tue, 12 Oct 2021 19:33:26 +0100
Message-ID: <CAHDbmO3Uk=rXhvW3upXRR9Hx1dQ0GdXx3TcK=cbT_R_GGJaTKw@mail.gmail.com>
Subject: Re: [PATCH 1/9] tests/docker: Add debian-nios2-cross image
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000096113a05ce2c15a4"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000096113a05ce2c15a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It copies from the first stage. Is the compiler installed to a different
path?

On Tue, 12 Oct 2021, 19:24 Richard Henderson, <richard.henderson@linaro.org=
>
wrote:

> On 10/12/21 10:03 AM, Alex Benn=C3=A9e wrote:
> > We need to split this like in hexagon and have a second stage which doe=
s
> > a:
> >
> >    COPY --from=3D0 /usr/local /usr/local
> >
> > This will limit the size of the final image (and also avoid duplicting
> > the UID in the hexagon build).
>
> Yeah, well, I had to take that out because it errors out.
> I have no idea what that does or means.
>
>
> r~
>

--00000000000096113a05ce2c15a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It copies from the first stage. Is the compiler installed=
 to a different path?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Oct 2021, 19:24 Richard Henderson, &lt;<a h=
ref=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 10/12/21 10:03 AM, =
Alex Benn=C3=A9e wrote:<br>
&gt; We need to split this like in hexagon and have a second stage which do=
es<br>
&gt; a:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 COPY --from=3D0 /usr/local /usr/local<br>
&gt; <br>
&gt; This will limit the size of the final image (and also avoid duplicting=
<br>
&gt; the UID in the hexagon build).<br>
<br>
Yeah, well, I had to take that out because it errors out.<br>
I have no idea what that does or means.<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000096113a05ce2c15a4--

