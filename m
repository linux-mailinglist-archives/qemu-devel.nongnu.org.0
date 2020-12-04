Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16FD2CEF78
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:12:22 +0100 (CET)
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBor-0006F1-S4
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klBnd-0005iA-3Y
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:11:05 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:39198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klBna-0007la-AO
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:11:04 -0500
Received: by mail-ej1-x643.google.com with SMTP id n26so8865113eju.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xSELEq5dtWcZE3GAFsDKljXnJds5xVnRE8OcRpJucA=;
 b=mgMJzgt5TpA1tzGHQ4i9XmU9J9+ZNFVKm2snX7yXWC2Q8l+3K6i85jMZCyp0XM7Ybh
 1GPRamh2uCYZyKMjSMI/jwZdPNkexpZ3WcPqt/f7O32q6u9LHgsUwB32/uzPPjrrYvff
 YDG2X01+OmbL53+I3pFrry3dpP+cPFsKAW+jdH5cBrmpUazYKoUBAJRqq6UTXoaIW2/s
 zoKWuNvt0eKJ6Z0c9k9e/4HodV11SebTtFXkr/H4efbQ832ZO+UnSDyBHIyi1Hkr1YZv
 BXqs6ziECHI+jUSyXkXwBQQ7bf/SpDnG2ZjqTgKiSe99EKVoMKhU8cjeWdvh1WXEY1Sz
 f2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xSELEq5dtWcZE3GAFsDKljXnJds5xVnRE8OcRpJucA=;
 b=sGwOHGjhQYmCVvmBbO6gS/1gJpbK0VaMnu0iWkaoKTTHu/inxLajNLuS5PYfBc6Zen
 vcomtw8m1uIY1HHGx43pl3J6HFptICPO779cm2My32wVy09K/kHDRMJw981X7nGtZke4
 +8VfKmTaZYtp0Y197sIWuuAuKJu+BYHgJ0VlzH1/MaDoYYZkbz/JkF5JPMa8NrsTkEUh
 18YuQrQVbI2XFFWchmZERKunEAMPjOhV09sjcCZqwAjb6Nqmha0Nm0S5yKbJuAYhsgmI
 2ostxvaUt6SGrYxjue1I9bH6l/iLA5xOMs2fyK+48mvIMXRrCzU/XaVGvaqtTwa24E8v
 T9TQ==
X-Gm-Message-State: AOAM532IZHxFCp+5gfvF6k/fTYsHBDV1ubI5Y3lgMmFD39uamaxzwF0I
 VBqiaXoV7r6qCjWGDgZcUGL7Dq9SX1cVwM/wCHc=
X-Google-Smtp-Source: ABdhPJw/wtp7T/jqjl1azkrXNfkVzWAVDBxty046sMd8ESF6/KsOT9J41E1MzW6UF5UB11s11c5tD2mCUQMJ8lwWCWI=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr7344414ejx.389.1607091060745; 
 Fri, 04 Dec 2020 06:11:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <cc6c74cba091d2735f0dbcba4b5fa28d8a780908.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <cc6c74cba091d2735f0dbcba4b5fa28d8a780908.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 18:10:47 +0400
Message-ID: <CAJ+F1C+yi0_imaAxH0o7xmRBVGOwCtM8AtDL_QscHhbcCnCnUA@mail.gmail.com>
Subject: Re: [PATCH v12 02/19] multi-process: add configure and usage
 information
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000cc2e7905b5a40bb4"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cc2e7905b5a40bb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Adds documentation explaining the command-line arguments needed
> to use multi-process. Also adds a python script that illustrates the
> usage.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/multi-process.rst                        | 66 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  tests/multiprocess/multiprocess-lsi53c895a.py | 92
> +++++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 docs/multi-process.rst
>  create mode 100755 tests/multiprocess/multiprocess-lsi53c895a.py
>
> diff --git a/docs/multi-process.rst b/docs/multi-process.rst
> new file mode 100644
> index 0000000..9a5fe5b
> --- /dev/null
> +++ b/docs/multi-process.rst
> @@ -0,0 +1,66 @@
> +Multi-process QEMU
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document describes how to configure and use multi-process qemu.
> +For the design document refer to docs/devel/qemu-multiprocess.
> +
> +1) Configuration
> +----------------
> +
> +multi-process is enabled by default for targets that enable KVM
> +
> +
> +2) Usage
> +--------
> +
> +Multi-process QEMU requires an orchestrator to launch. Please refer to a
> +light-weight python based orchestrator for mpqemu in
> +scripts/mpqemu-launcher.py to lauch QEMU in multi-process mode.
> +
> +Following is a description of command-line used to launch mpqemu.
> +
> +* Orchestrator:
> +
> +  - The Orchestrator creates a unix socketpair
> +
> +  - It launches the remote process and passes one of the
> +    sockets to it via command-line.
> +
> +  - It then launches QEMU and specifies the other socket as an option
> +    to the Proxy device object
> +
> +* Remote Process:
> +
> +  - QEMU can enter remote process mode by using the "remote" machine
> +    option.
> +
> +  - The orchestrator creates a "remote-object" with details about
> +    the device and the file descriptor for the device
> +
> +  - The remaining options are no different from how one launches QEMU wi=
th
> +    devices.
> +
> +  - Example command-line for the remote process is as follows:
> +
> +      /usr/bin/qemu-system-x86_64                                       =
 \
