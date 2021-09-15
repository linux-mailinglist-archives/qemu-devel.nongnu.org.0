Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40ED40BCB4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 02:37:18 +0200 (CEST)
Received: from localhost ([::1]:50684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQIvO-0000S3-3c
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 20:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQItU-0007tc-KW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 20:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQItP-0001gv-L7
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 20:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631666112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LiUDq0+HPVB8E3/vskx0vkxSF4P9zxVVyD5OoW3+u9M=;
 b=dvSMULJ2EBD3sONcDI9GCu9qgkxwdY3O2FceU+r9cYO4j9eTPMZVrVCrWNV1Nt/ZzS8LBz
 ZCV2j3UVJPXo/k/96lKfVT+kZNC5nOnc2fc1meKogPP3sZBqK8HJNlHkmml8X0VQAG6gfb
 aQzBeIqAaO1p7ynQzGxoWxZiz7hp4M4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-YNqq9rAIM4u2HIYdetharw-1; Tue, 14 Sep 2021 20:35:11 -0400
X-MC-Unique: YNqq9rAIM4u2HIYdetharw-1
Received: by mail-ot1-f70.google.com with SMTP id
 i2-20020a05683033e200b00538e5aa7d41so876246otu.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 17:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LiUDq0+HPVB8E3/vskx0vkxSF4P9zxVVyD5OoW3+u9M=;
 b=oOyyhnMkEDotdziLhsKkyYYqE/lCHmNO3635nmKFsaYSOVPkGrEF1KChVbP7YYiXsd
 1uaJsSFMnLWNStVN76hCNvhEftzGr50zIv/GR/8EDU7NV4PP5Ft/ImOOnOBawEM/vqxj
 gB3PXxTXi1woUIbRoU/vmCQJlDUz/hRCA8XchmaUZZXrdatSTDbm9A2rKN/Bg4FETxnY
 DZPZAcqaP7XIrDDnBGjRfZU8fEn7SecyEAsTktNwGDUmJiHgmE8JG2BVH9ldi8tkljOq
 rSkBeJVpvBcQpZP7ZSr8Fc1zomFSNLhu0iQx39amN6eDC33iSZYpdpHtOGH3QMgWOvwW
 KsjA==
X-Gm-Message-State: AOAM533kmX647ozfoipYhswHgG7UzoEcK0xy4kH6BEDOClNSgZ8RERwW
 Fn/vYrfsQOoNqmAfewnppicAggDJ4aRyi2/00FqjLJeL4/5qyxJ6YeNXWWcQgKlgeObXzlGwDtA
 w14dAYZX6dLT/1/4dvc5jUB1r0DbbcN0=
X-Received: by 2002:aca:add3:: with SMTP id w202mr3310486oie.112.1631666110295; 
 Tue, 14 Sep 2021 17:35:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcxnjVB1CTpNjRuuIatESKrijqveBbuI+hF7cmeBVeJVfUoRbTfxHz2V/MNVrlLYQW17DAf8loxnz6vLZuLoY=
X-Received: by 2002:aca:add3:: with SMTP id w202mr3310472oie.112.1631666110068; 
 Tue, 14 Sep 2021 17:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
 <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
 <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
 <CAKJDGDbxBYQ5O3Cim5evkNfFcLZ_FwFEe7GhQgE=WWHS7jODOg@mail.gmail.com>
 <88820040-ca86-1442-5dd3-68ecbf878c87@amsat.org>
In-Reply-To: <88820040-ca86-1442-5dd3-68ecbf878c87@amsat.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Sep 2021 20:34:59 -0400
Message-ID: <CAFn=p-ZZE9cXFOwgRBd8b3HEnjg2k1c77_ShzeYHfnPZcdSY0g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e221ea05cbfdde69"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e221ea05cbfdde69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 2:30 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 8/27/21 8:01 PM, Willian Rampazzo wrote:
> > Hi, Phil,
> >
> > On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
> wrote:
> >>
> >> Hi Peter,
> >>
> >> On 7/9/21 6:00 PM, Peter Maydell wrote:
> >>> On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>>>
> >>>> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
> wrote:
> >>>>>
> >>>>> Since v1:
> >>>>> - renamed tests (Peter)
> >>>>>
> >>>>> Philippe Mathieu-Daud=C3=A9 (2):
> >>>>>   tests: Remove uses of deprecated raspi2/raspi3 machine names
> >>>>>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
> >>>>
> >>>>
> >>>>
> >>>> Applied to target-arm.next, thanks.
> >>>
> >>> I found that this seems to break 'make check':
> >>>
> >>>  (09/52)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_i=
nitrd:
> >>> ERROR: Could not perform graceful shutdown (40.38 s)
> >>
> >> I can not reproduce. Maybe something got changed in Python/Avocado
> >> since... I'm going to simply respin (updating 6.1 -> 6.2).
> >
> > I also could not reproduce. I checked and nothing changed on the
> > Avocado side. The version is still the same on the QEMU side.
>
> Thanks for double-checking!
>
>
Sorry for the long silence.

Did you get this sorted out? I don't recall changing the QEMUMachine code
upstream lately (Though I have been tinkering with it a lot in my own
branches) -- was the root cause of the failure discovered?

--js

--000000000000e221ea05cbfdde69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Aug 27, 2021 at 2:30 PM Philippe Mathieu-Daud=C3=A9 &lt;=
<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 8/27/21 8:01 PM, Willi=
an Rampazzo wrote:<br>
&gt; Hi, Phil,<br>
&gt; <br>
&gt; On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; Hi Peter,<br>
&gt;&gt;<br>
&gt;&gt; On 7/9/21 6:00 PM, Peter Maydell wrote:<br>
&gt;&gt;&gt; On Fri, 9 Jul 2021 at 16:33, Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Since v1:<br>
&gt;&gt;&gt;&gt;&gt; - renamed tests (Peter)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Philippe Mathieu-Daud=C3=A9 (2):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0tests: Remove uses of deprecated raspi2/ra=
spi3 machine names<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0hw/arm/raspi: Remove deprecated raspi2/ras=
pi3 aliases<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Applied to target-arm.next, thanks.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I found that this seems to break &#39;make check&#39;:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 (09/52) tests/acceptance/boot_linux_console.py:BootLinux=
Console.test_arm_raspi2_initrd:<br>
&gt;&gt;&gt; ERROR: Could not perform graceful shutdown (40.38 s)<br>
&gt;&gt;<br>
&gt;&gt; I can not reproduce. Maybe something got changed in Python/Avocado=
<br>
&gt;&gt; since... I&#39;m going to simply respin (updating 6.1 -&gt; 6.2).<=
br>
&gt; <br>
&gt; I also could not reproduce. I checked and nothing changed on the<br>
&gt; Avocado side. The version is still the same on the QEMU side.<br>
<br>
Thanks for double-checking!<br>
<br></blockquote><div><br></div><div><div dir=3D"ltr"><div>Sorry for the lo=
ng silence.</div><div><br></div><div>Did
 you get this sorted out? I don&#39;t recall changing the QEMUMachine code=
=20
upstream lately (Though I have been tinkering with it a lot in my own=20
branches) -- was the root cause of the failure discovered?<br></div></div>=
=C2=A0</div><div>--js<br></div></div></div>

--000000000000e221ea05cbfdde69--


