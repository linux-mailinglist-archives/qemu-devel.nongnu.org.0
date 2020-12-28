Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D946C2E3BE1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 14:57:21 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktt1U-0000rk-Ea
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 08:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktt0g-0000R2-Lm; Mon, 28 Dec 2020 08:56:30 -0500
Received: from mout.web.de ([217.72.192.78]:50609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktt0d-0001zN-So; Mon, 28 Dec 2020 08:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609163779;
 bh=FAZT87GXa4Zu2cLxWDL3VAa+L5FOlRAGQ8SrY7aSKHI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=sHY8dyosMSwiomXpX76RfDHuyXxa/3jLMapnZoRWwt47U4iqs1BiI1vdgGL16uqSN
 3rqrshTdP3O71drd0LRkDTptTj8dFU3abbjaTomS+yrkllPkHknY5uSUBcqjlSpIkz
 FHDTLbPRD8jnzk5BahNt+bBgxDpbRclwq0wraqLI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHmm4-1kr7Kf0iMo-00F7al; Mon, 28
 Dec 2020 14:56:19 +0100
Date: Mon, 28 Dec 2020 14:56:09 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v12 1/7] Introduce yank feature
Message-ID: <20201228145609.2718ab77@gecko.fritz.box>
In-Reply-To: <CAJ+F1CKpTx-x055ir5QX5-21ZNvkFa1DHd6+3z+GschYBiSzkw@mail.gmail.com>
References: <cover.1607858747.git.lukasstraub2@web.de>
 <f7bb9f8b63ead0fcb66f856bbbf7b8b24211e704.1607858747.git.lukasstraub2@web.de>
 <CAJ+F1CKpTx-x055ir5QX5-21ZNvkFa1DHd6+3z+GschYBiSzkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q.+OtlH4ZYxWR3ixXMjax/V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Gnq55pax3ZdRo8j8fkfFkAtDDTiBp97/1GWNDCRmsACrOIq2H+Q
 WgoSowv7ueo8nCyNKv9HKYcqD35mS3DGPNOYM6qibMZnVFx7MgNkd4qji6aVopva9PGpXkJ
 0dDkY7CfOwXqZgTtb+o/WPRdsrlT+RluaFamFrddtYUErdVuVGswBshNEyenJ0VGsMZRsGc
 pcy6I7xxSSnAnKwVPUGHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IDFPvW5Hmm8=:Jmkxn7ZxhJYGzPU/xxZq1X
 fN3miKD5a84pUEAVjyixNOHuH7Cnfvpd9RGweSTHumWezMBX9b8nhu/i+feZlY6VkyxGs7xmv
 uRU279w3NadjpSoSWp2j5P0HKzu56ytIZyqxP0fMRwUR+moOHZgnjztWsR5ro5OnidrhnX6Lr
 NRA5OOknDmTx0k1Ck7hd1+Bd1mP7uQ4S+RpdMRVV5Ge9whGpPASd7PypqekF1yslqbveBLTSe
 30XUUeRoXOV/oarusatv12k5aaBIaF6FypPxHybEEWBx8WmLZiSmXNaPRHPCTtM2tfpw+C8MU
 nz4cTx9GiQs9ExGcSh6V+kpu3YNMSqxOIARbl8L4gwozanHBcDibYLfl6F5MF8g0NIFM0snYD
 U17BgaZcZcpVjeg1VEaYSLcgVa7Q4F0zDpF82R6y2UxYY9bwOEZXk/lEimB4j0CoNrL5CQAmu
 JRYMfcN9nrZJOl0FeaYpSXbqN2nwPvDJLBDL8+JxAjapOVpQ7LW+xdDY2HSj03jdYJPrs9/aD
 JLUtSla1oF+u6gyR2Iyp1ikDtoiOoMhapAStVtX4ltr38Zj6HNj1/oG+KNYPiexVgnWcoYVqA
 oWuDciqIq2u8rVYiBqLk7+bloY3PpS5ITGVjR07TH0q5q/Oxq8f1ttK3CtxQbMtrYfWNe5GOb
 AZrxUi0NkVrW8jvqF4182OgNOyP97M51G9rtvIbLluF97iFcxkSDUPACrYFdSgNReLZNRjNKA
 xy/ctsRzynHL79O4bxx0DSjeH+HJeb6TVAFnxScvnVmvVuQHj6cktSEHFoty92HtZW/QrE4zZ
 3XniTMW7euYdJwo7i8f5K8y0v3I1XNiPpFFtj6WeOM2+EV4nL6XbSoSJ6cNCFohyggJSfncup
 vVOhLVnf7C4uAH51U/0gQQnxPDaPQGuJS/Vts1rvA=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/q.+OtlH4ZYxWR3ixXMjax/V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Dec 2020 12:00:29 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> On Sun, Dec 13, 2020 at 3:48 PM Lukas Straub <lukasstraub2@web.de> wrote:
