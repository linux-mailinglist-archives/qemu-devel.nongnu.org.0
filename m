Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277832D1311
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:05:48 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmH99-0001S3-7A
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmH7F-0000eR-Ex
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:03:49 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmH7B-0001Dx-NK
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:03:49 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p22so1770636edu.11
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 06:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Nwoyf73H8EDfYCO8RiUDI+1Ew1SgPTXs35keRd28ZY=;
 b=Z6ynz+JpbBs2UzJgTRtAyPHDwTLjq/ATXd21iexUmvghF/SYg+97a3CR1PSFsxFtya
 RPqtKSBUXXuS3nvMKf8uuHve7KQxJeoCvjkPoyYqZ1xuwT7ZSixsjuO8vg0fvET0Euzd
 tmjYv0yCFr2VidO3H0mUrG5tnp0LdcAGuHKZkdpwcQ+RCQ5dBe9PssrTTUNHwitLZViT
 5hb9rUp6RdzB344FzERxkAqhcxJzTaDQFUppaUd+igo2AC24pNSC0I6KF/xnVJpfCdcl
 NNkF5RgJz39mAbz0SZwQXDdGu5K8riVb2vEodT8/y2rmTewUbkdif1fZNMkPTV7UmgPO
 RY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Nwoyf73H8EDfYCO8RiUDI+1Ew1SgPTXs35keRd28ZY=;
 b=Xjnol9zG4nQOGfOVW6FC5RbWwafeuFJGlt2dH24D2UnSertrFCNJKBc5KAwrU/N0de
 ekxJUwVQrHPVGZfQHCz4DFG+3iiceSuiu4XgXWbuekkM/8vm0YuLVAGGzueTutMgfPjE
 sLNuza2IMsx2zQkxeuSG0+wOs6VzE8OdOgcDD81T2kpUdzuc+AnEwDkz8+ZBlMJAxm5L
 v7So/ENWDFf2Kh5v9JSzUmc3SUoczVlMq1neMGTZldOTsKbXH+/sIkRH1/EqvjeDnBgp
 De8wKOu1shUaGnSYVChyt01SERVqKoqMe7nQnDFV/lJYztuE6IROaOgAyck1pbXXsW+Q
 PHwA==
X-Gm-Message-State: AOAM532xUN69ep2nXQGXAayFS+hTka9hnaVS4kNVNZoKsl8j9eRX91Cr
 JTCM14q67hvsQ7dSAYJHIk77aGNsixphGjyX7BI=
X-Google-Smtp-Source: ABdhPJwb28H94JoBZSvk/CJWVcaSmeitSPXupSuy+BcmzEGifrTZkTrx6KzpwWLnNsuA1y/YeUlOJi0dX+j7Hbkd/wc=
X-Received: by 2002:aa7:c558:: with SMTP id s24mr20271301edr.257.1607349824251; 
 Mon, 07 Dec 2020 06:03:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <c3a68434b32d8f5379a9fa197e89748f54423632.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <c3a68434b32d8f5379a9fa197e89748f54423632.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Dec 2020 18:03:17 +0400
Message-ID: <CAJ+F1CJtT2miTiGN6f9fWCGmpT8D=KtnJu8UpPg=2O9PptCF4A@mail.gmail.com>
Subject: Re: [PATCH v12 10/19] multi-process: Associate fd of a PCIDevice with
 its object
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000004debc405b5e04bb2"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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

--0000000000004debc405b5e04bb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> Associate the file descriptor for a PCIDevice in remote process with
> DeviceState object.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/remote-obj.h |  42 +++++++++++
>  hw/remote/message.c            |   1 +
>  hw/remote/remote-obj.c         | 154
> +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |   2 +
>  hw/remote/meson.build          |   1 +
>  5 files changed, 200 insertions(+)
>  create mode 100644 include/hw/remote/remote-obj.h
>  create mode 100644 hw/remote/remote-obj.c
>
> diff --git a/include/hw/remote/remote-obj.h
> b/include/hw/remote/remote-obj.h
> new file mode 100644
> index 0000000..0e95813
> --- /dev/null
> +++ b/include/hw/remote/remote-obj.h
> @@ -0,0 +1,42 @@
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
> +#ifndef REMOTE_OBJECT_H
> +#define REMOTE_OBJECT_H
> +
> +#include "io/channel.h"
> +#include "qemu/notify.h"
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
> +    int fd;
> +    char *devid;
> +    QIOChannel *ioc;
> +} RemoteObject;
> +
> +#endif
>

