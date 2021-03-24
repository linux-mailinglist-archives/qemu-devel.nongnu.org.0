Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D73473BB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:34:07 +0100 (CET)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyxq-00024U-Js
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyuP-0008TH-Rn
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:30:33 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOyuN-0006cQ-TI
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:30:33 -0400
Received: by mail-ej1-x632.google.com with SMTP id u9so31431055ejj.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wLg4pibvzBfK9N/3UzRSj9cjvwGJyVikzEBaBYa0tCA=;
 b=cJdDQhFEp2bVgTZ3bP86h7BzidG9HLuZQdMW7jfGFw0dWXyT5pnG0vyHCaKwgdlRDy
 NaDsCyAZ8KKlrmChVt/gTEFud3GWO/Jr7Fr2SCtR2JbHwa7HpdIl71ic/8VwEm7kaJs3
 1MiL3cAb0Yq5Oz3UauJXo2WNGXKz660IPq4+fgzg/iXNehUxrEEjP+MG4hZf4kCP2WBw
 KowCXJ2pY+HUX6GYXvY3a9Sjxto23a/IiPq6FQjnB1OyMNL3pWLHHrTIaxNaIFd3/ZO7
 6g7N0ZUrcQg/Wx5sssKpUlWWrwtKmxL9f8EQbSWIJT+N2ltx+4yEi56tw6E9iU/ZIL0f
 cBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLg4pibvzBfK9N/3UzRSj9cjvwGJyVikzEBaBYa0tCA=;
 b=R3Cjij1RTFS0hW934bTs8UU/5+yCD/y6QZG3Tg9L4JGWY1vjSFTTiTFPmxIN2Ulk9s
 JWIeGPJtYvmSHRwn0GW/RjUnd8w/CYEdZ0k/w7pbdJSk8bIL27vqwu1GDOKuN8F9ppSH
 3TEoLqbphLpYUIqWaOoFXAJ1eJEGTOC7Pekbu42gHXSU/gKwEtZ+TguldZyUQ8NYKUoN
 oNmgn9g3ombKXlUYZI084yg1MXx/ETrpwP6a0SBnrTVKgUhJ2eyVXqVp1yOTiA2jpqvA
 X/NeldKCbhLi3ZdFXN8b7tC8xG08o1GXXqIrpxa0lhIOSddlGs9OdR75+hZLaSsJ3ygV
 bGTA==
X-Gm-Message-State: AOAM531CcQNC4C6RPJneAZP97g+qVtA+Qgmt71L4S6OH/FHzhjNzr9Ub
 xiPGbcYVLwgs+xq+DDGblhaZ9VWwVy9C5ykIkn4=
X-Google-Smtp-Source: ABdhPJyE0seTZ96roPIOS8iwyhh+AOB5itXkBle8qqOt5Bcr/A9meZ9W0RxYW6Pwm2fm4IvFdW14fmpmJrfGTeQN0z4=
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr2356607ejb.381.1616574630301; 
 Wed, 24 Mar 2021 01:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-6-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 12:30:18 +0400
Message-ID: <CAJ+F1C+ODGnkhEmtM7=aKCW4WLjhkw4jU73sTZVWKa6hOkCXCw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
To: Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009797da05be441c15"
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

--0000000000009797da05be441c15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 24, 2021 at 2:23 AM Cleber Rosa <crosa@redhat.com> wrote:

> For users of the LinuxTest class, let's set up the VM with the port
> redirection for SSH, instead of requiring each test to set the same
> arguments.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
>  tests/acceptance/virtiofs_submounts.py    | 4 ----
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index 67f75f66e5..e75b002c70 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):
>      timeout =3D 900
>      chksum =3D None
>
> -    def setUp(self, ssh_pubkey=3DNone):
> +    def setUp(self, ssh_pubkey=3DNone, network_device_type=3D'virtio-net=
'):
>          super(LinuxTest, self).setUp()
>          self.vm.add_args('-smp', '2')
>          self.vm.add_args('-m', '1024')
> +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0.1=
:0
> -:22',
> +                         '-device', '%s,netdev=3Dvnet' %
> network_device_type)
>          self.set_up_boot()
>          if ssh_pubkey is None:
>              ssh_pubkey, self.ssh_key =3D self.set_up_existing_ssh_keys()
> diff --git a/tests/acceptance/virtiofs_submounts.py
> b/tests/acceptance/virtiofs_submounts.py
> index bed8ce44df..e10a935ac4 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -207,10 +207,6 @@ def setUp(self):
>              self.vm.add_args('-kernel', vmlinuz,
>                               '-append', 'console=3DttyS0 root=3D/dev/sda=
1')
>
> -        # Allow us to connect to SSH
> -        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0.1=
:0
> -:22',
> -                         '-device', 'virtio-net,netdev=3Dvnet')
> -
>          self.require_accelerator("kvm")
>          self.vm.add_args('-accel', 'kvm')
>
> --
> 2.25.4
>
>
Looks fine, I suppose it could eventually be in LinuxSSHMixIn too for other
users.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009797da05be441c15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 2:23 AM Cle=
ber Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For users =
of the LinuxTest class, let&#39;s set up the VM with the port<br>
redirection for SSH, instead of requiring each test to set the same<br>
arguments.<br>
<br>
Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=
=3D"_blank">crosa@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/acceptance/avocado_qemu/__init__.py | 4 +++-<br>
=C2=A0tests/acceptance/virtiofs_submounts.py=C2=A0 =C2=A0 | 4 ----<br>
=C2=A02 files changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py<br>
index 67f75f66e5..e75b002c70 100644<br>
--- a/tests/acceptance/avocado_qemu/__init__.py<br>
+++ b/tests/acceptance/avocado_qemu/__init__.py<br>
@@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):<br>
=C2=A0 =C2=A0 =C2=A0timeout =3D 900<br>
=C2=A0 =C2=A0 =C2=A0chksum =3D None<br>
<br>
-=C2=A0 =C2=A0 def setUp(self, ssh_pubkey=3DNone):<br>
+=C2=A0 =C2=A0 def setUp(self, ssh_pubkey=3DNone, network_device_type=3D&#3=
9;virtio-net&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(LinuxTest, self).setUp()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-smp&#39;, &#39;2&#=
39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-m&#39;, &#39;1024&=
#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-netdev&#39;, &#39;user,=
id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;%s,netdev=3Dvnet&#39; % network_de=
vice_type)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_up_boot()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ssh_pubkey is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_pubkey, self.ssh_key =
=3D self.set_up_existing_ssh_keys()<br>
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virt=
iofs_submounts.py<br>
index bed8ce44df..e10a935ac4 100644<br>
--- a/tests/acceptance/virtiofs_submounts.py<br>
+++ b/tests/acceptance/virtiofs_submounts.py<br>
@@ -207,10 +207,6 @@ def setUp(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-kern=
el&#39;, vmlinuz,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-append&#39;, &#39;console=3DttyS0 roo=
t=3D/dev/sda1&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Allow us to connect to SSH<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-netdev&#39;, &#39;user,=
id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.require_accelerator(&quot;kvm&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-accel&#39;, &#39;k=
vm&#39;)<br>
<br>
-- <br>
2.25.4<br>
<br></blockquote><div><br></div><div>Looks fine, I suppose it could eventua=
lly be in LinuxSSHMixIn too for other users.</div><div><br></div><div>Revie=
wed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redha=
t.com">marcandre.lureau@redhat.com</a>&gt;  </div></div><br clear=3D"all"><=
br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau=
<br></div></div>

--0000000000009797da05be441c15--

