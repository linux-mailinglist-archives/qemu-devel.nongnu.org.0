Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0E2DC1A2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:53:31 +0100 (CET)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXFC-0001j3-B4
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpX60-0000bn-3E
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:01 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpX5t-0005Q4-Tm
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:58 -0500
Received: by mail-ej1-x636.google.com with SMTP id w1so28102298ejf.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2yiCUPok6qIp5Ny0HopKI1uJ/UnuU8M74AzndPeWhVI=;
 b=e8x77CCYG7swJYY9T9vk3g12h/5xZZH0MgrRx1IprwIPrhegQp16lILX0v1hb9MpQx
 Sn4WEqmHk2FtzaUU+0C/7ngqGWxUR4/whdNzdCpPssHQviTy+oT7R6n0VsslVEwrshiH
 /hPsWsaS+qFO6vWgRQ5WYZgrxI30QtdF0cMDl4kI/rKx1P0/3ssqJm+hnNNcsmtDw8Er
 vWyTuWiET37Vq7jPeDlxTHft0j+48C7XKcpYKHZ5awRqgMLhJIMclOw2gr0g3ulo5J6v
 hBKRhhWz2NDZF3RgOuf4Gn7I2ZTToMkREINrN/SuBBG11GjbN7iL8sYZQMiGJx7HZ+mV
 DOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yiCUPok6qIp5Ny0HopKI1uJ/UnuU8M74AzndPeWhVI=;
 b=bfVUsAmeSM870V4t58oGJFThWfkn1pyaPGSWEsTdVlwNfPUrykmo2ErvnGj0MmaI9z
 zmAxDH/+qcYE0bFwTlOCE4HreN+8+gLOPyBLDE2HlCDBpJFgHn23Uqwcj/O+qJDvFUqY
 RWcLjAe9LFAY6wZdk8SDyy43Ecb97DI6R9Edyb1T/FT1Rd8PiYko/sFnY5SYhGwD+/JM
 Ws4ANcL0NGgHs0/6GdkEIwoAYc1KzzNx1G5rRPDa3Zh2c5wXublHnDCFu5dUJXeRAUXd
 ph5If5ni6LzL3eg/rzWcE8hXmIfsnhWmJRZe5UEgaUCh2mM0lHxeaURnp7E7bAxZLauv
 mGvA==
X-Gm-Message-State: AOAM532P3/aCLqY7Edu12CXoaFlhKMO47jgxDhmgIMKSfEEk/RK+YCA1
 1D+aN6pF+8CQI/NM90FoVAoQ7skAJiagOcIw+/A=
X-Google-Smtp-Source: ABdhPJzb/dXnZL4V5oNonbFDYeOzWxWXgZ3hkzRizqxRMsTqnzhn2lb0JqdyUZE4cTfc0cHJ1FTM2afleqKSzuVs1VM=
X-Received: by 2002:a17:906:e8b:: with SMTP id
 p11mr21159133ejf.92.1608126229827; 
 Wed, 16 Dec 2020 05:43:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607922214.git.jag.raman@oracle.com>
 <e174acc9bba334c8127574aa21d432a7b3a54330.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <e174acc9bba334c8127574aa21d432a7b3a54330.1607922214.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 17:43:37 +0400
Message-ID: <CAJ+F1CJ_oeM1ymjnph2221ghxHxphC1f=2cATU6yp-T19XBuaw@mail.gmail.com>
Subject: Re: [PATCH v13 10/19] multi-process: Associate fd of a PCIDevice with
 its object
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000aefa5a05b6951061"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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

