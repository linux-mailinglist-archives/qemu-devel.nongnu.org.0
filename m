Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5473473C6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:38:41 +0100 (CET)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOz2G-0004uH-5h
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyxl-0002tj-Ek
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:34:01 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyxi-00008a-Fp
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:34:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id j3so26589249edp.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xiIDmFfuYt8rIajQ5Upzs+2F1lBI2dSreXIXyWcO1o=;
 b=IMa1v3LVXlYMSt6+tSdXDCDJ7ykGCwEVkIwjKOps77SLyy5luuMybIQFvd879lbON+
 ng+Dx8c1bde0imDjvmFTeG4T5HxVJTHWYhBrMYiKf0hAk9OQXt9pgedyyyu2Nu0ykrZW
 9ODSNk+lcFAEf6vT2Y9X42o3UNmutIWoJdSQk5RgbtPukrzR2f9+CDOKpI3Dez0ko2vu
 NxTLLZ8v7RgBZ6wyGaWU3d0Fvoj2wFZlJvv7jnvMfPsjKjrIUmnV9MM/31TIRwuB15oa
 TL0sUAcI80k3GwDD4tlOWitVKdyvweOk1qaJJFyhfYh/zVKpwq/4RQWe6UyJ6uR2dmN/
 3VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xiIDmFfuYt8rIajQ5Upzs+2F1lBI2dSreXIXyWcO1o=;
 b=E8/EiaR5D41ZS4UqKFUGIE7KHdZElBmM20D/ydTvfaRrhsCQg3fk6NbYweDXQyf8PI
 ZOVL8D1UEj7I75s7FQagdfl0/7URy9ITg2QaEhPmtf8BvB+b/Ic98N8XFI3lIjtSp+JB
 yGv0CU4F2H1xSS6k/qZAF0iue+oSYz6i+ojl6eaTpE7bBqIbSDPGKx1Q9FZETWu6cxf/
 TsHw3Uiw4Cx+m0QHr4ELVm8+OKG2PuLiRbxiZdvISGHT2MHcQ443jFonkBPTF8Rf+LLo
 v7vtT4x/gCIi87HH4cOkklWCQEtWddbEgb+2dfMXfrHLEXXFtu445bAzgq5zPlqP3O2i
 OkfQ==
X-Gm-Message-State: AOAM530v1OklGkONTKF8S+4KaIF08EC2j/8N97PldiZzIZ6u0A946iMH
 vBrPgtHZxKrmmca2zq8rAbCnpW+g44W355NNl+I=
X-Google-Smtp-Source: ABdhPJzNkx7mVhUUUYfGeopRejmeS5Zfbyd0Njm/4K+RIXF1mRfcdgfsbbTchGLXC2cGPCQtxvT2T9iPS16YZIYBKO4=
X-Received: by 2002:a05:6402:31b7:: with SMTP id
 dj23mr2186126edb.245.1616574836920; 
 Wed, 24 Mar 2021 01:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-8-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-8-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 12:33:45 +0400
Message-ID: <CAJ+F1CKxER=MkbUjh+jYKrCAkp5+6BQfNFOgwWiAegxEWXXa9A@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] Acceptance Tests: set up SSH connection by
 default after boot for LinuxTest
To: Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e853c605be4428f7"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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

--000000000000e853c605be4428f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 2:34 AM Cleber Rosa <crosa@redhat.com> wrote:

