Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB2496B96
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 10:59:08 +0100 (CET)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBDAp-0000Qq-Dh
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 04:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noah@statshelix.com>)
 id 1nBD9F-0007Sb-I9
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:57:29 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=34505
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noah@statshelix.com>)
 id 1nBD9D-0001fT-4O
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:57:29 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id v186so34926155ybg.1
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 01:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=statshelix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4cziw3hzSWN+LuXR7g3j3UjqWtX/baqcpHHgzJWrc8=;
 b=8IFpG6U58Uq+HhPIb00x3wDZZsOlA1OpycTTspzazZWbi/a4LlSh6CYM3l7SGz2w8N
 OWJ5txPigOnVEGiby1LMGFU1zjkfO6mTIYa96qpHjZURGjy3pgL9rvxvgGqG4I/7aCxQ
 qGwypjegtE+ymXvJ8WHLm2dbPuzK4S50LYbg8+Wt/zoCCP1msEnPKaWr0kW/XlHuyl8t
 zOlk+gzG2NPQ80FOXyAJE42tdy9DYTtLhJv4WymcqX1JWxcNvSkW2lsqC6Xyn+0T0Fdj
 oOIsho9eqoyC+JErTOuJqSa6++Yc7Wr26lUiwaYrSytpCt6OtIVa6QB+9r2+U0AL2Eu8
 sJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4cziw3hzSWN+LuXR7g3j3UjqWtX/baqcpHHgzJWrc8=;
 b=UKYCozb4UAWHIdCkhuyMM7BSv2nPmIVtQeQfVMfEBXIsPoQvQCuSgyRIsTkhrt3t1+
 xyzt0s5ioqM4fDZ9vHxjfc5u+fPWqM1CPJ+epiiW84AktLKd1q6d6OSsOKXPqmlc82xg
 JXci7Ne9J6Hj6KYHie0+RnpDdvJHTAoIj1cQp3Q+4nDgP7HiRKh4PHpJ1VIJImLhlHNY
 BHk23LmqIhNZnDbqy1ZLC4IuTpzn4DPumAL4mq04UkrCh8bFWZ0x9G0/D1rHxVB81f7w
 buUkQozKjdyC6DbLljwn1jiRsIqqxWATVjfMrvnkIdcKxfxSswmiNe8QbuH9CFu/AI7T
 tfiA==
X-Gm-Message-State: AOAM530/nJyRPlmQtiwz7as8NUc3wbmdS9Oc+ncK/P7KVPKCcQDg2N0R
 08gQtPMWVpOOySZXx2TCbN9pYsO3XENOkhQ/8n0Tvx5Gy6Q=
X-Google-Smtp-Source: ABdhPJxu7iBaYWCen2zJmbT1XdPI94Ulv1diwEJKBKWvEOv5Awxjkcx6RIf3uVA8OaxhjTQ7NuYzN+0ca/vJb2ZAMvo=
X-Received: by 2002:a25:9881:: with SMTP id l1mr10721141ybo.262.1642845445437; 
 Sat, 22 Jan 2022 01:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20211126140437.79745-1-noah@statshelix.com>
 <CABjy+RiwQLNmdSYop1zWq40Jp2HRvf_z5xtDTmKT1R3ff0bHdg@mail.gmail.com>
In-Reply-To: <CABjy+RiwQLNmdSYop1zWq40Jp2HRvf_z5xtDTmKT1R3ff0bHdg@mail.gmail.com>
From: Noah Bergbauer <noah@statshelix.com>
Date: Sat, 22 Jan 2022 10:57:14 +0100
Message-ID: <CABjy+Ri7Cnnnkn8PqhNwfDeNYo8y526TnTanAwV+DuLZWGQ-9g@mail.gmail.com>
Subject: [PATCH] hid: trivial change to support side and extra buttons
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003252ba05d628c3c7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=noah@statshelix.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, kraxel@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003252ba05d628c3c7
Content-Type: text/plain; charset="UTF-8"

ping https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/

This patch is really small because all of the necessary functionality is
already in place. It's just a matter of setting the respective flags
(instead of just ignoring the buttons) and allocating these bits in the HID
descriptor.

On Sat, Dec 4, 2021 at 12:20 PM Noah Bergbauer <noah@statshelix.com> wrote:

