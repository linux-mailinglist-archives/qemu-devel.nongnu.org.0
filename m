Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD62F5114
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:27:37 +0100 (CET)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjvk-000160-7G
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kzjiO-0005YM-Kc
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:13:48 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:34980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kzjiM-0001uI-Km
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:13:48 -0500
Received: by mail-lf1-x131.google.com with SMTP id u25so3887797lfc.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4F+d8U7HRo/P6Q8u9Ze8a9ylX0+mtB4RwQkuh2io3Zc=;
 b=fwvxNGVUlUDLuFJPhnmi1C0vcsLfCelIdy7LW3GeLRoOtYDFbMGdb9ajPUiIN29QR2
 nts23tYeODo710UEZ4bkovdyfqLeoUO1yGlDgSSQull2QNoZALTcsRTE7+2rJ2apq9rO
 K+EtdNFpMQSow5ncqFssaYqavSNf1nKUb4GLRTPX6FpgPJWu5EqRQ80U23yY0O0MsPUr
 2M1FfAegi1AnNbTViBqRXcXD8pIPXKSeEzAU/SJdI5K6uOtpcoewTeXXU1AKyzPqALUi
 krwkW9EVx6bKuqB37N6gj5SWZf5T/YrtbS4yvWfZru/xrVVb8Z1H/ti6XZv0r1/F9YfE
 9mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4F+d8U7HRo/P6Q8u9Ze8a9ylX0+mtB4RwQkuh2io3Zc=;
 b=ZPxNoJ4eES21y9/PxpVmbjEbHE8erBEujgGZeO7SCvuOUtVqsFupuFYeZFPT0Xy5IV
 8Get1VpbmXmsCeM2Xtl2lGSboyg8h85Cr2OIKbDv/qdeYZRs65H3lLN9ofjF+VEQL1as
 Kys4FfTvLKUdiUQQ0X61QUk1PbY8akdrAMoMWQM4oN5xaskyYAQmUP2ERETgAIHiO2op
 aWv4j1EAT1bLMsizXhDDZpXBl9QjaMe1uqewTTXUf9OFfjpWGsG/Zt1DSGpDLZBRvqGE
 FDzly7NeuSqiEzm1LIHbeA6QEDm5Wj7v5iUyv12rZVx2RHdZminNVeuFbygOaEBmHhc3
 bnOg==
X-Gm-Message-State: AOAM53320YF1k6A4W8StlVxo7J4jk46yz3Pk9aK3g3jq4fIphH0gI3tY
 zd1B4ZOB10WAz0jEOoOE6q18erLknv048J/hKbJofA==
X-Google-Smtp-Source: ABdhPJwwJo/PqxBRwd5KCFkvXvVJ1pkwc3Q0oJ+/uFfZd2nfwctIOfLr3gicUKuKOxujZoyGyHfks+GdmGr4U6SudVQ=
X-Received: by 2002:a19:54c:: with SMTP id 73mr1261131lff.551.1610558024794;
 Wed, 13 Jan 2021 09:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-19-peter.maydell@linaro.org>
 <CAFEAcA-yMwWc6vtA=E1ysZtxuT3w_h4Kquuj5pqxZB0sRD9HJg@mail.gmail.com>
