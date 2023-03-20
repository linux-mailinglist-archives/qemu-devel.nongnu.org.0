Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4486C1F53
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 19:16:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peK2I-0004Xr-0W; Mon, 20 Mar 2023 14:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1peK2F-0004Vd-31
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:15:07 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1peK2B-00026l-Q8
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:15:05 -0400
Received: by mail-qt1-x82c.google.com with SMTP id bz27so2434239qtb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=drut-io.20210112.gappssmtp.com; s=20210112; t=1679336102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hf9hz4NUJdpXs+dw5Khx3qhvNC2im4M463xojKbf3FI=;
 b=ujG9tY1aTsCivFLbXMQOaEuoDJvy78RPFh6zIMwl+afv01fxQ8VcSde4xm16N7Dzet
 3WznHzHGna55wjQ+ZPURVHw8ibdSitkW/e5vYCaRjWZZhXPEiNl5NQ77xcDpSVUZ9n3I
 OqV3ZUXdWuhV5GuQ+NVFKfV+1GXq2EnslSY0xfXzWSXdekwj6DLHRdndC0md4ZXuKRvT
 dI72lphxYiQLmiwVsLxqUY+f27dOIXil6VolX61b45K1HjuC+wlAI1bjnAKbvgMZowwl
 SyRWpugiMQfiKcAo7c+BM41sfBryR/WrAQHMRpa5gULcE0IYVwPpBFfKC1euydntIb31
 egrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679336102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hf9hz4NUJdpXs+dw5Khx3qhvNC2im4M463xojKbf3FI=;
 b=rLKWMmZZUnviWVFdGeOibZFe4nvIrwZil0rhnzT7G+FKhHht+nU9TYnLhRvscOFso4
 3q6nrgFK16tyxK79OuqE3JCxlcSYKJ9WpVmbv/uDSJJOrzScJZspZV4DxGhdt9tmNewd
 pyMON10odQmkSGBdnhfUklxwqL6k8KSU7SNn6SfxzWVN8nQdmLRmmbw+XBVmUC3cuaFZ
 YVcdN4PF/3dGnpTMxbT+Wq2bKHP9eNstvQSmr7J2dDKkTluTydv/r0xZZKo1fG3FT0IK
 FkynJX1OINq/6JQ4SrxLvtixaezb5Ps+kAellb7IPxI1KRoDS0A4MJOQEpuTxuDJBf3Z
 hpRA==
X-Gm-Message-State: AO0yUKWTj0vEB2h5KMYuU5iOy108VFvgfS4YcWABkCNPHh+wDAxiWcEF
 kqDQuIt9n1ujlZkzkKJVm4E7XGqeGwGSJ7FzQNCUGz8ditcUd8P+
X-Google-Smtp-Source: AK7set/1w8Ql9IREtRmg3rCW2M9szggNTbeUpxdlb2N3GQMIz68OQ3xZveMfQ0omksQN/VjLivWEPt3dOaDKW0nq4Yw=
X-Received: by 2002:ac8:5c91:0:b0:3df:bda6:692f with SMTP id
 r17-20020ac85c91000000b003dfbda6692fmr29166qta.6.1679336102141; Mon, 20 Mar
 2023 11:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
 <87mt4b73sv.fsf@linaro.org> <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
 <CAJ1un7gM4Zf1ZRCG9c-FAcrgUcEtrRX5C0PXFxqOjMq=FzQvvw@mail.gmail.com>
 <1f589f04-8d48-36bd-9518-357d3a0cbfd1@kaod.org>
In-Reply-To: <1f589f04-8d48-36bd-9518-357d3a0cbfd1@kaod.org>
From: Abhishek Singh Dagur <abhishek@drut.io>
Date: Mon, 20 Mar 2023 23:44:50 +0530
Message-ID: <CAJ1un7i1xut-6dF-Eqij8Ge8Ykm=jiE8GN-NaBzDOnGR2+pHSw@mail.gmail.com>
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Srinivas Kodali <srini@drut.io>, qemu-devel@nongnu.org,
 Anand Moon <anand@drut.io>
