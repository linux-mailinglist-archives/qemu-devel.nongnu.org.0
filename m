Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310073A2E7A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:44:29 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLv2-0002TA-9L
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lrLsL-0007FE-Lg
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:41:41 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lrLsJ-0006iG-UO
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:41:41 -0400
Received: by mail-ej1-x62b.google.com with SMTP id my49so27879583ejc.7
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eD03mD8ruiBy5YVjRLjOSutdt9TGYJ9tV/7EMA9zoO4=;
 b=O5lUDMmaYdpvebpl4Q+k4vYv210rci8Y5/uh4GbTaClvM/+omtIY/Yk1HOTxsaGKkZ
 FgoB5vlWJRJ2Z4HQVZkgfTqfhIdH//CGOqsCvI0svrAvizMUmp0NSZMCh+ruxtZ81MuY
 8PSjtyEDNhusIAqsl57P0wgsfXSRtgfWKmuVPjZ2q3ydCmUh4mK++wolaKe0at8ir88A
 nQ0OOx8U5pvy89bne73U6Q/A/cG0vquZGhhQBnz2T8p8O7rV5Mnhga3E7JDcYYNwkCX8
 L9/ugdVvXzK5o+WxktfYMtRERtEdH2Fbcwcc1Uc1F9R92+h/4wHRPYEEfALi0B321G9E
 wYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eD03mD8ruiBy5YVjRLjOSutdt9TGYJ9tV/7EMA9zoO4=;
 b=eWudKzJ4H4FMHpfGmhrjjJCysmf85wLwfiMV9AgDVo4Kgry9/W2OCM5ujESXdImNDB
 PTTfZyr/D+OLZK56+8DGl1DdQNW/GK3BOxYrd2Yf91EDWgTGhbF5eD5KaK/HVJQsHoax
 tErGK1fG6pS9AqL++Kcz2S0z4vFkFymdiSyMpLS+Asnd5Wai55km5eD3T1CI8/rxWZw9
 JE9U2/yrsc2gWxg8jWkA5foezhSC4f++44Qrv3b2Vh12SF00JoQ4yIvnBTSeN4qGxdFU
 Lmg/F0nsRW6jjFNWQZV2cVV76nDM3OAD6mFXy3gOt276Ng70gV/GPmoJxiIuNAlSh47N
 XTlg==
X-Gm-Message-State: AOAM530LfAt8SD9yibzVT0uLCkefd0I4w+s4ChAdD0GPmPrxU8kbQcYy
 xrDSyuBTQcRCXcEGT5P5ed8PS7RmZXL6ienSiYI=
X-Google-Smtp-Source: ABdhPJyf1kKa8ftcA3svMug2L4psnpvk3foZi4CR/MLTU7gt5hYRXJq0C3xgPdzuJ74m6ACnqlEiu/DTL35HrnnOUOA=
X-Received: by 2002:a17:906:4483:: with SMTP id
 y3mr4963090ejo.92.1623336098496; 
 Thu, 10 Jun 2021 07:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210610143800.3293854-1-konstantin@daynix.com>
In-Reply-To: <20210610143800.3293854-1-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Jun 2021 18:41:26 +0400
Message-ID: <CAJ+F1C+WhQRd7W4ATJh=QeyRnYULipPFHr38MODwrLc6Gu73eQ@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Free GMatchInfo properly
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Content-Type: multipart/alternative; boundary="0000000000008083ce05c46a63a2"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008083ce05c46a63a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jun 10, 2021 at 6:38 PM Kostiantyn Kostiuk <konstantin@daynix.com>
wrote:

> The g_regex_match function creates match_info even if it
> returns FALSE. So we should always call g_match_info_free.
>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> ---
>  qga/commands-win32.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 300b87c859..e8bc3df306 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2497,6 +2497,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
> **errp)
>              GMatchInfo *match_info;
>

What about using g_autoptr instead?

             GuestDeviceIdPCI *id;
>              if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)=
)
> {
> +                g_match_info_free(match_info);
>                  continue;
>              }
>              skip =3D false;
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008083ce05c46a63a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 10, 2021 at 6:38 PM Kos=
tiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@day=
nix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">The g_regex_match function creates match_info even if it<br>
returns FALSE. So we should always call g_match_info_free.<br>
<br>
Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.c=
om" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 300b87c859..e8bc3df306 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2497,6 +2497,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GMatchInfo *match_info;<br>=
</blockquote><div><br></div><div>What about using g_autoptr instead?</div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestDeviceIdPCI *id;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!g_regex_match(device_p=
ci_re, hw_ids[j], 0, &amp;match_info)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_match_info_free(=
match_info);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip =3D false;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008083ce05c46a63a2--

