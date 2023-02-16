Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F20698EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZvj-0002sV-IQ; Thu, 16 Feb 2023 03:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSZvh-0002ri-Oz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:47:49 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSZvf-0005Tb-Nw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:47:49 -0500
Received: by mail-pl1-x62b.google.com with SMTP id m2so1351998plg.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HzYKo787Fm9ms5Hl0FBgLydwj+FY7rLeHNuPSLsKBqg=;
 b=boaYews3HQcePbhnDBi+F4OFIJPt2cTFBdY/x/tiH6cElxky5rvRy+xtLSBnEwfdQ8
 RZrYnHfQEAkdluM5wTDJEpk6lSgqueME/7ZJUH2e/mMHZa8wcjWbwUq3YZdlk8UORPIF
 uwD4q/tc579EYWgIaskUZTeLnyUn9toDRNTM5aZ44i8qZX0Y4D2s23SQxfxPXngu7/ZH
 sWGMBgN3A70Pl42xzoH5xAUxS6oyPb2kgRsufW6dkFdBjsBFBshZStZj7lMUo2yCSC6w
 lWERB0Eu6/eSas3XPq5tp4gXs6T6peUP67eVDheB8mVD4wWG8hGeWwKe2u+V05BjeoSv
 9QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HzYKo787Fm9ms5Hl0FBgLydwj+FY7rLeHNuPSLsKBqg=;
 b=6uHu2weKM/eczo3HZJTKnP5ZOzot5JzdJjTkL7p2FHRdHcr3GJs4DDbGLXHq6ckr+L
 pH0bDNObj7JlYSohcEteIYe7q1RLpeb0xotbmp7zWVHyMX1lRElXTvZqTZpBR5iUaEl6
 VPkwKEe/ppa7Atl15OHbtxwPfP+tiyNwxHposC8YBQr5SV9X7m/UKBbP0u65FJcmIXzW
 7dDillrYxCKJPThpGZ1ALf97BquuUezk1m31qwI0lNE1xXOp0GfwBFYM4HM8YxVu/0hk
 wxF4dA3kR4zizCf/WmqnH56gV4iw/vovPfBiJ6J5kOB9R1jT3uzDB10zhCHv3WJHasv8
 lqkQ==
X-Gm-Message-State: AO0yUKWS+QaZ42mTR/zTH2dmQMGZu57f2naZYSZou3ZE5LCW50fu7BX0
 3cS6qk6oQj/KPKY78OuziiF4Jnfg21/Lt9Ujx1WvMMQeLtbgAYos8aITCf5NtbvYW9I2eTgOwdK
 JcVHwWGcdscKNU9WBYiTgtfRC/OQtthf0uskPe77O6LcnXYmXdwE5gYeQ7Vaov8f0q0gKRPe7Ik
 IqPH9Ptkjqvu+yYONngFfuhho7YPgh8240DA==
X-Google-Smtp-Source: AK7set9GkbAPUIHBMJaQY8/EENuAW+kNgcz+CkAhQnZEkW2COvRo70B/HZUJriA1nhyQTwTkeJJWheHH6XaCBf3phYg=
X-Received: by 2002:a17:903:1ce:b0:19a:e90d:b102 with SMTP id
 e14-20020a17090301ce00b0019ae90db102mr281004plh.0.1676537265323; Thu, 16 Feb
 2023 00:47:45 -0800 (PST)
MIME-Version: 1.0
References: <167636845806.2107.2382940753543768501-1@git.sr.ht>
 <0f69bfe5-3c49-c072-833c-24e19b91ad1b@linaro.org>
