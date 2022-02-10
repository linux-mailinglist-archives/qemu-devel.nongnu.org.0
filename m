Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916AB4B157A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:45:15 +0100 (CET)
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIERO-0000aB-5d
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:45:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1nIAxd-0007SY-O9; Thu, 10 Feb 2022 10:02:18 -0500
Received: from [2607:f8b0:4864:20::12b] (port=45628
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1nIAxT-0005wR-Lz; Thu, 10 Feb 2022 10:02:10 -0500
Received: by mail-il1-x12b.google.com with SMTP id n5so4510271ilk.12;
 Thu, 10 Feb 2022 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xroVFEmznkf+TkpnWuedFCf5E/LRkWVEtxIWX1umfms=;
 b=BuyzxU/lhXQzLf1p7BhQqTTjra3AI2Ta04eJwfT0dzZ8rNVt4jB2hl1gxVplO0/G2g
 6H9pnLR+2L/NKYnIVd0OttyFSL0uIVHCWKyTUaJQgOw6TWeONE1eid7QilAMET08/cAl
 7ntdrrPRQPl57NRui9YyKwdXaqdQ3QLKojdA4X0IBZBRj0wWX7c1dpRLCHQPCA5C5ftJ
 iVyL5T4Ikw3jdVc/Qipryuz9n5de9jQ7ITpGsxzbg1vcihfXyv4YiY+ZirhN/Ylpj/1p
 /7xvDZo9QHIqBpoFG/YpYklNTcelcG1z08/yL42+24Rvo+j/Uq79smI7nvQ6t9VhHr9s
 GC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xroVFEmznkf+TkpnWuedFCf5E/LRkWVEtxIWX1umfms=;
 b=LjTRALI29N9+2GNnhNIk3buSIlrLBnbzAJqb78vpcE+TYLlfowtB2mWxL+7kh18mYL
 9BWVg+UTD4BXIZcIrbVazVz9XS20KnXefRdzy6RumaRpDIP5pNYZz8PXOTvah6Q03xqZ
 CzFFS6ypv2NKT1SiUtwT7f6qqgfs7wpxsoyfHvRkiuiWnlsppdljOICW2nG+cLDHnb8Y
 6obFrHmWV5uJYR3iHzWNn3JJWtKYScY7CbHcMje41CphNBtiEbIhiogdTmRwOoj6NWR8
 klYU0TuV/eS5ZWBRNZEWkZcYfSDbL8km/16l49srXGCY8dMSXysps/VaSkmww3D2riY9
 be1A==
X-Gm-Message-State: AOAM532hDxatOYtvmSOkxW261qB8kUvInvSOF7OrzLe1GumQ0Q3egWB3
 KQQFJll4A7f+eR691zEkS66FF6luwLrQleKUFUg=
X-Google-Smtp-Source: ABdhPJzZBcRxwlTA5DYO/xVNrt9lMVCWDP+okeMdUc/YxCjZTJj4wXfc3wtwJNRH+LVsloJcAY+zlU/zV/9fs6VUsi8=
X-Received: by 2002:a92:a001:: with SMTP id e1mr4253298ili.108.1644505325996; 
 Thu, 10 Feb 2022 07:02:05 -0800 (PST)
MIME-Version: 1.0
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
 <1644488520-21604-4-git-send-email-jonah.palmer@oracle.com>
In-Reply-To: <1644488520-21604-4-git-send-email-jonah.palmer@oracle.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Feb 2022 16:01:55 +0100
Message-ID: <CAM9Jb+iA=bONbP3-WY8W2yjE=g8ejSv4_GoAOzodHLEMFXfi5g@mail.gmail.com>
Subject: Re: [PATCH v12 3/8] qmp: add QMP command x-query-virtio
To: Jonah Palmer <jonah.palmer@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu_oss@crudebyte.com,
 Qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gonglei <arei.gonglei@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 michael.roth@amd.com, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This new command lists all the instances of VirtIODevices with
> their canonical QOM path and name.
>
> [Jonah: @virtio_list duplicates information that already exists in
>  the QOM composition tree. However, extracting necessary information
>  from this tree seems to be a bit convoluted.
>
>  Instead, we still create our own list of realized virtio devices
>  but use @qmp_qom_get with the device's canonical QOM path to confirm
>  that the device exists and is realized. If the device exists but
>  is actually not realized, then we remove it from our list (for
>  synchronicity to the QOM composition tree).
>
>  Also, the QMP command @x-query-virtio is redundant as @qom-list
>  and @qom-get are sufficient to search '/machine/' for realized
>  virtio devices. However, @x-query-virtio is much more convenient
>  in listing realized virtio devices.]
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hw/virtio/meson.build      |  2 ++
>  hw/virtio/virtio-stub.c    | 14 ++++++++++
>  hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  qapi/meson.build           |  1 +
>  qapi/qapi-schema.json      |  1 +
>  qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  8 files changed, 132 insertions(+)
>  create mode 100644 hw/virtio/virtio-stub.c
>  create mode 100644 qapi/virtio.json
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 521f7d6..d893f5f 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
>
>  softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
>  softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
>
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
>
>  virtio_ss = ss.source_set()
>  virtio_ss.add(files('virtio.c'))
> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
> new file mode 100644
> index 0000000..05a81ed
> --- /dev/null
> +++ b/hw/virtio/virtio-stub.c
> @@ -0,0 +1,14 @@
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-virtio.h"
> +
> +static void *qmp_virtio_unsupported(Error **errp)
> +{
> +    error_setg(errp, "Virtio is disabled");
> +    return NULL;
> +}
> +
> +VirtioInfoList *qmp_x_query_virtio(Error **errp)
> +{
> +    return qmp_virtio_unsupported(errp);
> +}
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 7c1b1dd..e59f0d7 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -13,12 +13,18 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qapi-commands-virtio.h"
> +#include "qapi/qapi-commands-qom.h"
> +#include "qapi/qapi-visit-virtio.h"
> +#include "qapi/qmp/qjson.h"
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> +#include "qom/object_interfaces.h"
>  #include "hw/virtio/virtio.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
> @@ -29,6 +35,9 @@
>  #include "sysemu/runstate.h"
>  #include "standard-headers/linux/virtio_ids.h"
>
> +/* QAPI list of realized VirtIODevices */
> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
> +
>  /*
>   * The alignment to use between consumer and producer parts of vring.
>   * x86 pagesize again. This is the default, used by transports like PCI
> @@ -3687,6 +3696,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
>      vdev->listener.commit = virtio_memory_listener_commit;
>      vdev->listener.name = "virtio";
>      memory_listener_register(&vdev->listener, vdev->dma_as);
> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>  }
>
>  static void virtio_device_unrealize(DeviceState *dev)
> @@ -3701,6 +3711,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>          vdc->unrealize(dev);
>      }
>
> +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>      g_free(vdev->bus_name);
>      vdev->bus_name = NULL;
>  }
> @@ -3874,6 +3885,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
>      vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>
>      vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
> +
> +    QTAILQ_INIT(&virtio_list);
>  }
>
>  bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
> @@ -3884,6 +3897,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>      return virtio_bus_ioeventfd_enabled(vbus);
>  }
>
> +VirtioInfoList *qmp_x_query_virtio(Error **errp)
> +{
> +    VirtioInfoList *list = NULL;
> +    VirtioInfoList *node;
> +    VirtIODevice *vdev;
> +
> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
> +        DeviceState *dev = DEVICE(vdev);
> +        Error *err = NULL;
> +        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
> +
> +        if (err == NULL) {
> +            GString *is_realized = qobject_to_json_pretty(obj, true);
> +            /* virtio device is NOT realized, remove it from list */
> +            if (!strncmp(is_realized->str, "false", 4)) {
> +                QTAILQ_REMOVE(&virtio_list, vdev, next);
> +            } else {
> +                node = g_new0(VirtioInfoList, 1);
> +                node->value = g_new(VirtioInfo, 1);
> +                node->value->path = g_strdup(dev->canonical_path);
> +                node->value->name = g_strdup(vdev->name);
> +                QAPI_LIST_PREPEND(list, node->value);
> +            }
> +           g_string_free(is_realized, true);
> +        }
> +        qobject_unref(obj);
> +    }
> +
> +    return list;
> +}
> +
>  static const TypeInfo virtio_device_info = {
>      .name = TYPE_VIRTIO_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 90e6080..8f4e4c1 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -110,6 +110,7 @@ struct VirtIODevice
>      bool use_guest_notifier_mask;
>      AddressSpace *dma_as;
>      QLIST_HEAD(, VirtQueue) *vector_queues;
> +    QTAILQ_ENTRY(VirtIODevice) next;
>  };
>
>  struct VirtioDeviceClass {
> diff --git a/qapi/meson.build b/qapi/meson.build
> index c0c49c1..e332f28 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -48,6 +48,7 @@ qapi_all_modules = [
>    'sockets',
>    'trace',
>    'transaction',
> +  'virtio',
>    'yank',
>  ]
>  if have_system
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b97..1512ada 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -93,3 +93,4 @@
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
>  { 'include': 'pci.json' }
> +{ 'include': 'virtio.json' }
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> new file mode 100644
> index 0000000..aee0e40
> --- /dev/null
> +++ b/qapi/virtio.json
> @@ -0,0 +1,68 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +#
> +
> +##
> +# = Virtio devices
> +##
> +
> +##
> +# @VirtioInfo:
> +#
> +# Basic information about a given VirtIODevice
> +#
> +# @path: The VirtIODevice's canonical QOM path
> +#
> +# @name: Name of the VirtIODevice
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'VirtioInfo',
> +  'data': { 'path': 'str',
> +            'name': 'str' } }
> +
> +##
> +# @x-query-virtio:
> +#
> +# Returns a list of all realized VirtIODevices
> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: List of gathered VirtIODevices
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#
> +# -> { "execute": "x-query-virtio" }
> +# <- { "return": [
> +#        {
> +#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
> +#            "name": "virtio-input"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral/crypto0/virtio-backend",
> +#            "name": "virtio-crypto"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#            "name": "virtio-scsi"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#            "name": "virtio-net"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#            "name": "virtio-serial"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio',
> +  'returns': [ 'VirtioInfo' ],
> +  'features': [ 'unstable' ] }
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 7f103ea..fd00ee2 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
>          "query-gic-capabilities", /* arm */
>          /* Success depends on target-specific build configuration: */
>          "query-pci",              /* CONFIG_PCI */
> +        "x-query-virtio",         /* CONFIG_VIRTIO */
>          /* Success depends on launching SEV guest */
>          "query-sev-launch-measure",
>          /* Success depends on Host or Hypervisor SEV support */

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com

