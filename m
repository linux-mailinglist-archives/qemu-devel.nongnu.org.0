Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446022DC5A2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:48:09 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpauG-0001I2-B6
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kpamf-0002Dh-9h
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:40:17 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kpamc-0002nl-Et
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:40:16 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGHULq4136217;
 Wed, 16 Dec 2020 17:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=TjWGzBekDHLyiWwaonAq1jkEjZORW4tzZPXJCVw0r7M=;
 b=kywYgW+/A/nEoFg1I5n4eAWrxrc2EtoIFXLv+ZAX67NPf+rVLK8uMqUiBXL6Ighzop+z
 kmMNNyjKFfWO431f4byYyTOm2U5tdePC9sxc0Gg4ZZk0G0xKXDOQ5HrzUy5tmsnczjKG
 vEytapyh5BpDKdIwiHk2y1hZ3GLpbI7MN2MqADIJHen1EjJhYME855dVmJ3sYxB4UUK7
 do6xGLDaWyIjDm/ZGxq+7ULYo2NQFwc/N1sVBSxkzTJJSZ3hHmnfQEeGJQrwEQapagvp
 H5cWbvJqU+BED8/8iY0IlIkccc+dY/KdUKL0jRUSbCr/wy/QwrE9os65H9qVnAoOgDW+ 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35ckcbhryh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 17:40:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGHVInv140489;
 Wed, 16 Dec 2020 17:40:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35d7ept3yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 17:40:01 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BGHdxvR022314;
 Wed, 16 Dec 2020 17:39:59 GMT
Received: from [10.39.249.100] (/10.39.249.100)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 09:39:59 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v13 10/19] multi-process: Associate fd of a PCIDevice with
 its object
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <CAJ+F1CJEVH7xhrm7QHy07v8KCAqmUyrsJ2PwAhSOo_ZThczAGg@mail.gmail.com>
Date: Wed, 16 Dec 2020 12:39:56 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <670F5683-448E-4BE4-9DE6-BCABCE76A2D4@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
 <e174acc9bba334c8127574aa21d432a7b3a54330.1607922214.git.jag.raman@oracle.com>
 <CAJ+F1CJ_oeM1ymjnph2221ghxHxphC1f=2cATU6yp-T19XBuaw@mail.gmail.com>
 <6003AE93-0B53-45D7-B0B8-2B372507B3ED@oracle.com>
 <CAJ+F1CJEVH7xhrm7QHy07v8KCAqmUyrsJ2PwAhSOo_ZThczAGg@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9837
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9837
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160113
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