> +      -machine x-remote                                                 =
 \
> +      -device lsi53c895a,id=3Dlsi0                                      =
   \
> +      -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2      =
     \
> +      -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi=
-id=3D0  \
> +      -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,
> +
> +* QEMU:
> +
> +  - Since parts of the RAM are shared between QEMU & remote process, a
> +    memory-backend-memfd is required to facilitate this, as follows:
> +
> +    -object memory-backend-memfd,id=3Dmem,size=3D2G
> +
> +  - A "x-pci-proxy-dev" device is created for each of the PCI devices
> emulated
> +    in the remote process. A "socket" sub-option specifies the other end
> of
> +    unix channel created by orchestrator. The "id" sub-option must be
> specified
> +    and should be the same as the "id" specified for the remote PCI devi=
ce
> +
> +  - Example commandline for QEMU is as follows:
> +
> +      -device x-pci-proxy-dev,id=3Dlsi0,socket=3D3
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 88a5a14..f615ad1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3136,6 +3136,7 @@ M: Jagannathan Raman <jag.raman@oracle.com>
>  M: John G Johnson <john.g.johnson@oracle.com>
>  S: Maintained
>  F: docs/devel/multi-process.rst
> +F: tests/multiprocess/multiprocess-lsi53c895a.py
>
>  Build and test automation
>  -------------------------
> diff --git a/tests/multiprocess/multiprocess-lsi53c895a.py
> b/tests/multiprocess/multiprocess-lsi53c895a.py
> new file mode 100755
> index 0000000..bfe4f66
> --- /dev/null
> +++ b/tests/multiprocess/multiprocess-lsi53c895a.py
>

This might not be appropriate under qemu tree tests/ imho. It's not a test,
at best it complements the documentation.

