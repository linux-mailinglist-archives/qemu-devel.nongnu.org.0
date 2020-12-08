Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD482D2AE0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:30 +0100 (CET)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmc8T-0004ft-Pf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmc1t-0007r5-Iz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:41 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmc1r-0005sw-3l
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:41 -0500
Received: by mail-ed1-x543.google.com with SMTP id q16so17328321edv.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CSN6E5atJ9rIDpK1GCR+/6etfu5SJ3ZxSEzqB9I8bV4=;
 b=PFHJIML5ZgaR1KGcD13QAjX4aUlI0HdYuX1VjHEVi2w9fCpzd6DROPvtpYaElcU5xK
 h3zHVR8GJerFtVB29cKQ0Viu1y2WBoIHjOQwDa5q1OyddJVmeXwold+gwB6sdk2dgWGy
 uaAJxkTQHB8WDWwIVdDMmo53U5gJbFK+rvMDD6KQ0Ro/BYhvaNoRoQ7qBaQoW+1Nu0lm
 XAJ/rUmkinFQ20lys06FqVhcWwvFpZVDiY6ZG3/HcB1Pi3JUev564w8DWvJlz0bZkxn/
 3L+QfZI92dpRZaSF6BknTzDS7+dgPRdSo7tmJi0FCdG7eHV1lijtJY2l/XGpSBlsGA/x
 JIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CSN6E5atJ9rIDpK1GCR+/6etfu5SJ3ZxSEzqB9I8bV4=;
 b=tS1VC9wEoQWTsycXEQ4OYECztwQWtt79poRRLAQFaBlhbCksR9OxPsgyUGWC+WRAB6
 ZnPBnvQpNfqQUsH6Yah6ZGmaWNEjk/9bxH4dgJta4mae8wIFAOooOOkjqmpDxeOfN+x5
 GyQkYMF5Glf5tIzUpQARlc+POTyHO+mjhZckV1SnCIDItneIAOLh2h5LdD6tKPVUdO12
 EmfpSH94i9fGBVyYm99m3oQPTmNczXvsBUWIEO7C1xmPZZsPq5AMWrWK2Oc6CiJ4rmwv
 w5IL3cwA0Fsz1yihn4bV3xnfI0LVOLYM6rcAADtF/Afmr997NegKJ9XjfUJevL5Nmoc+
 Aojw==
X-Gm-Message-State: AOAM530lTVnvYlAodP+TDcG8tPE4T4kMTX8hYrxsnJ6B0Qxl2pfYR84h
 Lrj04ewzYgmyMxR6LKWR6SZgKy9ROfLU81pKmfw=
X-Google-Smtp-Source: ABdhPJw6WbYRW9C50NDi6PENQpTtWeLpTTrSHtgHYWPcUZM8pbFp18bu4zgbdwPWrH9m2Y2Qb+Sd98nfLSn+G1MlTHE=
X-Received: by 2002:a50:e846:: with SMTP id k6mr24805430edn.245.1607430217860; 
 Tue, 08 Dec 2020 04:23:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <42f53a5af6279581509638b23ca624e560e07f71.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <42f53a5af6279581509638b23ca624e560e07f71.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 16:23:25 +0400
Message-ID: <CAJ+F1CK6KxR16TeUT30SkhCz37=1FzqawbwMnKhw=r0yKLXbeA@mail.gmail.com>
Subject: Re: [PATCH v12 12/19] multi-process: introduce proxy object
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000023087605b5f30325"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
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

--00000000000023087605b5f30325
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
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
>  include/hw/remote/proxy.h | 36 +++++++++++++++++
>  hw/remote/proxy.c         | 98
> +++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS               |  2 +
>  hw/remote/meson.build     |  1 +
>  4 files changed, 137 insertions(+)
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
>
+
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
> index 0000000..29100bc
> --- /dev/null
> +++ b/hw/remote/proxy.c
> @@ -0,0 +1,98 @@
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
> +static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)
> +{
> +    pdev->ioc =3D qio_channel_new_fd(fd, errp);
> +}
>

That one line function (called once) should be inlined.

