Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D377C2CEFC2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:36:57 +0100 (CET)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCCe-0008Ks-VI
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klCBh-0007tt-6U
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:35:57 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klCBe-0007qA-QQ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:35:56 -0500
Received: by mail-ej1-x642.google.com with SMTP id ga15so8996472ejb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JLBFuOO0TGNt9Qi6xHjT74wVq3NLNyRbpF8tZgtEogA=;
 b=to/VcZyB3Z4LfhHL6ioY/EqAIK1ix9Jso/N1PV7vu0jWvqMZicN/jvXHFPa3izCxYk
 puuuBO91Td6vtx5qRLrJxcRvocc0/OX89Wmw3gxpJAWU/+wQ1RzKDynHbGZpggDNTWOd
 tye0alQRQK0zcCSaWGTGsXsYA3H+EVQRsPnQjXN9LExk5nmQP6onpxHo6cgswz3enf6/
 CXbG3WwUUTcGL7Z1ioSAfdXyvs6eE40vpbL7cYj2RFnJAYtA8/YT3BLzg8er52YkBUOs
 pjwwyTOen2kQ1znonQfFTaQZPQYAheOtwZH2PnezvufRFoPbAUZcbLrEpYH6tVq62vJQ
 77+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JLBFuOO0TGNt9Qi6xHjT74wVq3NLNyRbpF8tZgtEogA=;
 b=mh4v1jSh5dt6V+O1fKWv95P4vA9NUENFwzHdiIA5tFsR2BdnemxA5HsMGOerp+aaMD
 9eo1ts01WurG00ZI1pJNS6ykMdn60ZmR8kjc3/vAPFQ3Fl6V+tchJM8ULlGBiz2ZrYbc
 wPevSq4/+ZfSzB68TC7RKzHLeH59RjpWfmlGlKlHZY+8lfnUbyJX329X5t/s7lY5WMO3
 W2wPNcl9Ck6ELJLJeMnbAZUXalwQ5wFYEeGJw00MvXzPIsqdAdrTgPsmjhQGBozMyHN1
 tD44Yr1umci6u2B6K3y58AmUd9VrhDCkJ8e5gpNz7dIgC/itHkKcwW24JJtzllbGRO5L
 wvbg==
X-Gm-Message-State: AOAM532qUYwHTGESMXNihLg+3nBTkZ5k38l/Tgol8jkCNRmIwRe4OHCT
 fVktvhAWeNLVquChH+Q49atb4fPvvWlvPvdAWHA=
X-Google-Smtp-Source: ABdhPJxxWUGCUwNrZmIpH5081qYRHOQBasltpwGSye5ee1x5+75HcCoNU2uBNTmRpayP5u1vkjmTjG7wpxnJ2f7bMsA=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr7414286ejj.105.1607092553053; 
 Fri, 04 Dec 2020 06:35:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <8b654f7ac999a3594f117fcf3b2da1c4cfe4cc65.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <8b654f7ac999a3594f117fcf3b2da1c4cfe4cc65.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 18:35:40 +0400
Message-ID: <CAJ+F1CLt8ysY6er9wLEfgAcoE0rMXaX2kfjOeHGK_VKOQoudkw@mail.gmail.com>
Subject: Re: [PATCH v12 06/19] multi-process: setup a machine object for
 remote device process
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000befd6b05b5a464a8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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

--000000000000befd6b05b5a464a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> x-remote-machine object sets up various subsystems of the remote
> device process. Instantiate PCI host bridge object and initialize RAM, IO=
 &
> PCI memory regions.
>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/pci-host/remote.h |  1 +
>  include/hw/remote/machine.h  | 28 ++++++++++++++++++
>  hw/remote/machine.c          | 69
> ++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |  2 ++
>  hw/meson.build               |  1 +
>  hw/remote/meson.build        |  5 ++++
>  6 files changed, 106 insertions(+)
>  create mode 100644 include/hw/remote/machine.h
>  create mode 100644 hw/remote/machine.c
>  create mode 100644 hw/remote/meson.build
>
> diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
> index bab6d3c..cc0fff4 100644
> --- a/include/hw/pci-host/remote.h
> +++ b/include/hw/pci-host/remote.h
> @@ -25,6 +25,7 @@ typedef struct RemotePCIHost {
>
>      MemoryRegion *mr_pci_mem;
>      MemoryRegion *mr_sys_io;
> +    MemoryRegion *mr_sys_mem;
>

Why is this not part of the previous patch?

 } RemotePCIHost;
