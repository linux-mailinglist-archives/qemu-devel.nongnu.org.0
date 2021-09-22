Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54741509E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:44:03 +0200 (CEST)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT89y-0003EH-O9
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1mT87l-0007Sf-Ij; Wed, 22 Sep 2021 15:41:46 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1mT87h-00084o-RH; Wed, 22 Sep 2021 15:41:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id e7so3869193pgk.2;
 Wed, 22 Sep 2021 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wp58RszS4TEKcT4ZHqt95ma/3tIcpS88hgqai/G6jjA=;
 b=SmQ7JVkyNpPQhED31170d1TT8ilKii51IlOL1OauXnKenFmjV+u3zekf9XV953BI76
 7XepYwFbDU2HQuF/0mrmcqyXzFZ0TE/vMQfk/M/6VVRWRNtPrHeDD67z0l6OkU8/Vqv8
 GhsxTubWU4JU5aFgxAezzIQR/AtmuFi5hIaHyq3O+52Z7GAX+jKXgy07vHiG1ntWLagu
 7Dd/JnJlMBkUfyurpW5e3rlEPPwzB12s3r3pmQ6BTuHu+lBF8NSXOgtrkP+2zzNeI4kx
 T1M0p/VPn/+d+xUnVJdo4if1vAeqEM0SnPTlD5f7IUeLA8NOP3AZZnRr8TydKx/qcDkr
 nuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wp58RszS4TEKcT4ZHqt95ma/3tIcpS88hgqai/G6jjA=;
 b=Uv7R/L6NbB8XWF/S3Jm50/ajCyhfo8KvbHcMelNsN7N27/hN6+4b87DIXr0NBXDDRd
 +q/Eut328EcRF2H8NbyPAdlYwRDEdLaE2qQK3lUr8aavKE88Li+5NOL5dFjuZXl+vuqV
 sEp2YFKcyjnr/t+wAxU6o4+NZdbs+KG2Xwne81Idart4Tx968gKJTXBC1O7w16iYVimt
 PDQjjlLYwF0bP4KWvdXKlU+itMPDzTCXem/UyOySNoi3dPzaYCI6VYbEEgNZndJuGrEJ
 d8t6lo0qvj9jD2NBvZhYKOdueyZOh0Ze61zTpXEqSKnbEaLLANTWWEDPxnMFrDiWD/91
 YBYg==
X-Gm-Message-State: AOAM533djzg0zHN6gfTmDvD/HOJzQupOXs3Oqk7R7xieUKF4UDVp1sd6
 PjxGzDahdGUSgB6nes7NTaJIN1vZ+Sx6/EUYE1I=
X-Google-Smtp-Source: ABdhPJw0i0Dhh2GCdjUOr83MSJvIkuJVFQBsw41jwJRxXF1e45tLb+fCBEat9nJ885xgOIx+a4NNXlbkYd1gKrSB+Mc=
X-Received: by 2002:a65:64c3:: with SMTP id t3mr583363pgv.244.1632339698990;
 Wed, 22 Sep 2021 12:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210920203931.66527-1-agraf@csgraf.de>
In-Reply-To: <20210920203931.66527-1-agraf@csgraf.de>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 22 Sep 2021 21:41:27 +0200
Message-ID: <CAPan3WpYNJgOE9AVpHPegf4Njm=80YXDQYT_jKhKKhUm=r2=hA@mail.gmail.com>
Subject: Re: [PATCH] allwinner-h3: Switch to SMC as PSCI conduit
To: Alexander Graf <agraf@csgraf.de>
Content-Type: multipart/alternative; boundary="000000000000e940e605cc9ab3de"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e940e605cc9ab3de
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

I've tested your patch on the acceptance tests and they all pass:

ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
--show=app,console run -t machine:orangepi-pc
tests/acceptance/boot_linux_console.py
...
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 116.08 s

Also the latest linux kernel is working OK with all cores booting up fine.