In-Reply-To: <CAFEAcA-yMwWc6vtA=E1ysZtxuT3w_h4Kquuj5pqxZB0sRD9HJg@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 13 Jan 2021 09:13:33 -0800
Message-ID: <CAGcCb12vAYYUvKHCdmOf2PzSHfHYz53kqEtT6cwtfXAVuUMvUA@mail.gmail.com>
Subject: Re: [PULL 18/21] hw/misc: Add a PWM module for NPCM7XX
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f5a58305b8cb428e"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000f5a58305b8cb428e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 13, 2021 at 8:03 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 12 Jan 2021 at 16:58, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > From: Hao Wu <wuhaotsh@google.com>
> >
> > The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> > identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> > two outputs: frequency and duty_cycle. Both are computed using inputs
> > from software side.
>
> Hi; Coverity reports a possibly-overflowing arithmetic operation here
> (CID 1442342):
>
> > +static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
> > +{
> > +    uint64_t duty;
> > +
> > +    if (p->running) {
> > +        if (p->cnr == 0) {
> > +            duty = 0;
> > +        } else if (p->cmr >= p->cnr) {
> > +            duty = NPCM7XX_PWM_MAX_DUTY;
> > +        } else {
> > +            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
>
> Here all of p->cmr, p->cnr and NPCM7XX_PWM_MAX_DUTY are 32-bits,
> so we calculate the whole expression using 32-bit arithmetic
> before assigning it to a 64-bit variable. This could be
> fixed using eg a cast of NPCM7XX_PWM_MAX_DUTY to uint64_t.
>
> Incidentally, we don't actually do any 64-bit
> arithmetic calculations on 'duty' and we return
> a uint32_t from this function, so 'duty' itself could
> be a uint32_t, I think...
>
Since NPCM7XX_PWM_MAX_DUTY =1,000,000 and p->cmr can have up to 65535, The
overflow is possible. We might want to cast NPCM7XX_PWM_MAX_DUTY to
uint64_t or #define NPCM7XX_PWM_MAX_DUTY 1000000ULL
duty itself could be a uint32_t as you point out. Since p->cmr is less than
p->cnr in this line, duty cannot exceed NPCM7XX_PWM_MAX_DUTY, so there's no
overflow after this computation.

Thank you for finding this!

Hao

>
> > +        }
> > +    } else {
> > +        duty = 0;
> > +    }
> > +
> > +    if (p->inverted) {
> > +        duty = NPCM7XX_PWM_MAX_DUTY - duty;
> > +    }
> > +
> > +    return duty;
> > +}
>
> thanks
> -- PMM
>

--000000000000f5a58305b8cb428e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 13, 2021 at 8:03 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, 12 Jan 2021 at 16:58, Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;<br>
&gt;<br>
&gt; The PWM module is part of NPCM7XX module. Each NPCM7XX module has two<=
br>
&gt; identical PWM modules. Each module contains 4 PWM entries. Each PWM ha=
s<br>
&gt; two outputs: frequency and duty_cycle. Both are computed using inputs<=
br>
&gt; from software side.<br>
<br>
Hi; Coverity reports a possibly-overflowing arithmetic operation here<br>
(CID 1442342):<br>
<br>
&gt; +static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t duty;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (p-&gt;running) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p-&gt;cnr =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (p-&gt;cmr &gt;=3D p-&gt;cnr) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D NPCM7XX_PWM_MAX_DU=
TY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D NPCM7XX_PWM_MAX_DU=
TY * (p-&gt;cmr + 1) / (p-&gt;cnr + 1);<br>
<br>
Here all of p-&gt;cmr, p-&gt;cnr and NPCM7XX_PWM_MAX_DUTY are 32-bits,<br>
so we calculate the whole expression using 32-bit arithmetic<br>
before assigning it to a 64-bit variable. This could be<br>
fixed using eg a cast of NPCM7XX_PWM_MAX_DUTY to uint64_t.<br>
<br>
Incidentally, we don&#39;t actually do any 64-bit<br>
arithmetic calculations on &#39;duty&#39; and we return<br>
a uint32_t from this function, so &#39;duty&#39; itself could<br>
be a uint32_t, I think...<br></blockquote><div>Since NPCM7XX_PWM_MAX_DUTY =
=3D1,000,000 and p-&gt;cmr can have up to 65535, The overflow is possible. =
We might want to cast NPCM7XX_PWM_MAX_DUTY to uint64_t or #define NPCM7XX_P=
WM_MAX_DUTY 1000000ULL</div><div>duty itself could be a uint32_t as you poi=
nt out. Since p-&gt;cmr is less than p-&gt;cnr in this line, duty cannot ex=
ceed NPCM7XX_PWM_MAX_DUTY, so there&#39;s no overflow after this computatio=
n.</div><div><br></div><div>Thank you for finding this!</div><div><br></div=
><div>Hao</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (p-&gt;inverted) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D NPCM7XX_PWM_MAX_DUTY - duty;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return duty;<br>
&gt; +}<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000f5a58305b8cb428e--

