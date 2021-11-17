Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5739E454C7D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:49:44 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnP43-0001br-8z
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnP2X-0008Jd-Mz
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:48:09 -0500
Received: from [2607:f8b0:4864:20::930] (port=39617
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnP2V-0002P9-7S
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:48:09 -0500
Received: by mail-ua1-x930.google.com with SMTP id i6so7696410uae.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVbvaOfquLKncGFDBe2M/Y4YwsUkfp4WGF45bjWhFDE=;
 b=TUbesez10FKPI+NxYv8Z6IODYMFJYVFU2JodEa8bg3rmYrDM69TVKFdWS+VoQ0yZND
 kg82+f5r9u7+Wyzmi296Z89ifa9WFU7XfAutxAyEaGakz0Cx6JHM3QSvLL8bnjj3+mH0
 UtMUlA0dFake3sgfAYPfGj3rr2n8uZZCFwUaeB9uXusC2TJJcQ2GsE49ybbtH66DXnJS
 bUzwvhPZ/NkP+IgWyTeqGVdkdpi8sMHNePHhLXUk5/lpketMnawCT+NBd7GpyMUdJfNL
 /2s1cLo9QYx5cxLEtUpDsgOxWrVYywFhkG550zgmJC057GEyd5NFCxpwLLWs6z6IFXOB
 WD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVbvaOfquLKncGFDBe2M/Y4YwsUkfp4WGF45bjWhFDE=;
 b=jx3MR/44S4BeULGxfRg3XbNLOM50YyQNfBY/gdD9VRePLitaPAsTCF1LmwZxxeEEfo
 cXZt2jgNfX51LepoXAD9Kr+LQHt9VnCRS4QjaT7dAix7XbR4hLjAEEnT+pusbvDFmTXY
 xWifvkWGxulM1I308SvxkUH55+4x5hBjqya35STp76JtNCRIOtg+F4tLP9osyjpQ7ZsM
 VXpIn3zZ5SdHgIRI3lNsHAbciHvehcgquGcMNIkwkzZt0mscL8hpLE1+0zHeWdOxDLYh
 HgEXkaWSbq/cMqxY7RbXMYrKTdpWwjB+y7ik70BsaIL4ZaTw/ppBQIbpGJfhkDUEPcWg
 qv3Q==
X-Gm-Message-State: AOAM530iTyjiGSu64pzf7Bulx8ZjBPWkCmwwX49lp8ETlR3FlTZDGGeA
 zbd3O9QxMYCBZuF1+auhabi2q6U4OaUva/R03v9szA==
X-Google-Smtp-Source: ABdhPJyRrldZrO+e3+QZwYQxWux3ytnBK41n0qAydYwEL0lJi3U3IsexIWLyWonqQr58cVKpvpgnLpoj+ej9ogzDWVg=
X-Received: by 2002:a67:e050:: with SMTP id n16mr70652383vsl.44.1637171286138; 
 Wed, 17 Nov 2021 09:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20211117174533.1900570-1-philmd@redhat.com>
In-Reply-To: <20211117174533.1900570-1-philmd@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:47:56 -0700
Message-ID: <CANCZdfpVDcddF5n2qhbTV6UU78y2VckH0KFyz5aY-ozj0XEEKA@mail.gmail.com>
Subject: Re: [PATCH] qemu-keymap: Add license in generated files
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f277a405d0ffa49b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f277a405d0ffa49b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 10:46 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qemu-keymap.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/qemu-keymap.c b/qemu-keymap.c
> index 536e8f2385d..4095b654a60 100644
> --- a/qemu-keymap.c
> +++ b/qemu-keymap.c
> @@ -187,6 +187,7 @@ int main(int argc, char *argv[])
>      }
>
>      fprintf(outfile,
> +            "# SPDX-License-Identifier: GPL-2.0-or-later\n"
>              "#\n"
>              "# generated by qemu-keymap\n"
>              "#    model   : %s\n"
> --
> 2.31.1
>
>
>

--000000000000f277a405d0ffa49b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 10:46 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:phi=
lmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0qemu-keymap.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br></blockquote><div><br></div><div>Re=
viewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com=
</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
diff --git a/qemu-keymap.c b/qemu-keymap.c<br>
index 536e8f2385d..4095b654a60 100644<br>
--- a/qemu-keymap.c<br>
+++ b/qemu-keymap.c<br>
@@ -187,6 +187,7 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fprintf(outfile,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;# SPDX-License-Identifier:=
 GPL-2.0-or-later\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;#\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;# generated by qemu-k=
eymap\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;#=C2=A0 =C2=A0 model=
=C2=A0 =C2=A0: %s\n&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000f277a405d0ffa49b--