>=20
> > The yank feature allows to recover from hanging qemu by "yanking"
> > at various parts. Other qemu systems can register themselves and
> > multiple yank functions. Then all yank functions for selected
> > instances can be called by the 'yank' out-of-band qmp command.
> > Available instances can be queried by a 'query-yank' oob command.
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  MAINTAINERS           |   7 ++
> >  include/qemu/yank.h   |  95 +++++++++++++++++++
> >  qapi/meson.build      |   1 +
> >  qapi/qapi-schema.json |   1 +
> >  qapi/yank.json        | 119 +++++++++++++++++++++++
> >  util/meson.build      |   1 +
> >  util/yank.c           | 216 ++++++++++++++++++++++++++++++++++++++++++
> >  7 files changed, 440 insertions(+)
> >  create mode 100644 include/qemu/yank.h
> >  create mode 100644 qapi/yank.json
> >  create mode 100644 util/yank.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d48a4e8a8b..5d7e3c0e4b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2705,6 +2705,13 @@ F: util/uuid.c
> >  F: include/qemu/uuid.h
> >  F: tests/test-uuid.c
> >
> > +Yank feature
> > +M: Lukas Straub <lukasstraub2@web.de>
> > +S: Odd fixes
> > +F: util/yank.c
> > +F: include/qemu/yank.h
> > +F: qapi/yank.json
> > +
> >  COLO Framework
> >  M: zhanghailiang <zhang.zhanghailiang@huawei.com>
> >  S: Maintained
> > diff --git a/include/qemu/yank.h b/include/qemu/yank.h
> > new file mode 100644
> > index 0000000000..96f5b2626f
> > --- /dev/null
> > +++ b/include/qemu/yank.h
> > @@ -0,0 +1,95 @@
> > +/*
> > + * QEMU yank feature
> > + *
> > + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef YANK_H
> > +#define YANK_H
> > +
> > +#include "qapi/qapi-types-yank.h"
> > +
> > +typedef void (YankFn)(void *opaque);
> > +
> > +/**
> > + * yank_register_instance: Register a new instance.
> > + *
> > + * This registers a new instance for yanking. Must be called before any
> > yank
> > + * function is registered for this instance.
> > + *
> > + * This function is thread-safe.
> > + *
> > + * @instance: The instance.
> > + * @errp: Error object.
> > + */
> > +void yank_register_instance(const YankInstance *instance, Error **errp=
);
> > +
> > =20
>=20
> It's a good idea to return a success boolean. (see include/qapi/error.h)

Changed for the next version.

