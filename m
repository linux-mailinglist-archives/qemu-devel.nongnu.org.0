Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766DA53325E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:22:35 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntb34-0003uQ-J3
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqP-0006MC-IO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:29 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqJ-0002AN-BK
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id gi33so29053107ejc.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RoRm32DAUBvzTDWuU91wm+vveag3rgZu0Hmn9RQ3js0=;
 b=KrYNoNkU3z+iO06k3oe/NycUf/AjgM+TOGSly6R9+IKnLbojyBtyXbBCcatLnZtjGI
 YxB7wwTDfbNTCaAbqJ4gGPrKSNnKxGwrj8blnLmDUTIHbnbQsMg7VaP9xpbfaEzmmgvq
 sytFPBNYY73MfSMFCYMZU6rPrFpZWBPMpx4HvB1dMyKpxvJCB+Wd7ydjYpN+oWUasQFm
 3V/MUU8u4BEZsvoJf7JNiJMFWPLI82r9OUayUB53lUf8rV8zn0xyQsCv9Os9mnfvsjWn
 tmzuvY9dEXC8c8TZwk7rjha1u83kjlZtx5W/TV5M/HoN5JULK+4vRzzGWAdG1DdybZeU
 K3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RoRm32DAUBvzTDWuU91wm+vveag3rgZu0Hmn9RQ3js0=;
 b=gJh8EOHXKqFYYJqW2rAdB0MGaKclDej7zjBWbl77JlMuwlpWBMi8LIuvy8L1tWjiYc
 WtW4QL/LxwNfzuPVko0DQ1aLsV6EA+la1x7diSsH1mwgeTw2CEOSNuzCijNOar5v3BWw
 aOulfrxCuh7JrtpXcYCnAlsN3i8IeHuvRZJLKgqv4IXfn9m0cTKzGSyi3T9lcbr12brj
 Wj+6ysqvH6uUXeT+JO4ZGieKqYddFpd83daWOdWaXOsjUhoRxWHFE6qJ6UGw6RenrrKI
 m/ErOpR0qC4d+ZfeQVsT6Zc00R0BM1/82jjiCrocFlUROd6yo5hNNTpkp3HhEXq2Jr0b
 EcOw==
X-Gm-Message-State: AOAM533AjYWmXDkZlEChdJkDTl374a+VkebMnAvtS8BklSr9hD/kGgpj
 y4ye8G8cmHEFD0NOZgjEgSHqXhgakZrlSdAhnnC+lA==
X-Google-Smtp-Source: ABdhPJwyGGF52SWGoU12KF0arYo5hSp4XOFTNbesj7B/thPOtQIsTPtvkDWodnR1Ch1zTEZpsBBL0+5X65XtDV/t7oU=
X-Received: by 2002:a17:907:9602:b0:6df:e82c:f84 with SMTP id
 gb2-20020a170907960200b006dfe82c0f84mr25714164ejc.590.1653422962035; Tue, 24
 May 2022 13:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-10-damien.hedde@greensocs.com>
 <abd92319-d751-3b62-a73b-674e12aab66c@gmail.com>
In-Reply-To: <abd92319-d751-3b62-a73b-674e12aab66c@gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:09:09 +0800
Message-ID: <CALw707pCwDyAXhpqfv87WD67gAA3P6Dcmg0fuc0UaxXYsS9-CQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] none-machine: allow cold plugging sysbus devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000050e89f05dfc7888e"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000050e89f05dfc7888e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>

On Thu, Mar 3, 2022 at 10:46 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> On 23/2/22 10:07, Damien Hedde wrote:
> > Allow plugging any sysbus device on this machine (the sysbus
> > devices still need to be 'user-creatable').
> >
> > This commit is needed to use the 'none' machine as a base, and
> > subsequently to dynamically populate it with sysbus devices using
> > qapi commands.
> >
> > Note that this only concern cold-plug: sysbus devices cann't be hot
>
> "can not" is easier to understand for non-native / not good level of
> English speakers IMHO.
>
> > plugged because the sysbus bus does not support it.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >   hw/core/null-machine.c | 4 ++++
> >   1 file changed, 4 insertions(+)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>

--00000000000050e89f05dfc7888e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 3, 2022 at 1=
0:46 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.=
daude@gmail.com" target=3D"_blank">philippe.mathieu.daude@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 23/2/=
22 10:07, Damien Hedde wrote:<br>
&gt; Allow plugging any sysbus device on this machine (the sysbus<br>
&gt; devices still need to be &#39;user-creatable&#39;).<br>
&gt; <br>
&gt; This commit is needed to use the &#39;none&#39; machine as a base, and=
<br>
&gt; subsequently to dynamically populate it with sysbus devices using<br>
&gt; qapi commands.<br>
&gt; <br>
&gt; Note that this only concern cold-plug: sysbus devices cann&#39;t be ho=
t<br>
<br>
&quot;can not&quot; is easier to understand for non-native / not good level=
 of<br>
English speakers IMHO.<br>
<br>
&gt; plugged because the sysbus bus does not support it.<br>
&gt; <br>
&gt; Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greenso=
cs.com" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/core/null-machine.c | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
</blockquote></div>

--00000000000050e89f05dfc7888e--

