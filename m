Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66D34D3E5F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 01:47:59 +0100 (CET)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS6yE-0004vY-6k
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 19:47:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nS6v4-0003ZA-Km
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 19:44:42 -0500
Received: from [2607:f8b0:4864:20::a34] (port=41617
 helo=mail-vk1-xa34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nS6v2-0004Xu-SZ
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 19:44:42 -0500
Received: by mail-vk1-xa34.google.com with SMTP id i133so2183116vki.8
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 16:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iPo7+bWHzBiwvn8LCprpyuourQWVTopPXGJDcN2uMiE=;
 b=AFRMXuC2+WtZqx1cFPS0rXK1LgpvJT6mBM3vmjI0HlVVXMuVEPRneKQrmYYOgGJaBg
 fp2siGUkY2xbZXBYgTs4psX1XMKe/jNP3UqboEiBzPhUtSJTDKeXSFTupllbzLaMa/Er
 7tGTZyfw9rHT4+fOUUCZwb9wL8kHvfcH7bGI6yeI/4TQBUnAKQDzk3M9XIeeqPLtWivE
 5mGnBcqE6kR/Cg8AvtvwhLXJuRGxCDrPY5sVE1TxQaLphy4D1T0OYEzWOCr2ldIT0oi2
 8lGGzkt55poWsAM+A9pvfOddFCdVmh510e/h50Aazaagn+9oIMVuxuA1ZxvUXvf8Fgog
 JGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iPo7+bWHzBiwvn8LCprpyuourQWVTopPXGJDcN2uMiE=;
 b=R21Sg2z4l9l/A87Nvi0iB3KfeF7pBhvrRUBE2TiWNC2ypdqUr2ZuljXfisXlodo5HQ
 mfnQ8vh2FRK2aMLbTPmneycjCV4Bue5tg38UNiEif+rZ7CEnb5+Xr2fb5x4pg97oJXPe
 Wu9GslIUJkw6Hk19olr7MVuEt0Fo4E9OzcWKu7ohwMZZzr+higGqLKZQfFtofZY5QSvB
 UdFpJ6ZtbOuxZC2HmgOJ2+nFJdeYMjdkAOKRCnpSLLPHDQyRpHHqQnatHpCJbHc6Ub1H
 RcbbP0JpgU4p6aZ3IewNPazxziCKErTiMOQSXovSJNdBfJ3UfSoxEGOikjFulzBbzAaz
 iiIA==
X-Gm-Message-State: AOAM533wCscCoLZSRlpRptBywdIwmMFNz8vxwWV5Mxg4aVu3jPQYkiF0
 pIFx7KhitWLVJ3ZITSpIdmrad1r5b6QNus1whlHptg==
X-Google-Smtp-Source: ABdhPJwASQmT8BF68pSZu/P9C++mO28Lq07p9RUnQmSEmhzCXiXxUi+foTzGkgfzM6phaU7UaUTt1dx6JdhtpjQrtBw=
X-Received: by 2002:a1f:9e87:0:b0:32c:bcba:d83c with SMTP id
 h129-20020a1f9e87000000b0032cbcbad83cmr1172274vke.28.1646873079788; Wed, 09
 Mar 2022 16:44:39 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notw1Aacb+EXLOBw4fy3rt2cFSkYmeXtJx6UziBdz7tveTg@mail.gmail.com>
 <c934ed55-b954-5334-8830-c5e36e957af3@gmail.com>
In-Reply-To: <c934ed55-b954-5334-8830-c5e36e957af3@gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 9 Mar 2022 16:44:28 -0800
Message-ID: <CAO=notyQ=VARKxsW-3qEEDMAzVZPfB1eHk=gz7yb+AUzum2AJA@mail.gmail.com>
Subject: Re: Lost patch
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e99acc05d9d2847f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=venture@google.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000e99acc05d9d2847f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 9, 2022 at 4:16 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> On 10/3/22 00:12, Patrick Venture wrote:
> > Corey and Peter;
> >
> > I was about to submit a fix to the at24c-eeprom device and noticed that
> > my v2 patch appears to have been lost to time.  Is there any way we can
> > get this pulled into 7.0?
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03485.html
>
> Thanks for noticing.
>
> It is a bugfix so it is still good to go. I'm queuing it (except if
> Peter beats me via qemu-arm) and will send a pullreq for it on next
> Monday.
>
> Regards,
>

Thanks!

>
> Phil.
>

--000000000000e99acc05d9d2847f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 4:16 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.daude@gmail.co=
m">philippe.mathieu.daude@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 10/3/22 00:12, Patrick Venture wrote:=
<br>
&gt; Corey and Peter;<br>
&gt; <br>
&gt; I was about to submit a fix to the at24c-eeprom device and noticed tha=
t <br>
&gt; my v2 patch appears=C2=A0to have been lost to time.=C2=A0 Is there any=
 way we can <br>
&gt; get this pulled into 7.0?<br>
&gt; <br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03=
485.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2021-12/msg03485.html</a> <br>
<br>
Thanks for noticing.<br>
<br>
It is a bugfix so it is still good to go. I&#39;m queuing it (except if<br>
Peter beats me via qemu-arm) and will send a pullreq for it on next<br>
Monday.<br>
<br>
Regards,<br></blockquote><div><br></div><div>Thanks!=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Phil.<br>
</blockquote></div></div>

--000000000000e99acc05d9d2847f--

