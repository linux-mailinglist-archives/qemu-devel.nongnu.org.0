Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6922DC58B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:44:57 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kparA-0007H4-BH
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpahH-00048K-R7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:34:43 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpahF-0001nd-30
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:34:43 -0500
Received: by mail-ed1-x530.google.com with SMTP id q16so25695839edv.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GzZdrKdCmDFiWmZRkij/gUrWhLl+BJHRXVnqVsaqnpw=;
 b=BmaYkpb2mxvsWd5kZkifY6jX2GWNCdu/S14vXCYT83hv88Mn9Cl9Hmf0m4PVpDU45f
 Bup/r1HKlrkSk4+OsnCTQxGhq+YjFDzxRXNbreBGScIicjRF7RNsdikGZ7Ge1oZDjkVs
 gr97RusSztWJRiEbUyBFdSel9DG/b1LcVAXYXpqYT+MnNpw8fuo8vneFhct5cUpKn6yp
 l0CXX2YjafkXLNcz3ENN/lY3yR7xgZ2IEaN+HpcbwgeIrZB8oUdxN9T7+Sys8r4cLho/
 y7spsYGEXY7KY2+vyjlf2b5yML4yLTJ2bFszPV/0qcFuPBTW1shlGGCPMRP2CwOOor23
 UNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GzZdrKdCmDFiWmZRkij/gUrWhLl+BJHRXVnqVsaqnpw=;
 b=Qocl4oiRngtovLEh4iFHU2jWucKNTXa0Ueb/5BLZyVKxnAjJqlmK+ahD4CITQyNKmF
 iH4ZX7+vsGEe0TScy2es09rtOPVkqm02sp1+Yau9/XkIatTl2PXSSc6/OIbdyuLkWFPw
 0cXeSvHBGilm/StvrbhcJIwgvavxSAKThmCrXtXTb0kHxiFNxzh679RloX4rXNIoleuF
 am67gobmn2bgnj/m6p5SGH0APYQmGnpMmG5/Q/sBsQs7NHRH+80z+5K208bRqzLJ7BFp
 bmwi+XYfqHwIw3tkuWOEdupG+9M8RF2NUwThloTE92cVdFNeOEnbLTFHFbVnfYnZqmuL
 AKiA==
X-Gm-Message-State: AOAM531eOJhYrv7AwC9x7paRDMaqWK6SrmM7Sa5OHSs1jydEsvXmIDKW
 YwgelV+wM3aBNR/qqj0ejA7NGWB01+nT4oDaPdg=
X-Google-Smtp-Source: ABdhPJzh2UBd1BCsF5gl/25hLm8XT6vel0BLSrUAHGEJzGTd15TFJxRDfSedy8Dt9RbMc59+OjZOyUe/2JazUKlVriY=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr35928967edw.53.1608140079395; 
 Wed, 16 Dec 2020 09:34:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607922214.git.jag.raman@oracle.com>
 <e174acc9bba334c8127574aa21d432a7b3a54330.1607922214.git.jag.raman@oracle.com>
 <CAJ+F1CJ_oeM1ymjnph2221ghxHxphC1f=2cATU6yp-T19XBuaw@mail.gmail.com>
 <6003AE93-0B53-45D7-B0B8-2B372507B3ED@oracle.com>
In-Reply-To: <6003AE93-0B53-45D7-B0B8-2B372507B3ED@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 21:34:25 +0400
Message-ID: <CAJ+F1CJEVH7xhrm7QHy07v8KCAqmUyrsJ2PwAhSOo_ZThczAGg@mail.gmail.com>
Subject: Re: [PATCH v13 10/19] multi-process: Associate fd of a PCIDevice with
 its object
To: Jag Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000002e794505b6984af5"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
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

--0000000000002e794505b6984af5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 16, 2020 at 9:06 PM Jag Raman <jag.raman@oracle.com> wrote:

>
>
> > On Dec 16, 2020, at 8:43 AM, Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
> >
> >
> >
> > On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman <jag.raman@oracle.com=
>
> wrote:
> > Associate the file descriptor for a PCIDevice in remote process with
> > DeviceState object.
> >
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  hw/remote/remote-obj.c | 206
> +++++++++++++++++++++++++++++++++++++++++++++++++
> >  MAINTAINERS            |   1 +
> >  hw/remote/meson.build  |   1 +
> >  3 files changed, 208 insertions(+)
> >  create mode 100644 hw/remote/remote-obj.c
> >
> > diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
> > new file mode 100644
> > index 0000000..b5573b7
> > --- /dev/null
> > +++ b/hw/remote/remote-obj.c
> > @@ -0,0 +1,206 @@
> > +/*
> > + * Copyright =C2=A9 2020 Oracle and/or its affiliates.
> > + *
> > + * This work is licensed under the terms of the GNU GPL-v2, version 2
> or later.
> > + *
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu-common.h"
> > +
> > +#include "qemu/error-report.h"
> > +#include "qemu/notify.h"
> > +#include "qom/object_interfaces.h"
> > +#include "hw/qdev-core.h"
> > +#include "io/channel.h"
> > +#include "hw/qdev-core.h"
> > +#include "hw/remote/machine.h"
> > +#include "io/channel-util.h"
> > +#include "qapi/error.h"
> > +#include "sysemu/sysemu.h"
> > +#include "hw/pci/pci.h"
> > +#include "qemu/sockets.h"
> > +
> > +#define TYPE_REMOTE_OBJECT "x-remote-object"
> > +#define REMOTE_OBJECT(obj) \
> > +    OBJECT_CHECK(RemoteObject, (obj), TYPE_REMOTE_OBJECT)
> > +#define REMOTE_OBJECT_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(RemoteObjectClass, (obj), TYPE_REMOTE_OBJECT)
> > +#define REMOTE_OBJECT_CLASS(klass) \
> > +    OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), TYPE_REMOTE_OBJECT)
> > +
> > +typedef struct {
> > +    ObjectClass parent_class;
> > +
> > +    unsigned int nr_devs;
> > +    unsigned int max_devs;
> > +} RemoteObjectClass;
> > +
> > +typedef struct {
> > +    /* private */
> > +    Object parent;
> > +
> > +    Notifier machine_done;
> > +
> > +    int32_t fd;
> > +    char *devid;
> > +
> > +    QIOChannel *ioc;
> > +
> > +    DeviceState *dev;
> > +    DeviceListener listener;
> > +} RemoteObject;
> > +
> > +static void remote_object_set_fd(Object *obj, Visitor *v, const char
> *name,
> > +                                 void *opaque, Error **errp)
> > +{
> > +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> > +    int32_t value;
> > +
> > +    if (!visit_type_int32(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (!fd_is_socket(value)) {
> > +        o->fd =3D -1;
> > +        error_setg(errp, "File descriptor %d is not a socket", value);
> > +        return;
> > +    }
> > +
> > +    o->fd =3D value;
> > +}
> > +
> > +static void remote_object_set_devid(Object *obj, const char *str, Erro=
r
> **errp)
> > +{
> > +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> > +
> > +    g_free(o->devid);
> > +
> > +    o->devid =3D g_strdup(str);
> > +}
> > +
> > +static void remote_object_release(DeviceListener *listener, DeviceStat=
e
> *dev)
> > +{
> > +    RemoteObject *o =3D container_of(listener, RemoteObject, listener)=
;
> > +
> > +    if (o->dev =3D=3D dev) {
> > +        object_unref(OBJECT(o));
> > +    }
> > +}
> > +
> > +static void remote_object_machine_done(Notifier *notifier, void *data)
> > +{
> > +    RemoteObject *o =3D container_of(notifier, RemoteObject,
> machine_done);
> > +    DeviceState *dev =3D NULL;
> > +    QIOChannel *ioc =3D NULL;
> > +    Coroutine *co =3D NULL;
> > +    RemoteCommDev *comdev =3D NULL;
> > +    Error *err =3D NULL;
> > +
> > +    dev =3D qdev_find_recursive(sysbus_get_default(), o->devid);
> > +    if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > +        error_report("%s is not a PCI device", o->devid);
> > +        return;
> > +    }
> > +
> > +    ioc =3D qio_channel_new_fd(o->fd, &err);
> > +    if (!ioc) {
> > +        error_report_err(err);
> > +        return;
> > +    }
> > +    qio_channel_set_blocking(ioc, false, NULL);
> > +
> > +    o->dev =3D dev;
> > +
> > +    o->listener.unrealize =3D remote_object_release;
> > +    device_listener_register(&o->listener);
> > +
> > +    /* co-routine should free this. */
> > +    comdev =3D g_new0(RemoteCommDev, 1);
> > +    *comdev =3D (RemoteCommDev) {
> > +        .ioc =3D ioc,
> > +        .dev =3D PCI_DEVICE(dev),
> > +    };
> > +
> > +    co =3D qemu_coroutine_create(mpqemu_remote_msg_loop_co, comdev);
> > +    qemu_coroutine_enter(co);
> > +}
> > +
> > +static void remote_object_init(Object *obj)
> > +{
> > +    RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);
> > +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> > +
> > +    if (k->nr_devs >=3D k->max_devs) {
> > +        error_report("Reached maximum number of devices: %u",
> k->max_devs);
> > +        return;
> > +    }
> > +
> > +    o->ioc =3D NULL;
> > +    o->fd =3D -1;
> > +    o->devid =3D NULL;
> > +
> > +    k->nr_devs++;
> > +
> > +    o->machine_done.notify =3D remote_object_machine_done;
> > +    qemu_add_machine_init_done_notifier(&o->machine_done);
> > +}
> > +
> > +static void remote_object_finalize(Object *obj)
> > +{
> > +    RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);
> > +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> > +
> > +    device_listener_unregister(&o->listener);
> > +
> > +    if (o->ioc) {
> > +        qio_channel_shutdown(o->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> > +        qio_channel_close(o->ioc, NULL);
> > +    }
> > +
> > +    object_unref(OBJECT(o->ioc));
> > +
> > +    k->nr_devs--;
> > +    g_free(o->devid);
> > +}
> > +
> > +static void remote_object_class_init(ObjectClass *klass, void *data)
> > +{
> > +    RemoteObjectClass *k =3D REMOTE_OBJECT_CLASS(klass);
> > +
> > +    /*
> > +     * Limit number of supported devices to 1. This is done to avoid
> devices
> > +     * from one VM accessing the RAM of another VM. This is done until
> we
> > +     * start using separate address spaces for individual devices.
> > +     */
> > +    k->max_devs =3D 1;
> > +    k->nr_devs =3D 0;
> > +
> > +    object_class_property_add(klass, "fd", "int32_t", NULL,
> > +                              remote_object_set_fd, NULL, NULL);
> >
> > Let's be consistent with pci-proxy-dev, and make it a string property
> that is parsed with monitor_fd_param()
>
> Thank you for the feedback, Marc-Andre!
>
> Would it be alright if we added this to util/qemu-sockets.c since this
> logic is used more than once, or is it
> an overkill? I saw that socket_get_fd() in qemu-sockets.c is doing
> something similar, but using
> monitor_get_fd() instead.
>
>
That sounds like a good idea. socket_get_fd() could become an exported
function.

You should move the num !=3D 1 check to socket_listen(), that should be fin=
e.

thanks


> --
> Jag
>
> >
> > +    object_class_property_add_str(klass, "devid", NULL,
> > +                                  remote_object_set_devid);
> > +}
> > +
> > +static const TypeInfo remote_object_info =3D {
> > +    .name =3D TYPE_REMOTE_OBJECT,
> > +    .parent =3D TYPE_OBJECT,
> > +    .instance_size =3D sizeof(RemoteObject),
> > +    .instance_init =3D remote_object_init,
> > +    .instance_finalize =3D remote_object_finalize,
> > +    .class_size =3D sizeof(RemoteObjectClass),
> > +    .class_init =3D remote_object_class_init,
> > +    .interfaces =3D (InterfaceInfo[]) {
> > +        { TYPE_USER_CREATABLE },
> > +        { }
> > +    }
> > +};
> > +
> > +static void register_types(void)
> > +{
> > +    type_register_static(&remote_object_info);
> > +}
> > +
> > +type_init(register_types);
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4f2cd91..f049059 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3160,6 +3160,7 @@ F: include/hw/remote/machine.h
> >  F: hw/remote/mpqemu-link.c
> >  F: include/hw/remote/mpqemu-link.h
> >  F: hw/remote/message.c
> > +F: hw/remote/remote-obj.c
> >
> >  Build and test automation
> >  -------------------------
> > diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> > index 9f5c57f..71d0a56 100644
> > --- a/hw/remote/meson.build
> > +++ b/hw/remote/meson.build
> > @@ -3,5 +3,6 @@ remote_ss =3D ss.source_set()
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c')=
)
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('mpqemu-link.c'))
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c')=
)
> > +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true:
> files('remote-obj.c'))
> >
> >  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> > --
> > 1.8.3.1
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002e794505b6984af5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 9:06 PM Jag=
 Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Dec 16, 2020, at 8:43 AM, Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mai=
