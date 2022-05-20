Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0652E8EA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:35:19 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrz2U-0006KC-G5
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryzi-0004Ow-DF
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:32:26 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:43161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryzg-00084e-T4
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:32:26 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f1d2ea701dso9674440fac.10
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AkcUhc9EAE+2h03wfwi5gg45tpyte4JTYPXqsJV89tQ=;
 b=YQmt2Hd6DAw26/wjMntskeurDv72vwnaer7utiuJ4jwQDmDzctM7dQaR8WRkAf7jE3
 wGhWdnFgrYEcXDo5/AVN29ZNaUnMejxMkRMB0GopF+ExKNXxkheZMDEY0qtpUbWyB+uB
 3nlc70rcWf6nE7+nVC7Xixay70lYegv33mXwPdnLjviGIUMKf3CTWRYU3E7WZRuekztg
 fiWO0ULR5C+nQs9rb0EhECjyBxJEyW1uRLvlK86s1qsLkcwQmpy055nngYNStiVP+4po
 jgeru9dfM+/+hfs6bIc2oMbIksE5B1HxJFm8iUNrqAm4C7EaEjH7ij/OsM9oADx9ziKZ
 zklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkcUhc9EAE+2h03wfwi5gg45tpyte4JTYPXqsJV89tQ=;
 b=vhK2iFWrJLC4v2rt5re4NRZiP7yXhGngW+GZbP5B7omzUK+1GgQt+x+cF5NpM2CD0r
 sCMBdxr4nycZkGh6vw9ub+Zuk1YD+RtFmUwl/56zvPLpXV1smBwLahF0UoKER7ILMdmL
 bi9cDqPh8QpXSJFmYseTpNYdty/TuE2spEZT9vG+MtEARJh/a2GtyOGKsP0UF6BQnli3
 7GnUOT1JnoJV3XlYWH5UqH6PXHwvaA4nW/WzI2W5kTGSNs26CFYRn6Gy+pUzXLfXcx0H
 5ObzYDxqQ65LKj1U3YR0JyWzfZilUAZquIO8Fd4KpEcpiLCj4hHFX5h3Q4hxI5ZGWA2Q
 hUdg==
X-Gm-Message-State: AOAM53175VwLwTLeaERyUCJkraMUa8QO52CIkCamL194iXkdg6m4mHmY
 zDra6ZrLGC/HZ/tWW+IvyZ9pbq44HWnl0sDlrsc=
X-Google-Smtp-Source: ABdhPJypNoNx4J5XIUL82gH0hWUlb5pPk0NaDAjdLKSbwbytKQZrJZb+cfpOdUCQcEVL8UkLdlNcKc+EnaPdA+E0cxo=
X-Received: by 2002:a05:6870:538e:b0:e6:7957:31ab with SMTP id
 h14-20020a056870538e00b000e6795731abmr5412474oan.89.1653039143720; Fri, 20
 May 2022 02:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
 <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
 <CAFEAcA8XW0DGvysnn08m+dVVnfUADS4khV1jgXea2JgZEPzVaw@mail.gmail.com>
 <CANW9uytx_ocywwRVBLbze32-Vp1qR8FGMWx1691_ji_J8Ngfhw@mail.gmail.com>
 <CAFEAcA_4oqeQTLqi=KE3vgCH-BeSRDLsBxSLCanvQX0s6irc=Q@mail.gmail.com>
 <CANW9uysep-A29wHhB6XZnL2q4TkZHYrYqikd-WTzokpwsGiWYw@mail.gmail.com>
In-Reply-To: <CANW9uysep-A29wHhB6XZnL2q4TkZHYrYqikd-WTzokpwsGiWYw@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 20 May 2022 18:32:12 +0900
Message-ID: <CANW9uyvyoxbTj6YuWB+DhJaDUqTOQqQurzBXgYEWrixeu3QL8A@mail.gmail.com>
Subject: Re: CPUs supported by the sbsa-ref board
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f61b4205df6e2afd"
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f61b4205df6e2afd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If Leif can jump in that=E2=80=99d be great.

On Fri, May 20, 2022 at 18:31 Itaru Kitayama <itaru.kitayama@gmail.com>
wrote:

> I=E2=80=99ve verified only a57 and a72 boot on sbsa ref board, but not N1=
 and
> =E2=80=98max=E2=80=99. As I said, I=E2=80=99ll try to figure out how CPU =
init is done in QEMU for
> those not working CPU types.
>
> On Fri, May 20, 2022 at 18:27 Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Fri, 20 May 2022 at 10:02, Itaru Kitayama <itaru.kitayama@gmail.com>
>> wrote:
>> >
>> > By calling a57=E2=80=99s CPU init function inside the max=E2=80=99s, I=
 can bring up
>> > the sbsa-ref board with the latest kernel.
>>
>> I'm not sure exactly what you're doing, but this sounds like
>> a workaround for something -- we should find out exactly
>> what is going wrong and why.
>>
>> -- PMM
>>
>

--000000000000f61b4205df6e2afd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If Leif can jump in that=E2=80=99d=C2=A0be great.</div><d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, May 20, 2022 at 18:31 Itaru Kitayama &lt;<a href=3D"mailto:itaru.kitay=
ama@gmail.com">itaru.kitayama@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"auto">I=E2=80=99ve verified only a57 and a7=
2 boot on sbsa ref board, but not N1 and =E2=80=98max=E2=80=99. As I said, =
I=E2=80=99ll try to figure out how CPU init is done in QEMU for those not w=
orking CPU types.</div><div dir=3D"auto"><br></div><div><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 20, 2022 at 18:27=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_b=
lank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Fri, 20 May 2022 at 10:02, Itaru Kitayama &lt;<a href=3D"mail=
to:itaru.kitayama@gmail.com" target=3D"_blank">itaru.kitayama@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; By calling a57=E2=80=99s CPU init function inside the max=E2=80=99s, I=
 can bring up<br>
&gt; the sbsa-ref board with the latest kernel.<br>
<br>
I&#39;m not sure exactly what you&#39;re doing, but this sounds like<br>
a workaround for something -- we should find out exactly<br>
what is going wrong and why.<br>
<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000f61b4205df6e2afd--

