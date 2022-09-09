Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA065B2F35
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 08:43:36 +0200 (CEST)
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWXjj-0007kg-Jy
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 02:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWXg9-0004No-UC
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWXg6-0006P8-0d
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662705589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ULiCjzRcHvuCerF6wsgewxdlVk0JDMSU+yx7Y3lWLQ=;
 b=Upq5MIlBa4NvYH2eRXa5ygSmp6q/3MJsvMyYb/62E021HfmSVLphj1INNycUtYcxwB9ing
 A1zP4d7m7f52r8/bXOgCUk98j+VxF7FH3j2s7CQaAvbxzrq5KReqIT5UwPR/pB+bFUGmRi
 Ba40G50VI4cZ5VTHPylc1oPSnzCJ/is=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659--O83RCDkN3KmJH1QlXYX2A-1; Fri, 09 Sep 2022 02:39:47 -0400
X-MC-Unique: -O83RCDkN3KmJH1QlXYX2A-1
Received: by mail-vk1-f198.google.com with SMTP id
 n8-20020a1f2708000000b0039ec7065f52so220978vkn.9
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 23:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2ULiCjzRcHvuCerF6wsgewxdlVk0JDMSU+yx7Y3lWLQ=;
 b=CaDQQxmYj0dv2f3bY4UU01RGUo948JYGqqVvgs+USKvpzk8CjJzgqVAvDgSfvQdcUa
 SjBpZZ0HnqymYjoPtsnZ84Eb1pXy5PsN4wPQdmqpJZhNuNBk78r1MRHkYf93LfWaqyVj
 Elv11Fu2Q9r8maxcdYdo4zQE0TbRkhUi59nGjeqYvVG4PzSxmmPOIdKi0IKimI+KGy5/
 LoYvnP72UBw4mE5pRL09XCzK8A97mGu85cZANo7l6rilISdwqycXhMFQHiCTmu+muRUL
 XRul0gdTBwGAdStnd58aqDEHkSBGAsVqgm6LON5Ekqfkqvf7AxSlm40s966TbZw2MQDX
 TJiw==
X-Gm-Message-State: ACgBeo1JfOV046EqWEuaBj4XF5AFFMD/wsUNt5a2btoF/w/I1Z5556c3
 YR8uZWLe687AEXHMVRvlcrOEbs9+FBRU5Yma+GooS9+nygZo76k3gxOU9NYmS6zcr+msaN4Lh6t
 3g21Usefgza+pLQgW9yGr8uoXmkCwa0o=
X-Received: by 2002:a05:6102:3c4:b0:388:d643:a5b3 with SMTP id
 n4-20020a05610203c400b00388d643a5b3mr4590732vsq.21.1662705586843; 
 Thu, 08 Sep 2022 23:39:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77UF3E1hrorROQXVS7Y+3u9Irgd1hSt+JyxVi3kj4rQaGBoUqAGBUsQjL905dIm+Xj7K9ifcr9at5r1b9+GuE=
X-Received: by 2002:a05:6102:3c4:b0:388:d643:a5b3 with SMTP id
 n4-20020a05610203c400b00388d643a5b3mr4590728vsq.21.1662705586659; Thu, 08 Sep
 2022 23:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-4-eperezma@redhat.com>
In-Reply-To: <20220906163621.1144675-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Sep 2022 14:39:35 +0800
Message-ID: <CACGkMEtXzZPtJ6iQZAdXk1YH4s62gZBhWtFYXv972kwECg2_1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Support VLAN on nic control shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Update the virtio-net device model with each guest's update of vlan
> through control virtqueue, and accept creating a SVQ with a device
> exposing vlan feature bit.
>
> Done in the same commit since a malicious guest could send vlan
> commands otherwise.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index ecbfd08eb9..40f7c60399 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -94,6 +94,7 @@ static const uint64_t vdpa_svq_device_features =3D
>      BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
>      BIT_ULL(VIRTIO_NET_F_STATUS) |
>      BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
> +    BIT_ULL(VIRTIO_NET_F_CTRL_VLAN) |
>      BIT_ULL(VIRTIO_NET_F_MQ) |
>      BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
>      BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> @@ -538,6 +539,16 @@ static bool vhost_vdpa_net_cvq_validate_cmd(const vo=
id *out_buf, size_t len)
>                            __func__, ctrl.cmd);
>          };
>          break;
> +    case VIRTIO_NET_CTRL_VLAN:
> +        switch (ctrl->cmd) {
> +        case VIRTIO_NET_CTRL_VLAN_ADD:
> +        case VIRTIO_NET_CTRL_VLAN_DEL:
> +            return true;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid vlan cmd %u\n",
> +                          __func__, ctrl->cmd);
> +        };

Considering we may add more features here, is it still worthwhile to
keep a whitelist like this?

Thanks

> +        break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
>                        __func__, ctrl.class);
> --
> 2.31.1
>