lto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@gmail.co=
m</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman &lt;<a href=3D"mailt=
o:jag.raman@oracle.com" target=3D"_blank">jag.raman@oracle.com</a>&gt; wrot=
e:<br>
&gt; Associate the file descriptor for a PCIDevice in remote process with<b=
r>
&gt; DeviceState object.<br>
&gt; <br>
&gt; Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@o=
racle.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
&gt; Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@ora=
cle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
&gt; Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracl=
e.com" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/remote/remote-obj.c | 206 +++++++++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 hw/remote/meson.build=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 3 files changed, 208 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/remote/remote-obj.c<br>
&gt; <br>
&gt; diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b5573b7<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/remote/remote-obj.c<br>
&gt; @@ -0,0 +1,206 @@<br>
&gt; +/*<br>
&gt; + * Copyright =C2=A9 2020 Oracle and/or its affiliates.<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL-v2, version 2=
 or later.<br>
&gt; + *<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu-common.h&quot;<br>
&gt; +<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qemu/notify.h&quot;<br>
&gt; +#include &quot;qom/object_interfaces.h&quot;<br>
&gt; +#include &quot;hw/qdev-core.h&quot;<br>
&gt; +#include &quot;io/channel.h&quot;<br>
&gt; +#include &quot;hw/qdev-core.h&quot;<br>
&gt; +#include &quot;hw/remote/machine.h&quot;<br>
&gt; +#include &quot;io/channel-util.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;sysemu/sysemu.h&quot;<br>
&gt; +#include &quot;hw/pci/pci.h&quot;<br>
&gt; +#include &quot;qemu/sockets.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_REMOTE_OBJECT &quot;x-remote-object&quot;<br>
&gt; +#define REMOTE_OBJECT(obj) \<br>
&gt; +=C2=A0 =C2=A0 OBJECT_CHECK(RemoteObject, (obj), TYPE_REMOTE_OBJECT)<b=
r>
&gt; +#define REMOTE_OBJECT_GET_CLASS(obj) \<br>
&gt; +=C2=A0 =C2=A0 OBJECT_GET_CLASS(RemoteObjectClass, (obj), TYPE_REMOTE_=
OBJECT)<br>
&gt; +#define REMOTE_OBJECT_CLASS(klass) \<br>
&gt; +=C2=A0 =C2=A0 OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), TYPE_REM=
OTE_OBJECT)<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +=C2=A0 =C2=A0 ObjectClass parent_class;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 unsigned int nr_devs;<br>
&gt; +=C2=A0 =C2=A0 unsigned int max_devs;<br>
&gt; +} RemoteObjectClass;<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +=C2=A0 =C2=A0 /* private */<br>
&gt; +=C2=A0 =C2=A0 Object parent;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Notifier machine_done;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 int32_t fd;<br>
&gt; +=C2=A0 =C2=A0 char *devid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QIOChannel *ioc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; +=C2=A0 =C2=A0 DeviceListener listener;<br>
&gt; +} RemoteObject;<br>
&gt; +<br>
&gt; +static void remote_object_set_fd(Object *obj, Visitor *v, const char =
*name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
&gt; +=C2=A0 =C2=A0 int32_t value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!visit_type_int32(v, name, &amp;value, errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!fd_is_socket(value)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 o-&gt;fd =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;File descriptor %d=
 is not a socket&quot;, value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 o-&gt;fd =3D value;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void remote_object_set_devid(Object *obj, const char *str, Err=
or **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_free(o-&gt;devid);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 o-&gt;devid =3D g_strdup(str);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void remote_object_release(DeviceListener *listener, DeviceSta=
te *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObject *o =3D container_of(listener, RemoteObject=
, listener);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (o-&gt;dev =3D=3D dev) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(o));<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void remote_object_machine_done(Notifier *notifier, void *data=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObject *o =3D container_of(notifier, RemoteObject=
, machine_done);<br>
&gt; +=C2=A0 =C2=A0 DeviceState *dev =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 QIOChannel *ioc =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 Coroutine *co =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 RemoteCommDev *comdev =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dev =3D qdev_find_recursive(sysbus_get_default(), o-&gt=
;devid);<br>
&gt; +=C2=A0 =C2=A0 if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_=
DEVICE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s is not a PCI device=
&quot;, o-&gt;devid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ioc =3D qio_channel_new_fd(o-&gt;fd, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (!ioc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 qio_channel_set_blocking(ioc, false, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 o-&gt;dev =3D dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 o-&gt;listener.unrealize =3D remote_object_release;<br>
&gt; +=C2=A0 =C2=A0 device_listener_register(&amp;o-&gt;listener);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* co-routine should free this. */<br>
&gt; +=C2=A0 =C2=A0 comdev =3D g_new0(RemoteCommDev, 1);<br>
&gt; +=C2=A0 =C2=A0 *comdev =3D (RemoteCommDev) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .ioc =3D ioc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .dev =3D PCI_DEVICE(dev),<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 co =3D qemu_coroutine_create(mpqemu_remote_msg_loop_co,=
 comdev);<br>
&gt; +=C2=A0 =C2=A0 qemu_coroutine_enter(co);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void remote_object_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);<=
br>
&gt; +=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (k-&gt;nr_devs &gt;=3D k-&gt;max_devs) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Reached maximum number=
 of devices: %u&quot;, k-&gt;max_devs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 o-&gt;ioc =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 o-&gt;fd =3D -1;<br>
&gt; +=C2=A0 =C2=A0 o-&gt;devid =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 k-&gt;nr_devs++;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 o-&gt;machine_done.notify =3D remote_object_machine_don=
e;<br>
&gt; +=C2=A0 =C2=A0 qemu_add_machine_init_done_notifier(&amp;o-&gt;machine_=
done);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void remote_object_finalize(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);<=
br>
&gt; +=C2=A0 =C2=A0 RemoteObject *o =3D REMOTE_OBJECT(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 device_listener_unregister(&amp;o-&gt;listener);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (o-&gt;ioc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_shutdown(o-&gt;ioc, QIO_CHANN=
EL_SHUTDOWN_BOTH, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_close(o-&gt;ioc, NULL);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_unref(OBJECT(o-&gt;ioc));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 k-&gt;nr_devs--;<br>
&gt; +=C2=A0 =C2=A0 g_free(o-&gt;devid);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void remote_object_class_init(ObjectClass *klass, void *data)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RemoteObjectClass *k =3D REMOTE_OBJECT_CLASS(klass);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Limit number of supported devices to 1. This is=
 done to avoid devices<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* from one VM accessing the RAM of another VM. Th=
is is done until we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* start using separate address spaces for individ=
ual devices.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 k-&gt;max_devs =3D 1;<br>
&gt; +=C2=A0 =C2=A0 k-&gt;nr_devs =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_class_property_add(klass, &quot;fd&quot;, &quot;=
int32_t&quot;, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_object_set_fd, NULL, NULL);<br>
&gt; <br>
&gt; Let&#39;s be consistent with pci-proxy-dev, and make it a string prope=
rty that is parsed with monitor_fd_param()<br>
<br>
Thank you for the feedback, Marc-Andre!<br>
<br>
Would it be alright if we added this to util/qemu-sockets.c since this logi=
c is used more than once, or is it<br>
an overkill? I saw that socket_get_fd() in qemu-sockets.c is doing somethin=
g similar, but using<br>
monitor_get_fd() instead.<br>
<br></blockquote><div><br></div><div>That sounds like a good idea. socket_g=
et_fd() could become an exported function.<br></div><div><br></div><div>You=
 should move the num !=3D 1 check to socket_listen(), that should be fine.<=
br></div><div><br></div><div>thanks<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
--<br>
Jag<br>
<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 object_class_property_add_str(klass, &quot;devid&quot;,=
 NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_object_set_devid);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo remote_object_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_REMOTE_OBJECT,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_OBJECT,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(RemoteObject),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D remote_object_init,<br>
&gt; +=C2=A0 =C2=A0 .instance_finalize =3D remote_object_finalize,<br>
&gt; +=C2=A0 =C2=A0 .class_size =3D sizeof(RemoteObjectClass),<br>
&gt; +=C2=A0 =C2=A0 .class_init =3D remote_object_class_init,<br>
&gt; +=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_USER_CREATABLE },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void register_types(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;remote_object_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(register_types);<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 4f2cd91..f049059 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -3160,6 +3160,7 @@ F: include/hw/remote/machine.h<br>
&gt;=C2=A0 F: hw/remote/mpqemu-link.c<br>
&gt;=C2=A0 F: include/hw/remote/mpqemu-link.h<br>
&gt;=C2=A0 F: hw/remote/message.c<br>
&gt; +F: hw/remote/remote-obj.c<br>
&gt; <br>
&gt;=C2=A0 Build and test automation<br>
&gt;=C2=A0 -------------------------<br>
&gt; diff --git a/hw/remote/meson.build b/hw/remote/meson.build<br>
&gt; index 9f5c57f..71d0a56 100644<br>
&gt; --- a/hw/remote/meson.build<br>
&gt; +++ b/hw/remote/meson.build<br>
&gt; @@ -3,5 +3,6 @@ remote_ss =3D ss.source_set()<br>
&gt;=C2=A0 remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: file=
s(&#39;machine.c&#39;))<br>
&gt;=C2=A0 remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: file=
s(&#39;mpqemu-link.c&#39;))<br>
&gt;=C2=A0 remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: file=
s(&#39;message.c&#39;))<br>
&gt; +remote_ss.add(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true: files(&#3=
9;remote-obj.c&#39;))<br>
&gt; <br>
&gt;=C2=A0 softmmu_ss.add_all(when: &#39;CONFIG_MULTIPROCESS&#39;, if_true:=
 remote_ss)<br>
&gt; -- <br>
&gt; 1.8.3.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002e794505b6984af5--

