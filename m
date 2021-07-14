Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022653C7BE3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 04:39:47 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3UoL-0005bq-Dg
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 22:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3UmU-0004FK-3r
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3UmR-0003X4-Ff
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626230259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6TquyMU7isqqkLfp+v1PCy2wlwHXPpgTO/NSJvCvXM=;
 b=LcXwg7nzvQXG36garYHnPh+OSRmAkEOy9kaRFypQHjIKb7fWNaRtguLu3oVsFf+37B8qCL
 NfWq06WJyeK5zDfDpw16sn/PrY1T7/1Bp4ISo2kgtrzAMqSTa98Tvw5BaydHga+mG25Fzb
 Acsg8cQ9/8ZoIMk0JGDDJNZ6UTQbHNs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-GNVwhbdNOkaLgXLaoBPQLA-1; Tue, 13 Jul 2021 22:37:38 -0400
X-MC-Unique: GNVwhbdNOkaLgXLaoBPQLA-1
Received: by mail-pl1-f200.google.com with SMTP id
 o7-20020a1709026b07b029011a0d4de43dso558866plk.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 19:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/6TquyMU7isqqkLfp+v1PCy2wlwHXPpgTO/NSJvCvXM=;
 b=d5bOrQgF05sPIg7yTYb2wp3TDx9p/vrMq4Cvtu/5dAXW2edN5Z1Gt4hVR5h81WX4DX
 OHYvvlhF+mrDguy2qt9p8Oi346ig4DnIrYeX70qC/ROtvRNKrHcuFpIrEfj3R90Ie+Je
 n7v9nwFC5P+BpQguYgc65V01j1uY8Mr/4BmT4/NAmzbrtir78VavtAiTNibFUXjlr5vA
 Oc1C/Cx7eD9rzox48qO1BKHe2sWhSYV6vmJqky/aCmZRodJiw2xdxZ3RI6yAy+/iZwye
 vCFkG4+CMzrKZO82nVFSrVTCWLFDpT18Lrp2pL9/O7uxq7iq/bt9DFCD6b+0nTyocrnT
 SC0w==
X-Gm-Message-State: AOAM532EFJ7L/tERxvrv1lJ3aul2105qNbbROhmVSp6dJ0DY8Jzrw1p/
 kz9/5A3leX1TOn8fQSvQvfiDyBj0hUgjfxVZOt5DkWBiyVpw97enPYg5NqsyyTf2GNF7XBQfHDq
 wLU1nZTIJDH5CKV4=
X-Received: by 2002:a62:f947:0:b029:2e9:c502:7939 with SMTP id
 g7-20020a62f9470000b02902e9c5027939mr7730116pfm.34.1626230256163; 
 Tue, 13 Jul 2021 19:37:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3DVDrZ+v6dBJ+2TjY11YaG3oYApDb2DSnx81Sg24GW+BXRwOSdfcQDDEfofoPSe+Ai59oiA==
X-Received: by 2002:a62:f947:0:b029:2e9:c502:7939 with SMTP id
 g7-20020a62f9470000b02902e9c5027939mr7730090pfm.34.1626230255886; 
 Tue, 13 Jul 2021 19:37:35 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t23sm512029pfe.8.2021.07.13.19.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 19:37:35 -0700 (PDT)
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
Date: Wed, 14 Jul 2021 10:37:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/12 ÏÂÎç6:35, Jonah Palmer Ð´µÀ:
> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command shows internal status of a VirtQueue.
> (vrings and indexes).
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>   hw/virtio/virtio-stub.c |   6 +++
>   hw/virtio/virtio.c      |  37 ++++++++++++++++++
>   qapi/virtio.json        | 102 ++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 145 insertions(+)
>
>   [Jonah: Added 'device-type' field to VirtQueueStatus and
>   qmp command x-debug-virtio-queue-status.]
>
> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
> index ddb592f..3c1bf17 100644
> --- a/hw/virtio/virtio-stub.c
> +++ b/hw/virtio/virtio-stub.c
> @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
>   {
>       return qmp_virtio_unsupported(errp);
>   }
> +
> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
> +                                                 uint16_t queue, Error **errp)
> +{
> +    return qmp_virtio_unsupported(errp);
> +}
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 81a0ee8..ccd4371 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3935,6 +3935,43 @@ static VirtIODevice *virtio_device_find(const char *path)
>       return NULL;
>   }
>   
> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
> +                                                 uint16_t queue, Error **errp)
> +{
> +    VirtIODevice *vdev;
> +    VirtQueueStatus *status;
> +
> +    vdev = virtio_device_find(path);
> +    if (vdev == NULL) {
> +        error_setg(errp, "Path %s is not a VirtIO device", path);
> +        return NULL;
> +    }
> +
> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
> +        error_setg(errp, "Invalid virtqueue number %d", queue);
> +        return NULL;
> +    }
> +
> +    status = g_new0(VirtQueueStatus, 1);
> +    status->device_type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
> +                                          VIRTIO_TYPE_UNKNOWN, NULL);
> +    status->queue_index = vdev->vq[queue].queue_index;
> +    status->inuse = vdev->vq[queue].inuse;
> +    status->vring_num = vdev->vq[queue].vring.num;
> +    status->vring_num_default = vdev->vq[queue].vring.num_default;
> +    status->vring_align = vdev->vq[queue].vring.align;
> +    status->vring_desc = vdev->vq[queue].vring.desc;
> +    status->vring_avail = vdev->vq[queue].vring.avail;
> +    status->vring_used = vdev->vq[queue].vring.used;
> +    status->last_avail_idx = vdev->vq[queue].last_avail_idx;