> The LinuxTest specifically targets users that need to interact with Linux
> guests.  So, it makes sense to give a connection by default, and avoid
> requiring it as boiler-plate code.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
>  tests/acceptance/virtiofs_submounts.py    | 1 -
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index 535f63a48d..4960142bcc 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -390,7 +390,7 @@ def set_up_cloudinit(self, ssh_pubkey=3DNone):
>          cloudinit_iso =3D self.prepare_cloudinit(ssh_pubkey)
>          self.vm.add_args('-drive', 'file=3D%s,format=3Draw' % cloudinit_=
iso)
>
> -    def launch_and_wait(self):
> +    def launch_and_wait(self, set_up_ssh_connection=3DTrue):
>          self.vm.set_console()
>          self.vm.launch()
>          console_drainer =3D
> datadrainer.LineLogger(self.vm.console_socket.fileno(),
> @@ -398,3 +398,6 @@ def launch_and_wait(self):
>          console_drainer.start()
>          self.log.info('VM launched, waiting for boot confirmation from
> guest')
>          cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
> self.name)
> +        if set_up_ssh_connection:
> +            self.log.info('Setting up the SSH connection')
> +            self.ssh_connect(self.username, self.ssh_key)
> diff --git a/tests/acceptance/virtiofs_submounts.py
> b/tests/acceptance/virtiofs_submounts.py
> index e10a935ac4..e019d3b896 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -136,7 +136,6 @@ def set_up_virtiofs(self):
>
>      def launch_vm(self):
>          self.launch_and_wait()
> -        self.ssh_connect('root', self.ssh_key)
>
>      def set_up_nested_mounts(self):
>          scratch_dir =3D os.path.join(self.shared_dir, 'scratch')
> --
> 2.25.4
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e853c605be4428f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 2:34 AM Clebe=
r Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The LinuxTes=
t specifically targets users that need to interact with Linux<br>
guests.=C2=A0 So, it makes sense to give a connection by default, and avoid=
<br>
requiring it as boiler-plate code.<br>
<br>
Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=
=3D"_blank">crosa@redhat.com</a>&gt;<br></blockquote><div><br></div><div><d=
iv>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;  </div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/acceptance/avocado_qemu/__init__.py | 5 ++++-<br>
=C2=A0tests/acceptance/virtiofs_submounts.py=C2=A0 =C2=A0 | 1 -<br>
=C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py<br>
index 535f63a48d..4960142bcc 100644<br>
--- a/tests/acceptance/avocado_qemu/__init__.py<br>
+++ b/tests/acceptance/avocado_qemu/__init__.py<br>
@@ -390,7 +390,7 @@ def set_up_cloudinit(self, ssh_pubkey=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cloudinit_iso =3D self.prepare_cloudinit(=
ssh_pubkey)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-drive&#39;, &#39;f=
ile=3D%s,format=3Draw&#39; % cloudinit_iso)<br>
<br>
-=C2=A0 =C2=A0 def launch_and_wait(self):<br>
+=C2=A0 =C2=A0 def launch_and_wait(self, set_up_ssh_connection=3DTrue):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.set_console()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.launch()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console_drainer =3D datadrainer.LineLogge=
r(self.vm.console_socket.fileno(),<br>
@@ -398,3 +398,6 @@ def launch_and_wait(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console_drainer.start()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.log.info" rel=3D"n=
oreferrer" target=3D"_blank">self.log.info</a>(&#39;VM launched, waiting fo=
r boot confirmation from guest&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cloudinit.wait_for_phone_home((&#39;0.0.0=
.0&#39;, self.phone_home_port), <a href=3D"http://self.name" rel=3D"norefer=
rer" target=3D"_blank">self.name</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if set_up_ssh_connection:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.log.info"=
 rel=3D"noreferrer" target=3D"_blank">self.log.info</a>(&#39;Setting up the=
 SSH connection&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ssh_connect(self.username, =
self.ssh_key)<br>
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virt=
iofs_submounts.py<br>
index e10a935ac4..e019d3b896 100644<br>
--- a/tests/acceptance/virtiofs_submounts.py<br>
+++ b/tests/acceptance/virtiofs_submounts.py<br>
@@ -136,7 +136,6 @@ def set_up_virtiofs(self):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def launch_vm(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.launch_and_wait()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ssh_connect(&#39;root&#39;, self.ssh_key)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0def set_up_nested_mounts(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scratch_dir =3D os.path.join(self.shared_=
dir, &#39;scratch&#39;)<br>
-- <br>
2.25.4<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e853c605be4428f7--