At first I couldn't really figure out why simply changing the conduit there
works, without also changing the Linux kernel to match.
But it turns out we just override the provided DTB for this in
fdt_add_psci_node() in hw/arm/boot.c and the Linux kernel then uses that to
decide between HVC and SMC.

So looks fine to me:
  Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
  Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek

On Mon, Sep 20, 2021 at 10:39 PM Alexander Graf <agraf@csgraf.de> wrote:

> The Allwinner H3 SoC uses Cortex-A7 cores which support virtualization.
> However, today we are configuring QEMU to use HVC as PSCI conduit.
>
> That means HVC calls get trapped into QEMU instead of the guest's own
> emulated CPU and thus break the guest's ability to execute virtualization.
>
> Fix this by moving to SMC as conduit, freeing up HYP completely to the VM.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Fixes: 740dafc0ba0 ("hw/arm: add Allwinner H3 System-on-Chip")
> ---
>  hw/arm/allwinner-h3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 27f1070145..f9b7ed1871 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
>
>          /* Provide Power State Coordination Interface */
>          qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
> -                            QEMU_PSCI_CONDUIT_HVC);
> +                            QEMU_PSCI_CONDUIT_SMC);
>
>          /* Disable secondary CPUs */
>          qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
> --
> 2.30.1 (Apple Git-130)
>
>

-- 
Niek Linnenbank

--000000000000e940e605cc9ab3de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,</div><div><br></div><div>I&#39;ve teste=
d your patch on the acceptance tests and they all pass:</div><div><br></div=
><div>ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avoc=
ado --show=3Dapp,console run -t machine:orangepi-pc tests/acceptance/boot_l=
inux_console.py</div><div>...<br></div><div>RESULTS =C2=A0 =C2=A0: PASS 5 |=
 ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB TIME =
=C2=A0 : 116.08 s</div><div><br></div><div>Also the latest linux kernel is =
working OK with all cores booting up fine.</div><div><br></div><div>At firs=
t I couldn&#39;t really figure out why simply changing the conduit there wo=
rks, without also changing the Linux kernel to match.</div><div>But it turn=
s out we just override the provided DTB for this in fdt_add_psci_node() in =
hw/arm/boot.c and the Linux kernel then uses that to decide between HVC and=
 SMC.</div><div><br></div><div>So looks fine to me:</div><div>=C2=A0 Review=
ed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niek=
linnenbank@gmail.com</a>&gt;</div><div>=C2=A0 Tested-by: Niek Linnenbank &l=
t;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&=
gt;</div><div><br></div><div>Regards,</div><div>Niek<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 2=
0, 2021 at 10:39 PM Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de">a=
graf@csgraf.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The Allwinner H3 SoC uses Cortex-A7 cores which support virtu=
alization.<br>
However, today we are configuring QEMU to use HVC as PSCI conduit.<br>
<br>
That means HVC calls get trapped into QEMU instead of the guest&#39;s own<b=
r>
emulated CPU and thus break the guest&#39;s ability to execute virtualizati=
on.<br>
<br>
Fix this by moving to SMC as conduit, freeing up HYP completely to the VM.<=
br>
<br>
Signed-off-by: Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de" target=
=3D"_blank">agraf@csgraf.de</a>&gt;<br>
Fixes: 740dafc0ba0 (&quot;hw/arm: add Allwinner H3 System-on-Chip&quot;)<br=
>
---<br>
=C2=A0hw/arm/allwinner-h3.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
index 27f1070145..f9b7ed1871 100644<br>
--- a/hw/arm/allwinner-h3.c<br>
+++ b/hw/arm/allwinner-h3.c<br>
@@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev, Erro=
r **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Provide Power State Coordination Inter=
face */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_prop_set_int32(DEVICE(&amp;s-&gt;cpu=
s[i]), &quot;psci-conduit&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_PSCI_CONDUIT_HVC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_PSCI_CONDUIT_SMC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable secondary CPUs */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_prop_set_bit(DEVICE(&amp;s-&gt;cpus[=
i]), &quot;start-powered-off&quot;,<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--000000000000e940e605cc9ab3de--