--000000000000aefa5a05b6951061
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> Associate the file descriptor for a PCIDevice in remote process with
> DeviceState object.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/remote/remote-obj.c | 206
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   1 +
>  hw/remote/meson.build  |   1 +
>  3 files changed, 208 insertions(+)
>  create mode 100644 hw/remote/remote-obj.c
>
> diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
> new file mode 100644
> index 0000000..b5573b7
> --- /dev/null
> +++ b/hw/remote/remote-obj.c
> @@ -0,0 +1,206 @@
> +/*
> + * Copyright =C2=A9 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL-v2, version 2 or
> later.
> + *
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "qemu/error-report.h"
> +#include "qemu/notify.h"
> +#include "qom/object_interfaces.h"
> +#include "hw/qdev-core.h"
> +#include "io/channel.h"
> +#include "hw/qdev-core.h"
> +#include "hw/remote/machine.h"
> +#include "io/channel-util.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/pci/pci.h"
> +#include "qemu/sockets.h"
> +
> +#define TYPE_REMOTE_OBJECT "x-remote-object"
> +#define REMOTE_OBJECT(obj) \
> +    OBJECT_CHECK(RemoteObject, (obj), TYPE_REMOTE_OBJECT)
> +#define REMOTE_OBJECT_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(RemoteObjectClass, (obj), TYPE_REMOTE_OBJECT)
> +#define REMOTE_OBJECT_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), TYPE_REMOTE_OBJECT)
> +
> +typedef struct {
> +    ObjectClass parent_class;
> +
> +    unsigned int nr_devs;
> +    unsigned int max_devs;
> +} RemoteObjectClass;
> +
> +typedef struct {
> +    /* private */
> +    Object parent;
> +
> +    Notifier machine_done;
> +
> +    int32_t fd;
> +    char *devid;
> +
> +    QIOChannel *ioc;
> +
> +    DeviceState *dev;
> +    DeviceListener listener;
> +} RemoteObject;
> +
> +static void remote_object_set_fd(Object *obj, Visitor *v, const char
> *name,
> +                                 void *opaque, Error **errp)
> +{
> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> +    int32_t value;
> +
> +    if (!visit_type_int32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!fd_is_socket(value)) {
> +        o->fd =3D -1;
> +        error_setg(errp, "File descriptor %d is not a socket", value);
> +        return;
> +    }
> +
> +    o->fd =3D value;
> +}
> +
> +static void remote_object_set_devid(Object *obj, const char *str, Error
> **errp)
> +{
> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> +
> +    g_free(o->devid);
> +
> +    o->devid =3D g_strdup(str);
> +}
> +
> +static void remote_object_release(DeviceListener *listener, DeviceState
> *dev)
> +{
> +    RemoteObject *o =3D container_of(listener, RemoteObject, listener);
> +
> +    if (o->dev =3D=3D dev) {
> +        object_unref(OBJECT(o));
> +    }
> +}
> +
> +static void remote_object_machine_done(Notifier *notifier, void *data)
> +{
> +    RemoteObject *o =3D container_of(notifier, RemoteObject, machine_don=
e);
> +    DeviceState *dev =3D NULL;
> +    QIOChannel *ioc =3D NULL;
> +    Coroutine *co =3D NULL;
> +    RemoteCommDev *comdev =3D NULL;
> +    Error *err =3D NULL;
> +
> +    dev =3D qdev_find_recursive(sysbus_get_default(), o->devid);
> +    if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_report("%s is not a PCI device", o->devid);
> +        return;
> +    }
> +
> +    ioc =3D qio_channel_new_fd(o->fd, &err);
> +    if (!ioc) {
> +        error_report_err(err);
> +        return;
> +    }
> +    qio_channel_set_blocking(ioc, false, NULL);
> +
> +    o->dev =3D dev;
> +
> +    o->listener.unrealize =3D remote_object_release;
> +    device_listener_register(&o->listener);
> +
> +    /* co-routine should free this. */
> +    comdev =3D g_new0(RemoteCommDev, 1);
> +    *comdev =3D (RemoteCommDev) {
> +        .ioc =3D ioc,
> +        .dev =3D PCI_DEVICE(dev),
> +    };
> +
> +    co =3D qemu_coroutine_create(mpqemu_remote_msg_loop_co, comdev);
> +    qemu_coroutine_enter(co);
> +}
> +
> +static void remote_object_init(Object *obj)
> +{
> +    RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);
> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> +
> +    if (k->nr_devs >=3D k->max_devs) {
> +        error_report("Reached maximum number of devices: %u",
> k->max_devs);
> +        return;
> +    }
> +
> +    o->ioc =3D NULL;
> +    o->fd =3D -1;
> +    o->devid =3D NULL;
> +
> +    k->nr_devs++;
> +
> +    o->machine_done.notify =3D remote_object_machine_done;
> +    qemu_add_machine_init_done_notifier(&o->machine_done);
> +}
> +
> +static void remote_object_finalize(Object *obj)
> +{
> +    RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);
> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> +
> +    device_listener_unregister(&o->listener);
> +
> +    if (o->ioc) {
> +        qio_channel_shutdown(o->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +        qio_channel_close(o->ioc, NULL);
> +    }
> +
> +    object_unref(OBJECT(o->ioc));
> +
> +    k->nr_devs--;
> +    g_free(o->devid);
> +}
> +
> +static void remote_object_class_init(ObjectClass *klass, void *data)
> +{
> +    RemoteObjectClass *k =3D REMOTE_OBJECT_CLASS(klass);
> +
> +    /*
> +     * Limit number of supported devices to 1. This is done to avoid
> devices
> +     * from one VM accessing the RAM of another VM. This is done until w=
e
> +     * start using separate address spaces for individual devices.
> +     */
> +    k->max_devs =3D 1;
> +    k->nr_devs =3D 0;
> +
> +    object_class_property_add(klass, "fd", "int32_t", NULL,
> +                              remote_object_set_fd, NULL, NULL);
>

Let's be consistent with pci-proxy-dev, and make it a string property that
is parsed with monitor_fd_param()

+    object_class_property_add_str(klass, "devid", NULL,
> +                                  remote_object_set_devid);
> +}
> +
> +static const TypeInfo remote_object_info =3D {
> +    .name =3D TYPE_REMOTE_OBJECT,
> +    .parent =3D TYPE_OBJECT,
> +    .instance_size =3D sizeof(RemoteObject),
> +    .instance_init =3D remote_object_init,
> +    .instance_finalize =3D remote_object_finalize,
> +    .class_size =3D sizeof(RemoteObjectClass),
> +    .class_init =3D remote_object_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_USER_CREATABLE },
> +        { }
> +    }
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&remote_object_info);
> +}
> +
> +type_init(register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f2cd91..f049059 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3160,6 +3160,7 @@ F: include/hw/remote/machine.h
>  F: hw/remote/mpqemu-link.c
>  F: include/hw/remote/mpqemu-link.h
>  F: hw/remote/message.c
> +F: hw/remote/remote-obj.c
>
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 9f5c57f..71d0a56 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -3,5 +3,6 @@ remote_ss =3D ss.source_set()
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('mpqemu-link.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'=
))
>
>  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aefa5a05b6951061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 9:15 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Associate the file descriptor for a PCIDevice in remote process with<br>
DeviceState object.<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/remote/remote-obj.c | 206 ++++++++++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 =
+<br>
=C2=A0hw/remote/meson.build=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A03 files changed, 208 insertions(+)<br>
=C2=A0create mode 100644 hw/remote/remote-obj.c<br>
<br>
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c<br>
new file mode 100644<br>
index 0000000..b5573b7<br>
--- /dev/null<br>
+++ b/hw/remote/remote-obj.c<br>
@@ -0,0 +1,206 @@<br>
+/*<br>
+ * Copyright =C2=A9 2020 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or l=
ater.<br>
+ *<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/notify.h&quot;<br>
+#include &quot;qom/object_interfaces.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;hw/remote/machine.h&quot;<br>
+#include &quot;io/channel-util.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;qemu/sockets.h&quot;<br>
+<br>
+#define TYPE_REMOTE_OBJECT &quot;x-remote-object&quot;<br>
+#define REMOTE_OBJECT(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(RemoteObject, (obj), TYPE_REMOTE_OBJECT)<br>
+#define REMOTE_OBJECT_GET_CLASS(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_GET_CLASS(RemoteObjectClass, (obj), TYPE_REMOTE_OBJEC=
T)<br>
+#define REMOTE_OBJECT_CLASS(klass) \<br>
+=C2=A0 =C2=A0 OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), TYPE_REMOTE_O=
BJECT)<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 ObjectClass parent_class;<br>
+<br>
+=C2=A0 =C2=A0 unsigned int nr_devs;<br>
+=C2=A0 =C2=A0 unsigned int max_devs;<br>
+} RemoteObjectClass;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 /* private */<br>
+=C2=A0 =C2=A0 Object parent;<br>
+<br>
+=C2=A0 =C2=A0 Notifier machine_done;<br>
+<br>
+=C2=A0 =C2=A0 int32_t fd;<br>
+=C2=A0 =C2=A0 char *devid;<br>
+<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+<br>
+=C2=A0 =C2=A0 DeviceState *dev;<br>
+=C2=A0 =C2=A0 DeviceListener listener;<br>
+} RemoteObject;<br>
+<br>
+static void remote_object_set_fd(Object *obj, Visitor *v, const char *name=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp)<br=
>
+{<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
+=C2=A0 =C2=A0 int32_t value;<br>
+<br>
+=C2=A0 =C2=A0 if (!visit_type_int32(v, name, &amp;value, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!fd_is_socket(value)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 o-&gt;fd =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;File descriptor %d is n=
ot a socket&quot;, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;fd =3D value;<br>
+}<br>
+<br>
+static void remote_object_set_devid(Object *obj, const char *str, Error **=
errp)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
+<br>
+=C2=A0 =C2=A0 g_free(o-&gt;devid);<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;devid =3D g_strdup(str);<br>
+}<br>
+<br>
+static void remote_object_release(DeviceListener *listener, DeviceState *d=
ev)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D container_of(listener, RemoteObject, lis=
tener);<br>
+<br>
+=C2=A0 =C2=A0 if (o-&gt;dev =3D=3D dev) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(o));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void remote_object_machine_done(Notifier *notifier, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D container_of(notifier, RemoteObject, mac=
hine_done);<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D NULL;<br>
+=C2=A0 =C2=A0 QIOChannel *ioc =3D NULL;<br>
+=C2=A0 =C2=A0 Coroutine *co =3D NULL;<br>
+=C2=A0 =C2=A0 RemoteCommDev *comdev =3D NULL;<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 dev =3D qdev_find_recursive(sysbus_get_default(), o-&gt;devi=
d);<br>
+=C2=A0 =C2=A0 if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVIC=
E)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s is not a PCI device&quot=
;, o-&gt;devid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ioc =3D qio_channel_new_fd(o-&gt;fd, &amp;err);<br>
+=C2=A0 =C2=A0 if (!ioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qio_channel_set_blocking(ioc, false, NULL);<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;dev =3D dev;<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;listener.unrealize =3D remote_object_release;<br>
+=C2=A0 =C2=A0 device_listener_register(&amp;o-&gt;listener);<br>
+<br>
+=C2=A0 =C2=A0 /* co-routine should free this. */<br>
+=C2=A0 =C2=A0 comdev =3D g_new0(RemoteCommDev, 1);<br>
+=C2=A0 =C2=A0 *comdev =3D (RemoteCommDev) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .ioc =3D ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .dev =3D PCI_DEVICE(dev),<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 co =3D qemu_coroutine_create(mpqemu_remote_msg_loop_co, comd=
ev);<br>
+=C2=A0 =C2=A0 qemu_coroutine_enter(co);<br>
+}<br>
+<br>
+static void remote_object_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
+<br>
+=C2=A0 =C2=A0 if (k-&gt;nr_devs &gt;=3D k-&gt;max_devs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Reached maximum number of d=
evices: %u&quot;, k-&gt;max_devs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;ioc =3D NULL;<br>
+=C2=A0 =C2=A0 o-&gt;fd =3D -1;<br>
+=C2=A0 =C2=A0 o-&gt;devid =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 k-&gt;nr_devs++;<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;machine_done.notify =3D remote_object_machine_done;<br=
>
+=C2=A0 =C2=A0 qemu_add_machine_init_done_notifier(&amp;o-&gt;machine_done)=
;<br>
+}<br>
+<br>
+static void remote_object_finalize(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
+<br>
+=C2=A0 =C2=A0 device_listener_unregister(&amp;o-&gt;listener);<br>
+<br>
+=C2=A0 =C2=A0 if (o-&gt;ioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_shutdown(o-&gt;ioc, QIO_CHANNEL_SH=
UTDOWN_BOTH, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_close(o-&gt;ioc, NULL);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(o-&gt;ioc));<br>
+<br>
+=C2=A0 =C2=A0 k-&gt;nr_devs--;<br>
+=C2=A0 =C2=A0 g_free(o-&gt;devid);<br>
+}<br>
+<br>
+static void remote_object_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObjectClass *k =3D REMOTE_OBJECT_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Limit number of supported devices to 1. This is done=
 to avoid devices<br>
+=C2=A0 =C2=A0 =C2=A0* from one VM accessing the RAM of another VM. This is=
 done until we<br>
+=C2=A0 =C2=A0 =C2=A0* start using separate address spaces for individual d=
evices.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 k-&gt;max_devs =3D 1;<br>
+=C2=A0 =C2=A0 k-&gt;nr_devs =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 object_class_property_add(klass, &quot;fd&quot;, &quot;int32=
_t&quot;, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_object_set_fd, NULL, NULL);<br></blo=
ckquote><div><br></div><div>Let&#39;s be consistent with pci-proxy-dev, and=
 make it a string property that is parsed with monitor_fd_param()</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 object_class_property_add_str(klass, &quot;devid&quot;, NULL=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_object_set_devid);<br>
+}<br>
+<br>
+static const TypeInfo remote_object_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_REMOTE_OBJECT,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_OBJECT,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RemoteObject),<br>
+=C2=A0 =C2=A0 .instance_init =3D remote_object_init,<br>
+=C2=A0 =C2=A0 .instance_finalize =3D remote_object_finalize,<br>
+=C2=A0 =C2=A0 .class_size =3D sizeof(RemoteObjectClass),<br>
+=C2=A0 =C2=A0 .class_init =3D remote_object_class_init,<br>
+=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_USER_CREATABLE },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;remote_object_info);<br>
+}<br>
+<br>
+type_init(register_types);<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 4f2cd91..f049059 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3160,6 +3160,7 @@ F: include/hw/remote/machine.h<br>
=C2=A0F: hw/remote/mpqemu-link.c<br>
=C2=A0F: include/hw/remote/mpqemu-link.h<br>
=C2=A0F: hw/remote/message.c<br>
+F: hw/remote/remote-obj.c<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
index 9f5c57f..71d0a56 100644<br>
--- a/hw/remote/meson.build<br>
+++ b/hw/remote/meson.build<br>
@@ -3,5 +3,6 @@ remote_ss =3D ss.source_set()<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;machine.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;mpqemu-link.c&#39;))<br>
=C2=A0remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;message.c&#39;))<br>
+remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#39;rem=
ote-obj.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: remo=
te_ss)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aefa5a05b6951061--

