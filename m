Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909392E9674
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 14:58:28 +0100 (CET)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQNP-0002Lm-MM
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 08:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kwQLj-0001s3-6Y; Mon, 04 Jan 2021 08:56:43 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kwQLa-0005mN-Uq; Mon, 04 Jan 2021 08:56:42 -0500
Received: by mail-ej1-x62d.google.com with SMTP id d17so36814247ejy.9;
 Mon, 04 Jan 2021 05:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9bUnJaZwoJjeg1LE+m/s/0LNKAiwtgk5giincX08l4=;
 b=kA/R7VUTLYG32TGV/r1HKz0xya0Syk7DqIvtmok9YEm7M0nhJO4tEHdjx+/Zj9kxJf
 j/Haj8nninui9fOwX/8Il91cvpuewDB7ElzQRwepSgqsKIuF3wBrrgWp/Dvabgte4x+q
 OFkUq4XvIUc3lMzrx3rb0d0d2DoEP/gTwmbAJ1F/rPqiAj4FA6N6EVoeGEoIFL486dR0
 LZdLUIirt0lp92p7XkR8V9H2PqVxYBZMeyBvEQD1fGZoEcP1Uk2c+lSsNEYF7DwmCfiV
 8Ai0VvGNQkR+MhIuUJYR8Td2GlQ6NMYc0wzNBv0RCimR/FkayAKke3vrgjh3CniEVtuS
 LpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9bUnJaZwoJjeg1LE+m/s/0LNKAiwtgk5giincX08l4=;
 b=E16K1LLGa2BOnpnc61fnFq8bUBFZZwDmnl6Tjxhl9a5RK+Ui0el51dKC8PVxnRk3tY
 mVfEvM4RC5rtXT37Uz5WPMqEMRCYpVPcFm9YH5dQXtWgpRVXAWuemT4fdsvwMegr5MLa
 IegPC8jvclZHsgxSK20pCGAQrQHEbZuvENIU4fdOPyQRKohjvJ8CxC3ueFj7QdXCGuiV
 QAjFwVecWAGqQPhLxFP1ypN05eZ+zm4dmsskBk1BhOZQEVKyOt9WqWWcVtT3qBMAnQ6W
 8H4CR+m5euQgPgp+AwgjZMzB5YS2ZPs+Ir12Q+PVjDFRwIkz7m1f7HaCVX2AtLe19jWv
 2fBw==
X-Gm-Message-State: AOAM533sh2L4SnKCOWXgk31/DOwCb/VYntx5dqtFhoKiNaV8PcB8ecOf
 kjvaN4ZTHtAgh8oVng4j/GONs1tHO4dI5XlY4u8=
X-Google-Smtp-Source: ABdhPJyT5SU7b7fmCpNHOU2pAw1/leNADEo8yYzhEwmoP0IdiXB3ts5QrDvVWPtKh8bRT33v0bCYKYXh2AGzgS+Mq4I=
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr51218998eje.109.1609768592646; 
 Mon, 04 Jan 2021 05:56:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609167865.git.lukasstraub2@web.de>
 <69934ceacfd33a7dfe53db145ecc630ad39ee47c.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <69934ceacfd33a7dfe53db145ecc630ad39ee47c.1609167865.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 4 Jan 2021 17:56:20 +0400
Message-ID: <CAJ+F1CLLiHca4Lf_nL7p2+Q3MT5JA0Qn9W6g14q0MYtYoROOdA@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] Introduce yank feature
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="00000000000022a79605b81375cf"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqVw=?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022a79605b81375cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub <lukasstraub2@web.de> wrote:

> The yank feature allows to recover from hanging qemu by "yanking"
> at various parts. Other qemu systems can register themselves and
> multiple yank functions. Then all yank functions for selected
> instances can be called by the 'yank' out-of-band qmp command.
> Available instances can be queried by a 'query-yank' oob command.
>

Looking at the changes and API usage, I wonder if it wouldn't have been
simpler to associate the yank function directly with the YankInstance
(removing the need for register/unregister functions - tracking the state
left to the callback). Have you tried that approach? If not, I could check
if this idea would work.

thanks


