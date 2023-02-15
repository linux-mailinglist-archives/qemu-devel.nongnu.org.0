Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4CA697F62
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYQ-0002aA-OE; Wed, 15 Feb 2023 10:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pS8Is-0000Xl-6X
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:17:55 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pS8Im-0000lY-98
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:17:51 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 nh19-20020a17090b365300b00233ceae8407so677731pjb.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 19:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wpYqBUorMz6JJkWEQndvCQaT3gGuwwBlaLUOV+9PU8Y=;
 b=KRq/6SDaCdITc08EtIOdH7z4WFQRT1k0RyYIKKOLQ1g1ryWuUNc5JbP956E6QGjN6u
 XZViI5WUnIn4T86fGYaiYBUsEUqG7iP+Inn4KLB1UesqzMcfPw3ispj1tO1xlznUxHF+
 RVPbJqGXhjOesS4WN8UrnIbqyNylD18UAO2G6slfmPjbxCPG3/Ebf9cKoCCTiQBuEYIy
 71cIhLs2POvcmrEg1kqhDpzKXYH5kEUtnf9b+W3/89VKgkP2SjYsmCfl5MaHJWPMNaxB
 G7yzi51La8oF0mxvhLZLEswpuG8xUGEDCQ895Q7yN1k2AnZ67uvm3yb342ga6Yie3Njj
 g2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpYqBUorMz6JJkWEQndvCQaT3gGuwwBlaLUOV+9PU8Y=;
 b=PGkTf8nfeiZmoQxo9xLlKIY7VWnPMdvys/uGJamuwx0nw1KjPHO3a7/lN9LqoHrn7Z
 kL8nLXin87oEaXsYKw4rmUEE/CVrxyjhX3qqVkw3NYPvZ6BQVtgBRy5WhyOksra5BPG/
 SEOmaW68D4yCfL4vCfS0TC29cFYUKg80l4ITzhNkidP1zb0UsBgvqrPNbs1HH7m3VpcW
 N0lWRymgM2+VCyhDBG+UF1Zwf9p1Oju3Gr2JkQ+21btkcpsGdd9cTOa21hJ8+f9Ax+Cx
 BDcWHNaY4gdMLbdvQF9NTUw9bwmz3hqnml96vK2NQGNbI9MMQ8HSSLHTZF4NpX/puOMt
 X01A==
X-Gm-Message-State: AO0yUKUMjnK/MmV3zXTKiT0DhukbF4h3meXIzCAVURjSYBBmG6gjCeB5
 mALTzao0tlKogV6Gk81aNkJCT3CNgPw9EKyOtYnBbYBRaFL6PJelF35NLRFzwIeOJuLF55I9J3o
 TeBZqfOVt6KAi6d3WLf1vQcWZyCarvNvgUDUlbIG0570jgNbs+LQs+AyFcaSSLj/ujnYZhhRwhD
 VjV3lMs5+HbSFqq2av/5+ZqTs/uF5ljOoJbw==
X-Google-Smtp-Source: AK7set+YVFpW2nh7XS706BUtNcpDbVHjwei4IDxKBlK9L+8uGwqz/gYAryLqstvvSo1DB71c3ZUDjWV4qVA8Y4ZSIy8=
X-Received: by 2002:a17:90a:49c6:b0:233:b04f:4e65 with SMTP id
 l6-20020a17090a49c600b00233b04f4e65mr240352pjm.43.1676431049969; Tue, 14 Feb
 2023 19:17:29 -0800 (PST)
MIME-Version: 1.0
References: <167636845806.2107.2382940753543768501-2@git.sr.ht>
 <9a5b9e5a-ed67-e2b3-ddda-56220e40c00a@kaod.org>
In-Reply-To: <9a5b9e5a-ed67-e2b3-ddda-56220e40c00a@kaod.org>
From: Sittisak Sinprem <ssinprem@celestica.com>
Date: Wed, 15 Feb 2023 10:17:02 +0700
Message-ID: <CAE+aGtWgAH7bxoB=hieV6_9j3xiByJ6L-pbSBpBS=RHBoiT+Ug@mail.gmail.com>
Subject: Re: [PATCH qemu 2/2] aspeed/fuji : correct the eeprom size
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, srikanth@celestica.com, 
 kgengan@celestica.com, Peter Delevoryas <peter@pjd.dev>
Content-Type: multipart/alternative; boundary="00000000000039b5cf05f4b48597"
X-CLS-Gapps: True
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: celesticainc,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ssinprem@celestica.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 10:18:35 -0500
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

--00000000000039b5cf05f4b48597
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Follow the question " Could you please specify the size in bytes ? "