+
> +static Property proxy_properties[] =3D {
> +    DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>

Generally we put properties just above class_init, where it is used.

+static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
> +{
>

(errp shouldn't be NULL, but ERRP_GUARD would be safer)

+    PCIProxyDev *dev =3D PCI_PROXY_DEV(device);
> +    int fd;
> +
> +    if (dev->fd) {
> +        fd =3D monitor_fd_param(monitor_cur(), dev->fd, errp);
> +        if (fd =3D=3D -1) {
> +            error_prepend(errp, "proxy: unable to parse fd: ");
> +            return;
> +        }
> +        proxy_set_socket(dev, fd, errp);
> +    } else {
> +        error_setg(errp, "fd parameter not specified for %s",
> +                   DEVICE(device)->id);
> +        return;
>

We prefer early return, to keep the code easy to read.

if (!dev->fd) {
  return error...
}

the_normal_thing();
...

+    }
> +
> +    error_setg(&dev->migration_blocker, "%s does not support migration",
> +               TYPE_PCI_PROXY_DEV);
> +    if (migrate_add_blocker(dev->migration_blocker, errp)) {
> +        error_free(dev->migration_blocker);
>

leave that free to dev_exit() ?


> +        error_free(*errp);
> +        dev->migration_blocker =3D NULL;
> +        error_setg(errp, "Failed to set migration blocker");
>

Why not use the error from migrate_add_blocker?

+    }
> +
> +    qemu_mutex_init(&dev->io_mutex);
> +    qio_channel_set_blocking(dev->ioc, true, NULL);
> +}
> +
> +static void pci_proxy_dev_exit(PCIDevice *pdev)
> +{
> +    PCIProxyDev *dev =3D PCI_PROXY_DEV(pdev);
> +
> +    qio_channel_close(dev->ioc, NULL);
>

on early return in realize, dev->ioc is NULL. This will crash.


+
> +    migrate_del_blocker(dev->migration_blocker);
>

So is migration_blocker, but this should be safe with NULL


> +
> +    error_free(dev->migration_blocker);
>
+}
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
> index 24cb36e..ebd1d1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3148,6 +3148,8 @@ F: include/hw/remote/remote-obj.h
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

--00000000000023087605b5f30325
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
=C2=A0include/hw/remote/proxy.h | 36 +++++++++++++++++<br>
=C2=A0hw/remote/proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 98 +++++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A04 files changed, 137 insertions(+)<br>
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
+#define PROXY_H<br></blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
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
index 0000000..29100bc<br>
--- /dev/null<br>
+++ b/hw/remote/proxy.c<br>
@@ -0,0 +1,98 @@<br>
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
+static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 pdev-&gt;ioc =3D qio_channel_new_fd(fd, errp);<br>
+}<br></blockquote><div><br></div><div>That one line function (called once)=
 should be inlined. <br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+<br>
+static Property proxy_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;fd&quot;, PCIProxyDev, fd),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br></blockquote><div><br></div><div>Generally we put properties just abov=
e class_init, where it is used.<br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)<br>
+{<br></blockquote><div><br></div><div>(errp shouldn&#39;t be NULL, but ERR=
P_GUARD would be safer)</div><div> <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 PCIProxyDev *dev =3D PCI_PROXY_DEV(device);<br>
+=C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 if (dev-&gt;fd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D monitor_fd_param(monitor_cur(), dev-&gt=
;fd, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_prepend(errp, &quot;proxy:=
 unable to parse fd: &quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_set_socket(dev, fd, errp);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;fd parameter not specif=
ied for %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEVIC=
E(device)-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br></blockquote><div><br></div><div>We=
 prefer early return, to keep the code easy to read.</div><div><br></div><d=
iv>if (!dev-&gt;fd) {</div><div>=C2=A0 return error...<br></div><div>}<br><=
/div><div><br></div>the_normal_thing();</div><div class=3D"gmail_quote">...=
<br></div><div class=3D"gmail_quote"><div> <br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 error_setg(&amp;dev-&gt;migration_blocker, &quot;%s does not=
 support migration&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_PCI_PROXY_DEV)=
;<br>
+=C2=A0 =C2=A0 if (migrate_add_blocker(dev-&gt;migration_blocker, errp)) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(dev-&gt;migration_blocker);<br></bl=
ockquote><div><br></div><div>leave that free to dev_exit() ?<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 error_free(*errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;migration_blocker =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Failed to set migration=
 blocker&quot;);<br></blockquote><div><br></div><div>Why not use the error =
from migrate_add_blocker?</div><div> <br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_mutex_init(&amp;dev-&gt;io_mutex);<br>
+=C2=A0 =C2=A0 qio_channel_set_blocking(dev-&gt;ioc, true, NULL);<br>
+}<br>
+<br>
+static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 PCIProxyDev *dev =3D PCI_PROXY_DEV(pdev);<br>
+<br>
+=C2=A0 =C2=A0 qio_channel_close(dev-&gt;ioc, NULL);<br></blockquote><div><=
br></div><div>on early return in realize, dev-&gt;ioc is NULL. This will cr=
ash.</div><div><br></div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
+=C2=A0 =C2=A0 migrate_del_blocker(dev-&gt;migration_blocker);<br>
</blockquote><div><br></div><div>So is migration_blocker, but this should b=
e safe with NULL<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">+<br>
+=C2=A0 =C2=A0 error_free(dev-&gt;migration_blocker); <br></blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
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
index 24cb36e..ebd1d1d 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3148,6 +3148,8 @@ F: include/hw/remote/remote-obj.h<br>
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

--00000000000023087605b5f30325--