@@ -0,0 +1,92 @@
> +#!/usr/bin/env python3
> +
> +import urllib.request
> +import subprocess
> +import argparse
> +import socket
> +import sys
> +import os
> +
> +arch =3D os.uname()[4]
> +proc_path =3D os.path.join(os.getcwd(), '..', '..', 'build',
> arch+'-softmmu',
> +                         'qemu-system-'+arch)
> +
> +parser =3D argparse.ArgumentParser(description=3D'Launcher for multi-pro=
cess
> QEMU')
> +parser.add_argument('--bin', required=3DFalse, help=3D'location of QEMU
> binary',
> +                    metavar=3D'bin');
> +args =3D parser.parse_args()
> +
> +if args.bin is not None:
> +    proc_path =3D args.bin
> +
> +if not os.path.isfile(proc_path):
> +    sys.exit('QEMU binary not found')
> +
> +kernel_path =3D os.path.join(os.getcwd(), 'vmlinuz')
> +initrd_path =3D os.path.join(os.getcwd(), 'initrd')
> +
> +proxy_cmd =3D [ proc_path,
>   \
> +              '-name', 'Fedora', '-smp', '4', '-m', '2048', '-cpu',
> 'host', \
> +              '-object', 'memory-backend-memfd,id=3Dsysmem-file,size=3D2=
G',
>    \
> +              '-numa', 'node,memdev=3Dsysmem-file',
>    \
> +              '-kernel', kernel_path, '-initrd', initrd_path,
>    \
> +              '-vnc', ':0',
>    \
> +              '-monitor', 'unix:/home/qemu-sock,server,nowait',
>    \
>

That path is odd. Make it a TemporaryFile, or an argument. Even simpler,
use socketpair()

+            ]
> +
> +if arch =3D=3D 'x86_64':
> +    print('Downloading images for arch x86_64')
> +    kernel_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/x86_64/os/images/'          \
> +                 'pxeboot/vmlinuz'
> +    initrd_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/x86_64/os/images/'          \
> +                 'pxeboot/initrd.img'
> +    proxy_cmd.append('-machine')
> +    proxy_cmd.append('pc,accel=3Dkvm')
> +    proxy_cmd.append('-append')
> +    proxy_cmd.append('rdinit=3D/bin/bash console=3DttyS0 console=3Dtty0'=
)
> +elif arch =3D=3D 'aarch64':
> +    print('Downloading images for arch aarch64')
> +    kernel_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/aarch64/os/images/'         \
> +                 'pxeboot/vmlinuz'
> +    initrd_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/aarch64/os/images/'         \
> +                 'pxeboot/initrd.img'
> +    proxy_cmd.append('-machine')
> +    proxy_cmd.append('virt,gic-version=3D3')
> +    proxy_cmd.append('-accel')
> +    proxy_cmd.append('kvm')
> +    proxy_cmd.append('-append')
> +    proxy_cmd.append('rdinit=3D/bin/bash')
>

We have vm-based testing under tests/vm, can we imagine extending that
instead?

To not delay further the series, I would suggest to drop it for now.

+else:
> +    sys.exit('Arch %s not tested' % arch)
> +
> +urllib.request.urlretrieve(kernel_url, kernel_path)
> +urllib.request.urlretrieve(initrd_url, initrd_path)
> +
> +proxy, remote =3D socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
> +
> +proxy_cmd.append('-device')
> +proxy_cmd.append('x-pci-proxy-dev,id=3Dlsi1,fd=3D'+str(proxy.fileno()))
> +
> +remote_cmd =3D [ proc_path,
>       \
> +               '-machine', 'x-remote',
>      \
> +               '-device', 'lsi53c895a,id=3Dlsi1',
>       \
> +               '-object',
>       \
> +
>  'x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D'+str(remote.fileno()), \
> +               '-display', 'none',
>      \
> +               '-monitor', 'unix:/home/rem-sock,server,nowait',
>       \
> +             ]
> +
> +pid =3D os.fork();
> +
> +if pid:
> +    # In Proxy
> +    print('Launching QEMU with Proxy object');
> +    process =3D subprocess.Popen(proxy_cmd, pass_fds=3D[proxy.fileno()])
> +else:
> +    # In remote
> +    print('Launching Remote process');
> +    process =3D subprocess.Popen(remote_cmd, pass_fds=3D[remote.fileno()=
, 0,
> 1, 2])
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cc2e7905b5a40bb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jag=
annathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com"=
 target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Adds documentation explaining the command-line arguments needed<br>
to use multi-process. Also adds a python script that illustrates the<br>
usage.<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0docs/multi-process.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 66 +++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
=C2=A0tests/multiprocess/multiprocess-lsi53c895a.py | 92 ++++++++++++++++++=
+++++++++<br>
=C2=A03 files changed, 159 insertions(+)<br>
=C2=A0create mode 100644 docs/multi-process.rst<br>
=C2=A0create mode 100755 tests/multiprocess/multiprocess-lsi53c895a.py<br>
<br>
diff --git a/docs/multi-process.rst b/docs/multi-process.rst<br>
new file mode 100644<br>
index 0000000..9a5fe5b<br>
--- /dev/null<br>
+++ b/docs/multi-process.rst<br>
@@ -0,0 +1,66 @@<br>
+Multi-process QEMU<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+This document describes how to configure and use multi-process qemu.<br>
+For the design document refer to docs/devel/qemu-multiprocess.<br>
+<br>
+1) Configuration<br>
+----------------<br>
+<br>
+multi-process is enabled by default for targets that enable KVM<br>
+<br>
+<br>
+2) Usage<br>
+--------<br>
+<br>
+Multi-process QEMU requires an orchestrator to launch. Please refer to a<b=
r>
+light-weight python based orchestrator for mpqemu in<br>
+scripts/mpqemu-launcher.py to lauch QEMU in multi-process mode.<br>
+<br>
+Following is a description of command-line used to launch mpqemu.<br>
+<br>
+* Orchestrator:<br>
+<br>
+=C2=A0 - The Orchestrator creates a unix socketpair<br>
+<br>
+=C2=A0 - It launches the remote process and passes one of the<br>
+=C2=A0 =C2=A0 sockets to it via command-line.<br>
+<br>
+=C2=A0 - It then launches QEMU and specifies the other socket as an option=
<br>
+=C2=A0 =C2=A0 to the Proxy device object<br>
+<br>
+* Remote Process:<br>
+<br>
+=C2=A0 - QEMU can enter remote process mode by using the &quot;remote&quot=
; machine<br>
+=C2=A0 =C2=A0 option.<br>
+<br>
+=C2=A0 - The orchestrator creates a &quot;remote-object&quot; with details=
 about<br>