Yes, In the source code we need to set the size value as byte.

I add "divide by 8" to convert it to bytes unit.
24c64  size is  64kbit  =3D 64k / 8  bytes

-    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB / 8);

On Tue, Feb 14, 2023 at 9:29 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello,
>
> Adding Peter since he contributed the fuji machine,
>
> On 2/14/23 10:06, ~ssinprem wrote:
> > From: Sittisak Sinprem <ssinprem@celestca.com>
> >
> > Device 24C64 the size is 64 kilobits
> > Device 24C02 the size is 2 kilobits
>
> Could you please specify the size in bytes ?
>
> You will need to add a Signed-off-by tag.
>
> Thanks,
>
> C.
>
> > ---
> >   hw/arm/aspeed.c | 32 ++++++++++++++++----------------
> >   1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 55f114ef72..8e6a1579e4 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -846,42 +846,42 @@ static void fuji_bmc_i2c_init(AspeedMachineState
> *bmc)
> >       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> >       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
> >
> > -    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> > -    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> > +    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB / 8);
> >
> >       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
> >       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
> >       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
> >       i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
> >
> > -    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
> >
> >       i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> > -    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
> >       i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
> >
> >       i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
> >       i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
> >
> > -    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
> >       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> > -    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB / 8);
> >
> > -    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
> >       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> > -    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> > +    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB / 8);
> >
> >       for (int i =3D 0; i < 8; i++) {
> >           aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
>
>

--00000000000039b5cf05f4b48597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:trebuche=
t ms,sans-serif;font-size:small;color:#134f5c">Hi,<br><br>Follow the questi=
on &quot;

<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
Could you please specify the size in bytes ? &quot;<br></span><br>Yes, In t=
he source code we need to set the size value as byte.<br><br>I add &quot;di=
vide by 8&quot; to convert it to bytes unit.<br>24c64=C2=A0 size is=C2=A0 6=
4kbit=C2=A0 =3D 64k / 8=C2=A0 bytes<br><br><span style=3D"color:rgb(34,34,3=
4);font-family:Arial,Helvetica,sans-serif">-=C2=A0 =C2=A0 aspeed_eeprom_ini=
t(i2c[65], 0x53, 64 * KiB);</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,34);font-fam=
ily:Arial,Helvetica,sans-serif">+=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[65], =
0x53, 64 * KiB / 8);</span><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 9:29 PM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
Adding Peter since he contributed the fuji machine,<br>
<br>
On 2/14/23 10:06, ~ssinprem wrote:<br>
&gt; From: Sittisak Sinprem &lt;<a href=3D"mailto:ssinprem@celestca.com" ta=
rget=3D"_blank">ssinprem@celestca.com</a>&gt;<br>
&gt; <br>
&gt; Device 24C64 the size is 64 kilobits<br>
&gt; Device 24C02 the size is 2 kilobits<br>
<br>
Could you please specify the size in bytes ?<br>
<br>
You will need to add a Signed-off-by tag.<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed.c | 32 ++++++++++++++++----------------<br>
&gt;=C2=A0 =C2=A01 file changed, 16 insertions(+), 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt; index 55f114ef72..8e6a1579e4 100644<br>
&gt; --- a/hw/arm/aspeed.c<br>
&gt; +++ b/hw/arm/aspeed.c<br>
&gt; @@ -846,42 +846,42 @@ static void fuji_bmc_i2c_init(AspeedMachineState=
 *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[17], TYPE_LM75, =
0x4c);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[17], TYPE_LM75, =
0x4d);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[3], TYPE_LM75, 0=
x48);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[3], TYPE_LM75, 0=
x49);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[3], TYPE_LM75, 0=
x4a);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[3], TYPE_TMP422,=
 0x4c);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[8], TYPE_LM75, 0=
x4a);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[50], TYPE_LM75, =
0x4c);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[51], TYPE_TMP75,=
 0x48);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[52], TYPE_TMP75,=
 0x49);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[59], TYPE_TMP75,=
 0x48);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[60], TYPE_TMP75,=
 0x49);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[66], TYPE_TMP75,=
 0x49);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[66], TYPE_TMP75,=
 0x48);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[74], TYPE_TMP75,=
 0x49);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[74], TYPE_TMP75,=
 0x48);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);<br>
&gt; -=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB / 8);<br>
&gt; +=C2=A0 =C2=A0 aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB / 8);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; 8; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_eeprom_init(i2c[81 + i =
* 8], 0x56, 64 * KiB);<br>
<br>
</blockquote></div>

--00000000000039b5cf05f4b48597--