> ping https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/
>
> On Fri, Nov 26, 2021 at 3:04 PM Noah Bergbauer <noah@statshelix.com>
> wrote:
>
>> Simply set the respective bits and update the descriptor accordingly.
>>
>> Signed-off-by: Noah Bergbauer <noah@statshelix.com>
>> ---
>>  hw/input/hid.c   | 2 ++
>>  hw/usb/dev-hid.c | 6 +++---
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/input/hid.c b/hw/input/hid.c
>> index 8aab0521f4..e7ecebdf8f 100644
>> --- a/hw/input/hid.c
>> +++ b/hw/input/hid.c
>> @@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev,
>> QemuConsole *src,
>>          [INPUT_BUTTON_LEFT]   = 0x01,
>>          [INPUT_BUTTON_RIGHT]  = 0x02,
>>          [INPUT_BUTTON_MIDDLE] = 0x04,
>> +        [INPUT_BUTTON_SIDE] = 0x08,
>> +        [INPUT_BUTTON_EXTRA] = 0x10,
>>      };
>>      HIDState *hs = (HIDState *)dev;
>>      HIDPointerEvent *e;
>> diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
>> index 1c7ae97c30..bdd6d1ffaf 100644
>> --- a/hw/usb/dev-hid.c
>> +++ b/hw/usb/dev-hid.c
>> @@ -461,14 +461,14 @@ static const uint8_t
>> qemu_mouse_hid_report_descriptor[] = {
>>      0xa1, 0x00,                /*   Collection (Physical) */
>>      0x05, 0x09,                /*     Usage Page (Button) */
>>      0x19, 0x01,                /*     Usage Minimum (1) */
>> -    0x29, 0x03,                /*     Usage Maximum (3) */
>> +    0x29, 0x05,                /*     Usage Maximum (5) */
>>      0x15, 0x00,                /*     Logical Minimum (0) */
>>      0x25, 0x01,                /*     Logical Maximum (1) */
>> -    0x95, 0x03,                /*     Report Count (3) */
>> +    0x95, 0x05,                /*     Report Count (5) */
>>      0x75, 0x01,                /*     Report Size (1) */
>>      0x81, 0x02,                /*     Input (Data, Variable, Absolute) */
>>      0x95, 0x01,                /*     Report Count (1) */
>> -    0x75, 0x05,                /*     Report Size (5) */
>> +    0x75, 0x03,                /*     Report Size (3) */
>>      0x81, 0x01,                /*     Input (Constant) */
>>      0x05, 0x01,                /*     Usage Page (Generic Desktop) */
>>      0x09, 0x30,                /*     Usage (X) */
>> --
>> 2.34.0
>>
>>

--0000000000003252ba05d628c3c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">ping <a href=3D"https://patchew.org/QEMU/=
20211126140437.79745-1-noah@statshelix.com/" target=3D"_blank">https://patc=
hew.org/<span class=3D"gmail-il">QEMU</span>/20211126140437.79745-1-noah@st=
atshelix.com/</a></div><div><br></div><div>This patch is really small becau=
se all of the necessary functionality is already in place. It&#39;s just a =
matter of setting the respective flags (instead of just ignoring the button=
s) and allocating these bits in the HID descriptor.<br></div><div><br></div=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, D=
ec 4, 2021 at 12:20 PM Noah Bergbauer &lt;<a href=3D"mailto:noah@statshelix=
.com">noah@statshelix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div>ping <a href=3D"https://patc=
hew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/" target=3D"_blank"=
>https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/</a></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Nov 26, 2021 at 3:04 PM Noah Bergbauer &lt;<a href=3D"mailto:no=
ah@statshelix.com" target=3D"_blank">noah@statshelix.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Simply set the resp=
ective bits and update the descriptor accordingly.<br>
<br>
Signed-off-by: Noah Bergbauer &lt;<a href=3D"mailto:noah@statshelix.com" ta=
rget=3D"_blank">noah@statshelix.com</a>&gt;<br>
---<br>
=C2=A0hw/input/hid.c=C2=A0 =C2=A0| 2 ++<br>
=C2=A0hw/usb/dev-hid.c | 6 +++---<br>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/input/hid.c b/hw/input/hid.c<br>
index 8aab0521f4..e7ecebdf8f 100644<br>
--- a/hw/input/hid.c<br>
+++ b/hw/input/hid.c<br>
@@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev, QemuCon=
sole *src,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[INPUT_BUTTON_LEFT]=C2=A0 =C2=A0=3D 0x01,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[INPUT_BUTTON_RIGHT]=C2=A0 =3D 0x02,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[INPUT_BUTTON_MIDDLE] =3D 0x04,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_SIDE] =3D 0x08,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_EXTRA] =3D 0x10,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0HIDState *hs =3D (HIDState *)dev;<br>
=C2=A0 =C2=A0 =C2=A0HIDPointerEvent *e;<br>
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c<br>
index 1c7ae97c30..bdd6d1ffaf 100644<br>
--- a/hw/usb/dev-hid.c<br>
+++ b/hw/usb/dev-hid.c<br>
@@ -461,14 +461,14 @@ static const uint8_t qemu_mouse_hid_report_descriptor=
[] =3D {<br>
=C2=A0 =C2=A0 =C2=A00xa1, 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0Collection (Physical) */<br>
=C2=A0 =C2=A0 =C2=A00x05, 0x09,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Page (Button) */<br>
=C2=A0 =C2=A0 =C2=A00x19, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Minimum (1) */<br>
-=C2=A0 =C2=A0 0x29, 0x03,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Maximum (3) */<br>
+=C2=A0 =C2=A0 0x29, 0x05,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Maximum (5) */<br>
=C2=A0 =C2=A0 =C2=A00x15, 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Logical Minimum (0) */<br>
=C2=A0 =C2=A0 =C2=A00x25, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Logical Maximum (1) */<br>
-=C2=A0 =C2=A0 0x95, 0x03,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Count (3) */<br>
+=C2=A0 =C2=A0 0x95, 0x05,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Count (5) */<br>
=C2=A0 =C2=A0 =C2=A00x75, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Size (1) */<br>
=C2=A0 =C2=A0 =C2=A00x81, 0x02,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Input (Data, Variable, Absolute) */<br>
=C2=A0 =C2=A0 =C2=A00x95, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Count (1) */<br>
-=C2=A0 =C2=A0 0x75, 0x05,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Size (5) */<br>
+=C2=A0 =C2=A0 0x75, 0x03,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Size (3) */<br>
=C2=A0 =C2=A0 =C2=A00x81, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Input (Constant) */<br>
=C2=A0 =C2=A0 =C2=A00x05, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Page (Generic Desktop) */<br>
=C2=A0 =C2=A0 =C2=A00x09, 0x30,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage (X) */<br>
-- <br>
2.34.0<br>
<br>
</blockquote></div>
</blockquote></div></div>

--0000000000003252ba05d628c3c7--