In-Reply-To: <0f69bfe5-3c49-c072-833c-24e19b91ad1b@linaro.org>
From: Sittisak Sinprem <ssinprem@celestica.com>
Date: Thu, 16 Feb 2023 15:47:18 +0700
Message-ID: <CAE+aGtXvEzbKBcnDxTGBVAm+i9t6TN0dX6CEocv2-Napzooe=Q@mail.gmail.com>
Subject: Re: [PATCH qemu 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, srikanth@celestica.com, 
 kgengan@celestica.com
Content-Type: multipart/alternative; boundary="00000000000027620c05f4cd4022"
X-CLS-Gapps: True
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: celesticainc,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ssinprem@celestica.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000027620c05f4cd4022
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

the EEPROM size less than or equal to 256 , such as 24c02
use only 1 byte to mention the memory (0 - 255) (0x00 - 0xff)

 write byte
  [ Start sAddr/W ] -> [ mem Addr ] -> [ mem data ] -> [ Stop ]

 read byte
  [ Start sAddr/W ] -> [ mem Addr ]
    -> [ reStart sAddr/R] -> [ mem data ]-> [ Stop ]

---------------------------------------------------------------
Meanwhile, in EEPROM size more 256 , such as 24c64 has size 8192 bytes
(0x2000)
use 2 bytes for pointing the memory (0x0000 - 0x2000 )

 write byte
  [ Start sAddr/W ] -> [ 1st mem Addr ] -> [ 2nd mem Addr ]
   -> [ Mem Data ] -> [ Stop ]

  read byte
  [ Start sAddr/W ] -> [ 1st mem Addr ] -> [ 2nd mem Addr ]
   -> [ reStart sAddr/R] -> [ mem data ]-> [ Stop ]

On Thu, Feb 16, 2023 at 3:25 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 10/2/23 07:20, ~ssinprem wrote:
> > From: Sittisak Sinprem <ssinprem@celestca.com>
> >
> > ---
> >   hw/nvram/eeprom_at24c.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index 2d4d8b952f..693212b661 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -87,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
> >       EEPROMState *ee =3D AT24C_EE(s);
> >       uint8_t ret;
> >
> > -    if (ee->haveaddr =3D=3D 1) {
> > +    if (ee->rsize > 256 && ee->haveaddr =3D=3D 1) {
> >           return 0xff;
> >       }
>
> What represents this '256' magic value? Please add a definition.
>

--00000000000027620c05f4cd4022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:&quot;trebuchet ms&quot;,sans-serif;font-size:small;color:rgb(19,7=
9,92)">Hi Philippe,<br><br>the EEPROM size less than or equal to 256 , such=
 as 24c02<br>use only 1 byte to mention the memory (0 - 255) (0x00 - 0xff)<=
br><br>=C2=A0write byte<br>=C2=A0 [ Start sAddr/W ] -&gt; [ mem Addr ] -&gt=
; [ mem data ] -&gt; [ Stop ]<br><br>=C2=A0read byte<br>=C2=A0 [ Start sAdd=
r/W ] -&gt; [ mem Addr ] <br>=C2=A0 =C2=A0 -&gt; [ reStart sAddr/R] -&gt; [=
 mem data ]-&gt; [ Stop ]<br><br>------------------------------------------=
---------------------<br>Meanwhile, in EEPROM size more 256 , such as 24c64=
 has size 8192 bytes (0x2000)<br>use 2 bytes for pointing the memory (0x000=
0 - 0x2000 )<br><br>=C2=A0write byte<br>=C2=A0 [ Start sAddr/W ] -&gt; [ 1s=
t mem Addr ] -&gt; [ 2nd mem Addr ]<br>=C2=A0 =C2=A0-&gt; [ Mem Data ] -&gt=
; [ Stop ]<br><br>=C2=A0 read byte<br>=C2=A0 [ Start sAddr/W ] -&gt; [ 1st =
mem Addr ] -&gt; [ 2nd mem Addr ] <br>=C2=A0 =C2=A0-&gt; [ reStart sAddr/R]=
 -&gt; [ mem data ]-&gt; [ Stop ]<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 16, 2023 at 3:25 PM =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 10/2/23 07:20, ~ssinprem wrote:<br>
&gt; From: Sittisak Sinprem &lt;<a href=3D"mailto:ssinprem@celestca.com" ta=
rget=3D"_blank">ssinprem@celestca.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/nvram/eeprom_at24c.c | 8 +++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c<br>
&gt; index 2d4d8b952f..693212b661 100644<br>
&gt; --- a/hw/nvram/eeprom_at24c.c<br>
&gt; +++ b/hw/nvram/eeprom_at24c.c<br>
&gt; @@ -87,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EEPROMState *ee =3D AT24C_EE(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t ret;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (ee-&gt;haveaddr =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 if (ee-&gt;rsize &gt; 256 &amp;&amp; ee-&gt;haveaddr =
=3D=3D 1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0xff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
What represents this &#39;256&#39; magic value? Please add a definition.<br=
>
</blockquote></div></div>

--00000000000027620c05f4cd4022--

