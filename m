Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817A93BABA3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 07:52:51 +0200 (CEST)
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzv3i-0005YJ-1x
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 01:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lzv2m-0004tm-Fl
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 01:51:52 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:38663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lzv2j-0004VC-LE
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 01:51:52 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id m9so23617653ybo.5
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efOrK+rmWzIUnl5iyGIXNd47gkbdHojoqRs3LMFPtWY=;
 b=hHONlzlK0ffluEyqWwyvC3kBVUZa9Xoo+Qan0Be6QiW1kdvwZefec3ZVPicU1PnNjO
 W4orA1f8PPm0k41iRfoo/4zVa9C9KLqAWCWoF5njeCPze1z694+JC9cCtwfo0gstTefj
 DcXsMQPqaCaNR0TixjjQV6k1n4pWLIAAYUjQ6GtPIe/4EKHR7kZPJEVp1jHN9KiMyZFp
 C+/6A7QF+PU5Hsl+FvHHM9FHrAKgfy2RDPtj9vulAfY1HbaJODB08txmu1HfGJjXL5C6
 TI1IqOsF6a5tFucQ26gZWGtfv363f9RL9lOpVo/ihwZmAUAMnt++K0SKYrwnY6/PdcJG
 QpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efOrK+rmWzIUnl5iyGIXNd47gkbdHojoqRs3LMFPtWY=;
 b=TbM+NBWCpKT6Aztsl2wFplDmDecwNwCdtATj2Vd/HjnIsg4ogqmAQGuHoONwhXYYWL
 dWr1SNFBNenIgmltaq5cwG+OJBZFx8ESGssYhOnMwAzgjlab8+x+XFHkMOPk21B6vI6p
 B4knOABgdqkQaoIAfBKi3uYq09LBBwnnWR16SF6t+GaGM+C3BAuBZelAcRNiDLLeje+4
 k7yjDm/+mcRsXi2nqHY/VVE3eEovP6AgyhXS3TjG9UWpRDZFufALJ4rkhoDeMvOa5krz
 FA/DRE/wUPw92AxTU8sbkzD4IqrSrCa5UycaY6Arc/DxVOJoWVp5rbVwqVk853sVu6bi
 EPHA==
X-Gm-Message-State: AOAM532denIj4pEmlKJ1blaQe9TMCuRnAX2fgbDRBdoupUcfHk4IIStU
 yaDVnNtV89jfYIumbpsDZxQyXfPi39F1iOXF4MwReuZyCP3Xsw==
X-Google-Smtp-Source: ABdhPJy+l881Pw55cgMbukDGlZtqdBtboo1WC0++1lDDT9xln9YoFQUFxw3oVvkoPp76kkJnArKWU/vxyLt84jtPoTQ=
X-Received: by 2002:a25:3d41:: with SMTP id k62mr9091624yba.479.1625377907493; 
 Sat, 03 Jul 2021 22:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210621125017.113989-1-konstantin@daynix.com>
In-Reply-To: <20210621125017.113989-1-konstantin@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Sun, 4 Jul 2021 08:51:36 +0300
Message-ID: <CAJ28CFSxqVawommAhzH+Fu++Xf4gtQdBQCZ6mHGVpTi6qUK2MA@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cd5cb105c645c80b"
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

--000000000000cd5cb105c645c80b
Content-Type: text/plain; charset="UTF-8"

ping

On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk <konstantin@daynix.com>
wrote:

> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> ---
>  qga/commands-win32.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 300b87c859..93b08fd4b5 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2209,9 +2209,10 @@ typedef struct _ga_win_10_0_server_t {
>      char const *version_id;
>  } ga_win_10_0_server_t;
>
> -static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
> +static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
>      {14393, "Microsoft Windows Server 2016",    "2016"},
>      {17763, "Microsoft Windows Server 2019",    "2019"},
> +    {20344, "Microsoft Windows Server 2022",    "2022"},
>      {0, 0}
>  };
>
> --
> 2.25.1
>

--000000000000cd5cb105c645c80b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk=
 &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-o=
ff-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com" targ=
et=3D"_blank">konstantin@daynix.com</a>&gt;<br>
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

--000000000000cd5cb105c645c80b--