Content-Type: multipart/alternative; boundary="000000000000d3bb6005f758e760"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=abhishek@drut.io; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000d3bb6005f758e760
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot. It's working fine =F0=9F=98=81 now.

Abhishek.

On Sun, 19 Mar, 2023, 11:27 pm C=C3=A9dric Le Goater, <clg@kaod.org> wrote:

> Hello Abhishek,
>
> On 3/18/23 18:55, Abhishek Singh Dagur wrote:
> > Hi Alex , C=C3=A9dric,
> > we have tried this *option:-serial *pty* -serial *pty* -serial *pty
> *-serial *pty *-serial *pty to check the serial output on screen.
> >
> > Here we are providing 2 scenarios without and with the changes suggeste=
d
> by @C=C3=A9dric Le Goater <mailto:clg@kaod.org> .
> > In first we are able to get /dev/ttyS4 serial port not /dev/ttyS2
> > In second we are able to get /dev/ttyS2 not /dev/ttyS4
> >
> > *Scenario1:****previously with normal qemu build i have tried emulation
> as:*
> >
> > qemu-system-arm -m 512 -M
> ast2500-evb,fmc-model=3Dmx66u51235f,spi-model=3Dmx66u51235f -nographic -d=
rive
> file=3D./pru-1.2.4_dev-rc1.static.mtd,format=3Draw,if=3Dmtd -serial pty -=
serial
> pty -serial pty -serial pty
> >
> > which gives us output as.
> >
> > QEMU 7.2.0 monitor - type 'help' for more information
> > (qemu) char device redirected to /dev/pts/15 (label serial0)
> > char device redirected to /dev/pts/16 (label serial1)
> > char device redirected to /dev/pts/17 (label serial2)
> > char device redirected to /dev/pts/18 (label serial3)
> >
> > so we can use *screen *to interact with the ttyS4 serial port like :
> > screen /dev/pts/15
> > In which we have our boot process and shell prompt .
> >
> > *Scenario2:* *when I am using the newly build image with the changes
> *@C=C3=A9dric Le Goater <mailto:clg@kaod.org>*  provided*
> >
> > With the below command:
> > ./qemu-system-arm -m 512 -M
> ast2500-evb,uart-default=3Duart2,fmc-model=3Dmx66u51235f,spi-model=3Dmx66=
u51235f
> -nographic -drive file=3D./pru-1.2.4_dev-rc1.static.mtd,format=3Draw,if=
=3Dmtd
> -serial pty -serial pty -serial pty -serial pty
>
> Since the machine expect /dev/ttyS2 to be the boot console, the SoC devic=
e
> to attach to the first serial is UART3. This command line should output
> the console logs in the same terminal :
>
>    ./qemu-system-arm -m 512 -M
> ast2500-evb,uart-default=3Duart3,fmc-model=3Dmx66u51235f,spi-model=3Dmx66=
u51235f
> -net user -nographic -drive
> file=3D./pru-1.2.4_dev-rc1.static.mtd,format=3Draw,if=3Dmtd -serial mon:s=
tdio
>
> I have updated the patch in my aspeed-8.0 tree :
>
>
> https://github.com/legoater/qemu/commit/20fe705361dd7ed1d9129747a8a0b6434=
10869e3
>
> Please note that in this last version, the machine option is simply "uart=
".
>
> Thanks,
>
> C.
>

--000000000000d3bb6005f758e760
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks a lot. It&#39;s working fine =F0=9F=98=81 now.<div=
 dir=3D"auto"><br></div><div dir=3D"auto">Abhishek.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 19 Mar, 20=