>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS           |   7 ++
>  include/qemu/yank.h   |  97 ++++++++++++++++++++
>  qapi/meson.build      |   1 +
>  qapi/qapi-schema.json |   1 +
>  qapi/yank.json        | 119 ++++++++++++++++++++++++
>  util/meson.build      |   1 +
>  util/yank.c           | 207 ++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 433 insertions(+)
>  create mode 100644 include/qemu/yank.h
>  create mode 100644 qapi/yank.json
>  create mode 100644 util/yank.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e7c8f0488..f465a4045a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2716,6 +2716,13 @@ F: util/uuid.c
>  F: include/qemu/uuid.h
>  F: tests/test-uuid.c
>
> +Yank feature
> +M: Lukas Straub <lukasstraub2@web.de>
> +S: Odd fixes
> +F: util/yank.c
> +F: include/qemu/yank.h
> +F: qapi/yank.json
> +
>  COLO Framework
>  M: zhanghailiang <zhang.zhanghailiang@huawei.com>
>  S: Maintained
> diff --git a/include/qemu/yank.h b/include/qemu/yank.h
> new file mode 100644
> index 0000000000..5b93c70cbf
> --- /dev/null
> +++ b/include/qemu/yank.h
> @@ -0,0 +1,97 @@
> +/*
> + * QEMU yank feature
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef YANK_H
> +#define YANK_H
> +
> +#include "qapi/qapi-types-yank.h"
> +
> +typedef void (YankFn)(void *opaque);
> +
> +/**
> + * yank_register_instance: Register a new instance.
> + *
> + * This registers a new instance for yanking. Must be called before any
> yank
> + * function is registered for this instance.
> + *
> + * This function is thread-safe.
> + *
> + * @instance: The instance.
> + * @errp: Error object.
> + *
> + * Returns true on success or false if an error occured.
> + */
> +bool yank_register_instance(const YankInstance *instance, Error **errp);
> +
> +/**
> + * yank_unregister_instance: Unregister a instance.
> + *
> + * This unregisters a instance. Must be called only after every yank
> function
> + * of the instance has been unregistered.
> + *
> + * This function is thread-safe.
> + *
> + * @instance: The instance.
> + */
> +void yank_unregister_instance(const YankInstance *instance);
> +
> +/**
> + * yank_register_function: Register a yank function
> + *
> + * This registers a yank function. All limitations of qmp oob commands
> apply
> + * to the yank function as well. See docs/devel/qapi-code-gen.txt under
> + * "An OOB-capable command handler must satisfy the following conditions=
".
> + *
> + * This function is thread-safe.
> + *
> + * @instance: The instance.
> + * @func: The yank function.
> + * @opaque: Will be passed to the yank function.
> + */
> +void yank_register_function(const YankInstance *instance,
> +                            YankFn *func,
> +                            void *opaque);
> +
> +/**
> + * yank_unregister_function: Unregister a yank function
> + *
> + * This unregisters a yank function.
> + *
> + * This function is thread-safe.
> + *
> + * @instance: The instance.
> + * @func: func that was passed to yank_register_function.
> + * @opaque: opaque that was passed to yank_register_function.
> + */
> +void yank_unregister_function(const YankInstance *instance,
> +                              YankFn *func,
> +                              void *opaque);
> +
> +/**
> + * yank_generic_iochannel: Generic yank function for iochannel
> + *
> + * This is a generic yank function which will call qio_channel_shutdown
> on the
> + * provided QIOChannel.
> + *
> + * @opaque: QIOChannel to shutdown
> + */
> +void yank_generic_iochannel(void *opaque);
> +
> +#define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
> +        .type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, \
> +        .u.block_node.node_name =3D (the_node_name) })
> +
> +#define CHARDEV_YANK_INSTANCE(the_id) (&(YankInstance) { \
> +        .type =3D YANK_INSTANCE_TYPE_CHARDEV, \
> +        .u.chardev.id =3D (the_id) })
> +
> +#define MIGRATION_YANK_INSTANCE (&(YankInstance) { \
> +        .type =3D YANK_INSTANCE_TYPE_MIGRATION })
> +
> +#endif
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 0e98146f1f..ab68e7900e 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -47,6 +47,7 @@ qapi_all_modules =3D [
>    'trace',
>    'transaction',
>    'ui',
> +  'yank',
>  ]
>
>  qapi_storage_daemon_modules =3D [
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 0b444b76d2..3441c9a9ae 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -86,6 +86,7 @@
>  { 'include': 'machine.json' }
>  { 'include': 'machine-target.json' }
>  { 'include': 'replay.json' }
> +{ 'include': 'yank.json' }
>  { 'include': 'misc.json' }
>  { 'include': 'misc-target.json' }
>  { 'include': 'audio.json' }
> diff --git a/qapi/yank.json b/qapi/yank.json
> new file mode 100644
> index 0000000000..167a775594
> --- /dev/null
> +++ b/qapi/yank.json
> @@ -0,0 +1,119 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=3Dpython
> +#
> +
> +##
> +# =3D Yank feature
> +##
> +
> +##
> +# @YankInstanceType:
> +#
> +# An enumeration of yank instance types. See @YankInstance for more
> +# information.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'YankInstanceType',
> +  'data': [ 'block-node', 'chardev', 'migration' ] }
> +
> +##
> +# @YankInstanceBlockNode:
> +#
> +# Specifies which block graph node to yank. See @YankInstance for more
> +# information.
> +#
> +# @node-name: the name of the block graph node
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'YankInstanceBlockNode',
> +  'data': { 'node-name': 'str' } }
> +
> +##
> +# @YankInstanceChardev:
> +#
> +# Specifies which character device to yank. See @YankInstance for more
> +# information.
> +#
> +# @id: the chardev's ID
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'YankInstanceChardev',
> +  'data': { 'id': 'str' } }
> +
> +##
> +# @YankInstance:
> +#
> +# A yank instance can be yanked with the @yank qmp command to recover
> from a
> +# hanging QEMU.
> +#
> +# Currently implemented yank instances:
> +#  - nbd block device:
> +#    Yanking it will shut down the connection to the nbd server without
> +#    attempting to reconnect.
> +#  - socket chardev:
> +#    Yanking it will shut down the connected socket.
> +#  - migration:
> +#    Yanking it will shut down all migration connections. Unlike
> +#    @migrate_cancel, it will not notify the migration process, so
> migration
> +#    will go into @failed state, instead of @cancelled state. @yank
> should be
> +#    used to recover from hangs.
> +#
> +# Since: 6.0
> +##
> +{ 'union': 'YankInstance',
> +  'base': { 'type': 'YankInstanceType' },
> +  'discriminator': 'type',
> +  'data': {
> +      'block-node': 'YankInstanceBlockNode',
> +      'chardev': 'YankInstanceChardev' } }
> +
> +##
> +# @yank:
> +#
> +# Try to recover from hanging QEMU by yanking the specified instances. S=
ee
> +# @YankInstance for more information.
> +#
> +# Takes a list of @YankInstance as argument.
> +#
> +# Returns: - Nothing on success
> +#          - @DeviceNotFound error, if any of the YankInstances doesn't
> exist
> +#
> +# Example:
> +#
> +# -> { "execute": "yank",
> +#      "arguments": {
> +#          "instances": [
> +#               { "type": "block-node",
> +#                 "node-name": "nbd0" }
> +#          ] } }
> +# <- { "return": {} }
> +#
> +# Since: 6.0
> +##
> +{ 'command': 'yank',
> +  'data': { 'instances': ['YankInstance'] },
> +  'allow-oob': true }
> +
> +##
> +# @query-yank:
> +#
> +# Query yank instances. See @YankInstance for more information.
> +#
> +# Returns: list of @YankInstance
> +#
> +# Example:
> +#
> +# -> { "execute": "query-yank" }
> +# <- { "return": [
> +#          { "type": "block-node",
> +#            "node-name": "nbd0" }
> +#      ] }
> +#
> +# Since: 6.0
> +##
> +{ 'command': 'query-yank',
> +  'returns': ['YankInstance'],
> +  'allow-oob': true }
> diff --git a/util/meson.build b/util/meson.build
> index f359af0d46..f7c67344e1 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -50,6 +50,7 @@ endif
>
>  if have_system
>    util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
> +  util_ss.add(files('yank.c'))
>  endif
>
>  if have_block
> diff --git a/util/yank.c b/util/yank.c
> new file mode 100644
> index 0000000000..fc08f65209
> --- /dev/null
> +++ b/util/yank.c
> @@ -0,0 +1,207 @@
> +/*
> + * QEMU yank feature
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/thread.h"
> +#include "qemu/queue.h"
> +#include "qemu/lockable.h"
> +#include "qapi/qapi-commands-yank.h"
> +#include "qapi/qapi-visit-yank.h"
> +#include "qapi/clone-visitor.h"
> +#include "io/channel.h"
> +#include "qemu/yank.h"
> +
> +struct YankFuncAndParam {
> +    YankFn *func;
> +    void *opaque;
> +    QLIST_ENTRY(YankFuncAndParam) next;
> +};
> +
> +struct YankInstanceEntry {
> +    YankInstance *instance;
> +    QLIST_HEAD(, YankFuncAndParam) yankfns;
> +    QLIST_ENTRY(YankInstanceEntry) next;
> +};
> +
> +typedef struct YankFuncAndParam YankFuncAndParam;
> +typedef struct YankInstanceEntry YankInstanceEntry;
> +
> +/*
> + * This lock protects the yank_instance_list below. Because it's taken b=
y
> + * OOB-capable commands, it must be "fast", i.e. it may only be held for=
 a
> + * bounded, short time. See docs/devel/qapi-code-gen.txt for additional
> + * information.
> + */
> +static QemuMutex yank_lock;
> +
> +static QLIST_HEAD(, YankInstanceEntry) yank_instance_list
> +    =3D QLIST_HEAD_INITIALIZER(yank_instance_list);
> +
> +static bool yank_instance_equal(const YankInstance *a, const YankInstanc=
e
> *b)
> +{
> +    if (a->type !=3D b->type) {
> +        return false;
> +    }
> +
> +    switch (a->type) {
> +    case YANK_INSTANCE_TYPE_BLOCK_NODE:
> +        return g_str_equal(a->u.block_node.node_name,
> +                           b->u.block_node.node_name);
> +
> +    case YANK_INSTANCE_TYPE_CHARDEV:
> +        return g_str_equal(a->u.chardev.id, b->u.chardev.id);
> +
> +    case YANK_INSTANCE_TYPE_MIGRATION:
> +        return true;
> +
> +    default:
> +        abort();
> +    }
> +}
> +
> +static YankInstanceEntry *yank_find_entry(const YankInstance *instance)
> +{
> +    YankInstanceEntry *entry;
> +
> +    QLIST_FOREACH(entry, &yank_instance_list, next) {
> +        if (yank_instance_equal(entry->instance, instance)) {
> +            return entry;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +bool yank_register_instance(const YankInstance *instance, Error **errp)
> +{
> +    YankInstanceEntry *entry;
> +
> +    QEMU_LOCK_GUARD(&yank_lock);
> +
> +    if (yank_find_entry(instance)) {
> +        error_setg(errp, "duplicate yank instance");
> +        return false;
> +    }
> +
> +    entry =3D g_new0(YankInstanceEntry, 1);
> +    entry->instance =3D QAPI_CLONE(YankInstance, instance);
> +    QLIST_INIT(&entry->yankfns);
> +    QLIST_INSERT_HEAD(&yank_instance_list, entry, next);
> +
> +    return true;
> +}
> +
> +void yank_unregister_instance(const YankInstance *instance)
> +{
> +    YankInstanceEntry *entry;
> +
> +    QEMU_LOCK_GUARD(&yank_lock);
> +    entry =3D yank_find_entry(instance);
> +    assert(entry);
> +
> +    assert(QLIST_EMPTY(&entry->yankfns));
> +    QLIST_REMOVE(entry, next);
> +    qapi_free_YankInstance(entry->instance);
> +    g_free(entry);
> +}
> +
> +void yank_register_function(const YankInstance *instance,
> +                            YankFn *func,
> +                            void *opaque)
> +{
> +    YankInstanceEntry *entry;
> +    YankFuncAndParam *func_entry;
> +
> +    QEMU_LOCK_GUARD(&yank_lock);
> +    entry =3D yank_find_entry(instance);
> +    assert(entry);
> +
> +    func_entry =3D g_new0(YankFuncAndParam, 1);
> +    func_entry->func =3D func;
> +    func_entry->opaque =3D opaque;
> +
> +    QLIST_INSERT_HEAD(&entry->yankfns, func_entry, next);
> +}
> +
> +void yank_unregister_function(const YankInstance *instance,
> +                              YankFn *func,
> +                              void *opaque)
> +{
> +    YankInstanceEntry *entry;
> +    YankFuncAndParam *func_entry;
> +
> +    QEMU_LOCK_GUARD(&yank_lock);
> +    entry =3D yank_find_entry(instance);
> +    assert(entry);
> +
> +    QLIST_FOREACH(func_entry, &entry->yankfns, next) {
> +        if (func_entry->func =3D=3D func && func_entry->opaque =3D=3D op=
aque) {
> +            QLIST_REMOVE(func_entry, next);
> +            g_free(func_entry);
> +            return;
> +        }
> +    }
> +
> +    abort();
> +}
> +
> +void yank_generic_iochannel(void *opaque)
> +{
> +    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> +
> +    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +}
> +
> +void qmp_yank(YankInstanceList *instances,
> +              Error **errp)
> +{
> +    YankInstanceList *tail;
> +    YankInstanceEntry *entry;
> +    YankFuncAndParam *func_entry;
> +
> +    QEMU_LOCK_GUARD(&yank_lock);
> +    for (tail =3D instances; tail; tail =3D tail->next) {
> +        entry =3D yank_find_entry(tail->value);
> +        if (!entry) {
> +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Instance not
> found");
> +            return;
> +        }
> +    }
> +    for (tail =3D instances; tail; tail =3D tail->next) {
> +        entry =3D yank_find_entry(tail->value);
> +        assert(entry);
> +        QLIST_FOREACH(func_entry, &entry->yankfns, next) {
> +            func_entry->func(func_entry->opaque);
> +        }
> +    }
> +}
> +
> +YankInstanceList *qmp_query_yank(Error **errp)
> +{
> +    YankInstanceEntry *entry;
> +    YankInstanceList *ret;
> +
> +    ret =3D NULL;
> +
> +    QEMU_LOCK_GUARD(&yank_lock);
> +    QLIST_FOREACH(entry, &yank_instance_list, next) {
> +        YankInstanceList *new_entry;
> +        new_entry =3D g_new0(YankInstanceList, 1);
> +        new_entry->value =3D QAPI_CLONE(YankInstance, entry->instance);
> +        new_entry->next =3D ret;
> +        ret =3D new_entry;
> +    }
> +
> +    return ret;
> +}
> +
> +static void __attribute__((__constructor__)) yank_init(void)
> +{
> +    qemu_mutex_init(&yank_lock);
> +}
> --
> 2.29.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000022a79605b81375cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 28, 2020 at 7:08 PM Luk=
as Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 yank feature allows to recover from hanging qemu by &quot;yanking&quot;<br=
>
at various parts. Other qemu systems can register themselves and<br>
multiple yank functions. Then all yank functions for selected<br>
instances can be called by the &#39;yank&#39; out-of-band qmp command.<br>
Available instances can be queried by a &#39;query-yank&#39; oob command.<b=
r></blockquote><div><br></div><div>Looking at the changes and API usage, I =
wonder if it wouldn&#39;t have been simpler to associate the yank function =
directly with the YankInstance (removing the need for register/unregister f=
unctions - tracking the state left to the callback). Have you tried that ap=
proach? If not, I could check if this idea would work.</div><div><br></div>=
<div>thanks<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
Acked-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=
=3D"_blank">stefanha@redhat.com</a>&gt;<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +=
+<br>
=C2=A0include/qemu/yank.h=C2=A0 =C2=A0|=C2=A0 97 ++++++++++++++++++++<br>
=C2=A0qapi/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0qapi/qapi-schema.json |=C2=A0 =C2=A01 +<br>
=C2=A0qapi/yank.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 119 +++++++++++++++++++++=
+++<br>
=C2=A0util/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0util/yank.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 207 +++++++++++=
+++++++++++++++++++++++++++++++<br>
=C2=A07 files changed, 433 insertions(+)<br>
=C2=A0create mode 100644 include/qemu/yank.h<br>
=C2=A0create mode 100644 qapi/yank.json<br>
=C2=A0create mode 100644 util/yank.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 1e7c8f0488..f465a4045a 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2716,6 +2716,13 @@ F: util/uuid.c<br>
=C2=A0F: include/qemu/uuid.h<br>
=C2=A0F: tests/test-uuid.c<br>
<br>
+Yank feature<br>
+M: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" target=3D"_blan=
k">lukasstraub2@web.de</a>&gt;<br>
+S: Odd fixes<br>
+F: util/yank.c<br>
+F: include/qemu/yank.h<br>
+F: qapi/yank.json<br>
+<br>
=C2=A0COLO Framework<br>
=C2=A0M: zhanghailiang &lt;<a href=3D"mailto:zhang.zhanghailiang@huawei.com=
" target=3D"_blank">zhang.zhanghailiang@huawei.com</a>&gt;<br>
=C2=A0S: Maintained<br>
diff --git a/include/qemu/yank.h b/include/qemu/yank.h<br>
new file mode 100644<br>
index 0000000000..5b93c70cbf<br>
--- /dev/null<br>
+++ b/include/qemu/yank.h<br>
@@ -0,0 +1,97 @@<br>
+/*<br>
+ * QEMU yank feature<br>
+ *<br>
+ * Copyright (c) Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" t=
arget=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef YANK_H<br>
+#define YANK_H<br>
+<br>
+#include &quot;qapi/qapi-types-yank.h&quot;<br>
+<br>
+typedef void (YankFn)(void *opaque);<br>
+<br>
+/**<br>
+ * yank_register_instance: Register a new instance.<br>
+ *<br>
+ * This registers a new instance for yanking. Must be called before any ya=
nk<br>
+ * function is registered for this instance.<br>
+ *<br>
+ * This function is thread-safe.<br>
+ *<br>
+ * @instance: The instance.<br>
+ * @errp: Error object.<br>
+ *<br>
+ * Returns true on success or false if an error occured.<br>
+ */<br>
+bool yank_register_instance(const YankInstance *instance, Error **errp);<b=
r>
+<br>
+/**<br>
+ * yank_unregister_instance: Unregister a instance.<br>
+ *<br>
+ * This unregisters a instance. Must be called only after every yank funct=
ion<br>
+ * of the instance has been unregistered.<br>
+ *<br>
+ * This function is thread-safe.<br>
+ *<br>
+ * @instance: The instance.<br>
+ */<br>
+void yank_unregister_instance(const YankInstance *instance);<br>
+<br>
+/**<br>
+ * yank_register_function: Register a yank function<br>
+ *<br>
+ * This registers a yank function. All limitations of qmp oob commands app=
ly<br>
+ * to the yank function as well. See docs/devel/qapi-code-gen.txt under<br=
>
+ * &quot;An OOB-capable command handler must satisfy the following conditi=
ons&quot;.<br>
+ *<br>
+ * This function is thread-safe.<br>
+ *<br>
+ * @instance: The instance.<br>
+ * @func: The yank function.<br>
+ * @opaque: Will be passed to the yank function.<br>
+ */<br>
+void yank_register_function(const YankInstance *instance,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 YankFn *func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque);<br>
+<br>
+/**<br>
+ * yank_unregister_function: Unregister a yank function<br>
+ *<br>
+ * This unregisters a yank function.<br>
+ *<br>
+ * This function is thread-safe.<br>
+ *<br>
+ * @instance: The instance.<br>
+ * @func: func that was passed to yank_register_function.<br>
+ * @opaque: opaque that was passed to yank_register_function.<br>
+ */<br>
+void yank_unregister_function(const YankInstance *instance,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YankFn *func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque);<br>
+<br>
+/**<br>
+ * yank_generic_iochannel: Generic yank function for iochannel<br>
+ *<br>
+ * This is a generic yank function which will call qio_channel_shutdown on=
 the<br>
+ * provided QIOChannel.<br>
+ *<br>
+ * @opaque: QIOChannel to shutdown<br>
+ */<br>
+void yank_generic_iochannel(void *opaque);<br>
+<br>
+#define BLOCKDEV_YANK_INSTANCE(the_node_name) (&amp;(YankInstance) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.block_node.node_name =3D (the_node_name) })=
<br>
+<br>
+#define CHARDEV_YANK_INSTANCE(the_id) (&amp;(YankInstance) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D YANK_INSTANCE_TYPE_CHARDEV, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .<a href=3D"http://u.chardev.id" rel=3D"norefe=
rrer" target=3D"_blank">u.chardev.id</a> =3D (the_id) })<br>
+<br>
+#define MIGRATION_YANK_INSTANCE (&amp;(YankInstance) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D YANK_INSTANCE_TYPE_MIGRATION })<br>
+<br>
+#endif<br>
diff --git a/qapi/meson.build b/qapi/meson.build<br>
index 0e98146f1f..ab68e7900e 100644<br>
--- a/qapi/meson.build<br>
+++ b/qapi/meson.build<br>
@@ -47,6 +47,7 @@ qapi_all_modules =3D [<br>
=C2=A0 =C2=A0&#39;trace&#39;,<br>
=C2=A0 =C2=A0&#39;transaction&#39;,<br>
=C2=A0 =C2=A0&#39;ui&#39;,<br>
+=C2=A0 &#39;yank&#39;,<br>
=C2=A0]<br>
<br>
=C2=A0qapi_storage_daemon_modules =3D [<br>
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json<br>
index 0b444b76d2..3441c9a9ae 100644<br>
--- a/qapi/qapi-schema.json<br>
+++ b/qapi/qapi-schema.json<br>
@@ -86,6 +86,7 @@<br>
=C2=A0{ &#39;include&#39;: &#39;machine.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;machine-target.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;replay.json&#39; }<br>
+{ &#39;include&#39;: &#39;yank.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;misc.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;misc-target.json&#39; }<br>
=C2=A0{ &#39;include&#39;: &#39;audio.json&#39; }<br>
diff --git a/qapi/yank.json b/qapi/yank.json<br>
new file mode 100644<br>
index 0000000000..167a775594<br>
--- /dev/null<br>
+++ b/qapi/yank.json<br>
@@ -0,0 +1,119 @@<br>
+# -*- Mode: Python -*-<br>
+# vim: filetype=3Dpython<br>
+#<br>
+<br>
+##<br>
+# =3D Yank feature<br>
+##<br>
+<br>
+##<br>
+# @YankInstanceType:<br>
+#<br>
+# An enumeration of yank instance types. See @YankInstance for more<br>
+# information.<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;enum&#39;: &#39;YankInstanceType&#39;,<br>
+=C2=A0 &#39;data&#39;: [ &#39;block-node&#39;, &#39;chardev&#39;, &#39;mig=
ration&#39; ] }<br>
+<br>
+##<br>
+# @YankInstanceBlockNode:<br>
+#<br>
+# Specifies which block graph node to yank. See @YankInstance for more<br>
+# information.<br>
+#<br>
+# @node-name: the name of the block graph node<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;struct&#39;: &#39;YankInstanceBlockNode&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;node-name&#39;: &#39;str&#39; } }<br>
+<br>
+##<br>
+# @YankInstanceChardev:<br>
+#<br>
+# Specifies which character device to yank. See @YankInstance for more<br>
+# information.<br>
+#<br>
+# @id: the chardev&#39;s ID<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;struct&#39;: &#39;YankInstanceChardev&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;id&#39;: &#39;str&#39; } }<br>
+<br>
+##<br>
+# @YankInstance:<br>
+#<br>
+# A yank instance can be yanked with the @yank qmp command to recover from=
 a<br>
+# hanging QEMU.<br>
+#<br>
+# Currently implemented yank instances:<br>
+#=C2=A0 - nbd block device:<br>
+#=C2=A0 =C2=A0 Yanking it will shut down the connection to the nbd server =
without<br>
+#=C2=A0 =C2=A0 attempting to reconnect.<br>
+#=C2=A0 - socket chardev:<br>
+#=C2=A0 =C2=A0 Yanking it will shut down the connected socket.<br>
+#=C2=A0 - migration:<br>
+#=C2=A0 =C2=A0 Yanking it will shut down all migration connections. Unlike=
<br>
+#=C2=A0 =C2=A0 @migrate_cancel, it will not notify the migration process, =
so migration<br>
+#=C2=A0 =C2=A0 will go into @failed state, instead of @cancelled state. @y=
ank should be<br>
+#=C2=A0 =C2=A0 used to recover from hangs.<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;union&#39;: &#39;YankInstance&#39;,<br>
+=C2=A0 &#39;base&#39;: { &#39;type&#39;: &#39;YankInstanceType&#39; },<br>
+=C2=A0 &#39;discriminator&#39;: &#39;type&#39;,<br>
+=C2=A0 &#39;data&#39;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;block-node&#39;: &#39;YankInstanceBlockNode&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;chardev&#39;: &#39;YankInstanceChardev&#39; } }<=
br>
+<br>
+##<br>
+# @yank:<br>
+#<br>
+# Try to recover from hanging QEMU by yanking the specified instances. See=
<br>
+# @YankInstance for more information.<br>
+#<br>
+# Takes a list of @YankInstance as argument.<br>
+#<br>
+# Returns: - Nothing on success<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - @DeviceNotFound error, if any of the=
 YankInstances doesn&#39;t exist<br>
+#<br>
+# Example:<br>
+#<br>
+# -&gt; { &quot;execute&quot;: &quot;yank&quot;,<br>
+#=C2=A0 =C2=A0 =C2=A0 &quot;arguments&quot;: {<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;instances&quot;: [<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;type&quot;=
: &quot;block-node&quot;,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;node-=
name&quot;: &quot;nbd0&quot; }<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] } }<br>
+# &lt;- { &quot;return&quot;: {} }<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;command&#39;: &#39;yank&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;instances&#39;: [&#39;YankInstance&#39;] },<=
br>
+=C2=A0 &#39;allow-oob&#39;: true }<br>
+<br>
+##<br>
+# @query-yank:<br>
+#<br>
+# Query yank instances. See @YankInstance for more information.<br>
+#<br>
+# Returns: list of @YankInstance<br>
+#<br>
+# Example:<br>
+#<br>
+# -&gt; { &quot;execute&quot;: &quot;query-yank&quot; }<br>
+# &lt;- { &quot;return&quot;: [<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;type&quot;: &quot;block-node&q=
uot;,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;node-name&quot;: &quot;nb=
d0&quot; }<br>
+#=C2=A0 =C2=A0 =C2=A0 ] }<br>
+#<br>
+# Since: 6.0<br>
+##<br>
+{ &#39;command&#39;: &#39;query-yank&#39;,<br>
+=C2=A0 &#39;returns&#39;: [&#39;YankInstance&#39;],<br>
+=C2=A0 &#39;allow-oob&#39;: true }<br>
diff --git a/util/meson.build b/util/meson.build<br>
index f359af0d46..f7c67344e1 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -50,6 +50,7 @@ endif<br>
<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0util_ss.add(when: &#39;CONFIG_GIO&#39;, if_true: [files(&#39;d=
bus.c&#39;), gio])<br>
+=C2=A0 util_ss.add(files(&#39;yank.c&#39;))<br>
=C2=A0endif<br>
<br>
=C2=A0if have_block<br>
diff --git a/util/yank.c b/util/yank.c<br>
new file mode 100644<br>
index 0000000000..fc08f65209<br>
--- /dev/null<br>
+++ b/util/yank.c<br>
@@ -0,0 +1,207 @@<br>
+/*<br>
+ * QEMU yank feature<br>
+ *<br>
+ * Copyright (c) Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" t=
arget=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/thread.h&quot;<br>
+#include &quot;qemu/queue.h&quot;<br>
+#include &quot;qemu/lockable.h&quot;<br>
+#include &quot;qapi/qapi-commands-yank.h&quot;<br>
+#include &quot;qapi/qapi-visit-yank.h&quot;<br>
+#include &quot;qapi/clone-visitor.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;qemu/yank.h&quot;<br>
+<br>
+struct YankFuncAndParam {<br>
+=C2=A0 =C2=A0 YankFn *func;<br>
+=C2=A0 =C2=A0 void *opaque;<br>
+=C2=A0 =C2=A0 QLIST_ENTRY(YankFuncAndParam) next;<br>
+};<br>
+<br>
+struct YankInstanceEntry {<br>
+=C2=A0 =C2=A0 YankInstance *instance;<br>
+=C2=A0 =C2=A0 QLIST_HEAD(, YankFuncAndParam) yankfns;<br>
+=C2=A0 =C2=A0 QLIST_ENTRY(YankInstanceEntry) next;<br>
+};<br>
+<br>
+typedef struct YankFuncAndParam YankFuncAndParam;<br>
+typedef struct YankInstanceEntry YankInstanceEntry;<br>
+<br>
+/*<br>
+ * This lock protects the yank_instance_list below. Because it&#39;s taken=
 by<br>
+ * OOB-capable commands, it must be &quot;fast&quot;, i.e. it may only be =
held for a<br>
+ * bounded, short time. See docs/devel/qapi-code-gen.txt for additional<br=
>
+ * information.<br>
+ */<br>
+static QemuMutex yank_lock;<br>
+<br>
+static QLIST_HEAD(, YankInstanceEntry) yank_instance_list<br>
+=C2=A0 =C2=A0 =3D QLIST_HEAD_INITIALIZER(yank_instance_list);<br>
+<br>
+static bool yank_instance_equal(const YankInstance *a, const YankInstance =
*b)<br>
+{<br>
+=C2=A0 =C2=A0 if (a-&gt;type !=3D b-&gt;type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (a-&gt;type) {<br>
+=C2=A0 =C2=A0 case YANK_INSTANCE_TYPE_BLOCK_NODE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_str_equal(a-&gt;u.block_node.node_nam=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0b-&gt;u.block_node.node_name);<br>
+<br>
+=C2=A0 =C2=A0 case YANK_INSTANCE_TYPE_CHARDEV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_str_equal(a-&gt;<a href=3D"http://u.c=
hardev.id" rel=3D"noreferrer" target=3D"_blank">u.chardev.id</a>, b-&gt;<a =
href=3D"http://u.chardev.id" rel=3D"noreferrer" target=3D"_blank">u.chardev=
.id</a>);<br>
+<br>
+=C2=A0 =C2=A0 case YANK_INSTANCE_TYPE_MIGRATION:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static YankInstanceEntry *yank_find_entry(const YankInstance *instance)<br=
>
+{<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+<br>
+=C2=A0 =C2=A0 QLIST_FOREACH(entry, &amp;yank_instance_list, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (yank_instance_equal(entry-&gt;instance, in=
stance)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return entry;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+bool yank_register_instance(const YankInstance *instance, Error **errp)<br=
>
+{<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;yank_lock);<br>
+<br>
+=C2=A0 =C2=A0 if (yank_find_entry(instance)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;duplicate yank instance=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 entry =3D g_new0(YankInstanceEntry, 1);<br>
+=C2=A0 =C2=A0 entry-&gt;instance =3D QAPI_CLONE(YankInstance, instance);<b=
r>
+=C2=A0 =C2=A0 QLIST_INIT(&amp;entry-&gt;yankfns);<br>
+=C2=A0 =C2=A0 QLIST_INSERT_HEAD(&amp;yank_instance_list, entry, next);<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+void yank_unregister_instance(const YankInstance *instance)<br>
+{<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;yank_lock);<br>
+=C2=A0 =C2=A0 entry =3D yank_find_entry(instance);<br>
+=C2=A0 =C2=A0 assert(entry);<br>
+<br>
+=C2=A0 =C2=A0 assert(QLIST_EMPTY(&amp;entry-&gt;yankfns));<br>
+=C2=A0 =C2=A0 QLIST_REMOVE(entry, next);<br>
+=C2=A0 =C2=A0 qapi_free_YankInstance(entry-&gt;instance);<br>
+=C2=A0 =C2=A0 g_free(entry);<br>
+}<br>
+<br>
+void yank_register_function(const YankInstance *instance,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 YankFn *func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+=C2=A0 =C2=A0 YankFuncAndParam *func_entry;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;yank_lock);<br>
+=C2=A0 =C2=A0 entry =3D yank_find_entry(instance);<br>
+=C2=A0 =C2=A0 assert(entry);<br>
+<br>
+=C2=A0 =C2=A0 func_entry =3D g_new0(YankFuncAndParam, 1);<br>
+=C2=A0 =C2=A0 func_entry-&gt;func =3D func;<br>
+=C2=A0 =C2=A0 func_entry-&gt;opaque =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 QLIST_INSERT_HEAD(&amp;entry-&gt;yankfns, func_entry, next);=
<br>
+}<br>
+<br>
+void yank_unregister_function(const YankInstance *instance,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YankFn *func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+=C2=A0 =C2=A0 YankFuncAndParam *func_entry;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;yank_lock);<br>
+=C2=A0 =C2=A0 entry =3D yank_find_entry(instance);<br>
+=C2=A0 =C2=A0 assert(entry);<br>
+<br>
+=C2=A0 =C2=A0 QLIST_FOREACH(func_entry, &amp;entry-&gt;yankfns, next) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (func_entry-&gt;func =3D=3D func &amp;&amp;=
 func_entry-&gt;opaque =3D=3D opaque) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_REMOVE(func_entry, next);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(func_entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 abort();<br>
+}<br>
+<br>
+void yank_generic_iochannel(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 QIOChannel *ioc =3D QIO_CHANNEL(opaque);<br>
+<br>
+=C2=A0 =C2=A0 qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);<=
br>
+}<br>
+<br>
+void qmp_yank(YankInstanceList *instances,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 YankInstanceList *tail;<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+=C2=A0 =C2=A0 YankFuncAndParam *func_entry;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;yank_lock);<br>
+=C2=A0 =C2=A0 for (tail =3D instances; tail; tail =3D tail-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D yank_find_entry(tail-&gt;value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_set(errp, ERROR_CLASS_DEVI=
CE_NOT_FOUND, &quot;Instance not found&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (tail =3D instances; tail; tail =3D tail-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D yank_find_entry(tail-&gt;value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_FOREACH(func_entry, &amp;entry-&gt;yankf=
ns, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_entry-&gt;func(func_entry-&=
gt;opaque);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+YankInstanceList *qmp_query_yank(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 YankInstanceEntry *entry;<br>
+=C2=A0 =C2=A0 YankInstanceList *ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;yank_lock);<br>
+=C2=A0 =C2=A0 QLIST_FOREACH(entry, &amp;yank_instance_list, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 YankInstanceList *new_entry;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_entry =3D g_new0(YankInstanceList, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_entry-&gt;value =3D QAPI_CLONE(YankInstanc=
e, entry-&gt;instance);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_entry-&gt;next =3D ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D new_entry;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void __attribute__((__constructor__)) yank_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_mutex_init(&amp;yank_lock);<br>
+}<br>
--<br>
2.29.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000022a79605b81375cf--

