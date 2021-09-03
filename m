Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FDC3FFBED
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:27:34 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4Xt-0005Q2-C7
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mM4Wi-0004AY-Jg
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mM4Wf-0006wn-EM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630657576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=njXAmUNkTQGGNbQrrTXwxRh73sqsWE4MIm1Hn/v0Vcs=;
 b=gqk6xyTXuJebvNUjIAFzUSo4Vj2dxU/tlXGWxpmB4G8SwrytvC06YGjmjgg8NhCJy0bGdU
 Oss8/N1xDBfFEY66P5Cyirb4UZlTo/XOjOSWjeWPVHYfw89GgbBbZKHQu2DmdFpyyHBWXK
 WGun6jtlTeCjgx5Gcuv8L5jEZUwsVXE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-NrRldgM-M22n7IOfEKLsOQ-1; Fri, 03 Sep 2021 04:26:15 -0400
X-MC-Unique: NrRldgM-M22n7IOfEKLsOQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so2350362wmg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 01:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=njXAmUNkTQGGNbQrrTXwxRh73sqsWE4MIm1Hn/v0Vcs=;
 b=FKmKH8+0idK0hXUh/hCMc69QldOcNu/+QfgE7IZpAqSi9p+nIbr4FT+Wa3+jU8l5GN
 1uT6S8oZzQwF7gtLlJDG41BsT+oKSNUR3u/vX2tf6KX37Sk6TaTAKed6yJ9044TZ25QY
 7wCLy25NjboB6IdqQSWH+c4hP4S7LU8G+oq1Y769bGOY0dcOd2d75PdplTpPZZZ1oqwT
 JtxRGxk4c//BX1bu3JDKkhTUQwlQyOH4aL/i+kwVdwkMFtcWhUg2daLdykVUp3KzJ9oH
 NWGTGtS3d6QOKgoB6Ke9UKFJHwxOf6WP8K7aeqad0rsBx00cFq97ItfkzVporl6NGqUk
 l6Yg==
X-Gm-Message-State: AOAM530EW6xo0SlExlsKES2XnbRoiY1jbcOWcomTBbJ1rIRIB5C2GTmx
 EO491lJkYTrpppGXritxwztxmkbSA619xfDo5YSnnRPepjJMU6FVWTlQgNuKg+8W1+0ngFl6J4W
 LllHxdOBqq+CvhiY=
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr2072210wmk.135.1630657573974; 
 Fri, 03 Sep 2021 01:26:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5UeNvya8mucV/949e4tWfVmNpfJ5XbFbSl2sUSaL94J/cCejJMtYAumvOF47DUSe+wvCF1w==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr2072157wmk.135.1630657573620; 
 Fri, 03 Sep 2021 01:26:13 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:7f47:ccd3:7600:6a2d:c5a])
 by smtp.gmail.com with ESMTPSA id l35sm3339758wms.40.2021.09.03.01.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:26:13 -0700 (PDT)
Date: Fri, 3 Sep 2021 04:26:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 2/6] qmp: add QMP command x-debug-virtio-status
Message-ID: <20210903042456-mutt-send-email-mst@kernel.org>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-3-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1626086137-16292-3-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 amit@kernel.org, michael.roth@amd.com, jasowang@redhat.com, david@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com, armbru@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 06:35:33AM -0400, Jonah Palmer wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> This new command shows the status of a VirtIODevice
> (features, endianness and number of virtqueues)
> 
> Next patch will improve output by decoding feature bits.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

Do we want to also decode the device status?
E.g. does it have driver, need reset, etc etc?

Also, the internal broken flag?


> ---
>  hw/virtio/virtio-stub.c |  5 ++++
>  hw/virtio/virtio.c      | 50 ++++++++++++++++++++++++++++++++
>  qapi/virtio.json        | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 131 insertions(+)
> 
> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
> index d4a88f5..ddb592f 100644
> --- a/hw/virtio/virtio-stub.c
> +++ b/hw/virtio/virtio-stub.c
> @@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
>  {
>      return qmp_virtio_unsupported(errp);
>  }
> +
> +VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
> +{
> +    return qmp_virtio_unsupported(errp);
> +}
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f3fc1bb..222330a 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3896,6 +3896,56 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
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
> +        return vdev;
> +    }
> +
> +    return NULL;
> +}
> +
> +VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
> +{
> +    VirtIODevice *vdev;
> +    VirtioStatus *status;
> +
> +    vdev = virtio_device_find(path);
> +    if (vdev == NULL) {
> +        error_setg(errp, "Path %s is not a VirtIO device", path);
> +        return NULL;
> +    }
> +
> +    status = g_new0(VirtioStatus, 1);
> +    status->guest_features = vdev->guest_features;
> +    status->host_features = vdev->host_features;
> +    status->backend_features = vdev->backend_features;
> +    status->device_id = vdev->device_id;
> +
> +    switch (vdev->device_endian) {
> +    case VIRTIO_DEVICE_ENDIAN_LITTLE:
> +        status->device_endian = VIRTIO_STATUS_ENDIANNESS_LITTLE;
> +        break;
> +    case VIRTIO_DEVICE_ENDIAN_BIG:
> +        status->device_endian = VIRTIO_STATUS_ENDIANNESS_BIG;
> +        break;
> +    default:
> +        status->device_endian = VIRTIO_STATUS_ENDIANNESS_UNKNOWN;
> +        break;
> +    }
> +
> +    status->num_vqs = virtio_get_num_queues(vdev);
> +
> +    return status;
> +}
> +
>  static const TypeInfo virtio_device_info = {
>      .name = TYPE_VIRTIO_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 804adbe..4bd09c9 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -70,3 +70,79 @@
>  ##
>  
>  { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
> +
> +##
> +# @VirtioStatusEndianness:
> +#
> +# Enumeration of endianness for VirtioDevice
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'VirtioStatusEndianness',
> +  'data': [ 'unknown', 'little', 'big' ]
> +}
> +
> +##
> +# @VirtioStatus:
> +#
> +# @device-id: VirtIODevice status
> +#
> +# @device-endian: VirtIODevice device_endian
> +#
> +# @guest-features: VirtIODevice guest_features
> +#
> +# @host-features: VirtIODevice host_features
> +#
> +# @backend-features: VirtIODevice backend_features
> +#
> +# @num-vqs: number of VirtIODevice queues
> +#
> +# Since: 6.1
> +#
> +##
> +
> +{ 'struct': 'VirtioStatus',
> +  'data': {
> +    'device-id': 'int',
> +    'device-endian': 'VirtioStatusEndianness',
> +    'guest-features': 'uint64',
> +    'host-features': 'uint64',
> +    'backend-features': 'uint64',
> +    'num-vqs': 'uint16'
> +  }
> +}
> +
> +##
> +# @x-debug-virtio-status:
> +#
> +# Return the status of virtio device
> +#
> +# @path: QOBject path of the VirtIODevice
> +#
> +# Returns: status of the VirtIODevice
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-virtio-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
> +#      }
> +#   }
> +# <- { "return": {
> +#          "backend-features": 0,
> +#          "guest-features": 5111807911,
> +#          "num-vqs": 3,
> +#          "host-features": 6337593319,
> +#          "device-endian": "little",
> +#          "device-id": 1
> +#      }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-virtio-status',
> +  'data': { 'path': 'str' },
> +  'returns': 'VirtioStatus'
> +}
> -- 
> 1.8.3.1