+=C2=A0 =C2=A0 the device and the file descriptor for the device<br>
+<br>
+=C2=A0 - The remaining options are no different from how one launches QEMU=
 with<br>
+=C2=A0 =C2=A0 devices.<br>
+<br>
+=C2=A0 - Example command-line for the remote process is as follows:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 /usr/bin/qemu-system-x86_64=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 -machine x-remote=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 -device lsi53c895a,id=3Dlsi0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-=
1.qcow2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=
=3Dlsi0.0,scsi-id=3D0=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D=
4,<br>
+<br>
+* QEMU:<br>
+<br>
+=C2=A0 - Since parts of the RAM are shared between QEMU &amp; remote proce=
ss, a<br>
+=C2=A0 =C2=A0 memory-backend-memfd is required to facilitate this, as foll=
ows:<br>
+<br>
+=C2=A0 =C2=A0 -object memory-backend-memfd,id=3Dmem,size=3D2G<br>
+<br>
+=C2=A0 - A &quot;x-pci-proxy-dev&quot; device is created for each of the P=
CI devices emulated<br>
+=C2=A0 =C2=A0 in the remote process. A &quot;socket&quot; sub-option speci=
fies the other end of<br>
+=C2=A0 =C2=A0 unix channel created by orchestrator. The &quot;id&quot; sub=
-option must be specified<br>
+=C2=A0 =C2=A0 and should be the same as the &quot;id&quot; specified for t=
he remote PCI device<br>
+<br>
+=C2=A0 - Example commandline for QEMU is as follows:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -device x-pci-proxy-dev,id=3Dlsi0,socket=3D3<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 88a5a14..f615ad1 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3136,6 +3136,7 @@ M: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@=
oracle.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
=C2=A0M: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.com" ta=
rget=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
=C2=A0S: Maintained<br>
=C2=A0F: docs/devel/multi-process.rst<br>
+F: tests/multiprocess/multiprocess-lsi53c895a.py<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/tests/multiprocess/multiprocess-lsi53c895a.py b/tests/multipro=
cess/multiprocess-lsi53c895a.py<br>
new file mode 100755<br>
index 0000000..bfe4f66<br>
--- /dev/null<br>
+++ b/tests/multiprocess/multiprocess-lsi53c895a.py<br></blockquote><div><b=
r></div><div>This might not be appropriate under qemu tree tests/ imho. It&=
#39;s not a test, at best it complements the documentation.</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
@@ -0,0 +1,92 @@<br>
+#!/usr/bin/env python3<br>
+<br>
+import urllib.request<br>
+import subprocess<br>
+import argparse<br>
+import socket<br>
+import sys<br>
+import os<br>
+<br>
+arch =3D os.uname()[4]<br>
+proc_path =3D os.path.join(os.getcwd(), &#39;..&#39;, &#39;..&#39;, &#39;b=
uild&#39;, arch+&#39;-softmmu&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;qemu-system-&#39;+arch)<br>
+<br>
+parser =3D argparse.ArgumentParser(description=3D&#39;Launcher for multi-p=
rocess QEMU&#39;)<br>
+parser.add_argument(&#39;--bin&#39;, required=3DFalse, help=3D&#39;locatio=
n of QEMU binary&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta=
var=3D&#39;bin&#39;);<br>
+args =3D parser.parse_args()<br>
+<br>
+if args.bin is not None:<br>
+=C2=A0 =C2=A0 proc_path =3D args.bin<br>
+<br>
+if not os.path.isfile(proc_path):<br>
+=C2=A0 =C2=A0 sys.exit(&#39;QEMU binary not found&#39;)<br>
+<br>
+kernel_path =3D os.path.join(os.getcwd(), &#39;vmlinuz&#39;)<br>
+initrd_path =3D os.path.join(os.getcwd(), &#39;initrd&#39;)<br>
+<br>
+proxy_cmd =3D [ proc_path,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-name&#39;, &#39;Fed=
ora&#39;, &#39;-smp&#39;, &#39;4&#39;, &#39;-m&#39;, &#39;2048&#39;, &#39;-=
cpu&#39;, &#39;host&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-object&#39;, &#39;m=
emory-backend-memfd,id=3Dsysmem-file,size=3D2G&#39;,=C2=A0 =C2=A0 =C2=A0\<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-numa&#39;, &#39;nod=
e,memdev=3Dsysmem-file&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-kernel&#39;, kernel=
_path, &#39;-initrd&#39;, initrd_path,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-vnc&#39;, &#39;:0&#=
39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-monitor&#39;, &#39;=
unix:/home/qemu-sock,server,nowait&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br></blockquote><div><br></div><div>That path is odd. Make i=
t a TemporaryFile, or an argument. Even simpler, use socketpair()<br></div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+<br>
+if arch =3D=3D &#39;x86_64&#39;:<br>
+=C2=A0 =C2=A0 print(&#39;Downloading images for arch x86_64&#39;)<br>
+=C2=A0 =C2=A0 kernel_url =3D &#39;<a href=3D"https://dl.fedoraproject.org/=
pub/fedora/linux/" rel=3D"noreferrer" target=3D"_blank">https://dl.fedorapr=
oject.org/pub/fedora/linux/</a>&#39;=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;release=
s/33/Everything/x86_64/os/images/&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pxeboot=
/vmlinuz&#39;<br>
+=C2=A0 =C2=A0 initrd_url =3D &#39;<a href=3D"https://dl.fedoraproject.org/=
pub/fedora/linux/" rel=3D"noreferrer" target=3D"_blank">https://dl.fedorapr=
oject.org/pub/fedora/linux/</a>&#39;=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;release=
s/33/Everything/x86_64/os/images/&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pxeboot=
/initrd.img&#39;<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;-machine&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;pc,accel=3Dkvm&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;-append&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;rdinit=3D/bin/bash console=3DttyS0 con=
sole=3Dtty0&#39;)<br>
+elif arch =3D=3D &#39;aarch64&#39;:<br>
+=C2=A0 =C2=A0 print(&#39;Downloading images for arch aarch64&#39;)<br>
+=C2=A0 =C2=A0 kernel_url =3D &#39;<a href=3D"https://dl.fedoraproject.org/=
pub/fedora/linux/" rel=3D"noreferrer" target=3D"_blank">https://dl.fedorapr=
oject.org/pub/fedora/linux/</a>&#39;=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;release=
s/33/Everything/aarch64/os/images/&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pxeboot=
/vmlinuz&#39;<br>
+=C2=A0 =C2=A0 initrd_url =3D &#39;<a href=3D"https://dl.fedoraproject.org/=
pub/fedora/linux/" rel=3D"noreferrer" target=3D"_blank">https://dl.fedorapr=
oject.org/pub/fedora/linux/</a>&#39;=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;release=
s/33/Everything/aarch64/os/images/&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pxeboot=
/initrd.img&#39;<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;-machine&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;virt,gic-version=3D3&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;-accel&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;kvm&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;-append&#39;)<br>
+=C2=A0 =C2=A0 proxy_cmd.append(&#39;rdinit=3D/bin/bash&#39;)<br></blockquo=
te><div><br></div><div>We have vm-based testing under tests/vm, can we imag=
ine extending that instead?</div><div><br></div><div>To not delay further t=
he series, I would suggest to drop it for now.<br></div><div> <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+else:<br>
+=C2=A0 =C2=A0 sys.exit(&#39;Arch %s not tested&#39; % arch)<br>
+<br>
+urllib.request.urlretrieve(kernel_url, kernel_path)<br>
+urllib.request.urlretrieve(initrd_url, initrd_path)<br>
+<br>
+proxy, remote =3D socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)<br=
>
+<br>
+proxy_cmd.append(&#39;-device&#39;)<br>
+proxy_cmd.append(&#39;x-pci-proxy-dev,id=3Dlsi1,fd=3D&#39;+str(proxy.filen=
o()))<br>
+<br>
+remote_cmd =3D [ proc_path,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-machine&#39;,=
 &#39;x-remote&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-device&#39;, =
&#39;lsi53c895a,id=3Dlsi1&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-object&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;x-remote-objec=
t,id=3Drobj1,devid=3Dlsi1,fd=3D&#39;+str(remote.fileno()), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-display&#39;,=
 &#39;none&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-monitor&#39;,=
 &#39;unix:/home/rem-sock,server,nowait&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+<br>
+pid =3D os.fork();<br>
+<br>
+if pid:<br>
+=C2=A0 =C2=A0 # In Proxy<br>
+=C2=A0 =C2=A0 print(&#39;Launching QEMU with Proxy object&#39;);<br>
+=C2=A0 =C2=A0 process =3D subprocess.Popen(proxy_cmd, pass_fds=3D[proxy.fi=
leno()])<br>
+else:<br>
+=C2=A0 =C2=A0 # In remote<br>
+=C2=A0 =C2=A0 print(&#39;Launching Remote process&#39;);<br>
+=C2=A0 =C2=A0 process =3D subprocess.Popen(remote_cmd, pass_fds=3D[remote.=
fileno(), 0, 1, 2])<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cc2e7905b5a40bb4--