23, 11:27 pm C=C3=A9dric Le Goater, &lt;<a href=3D"mailto:clg@kaod.org">clg=
@kaod.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Ab=
hishek,<br>
<br>
On 3/18/23 18:55, Abhishek Singh Dagur wrote:<br>
&gt; Hi Alex , C=C3=A9dric,<br>
&gt; we have tried this *option:-serial *pty*=C2=A0-serial *pty*=C2=A0-seri=
al *pty *-serial *pty *-serial *pty to check the serial output on screen.<b=
r>
&gt; <br>
&gt; Here we are providing 2 scenarios without and with the changes=C2=A0su=
ggested by @C=C3=A9dric Le Goater &lt;mailto:<a href=3D"mailto:clg@kaod.org=
" target=3D"_blank" rel=3D"noreferrer">clg@kaod.org</a>&gt;=C2=A0.<br>
&gt; In first we are able to get /dev/ttyS4 serial port not /dev/ttyS2<br>
&gt; In second we are able to get /dev/ttyS2 not /dev/ttyS4<br>
&gt; <br>
&gt; *Scenario1:****previously=C2=A0with normal qemu build i have tried emu=
lation as:*<br>
&gt; <br>
&gt; qemu-system-arm -m 512 -M ast2500-evb,fmc-model=3Dmx66u51235f,spi-mode=
l=3Dmx66u51235f -nographic -drive file=3D./pru-1.2.4_dev-rc1.static.mtd,for=
mat=3Draw,if=3Dmtd -serial pty -serial pty -serial pty -serial pty<br>
&gt; <br>
&gt; which gives us output as.<br>
&gt; <br>
&gt; QEMU 7.2.0 monitor - type &#39;help&#39; for more information<br>
&gt; (qemu) char device redirected to /dev/pts/15 (label serial0)<br>
&gt; char device redirected to /dev/pts/16 (label serial1)<br>
&gt; char device redirected to /dev/pts/17 (label serial2)<br>
&gt; char device redirected to /dev/pts/18 (label serial3)<br>
&gt; <br>
&gt; so we can use *screen *to interact with the ttyS4 serial port like :<b=
r>
&gt; screen /dev/pts/15<br>
&gt; In which we have our=C2=A0boot process and shell prompt .<br>
&gt; <br>
&gt; *Scenario2:* *when I am using the newly build image with the changes *=
@C=C3=A9dric Le Goater &lt;mailto:<a href=3D"mailto:clg@kaod.org" target=3D=
"_blank" rel=3D"noreferrer">clg@kaod.org</a>&gt;*=C2=A0 provided*<br>
&gt; <br>
&gt; With the below command:<br>
&gt; ./qemu-system-arm -m 512 -M ast2500-evb,uart-default=3Duart2,fmc-model=
=3Dmx66u51235f,spi-model=3Dmx66u51235f -nographic -drive file=3D./pru-1.2.4=
_dev-rc1.static.mtd,format=3Draw,if=3Dmtd -serial pty -serial pty -serial p=
ty -serial pty<br>
<br>
Since the machine expect /dev/ttyS2 to be the boot console, the SoC device<=
br>
to attach to the first serial is UART3. This command line should output<br>
the console logs in the same terminal :<br>
<br>
=C2=A0 =C2=A0./qemu-system-arm -m 512 -M ast2500-evb,uart-default=3Duart3,f=
mc-model=3Dmx66u51235f,spi-model=3Dmx66u51235f -net user -nographic -drive =
file=3D./pru-1.2.4_dev-rc1.static.mtd,format=3Draw,if=3Dmtd -serial mon:std=
io<br>
<br>
I have updated the patch in my aspeed-8.0 tree :<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/legoater/qemu/commit/20fe705361d=
d7ed1d9129747a8a0b643410869e3" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://github.com/legoater/qemu/commit/20fe705361dd7ed1d9129747a8a0b64=
3410869e3</a><br>
<br>
Please note that in this last version, the machine option is simply &quot;u=
art&quot;.<br>
<br>
Thanks,<br>
<br>
C.<br>
</blockquote></div>

--000000000000d3bb6005f758e760--

