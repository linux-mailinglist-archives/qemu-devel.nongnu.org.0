Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D436150B433
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:36:47 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpiY-0000im-HA
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhpeM-0006Uf-El
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:32:28 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhpeK-0006Cl-Og
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:32:26 -0400
Received: by mail-qt1-x835.google.com with SMTP id f22so5081060qtp.13
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HeI9UAd1EpyMS7ZZgNx/KLf6NcMFxAeumqEIqcixBJ8=;
 b=a+zfih07TiQwM3tcssq7RvtDUq2zwKJW5EJCCVDeTvZiAIQyg1+UJt83kTOhBTUnsW
 zKt9AxFXES0ewJZXhG8DHSImiM6Gzq4oWDogsI8veen0Tv/VpnTXxEd1zMV3h5wZg0Fb
 FIWERltqhDPKFAWfAGUPZkM2Nvpdb6Uf4ritdRAYtY94g/86PsCbL67cRhx2uC/aGSdl
 ZUrmtN5ANj+w34S76wXzOHkNoJ94TPvnSP5DaPjm/Zxf+VOMeKaD8oFOB1hR73l7Bh3T
 Z2tXEMJn7ilCIfKHjB0Uz9PnDNe2rqt6QrmC5Ts8rp+PG7omf+UPboSIxfAARyiWa9dA
 6Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HeI9UAd1EpyMS7ZZgNx/KLf6NcMFxAeumqEIqcixBJ8=;
 b=cBOmRxhZVfr8sHhHSEkeSvc8Bbecn3gkm75iqP1XhzG0vuEluAnhFMfLd9dCShRGVs
 7FDP7Ae0SkKEY4+sxxQN/47J0bivV0UIDwh7NE6K1ijJa5xt2uLNVrPrKFvPptLFqZEo
 8hz5KOdPJG8eQAOgjR6WG0ZPuhAwd3R9nmSNvcHIojLsOxyb97huvWomAC7d5aVZvzSF
 H+wjVzAOlK64ibsPSJKr7h2aik5c0J/U+TCxvoV8Qz9gaDXLZCFxisRfTzHeZG71mOVi
 CunBsOPb+/BepoqRMIz1/y+LADjOZ03DqsB3ZWoY1rGu6Q7lAmHgYn4spLV9ExDFa8JR
 i1ng==
X-Gm-Message-State: AOAM530ve5Em4wdGBx2BGeezOpeaKqUYE07WIWxuXPuvcaHRWf0sCp+d
 ZAy7sb4brGQtd3OPqP4GuQnwOy5VcXZV9Rb79hzZ0VQVmvY=
X-Google-Smtp-Source: ABdhPJzflfBscpUushU1B7pJS++56G6tLVIekIc3W20hoswmDk9UmUELgG80dLXowDm3zHgUk2ecigjZgQJv6p6ui8k=
X-Received: by 2002:a05:622a:cc:b0:2f1:fc74:c7a6 with SMTP id
 p12-20020a05622a00cc00b002f1fc74c7a6mr2407339qtw.387.1650619943632; Fri, 22
 Apr 2022 02:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220422070144.1043697-1-sw@weilnetz.de>
 <20220422070144.1043697-3-sw@weilnetz.de>
In-Reply-To: <20220422070144.1043697-3-sw@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 22 Apr 2022 13:32:12 +0400
Message-ID: <CAJ+F1CJV4CyY-2G9pC-Ad3tQ=82=NtpQe7qruX3DivmGtr9Bmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] libvhost-user: Fix format strings
To: Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="00000000000066412a05dd3ae72f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x835.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000066412a05dd3ae72f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 11:07 AM Stefan Weil <sw@weilnetz.de> wrote:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  subprojects/libvhost-user/libvhost-user.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/subprojects/libvhost-user/libvhost-user.c
> b/subprojects/libvhost-user/libvhost-user.c
> index 2d29140a8f..94645f9154 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -700,7 +700,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
>          close(vmsg->fds[0]);
>          vu_panic(dev, "VHOST_USER_ADD_MEM_REG requires a message size of
> at "
> -                      "least %d bytes and only %d bytes were received",
> +                      "least %zu bytes and only %d bytes were received",
>                        VHOST_USER_MEM_REG_SIZE, vmsg->size);
>          return false;
>      }
> @@ -833,7 +833,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
>          close(vmsg->fds[0]);
>          vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of
> at "
> -                      "least %d bytes and only %d bytes were received",
> +                      "least %zu bytes and only %d bytes were received",
>                        VHOST_USER_MEM_REG_SIZE, vmsg->size);
>          return false;
>      }
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000066412a05dd3ae72f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 11:07 AM Stef=
an Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: =
Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"_blank">sw@weil=
netz.de</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=
=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.=
lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0subprojects/libvhost-user/libvhost-user.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c<br>
index 2d29140a8f..94645f9154 100644<br>
--- a/subprojects/libvhost-user/libvhost-user.c<br>
+++ b/subprojects/libvhost-user/libvhost-user.c<br>
@@ -700,7 +700,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {<br>
=C2=A0 =C2=A0 =C2=A0if (vmsg-&gt;size &lt; VHOST_USER_MEM_REG_SIZE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(vmsg-&gt;fds[0]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vu_panic(dev, &quot;VHOST_USER_ADD_MEM_RE=
G requires a message size of at &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;least %d bytes and only %d bytes were received&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;least %zu bytes and only %d bytes were received&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0VHOST_USER_MEM_REG_SIZE, vmsg-&gt;size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -833,7 +833,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {<br>
=C2=A0 =C2=A0 =C2=A0if (vmsg-&gt;size &lt; VHOST_USER_MEM_REG_SIZE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(vmsg-&gt;fds[0]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vu_panic(dev, &quot;VHOST_USER_REM_MEM_RE=
G requires a message size of at &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;least %d bytes and only %d bytes were received&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;least %zu bytes and only %d bytes were received&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0VHOST_USER_MEM_REG_SIZE, vmsg-&gt;size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000066412a05dd3ae72f--

