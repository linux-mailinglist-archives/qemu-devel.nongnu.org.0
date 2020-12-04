Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B172CEFB8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:32:18 +0100 (CET)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klC88-0005Ls-Vh
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klC5R-00042a-BN
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:29:29 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klC5O-0005NZ-Q2
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:29:29 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so8968792ejj.5
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avHyNNQouFbw9NoJwg66VrLzlJSm4ZC8fTA7tsrh7VI=;
 b=dtSKUTYtQUvUh7nJDWTjIVOoXPtarDqWNFD3fbPqqrKtT7CZzCW0I2Vi8FslA/K/zN
 yaMuKhLagqyz6ogJb/jmlbrhJkJEnot+NHyW9Ykpw3pfUJtK6qEMTwkag5vCu1+8mjM1
 rtezn3avDOI80FL0ZMBSRfelNH6DEL/B6gXfg8a79k2KGAJfl+wgyTnQPnns4vteWlhg
 X1umMM/pbuSVRmdctfroxcs9mopaHhBX11lbBxFwwAm/0ZWLo92s4L0pXykRwxC6JVBX
 MTnoLrRukkb8bUE+BsByT7njtQbC85iySIk8BUVX8Wczn6bLmDClF7W3DZ0JfRZzbp6p
 KHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avHyNNQouFbw9NoJwg66VrLzlJSm4ZC8fTA7tsrh7VI=;
 b=Onvn1/tkALWjJChkwf+5D3NhlzbsXYuNR6NJXMYdzguHowRjXPKOC+iM5UtFK0DgTR
 dFizjE3L7Au+3TjnWYtjrbDelMOcZA5V1jQDCr/Uq9lGZ22aN0gtAUV71KL+kU+dHQfb
 ga0ymA65xLWLFyPPycWUmUzWC0Mexjw99uuDk/7lUd7g2KbvcugrpARZQW3ajP9byZfq
 qM9RSL0ovZlBxDClASZtntvtOTahMWx4DBOUF8xvQvPaVq8Fo7sFps8+OCZ2aYSkF41G
 27NO/3Yls0RQ41/Pn/s4HUboUbXKo+B9MNStmDIG7XdTmyWdHWJUOUx6071fFObyNWsk
 aW4g==
X-Gm-Message-State: AOAM530utPuQV1jRebGbw6r4OQxlZkT9bopmGI/O0TnHcXy+JrshmQmJ
 LxiUjWT575gm6gkkG+6iPxXBKWEt9hu/OwxZjmM=
X-Google-Smtp-Source: ABdhPJzvLDUHkiFG93JARQMuFwUn2eT3II0yHrs04maWPI7Ub8WmetcH6swN2kuF0tE6YA7lfM6x53sBABmpSlPCaN0=
X-Received: by 2002:a17:906:aacd:: with SMTP id
 kt13mr7146220ejb.527.1607092165207; 
 Fri, 04 Dec 2020 06:29:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <52599a1edb0edfab0753688e3bf8544e036da441.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <52599a1edb0edfab0753688e3bf8544e036da441.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 18:29:13 +0400
Message-ID: <CAJ+F1CLodL57kCvLoU8t-ofHF0bp_Wip540FNsw+g_26VA1wbw@mail.gmail.com>
Subject: Re: [PATCH v12 05/19] multi-process: setup PCI host bridge for remote
 device
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000a0ecb205b5a44d84"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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

