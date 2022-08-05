Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B158A529
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:54:02 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoPR-0004J7-Er
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoKM-0006Fj-JT
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoKL-0003sv-1U
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659671324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrDXeJNIXovYllRZ/2Li7HpNSMpuOQ7/3hD4vcGan6A=;
 b=MD+zPvsITfNzXFuxPowsLKQInkRoMShFwc7izy2ebLI/+VwJqulIqDOc7qx2WlJrGdKgI3
 fhE2c+9TorWpEdEv2nbOqh//j6DkC8zmg3DCf/Ec2hm+IGNsn5kJTbk3xIXd3KXaSRUnYa
 gzm3AwDRGD2ZUCouCpPNOvlhXT4Ui2s=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-Q7HplofSO3KIaZbAwARpjA-1; Thu, 04 Aug 2022 23:48:43 -0400
X-MC-Unique: Q7HplofSO3KIaZbAwARpjA-1
Received: by mail-lf1-f71.google.com with SMTP id
 n17-20020ac242d1000000b0048af11cb0f4so291170lfl.19
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 20:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QrDXeJNIXovYllRZ/2Li7HpNSMpuOQ7/3hD4vcGan6A=;
 b=LBVgB7bUUjgTz7p51Ztt5r9UYMeVVblEyM0HwfICi0+chE0/rhSVXItK1/BwepvsMX
 UbUxIOR9zVTCQD7d3pmBXHXCP3EZ+f/eJBflFfZLQCEQ+Vd9vq5kFIjQGMExPB5gNPJi
 KGNBon+O/dhLaVHKK1To58EeXuUyiK57xJRwW8yJj2io0/fpSLAkcAW6NS5xF42OTR6V
 0RRTOzuVU9zi287P3YfSyc2l+Bpn+MEQNmBNJ0x8FLJ6bwiR/oeeLyYuWURU8qPsGduP
 CO6YEQgvds8PlAeHfVCQkxkqZDb8afzXfrtrxwQk5h/JquNgIuQDEgaq/LYzZSCms7d9
 BGvQ==
X-Gm-Message-State: ACgBeo0ogsdFF+xxSSsE5d6mCF2c2FX+n3BhgIFH4Eq6XWj1Mpk7CmzQ
 mej4ZVWwYTuSJ/ORHkMrTEJ6T8DNE2mHiVgW0mq97UkNdLzJWZaQ7qXjd2hQ3LZUPFtCB9vG0nH
 emMGj8oAzmlDRf8HOKkgyHxScyMA0FyE=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr1612571lfu.442.1659671321772; 
 Thu, 04 Aug 2022 20:48:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4cmD2tKt7170NEEDZgLjS00qxYpsHG0f9+snEciXM+ju/6ho2hHxUmmQrjTeLMLss9xWyZs1S79W03jQixc20=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr1612557lfu.442.1659671321593; Thu, 04
 Aug 2022 20:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-3-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 11:48:30 +0800
Message-ID: <CACGkMEup1_VjEFcUiCoDVwVwyN2k4e4Pa_C6AaBStpUUuyGhbA@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] vhost: use SVQ element ndescs instead of opaque
 data for desc validation
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Since we're going to allow SVQ to add elements without the guest's
> knowledge and without its own VirtQueueElement, it's easier to check if
> an element is a valid head checking a different thing than the
> VirtQueueElement.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index ffd2b2c972..e6eebd0e8d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -414,7 +414,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShado=
wVirtqueue *svq,
>          return NULL;
>      }
>
> -    if (unlikely(!svq->desc_state[used_elem.id].elem)) {
> +    if (unlikely(!svq->desc_state[used_elem.id].ndescs)) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>              "Device %s says index %u is used, but it was not available",
>              svq->vdev->name, used_elem.id);
> @@ -422,6 +422,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShado=
wVirtqueue *svq,
>      }
>
>      num =3D svq->desc_state[used_elem.id].ndescs;
> +    svq->desc_state[used_elem.id].ndescs =3D 0;
>      last_used_chain =3D vhost_svq_last_desc_of_chain(svq, num, used_elem=
.id);
>      svq->desc_next[last_used_chain] =3D svq->free_head;
>      svq->free_head =3D used_elem.id;
> --
> 2.31.1
>


