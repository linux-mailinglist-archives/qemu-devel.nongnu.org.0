Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0B3D8924
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:55:01 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8eP6-0004TT-0b
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m8eNv-0002j2-RG
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:53:47 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m8eNt-000322-S2
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:53:47 -0400
Received: by mail-yb1-xb35.google.com with SMTP id x192so2569950ybe.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrZzl2TJzznMAj5Hjj+vjccuT8SAEkgf7bkKqH7a5sE=;
 b=pyZrZp9v1IS6juwtD4motv5wInJuG7DkPqgfgO5g7Cor4ao6SZlYU6aIAVIiOFh9UG
 KEJHW/llKoRxq4U8Y7bFRbdERQMu1yb2P+lua8ZXB42RBHXgc8voCh5FPEgNiR/DpRro
 NQTrU10B1EG/W17LHB61KnwuwJP0PMdBmcjVCAKywLMQvHkyq0bztbQl1kFSBvQKnJOj
 sVqB3e3lWkDw0V6ZNDaIdRxQ5VEyA4ZzCBQy5FTRfd9p7aktnPzGfTnXsoxBmxXlRQ0q
 KtAq0j2PDAUlniLyL6PSygCYW4yHArHAOzeKPtMYa1uZvaiPAleeGte7VV4bsfbIDmDt
 nGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrZzl2TJzznMAj5Hjj+vjccuT8SAEkgf7bkKqH7a5sE=;
 b=L/U6Edcjk22J1r7qNA6WZIwuqNwni7xRkiF6OvhIuxVoJKwaBCLOX/u+HTD11toLel
 8BAh7qwfn7iumiHHs7ow7lhbOcdF531Q2rnh+LHAc/43ri+f6uNTIWHpQdzLTFuLJ5Ao
 8o6ViAd1WEf5+lFRj342S+YK5XTpFXUofHsviYMhkND2vAl329k5MgvA4TFsxcLJuYxt
 ZAzRTGNfbdSJtIIOVGJicaHefZc2XMLLu23wHJcxhVR4/wKkZfoNQtVqXu/4W+lMc2Ha
 6pxAmpeeS7o94s0j21GDA+4kMY4v8kRIfFSedoo7V4vS3kialhbwqFz6R2WyNPQcpNW4
 4fnQ==
X-Gm-Message-State: AOAM5315YmBJ3YtjDCgoIizitIY750KyXHKMkWLbrz33ID9vn9rqwjGh
 DdozpBhpNqB1G2vNNL8fv2NCpdVwgBbuMlZWWUSFyYVt0Wkj9w==
X-Google-Smtp-Source: ABdhPJy/g/v5qjT7lxbPF692s2Equ7XDAm+UB3gkvr3QvVwvkgpmloTWu++IwIlKz/3S1q/jyZwNaHvfiNPuT7bhtj8=
X-Received: by 2002:a25:8011:: with SMTP id m17mr35664293ybk.479.1627458823748; 
 Wed, 28 Jul 2021 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210621125017.113989-1-konstantin@daynix.com>
 <CAJ28CFSxqVawommAhzH+Fu++Xf4gtQdBQCZ6mHGVpTi6qUK2MA@mail.gmail.com>
 <CAJ28CFS4qBccGOd+e2rSN0dL2k5ROb5NJgcKe2CyzR2RZ+CF3Q@mail.gmail.com>
 <CAJ28CFSuag9RjOfdDHOOtccoGxLUc63EKhkd5F52S5=gFJ_8kw@mail.gmail.com>
In-Reply-To: <CAJ28CFSuag9RjOfdDHOOtccoGxLUc63EKhkd5F52S5=gFJ_8kw@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 28 Jul 2021 10:53:32 +0300
Message-ID: <CAJ28CFQsv7HN5HemsiXByz0zPAPfpuYYyzkNBUN6cyV22vW6qQ@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000138f1005c82a49d8"
Received-SPF: none client-ip=2607:f8b0:4864:20::b35;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb35.google.com
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

--000000000000138f1005c82a49d8
Content-Type: text/plain; charset="UTF-8"

ping

On Wed, Jul 14, 2021 at 10:25 AM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

>
> ping
>
>
> On Sun, Jul 11, 2021 at 8:18 PM Konstantin Kostiuk <konstantin@daynix.com>
> wrote:
>
>> ping
>>
>> On Sun, Jul 4, 2021 at 8:51 AM Konstantin Kostiuk <konstantin@daynix.com>
>> wrote:
>>
>>> ping
>>>
>>> On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk <
>>> konstantin@daynix.com> wrote:
>>>
>>>> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>>>> ---
>>>>  qga/commands-win32.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>>>> index 300b87c859..93b08fd4b5 100644
>>>> --- a/qga/commands-win32.c
>>>> +++ b/qga/commands-win32.c
>>>> @@ -2209,9 +2209,10 @@ typedef struct _ga_win_10_0_server_t {
>>>>      char const *version_id;
>>>>  } ga_win_10_0_server_t;
>>>>
>>>> -static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
>>>> +static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
>>>>      {14393, "Microsoft Windows Server 2016",    "2016"},
>>>>      {17763, "Microsoft Windows Server 2019",    "2019"},
>>>> +    {20344, "Microsoft Windows Server 2022",    "2022"},
>>>>      {0, 0}
>>>>  };
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>

--000000000000138f1005c82a49d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 10:25 AM Konstantin Kostiu=
k &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr"><div>pin=
g</div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Jul 11, 2021 at 8:18 PM Konstantin Kostiuk &=
lt;<a href=3D"mailto:konstantin@daynix.com" target=3D"_blank">konstantin@da=
ynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 4, 2021 at 8:51 AM Konstantin =
Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com" target=3D"_blank">kons=
tantin@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 3:50 PM K=
ostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com" target=3D"_b=
lank">konstantin@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D=
"mailto:konstantin@daynix.com" target=3D"_blank">konstantin@daynix.com</a>&=
gt;<br>
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
</blockquote></div>

--000000000000138f1005c82a49d8--

