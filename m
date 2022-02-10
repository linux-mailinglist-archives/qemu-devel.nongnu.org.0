Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D044B15A7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:58:36 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEeJ-0001Tm-BS
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:58:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1nIBCV-0005kX-Pe; Thu, 10 Feb 2022 10:17:39 -0500
Received: from [2607:f8b0:4864:20::d29] (port=38559
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1nIBCT-0002IA-QN; Thu, 10 Feb 2022 10:17:39 -0500
Received: by mail-io1-xd29.google.com with SMTP id w7so7701660ioj.5;
 Thu, 10 Feb 2022 07:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qGfFkrfifK2Tjc7PVycor2poZDPU87rsQ0rVD7kLA8g=;
 b=kfFX3bAh+46g//aCWxSs1oYssnP5P8o9jdgZHVhCXokZh7y6FOPq7X30F90gDdYBuy
 PFKD0H7N8+6cQZXOHHXRO1rU6LWJ+tssalz4Bb71NxhM0wwL7L4Z34hzt9ORj5Hcm5ID
 jwvzOSS/3BQd7bfmnL4wJWfVbF7bMt8IianhuVG+wl2cI3FFb2EsS8S5iby+rfFLLX2D
 Z46igxNBnK3QE8tVpCq4Nx1pYZSaGOpMiJDKsX/+L1XCI2Vpnx0wWr7uIrZv9Vzgvk6m
 M9FkoafV50LLJJ80pMzENoATNuXYR6wWxaWAELkaybAEmYaJBclw896BqczUPKQy1pqF
 h4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGfFkrfifK2Tjc7PVycor2poZDPU87rsQ0rVD7kLA8g=;
 b=PIJTT8S76P9/wSG0CWcXYfiKUXI+PE6IUokRMcrcHZ8/hFK95n9AZPRCpDIWylWyjv
 w5EITcHxdW40/t8p4O18HKVPP+rAVAa0X0buHhn1P1kKcFGUVZgOoxuIAmiG1eh5pqHC
 kFJIKW3Zk/lUPwitsxAWlCZDm3OuKmEON8maOl8vRcMO+DBsgU2vJqLCtKNNTNN96SyW
 anO0jcDsTqVPv679yj1yPKef/KCnWASYzWt6Asw+it1rMuB23ugp1cBz9v+X8vXMnz6i
 HWRFMHMpiv0tysytqAqaw1hsA3znMWXRfTL3b7nNqlq0ByaEZBrf3ITjSa3oFQCTfBvx
 3gTw==
X-Gm-Message-State: AOAM533SNsg059aS4/lB2Sr020W4f3fjpeAm8LF1gxuYilAaDtASMLWj
 CLNaAgsrIVs0Nk3pTwVYGIC17+EaniToc8nxSPE=
X-Google-Smtp-Source: ABdhPJzJ/Gdqi2A+nt2rDmxCJIDYfBDKjEMUNHOWNm3pZ5qIN1Uch1CCcJbpjtLbg5R3v3T1S1GdPFjjz60rfK2W/ec=
X-Received: by 2002:a05:6638:18a:: with SMTP id
 a10mr4462248jaq.130.1644506252984; 
 Thu, 10 Feb 2022 07:17:32 -0800 (PST)
MIME-Version: 1.0
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
 <1644488520-21604-5-git-send-email-jonah.palmer@oracle.com>
In-Reply-To: <1644488520-21604-5-git-send-email-jonah.palmer@oracle.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Feb 2022 16:17:22 +0100
Message-ID: <CAM9Jb+gC4heXFHB-PyyxL-XMBmbhwGSxsL_foNMz5-m_GV5LqA@mail.gmail.com>
Subject: Re: [PATCH v12 4/8] qmp: add QMP command x-query-virtio-status
To: Jonah Palmer <jonah.palmer@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd29.google.com
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

> This new command shows the status of a VirtIODevice, including
> its corresponding vhost device's status (if active).
>
> Next patch will improve output by decoding feature bits, including
> vhost device's feature bits (backend, protocol, acked, and features).
> Also will decode status bits of a VirtIODevice.
>
> [Jonah: Similar to previous patch, added a check to @virtio_device_find
>  to ensure synchronicity between @virtio_list and the devices in the QOM
>  composition tree.]
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hw/virtio/virtio-stub.c |   5 ++
>  hw/virtio/virtio.c      | 104 +++++++++++++++++++++++
>  qapi/virtio.json        | 222 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 331 insertions(+)
>
> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
> index 05a81ed..0b432e8 100644
> --- a/hw/virtio/virtio-stub.c
> +++ b/hw/virtio/virtio-stub.c
> @@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
>  {
>      return qmp_virtio_unsupported(errp);
>  }
> +
> +VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
> +{
> +    return qmp_virtio_unsupported(errp);
> +}
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e59f0d7..30ccd7b 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3928,6 +3928,110 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
>      return list;
>  }
>
> +static VirtIODevice *virtio_device_find(const char *path)
> +{
> +    VirtIODevice *vdev;
> +
> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
> +        DeviceState *dev = DEVICE(vdev);
> +
> +        if (strcmp(dev->canonical_path, path) != 0) {
> +            continue;
> +        }
> +
> +        Error *err = NULL;
> +        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
> +        if (err == NULL) {
> +            GString *is_realized = qobject_to_json_pretty(obj, true);
> +            /* virtio device is NOT realized, remove it from list */
> +            if (!strncmp(is_realized->str, "false", 4)) {
> +                g_string_free(is_realized, true);
> +                qobject_unref(obj);
> +                QTAILQ_REMOVE(&virtio_list, vdev, next);
> +                return NULL;
> +            }
> +            g_string_free(is_realized, true);
> +        } else {
> +            /* virtio device doesn't exist in QOM tree */
> +            QTAILQ_REMOVE(&virtio_list, vdev, next);
> +            qobject_unref(obj);
> +            return NULL;
> +        }
> +        /* device exists in QOM tree & is realized */
> +        qobject_unref(obj);
> +        return vdev;
> +    }
> +    return NULL;
> +}
> +
> +VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
> +{
> +    VirtIODevice *vdev;
> +    VirtioStatus *status;
> +
> +    vdev = virtio_device_find(path);
> +    if (vdev == NULL) {
> +        error_setg(errp, "Path %s is not a VirtIODevice", path);
> +        return NULL;
> +    }
> +
> +    status = g_new0(VirtioStatus, 1);
> +    status->name = g_strdup(vdev->name);
> +    status->device_id = vdev->device_id;
> +    status->vhost_started = vdev->vhost_started;
> +    status->guest_features = vdev->guest_features;
> +    status->host_features = vdev->host_features;
> +    status->backend_features = vdev->backend_features;
> +
> +    switch (vdev->device_endian) {
> +    case VIRTIO_DEVICE_ENDIAN_LITTLE:
> +        status->device_endian = g_strdup("little");
> +        break;
> +    case VIRTIO_DEVICE_ENDIAN_BIG:
> +        status->device_endian = g_strdup("big");
> +        break;
> +    default:
> +        status->device_endian = g_strdup("unknown");
> +        break;
> +    }
> +
> +    status->num_vqs = virtio_get_num_queues(vdev);
> +    status->status = vdev->status;
> +    status->isr = vdev->isr;
> +    status->queue_sel = vdev->queue_sel;
> +    status->vm_running = vdev->vm_running;
> +    status->broken = vdev->broken;
> +    status->disabled = vdev->disabled;
> +    status->use_started = vdev->use_started;
> +    status->started = vdev->started;
> +    status->start_on_kick = vdev->start_on_kick;
> +    status->disable_legacy_check = vdev->disable_legacy_check;
> +    status->bus_name = g_strdup(vdev->bus_name);
> +    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
> +    status->has_vhost_dev = vdev->vhost_started;
> +
> +    if (vdev->vhost_started) {
> +        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> +        struct vhost_dev *hdev = vdc->get_vhost(vdev);
> +
> +        status->vhost_dev = g_new0(VhostStatus, 1);
> +        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
> +        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
> +        status->vhost_dev->nvqs = hdev->nvqs;
> +        status->vhost_dev->vq_index = hdev->vq_index;
> +        status->vhost_dev->features = hdev->features;
> +        status->vhost_dev->acked_features = hdev->acked_features;
> +        status->vhost_dev->backend_features = hdev->backend_features;
> +        status->vhost_dev->protocol_features = hdev->protocol_features;
> +        status->vhost_dev->max_queues = hdev->max_queues;
> +        status->vhost_dev->backend_cap = hdev->backend_cap;
> +        status->vhost_dev->log_enabled = hdev->log_enabled;
> +        status->vhost_dev->log_size = hdev->log_size;
> +    }
> +
> +    return status;
> +}
> +
>  static const TypeInfo virtio_device_info = {
>      .name = TYPE_VIRTIO_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index aee0e40..ba61d83 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -66,3 +66,225 @@
>  { 'command': 'x-query-virtio',
>    'returns': [ 'VirtioInfo' ],
>    'features': [ 'unstable' ] }
> +
> +##
> +# @VhostStatus:
> +#
> +# Information about a vhost device. This information will only be
> +# displayed if the vhost device is active.
> +#
> +# @n-mem-sections: vhost_dev n_mem_sections
> +#
> +# @n-tmp-sections: vhost_dev n_tmp_sections
> +#
> +# @nvqs: vhost_dev nvqs (number of virtqueues being used)
> +#
> +# @vq-index: vhost_dev vq_index
> +#
> +# @features: vhost_dev features
> +#
> +# @acked-features: vhost_dev acked_features
> +#
> +# @backend-features: vhost_dev backend_features
> +#
> +# @protocol-features: vhost_dev protocol_features
> +#
> +# @max-queues: vhost_dev max_queues
> +#
> +# @backend-cap: vhost_dev backend_cap
> +#
> +# @log-enabled: vhost_dev log_enabled flag
> +#
> +# @log-size: vhost_dev log_size
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VhostStatus',
> +  'data': { 'n-mem-sections': 'int',
> +            'n-tmp-sections': 'int',
> +            'nvqs': 'uint32',
> +            'vq-index': 'int',
> +            'features': 'uint64',
> +            'acked-features': 'uint64',
> +            'backend-features': 'uint64',
> +            'protocol-features': 'uint64',
> +            'max-queues': 'uint64',
> +            'backend-cap': 'uint64',
> +            'log-enabled': 'bool',
> +            'log-size': 'uint64' } }
> +
> +##
> +# @VirtioStatus:
> +#
> +# Full status of the virtio device with most VirtIODevice members.
> +# Also includes the full status of the corresponding vhost device
> +# if the vhost device is active.
> +#
> +# @name: VirtIODevice name
> +#
> +# @device-id: VirtIODevice ID
> +#
> +# @vhost-started: VirtIODevice vhost_started flag
> +#
> +# @guest-features: VirtIODevice guest_features
> +#
> +# @host-features: VirtIODevice host_features
> +#
> +# @backend-features: VirtIODevice backend_features
> +#
> +# @device-endian: VirtIODevice device_endian
> +#
> +# @num-vqs: VirtIODevice virtqueue count. This is the number of active
> +#           virtqueues being used by the VirtIODevice.
> +#
> +# @status: VirtIODevice configuration status (VirtioDeviceStatus)
> +#
> +# @isr: VirtIODevice ISR
> +#
> +# @queue-sel: VirtIODevice queue_sel
> +#
> +# @vm-running: VirtIODevice vm_running flag
> +#
> +# @broken: VirtIODevice broken flag
> +#
> +# @disabled: VirtIODevice disabled flag
> +#
> +# @use-started: VirtIODevice use_started flag
> +#
> +# @started: VirtIODevice started flag
> +#
> +# @start-on-kick: VirtIODevice start_on_kick flag
> +#
> +# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
> +#
> +# @bus-name: VirtIODevice bus_name
> +#
> +# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
> +#
> +# @vhost-dev: Corresponding vhost device info for a given VirtIODevice.
> +#             Present if the given VirtIODevice has an active vhost
> +#             device.
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioStatus',
> +  'data': { 'name': 'str',
> +            'device-id': 'uint16',
> +            'vhost-started': 'bool',
> +            'device-endian': 'str',
> +            'guest-features': 'uint64',
> +            'host-features': 'uint64',
> +            'backend-features': 'uint64',
> +            'num-vqs': 'int',
> +            'status': 'uint8',
> +            'isr': 'uint8',
> +            'queue-sel': 'uint16',
> +            'vm-running': 'bool',
> +            'broken': 'bool',
> +            'disabled': 'bool',
> +            'use-started': 'bool',
> +            'started': 'bool',
> +            'start-on-kick': 'bool',
> +            'disable-legacy-check': 'bool',
> +            'bus-name': 'str',
> +            'use-guest-notifier-mask': 'bool',
> +            '*vhost-dev': 'VhostStatus' } }
> +
> +##
> +# @x-query-virtio-status:
> +#
> +# Poll for a comprehensive status of a given virtio device
> +#
> +# @path: Canonical QOM path of the VirtIODevice
> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: VirtioStatus of the virtio device
> +#
> +# Since: 7.0
> +#
> +# Examples:
> +#
> +# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
> +#
> +# -> { "execute": "x-query-virtio-status",
> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
> +#    }
> +# <- { "return": {
> +#            "device-endian": "little",
> +#            "bus-name": "",
> +#            "disable-legacy-check": false,
> +#            "name": "virtio-crypto",
> +#            "started": true,
> +#            "device-id": 20,
> +#            "backend-features": 0,
> +#            "start-on-kick": false,
> +#            "isr": 1,
> +#            "broken": false,
> +#            "status": 15,
> +#            "num-vqs": 2,
> +#            "guest-features": 5100273664,
> +#            "host-features": 6325010432,
> +#            "use-guest-notifier-mask": true,
> +#            "vm-running": true,
> +#            "queue-sel": 1,
> +#            "disabled": false,
> +#            "vhost-started": false,
> +#            "use-started": true
> +#      }
> +#    }
> +#
> +# 2. Poll for the status of virtio-net (vhost-net is active)
> +#
> +# -> { "execute": "x-query-virtio-status",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
> +#    }
> +# <- { "return": {
> +#            "device-endian": "little",
> +#            "bus-name": "",
> +#            "disabled-legacy-check": false,
> +#            "name": "virtio-net",
> +#            "started": true,
> +#            "device-id": 1,
> +#            "vhost-dev": {
> +#               "n-tmp-sections": 4,
> +#               "n-mem-sections": 4,
> +#               "max-queues": 1,
> +#               "backend-cap": 2,
> +#               "log-size": 0,
> +#               "backend-features": 0,
> +#               "nvqs": 2,
> +#               "protocol-features": 0,
> +#               "vq-index": 0,
> +#               "log-enabled": false,
> +#               "acked-features": 5100306432,
> +#               "features": 13908344832
> +#            },
> +#            "backend-features": 6337593319,
> +#            "start-on-kick": false,
> +#            "isr": 1,
> +#            "broken": false,
> +#            "status": 15,
> +#            "num-vqs": 3,
> +#            "guest-features": 5111807911,
> +#            "host-features": 6337593319,
> +#            "use-guest-notifier-mask": true,
> +#            "vm-running": true,
> +#            "queue-sel": 2,
> +#            "disabled": false,
> +#            "vhost-started": true,
> +#            "use-started": true
> +#      }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio-status',
> +  'data': { 'path': 'str' },
> +  'returns': 'VirtioStatus',
> +  'features': [ 'unstable' ] }

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

