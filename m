Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1483606E5E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:42:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olivB-0003pq-Uc
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:42:09 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olitW-0003XT-L4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olitN-0003WZ-16
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olitL-0000Cj-0h
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666323613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRbVNVef9RaDeNdhfTd9T5EQjNAMfkQ+LJL4ua6d7t4=;
 b=IV+H7nuyADXMoUEd6yqNY364YjKt2VN0XyT6qJ3jV8LIU6Q/LfJYB0w+JMLnXUsYEbQ6q8
 uiUlU5FVSxT80n/+UsP6wpN9Dsxz6or2fw3vAJKKbu3LVg+0LLetwrdGg0VQuIEqIOTQTS
 dWRDwR3E7iBaiyX9t0KNarIo8t22ExA=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-Z79O4HypNj26nVRgeJ2lLw-1; Thu, 20 Oct 2022 23:40:12 -0400
X-MC-Unique: Z79O4HypNj26nVRgeJ2lLw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-13193fb45b9so1000268fac.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 20:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRbVNVef9RaDeNdhfTd9T5EQjNAMfkQ+LJL4ua6d7t4=;
 b=v0TyYFulZ5YF8+EOpyJsiSYuf4SlOcOllHIG0QrSWqLKaNStXdrUiW5nmfrVFJjcl1
 Fc6+JczsiVkf7AEO7k3qMXFUmADA+vaUWmvGOYJPEzXVLyA7UhFsqd5fX1C8SeWxK7yN
 mzy3v6/NvV99VMOuEZMrZWhRKxT7faek/PbiLXQBcMyuPxuAo51vMpQc8fSnBaHfm+2N
 fmJnhypsHBNhfP4rVtGm97/HErJWivRcecThTr2wItLuMAbcV0/Ekoy2ApMMUOOLtL6f
 mJ/u+jUarle91IZril1w79vKNAy1GXMxlXTrfEpXSu78gp2SbASOJ8DH8BV7taT7NW5h
 Kvng==
X-Gm-Message-State: ACrzQf3nB46Fth+a0YQ2MeCfVOUZij1pUjpDeYYr0VVWVhL3PwWA0hIR
 FNtZbvJ06nsT6QfM+Ez81eqiCKWRdEW6H+NC4YqHVd1iznZH5cPj1hjJyAipT1sqHwiT2NLPPG0
 9cgXVyGNZhvCAgdQV/ChwDRMZ5GthgCM=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr11143788oab.280.1666323611777; 
 Thu, 20 Oct 2022 20:40:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Kd+I11xMcd+x1dDLLulwI0oawfXVuLVsm4L6lbhrYGyzPntaGWdj3WPlSoeuPH7ONZv/xPZkgmuaaSu1dhNE=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr11143780oab.280.1666323611571; Thu, 20
 Oct 2022 20:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
In-Reply-To: <20221020155251.398735-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 11:39:59 +0800
Message-ID: <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 11:53 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Actually use the new field of the used ring and tell the device if SVQ
> wants to be notified.
>
> The code is not reachable at the moment.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index a518f84772..f5c0fad3fc 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -369,15 +369,27 @@ static bool vhost_svq_more_used(VhostShadowVirtqueu=
e *svq)
>   */
>  static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
>  {
> -    svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT=
);
> -    /* Make sure the flag is written before the read of used_idx */
> +    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> +        uint16_t *used_event =3D (uint16_t *)&svq->vring.avail->ring[svq=
->vring.num];
> +        *used_event =3D svq->shadow_used_idx;

Do we need to care about the endian here?

E.g vduse has:

    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16(val);

Thanks

> +    } else {
> +        svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_INTER=
RUPT);
> +    }
> +
> +    /* Make sure the event is enabled before the read of used_idx */
>      smp_mb();
>      return !vhost_svq_more_used(svq);
>  }
>
>  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
>  {
> -    svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT)=
;
> +    /*
> +     * No need to disable notification in the event idx case, since used=
 event
> +     * index is already an index too far away.
> +     */
> +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> +        svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERR=
UPT);
> +    }
>  }
>
>  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue =
*svq,
> --
> 2.31.1
>