> +/**
> > + * yank_unregister_instance: Unregister a instance.
> > + *
> > + * This unregisters a instance. Must be called only after every yank
> > function
> > + * of the instance has been unregistered.
> > + *
> > + * This function is thread-safe.
> > + *
> > + * @instance: The instance.
> > + */
> > +void yank_unregister_instance(const YankInstance *instance);
> > +
> > +/**
> > + * yank_register_function: Register a yank function
> > + *
> > + * This registers a yank function. All limitations of qmp oob commands
> > apply
> > + * to the yank function as well. See docs/devel/qapi-code-gen.txt under
> > + * "An OOB-capable command handler must satisfy the following conditio=
ns".
> > + *
> > + * This function is thread-safe.
> > + *
> > + * @instance: The instance.
> > + * @func: The yank function.
> > + * @opaque: Will be passed to the yank function.
> > + */
> > +void yank_register_function(const YankInstance *instance,
> > +                            YankFn *func,
> > +                            void *opaque);
> > +
> > +/**
> > + * yank_unregister_function: Unregister a yank function
> > + *
> > + * This unregisters a yank function.
> > + *
> > + * This function is thread-safe.
> > + *
> > + * @instance: The instance.
> > + * @func: func that was passed to yank_register_function.
> > + * @opaque: opaque that was passed to yank_register_function.
> > + */
> > +void yank_unregister_function(const YankInstance *instance,
> > +                              YankFn *func,
> > +                              void *opaque);
> > +
> > +/**
> > + * yank_generic_iochannel: Generic yank function for iochannel
> > + *
> > + * This is a generic yank function which will call qio_channel_shutdown
> > on the
> > + * provided QIOChannel.
> > + *
> > + * @opaque: QIOChannel to shutdown
> > + */
> > +void yank_generic_iochannel(void *opaque);
> > +
> > +#define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
> > +        .type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, \
> > +        .u.block_node.node_name =3D (the_node_name) })
> > +
> > +#define CHARDEV_YANK_INSTANCE(the_id) (&(YankInstance) { \
> > +        .type =3D YANK_INSTANCE_TYPE_CHARDEV, \
> > +        .u.chardev.id =3D (the_id) })
> > +
> > +#define MIGRATION_YANK_INSTANCE (&(YankInstance) { \
> > +        .type =3D YANK_INSTANCE_TYPE_MIGRATION })
> > +
> > +#endif
> > diff --git a/qapi/meson.build b/qapi/meson.build
> > index 0e98146f1f..ab68e7900e 100644
> > --- a/qapi/meson.build
> > +++ b/qapi/meson.build
> > @@ -47,6 +47,7 @@ qapi_all_modules =3D [
> >    'trace',
> >    'transaction',
> >    'ui',
> > +  'yank',
> >  ]
> >
> >  qapi_storage_daemon_modules =3D [
> > diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> > index 0b444b76d2..3441c9a9ae 100644
> > --- a/qapi/qapi-schema.json
> > +++ b/qapi/qapi-schema.json
> > @@ -86,6 +86,7 @@
> >  { 'include': 'machine.json' }
> >  { 'include': 'machine-target.json' }
> >  { 'include': 'replay.json' }
> > +{ 'include': 'yank.json' }
> >  { 'include': 'misc.json' }
> >  { 'include': 'misc-target.json' }
> >  { 'include': 'audio.json' }
> > diff --git a/qapi/yank.json b/qapi/yank.json
> > new file mode 100644
> > index 0000000000..167a775594
> > --- /dev/null
> > +++ b/qapi/yank.json
> > @@ -0,0 +1,119 @@
> > +# -*- Mode: Python -*-
> > +# vim: filetype=3Dpython
> > +#
> > +
> > +##
> > +# =3D Yank feature
> > +##
> > +
> > +##
> > +# @YankInstanceType:
> > +#
> > +# An enumeration of yank instance types. See @YankInstance for more
> > +# information.
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'enum': 'YankInstanceType',
> > +  'data': [ 'block-node', 'chardev', 'migration' ] }
> > +
> > +##
> > +# @YankInstanceBlockNode:
> > +#
> > +# Specifies which block graph node to yank. See @YankInstance for more
> > +# information.
> > +#
> > +# @node-name: the name of the block graph node
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'YankInstanceBlockNode',
> > +  'data': { 'node-name': 'str' } }
> > +
> > +##
> > +# @YankInstanceChardev:
> > +#
> > +# Specifies which character device to yank. See @YankInstance for more
> > +# information.
> > +#
> > +# @id: the chardev's ID
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'YankInstanceChardev',
> > +  'data': { 'id': 'str' } }
> > +
> > +##
> > +# @YankInstance:
> > +#
> > +# A yank instance can be yanked with the @yank qmp command to recover
> > from a
> > +# hanging QEMU.
> > +#
> > +# Currently implemented yank instances:
> > +#  - nbd block device:
> > +#    Yanking it will shut down the connection to the nbd server without
> > +#    attempting to reconnect.
> > +#  - socket chardev:
> > +#    Yanking it will shut down the connected socket.
> > +#  - migration:
> > +#    Yanking it will shut down all migration connections. Unlike
> > +#    @migrate_cancel, it will not notify the migration process, so
> > migration
> > +#    will go into @failed state, instead of @cancelled state. @yank
> > should be
> > +#    used to recover from hangs.
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'union': 'YankInstance',
> > +  'base': { 'type': 'YankInstanceType' },
> > +  'discriminator': 'type',
> > +  'data': {
> > +      'block-node': 'YankInstanceBlockNode',
> > +      'chardev': 'YankInstanceChardev' } }
> > +
> > +##
> > +# @yank:
> > +#
> > +# Try to recover from hanging QEMU by yanking the specified instances.=
 See