There is no need for a header if the header isn't actually shared with
various .c units. In this series, you can just declare those structs in
remote-obj.c

diff --git a/hw/remote/message.c b/hw/remote/message.c
> index 5d87bf4..1f2edc7 100644
> --- a/hw/remote/message.c
> +++ b/hw/remote/message.c
> @@ -56,6 +56,7 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
>          }
>      }
>      qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    g_free(com);
>


Should be squashed with the previous patch


>      return;
>  }
> diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
> new file mode 100644
> index 0000000..3b4c0d4
> --- /dev/null
> +++ b/hw/remote/remote-obj.c
> @@ -0,0 +1,154 @@
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
> +#include "hw/remote/remote-obj.h"
> +#include "qemu/error-report.h"
> +#include "qom/object_interfaces.h"
> +#include "hw/qdev-core.h"
> +#include "io/channel.h"
> +#include "hw/qdev-core.h"
> +#include "hw/remote/machine.h"
> +#include "io/channel-util.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/pci/pci.h"
> +
> +static void remote_object_set_fd(Object *obj, const char *str, Error
> **errp)
> +{
> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> +
> +    o->fd =3D atoi(str);
>

 qemu_strtoi() has better error handling semantics. You may also want to
check it's a valid socket fd with fd_is_socket().

Alternatively, you could use qemu_open() which allows to open from QMP
fdset ("/dev/fdset/..."). This should be more flexible.

+}
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
> +static void property_release_remote_object(Object *obj, const char *name=
,
> +                                           void *opaque)
> +{
> +    Object *remote_object =3D OBJECT(opaque);
> +
> +    object_unref(remote_object);
> +}
>

Hmm, an object property, discussed below.

+
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
> +    object_property_add(OBJECT(dev), "remote-object", "object", NULL,
> NULL,
> +                        property_release_remote_object, (void
> *)OBJECT(o));
>

In general, we are trying to avoid runtime/dynamic properties and slowly
replacing them with class properties.

Furthermore, this is not the way QOM handles object properties. You should
use object_class_property_add_link().

+    /* co-routine should free this. */
> +    comdev =3D g_new0(RemoteCommDev, 1);
> +    *comdev =3D (RemoteCommDev) {
> +        .ioc =3D ioc,
> +        .dev =3D PCI_DEVICE(dev),
> +    };
>
+
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
> +    object_property_add_str(obj, "fd", NULL, remote_object_set_fd);
> +    object_property_set_description(obj, "fd",
> +                                    "file descriptor for the object");
> +    object_property_add_str(obj, "devid", NULL, remote_object_set_devid)=
;
> +    object_property_set_description(obj, "devid",
> +                                    "id of device to associate");
>

Please use class properties

+
> +    o->machine_done.notify =3D remote_object_machine_done;
> +    qemu_add_machine_init_done_notifier(&o->machine_done);
> +}
> +
> +static void remote_object_finalize(Object *obj)
> +{
> +    RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);
> +    RemoteObject *o =3D REMOTE_OBJECT(obj);
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
> +    k->max_devs =3D 1;
>

Could you explain that limitation, in a code comment and/or commit message?

+    k->nr_devs =3D 0;
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
> index b64e4b8..aedfc27 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3144,6 +3144,8 @@ F: include/hw/remote/machine.h
>  F: hw/remote/mpqemu-link.c
>  F: include/hw/remote/mpqemu-link.h
>  F: hw/remote/message.c
> +F: include/hw/remote/remote-obj.h
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