>
>  #endif
> diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
> new file mode 100644
> index 0000000..d312972
> --- /dev/null
> +++ b/include/hw/remote/machine.h
> @@ -0,0 +1,28 @@
> +/*
> + * Remote machine configuration
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_MACHINE_H
> +#define REMOTE_MACHINE_H
> +
> +#include "qom/object.h"
> +#include "hw/boards.h"
> +#include "hw/pci-host/remote.h"
> +
> +typedef struct RemoteMachineState {
> +    MachineState parent_obj;
> +
> +    RemotePCIHost *host;
> +} RemoteMachineState;
> +
> +#define TYPE_REMOTE_MACHINE "x-remote-machine"
> +#define REMOTE_MACHINE(obj) \
> +    OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MACHINE)
> +
> +#endif
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> new file mode 100644
> index 0000000..c5658bf
> --- /dev/null
> +++ b/hw/remote/machine.c
> @@ -0,0 +1,69 @@
> +/*
> + * Machine for remote device
> + *
> + *  This machine type is used by the remote device process in
> multi-process
> + *  QEMU. QEMU device models depend on parent busses, interrupt
> controllers,
> + *  memory regions, etc. The remote machine type offers this environment
> so
> + *  that QEMU device models can be used as remote devices.
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/machine.h"
> +#include "exec/address-spaces.h"
> +#include "exec/memory.h"
> +#include "qapi/error.h"
> +
> +static void remote_machine_init(MachineState *machine)
> +{
> +    MemoryRegion *system_memory, *system_io, *pci_memory;
> +    RemoteMachineState *s =3D REMOTE_MACHINE(machine);
> +    RemotePCIHost *rem_host;
> +
> +    system_memory =3D get_system_memory();
> +    system_io =3D get_system_io();
> +
> +    pci_memory =3D g_new(MemoryRegion, 1);
> +    memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
> +
> +    rem_host =3D REMOTE_HOST_DEVICE(qdev_new(TYPE_REMOTE_HOST_DEVICE));
> +
> +    rem_host->mr_pci_mem =3D pci_memory;
> +    rem_host->mr_sys_mem =3D system_memory;
> +    rem_host->mr_sys_io =3D system_io;
> +
> +    s->host =3D rem_host;
> +
> +    object_property_add_child(OBJECT(s), "remote-device",
> OBJECT(rem_host));
>

"remote-pcihost" instead ?

+    memory_region_add_subregion_overlap(system_memory, 0x0, pci_memory,
> -1);
> +
> +    qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
> +}
> +
> +static void remote_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +    mc->init =3D remote_machine_init;
>

Set mc->desc =3D "Experimental remote machine" ?

+}
> +
> +static const TypeInfo remote_machine =3D {
> +    .name =3D TYPE_REMOTE_MACHINE,
> +    .parent =3D TYPE_MACHINE,
> +    .instance_size =3D sizeof(RemoteMachineState),
> +    .class_init =3D remote_machine_class_init,
> +};
> +
> +static void remote_machine_register_types(void)
> +{
> +    type_register_static(&remote_machine);
> +}
> +
> +type_init(remote_machine_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4515476..c45ac1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3139,6 +3139,8 @@ F: docs/devel/multi-process.rst
>  F: tests/multiprocess/multiprocess-lsi53c895a.py
>  F: hw/pci-host/remote.c
>  F: include/hw/pci-host/remote.h
> +F: hw/remote/machine.c
> +F: include/hw/remote/machine.h
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/meson.build b/hw/meson.build
> index 010de72..e615d72 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -56,6 +56,7 @@ subdir('moxie')
>  subdir('nios2')
>  subdir('openrisc')
>  subdir('ppc')
> +subdir('remote')
>  subdir('riscv')
>  subdir('rx')
>  subdir('s390x')
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> new file mode 100644
> index 0000000..197b038
> --- /dev/null
> +++ b/hw/remote/meson.build
> @@ -0,0 +1,5 @@
> +remote_ss =3D ss.source_set()
> +
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
> +
> +softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000befd6b05b5a464a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">x-remote-machine object sets up various subsystems of the remote<br>
device process. Instantiate PCI host bridge object and initialize RAM, IO &=
amp;<br>
PCI memory regions.<br>
<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/pci-host/remote.h |=C2=A0 1 +<br>
=C2=A0include/hw/remote/machine.h=C2=A0 | 28 ++++++++++++++++++<br>
=C2=A0hw/remote/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 69 ++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
=C2=A0hw/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++<br>
=C2=A06 files changed, 106 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/machine.h<br>
=C2=A0create mode 100644 hw/remote/machine.c<br>
=C2=A0create mode 100644 hw/remote/meson.build<br>
<br>
diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h<br=
>
index bab6d3c..cc0fff4 100644<br>
--- a/include/hw/pci-host/remote.h<br>
+++ b/include/hw/pci-host/remote.h<br>
@@ -25,6 +25,7 @@ typedef struct RemotePCIHost {<br>
<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *mr_pci_mem;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *mr_sys_io;<br>
+=C2=A0 =C2=A0 MemoryRegion *mr_sys_mem;<br></blockquote><div><br></div><di=
v>Why is this not part of the previous patch?</div><div> <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
=C2=A0} RemotePCIHost;<br>
<br>
=C2=A0#endif<br>
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h<br>
new file mode 100644<br>
index 0000000..d312972<br>
--- /dev/null<br>
+++ b/include/hw/remote/machine.h<br>
@@ -0,0 +1,28 @@<br>
+/*<br>
+ * Remote machine configuration<br>
+ *<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef REMOTE_MACHINE_H<br>
+#define REMOTE_MACHINE_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/pci-host/remote.h&quot;<br>
+<br>
+typedef struct RemoteMachineState {<br>
+=C2=A0 =C2=A0 MachineState parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 RemotePCIHost *host;<br>
+} RemoteMachineState;<br>
+<br>
+#define TYPE_REMOTE_MACHINE &quot;x-remote-machine&quot;<br>
+#define REMOTE_MACHINE(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MACHINE)=
<br>
+<br>
+#endif<br>
diff --git a/hw/remote/machine.c b/hw/remote/machine.c<br>
new file mode 100644<br>
index 0000000..c5658bf<br>
--- /dev/null<br>
+++ b/hw/remote/machine.c<br>
@@ -0,0 +1,69 @@<br>
+/*<br>
+ * Machine for remote device<br>
+ *<br>
+ *=C2=A0 This machine type is used by the remote device process in multi-p=
rocess<br>
+ *=C2=A0 QEMU. QEMU device models depend on parent busses, interrupt contr=
ollers,<br>
+ *=C2=A0 memory regions, etc. The remote machine type offers this environm=
ent so<br>
+ *=C2=A0 that QEMU device models can be used as remote devices.<br>
+ *<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+<br>
+#include &quot;hw/remote/machine.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;exec/memory.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+<br>
+static void remote_machine_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 MemoryRegion *system_memory, *system_io, *pci_memory;<br>
+=C2=A0 =C2=A0 RemoteMachineState *s =3D REMOTE_MACHINE(machine);<br>
+=C2=A0 =C2=A0 RemotePCIHost *rem_host;<br>
+<br>
+=C2=A0 =C2=A0 system_memory =3D get_system_memory();<br>
+=C2=A0 =C2=A0 system_io =3D get_system_io();<br>
+<br>
+=C2=A0 =C2=A0 pci_memory =3D g_new(MemoryRegion, 1);<br>
+=C2=A0 =C2=A0 memory_region_init(pci_memory, NULL, &quot;pci&quot;, UINT64=
_MAX);<br>
+<br>
+=C2=A0 =C2=A0 rem_host =3D REMOTE_HOST_DEVICE(qdev_new(TYPE_REMOTE_HOST_DE=
VICE));<br>
+<br>
+=C2=A0 =C2=A0 rem_host-&gt;mr_pci_mem =3D pci_memory;<br>
+=C2=A0 =C2=A0 rem_host-&gt;mr_sys_mem =3D system_memory;<br>
+=C2=A0 =C2=A0 rem_host-&gt;mr_sys_io =3D system_io;<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;host =3D rem_host;<br>
+<br>
+=C2=A0 =C2=A0 object_property_add_child(OBJECT(s), &quot;remote-device&quo=
t;, OBJECT(rem_host));<br></blockquote><div><br></div><div>&quot;remote-pci=
host&quot; instead ?</div><div> <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 memory_region_add_subregion_overlap(system_memory, 0x0, pci_=
memory, -1);<br>
+<br>
+=C2=A0 =C2=A0 qdev_realize(DEVICE(rem_host), sysbus_get_default(), &amp;er=
ror_fatal);<br>
+}<br>
+<br>
+static void remote_machine_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D remote_machine_init;<br></blockquote><div><b=
r></div><div>Set mc-&gt;desc =3D &quot;Experimental remote machine&quot; ?<=
/div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+static const TypeInfo remote_machine =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_REMOTE_MACHINE,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_MACHINE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RemoteMachineState),<br>
+=C2=A0 =C2=A0 .class_init =3D remote_machine_class_init,<br>
+};<br>
+<br>
+static void remote_machine_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;remote_machine);<br>
+}<br>
+<br>
+type_init(remote_machine_register_types);<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 4515476..c45ac1d 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3139,6 +3139,8 @@ F: docs/devel/multi-process.rst<br>
=C2=A0F: tests/multiprocess/multiprocess-lsi53c895a.py<br>
=C2=A0F: hw/pci-host/remote.c<br>
=C2=A0F: include/hw/pci-host/remote.h<br>
+F: hw/remote/machine.c<br>
+F: include/hw/remote/machine.h<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/meson.build b/hw/meson.build<br>
index 010de72..e615d72 100644<br>
--- a/hw/meson.build<br>
+++ b/hw/meson.build<br>
@@ -56,6 +56,7 @@ subdir(&#39;moxie&#39;)<br>
=C2=A0subdir(&#39;nios2&#39;)<br>
=C2=A0subdir(&#39;openrisc&#39;)<br>
=C2=A0subdir(&#39;ppc&#39;)<br>
+subdir(&#39;remote&#39;)<br>
=C2=A0subdir(&#39;riscv&#39;)<br>
=C2=A0subdir(&#39;rx&#39;)<br>
=C2=A0subdir(&#39;s390x&#39;)<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
new file mode 100644<br>
index 0000000..197b038<br>
--- /dev/null<br>
+++ b/hw/remote/meson.build<br>
@@ -0,0 +1,5 @@<br>
+remote_ss =3D ss.source_set()<br>
+<br>
+remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;mac=
hine.c&#39;))<br>
+<br>
+softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: remote_ss=
)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000befd6b05b5a464a8--