> > +# @YankInstance for more information.
> > +#
> > +# Takes a list of @YankInstance as argument.
> > +#
> > +# Returns: - Nothing on success
> > +#          - @DeviceNotFound error, if any of the YankInstances doesn't
> > exist
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "yank",
> > +#      "arguments": {
> > +#          "instances": [
> > +#               { "type": "block-node",
> > +#                 "node-name": "nbd0" }
> > +#          ] } }
> > +# <- { "return": {} }
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'command': 'yank',
> > +  'data': { 'instances': ['YankInstance'] },
> > +  'allow-oob': true }
> > +
> > +##
> > +# @query-yank:
> > +#
> > +# Query yank instances. See @YankInstance for more information.
> > +#
> > +# Returns: list of @YankInstance
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-yank" }
> > +# <- { "return": [
> > +#          { "type": "block-node",
> > +#            "node-name": "nbd0" }
> > +#      ] }
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'command': 'query-yank',
> > +  'returns': ['YankInstance'],
> > +  'allow-oob': true }
> > diff --git a/util/meson.build b/util/meson.build
> > index f359af0d46..f7c67344e1 100644
> > --- a/util/meson.build
> > +++ b/util/meson.build
> > @@ -50,6 +50,7 @@ endif
> >
> >  if have_system
> >    util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
> > +  util_ss.add(files('yank.c'))
> >  endif
> >
> >  if have_block
> > diff --git a/util/yank.c b/util/yank.c
> > new file mode 100644
> > index 0000000000..4a0f538359
> > --- /dev/null
> > +++ b/util/yank.c
> > @@ -0,0 +1,216 @@
> > +/*
> > + * QEMU yank feature
> > + *
> > + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/thread.h"
> > +#include "qemu/queue.h"
> > +#include "qapi/qapi-commands-yank.h"
> > +#include "qapi/qapi-visit-yank.h"
> > +#include "qapi/clone-visitor.h"
> > +#include "io/channel.h"
> > +#include "qemu/yank.h"
> > +
> > +struct YankFuncAndParam {
> > +    YankFn *func;
> > +    void *opaque;
> > +    QLIST_ENTRY(YankFuncAndParam) next;
> > +};
> > +
> > +struct YankInstanceEntry {
> > +    YankInstance *instance;
> > +    QLIST_HEAD(, YankFuncAndParam) yankfns;
> > +    QLIST_ENTRY(YankInstanceEntry) next;
> > +};
> > +
> > +typedef struct YankFuncAndParam YankFuncAndParam;
> > +typedef struct YankInstanceEntry YankInstanceEntry;
> > +
> > +/*
> > + * This lock protects the yank_instance_list below. Because it's taken=
 by
> > + * OOB-capable commands, it must be "fast", i.e. it may only be held f=
or a
> > + * bounded, short time. See docs/devel/qapi-code-gen.txt for additional
> > + * information.
> > + */
> > +static QemuMutex yank_lock;
> > +
> > +static QLIST_HEAD(, YankInstanceEntry) yank_instance_list
> > +    =3D QLIST_HEAD_INITIALIZER(yank_instance_list);
> > +
> > +static bool yank_compare_instances(const YankInstance *a, const
> > YankInstance *b)
> > =20
>=20
> I expect a compare function to return a value like strcmp.
>=20
> I suggest to name it yank_instance_equal() instead.

Changed for the next version.