> On Dec 16, 2020, at 12:34 PM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@gmail.com> wrote:
>=20
> Hi
>=20
> On Wed, Dec 16, 2020 at 9:06 PM Jag Raman <jag.raman@oracle.com> =
wrote:
>=20
>=20
> > On Dec 16, 2020, at 8:43 AM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@gmail.com> wrote:
> >=20
> >=20
> >=20
> > On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman =
<jag.raman@oracle.com> wrote:
> > Associate the file descriptor for a PCIDevice in remote process with
> > DeviceState object.
> >=20
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  hw/remote/remote-obj.c | 206 =
+++++++++++++++++++++++++++++++++++++++++++++++++
> >  MAINTAINERS            |   1 +
> >  hw/remote/meson.build  |   1 +
> >  3 files changed, 208 insertions(+)
> >  create mode 100644 hw/remote/remote-obj.c
> >=20
> > diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
> > new file mode 100644
> > index 0000000..b5573b7
> > --- /dev/null
> > +++ b/hw/remote/remote-obj.c
> > @@ -0,0 +1,206 @@
> > +/*
> > + * Copyright =C2=A9 2020 Oracle and/or its affiliates.
> > + *
> > + * This work is licensed under the terms of the GNU GPL-v2, version =
2 or later.
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
> > +    OBJECT_CLASS_CHECK(RemoteObjectClass, (klass), =
TYPE_REMOTE_OBJECT)
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
> > +static void remote_object_set_fd(Object *obj, Visitor *v, const =
char *name,
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
> > +        error_setg(errp, "File descriptor %d is not a socket", =
value);
> > +        return;
> > +    }
> > +
> > +    o->fd =3D value;
> > +}
> > +
> > +static void remote_object_set_devid(Object *obj, const char *str, =
Error **errp)
> > +{
> > +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> > +
> > +    g_free(o->devid);
> > +
> > +    o->devid =3D g_strdup(str);
> > +}
> > +
> > +static void remote_object_release(DeviceListener *listener, =
DeviceState *dev)
> > +{
> > +    RemoteObject *o =3D container_of(listener, RemoteObject, =
listener);
> > +
> > +    if (o->dev =3D=3D dev) {
> > +        object_unref(OBJECT(o));
> > +    }
> > +}
> > +
> > +static void remote_object_machine_done(Notifier *notifier, void =
*data)
> > +{
> > +    RemoteObject *o =3D container_of(notifier, RemoteObject, =
machine_done);
> > +    DeviceState *dev =3D NULL;
> > +    QIOChannel *ioc =3D NULL;
> > +    Coroutine *co =3D NULL;
> > +    RemoteCommDev *comdev =3D NULL;
> > +    Error *err =3D NULL;
> > +
> > +    dev =3D qdev_find_recursive(sysbus_get_default(), o->devid);
> > +    if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) =
{
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
> > +    co =3D qemu_coroutine_create(mpqemu_remote_msg_loop_co, =
comdev);
> > +    qemu_coroutine_enter(co);
> > +}
> > +
> > +static void remote_object_init(Object *obj)
> > +{
> > +    RemoteObjectClass *k =3D REMOTE_OBJECT_GET_CLASS(obj);
> > +    RemoteObject *o =3D REMOTE_OBJECT(obj);
> > +
> > +    if (k->nr_devs >=3D k->max_devs) {
> > +        error_report("Reached maximum number of devices: %u", =
k->max_devs);
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
> > +        qio_channel_shutdown(o->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, =
NULL);
> > +        qio_channel_close(o->ioc, NULL);
> > +    }
> > +
> > +    object_unref(OBJECT(o->ioc));
> > +
> > +    k->nr_devs--;
> > +    g_free(o->devid);
> > +}
> > +
> > +static void remote_object_class_init(ObjectClass *klass, void =
*data)
> > +{
> > +    RemoteObjectClass *k =3D REMOTE_OBJECT_CLASS(klass);
> > +
> > +    /*
> > +     * Limit number of supported devices to 1. This is done to =
avoid devices
> > +     * from one VM accessing the RAM of another VM. This is done =
until we
> > +     * start using separate address spaces for individual devices.
> > +     */
> > +    k->max_devs =3D 1;
> > +    k->nr_devs =3D 0;
> > +
> > +    object_class_property_add(klass, "fd", "int32_t", NULL,
> > +                              remote_object_set_fd, NULL, NULL);
> >=20
> > Let's be consistent with pci-proxy-dev, and make it a string =
property that is parsed with monitor_fd_param()
>=20
> Thank you for the feedback, Marc-Andre!
>=20
> Would it be alright if we added this to util/qemu-sockets.c since this =
logic is used more than once, or is it
> an overkill? I saw that socket_get_fd() in qemu-sockets.c is doing =
something similar, but using
> monitor_get_fd() instead.
>=20
>=20
> That sounds like a good idea. socket_get_fd() could become an exported =
function.
>=20
> You should move the num !=3D 1 check to socket_listen(), that should =
be fine.

Thank you for confirming!

=E2=80=94
Jag

>=20
> thanks
> =20
> --
> Jag
>=20
> >=20
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
> >=20
> >  Build and test automation
> >  -------------------------
> > diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> > index 9f5c57f..71d0a56 100644
> > --- a/hw/remote/meson.build
> > +++ b/hw/remote/meson.build
> > @@ -3,5 +3,6 @@ remote_ss =3D ss.source_set()
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('machine.c'))
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('mpqemu-link.c'))
> >  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('message.c'))
> > +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('remote-obj.c'))
> >=20
> >  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> > --=20
> > 1.8.3.1
> >=20
> >=20
> >=20
> > --=20
> > Marc-Andr=C3=A9 Lureau
>=20
>=20
>=20
> --=20
> Marc-Andr=C3=A9 Lureau


