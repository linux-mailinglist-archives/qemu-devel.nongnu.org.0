Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5D4ACF22
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 03:47:40 +0100 (CET)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHGXb-0005Yc-Cl
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 21:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHGVz-00049g-II
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 21:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHGVv-0002CL-IF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 21:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644288347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgNXdWmP0K1ixcOWmQu7nntgDkjzbgbWrB9PXPk5gQk=;
 b=BxG0ijRpGjC/UZ601P8aXooJ3KCOD2WT06moCTtxhcox2Ht7FiIFyjFb3lqxL/oIeCYuuT
 P1Nv137sjpcQiWTBJJF6wumokLasgVTXKZPSkvn965NNySCke94kSGiLjGuq7UiLX0nt++
 amQPLev7bI+OQ7NCtIvFbRWmSizjMwc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-k9w2gx-POXqHgn-Jp1wb2g-1; Mon, 07 Feb 2022 21:45:46 -0500
X-MC-Unique: k9w2gx-POXqHgn-Jp1wb2g-1
Received: by mail-lj1-f200.google.com with SMTP id
 q17-20020a2e7511000000b0023c95987502so5368189ljc.16
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 18:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgNXdWmP0K1ixcOWmQu7nntgDkjzbgbWrB9PXPk5gQk=;
 b=20vPD4X4tKmo7nC4VkOI/X3n/DXu8oBRZm1xnOwfNFw8YgoIWaWbdIgv0htmEBclu5
 egLn8gJX+Q7FwM0JT+Pl5SSXhbqAyxuLLN0g8XKwTdTFoRlPv/h4WgKjFzsHL+edg4qF
 /HQUtZdUrfdujhG/5oDCT9/iXQubyz4z76j9lB7BjO0EC7hX4WJmpiaVZOzW1+Oh5y5q
 /gAHMXCg4H0grVjfvOYyUfpneytffXeLT5eK4itgcwZtUAxvgNiXpttaxGAfIKFkb8og
 CdyLLu9bi4Sx3p0O1pvlrkV7+xap3F4r6CmBqt0JGxT68JLi6CfSVb7p/BJADSAiIhQ6
 RfxA==
X-Gm-Message-State: AOAM533FUg/P79HRK8a0XerN9WsRWmMJqnKWYaA1WJ2DRC3RJzl650fa
 YpLdPC5SYP+WgmGhjsIqLEqWh7fLtEEehAqaM9x3M9odOHxvXtUHf9PGM8v+PDtU3dPiD9yM0dH
 Qgy4eMHpSZ2xfIvsUrzLktJvT+OaIKSM=
X-Received: by 2002:a05:6512:3d8d:: with SMTP id
 k13mr918118lfv.481.1644288345175; 
 Mon, 07 Feb 2022 18:45:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUIXI535PGVX+VfQ5IZhoI8H9lHsnllbROuIFXR6xuNyeQRMXntSoe9ihlY1Ne95zw0+ijOB1MW4yDKf1PkZM=
X-Received: by 2002:a05:6512:3d8d:: with SMTP id
 k13mr918099lfv.481.1644288344906; 
 Mon, 07 Feb 2022 18:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20220207112857.607829-1-pasic@linux.ibm.com>
In-Reply-To: <20220207112857.607829-1-pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Feb 2022 10:45:33 +0800
Message-ID: <CACGkMEtiTnKQvtrNm6e9NZJN22wbQUv6bv8+2oWPfXSn+EXt4w@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] virtio: fix the condition for iommu_platform not
 supported
To: Halil Pasic <pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable@nongnu.org,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 7:29 PM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported") claims to fail the device hotplug when iommu_platform
> is requested, but not supported by the (vhost) device. On the first
> glance the condition for detecting that situation looks perfect, but
> because a certain peculiarity of virtio_platform it ain't.
>
> In fact the aforementioned commit introduces a regression. It breaks
> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> or any other confidential guest scenario that relies encrypted guest
> memory.  The same also applies to any other vhost device that does not
> support _F_ACCESS_PLATFORM.
>
> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> "device can not access all of the guest RAM" and "iova != gpa, thus
> device needs to translate iova".
>
> Confidential guest technologies currently rely on the device/hypervisor
> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> negotiated, the guest  grants access to the portions of memory the
> device needs to see. So in for confidential guests, generally,
> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> about the addresses used being something else than guest physical
> addresses.
>
> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> turn on VIRTIO_F_IOMMU_PLATFORM") fences _F_ACCESS_PLATFORM from the
> vhost device that does not need it, because on the vhost interface it
> only means "I/O address translation is needed".
>
> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> by the device, and thus no device capability is needed. In this
> situation claiming that the device does not support iommu_plattform=on
> is counter-productive. So let us stop doing that!
>
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported")
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-stable@nongnu.org

Acked-by: Jason Wang <jasowang@redhat.com>

>
> ---
>
> v4->v5:
> * added back the return; so if somebody were to add code to the end of
>   the function we are still good
> v3->v4:
> * Fixed commit message (thanks Connie)
> * Removed counter-productive initialization (thanks Connie)
> * Added tags
> v2->v3:
> * Caught a bug: I tired to check if vdev has the feature
>    ACCESS_PLATFORM after we have forced it. Moved the check
>    to a better place
> v1->v2:
> * Commit message tweaks. Most notably fixed commit SHA (Michael)
>
> ---
> ---
>  hw/virtio/virtio-bus.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d23db98c56..0f69d1c742 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>      VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
>      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>      bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +    bool vdev_has_iommu;
>      Error *local_err = NULL;
>
>      DPRINTF("%s: plug device.\n", qbus->name);
> @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>
> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> -        return;
> -    }
> -
>      if (klass->device_plugged != NULL) {
>          klass->device_plugged(qbus->parent, &local_err);
>      }
> @@ -82,9 +78,15 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>
> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>      if (klass->get_dma_as != NULL && has_iommu) {
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +            error_setg(errp,
> +                       "iommu_platform=true is not supported by the device");
> +            return;
> +        }
>      } else {
>          vdev->dma_as = &address_space_memory;
>      }
>
> base-commit: 0d564a3e32ba8494014c67cdd2ebf0fb71860dff
> --
> 2.32.0
>