> +{
> > +    if (a->type !=3D b->type) {
> > +        return false;
> > +    }
> > +
> > +    switch (a->type) {
> > +    case YANK_INSTANCE_TYPE_BLOCK_NODE:
> > +        return !strcmp(a->u.block_node.node_name,
> > b->u.block_node.node_name);
> > =20
>=20
> Or g_str_equal()

Changed for the next version.

> +    break;
> > =20
>=20
> This is not a common qemu style "break" indentation. And the "break" here
> shouldn't be necessary after a return.

Changed for the next version.

> +
> > +    case YANK_INSTANCE_TYPE_CHARDEV:
> > +        return !strcmp(a->u.chardev.id, b->u.chardev.id);
> > +    break;
> > +
> > +    case YANK_INSTANCE_TYPE_MIGRATION:
> > +        return true;
> > +    break;
> > +
> > +    default:
> > +        abort();
> > +    }
> > +}
> > +
> > +static YankInstanceEntry *yank_find_entry(const YankInstance *instance)
> > +{
> > +    YankInstanceEntry *entry;
> > +
> > +    QLIST_FOREACH(entry, &yank_instance_list, next) {
> > +        if (yank_compare_instances(entry->instance, instance)) {
> > +            return entry;
> > +        }
> > +    }
> > +    return NULL;
> > +}
> > +
> > +void yank_register_instance(const YankInstance *instance, Error **errp)
> > +{
> > +    YankInstanceEntry *entry;
> > +
> > +    qemu_mutex_lock(&yank_lock);
> > =20
>=20
> You may use QEMU_LOCK_GUARD instead.

Changed for the next version.

>=20
> > +
> > +    if (yank_find_entry(instance)) {
> > +        error_setg(errp, "duplicate yank instance");
> > +        qemu_mutex_unlock(&yank_lock);
> > +        return;
> > +    }
> > +
> > +    entry =3D g_slice_new(YankInstanceEntry);
> > =20
>=20
> GSlice is mostly useless, rarely used in qemu. It's on its way to
> deprecation in GLib (https://gitlab.gnome.org/GNOME/glib/-/issues/1079).
> Please replace with g_new0()

Changed for the next version.

>=20
> +    entry->instance =3D QAPI_CLONE(YankInstance, instance);
> > +    QLIST_INIT(&entry->yankfns);
> > +    QLIST_INSERT_HEAD(&yank_instance_list, entry, next);
> > +
> > +    qemu_mutex_unlock(&yank_lock);
> > +}
> > +
> > +void yank_unregister_instance(const YankInstance *instance)
> > +{
> > +    YankInstanceEntry *entry;
> > +
> > +    qemu_mutex_lock(&yank_lock);
> > =20
>=20
>  You may use QEMU_LOCK_GUARD instead. (same below)
>=20

Changed for the next version.

> +    entry =3D yank_find_entry(instance);
> > +    assert(entry);
> > =20
>=20
> This is not very friendly, as shown by the following patches that need to
> track separately whether an instance was registered or not.
>=20
> Could we simply return if entry is not found?

I'd rather keep it that way, as it detects programming errors.

And in the chardev code for example, the chardev object is created even
if a chardev with the same id already exists. yank_register_instance
detects this and it errors out. However, the new chardev object then
will be free()'d and if we call yank_unregister_instance unconditionally
in the destructor, we would actually unregister the instance of the
old/already existing chardev. So at least there we have to track it
separately anyway.

>=20
> > +
> > +    assert(QLIST_EMPTY(&entry->yankfns));
> > +    QLIST_REMOVE(entry, next);
> > +    qapi_free_YankInstance(entry->instance);
> > +    g_slice_free(YankInstanceEntry, entry);
> > +
> > +    qemu_mutex_unlock(&yank_lock);
> > +}
> > +
> > +void yank_register_function(const YankInstance *instance,
> > +                            YankFn *func,
> > +                            void *opaque)
> > +{
> > +    YankInstanceEntry *entry;
> > +    YankFuncAndParam *func_entry;
> > +
> > +    qemu_mutex_lock(&yank_lock);
> > =20
>=20
>=20
> +    entry =3D yank_find_entry(instance);
> > +    assert(entry);
> > =20
>=20
> The object is expected to be fully initialized, assert() is justified
> (compared to the unregistered function which could silently ignore
> unregistered instances)
>=20
> +
> > +    func_entry =3D g_slice_new(YankFuncAndParam);
> > +    func_entry->func =3D func;
> > +    func_entry->opaque =3D opaque;
> > +
> > +    QLIST_INSERT_HEAD(&entry->yankfns, func_entry, next);
> > +    qemu_mutex_unlock(&yank_lock);
> > +}
> > +
> > +void yank_unregister_function(const YankInstance *instance,
> > +                              YankFn *func,
> > +                              void *opaque)
> > +{
> > +    YankInstanceEntry *entry;
> > +    YankFuncAndParam *func_entry;
> > +
> > +    qemu_mutex_lock(&yank_lock);
> > =20
>=20
>=20
> +    entry =3D yank_find_entry(instance);
> > +    assert(entry);
> > +
> > +    QLIST_FOREACH(func_entry, &entry->yankfns, next) {
> > +        if (func_entry->func =3D=3D func && func_entry->opaque =3D=3D =
opaque) {
> > +            QLIST_REMOVE(func_entry, next);
> > +            g_slice_free(YankFuncAndParam, func_entry);
> > +            qemu_mutex_unlock(&yank_lock);
> > +            return;
> > +        }
> > +    }
> > +
> > +    abort();
> > +}
> > +
> > +void yank_generic_iochannel(void *opaque)
> > +{
> > +    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> > +
> > +    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> > +}
> > +
> > +void qmp_yank(YankInstanceList *instances,
> > +              Error **errp)
> > +{
> > +    YankInstanceList *tail;
> > +    YankInstanceEntry *entry;
> > +    YankFuncAndParam *func_entry;
> > +
> > +    qemu_mutex_lock(&yank_lock);
> > =20
>=20
>=20
> +    for (tail =3D instances; tail; tail =3D tail->next) {
> > +        entry =3D yank_find_entry(tail->value);
> > +        if (!entry) {
> > +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Instance not
> > found");
> > +            qemu_mutex_unlock(&yank_lock);
> > +            return;
> > +        }
> > +    }
> > +    for (tail =3D instances; tail; tail =3D tail->next) {
> > +        entry =3D yank_find_entry(tail->value);
> > +        assert(entry);
> > +        QLIST_FOREACH(func_entry, &entry->yankfns, next) {
> > +            func_entry->func(func_entry->opaque);
> > +        }
> > +    }
> > +    qemu_mutex_unlock(&yank_lock);
> > +}
> > +
> > +YankInstanceList *qmp_query_yank(Error **errp)
> > +{
> > +    YankInstanceEntry *entry;
> > +    YankInstanceList *ret;
> > +
> > +    ret =3D NULL;
> > +
> > +    qemu_mutex_lock(&yank_lock);
> > =20
>=20
>=20
> +    QLIST_FOREACH(entry, &yank_instance_list, next) {
> > +        YankInstanceList *new_entry;
> > +        new_entry =3D g_new0(YankInstanceList, 1);
> > +        new_entry->value =3D QAPI_CLONE(YankInstance, entry->instance);
> > +        new_entry->next =3D ret;
> > +        ret =3D new_entry;
> > +    }
> > +    qemu_mutex_unlock(&yank_lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static void __attribute__((__constructor__)) yank_init(void)
> > +{
> > +    qemu_mutex_init(&yank_lock);
> > +}
> > --
> > 2.20.1
> >
> > =20
>=20



--=20


--Sig_/q.+OtlH4ZYxWR3ixXMjax/V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p4/kACgkQNasLKJxd
slgq7g/+IHwQvomDP/CjH+k/zy4h7e6Cb/NSRZEXl3RgqE7Sqz5VqkFVvS3dvF7c
xBWDif7crT2eJu4WQF9iiPA+P4lAF+z/sa6a65c/+LFG52wl0H1gVXcJWotNWjLC
wecrAzFzoQPp65QnKrUFGu3HtlY/vG+3yzHc//rI6+yYjQW6WMBNRd1gSBFvRGXt
eyTbbsRAHBKPYu0MVGEVgeL2mPHUqClp/QG/pFWvUsFfJixXTNY9/XFpulHdImWl
mwr0FT4r2lmlAZ9vV51mYLp0DDhd6xB4jZoEwv7yXvxXOerU5REunn59fFGD4NyY
T7zs7NME7KBe4vSHqeDzDeb2LzD5dd6f4sHCfDuIMjCuJW2Y1Kl74Tf1o52T11QT
C0jJV0nDdKZ26Ji45Av2md5TE2YyI02aZ+a7o89qknnyGAQ7zTNB755LjGZjbhKd
jAe20AmHY7Ypr8h7Sxk7aKsiyOHo8ABxH7SUSq4yUCfCAsaao4Ko6y27ej2U1HWB
xJl6WVSiFW2dJKXScUmkXe+d6UmCiw92mdzYsVKT8SZhE/Qqboo7buuUKfVGE68w
HWlfs01o/k2K6IMjDch4aTylx2JN2dwg64fmFIvWOD3ETlziw6c3kDAYRaE5vsWq
1rILuIxG4mxNCRrVH8LaExTp9wrA/lLs/V686ZDvpuYcsQ9Svsw=
=CKO1
-----END PGP SIGNATURE-----

--Sig_/q.+OtlH4ZYxWR3ixXMjax/V--

