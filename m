Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03342EBF3C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:54:28 +0100 (CET)
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx9Gd-0006Xd-JA
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kx9EG-0005SL-Jd
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:52:01 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kx9EB-0000Jo-Mo
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:52:00 -0500
Received: by mail-ej1-x629.google.com with SMTP id b9so5206014ejy.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8IEloSsrnwfCW+PD3GlOqwUfSr/IZHWogLhhAdQdT0=;
 b=re5fOTMSLNQkYgWuwLRLFlnWlo5t2C1RO87H3M+kTR/c92egFOh4Zv1njTtYpPeFym
 jDpU8BY0lMxXthrAgFA9ZVLgseU2NCd2iMf6MwuT9uORNwt3wOvusbMGdgoeRL+CDVhh
 mwWbufmLe+hAdtJWPd0sD4reqF3eMBrGNVXVg2PrJUiToU685vkPZkWh4Xmg7vA8NGxG
 jPLKwgfrdlULTLHO5FyPw1nC9eaxdEqIyiWRy+SJQwO99ZozWXi0rEqJadZcWLTNAQJl
 Ouj2fzXjbraMcV050C2maZc/Gqp8TMW4FMBc60QUw7YiIf9ADZuZtI6vbk76tucfS1xO
 +j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8IEloSsrnwfCW+PD3GlOqwUfSr/IZHWogLhhAdQdT0=;
 b=ANZmVu5iJUY02s9NbFeqpxYLdiFaZjmCs5Q2GSet6A+F+6HufB0Y5BA5+fdG5kbCoL
 +ODKkrZ1Gq3/f9VbDkvXxvEny0qe8eWylLKojf54/Kh9qrYYK9nof64MfKZ1Jh+NuwXU
 6TD2o7w370hdrkDN3jrP0bm1LpN7QURyVlMn59A8+U8qy7uoeUBOer1ExG+ssvHn5qbo
 v1ETq6QCFMeFJXyO3iJYWcjIgPjcSBatVDhwB1WKNCh/pNYYrFCEqNQOVK6I0QhZKi+5
 SEn0eBj9koYMb2PhISLMm/wri5/YkrVvnvRSvRkkJLId83f9zUOLyyw8fqtLG4kW8ZlZ
 g3pw==
X-Gm-Message-State: AOAM532POz8lurz/KaPPq2xX8oHDT6VVf7y+FZeItOHQ4DFJrFk4cHFB
 1aZqGZqqSDn2tDEUWYGm+YsNf7wQhVzM6wqhpJE=
X-Google-Smtp-Source: ABdhPJydd3SgQJbztJLDHECaIXVEBd+bsO5gOV+aw1VxkxYi/PPLEscaBPyCUir1W77T/LOSDDReHvVE8Gj6tdZbEWk=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr2889832ejb.532.1609941112558; 
 Wed, 06 Jan 2021 05:51:52 -0800 (PST)
MIME-Version: 1.0
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
 <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
 <20201223184940.GA251460@heatpipe>
 <1CFD4614-B351-487A-B01D-1F2D0E282FC5@oracle.com>
In-Reply-To: <1CFD4614-B351-487A-B01D-1F2D0E282FC5@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 6 Jan 2021 17:51:39 +0400
Message-ID: <CAJ+F1CLD8=GWaU788a2JLsOCtpnDsR4u6rg0ghZL_pvEcrVYOw@mail.gmail.com>
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
To: Jag Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000001f9a7205b83ba013"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001f9a7205b83ba013
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Dec 29, 2020 at 8:19 PM Jag Raman <jag.raman@oracle.com> wrote:

>
>
> > On Dec 23, 2020, at 1:49 PM, Elena Ufimtseva <elena.ufimtseva@oracle.co=
m>
> wrote:
> >
> > On Wed, Dec 23, 2020 at 03:01:24PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> >> Hi
> >>
> >> On Wed, Dec 23, 2020 at 10:45 AM <elena.ufimtseva@oracle.com> wrote:
> >>
> >>> From: Jagannathan Raman <jag.raman@oracle.com>
> >>>
> >>> Runs the Avocado acceptance test to check if a
> >>> remote lsi53c895a device gets identified by the guest.
> >>>
> >>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >>> ---
> >>> tests/acceptance/multiprocess.py | 104 ++++++++++++++++++++++++++++++=
+
> >>> 1 file changed, 104 insertions(+)
> >>> create mode 100644 tests/acceptance/multiprocess.py
> >>>
> >>> diff --git a/tests/acceptance/multiprocess.py
> >>> b/tests/acceptance/multiprocess.py
> >>> new file mode 100644
> >>> index 0000000000..d10b4d2c05
> >>> --- /dev/null
> >>> +++ b/tests/acceptance/multiprocess.py
> >>> @@ -0,0 +1,104 @@
> >>> +# Test for multiprocess qemu
> >>> +#
> >>> +# This work is licensed under the terms of the GNU GPL, version 2 or
> >>> +# later.  See the COPYING file in the top-level directory.
> >>> +
> >>> +
> >>> +from avocado_qemu import Test
> >>> +from avocado_qemu import wait_for_console_pattern
> >>> +from avocado_qemu import exec_command_and_wait_for_pattern
> >>> +
> >>> +from qemu.accel import kvm_available
> >>> +
> >>> +import os
> >>> +import socket
> >>> +
> >>> +ACCEL_NOT_AVAILABLE_FMT =3D "%s accelerator does not seem to be
> available"
> >>> +KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % "KVM"
> >>> +
> >>> +class Multiprocess(Test):
> >>> +    """
> >>> +    :avocado: tags=3Dmultiprocess
> >>> +    """
> >>> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> >>> +
> >>> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
> >>> +        wait_for_console_pattern(self, success_message,
> >>> +                                 failure_message=3D'Kernel panic - n=
ot
> >>> syncing',
> >>> +                                 vm=3Dvm)
> >>> +
> >>> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> >>> +                machine_type):
> >>> +        if not kvm_available(self.arch, self.qemu_bin):
> >>> +            self.cancel(KVM_NOT_AVAILABLE)
> >>> +
> >>> +        # Create socketpair to connect proxy and remote processes
> >>> +        proxy_sock, remote_sock =3D socket.socketpair(socket.AF_UNIX=
,
> >>> +
> socket.SOCK_STREAM)
> >>> +        os.set_inheritable(proxy_sock.fileno(), True)
> >>> +        os.set_inheritable(remote_sock.fileno(), True)
> >>> +
> >>> +        kernel_path =3D self.fetch_asset(kernel_url)
> >>> +        initrd_path =3D self.fetch_asset(initrd_url)
> >>> +
> >>> +        # Create remote process
> >>> +        remote_vm =3D self.get_vm()
> >>> +        remote_vm.add_args('-machine', 'x-remote')
> >>> +        remote_vm.add_args('-nodefaults')
> >>> +        remote_vm.add_args('-device', 'lsi53c895a,id=3Dlsi1')
> >>> +        remote_vm.add_args('-object', 'x-remote-object,id=3Drobj1,'
> >>> +                           'devid=3Dlsi1,fd=3D'+str(remote_sock.file=
no()))
> >>> +        remote_vm.launch()
> >>> +
> >>> +        # Create proxy process
> >>> +        self.vm.set_console()
> >>> +        self.vm.add_args('-machine', machine_type)
> >>> +        self.vm.add_args('-accel', 'kvm')
> >>> +        self.vm.add_args('-cpu', 'host')
> >>> +        self.vm.add_args("-object",
> >>> +
>  "memory-backend-memfd,id=3Dsysmem-file,size=3D2G")
> >>> +        self.vm.add_args("--numa", "node,memdev=3Dsysmem-file")
> >>> +        self.vm.add_args("-m", "2048")
> >>> +        self.vm.add_args('-kernel', kernel_path,
> >>> +                         '-initrd', initrd_path,
> >>> +                         '-append', kernel_command_line)
> >>> +        self.vm.add_args('-device',
> >>> +                         'x-pci-proxy-dev,'
> >>> +                         'id=3Dlsi1,fd=3D'+str(proxy_sock.fileno()))
> >>> +        self.vm.launch()
> >>> +        self.wait_for_console_pattern("as init process")
> >>> +        exec_command_and_wait_for_pattern(self, "mount -t sysfs sysf=
s
> >>> /sys",
> >>> +                                          '', '')
> >>> +        exec_command_and_wait_for_pattern(self,
> >>> +                                          "cat
> >>> /sys/bus/pci/devices/*/uevent",
> >>> +                                          "PCI_ID=3D1000:0012", '')
> >>> +
> >>> +    def test_multiprocess_x86_64(self):
> >>> +        """
> >>> +        :avocado: tags=3Darch:x86_64
> >>> +        """
> >>> +        kernel_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +                      '/linux/releases/31/Everything/x86_64/os/image=
s'
> >>> +                      '/pxeboot/vmlinuz')
> >>> +        initrd_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +                      '/linux/releases/31/Everything/x86_64/os/image=
s'
> >>> +                      '/pxeboot/initrd.img')
> >>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> >>> +                               'console=3DttyS0 rdinit=3D/bin/bash')
> >>> +        machine =3D 'pc'
> >>> +        self.do_test(kernel_url, initrd_url, kernel_command_line,
> machine)
> >>> +
> >>> +    def test_multiprocess_aarch64(self):
> >>> +        """
> >>> +        :avocado: tags=3Darch:aarch64
> >>> +        """
> >>> +        kernel_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +
> '/linux/releases/31/Everything/aarch64/os/images'
> >>> +                      '/pxeboot/vmlinuz')
> >>> +        initrd_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +
> '/linux/releases/31/Everything/aarch64/os/images'
> >>> +                      '/pxeboot/initrd.img')
> >>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> >>> +                               'rdinit=3D/bin/bash console=3DttyAMA0=
')
> >>> +        machine_type =3D 'virt,gic-version=3D3'
> >>> +        self.do_test(kernel_url, initrd_url, kernel_command_line,
> >>> machine_type)
> >>> --
> >>> 2.25.GIT
> >>>
> >>>
> >> The test looks quite nice, thanks. However, it times out for me. I hav=
e
> >> very limited experience with avocado. Any idea?
> >
> > Thanks Marc-Andre!
> >
> >> (13/40)
> >> tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64=
:
> >> ERROR: timed out (211.81 s)
> >
> > Can you check what is in the log file?
> > Should show the log file name before it gets cancelled.
> >
> > I have it on my system at
> $HOME/avocado/job-results/job-2020-12-23T10.37-452c8ab/job.log.
>
> Hi Marc-Andre,
>
> Thank you very much for taking a loot at it. If you are able to share the
> test log,
> that would be helpful to see what is causing the timeout.
>

I tested it again, and it works now. No idea what happened.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--0000000000001f9a7205b83ba013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 29, 2020 at 8:19 PM Jag=
 Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Dec 23, 2020, at 1:49 PM, Elena Ufimtseva &lt;<a href=3D"mailto:ele=
na.ufimtseva@oracle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&g=
t; wrote:<br>
&gt; <br>
&gt; On Wed, Dec 23, 2020 at 03:01:24PM +0400, Marc-Andr=C3=A9 Lureau wrote=
:<br>
&gt;&gt; Hi<br>
&gt;&gt; <br>
&gt;&gt; On Wed, Dec 23, 2020 at 10:45 AM &lt;<a href=3D"mailto:elena.ufimt=
seva@oracle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt; wrote=
:<br>
&gt;&gt; <br>
&gt;&gt;&gt; From: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle=
.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Runs the Avocado acceptance test to check if a<br>
&gt;&gt;&gt; remote lsi53c895a device gets identified by the guest.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufi=
mtseva@oracle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.joh=
nson@oracle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.ram=
an@oracle.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; tests/acceptance/multiprocess.py | 104 +++++++++++++++++++++++=
++++++++<br>
&gt;&gt;&gt; 1 file changed, 104 insertions(+)<br>
&gt;&gt;&gt; create mode 100644 tests/acceptance/multiprocess.py<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; diff --git a/tests/acceptance/multiprocess.py<br>
&gt;&gt;&gt; b/tests/acceptance/multiprocess.py<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000000..d10b4d2c05<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/tests/acceptance/multiprocess.py<br>
&gt;&gt;&gt; @@ -0,0 +1,104 @@<br>
&gt;&gt;&gt; +# Test for multiprocess qemu<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# This work is licensed under the terms of the GNU GPL, versi=
on 2 or<br>
&gt;&gt;&gt; +# later.=C2=A0 See the COPYING file in the top-level director=
y.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +from avocado_qemu import Test<br>
&gt;&gt;&gt; +from avocado_qemu import wait_for_console_pattern<br>
&gt;&gt;&gt; +from avocado_qemu import exec_command_and_wait_for_pattern<br=
>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +from qemu.accel import kvm_available<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +import os<br>
&gt;&gt;&gt; +import socket<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +ACCEL_NOT_AVAILABLE_FMT =3D &quot;%s accelerator does not see=
m to be available&quot;<br>
&gt;&gt;&gt; +KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % &quot;KVM&quo=
t;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +class Multiprocess(Test):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 :avocado: tags=3Dmultiprocess<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 KERNEL_COMMON_COMMAND_LINE =3D &#39;printk.time=
=3D0 &#39;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 def wait_for_console_pattern(self, success_mess=
age, vm=3DNone):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_for_console_pattern(self, su=
ccess_message,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failure_message=
=3D&#39;Kernel panic - not<br>
&gt;&gt;&gt; syncing&#39;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm=3Dvm)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 def do_test(self, kernel_url, initrd_url, kerne=
l_command_line,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machi=
ne_type):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kvm_available(self.arch, s=
elf.qemu_bin):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cancel(KVM_NOT=
_AVAILABLE)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create socketpair to connect pr=
oxy and remote processes<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_sock, remote_sock =3D socke=
t.socketpair(socket.AF_UNIX,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 socket.SOCK_STREAM)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.set_inheritable(proxy_sock.fil=
eno(), True)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.set_inheritable(remote_sock.fi=
leno(), True)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asset(=
kernel_url)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_path =3D self.fetch_asset(=
initrd_url)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create remote process<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm =3D self.get_vm()<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-machine&=
#39;, &#39;x-remote&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-nodefaul=
ts&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-device&#=
39;, &#39;lsi53c895a,id=3Dlsi1&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.add_args(&#39;-object&#=
39;, &#39;x-remote-object,id=3Drobj1,&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;devid=3Dlsi1,fd=3D&#39;+str(remo=
te_sock.fileno()))<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_vm.launch()<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create proxy process<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-machine&#3=
9;, machine_type)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-accel&#39;=
, &#39;kvm&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-cpu&#39;, =
&#39;host&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-object&qu=
ot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory-backend-memfd,id=3Dsysmem-file,=
size=3D2G&quot;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;--numa&quo=
t;, &quot;node,memdev=3Dsysmem-file&quot;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-m&quot;, =
&quot;2048&quot;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39=
;, kernel_path,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-initrd&#39;, initrd_path,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39=
;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;x-pci-proxy-dev,&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;id=3Dlsi1,fd=3D&#39;+str(proxy_sock.fil=
eno()))<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(&qu=
ot;as init process&quot;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern=
(self, &quot;mount -t sysfs sysfs<br>
&gt;&gt;&gt; /sys&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;&#39;, &#39;&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern=
(self,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;cat<br>
&gt;&gt;&gt; /sys/bus/pci/devices/*/uevent&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;PCI_ID=3D1000:0012&quot;, &#39;&#39;)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 def test_multiprocess_x86_64(self):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:x86_64<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_url =3D (&#39;<br>
&gt;&gt;&gt; <a href=3D"https://archives.fedoraproject.org/pub/archive/fedo=
ra" rel=3D"noreferrer" target=3D"_blank">https://archives.fedoraproject.org=
/pub/archive/fedora</a>&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/linux/releases/31/Everything/x86_64/os/images&#39;<=
br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/pxeboot/vmlinuz&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<br>
&gt;&gt;&gt; <a href=3D"https://archives.fedoraproject.org/pub/archive/fedo=
ra" rel=3D"noreferrer" target=3D"_blank">https://archives.fedoraproject.org=
/pub/archive/fedora</a>&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/linux/releases/31/Everything/x86_64/os/images&#39;<=
br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/pxeboot/initrd.img&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KER=
NEL_COMMON_COMMAND_LINE +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;console=3DttyS0 rd=
init=3D/bin/bash&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D &#39;pc&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test(kernel_url, initrd_u=
rl, kernel_command_line, machine)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 def test_multiprocess_aarch64(self):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:aarch64<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_url =3D (&#39;<br>
&gt;&gt;&gt; <a href=3D"https://archives.fedoraproject.org/pub/archive/fedo=
ra" rel=3D"noreferrer" target=3D"_blank">https://archives.fedoraproject.org=
/pub/archive/fedora</a>&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/linux/releases/31/Everything/aarch64/os/images&#39;=
<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/pxeboot/vmlinuz&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<br>
&gt;&gt;&gt; <a href=3D"https://archives.fedoraproject.org/pub/archive/fedo=
ra" rel=3D"noreferrer" target=3D"_blank">https://archives.fedoraproject.org=
/pub/archive/fedora</a>&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/linux/releases/31/Everything/aarch64/os/images&#39;=
<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;/pxeboot/initrd.img&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KER=
NEL_COMMON_COMMAND_LINE +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;rdinit=3D/bin/bash=
 console=3DttyAMA0&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine_type =3D &#39;virt,gic-ve=
rsion=3D3&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test(kernel_url, initrd_u=
rl, kernel_command_line,<br>
&gt;&gt;&gt; machine_type)<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.25.GIT<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt; The test looks quite nice, thanks. However, it times out for me. I=
 have<br>
&gt;&gt; very limited experience with avocado. Any idea?<br>
&gt; <br>
&gt; Thanks Marc-Andre!<br>
&gt; <br>
&gt;&gt; (13/40)<br>
&gt;&gt; tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x8=
6_64:<br>
&gt;&gt; ERROR: timed out (211.81 s)<br>
&gt; <br>
&gt; Can you check what is in the log file?<br>
&gt; Should show the log file name before it gets cancelled.<br>
&gt; <br>
&gt; I have it on my system at $HOME/avocado/job-results/job-2020-12-23T10.=
37-452c8ab/job.log.<br>
<br>
Hi Marc-Andre,<br>
<br>
Thank you very much for taking a loot at it. If you are able to share the t=
est log,<br>
that would be helpful to see what is causing the timeout.<br></blockquote><=
div><br></div><div>I tested it again, and it works now. No idea what happen=
ed.</div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt=
; <br></div><br></div></div>

--0000000000001f9a7205b83ba013--

