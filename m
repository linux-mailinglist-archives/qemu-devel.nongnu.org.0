Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F53C3E49
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 19:21:48 +0200 (CEST)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2d9G-0008Nj-Ly
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 13:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m2d6U-0005As-Ec
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:18:54 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m2d6S-0000qt-Ob
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:18:54 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id x192so24350221ybe.6
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nslXqNHKeeorZiZlDe5BVCzcYf8WwV3E6LlugsdxALI=;
 b=VPxS53pIzky/CK7+nW6I6BXTrVVA2+rGh6CKj3Bns2dPvvcimKuJvvI4Mw/OuSV5Fp
 xMYpUZoYc/6VRFI/n0ni3EKzRyazIYdR2jgE6VtDVoHUtIDbw0FPBdrTyB01cncY1v7H
 4Zly7kwhSidnpmmx7Ut/ITnpzrWIo1kUuxHdpnreAxvRzffjAEF1ZKRGnZnb+bfaU7dg
 b4CkiHPrV8Vrf+DpIMaqpofysOxpd8S9ZVhhFck6ZBvobdgo4wvx1SyqtE3NNr5BZaMW
 NI8UqimDGuiK7D3q7x9KwwG2YI09Cvqi67zjIxfsL6ZNZcP7tOwLD0VWDoudJcOeaZrJ
 iUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nslXqNHKeeorZiZlDe5BVCzcYf8WwV3E6LlugsdxALI=;
 b=M9MGeLWJnJTc+N0nm05Wo+61aHdhJuklzoBxwp7t4AYFrDq2vzHrqkfSYsCEx7eogd
 DnxTTRNQX4uzNzlm6oB4qpEDYMfwBW9Wxdm6XPq474JfY3UIxzgT+F8YRxreFdvRuieA
 sH6fPLr6jPTUGPCqd6e0qmktraWOCbqPTCyvYGJjNFFTGhvqPOyCA2TwLpideqlAQhwK
 nWoEtmqV/44g13COSRoGq2FiRwJvevXIUVODoELjDO9ZmXnf8/O3pQRMAk9WxIcDy5pb
 JyWDxe5UCHaDLHGHUXlsxS5OYigIBlvcq4iRc4pg0m6Dh6tkqEJsQRp9XJ4NgYSxX7OR
 mTfw==
X-Gm-Message-State: AOAM530J4ccnVSyuvhQL+qTW7PnDJkKb3b0eO64JBlGi0EJcWmHkMtG1
 2Qz1doJIzGZ3lr9DuF/or5embHN2KgpbbQxZZcggLRp4VIw=
X-Google-Smtp-Source: ABdhPJz9RWxRHz4rTMsewjdV6JPbsJr2p3+yNyVI3rDc77o3EPuJnckrFMTORTzTNB+YTNLpdFyZBYLsqFKRJnkzFVg=
X-Received: by 2002:a25:3482:: with SMTP id
 b124mr59048909yba.297.1626023931268; 
 Sun, 11 Jul 2021 10:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621125017.113989-1-konstantin@daynix.com>
 <CAJ28CFSxqVawommAhzH+Fu++Xf4gtQdBQCZ6mHGVpTi6qUK2MA@mail.gmail.com>
In-Reply-To: <CAJ28CFSxqVawommAhzH+Fu++Xf4gtQdBQCZ6mHGVpTi6qUK2MA@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Sun, 11 Jul 2021 20:18:40 +0300
Message-ID: <CAJ28CFS4qBccGOd+e2rSN0dL2k5ROb5NJgcKe2CyzR2RZ+CF3Q@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d1e29305c6dc32be"
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d1e29305c6dc32be
Content-Type: text/plain; charset="UTF-8"

ping

On Sun, Jul 4, 2021 at 8:51 AM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

> ping
>
> On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk <konstantin@daynix.com>
> wrote:
>
>> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>> ---
>>  qga/commands-win32.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>> index 300b87c859..93b08fd4b5 100644
>> --- a/qga/commands-win32.c
>> +++ b/qga/commands-win32.c
>> @@ -2209,9 +2209,10 @@ typedef struct _ga_win_10_0_server_t {
>>      char const *version_id;
>>  } ga_win_10_0_server_t;
>>
>> -static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
>> +static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
>>      {14393, "Microsoft Windows Server 2016",    "2016"},
>>      {17763, "Microsoft Windows Server 2019",    "2019"},
>> +    {20344, "Microsoft Windows Server 2022",    "2022"},
>>      {0, 0}
>>  };
>>
>> --
>> 2.25.1
>>
>

--000000000000d1e29305c6dc32be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, Jul 4, 2021 at 8:51 AM Konstantin Kostiuk =
&lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
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

--000000000000d1e29305c6dc32be--

