Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33390551AA6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 15:14:06 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3HEC-0002Ks-At
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 09:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3HBh-0000fC-8h
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:11:29 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3HBe-000187-JR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:11:29 -0400
Received: by mail-lj1-x22c.google.com with SMTP id b23so3281522ljh.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gMMqISBIbXLkKDJjpv3vkDxdNNppVy8tMFJlAEeOxQ=;
 b=d6bIUCL43XLNm7pJdDWfcWFhtUmbSuYFIH3fuk16NKMXQ5ymI9e/uDXUHx6hm8IppV
 ZfCsL3uvRDNwvU/p9YeNR0F0MiKNmsG9mDV5k7BmNWYqw8+M4RUDhepDblfrWrnSfMl2
 AO0s7QeLVqvCyMvW1jrxNrUC67gMXh+mo5/UWoNgkKcpctYM5l7uG2T6Oh31/7ww3ee9
 +EbnJtx4CCHbbYoZLAP1QhzWbuRqrZrw+1XhOnrDeBQ3yrI8u3mWJc/fxI/EYdimcAmT
 2qJ8CZfMR/9vLUJHcUhJUfuxQ5lhnAXMZ4TmJD9NFOyL0z7Cxo18EBTahF8IyzquxdXm
 K5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gMMqISBIbXLkKDJjpv3vkDxdNNppVy8tMFJlAEeOxQ=;
 b=0cgAm16ADBD8s9D2XrYtb4SMRJC51O+k6CX6qwlHDI00zYJVKR/f3Y9uL28MmRzlfW
 O0CEN8zPwHXg9GwhJsjjnjdJRMX4quckEm102euwzQwOSwxuiRlLVGrQVGpkjtm+Dj4H
 JLuF/yIsA6Q1DpVt730EfZdOebCHENBxkXVrUxtHuh/VzBhUXsmZ7uhO09HhPDhNiPEq
 v/IpCfpMn4O/P8fFm5OdcKIkwPM4ub8nYoygPwS20/g2kkXQzmEb0LA/CVcnWh9BloYe
 THdU4gyjeOSl8afNvRJqLxiIWiYv/ZZuVEo7muaw6wQp2Xxcix+Au2Fu6bxqt3sWDc3g
 9VaQ==
X-Gm-Message-State: AJIora8CMiODup0OPrEQjx08ePYTVii65f/bA8ekbXhHkDPPWaVqu9wg
 jQIdKVH+CGwRME7VnniNm1eVGuMKq8YdKjoCLvQ=
X-Google-Smtp-Source: AGRyM1unlcL26DoJBKeuP6hO7gWtMjAzf2MHtAOfkeOyZTjTB+k9vTrHb2maGu9z6S/M1z4/PAcJXTuVLnMzz79GUA8=
X-Received: by 2002:a2e:a801:0:b0:24a:ff0b:ae7a with SMTP id
 l1-20020a2ea801000000b0024aff0bae7amr11099367ljq.287.1655730672567; Mon, 20
 Jun 2022 06:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
 <20220615173345.32456-2-akihiko.odaki@gmail.com>
In-Reply-To: <20220615173345.32456-2-akihiko.odaki@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 20 Jun 2022 17:11:00 +0400
Message-ID: <CAJ+F1CJNmoyroKHvwWkKfNPPjEaM1MBAepZ_uoEdAuwY-RYEnw@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] qga: Relocate a path emitted in the help text
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Programmingkid <programmingkidx@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000950d4605e1e0d67f"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
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

--000000000000950d4605e1e0d67f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 9:43 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index c373fec3ee6..06e507b9979 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM "\n"
>      , cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT,
>      dfl_pathnames.pidfile,
>  #ifdef CONFIG_FSFREEZE
> -    QGA_FSFREEZE_HOOK_DEFAULT,
> +    get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),
>  #endif
>      dfl_pathnames.state_dir);
>  }
> --
> 2.32.1 (Apple Git-133)
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000950d4605e1e0d67f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 9:43 PM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.=
com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br></blockquote><div=
><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/main.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/main.c b/qga/main.c<br>
index c373fec3ee6..06e507b9979 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM &quot;\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0, cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT=
,<br>
=C2=A0 =C2=A0 =C2=A0dfl_pathnames.pidfile,<br>
=C2=A0#ifdef CONFIG_FSFREEZE<br>
-=C2=A0 =C2=A0 QGA_FSFREEZE_HOOK_DEFAULT,<br>
+=C2=A0 =C2=A0 get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0dfl_pathnames.state_dir);<br>
=C2=A0}<br>
-- <br>
2.32.1 (Apple Git-133)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000950d4605e1e0d67f--

