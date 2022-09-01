Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039F5A9727
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:46:57 +0200 (CEST)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjay-0005eL-4b
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTjFV-0001pK-90
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:24:45 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTjFQ-00088U-2T
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:24:45 -0400
Received: by mail-lf1-x134.google.com with SMTP id v26so13914293lfd.10
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fZb9BRZ8yVmNs+DfvzMeNonuy0ULl2jM9vKfQN1vOqo=;
 b=NQoEVSu7Jw00qkJcMOPdl/iSj9dS02B5xJXgbECv1c+KG4vozfM+V8DIfBB9DqeiEs
 0QRZdGVb5UYS35MIipevKE4FVnyZlr8w1taFyZCkAATHw7fsiEnG1ewyaNjVqf4nQrwq
 vOwp7I+3AFI373wuFIQfKPthayjaDXpalpBrihjcrWj/IBB0hr2dQdItWkA/yVPIdtxU
 2LNUl30K5q2B1G+RNnXGUDsD32VivVotT7MDRUHwwxYKNT7oK/lCfWRmCT1XRExkq1JO
 0+3MAWt6I9fuziTbRj18Iwm9zI/OqlUuyXlnqk4dSBQ4lJDSWZ8Gabcn+oKugn6kmGFd
 wWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fZb9BRZ8yVmNs+DfvzMeNonuy0ULl2jM9vKfQN1vOqo=;
 b=eqJLG25dKRPplKit5UTMvewetAKfVi0+oiOWZIaUZAF9X6L+vprTJjWlcR/zWfMFen
 BYy8ySQSFcEfABmvWBDykmr6tR2VZjF3tvmZvm35sJcXmqyRW6VGdThYQIXv/l3tTfTK
 JQHrzy1U2taa8oBRCQBMVSXBrrmw37Nmi8j++JtSWGu5SeVa0NjFXf8xicGA/2vwTDmU
 HkGLHLMweSNItwPN1lx/epSV99K2KtWJHrgVM4acP62vrrk+WmS0Pqz13mbJ8jDjD+In
 dW5Sh/I9tLN4wwaAZCFLzbRN9wA0TwE48tb+G3Bep12gGIg0ZYSgwqiAb303qtFtY/xz
 N88w==
X-Gm-Message-State: ACgBeo0jWF3/U/pWBAEs0RHofcc9LZat0AYonrU7D/hw4eucBdksQTUO
 MxfXd/yh88rWQ2Ma1muzGQsn/9BFcOajfZ1xa8s=
X-Google-Smtp-Source: AA6agR52YMYeWzAWw2qeWn9PCQS9vr2wec1ush3gqLMs80KJdzc655X1z7NwJ8Ja2MQAI2BUTXnCPqp+m4/b/OCMAuc=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr11725117lfu.167.1662035077597; Thu, 01
 Sep 2022 05:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-49-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-49-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 16:24:25 +0400
Message-ID: <CAJ+F1CLqd8abxyn5x3G8QAH_LXVQ7ABVaJ2+bAq5nt8qRsCgaQ@mail.gmail.com>
Subject: Re: [PATCH 48/51] io/channel-watch: Drop a superfluous '#ifdef WIN32'
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000067933c05e79cb28e"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000067933c05e79cb28e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 2:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> In the win32 version qio_channel_create_socket_watch() body there is
> no need to do a '#ifdef WIN32'.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  io/channel-watch.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/io/channel-watch.c b/io/channel-watch.c
> index 0289b3647c..89f3c8a88a 100644
> --- a/io/channel-watch.c
> +++ b/io/channel-watch.c
> @@ -285,11 +285,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel
> *ioc,
>      GSource *source;
>      QIOChannelSocketSource *ssource;
>
> -#ifdef WIN32
>      WSAEventSelect(socket, ioc->event,
>                     FD_READ | FD_ACCEPT | FD_CLOSE |
>                     FD_CONNECT | FD_WRITE | FD_OOB);
> -#endif
>
>      source =3D g_source_new(&qio_channel_socket_source_funcs,
>                            sizeof(QIOChannelSocketSource));
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000067933c05e79cb28e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:37 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
In the win32 version qio_channel_create_socket_watch() body there is<br>
no need to do a &#39;#ifdef WIN32&#39;.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0io/channel-watch.c | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/io/channel-watch.c b/io/channel-watch.c<br>
index 0289b3647c..89f3c8a88a 100644<br>
--- a/io/channel-watch.c<br>
+++ b/io/channel-watch.c<br>
@@ -285,11 +285,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel *i=
oc,<br>
=C2=A0 =C2=A0 =C2=A0GSource *source;<br>
=C2=A0 =C2=A0 =C2=A0QIOChannelSocketSource *ssource;<br>
<br>
-#ifdef WIN32<br>
=C2=A0 =C2=A0 =C2=A0WSAEventSelect(socket, ioc-&gt;event,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_RE=
AD | FD_ACCEPT | FD_CLOSE |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FD_CO=
NNECT | FD_WRITE | FD_OOB);<br>
-#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0source =3D g_source_new(&amp;qio_channel_socket_source_=
funcs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QIOChannelSocketSource));<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000067933c05e79cb28e--