As mentioned in previous versions. We need add vhost support otherwise 
the value here is wrong.


> +    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;


The shadow index is something that is implementation specific e.g in the 
case of vhost it's kind of meaningless.

Thanks


> +    status->used_idx = vdev->vq[queue].used_idx;
> +    status->signalled_used = vdev->vq[queue].signalled_used;
> +    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
> +
> +    return status;
> +}
> +
>   #define CONVERT_FEATURES(type, map)                \
>       ({                                           \
>           type *list = NULL;                         \
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 78873cd..7007e0c 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -406,3 +406,105 @@
>     'data': { 'path': 'str' },
>     'returns': 'VirtioStatus'
>   }
> +
> +##
> +# @VirtQueueStatus:
> +#
> +# Status of a VirtQueue
> +#
> +# @device-type: VirtIO device type
> +#
> +# @queue-index: VirtQueue queue_index
> +#
> +# @inuse: VirtQueue inuse
> +#
> +# @vring-num: VirtQueue vring.num
> +#
> +# @vring-num-default: VirtQueue vring.num_default
> +#
> +# @vring-align: VirtQueue vring.align
> +#
> +# @vring-desc: VirtQueue vring.desc
> +#
> +# @vring-avail: VirtQueue vring.avail
> +#
> +# @vring-used: VirtQueue vring.used
> +#
> +# @last-avail-idx: VirtQueue last_avail_idx
> +#
> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
> +#
> +# @used-idx: VirtQueue used_idx
> +#
> +# @signalled-used: VirtQueue signalled_used
> +#
> +# @signalled-used-valid: VirtQueue signalled_used_valid
> +#
> +# Since: 6.1
> +#
> +##
> +
> +{ 'struct': 'VirtQueueStatus',
> +  'data': {
> +    'device-type': 'VirtioType',
> +    'queue-index': 'uint16',
> +    'inuse': 'uint32',
> +    'vring-num': 'int',
> +    'vring-num-default': 'int',
> +    'vring-align': 'int',
> +    'vring-desc': 'uint64',
> +    'vring-avail': 'uint64',
> +    'vring-used': 'uint64',
> +    'last-avail-idx': 'uint16',
> +    'shadow-avail-idx': 'uint16',
> +    'used-idx': 'uint16',
> +    'signalled-used': 'uint16',
> +    'signalled-used-valid': 'uint16'
> +  }
> +}
> +
> +##
> +# @x-debug-virtio-queue-status:
> +#
> +# Return the status of a given VirtQueue
> +#
> +# @path: QOBject path of the VirtIODevice
> +#
> +# @queue: queue number to examine
> +#
> +# Returns: Status of the VirtQueue
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-virtio-queue-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
> +#          "queue": 0
> +#      }
> +#   }
> +# <- { "return": {
> +#      "signalled-used": 373,
> +#      "inuse": 0,
> +#      "vring-align": 4096,
> +#      "vring-desc": 864411648,
> +#      "signalled-used-valid": 0,
> +#      "vring-num-default": 256,
> +#      "vring-avail": 864415744,
> +#      "queue-index": 0,
> +#      "last-avail-idx": 373,
> +#      "vring-used": 864416320,
> +#      "used-idx": 373,
> +#      "device-type": "virtio-net",
> +#      "shadow-avail-idx": 619,
> +#      "vring-num": 256
> +#      }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-virtio-queue-status',
> +  'data': { 'path': 'str', 'queue': 'uint16' },
> +  'returns': 'VirtQueueStatus'
> +}


