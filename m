Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930CD2DC191
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:50:07 +0100 (CET)
Received: from localhost ([::1]:45280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXBu-0006RA-Ku
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpX7P-0002Eo-0C
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:45:27 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpX7M-0005vW-QM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:45:26 -0500
Received: by mail-ej1-x633.google.com with SMTP id b9so7842086ejy.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGtptQNRaUjz7UkttfZdi1ZFI/AvVJvmQKpRiS1dDJE=;
 b=B1K2TOLEr2BOy7m3OUOFRbquV1/RoWnFEwNulLGsXo2kJ32Lf3us9NnlBiMfHlXtkR
 06CZw86m/f0d/uHgSxPV6loL+lMz3BqGo7krq1wdq49ZxkH1L3ATxz20VykriiCgKIYQ
 Cyi5SiimxnecWwK4Q3e6BmGtHzYhc3DzESu3S8PqqdQ9mPuP7egXDA5Ali9cEwj740g+
 qlZQsGi0MgUkMc1ODNqBqF/mShDVXxZC0Fakpn2rLnv6hC2wbYgjNc7bFqzqEwqQd5+D
 2ZOcQtFHUtKP9jO0/SSsBEBVNZkPlPDFm70zCEKHyCp0M0nkiGTYPeDtoqJgVwEQAvlp
 mUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGtptQNRaUjz7UkttfZdi1ZFI/AvVJvmQKpRiS1dDJE=;
 b=UqyfHNMxTFsXIFuO0efCnQNJS3dhLiPxq6/WYZ0frF0PauV82sdoloEw75OvBkQaqF
 PU8ziYiXlQS+Rh9Njf/lLR1C9mvFGtXrCiagCvGBIRVIiSFKhmTnoSnJB0R7BSiAFRlg
 89XN4sPIHVQsLyYfuMSRddsHStcu1B3NtlkOgGyjI8PGxtvPGBVwvd5wkuT0jbdVpoY+
 ST/2oy9ml8H8fce/8PwlNx7g7mNbgrlqf2c4ZMQLeBBBfXlO0btzYX1i9G2uRqTzhg5/
 Fc9XsPBezHigfsfmoGul5zVUZStJ1fgHUSVYfbn1PqTnaEd7y56U6Fmy0T8Zqb4W9Ehv
 O8lQ==
X-Gm-Message-State: AOAM530Qlk6348DZ36wtqlkTmBjoSg11umh+w2H8HPVkax3r7KNWahaW
 /ez3bBk7yjPf+6UEsh88pLpGvcCyqt7nMdZX95A=
X-Google-Smtp-Source: ABdhPJyoq9CCh9Gv4dudq8vXZUrdP5bVizZELReH8iDUfEE8bOQ4pB6pQbr9UoUnNFt+EuheaSioWPpU+e7BbVM9JXU=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr30715051ejb.532.1608126322254; 
 Wed, 16 Dec 2020 05:45:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607922214.git.jag.raman@oracle.com>
 <b9277cd2d3239d7bd51e06317a7bfd6b28188a26.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <b9277cd2d3239d7bd51e06317a7bfd6b28188a26.1607922214.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 17:45:08 +0400
Message-ID: <CAJ+F1C+o8MggRS1t9YvN3GdGe5geGpUFeLtR_mBLf5HJjy2EtA@mail.gmail.com>
Subject: Re: [PATCH v13 12/19] multi-process: introduce proxy object
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000031284e05b69516f6"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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

--00000000000031284e05b69516f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Defines a PCI Device proxy object as a child of TYPE_PCI_DEVICE.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/proxy.h | 36 +++++++++++++++++++
>  hw/remote/proxy.c         | 91
> +++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS               |  2 ++
>  hw/remote/meson.build     |  1 +
>  4 files changed, 130 insertions(+)
>  create mode 100644 include/hw/remote/proxy.h
>  create mode 100644 hw/remote/proxy.c
>
> diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
> new file mode 100644
> index 0000000..923432a
> --- /dev/null
> +++ b/include/hw/remote/proxy.h
> @@ -0,0 +1,36 @@
> +/*
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef PROXY_H
> +#define PROXY_H
> +
> +#include "hw/pci/pci.h"
> +#include "io/channel.h"
> +
> +#define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
> +
> +#define PCI_PROXY_DEV(obj) \
> +            OBJECT_CHECK(PCIProxyDev, (obj), TYPE_PCI_PROXY_DEV)
> +typedef struct PCIProxyDev PCIProxyDev;
> +
> +struct PCIProxyDev {
> +    PCIDevice parent_dev;
> +    char *fd;
> +
> +    /*
> +     * Mutex used to protect the QIOChannel fd from
> +     * the concurrent access by the VCPUs since proxy
> +     * blocks while awaiting for the replies from the
> +     * process remote.
> +     */
> +    QemuMutex io_mutex;
> +    QIOChannel *ioc;
> +    Error *migration_blocker;
> +};
> +
> +#endif /* PROXY_H */
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> new file mode 100644
> index 0000000..b5f3dc5
> --- /dev/null
> +++ b/hw/remote/proxy.c
> @@ -0,0 +1,91 @@
> +/*
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
> +#include "hw/remote/proxy.h"
> +#include "hw/pci/pci.h"
> +#include "qapi/error.h"
> +#include "io/channel-util.h"
> +#include "hw/qdev-properties.h"
> +#include "monitor/monitor.h"
> +#include "migration/blocker.h"
> +
> +static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PCIProxyDev *dev =3D PCI_PROXY_DEV(device);
> +    int fd;
> +
> +    if (!dev->fd) {
> +        error_setg(errp, "fd parameter not specified for %s",
> +                   DEVICE(device)->id);
> +        return;
> +    }
> +
> +    fd =3D monitor_fd_param(monitor_cur(), dev->fd, errp);
> +    if (fd =3D=3D -1) {
> +        error_prepend(errp, "proxy: unable to parse fd: ");
> +        return;
> +    }
>

Let's add a fd_is_socket() check.

+    dev->ioc =3D qio_channel_new_fd(fd, errp);
> +
> +    error_setg(&dev->migration_blocker, "%s does not support migration",
> +               TYPE_PCI_PROXY_DEV);
> +    migrate_add_blocker(dev->migration_blocker, errp);
> +
> +    qemu_mutex_init(&dev->io_mutex);
> +    qio_channel_set_blocking(dev->ioc, true, NULL);
> +}
> +
> +static void pci_proxy_dev_exit(PCIDevice *pdev)
> +{
> +    PCIProxyDev *dev =3D PCI_PROXY_DEV(pdev);
> +
> +    if (dev->ioc) {
> +        qio_channel_close(dev->ioc, NULL);
> +    }
> +
> +    migrate_del_blocker(dev->migration_blocker);
> +
> +    error_free(dev->migration_blocker);
> +}
> +
> +static Property proxy_properties[] =3D {
> +    DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    k->realize =3D pci_proxy_dev_realize;
> +    k->exit =3D pci_proxy_dev_exit;
> +    device_class_set_props(dc, proxy_properties);
> +}
> +
> +static const TypeInfo pci_proxy_dev_type_info =3D {
> +    .name          =3D TYPE_PCI_PROXY_DEV,
> +    .parent        =3D TYPE_PCI_DEVICE,
> +    .instance_size =3D sizeof(PCIProxyDev),
> +    .class_init    =3D pci_proxy_dev_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
> +};
> +
> +static void pci_proxy_dev_register_types(void)
> +{
> +    type_register_static(&pci_proxy_dev_type_info);
> +}
> +
> +type_init(pci_proxy_dev_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 33a4ad6..cd88aeb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3163,6 +3163,8 @@ F: hw/remote/message.c
>  F: hw/remote/remote-obj.c
>  F: include/hw/remote/memory.h
>  F: hw/remote/memory.c
> +F: hw/remote/proxy.c
> +F: include/hw/remote/proxy.h
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 64da16c..569cd20 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -4,6 +4,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('machine.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('mpqemu-link.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'=
))
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
>
>  specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
>
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000031284e05b69516f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 9:15 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" t=
arget=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Defines a PCI Device proxy object as a child of TYPE_PCI_DEVICE.<br>
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
=C2=A0include/hw/remote/proxy.h | 36 +++++++++++++++++++<br>
=C2=A0hw/remote/proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 91 +++++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 ++<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A04 files changed, 130 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/proxy.h<br>
=C2=A0create mode 100644 hw/remote/proxy.c<br>
<br>
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h<br>
new file mode 100644<br>
index 0000000..923432a<br>
--- /dev/null<br>
+++ b/include/hw/remote/proxy.h<br>
@@ -0,0 +1,36 @@<br>
+/*<br>
+ * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef PROXY_H<br>
+#define PROXY_H<br>
+<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+<br>
+#define TYPE_PCI_PROXY_DEV &quot;x-pci-proxy-dev&quot;<br>
+<br>
+#define PCI_PROXY_DEV(obj) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT_CHECK(PCIProxyDev, (obj),=
 TYPE_PCI_PROXY_DEV)<br>
+typedef struct PCIProxyDev PCIProxyDev;<br>
+<br>
+struct PCIProxyDev {<br>
+=C2=A0 =C2=A0 PCIDevice parent_dev;<br>
+=C2=A0 =C2=A0 char *fd;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Mutex used to protect the QIOChannel fd from<br>
+=C2=A0 =C2=A0 =C2=A0* the concurrent access by the VCPUs since proxy<br>
+=C2=A0 =C2=A0 =C2=A0* blocks while awaiting for the replies from the<br>
+=C2=A0 =C2=A0 =C2=A0* process remote.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 QemuMutex io_mutex;<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+=C2=A0 =C2=A0 Error *migration_blocker;<br>
+};<br>
+<br>
+#endif /* PROXY_H */<br>
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c<br>
new file mode 100644<br>
index 0000000..b5f3dc5<br>
--- /dev/null<br>
+++ b/hw/remote/proxy.c<br>
@@ -0,0 +1,91 @@<br>
+/*<br>
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
+#include &quot;hw/remote/proxy.h&quot;<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;io/channel-util.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;monitor/monitor.h&quot;<br>
+#include &quot;migration/blocker.h&quot;<br>
+<br>
+static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
+=C2=A0 =C2=A0 PCIProxyDev *dev =3D PCI_PROXY_DEV(device);<br>
+=C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 if (!dev-&gt;fd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;fd parameter not specif=
ied for %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEVIC=
E(device)-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 fd =3D monitor_fd_param(monitor_cur(), dev-&gt;fd, errp);<br=
>
+=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_prepend(errp, &quot;proxy: unable to par=
se fd: &quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Let&#39;s add a fd_is_=
socket() check.<br></div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+=C2=A0 =C2=A0 dev-&gt;ioc =3D qio_channel_new_fd(fd, errp);<br>
+<br>
+=C2=A0 =C2=A0 error_setg(&amp;dev-&gt;migration_blocker, &quot;%s does not=
 support migration&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_PCI_PROXY_DEV)=
;<br>
+=C2=A0 =C2=A0 migrate_add_blocker(dev-&gt;migration_blocker, errp);<br>
+<br>
+=C2=A0 =C2=A0 qemu_mutex_init(&amp;dev-&gt;io_mutex);<br>
+=C2=A0 =C2=A0 qio_channel_set_blocking(dev-&gt;ioc, true, NULL);<br>
+}<br>
+<br>
+static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 PCIProxyDev *dev =3D PCI_PROXY_DEV(pdev);<br>
+<br>
+=C2=A0 =C2=A0 if (dev-&gt;ioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_close(dev-&gt;ioc, NULL);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 migrate_del_blocker(dev-&gt;migration_blocker);<br>
+<br>
+=C2=A0 =C2=A0 error_free(dev-&gt;migration_blocker);<br>
+}<br>
+<br>
+static Property proxy_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;fd&quot;, PCIProxyDev, fd),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 k-&gt;realize =3D pci_proxy_dev_realize;<br>
+=C2=A0 =C2=A0 k-&gt;exit =3D pci_proxy_dev_exit;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, proxy_properties);<br>
+}<br>
+<br>
+static const TypeInfo pci_proxy_dev_type_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PCI_PROXY_D=
EV,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PCI_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(PCIProxyDev),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D pci_proxy_dev_class_init,<br>
+=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { INTERFACE_CONVENTIONAL_PCI_DEVICE },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void pci_proxy_dev_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;pci_proxy_dev_type_info);<br>
+}<br>
+<br>
+type_init(pci_proxy_dev_register_types)<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 33a4ad6..cd88aeb 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3163,6 +3163,8 @@ F: hw/remote/message.c<br>
=C2=A0F: hw/remote/remote-obj.c<br>
=C2=A0F: include/hw/remote/memory.h<br>
=C2=A0F: hw/remote/memory.c<br>
+F: hw/remote/proxy.c<br>
+F: include/hw/remote/proxy.h<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
index 64da16c..569cd20 100644<br>
--- a/hw/remote/meson.build<br>
+++ b/hw/remote/meson.build<br>
@@ -4,6 +4,7 @@ remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true:=
 files(&#39;machine.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;mpqemu-link.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;message.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;remote-obj.c&#39;))<br>
+remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;pro=
xy.c&#39;))<br>
<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&=
#39;memory.c&#39;))<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000031284e05b69516f6--

