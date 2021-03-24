Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE03473CC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:41:15 +0100 (CET)
Received: from localhost ([::1]:35758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOz4k-0006cZ-1s
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyym-0003P4-Py
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:35:04 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyyk-0000b8-EE
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:35:04 -0400
Received: by mail-ej1-x632.google.com with SMTP id r12so31464825ejr.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nV+/3vN86Qa4nDdhgJJ5f5B6akJxHtpKUrSP/TVK5QU=;
 b=EkYTGO0vPnYk1SPa+jSxFsbWIDc78VC/Liv3GTgBgZvx+yQnHb7hX2xeKP9zCmR+r3
 2wdRVq7EZPuq3oP9vR8eVpyI1F3loZGSlvyFKrTAdefbJenfDV76Nwd/B1QV0Wn9qH9x
 NuWtbTajI99r1ROVsWkVPn1DdN5tjCk5BEs55/Z99ixpsRR1u20BZ30TgjXLAU/DXVrH
 9xRmDAzI2NXxgHxY1u7mv0SN1BzOPgTcUcqpNN0UNNpoOA1iBADVomykwwd1aLelzhCK
 2/5kL5uMsBiH/JWykVgLx9KrttvRmbIQeRZOkdGdeyI2MO/A5noGmXmDpOGbm5jm7kZ4
 EQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nV+/3vN86Qa4nDdhgJJ5f5B6akJxHtpKUrSP/TVK5QU=;
 b=bIjfW4egI8d6nIeYYVQhhShLmd3xmVEf5DceobpPoArOtMnYt8ScqnlCcdim/d/yDh
 N238PH7vV943UF7IzUWabHyeyrtzsvuscegbUxJ6vjxXzvAKMBejgXcIrMDvvFZNPXbH
 DhWylRrYMV8DJMbJyTBUWgyToghDKUI2qiuVGUUFSSQyje8JNZW0wNBme58+smbNElni
 V4JRUe2kd6y0rztF+xvNIHBHkSsqvFjC83CRCsewxrVrDX0YopsTKrHDhIv6CEGmLKIj
 HJTxFiL7kQsRiKDDTNzOUJtHSb658SYYwY3MDoTvStJ8KoqqiUX4HIEnh5DAiC6e4IYD
 9FSg==
X-Gm-Message-State: AOAM531lB7f7oarCkgtG17NP/nFidlDIl8EsNkJFSUw43Zmt/7L+Jjho
 ODNdD8A8/+9KUrWUh6EgZbnx8p4kYkq09qcuhxQ=
X-Google-Smtp-Source: ABdhPJxIAaTl8rX/9BqqNQBpCNNvQ9Aw/T5w/WrgAdqAzec4C7a8SZ5+QEup6oXvf01+VTfnFsBfa2qnrG5HFUsOYQM=
X-Received: by 2002:a17:906:cf90:: with SMTP id
 um16mr2431477ejb.389.1616574899432; 
 Wed, 24 Mar 2021 01:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-9-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-9-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 12:34:47 +0400
Message-ID: <CAJ+F1CJmh=X-5xEFmqvKikCd5opxNYBxTp2X97nEutgztLywfA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] tests/acceptance/virtiofs_submounts.py: remove
 launch_vm()
To: Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a2325c05be442ccd"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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

--000000000000a2325c05be442ccd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 2:32 AM Cleber Rosa <crosa@redhat.com> wrote:

> The LinuxTest class' launch_and_wait() method now behaves the same way
> as this test's custom launch_vm(), so let's just use the upper layer
> (common) method.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  tests/acceptance/virtiofs_submounts.py | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/tests/acceptance/virtiofs_submounts.py
> b/tests/acceptance/virtiofs_submounts.py
> index e019d3b896..d77ee35674 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -134,9 +134,6 @@ def set_up_virtiofs(self):
>                           '-numa',
>                           'node,memdev=3Dmem')
>
> -    def launch_vm(self):
> -        self.launch_and_wait()
> -
>      def set_up_nested_mounts(self):
>          scratch_dir =3D os.path.join(self.shared_dir, 'scratch')
>          try:
> @@ -225,7 +222,7 @@ def test_pre_virtiofsd_set_up(self):
>          self.set_up_nested_mounts()
>
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>          self.check_in_guest()
>
> @@ -235,14 +232,14 @@ def test_pre_launch_set_up(self):
>
>          self.set_up_nested_mounts()
>
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>          self.check_in_guest()
>
>      def test_post_launch_set_up(self):
>          self.set_up_shared_dir()
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>
>          self.set_up_nested_mounts()
>
> @@ -252,7 +249,7 @@ def test_post_launch_set_up(self):
>      def test_post_mount_set_up(self):
>          self.set_up_shared_dir()
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>
>          self.set_up_nested_mounts()
> @@ -265,7 +262,7 @@ def test_two_runs(self):
>          self.set_up_nested_mounts()
>
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>          self.check_in_guest()
>
> --
> 2.25.4
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a2325c05be442ccd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 2:32 AM Clebe=
r Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The LinuxTes=
t class&#39; launch_and_wait() method now behaves the same way<br>
as this test&#39;s custom launch_vm(), so let&#39;s just use the upper laye=
r<br>
(common) method.<br>
<br>
Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=
=3D"_blank">crosa@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; <br></div><=
div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
---<br>
=C2=A0tests/acceptance/virtiofs_submounts.py | 13 +++++--------<br>
=C2=A01 file changed, 5 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virt=
iofs_submounts.py<br>
index e019d3b896..d77ee35674 100644<br>
--- a/tests/acceptance/virtiofs_submounts.py<br>
+++ b/tests/acceptance/virtiofs_submounts.py<br>
@@ -134,9 +134,6 @@ def set_up_virtiofs(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;-numa&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;node,memdev=3Dmem&#39;)<br>
<br>
-=C2=A0 =C2=A0 def launch_vm(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
-<br>
=C2=A0 =C2=A0 =C2=A0def set_up_nested_mounts(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scratch_dir =3D os.path.join(self.shared_=
dir, &#39;scratch&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
@@ -225,7 +222,7 @@ def test_pre_virtiofsd_set_up(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_nested_mounts()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_virtiofs()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_vm()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.mount_in_guest()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_in_guest()<br>
<br>
@@ -235,14 +232,14 @@ def test_pre_launch_set_up(self):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_nested_mounts()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_vm()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.mount_in_guest()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_in_guest()<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_post_launch_set_up(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_shared_dir()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_virtiofs()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_vm()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_nested_mounts()<br>
<br>
@@ -252,7 +249,7 @@ def test_post_launch_set_up(self):<br>
=C2=A0 =C2=A0 =C2=A0def test_post_mount_set_up(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_shared_dir()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_virtiofs()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_vm()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.mount_in_guest()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_nested_mounts()<br>
@@ -265,7 +262,7 @@ def test_two_runs(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_nested_mounts()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_virtiofs()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_vm()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.launch_and_wait()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.mount_in_guest()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_in_guest()<br>
<br>
-- <br>
2.25.4<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a2325c05be442ccd--

