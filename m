Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A952F49C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 22:43:02 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns9Sf-0004mT-5F
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 16:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ns9Ql-00044V-Os
 for qemu-devel@nongnu.org; Fri, 20 May 2022 16:41:03 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ns9Qj-0001ga-WA
 for qemu-devel@nongnu.org; Fri, 20 May 2022 16:41:03 -0400
Received: by mail-lf1-x12f.google.com with SMTP id y32so16238471lfa.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RT3AuaF/EUBUqatBbnlDk8lm5qeQLdnPKZEAg6gfWV4=;
 b=E3NXvWG4QYcuMcpgzHcTZaAcZ884jm7F+5L3V9n9vCwdk9+YFGyAarMEQuPslkGrLW
 OdXfP1vURPlD8jlyJGc/XAX00jWdXRiIEGr/wgaXFQm+90Mj1739pPyeVTgD2FGKq/2S
 RYDJ8Hm99rE9KNjkwgmfUu7QtTlbO10FVRhz6afVzl47Z0w/PY+qlR4xI/Vq7gY/rTaO
 uNcnVV9blj0+leYQyLZLhb0KSxrif0PiuQmpEI13scEuWod25aMerxyS2cULnohOvVkO
 Cg7IIpBobG2RMiAkPSbEOj4u/95vUAflh79Tv1c9bEb88V0f1Hwdv0Axwo0TdwdQpsOO
 qZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RT3AuaF/EUBUqatBbnlDk8lm5qeQLdnPKZEAg6gfWV4=;
 b=s8IiervcdLegqja6S42fep02+qCK0GbsDTZmKd3w0QjJIASNfk6QIXdrdzjEs7nUh/
 l/wlpMyhTU3RiHioZXykh3FDfVgMnZeVW8Iz01sEs4O/k/gyGXUzj3vXiLdLciLVzVGf
 CNfyB3x0G5W6GMW+Q3tPVVcj55WCLgUmhabHpN0mqPZuZB/QMObYI8OdSYKjMnQAN4Ms
 bIFh9PXcDp9jQ35t6pRzu5SQuCLTkFeiE3Wf7OQJQ3RWSDUkt7wU2ESpe3PuZxCdkvxi
 XI/v9uFxpCGFQk6gk1BKpwoX4B8/b8KSywc9zZRWgbihYheO5klGP1F9QLurnSn6Bh8s
 z66g==
X-Gm-Message-State: AOAM531Pmx+JSUh0I6mV8lX8FsU6B5ADVU0gKEmiMfMNOHpRhT4cPPaz
 sGVzV89HbpASR6nQ66PWhRvEFKdmwi8f16HKYeE=
X-Google-Smtp-Source: ABdhPJxyzz45+6C9ewh8j2veiF2QXLAvd/bI/XOPp6feJog9ENMbNPNQF/dhYW8Dmr0/iEneULqmFEhz0UjB07mlqFQ=
X-Received: by 2002:a05:6512:159f:b0:477:c85c:d418 with SMTP id
 bp31-20020a056512159f00b00477c85cd418mr7158036lfb.481.1653079256743; Fri, 20
 May 2022 13:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220520201401.706630-1-kkostiuk@redhat.com>
In-Reply-To: <20220520201401.706630-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 20 May 2022 22:40:45 +0200
Message-ID: <CAJ+F1CKdd=4B6vxZku+s-rC-vH8GtLcCZHtenDiXPPVwwH_E1Q@mail.gmail.com>
Subject: Re: [PATCH] qga-win32: Add support for NVME but type
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, zhenwei pi <pizhenwei@bytedance.com>
Content-Type: multipart/alternative; boundary="000000000000e2443a05df7781a5"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

--000000000000e2443a05df7781a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 10:15 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Bus type spaces (Indicates a storage spaces bus) is not
> supported, so return it as unknown.
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-win32.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index d56b5fd2a7..5ca2af9173 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] =3D {
>  #if (_WIN32_WINNT >=3D 0x0601)
>      [BusTypeVirtual] =3D GUEST_DISK_BUS_TYPE_VIRTUAL,
>      [BusTypeFileBackedVirtual] =3D GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTU=
AL,
> +    /*
> +     * BusTypeSpaces currently is not suported
> +     */
> +    [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
> +    [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,
>  #endif
>  };
>
> --
> 2.25.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e2443a05df7781a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 20, 2022 at 10:15 PM Kons=
tantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Bus type spaces (Indicates a storage spaces bus) is not<br>
supported, so return it as unknown.<br>
<br>
Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com=
" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br></blockquote><div><br></=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-win32.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index d56b5fd2a7..5ca2af9173 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] =3D {<br>
=C2=A0#if (_WIN32_WINNT &gt;=3D 0x0601)<br>
=C2=A0 =C2=A0 =C2=A0[BusTypeVirtual] =3D GUEST_DISK_BUS_TYPE_VIRTUAL,<br>
=C2=A0 =C2=A0 =C2=A0[BusTypeFileBackedVirtual] =3D GUEST_DISK_BUS_TYPE_FILE=
_BACKED_VIRTUAL,<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* BusTypeSpaces currently is not suported<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,<br>
+=C2=A0 =C2=A0 [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,<br>
=C2=A0#endif<br>
=C2=A0};<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e2443a05df7781a5--