--0000000000004debc405b5e04bb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:25 AM Jag=
annathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com" target=3D"_blank=
">jag.raman@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Associate the file descriptor for a PCIDevice in remo=
te process with<br>
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
=C2=A0include/hw/remote/remote-obj.h |=C2=A0 42 +++++++++++<br>
=C2=A0hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/remote/remote-obj.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 154 +++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0hw/remote/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A05 files changed, 200 insertions(+)<br>
=C2=A0create mode 100644 include/hw/remote/remote-obj.h<br>
=C2=A0create mode 100644 hw/remote/remote-obj.c<br>
<br>
diff --git a/include/hw/remote/remote-obj.h b/include/hw/remote/remote-obj.=
h<br>
new file mode 100644<br>
index 0000000..0e95813<br>
--- /dev/null<br>
+++ b/include/hw/remote/remote-obj.h<br>
@@ -0,0 +1,42 @@<br>
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
+#ifndef REMOTE_OBJECT_H<br>
+#define REMOTE_OBJECT_H<br>
+<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;qemu/notify.h&quot;<br>
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
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 char *devid;<br>
+=C2=A0 =C2=A0 QIOChannel *ioc;<br>
+} RemoteObject;<br>
+<br>
+#endif<br></blockquote><div><br></div><div>There is no need for a header i=
f the header isn&#39;t actually shared with various .c units. In this serie=
s, you can just declare those structs in remote-obj.c<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
index 5d87bf4..1f2edc7 100644<br>
--- a/hw/remote/message.c<br>
+++ b/hw/remote/message.c<br>
@@ -56,6 +56,7 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTD=
OWN);<br>
+=C2=A0 =C2=A0 g_free(com);<br></blockquote><div><br></div><div><br></div><=
div>Should be squashed with the previous patch</div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0}<br>
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c<br>
new file mode 100644<br>
index 0000000..3b4c0d4<br>
--- /dev/null<br>
+++ b/hw/remote/remote-obj.c<br>
@@ -0,0 +1,154 @@<br>
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
+#include &quot;hw/remote/remote-obj.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qom/object_interfaces.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;hw/remote/machine.h&quot;<br>
+#include &quot;io/channel-util.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+<br>
+static void remote_object_set_fd(Object *obj, const char *str, Error **err=
p)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
+<br>
+=C2=A0 =C2=A0 o-&gt;fd =3D atoi(str);<br></blockquote><div><br></div><div>=
=C2=A0qemu_strtoi() has better error handling semantics. You may also want =
to check it&#39;s a valid socket fd with fd_is_socket().</div><div><br></di=
v><div>Alternatively, you could use qemu_open() which allows to open from Q=
MP fdset (&quot;/dev/fdset/...&quot;). This should be more flexible.<br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
+static void property_release_remote_object(Object *obj, const char *name,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 Object *remote_object =3D OBJECT(opaque);<br>
+<br>
+=C2=A0 =C2=A0 object_unref(remote_object);<br>
+}<br></blockquote><div><br></div><div>Hmm, an object property, discussed b=
elow.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
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
+=C2=A0 =C2=A0 object_property_add(OBJECT(dev), &quot;remote-object&quot;, =
&quot;object&quot;, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 property_release_remote_object, (void *)OBJECT(o));<br></blockqu=
ote><div><br></div><div>In general, we are trying to avoid runtime/dynamic =
properties and slowly replacing them with class properties.</div><div><br><=
/div><div>Furthermore, this is not the way QOM handles object properties. Y=
ou should use object_class_property_add_link().</div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 /* co-routine should free this. */<br>
+=C2=A0 =C2=A0 comdev =3D g_new0(RemoteCommDev, 1);<br>
+=C2=A0 =C2=A0 *comdev =3D (RemoteCommDev) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .ioc =3D ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .dev =3D PCI_DEVICE(dev),<br>
+=C2=A0 =C2=A0 }; <br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
+=C2=A0 =C2=A0 object_property_add_str(obj, &quot;fd&quot;, NULL, remote_ob=
ject_set_fd);<br>
+=C2=A0 =C2=A0 object_property_set_description(obj, &quot;fd&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;file descriptor =
for the object&quot;);<br>
+=C2=A0 =C2=A0 object_property_add_str(obj, &quot;devid&quot;, NULL, remote=
_object_set_devid);<br>
+=C2=A0 =C2=A0 object_property_set_description(obj, &quot;devid&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;id of device to =
associate&quot;);<br></blockquote><div><br></div><div>Please use class prop=
erties</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
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
+=C2=A0 =C2=A0 k-&gt;max_devs =3D 1;<br></blockquote><div><br></div><div>Co=
uld you explain that limitation, in a code comment and/or commit message?</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 k-&gt;nr_devs =3D 0;<br>
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
index b64e4b8..aedfc27 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3144,6 +3144,8 @@ F: include/hw/remote/machine.h<br>
=C2=A0F: hw/remote/mpqemu-link.c<br>
=C2=A0F: include/hw/remote/mpqemu-link.h<br>
=C2=A0F: hw/remote/message.c<br>
+F: include/hw/remote/remote-obj.h<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000004debc405b5e04bb2--