--000000000000a0ecb205b5a44d84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> PCI host bridge is setup for the remote device process. It is
> implemented using remote-pcihost object. It is an extension of the PCI
> host bridge setup by QEMU.
> Remote-pcihost configures a PCI bus which could be used by the remote
> PCI device to latch on to.
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/pci-host/remote.h | 30 ++++++++++++++++++
>  hw/pci-host/remote.c         | 75
> ++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |  2 ++
>  hw/pci-host/Kconfig          |  3 ++
>  hw/pci-host/meson.build      |  1 +
>  hw/remote/Kconfig            |  1 +
>  6 files changed, 112 insertions(+)
>  create mode 100644 include/hw/pci-host/remote.h
>  create mode 100644 hw/pci-host/remote.c
>
> diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
> new file mode 100644
> index 0000000..bab6d3c
> --- /dev/null
> +++ b/include/hw/pci-host/remote.h
> @@ -0,0 +1,30 @@
> +/*
> + * PCI Host for remote device
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_PCIHOST_H
> +#define REMOTE_PCIHOST_H
> +
> +#include "exec/memory.h"
> +#include "hw/pci/pcie_host.h"
> +
> +#define TYPE_REMOTE_HOST_DEVICE "remote-pcihost"
> +#define REMOTE_HOST_DEVICE(obj) \
> +    OBJECT_CHECK(RemotePCIHost, (obj), TYPE_REMOTE_HOST_DEVICE)
> +
> +typedef struct RemotePCIHost {
> +    /*< private >*/
> +    PCIExpressHost parent_obj;
> +    /*< public >*/
> +
> +    MemoryRegion *mr_pci_mem;
> +    MemoryRegion *mr_sys_io;
> +} RemotePCIHost;
> +
> +#endif
> diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c
> new file mode 100644
> index 0000000..11325e2
> --- /dev/null
> +++ b/hw/pci-host/remote.c
> @@ -0,0 +1,75 @@
> +/*
> + * Remote PCI host device
> + *
> + * Unlike PCI host devices that model physical hardware, the purpose
> + * of this PCI host is to host multi-process QEMU devices.
> + *
> + * Multi-process QEMU extends the PCI host of a QEMU machine into a
> + * remote process. Any PCI device attached to the remote process is
> + * visible in the QEMU guest. This allows existing QEMU device models
> + * to be reused in the remote process.
> + *
> + * This PCI host is purely a container for PCI devices. It's fake in the
> + * sense that the guest never sees this PCI host and has no way of
> + * accessing it. Its job is just to provide the environment that QEMU
> + * PCI device models need when running in a remote process.
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
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/pci/pcie_host.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/pci-host/remote.h"
> +#include "exec/memory.h"
> +
> +static const char *remote_pcihost_root_bus_path(PCIHostState *host_bridg=
e,
> +                                                PCIBus *rootbus)
> +{
> +    return "0000:00";
> +}
> +
> +static void remote_pcihost_realize(DeviceState *dev, Error **errp)
> +{
> +    PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);
> +    RemotePCIHost *s =3D REMOTE_HOST_DEVICE(dev);
> +
> +    pci->bus =3D pci_root_bus_new(DEVICE(s), "remote-pci",
> +                                s->mr_pci_mem, s->mr_sys_io,
> +                                0, TYPE_PCIE_BUS);
> +}
> +
> +static void remote_pcihost_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(klass);
> +
> +    hc->root_bus_path =3D remote_pcihost_root_bus_path;
> +    dc->realize =3D remote_pcihost_realize;
> +
> +    dc->user_creatable =3D false;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->fw_name =3D "pci";
> +}
> +
> +static const TypeInfo remote_pcihost_info =3D {
> +    .name =3D TYPE_REMOTE_HOST_DEVICE,
> +    .parent =3D TYPE_PCIE_HOST_BRIDGE,
> +    .instance_size =3D sizeof(RemotePCIHost),
> +    .class_init =3D remote_pcihost_class_init,
> +};
> +
> +static void remote_pcihost_register(void)
> +{
> +    type_register_static(&remote_pcihost_info);
> +}
> +
> +type_init(remote_pcihost_register)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f615ad1..4515476 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3137,6 +3137,8 @@ M: John G Johnson <john.g.johnson@oracle.com>
>  S: Maintained
>  F: docs/devel/multi-process.rst
>  F: tests/multiprocess/multiprocess-lsi53c895a.py
> +F: hw/pci-host/remote.c
> +F: include/hw/pci-host/remote.h
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 036a618..25cdeb2 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -60,3 +60,6 @@ config PCI_BONITO
>      select PCI
>      select UNIMP
>      bool
> +
> +config MULTIPROCESS_HOST
> +    bool
>

Why not REMOTE_PCIHOST ?

diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index e6d1b89..4147100 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -9,6 +9,7 @@ pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true:
> files('xilinx-pcie.c'))
>  pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
>  pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
>  pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true:
> files('xen_igd_pt.c'))
> +pci_ss.add(when: 'CONFIG_MULTIPROCESS_HOST', if_true: files('remote.c'))
>
>  # PPC devices
>  pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
> diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
> index 5484446..fb6ee4a 100644
> --- a/hw/remote/Kconfig
> +++ b/hw/remote/Kconfig
> @@ -1,3 +1,4 @@
>  config MULTIPROCESS
>      bool
>      depends on PCI && KVM
> +    select MULTIPROCESS_HOST
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a0ecb205b5a44d84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com" target=3D"_blank">=
jag.raman@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">PCI host bridge is setup for the remote device process.=
 It is<br>
implemented using remote-pcihost object. It is an extension of the PCI<br>
host bridge setup by QEMU.<br>
Remote-pcihost configures a PCI bus which could be used by the remote<br>
PCI device to latch on to.<br>
<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/pci-host/remote.h | 30 ++++++++++++++++++<br>
=C2=A0hw/pci-host/remote.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 75 ++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
=C2=A0hw/pci-host/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br=
>
=C2=A0hw/pci-host/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0hw/remote/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 =
+<br>
=C2=A06 files changed, 112 insertions(+)<br>
=C2=A0create mode 100644 include/hw/pci-host/remote.h<br>
=C2=A0create mode 100644 hw/pci-host/remote.c<br>
<br>
diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h<br=
>
new file mode 100644<br>
index 0000000..bab6d3c<br>
--- /dev/null<br>
+++ b/include/hw/pci-host/remote.h<br>
@@ -0,0 +1,30 @@<br>
+/*<br>
+ * PCI Host for remote device<br>
+ *<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef REMOTE_PCIHOST_H<br>
+#define REMOTE_PCIHOST_H<br>
+<br>
+#include &quot;exec/memory.h&quot;<br>
+#include &quot;hw/pci/pcie_host.h&quot;<br>
+<br>
+#define TYPE_REMOTE_HOST_DEVICE &quot;remote-pcihost&quot;<br>
+#define REMOTE_HOST_DEVICE(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(RemotePCIHost, (obj), TYPE_REMOTE_HOST_DEVICE)<=
br>
+<br>
+typedef struct RemotePCIHost {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 PCIExpressHost parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion *mr_pci_mem;<br>
+=C2=A0 =C2=A0 MemoryRegion *mr_sys_io;<br>
+} RemotePCIHost;<br>
+<br>
+#endif<br>
diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c<br>
new file mode 100644<br>
index 0000000..11325e2<br>
--- /dev/null<br>
+++ b/hw/pci-host/remote.c<br>
@@ -0,0 +1,75 @@<br>
+/*<br>
+ * Remote PCI host device<br>
+ *<br>
+ * Unlike PCI host devices that model physical hardware, the purpose<br>
+ * of this PCI host is to host multi-process QEMU devices.<br>
+ *<br>
+ * Multi-process QEMU extends the PCI host of a QEMU machine into a<br>
+ * remote process. Any PCI device attached to the remote process is<br>
+ * visible in the QEMU guest. This allows existing QEMU device models<br>
+ * to be reused in the remote process.<br>
+ *<br>
+ * This PCI host is purely a container for PCI devices. It&#39;s fake in t=
he<br>
+ * sense that the guest never sees this PCI host and has no way of<br>
+ * accessing it. Its job is just to provide the environment that QEMU<br>
+ * PCI device models need when running in a remote process.<br>
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
+#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;hw/pci/pci_host.h&quot;<br>
+#include &quot;hw/pci/pcie_host.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/pci-host/remote.h&quot;<br>
+#include &quot;exec/memory.h&quot;<br>
+<br>
+static const char *remote_pcihost_root_bus_path(PCIHostState *host_bridge,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 PCIBus *rootbus)<br>
+{<br>
+=C2=A0 =C2=A0 return &quot;0000:00&quot;;<br>
+}<br>
+<br>
+static void remote_pcihost_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);<br>
+=C2=A0 =C2=A0 RemotePCIHost *s =3D REMOTE_HOST_DEVICE(dev);<br>
+<br>
+=C2=A0 =C2=A0 pci-&gt;bus =3D pci_root_bus_new(DEVICE(s), &quot;remote-pci=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mr_pci_mem, s-&gt;mr_sys_io,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, TYPE_PCIE_BUS);<br>
+}<br>
+<br>
+static void remote_pcihost_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 hc-&gt;root_bus_path =3D remote_pcihost_root_bus_path;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D remote_pcihost_realize;<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;user_creatable =3D false;<br>
+=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_BRIDGE, dc-&gt;categories);<br>
+=C2=A0 =C2=A0 dc-&gt;fw_name =3D &quot;pci&quot;;<br>
+}<br>
+<br>
+static const TypeInfo remote_pcihost_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_REMOTE_HOST_DEVICE,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_PCIE_HOST_BRIDGE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RemotePCIHost),<br>
+=C2=A0 =C2=A0 .class_init =3D remote_pcihost_class_init,<br>
+};<br>
+<br>
+static void remote_pcihost_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;remote_pcihost_info);<br>
+}<br>
+<br>
+type_init(remote_pcihost_register)<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index f615ad1..4515476 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3137,6 +3137,8 @@ M: John G Johnson &lt;<a href=3D"mailto:john.g.johnso=
n@oracle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
=C2=A0S: Maintained<br>
=C2=A0F: docs/devel/multi-process.rst<br>
=C2=A0F: tests/multiprocess/multiprocess-lsi53c895a.py<br>
+F: hw/pci-host/remote.c<br>
+F: include/hw/pci-host/remote.h<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig<br>
index 036a618..25cdeb2 100644<br>
--- a/hw/pci-host/Kconfig<br>
+++ b/hw/pci-host/Kconfig<br>
@@ -60,3 +60,6 @@ config PCI_BONITO<br>
=C2=A0 =C2=A0 =C2=A0select PCI<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+<br>
+config MULTIPROCESS_HOST<br>
+=C2=A0 =C2=A0 bool<br></blockquote><div><br></div><div>Why not  REMOTE_PCI=
HOST ?</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build<br>
index e6d1b89..4147100 100644<br>
--- a/hw/pci-host/meson.build<br>
+++ b/hw/pci-host/meson.build<br>
@@ -9,6 +9,7 @@ pci_ss.add(when: &#39;CONFIG_PCI_EXPRESS_XILINX&#39;, if_tr=
ue: files(&#39;xilinx-pcie.c&#39;))<br>
=C2=A0pci_ss.add(when: &#39;CONFIG_PCI_I440FX&#39;, if_true: files(&#39;i44=
0fx.c&#39;))<br>
=C2=A0pci_ss.add(when: &#39;CONFIG_PCI_SABRE&#39;, if_true: files(&#39;sabr=
e.c&#39;))<br>
=C2=A0pci_ss.add(when: &#39;CONFIG_XEN_IGD_PASSTHROUGH&#39;, if_true: files=
(&#39;xen_igd_pt.c&#39;))<br>
+pci_ss.add(when: &#39;CONFIG_MULTIPROCESS_HOST&#39;, if_true: files(&#39;r=
emote.c&#39;))<br>
<br>
=C2=A0# PPC devices<br>
=C2=A0pci_ss.add(when: &#39;CONFIG_PREP_PCI&#39;, if_true: files(&#39;prep.=
c&#39;))<br>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig<br>
index 5484446..fb6ee4a 100644<br>
--- a/hw/remote/Kconfig<br>
+++ b/hw/remote/Kconfig<br>
@@ -1,3 +1,4 @@<br>
=C2=A0config MULTIPROCESS<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on PCI &amp;&amp; KVM<br>
+=C2=A0 =C2=A0 select MULTIPROCESS_HOST<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000a0ecb205b5a44d84--

