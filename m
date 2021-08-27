Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8743F98FA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 14:26:40 +0200 (CEST)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJawR-0001XZ-7M
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 08:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJasp-0006G4-Ir; Fri, 27 Aug 2021 08:22:55 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJasl-0005Fc-Bc; Fri, 27 Aug 2021 08:22:55 -0400
Received: by mail-ej1-x635.google.com with SMTP id bt14so13442995ejb.3;
 Fri, 27 Aug 2021 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6V6uNQQtQbEcplfHRv8/zZ/pkl9MtqFVylVaisiuE/g=;
 b=sWRDrAKwnsq2AEJ27+OaJ30IyS+N/n2ZlMtlDALxvsHSxVt7yrazQRCyQDmlg+ogY1
 SiXbBEG9wvjn1NcSUYPBtTaJZ2/kiMRVee6ZiGjMHGohhbecYgWZ8Sv0ZJsxp0Tcy21a
 ZcGq7E9Fs0HypDCZyp5wKeQl/eMGDAfcRYYXi3fSOQNHU0QRHLzk062lqFu5ZfTf9o3E
 gY8Xkz5zZFmQQjwwyW4OOHLEPtaFK9e9OhKLbmurKME+JE60Q8zDrriGWmmEowHPLTMj
 VMUZmEu2MzPKRUxSFjyC/Pc0UI0Ix2Z95s/FEJ/l6HIsRzFwCmRVVgLApoxSNC3AXUHO
 40AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6V6uNQQtQbEcplfHRv8/zZ/pkl9MtqFVylVaisiuE/g=;
 b=k/acWJEA05ga9qncweFpuLG/6huvqp7ABSYpiCsBOloMv6GLwBj4ei1IyK3cR6lwEy
 1u8FQYKHC6aDnFX7/wsCqx28TkVqIWCqPQOGJ+uidZfTDr3Zvcf094NR12v/cZIuqcs3
 fIaY6r+xWQPkZyZbAHwYq5rhc0Q3WTIoFxg5ZyTO0eqJh2G6Pa/5Kk4eiamtuYohJZSv
 EghcWqQDdDYM9/Yexup0/knuf49GqK8yzJCdc9oFQAFbUJK9vA13sa2cMqh7by2eGNPc
 3Kwg9UoO0I7LBb0UGn4kP+/06+IprZwDARkirxciCxTzFRvcqId8FWTiZRvx9Oe8Isr6
 VRyw==
X-Gm-Message-State: AOAM530jA1MsRXHo9uo2bwHgZZkNOne19jLankrsqkFyRd8J15lEMY5P
 JHuiXbVln8lAS48xAD4blQk08PMSdfIrpNCGk+4=
X-Google-Smtp-Source: ABdhPJyftfaugYiXU9EaQs2ldJPbhM9jDbMi1Pa8hJt8nMi6KNFk42ZxXBTOXKzuMcEwq1/cVXt5dAWMdn1JNe86cNQ=
X-Received: by 2002:a17:906:4a8e:: with SMTP id
 x14mr9811350eju.389.1630066965454; 
 Fri, 27 Aug 2021 05:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210827120901.150276-1-thuth@redhat.com>
In-Reply-To: <20210827120901.150276-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 27 Aug 2021 16:22:33 +0400
Message-ID: <CAJ+F1C+w2Kt8sMviDt3KhagOBCQrxwV_Jxt7wTtDDJKuVa8A0Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] dtc: Fixes for the fdt check and update submodule to
 1.6.1
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006fa26505ca898a50"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006fa26505ca898a50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 4:13 PM Thomas Huth <thuth@redhat.com> wrote:

> There are some issues in the checks for libfdt in meson.build which
> get fixed with the first two patches.
>
> And while we're at it, also update the dtc submodule to a proper release
> version (in the third patch).
>
> Thomas Huth (3):
>   meson.build: Fix the check for a usable libfdt
>   meson.build: Don't use internal libfdt if the user requested the
>     system libfdt
>   dtc: Update to version 1.6.1
>
>  dtc         | 2 +-
>  meson.build | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> --
> 2.27.0
>
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006fa26505ca898a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 27, 2021 at 4:13 PM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">There are some issues in the checks for libfdt in meson.build which<b=
r>
get fixed with the first two patches.<br>
<br>
And while we&#39;re at it, also update the dtc submodule to a proper releas=
e<br>
version (in the third patch).<br>
<br>
Thomas Huth (3):<br>
=C2=A0 meson.build: Fix the check for a usable libfdt<br>
=C2=A0 meson.build: Don&#39;t use internal libfdt if the user requested the=
<br>
=C2=A0 =C2=A0 system libfdt<br>
=C2=A0 dtc: Update to version 1.6.1<br>
<br>
=C2=A0dtc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meson.build | 3 +++<br>
=C2=A02 files changed, 4 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau =
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a>&gt;<br></div><br>-- <br><div dir=3D"ltr">Marc-And=
r=C3=A9 Lureau<br></div></div>

--0000000000006fa26505ca898a50--

