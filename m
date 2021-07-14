Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE23C7F52
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 09:27:52 +0200 (CEST)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ZJ9-0007Xg-Ei
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 03:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m3ZGl-00056A-UE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:25:26 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m3ZGk-0007hL-3c
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:25:23 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id a16so1636579ybt.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJuQJduVQqSwrMrGVIOZV1+nEWsQFBcDDVLvFcXiTTU=;
 b=YfXOs7Fc1SOz+MsBM5YfEWpOwOIZ2cDK3q6Kp8PqNbie+LT14Qr0UVFvjd6K/Q7psi
 ooaLswyGOKGo+kcvCNT+tRrrQ59REij6fWceKRdbSWSCGVLI9SRsCXr/F9HiP8jtAJ4e
 iA4Zs6gDrB4M4ishXL8mEfInAP8KDaJ1RU6w2kh4hZz70uAGevsSI8pF+wp3xYWP+5hb
 7aH/76h1KBgff+JQpuZwteuJBpAl3s1ZZjFc5wGJwNWjVBi7JKK5Bduo+J+Ep1d27O/f
 1pKFO4Y/JqyKRR5Q4YIbxRrBmSLptUqPzj5zvN9J3lQTjAXYChAjnKXLBIm3IQLC4Q8h
 re8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJuQJduVQqSwrMrGVIOZV1+nEWsQFBcDDVLvFcXiTTU=;
 b=eim3UueuiRSQ0/N5HVgGIiL/2CTFsXdPI8f3deeCAC+3XQpuGMkhpMsPmvto54jQ47
 AbvuDMciUa1RGVQkIMtKTUIX48eVubsHxvPRfuA25qxQ9ksCkXS1Mqrv6q/d0frywm59
 nFZj51WrgvlmH5mzFIz+C9BnGoiTRekC9S7UowaCsXAcFD7T2KeUy3IvFM+PtWGvkOZW
 g+voFVfJ81QdAxAr71ao1cNfWI8njamU/uTo2UgOXOrrpfv04uqx0aPybiYmNpw9fIAk
 SO/ah2QtSIJSmBnj8MquwS/nxI6AH2Ls1Ld9mOW7kPXni76cdV7XejEYFt1/1xySLH9u
 FeOQ==
X-Gm-Message-State: AOAM533Jmp+De2HrSlHkSEBPIs3OjG+1rTDBEA99kcPqLzR3fvdWnLFJ
 quupjCaXR7pRenNSr1r4QjnJPtyLwgQr2k1nhpQjXKoWSGk=
X-Google-Smtp-Source: ABdhPJy7YPW7YeEc3Qykr6DKuN/t45fDA2geKuJXC2SvpC0CyAeeZ+pYlQbco7M5dMRDzEnL71NFlm9dYtIca4NopO4=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr11497700ybm.345.1626247520440; 
 Wed, 14 Jul 2021 00:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210621125017.113989-1-konstantin@daynix.com>
 <CAJ28CFSxqVawommAhzH+Fu++Xf4gtQdBQCZ6mHGVpTi6qUK2MA@mail.gmail.com>
 <CAJ28CFS4qBccGOd+e2rSN0dL2k5ROb5NJgcKe2CyzR2RZ+CF3Q@mail.gmail.com>
In-Reply-To: <CAJ28CFS4qBccGOd+e2rSN0dL2k5ROb5NJgcKe2CyzR2RZ+CF3Q@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 14 Jul 2021 10:25:09 +0300
Message-ID: <CAJ28CFSuag9RjOfdDHOOtccoGxLUc63EKhkd5F52S5=gFJ_8kw@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c5ebfe05c7104114"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5ebfe05c7104114
Content-Type: text/plain; charset="UTF-8"

ping


On Sun, Jul 11, 2021 at 8:18 PM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

> ping
>
> On Sun, Jul 4, 2021 at 8:51 AM Konstantin Kostiuk <konstantin@daynix.com>
> wrote:
>
>> ping
>>
>> On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk <konstantin@daynix.com>
>> wrote:
>>
>>> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>>> ---
>>>  qga/commands-win32.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>>> index 300b87c859..93b08fd4b5 100644
>>> --- a/qga/commands-win32.c
>>> +++ b/qga/commands-win32.c
>>> @@ -2209,9 +2209,10 @@ typedef struct _ga_win_10_0_server_t {
>>>      char const *version_id;
>>>  } ga_win_10_0_server_t;
>>>
>>> -static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
>>> +static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
>>>      {14393, "Microsoft Windows Server 2016",    "2016"},
>>>      {17763, "Microsoft Windows Server 2019",    "2019"},
>>> +    {20344, "Microsoft Windows Server 2022",    "2022"},
>>>      {0, 0}
>>>  };
>>>
>>> --
>>> 2.25.1
>>>
>>

--000000000000c5ebfe05c7104114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div>ping</div>=
</div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 11, 2021 at 8:18 PM Konstantin Kostiuk &lt;<a h=
ref=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sun, Jul 4, 2021 at 8:51 AM Konstantin Kostiuk &lt;<a href=3D"ma=
ilto:konstantin@daynix.com" target=3D"_blank">konstantin@daynix.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk &lt;<a =
href=3D"mailto:konstantin@daynix.com" target=3D"_blank">konstantin@daynix.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix=
.com" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 300b87c859..93b08fd4b5 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2209,9 +2209,10 @@ typedef struct _ga_win_10_0_server_t {<br>
=C2=A0 =C2=A0 =C2=A0char const *version_id;<br>
=C2=A0} ga_win_10_0_server_t;<br>
<br>
-static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] =3D {<=
br>
+static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0{14393, &quot;Microsoft Windows Server 2016&quot;,=C2=
=A0 =C2=A0 &quot;2016&quot;},<br>
=C2=A0 =C2=A0 =C2=A0{17763, &quot;Microsoft Windows Server 2019&quot;,=C2=
=A0 =C2=A0 &quot;2019&quot;},<br>
+=C2=A0 =C2=A0 {20344, &quot;Microsoft Windows Server 2022&quot;,=C2=A0 =C2=
=A0 &quot;2022&quot;},<br>
=C2=A0 =C2=A0 =C2=A0{0, 0}<br>
=C2=A0};<br>
<br>
--<br>
2.25.1<br>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>

--000000000000c5ebfe05c7104114--

