Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7595EF56E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:27:02 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsd3-0006De-5q
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrj2-0006Q5-SG
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:16 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrj1-0007KO-2P
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:08 -0400
Received: by mail-lj1-x230.google.com with SMTP id l12so1193034ljg.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mXjBLR4Z1F9zskir2EGTCIeLMYFQA55yAgBAOn4WGRA=;
 b=f/iXDqvwG1skNOe+jaT4AqgI8wD4bYaGK7KCDlciM+HHtAaaU/WiImpoNsOk8lwAnS
 cjq0UrerRMLHaOqAvv0hbPbIUJOpFi8s3OrMZSidt3F07BcZ9TsEk9i4C1poUT3m+UOd
 pZvHtzj/Zwy6vY74NfGCK20D5g091FURpq3zeChE8O54B2W7OAFpNHgWSSDnMK/YGBaF
 yAVUlq5vLLtmgM48bzDoNFqBK5ugZm/WapB/mYKIsKw1BKgYcZ4dWVYpwXOW48mJHPl4
 7q8ztbGIixTU9wEZS3rEDmbMFlrtcwiw3bCD8BHB1iEpifui/9KV8VApg+axzttAeePp
 eNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mXjBLR4Z1F9zskir2EGTCIeLMYFQA55yAgBAOn4WGRA=;
 b=rnZ5UWds3uPVwuld3GZD8gW4aC9Mtw12HC/vs8t3btUTzWdvxrPgcj/7Ld5eKNwhuF
 z4gGfG9o26toJYDLd487V4fhJJTky2Hhce0wisSYASp7J/MMUclBC7WnfoEJMrVGBXLV
 f9KnTO26hSQ9hlU2dtCQjWuSF2u/gXE+QCg5Q/6gD1AhMMMEbLz0ZSyOZ0qg7QTw9GmS
 1kdK5VS+Gh4kAO2XdiXHdfFUCPFBvMv8TlSV+66Pa0DLhG26qS1OmtEi4vBHo0ZSxiG5
 SBI4HtEGH3CBsIHEdJEo1TGcayVa8Lklvdd3eaNj3lm2IvLtJRHM1y/jJsO8fGh/CmTu
 Cmdg==
X-Gm-Message-State: ACrzQf0mvxsAWbite6pUcybdYaHm3xXHzqC9XYK6GPRMEtTgadNL1WRF
 38R/m3Qq2T3OwQcX6o8ZPxVVfRTIKapLql+GuTQ=
X-Google-Smtp-Source: AMsMyM60mb6laGqy5hCHoeSiBAXQTZlv1jp2l1vuVpsIeA55S4nexlw8JI1vI8NTVDm3ig7OTjA+FDaQF7I9+7jNp9Q=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr939118ljp.267.1664450944798; Thu, 29 Sep
 2022 04:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-5-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220929075239.1675374-5-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 15:28:51 +0400
Message-ID: <CAJ+F1CL8FyK65xrFrMa890fxe2tc8D=m0SkPCAkaxXYRVf+FXg@mail.gmail.com>
Subject: Re: [PATCH 4/7] qga: Add shutdown/halt/reboot support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="0000000000004f971805e9cf2fe7"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004f971805e9cf2fe7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 1:02 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Add appropriate shutdown command arguments to qmp_guest_shutdown()
> for FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-posix.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 49f9996a9c..88e0d0fe24 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
>      const char *powerdown_flag =3D "-i5";
>      const char *halt_flag =3D "-i0";
>      const char *reboot_flag =3D "-i6";
> +#elif defined(CONFIG_BSD)
> +    const char *powerdown_flag =3D "-p";
> +    const char *halt_flag =3D "-h";
> +    const char *reboot_flag =3D "-r";
>  #else
>      const char *powerdown_flag =3D "-P";
>      const char *halt_flag =3D "-H";
> @@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
>  #ifdef CONFIG_SOLARIS
>          execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
>                "hypervisor initiated shutdown", (char *)NULL);
> +#elif defined(CONFIG_BSD)
> +        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
> +               "hypervisor initiated shutdown", (char *)NULL);
>  #else
>          execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>                 "hypervisor initiated shutdown", (char *)NULL);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004f971805e9cf2fe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 1:02 PM Alexa=
nder Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com" target=3D=
"_blank">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Add appropriate shutdown command arg=
uments to qmp_guest_shutdown()<br>
for FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.l=
ureau@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 49f9996a9c..88e0d0fe24 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode,=
 Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0const char *powerdown_flag =3D &quot;-i5&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *halt_flag =3D &quot;-i0&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *reboot_flag =3D &quot;-i6&quot;;<br>
+#elif defined(CONFIG_BSD)<br>
+=C2=A0 =C2=A0 const char *powerdown_flag =3D &quot;-p&quot;;<br>
+=C2=A0 =C2=A0 const char *halt_flag =3D &quot;-h&quot;;<br>
+=C2=A0 =C2=A0 const char *reboot_flag =3D &quot;-r&quot;;<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0const char *powerdown_flag =3D &quot;-P&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *halt_flag =3D &quot;-H&quot;;<br>
@@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode=
, Error **errp)<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(&quot;/sbin/shutdown&quot;, &quot;s=
hutdown&quot;, shutdown_flag, &quot;-g0&quot;, &quot;-y&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor ini=
tiated shutdown&quot;, (char *)NULL);<br>
+#elif defined(CONFIG_BSD)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(&quot;/sbin/shutdown&quot;, &quot;shutdo=
wn&quot;, shutdown_flag, &quot;+0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL);<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(&quot;/sbin/shutdown&quot;, &quot;s=
hutdown&quot;, &quot;-h&quot;, shutdown_flag, &quot;+0&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000004f971805e9cf2fe7--

