Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453323473C1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:36:39 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOz0I-0003pW-2T
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyvD-0000Uv-J2
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:31:24 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyvA-00073u-SP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:31:23 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a7so31423699ejs.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GnVbqDmbpS69EIIdYRLJ+gm0udYsVkRLVUa2r0eemaA=;
 b=ARhvK74v0x/5H17mO5t7YIS6zFawZUd9F9qAY3LTID4jXIfWSF5T//5IAi6YRd4aBZ
 58vDHk2aSLuYVPEvEP3R3wzqwjSc7euI+0a4FvSFZJzc19vqWxR9CcHorVYYrsvxIzU6
 OhFNOKmhfEr96kQ/tBE3Irc+/hsvf4GWI+qO6+Mi+7oclFWtglPgfEoGdwbh3pEmiDAp
 prfJUTaFFLR97XGxSh5KF8B9uommUzhE3OaJwtoMW912MggvRKyZjRncRF05cCD+aZlH
 K9M9IhQm3mF/3SSgOjHrLtQK/WdhL322hslGzeNaRY0JsCUInTim3ZsHS8E9Knxofr0X
 i3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GnVbqDmbpS69EIIdYRLJ+gm0udYsVkRLVUa2r0eemaA=;
 b=lTTXnZDRGxkR5NjQigcNgbhfX7S8NmXanUHxkUpwezY1hnNjI0w+Y7Tu5CVuP/FBKJ
 pwu2RIHlmQEesVC9OpPTjy6Ifh46ArknsNsEeSJ1V8a2SmxKASzsNqMmB+65rx6GmF+N
 tG495Ps0vp7Ce3+Wh8EKtCmUCND44wLRWSVLDXaJDRfvly4pFnrWeI9Cah6Pd7gSAcSF
 1ZUcRPumDYobmlhffZvAINV8acIiJttITaGIxtBUseabhDmldJiH8Qu4NO/7IUQp9ggA
 4KHdZES/R/CgqfYatwwBxaVvAfQ6+iYc/qYbV4CJjrozn5yqtegRsSKXSeDYIWpdV+I0
 4MhQ==
X-Gm-Message-State: AOAM533wr3fA8M5ktF15KTRXAnh+DaJSQt5EZvvwEx5MH9PiA7Zk7jHc
 945zunYSOUB+V0oyAIrXPcalZw6SnsY1NPWFQD8=
X-Google-Smtp-Source: ABdhPJxfQ9jlbjN6As0ehQ+Iypovz/+McHmPWSITaNdVben7OYkDtYOvvBX1TIQC9mlB1nj0+ZYevvSMUn/Q6R/1cd0=
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr2359489ejb.381.1616574677875; 
 Wed, 24 Mar 2021 01:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-7-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-7-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 12:31:06 +0400
Message-ID: <CAJ+F1C+WkafTcj8KG62hbG9xjYY_VF2SrNyf4YOK28Z+nntzwA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] Acceptance Tests: make username/password
 configurable
To: Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006d802d05be441f23"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d802d05be441f23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 2:21 AM Cleber Rosa <crosa@redhat.com> wrote:

> This makes the username/password used for authentication configurable,
> because some guest operating systems may have restrictions on accounts
> to be used for logins, and it just makes it better documented.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index e75b002c70..535f63a48d 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -308,6 +308,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>
>      timeout =3D 900
>      chksum =3D None
> +    username =3D 'root'
> +    password =3D 'password'
>
>      def setUp(self, ssh_pubkey=3DNone, network_device_type=3D'virtio-net=
'):
>          super(LinuxTest, self).setUp()
> @@ -370,8 +372,8 @@ def prepare_cloudinit(self, ssh_pubkey=3DNone):
>                  with open(ssh_pubkey) as pubkey:
>                      pubkey_content =3D pubkey.read()
>              cloudinit.iso(cloudinit_iso, self.name,
> -                          username=3D'root',
> -                          password=3D'password',
> +                          username=3Dself.username,
> +                          password=3Dself.password,
>                            # QEMU's hard coded usermode router address
>                            phone_home_host=3D'10.0.2.2',
>                            phone_home_port=3Dself.phone_home_port,
> --
> 2.25.4
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006d802d05be441f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 2:21 AM Clebe=
r Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This makes t=
he username/password used for authentication configurable,<br>
because some guest operating systems may have restrictions on accounts<br>
to be used for logins, and it just makes it better documented.<br>
<br>
Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=
=3D"_blank">crosa@redhat.com</a>&gt;<br></blockquote><div><br></div><div><d=
iv>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;  </div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/acceptance/avocado_qemu/__init__.py | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py<br>
index e75b002c70..535f63a48d 100644<br>
--- a/tests/acceptance/avocado_qemu/__init__.py<br>
+++ b/tests/acceptance/avocado_qemu/__init__.py<br>
@@ -308,6 +308,8 @@ class LinuxTest(Test, LinuxSSHMixIn):<br>
<br>
=C2=A0 =C2=A0 =C2=A0timeout =3D 900<br>
=C2=A0 =C2=A0 =C2=A0chksum =3D None<br>
+=C2=A0 =C2=A0 username =3D &#39;root&#39;<br>
+=C2=A0 =C2=A0 password =3D &#39;password&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0def setUp(self, ssh_pubkey=3DNone, network_device_type=
=3D&#39;virtio-net&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(LinuxTest, self).setUp()<br>
@@ -370,8 +372,8 @@ def prepare_cloudinit(self, ssh_pubkey=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(ssh=
_pubkey) as pubkey:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pubkey_content =3D pubkey.read()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cloudinit.iso(cloudinit_iso=
, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.na=
me</a>,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 username=3D&#39;root&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 password=3D&#39;password&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 username=3Dself.username,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 password=3Dself.password,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# QEMU&#39;s hard coded usermode router address<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0phone_home_host=3D&#39;10.0.2.2&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0phone_home_port=3Dself.phone_home_port,<br>
-- <br>
2.25.4<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006d802d05be441f23--

