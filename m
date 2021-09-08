Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0704032C1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 04:51:54 +0200 (CEST)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNngn-0007ll-AB
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 22:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mNnfe-0006kk-5m
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 22:50:42 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mNnfc-0007mN-Gu
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 22:50:41 -0400
Received: by mail-io1-xd32.google.com with SMTP id g9so1213780ioq.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 19:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3qbXLdBt9HSWHHYMQLDoMk1bdYBalLH8Qnk10bQw3hI=;
 b=ZzN3IagwG23I7TEjiTv1Y9BjQNtxlJ/0JlAHvA3VVurOXOOUiRMwR8QGZ2IOH8eujU
 iMrzGip0WEpwaf5ndy0FnBBEQvVcJaLskkJ0O4uIdX9rX+V65YBd3zHe5qdDIUZ/dO8E
 SHSCSVXJm1/fj3tA4euZGtt/w0TxaL6+vJV6EYK2OzpBmI+hJi2udrcd8SFO9ekto5SJ
 kcbHKnP0rvCmY66okVh1I1D2nS6nKU4DttL3jwi/6AthOE57XMOLl6kXMce1+B2wGKEk
 LvuZSEcrArzXIJ3JoYgp50No042rnIlbE/vzFV/0e1NKU9GkPHTCzlpO0+g2auTmL4lG
 PoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3qbXLdBt9HSWHHYMQLDoMk1bdYBalLH8Qnk10bQw3hI=;
 b=ufHaZxk1JMvvdTEZA8N8BsUCHKcIYXGqbXGaJ4lWl/CTkFUvOfQPFRaBMVA0Lc31sQ
 rhAlgHfUiUlnfxDYh+Qrr0Ej2YdVj3LTp+UY9/PrqclRjdOETAfNUxmO6jxxSCxS6EOv
 +9B8Y9GAmyuzLFAMJbRVKGEJa6tRv3R4YH1v9mMu7Uwxs8A0aMkwJi5Mj+5lecpptCo2
 Y0oeA2X/swvMG1cTcC2kbcsVQvdp6WuHwMNRgc1h6oQAFCgjLY1UhlhD9daGUqBLbtiH
 N/yqCUGod5PsA7X5cRIQhpsjQjdxu8fLxGa3vOUDSWOJiM3yfWQi5yTmDizOO/+0uskg
 g+1Q==
X-Gm-Message-State: AOAM533z9WhFB2eXnl/eprr2RFazbcdi7G/nluFToVoYDx+1O7ZAaYHX
 ReKQ6fu9SvR4RAdodfPzAN1K+BrRQQ4erXNUA+U=
X-Google-Smtp-Source: ABdhPJxcqZNdH6wyz2kdX/uVTIVkygbqWU4NtWmhGIYm4brI5McHbP8KPUbuVdosTrNKM0ZzOxz76QwVVRFI/C4lPVU=
X-Received: by 2002:a05:6602:d9:: with SMTP id
 z25mr1249320ioe.154.1631069439301; 
 Tue, 07 Sep 2021 19:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTbw0m-n0wmqYPw9C_SFVrCYvqOde6qUsB40FMM9BVPHZg@mail.gmail.com>
 <CAFEAcA-H_titydNAYO94k4i5uiJyTXXt=tNyPd7RfjFMjRYb1w@mail.gmail.com>
In-Reply-To: <CAFEAcA-H_titydNAYO94k4i5uiJyTXXt=tNyPd7RfjFMjRYb1w@mail.gmail.com>
From: Duo jia <jiaduo19920301@gmail.com>
Date: Wed, 8 Sep 2021 10:50:27 +0800
Message-ID: <CALUzjTbsSte6rzFVr+k6EyUJTJV8GW2N5yhxBYxZcjkoCJ=K7g@mail.gmail.com>
Subject: Re: Application of QEMUTimer in short timing.
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000889d0b05cb72f28d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000889d0b05cb72f28d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you for your reply.I understand.

Also I want to know how to make a delay in qemu.
For example, when I send a UART data, there is a certain time interval from
setting the register to when the data is sent. Most of this time does not
affect the simulation effect, but some guest firmware will execute errors
when there is no such delay. This is a comparison. Few, but it does exist.

My question is, if I really want to add such a delay, how to do it. For
example, in USART, can I set a callback for sending completion, or add some
delays that will not cause qemu to freeze.





Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=887=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=888:20=E5=86=99=E9=81=93=EF=BC=
=9A

> On Tue, 7 Sept 2021 at 12:28, Duo jia <jiaduo19920301@gmail.com> wrote:
> >
> > In the controller, QEMUTimer will be used in the implementation of time=
r
> simulation.
> >
> > I wrote an auto-loading timer with a period of 1ms and the clock source
> used is QEMU_CLOCK_VIRTUAL. But it doesn't seem to be very accurate,
> because the actual time after I accumulated it to 500 times took about
> 700ms.
>
> It depends on how you use it. Generally the actual firing will not happen
> exactly on the specified mark. So if your implementation is "set clock
> for 1ms in the future; when it fires, set for 1ms in the future again"
> that is likely to be inaccurate. If you implement it as "set clock for
> 1ms in the future; when it fires, set for 1ms after the time when it
> should have fired" it will probably be better.
>
> In particular, if the semantics of your timer fit the ptimer API
> (which can implement oneshot and periodic timers) then I would recommend
> using that instead of a raw QEMUTimer; it deals with a lot of these
> fiddly details for you.
>
> -- PMM
>

--000000000000889d0b05cb72f28d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thank you for your reply.I understand.<div><br><div>Also I=
 want to know how to make a delay in qemu.<br>For example, when I send a UA=
RT data, there is a certain time interval from setting the register to when=
 the data is sent. Most of this time does not affect the simulation effect,=
 but some guest firmware will execute errors when there is no such delay. T=
his is a comparison. Few, but it does exist.<br><br>My question is, if I re=
ally want to add such a delay, how to do it. For example, in USART, can I s=
et a callback for sending completion, or add some delays that will not caus=
e qemu to freeze.<br><div><br></div><div><br><div><div><br></div><div><br><=
/div></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Peter Maydell &lt;<a href=3D"mailto:peter.may=
dell@linaro.org">peter.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B49=
=E6=9C=887=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=888:20=E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, 7 Sept 2021 at 12:28, Duo jia &lt;<a href=3D"mailto:jiaduo19920301@gma=
il.com" target=3D"_blank">jiaduo19920301@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; In the controller, QEMUTimer will be used in the implementation of tim=
er simulation.<br>
&gt;<br>
&gt; I wrote an auto-loading timer with a period of 1ms and the clock sourc=
e used is QEMU_CLOCK_VIRTUAL. But it doesn&#39;t seem to be very accurate, =
because the actual time after I accumulated it to 500 times took about 700m=
s.<br>
<br>
It depends on how you use it. Generally the actual firing will not happen<b=
r>
exactly on the specified mark. So if your implementation is &quot;set clock=
<br>
for 1ms in the future; when it fires, set for 1ms in the future again&quot;=
<br>
that is likely to be inaccurate. If you implement it as &quot;set clock for=
<br>
1ms in the future; when it fires, set for 1ms after the time when it<br>
should have fired&quot; it will probably be better.<br>
<br>
In particular, if the semantics of your timer fit the ptimer API<br>
(which can implement oneshot and periodic timers) then I would recommend<br=
>
using that instead of a raw QEMUTimer; it deals with a lot of these<br>
fiddly details for you.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000889d0b05cb72f28d--

