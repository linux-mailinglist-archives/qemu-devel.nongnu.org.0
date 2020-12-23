Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AF2E1B5B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 12:07:45 +0100 (CET)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks1zc-0006kH-Eh
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 06:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ks1tp-0004qq-MZ
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 06:01:45 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ks1ti-0004to-RT
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 06:01:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id q22so22296388eja.2
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWXKpWV9Qh0Cm0ynLqCC9/pYC6DtFSi8qfeo115Xpd0=;
 b=qlvkxXAg4Rt/HssLmKXpm4modQPipq8KOe17ET4zUY4TV+NnjO+FreA4WEz9BMyAfF
 YyYJ4OuL6caUF8FhhSNtjTYdLXmV3oIkfywnRpRfX5UKMmFVzXJiZWBs1wpSXMh+ltcU
 YlwAA8Ug7UuxdhvkVN7V8UkNWuLvGg9HWII+2aWJjIAjFbQHuqCqvkRylBnAKXoNy5KX
 thv9Z2CAAqbKrgW99T+K6EXJCW6BjkVHuSmWdald3I5G4h2lYNMhbGjmGz4KLvrGFd85
 jfQq2ZqZ9IKvF53nFlR1U8XcgE2wrgKqmsogwOv9yyeObK1nLWGqCWj1jiv5AoJZ0/qR
 Ej7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWXKpWV9Qh0Cm0ynLqCC9/pYC6DtFSi8qfeo115Xpd0=;
 b=dliusRBrFHNLyPT/G8Cy84itBXoWFGwSgkWWrhkvTvGzU8YFACSFB6/seUnrd+USMt
 gQ1tSKqLTJ5tzJjMDRj8Nlv0ybXGf4J5frSxzznwtQH25Sm93OhoRkHkGmtyhbT0QKaO
 /nGqLqWzHwAlNWC2tK0hM/PHZK6phABzo41OakGHpUHgZ6pBkH+Q3UVJydCCL6JjxgBt
 XMg+xWLnfuLEozg/7imhTwDZViGx4Dv6t4DXV1Vk8VDnWxkInuKayY9zUXvgoWFkGYBM
 +qqshzpsCh/rFB3nOe8MNniwDLC+8vQkKjB04qiLchM0aajYAdzSV8NH3X/tNnjQUM49
 9chA==
X-Gm-Message-State: AOAM5312pFjC+iJ0d8bVioDvSu8+OFjc9bQA2fnf32NEXUR2k9DfQylQ
 hprVkNJW8/w6CEqN0CRH7CrT7K9mSroTZ0ijH/0=
X-Google-Smtp-Source: ABdhPJyi/7bgID9LKAQbMtbylIy1FwSlac1ffQUkQwkNToeLaGIa9GixndfFUAVuxDJLq0FrSQ9wqX+5w69f7r9+q7Y=
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr8140676eje.109.1608721296480; 
 Wed, 23 Dec 2020 03:01:36 -0800 (PST)
MIME-Version: 1.0
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
In-Reply-To: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 23 Dec 2020 15:01:24 +0400
Message-ID: <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000006b5bed05b71f9db2"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b5bed05b71f9db2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 23, 2020 at 10:45 AM <elena.ufimtseva@oracle.com> wrote:

> From: Jagannathan Raman <jag.raman@oracle.com>
>
> Runs the Avocado acceptance test to check if a
> remote lsi53c895a device gets identified by the guest.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  tests/acceptance/multiprocess.py | 104 +++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 tests/acceptance/multiprocess.py
>
> diff --git a/tests/acceptance/multiprocess.py
> b/tests/acceptance/multiprocess.py
> new file mode 100644
> index 0000000000..d10b4d2c05
> --- /dev/null
> +++ b/tests/acceptance/multiprocess.py
> @@ -0,0 +1,104 @@
> +# Test for multiprocess qemu
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +
> +from qemu.accel import kvm_available
> +
> +import os
> +import socket
> +
> +ACCEL_NOT_AVAILABLE_FMT =3D "%s accelerator does not seem to be availabl=
e"
> +KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % "KVM"
> +
> +class Multiprocess(Test):
> +    """
> +    :avocado: tags=3Dmultiprocess
> +    """
> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> +
> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message=3D'Kernel panic - not
> syncing',
> +                                 vm=3Dvm)
> +
> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> +                machine_type):
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +
> +        # Create socketpair to connect proxy and remote processes
> +        proxy_sock, remote_sock =3D socket.socketpair(socket.AF_UNIX,
> +                                                    socket.SOCK_STREAM)
> +        os.set_inheritable(proxy_sock.fileno(), True)
> +        os.set_inheritable(remote_sock.fileno(), True)
> +
> +        kernel_path =3D self.fetch_asset(kernel_url)
> +        initrd_path =3D self.fetch_asset(initrd_url)
> +
> +        # Create remote process
> +        remote_vm =3D self.get_vm()
> +        remote_vm.add_args('-machine', 'x-remote')
> +        remote_vm.add_args('-nodefaults')
> +        remote_vm.add_args('-device', 'lsi53c895a,id=3Dlsi1')
> +        remote_vm.add_args('-object', 'x-remote-object,id=3Drobj1,'
> +                           'devid=3Dlsi1,fd=3D'+str(remote_sock.fileno()=
))
> +        remote_vm.launch()
> +
> +        # Create proxy process
> +        self.vm.set_console()
> +        self.vm.add_args('-machine', machine_type)
> +        self.vm.add_args('-accel', 'kvm')
> +        self.vm.add_args('-cpu', 'host')
> +        self.vm.add_args("-object",
> +                         "memory-backend-memfd,id=3Dsysmem-file,size=3D2=
G")
> +        self.vm.add_args("--numa", "node,memdev=3Dsysmem-file")
> +        self.vm.add_args("-m", "2048")
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args('-device',
> +                         'x-pci-proxy-dev,'
> +                         'id=3Dlsi1,fd=3D'+str(proxy_sock.fileno()))
> +        self.vm.launch()
> +        self.wait_for_console_pattern("as init process")
> +        exec_command_and_wait_for_pattern(self, "mount -t sysfs sysfs
> /sys",
> +                                          '', '')
> +        exec_command_and_wait_for_pattern(self,
> +                                          "cat
> /sys/bus/pci/devices/*/uevent",
> +                                          "PCI_ID=3D1000:0012", '')
> +
> +    def test_multiprocess_x86_64(self):
> +        """
> +        :avocado: tags=3Darch:x86_64
> +        """
> +        kernel_url =3D ('
> https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/x86_64/os/images'
> +                      '/pxeboot/vmlinuz')
> +        initrd_url =3D ('
> https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/x86_64/os/images'
> +                      '/pxeboot/initrd.img')
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0 rdinit=3D/bin/bash')
> +        machine =3D 'pc'
> +        self.do_test(kernel_url, initrd_url, kernel_command_line, machin=
e)
> +
> +    def test_multiprocess_aarch64(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        """
> +        kernel_url =3D ('
> https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/aarch64/os/images'
> +                      '/pxeboot/vmlinuz')
> +        initrd_url =3D ('
> https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/aarch64/os/images'
> +                      '/pxeboot/initrd.img')
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'rdinit=3D/bin/bash console=3DttyAMA0')
> +        machine_type =3D 'virt,gic-version=3D3'
> +        self.do_test(kernel_url, initrd_url, kernel_command_line,
> machine_type)
> --
> 2.25.GIT
>
>
The test looks quite nice, thanks. However, it times out for me. I have
very limited experience with avocado. Any idea?
 (13/40)
tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
ERROR: timed out (211.81 s)


--=20
Marc-Andr=C3=A9 Lureau

--0000000000006b5bed05b71f9db2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 23, 2020 at 10:45 AM &l=
t;<a href=3D"mailto:elena.ufimtseva@oracle.com">elena.ufimtseva@oracle.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com" target=
=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
<br>
Runs the Avocado acceptance test to check if a<br>
remote lsi53c895a device gets identified by the guest.<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
---<br>
=C2=A0tests/acceptance/multiprocess.py | 104 ++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 104 insertions(+)<br>
=C2=A0create mode 100644 tests/acceptance/multiprocess.py<br>
<br>
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiproce=
ss.py<br>
new file mode 100644<br>
index 0000000000..d10b4d2c05<br>
--- /dev/null<br>
+++ b/tests/acceptance/multiprocess.py<br>
@@ -0,0 +1,104 @@<br>
+# Test for multiprocess qemu<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2 or<br>
+# later.=C2=A0 See the COPYING file in the top-level directory.<br>
+<br>
+<br>
+from avocado_qemu import Test<br>
+from avocado_qemu import wait_for_console_pattern<br>
+from avocado_qemu import exec_command_and_wait_for_pattern<br>
+<br>
+from qemu.accel import kvm_available<br>
+<br>
+import os<br>
+import socket<br>
+<br>
+ACCEL_NOT_AVAILABLE_FMT =3D &quot;%s accelerator does not seem to be avail=
able&quot;<br>
+KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % &quot;KVM&quot;<br>
+<br>
+class Multiprocess(Test):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 :avocado: tags=3Dmultiprocess<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 KERNEL_COMMON_COMMAND_LINE =3D &#39;printk.time=3D0 &#39;<br=
>
+<br>
+=C2=A0 =C2=A0 def wait_for_console_pattern(self, success_message, vm=3DNon=
e):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_for_console_pattern(self, success_message=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failure_message=3D&#39;Kernel =
panic - not syncing&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm=3Dvm)<br>
+<br>
+=C2=A0 =C2=A0 def do_test(self, kernel_url, initrd_url, kernel_command_lin=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machine_type):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kvm_available(self.arch, self.qemu_bin)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cancel(KVM_NOT_AVAILABLE)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create socketpair to connect proxy and remot=
e processes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_sock, remote_sock =3D socket.socketpair(=
socket.AF_UNIX,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 socket.SOCK_STREAM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.set_inheritable(proxy_sock.fileno(), True)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.set_inheritable(remote_sock.fileno(), True)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asset(kernel_url)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_path =3D self.fetch_asset(initrd_url)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create remote process<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm =3D self.get_vm()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-machine&#39;, &#39;x-=
remote&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-nodefaults&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-device&#39;, &#39;lsi=
53c895a,id=3Dlsi1&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-object&#39;, &#39;x-r=
emote-object,id=3Drobj1,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;devid=3Dlsi1,fd=3D&#39;+str(remote_sock.fileno=
()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.launch()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create proxy process<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-machine&#39;, machine_t=
ype)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-accel&#39;, &#39;kvm&#3=
9;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-cpu&#39;, &#39;host&#39=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-object&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;memory-backend-memfd,id=3Dsysmem-file,size=3D2G&quot=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;--numa&quot;, &quot;nod=
e,memdev=3Dsysmem-file&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-m&quot;, &quot;2048&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-initrd&#39;, initrd_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;x-pci-proxy-dev,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;id=3Dlsi1,fd=3D&#39;+str(proxy_sock.fileno()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(&quot;as init pr=
ocess&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &quot;=
mount -t sysfs sysfs /sys&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;&#39;, &#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;cat /sys/bus/pci/devices/*/uevent&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;PCI_ID=3D1000:0012&quot;, &#39;&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def test_multiprocess_x86_64(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:x86_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_url =3D (&#39;<a href=3D"https://archiv=
es.fedoraproject.org/pub/archive/fedora" rel=3D"noreferrer" target=3D"_blan=
k">https://archives.fedoraproject.org/pub/archive/fedora</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/linux/releases/31/Everything/x86_64/os/images&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/pxeboot/vmlinuz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<a href=3D"https://archiv=
es.fedoraproject.org/pub/archive/fedora" rel=3D"noreferrer" target=3D"_blan=
k">https://archives.fedoraproject.org/pub/archive/fedora</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/linux/releases/31/Everything/x86_64/os/images&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/pxeboot/initrd.img&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;console=3DttyS0 rdinit=3D/bin/ba=
sh&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D &#39;pc&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test(kernel_url, initrd_url, kernel_co=
mmand_line, machine)<br>
+<br>
+=C2=A0 =C2=A0 def test_multiprocess_aarch64(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:aarch64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_url =3D (&#39;<a href=3D"https://archiv=
es.fedoraproject.org/pub/archive/fedora" rel=3D"noreferrer" target=3D"_blan=
k">https://archives.fedoraproject.org/pub/archive/fedora</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/linux/releases/31/Everything/aarch64/os/images&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/pxeboot/vmlinuz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<a href=3D"https://archiv=
es.fedoraproject.org/pub/archive/fedora" rel=3D"noreferrer" target=3D"_blan=
k">https://archives.fedoraproject.org/pub/archive/fedora</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/linux/releases/31/Everything/aarch64/os/images&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;/pxeboot/initrd.img&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;rdinit=3D/bin/bash console=3Dtty=
AMA0&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine_type =3D &#39;virt,gic-version=3D3&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test(kernel_url, initrd_url, kernel_co=
mmand_line, machine_type)<br>
-- <br>
2.25.GIT<br>
<br>
</blockquote></div><div><br></div><div>The test looks quite nice, thanks. H=
owever, it times out for me. I have very limited experience with avocado. A=
ny idea?<br></div><div>=C2=A0(13/40) tests/acceptance/multiprocess.py:Multi=
process.test_multiprocess_x86_64: ERROR: timed out (211.81 s)</div><br clea=
r=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000006b5bed05b71f9db2--

