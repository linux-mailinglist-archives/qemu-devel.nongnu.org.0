Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901860566A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:40:36 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNMB-0001ML-4o
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:40:35 -0400
Received: from [::1] (port=51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNMA-0000w7-Rk
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNHx-0004fP-PM
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNHw-0005oi-9k
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666240571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HlaJPy7Xgsi5R5+8p9zv1kMHnGw9TspT2VZzjZe8lU=;
 b=AJx6OsekhmhRWGH3u4mMOR7rWAoAsSzsIkj6FiI7GYZhU0OYZjLrMPomzvAVYUG6GYuLxj
 MBTM7Lb9GeSeYnl+SmFtohnPeYwVtUBZPjwwTpJIxJxJVvNcV1o7wZ5y0uVVc5bl72QovW
 KJBDkHSQC5hi0XS//A7hsdct0q+Nruc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-RDCrSpujPy2pCU4RaunAjQ-1; Thu, 20 Oct 2022 00:36:10 -0400
X-MC-Unique: RDCrSpujPy2pCU4RaunAjQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w1-20020a056402268100b0045d06ea5575so13917689edd.6
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HlaJPy7Xgsi5R5+8p9zv1kMHnGw9TspT2VZzjZe8lU=;
 b=ZWgJEUFLSwv70edcV9kHH5N8TFBOvMmBWMfPIkQi0PiP8dqxvNUwAKH6BSHIDimbSX
 2syfTkF6b16PKUMxWKxRRYXI/UmCd6zlO6gJ5j42oDHKU2Zl3Iamed0XJhaa+B6PE/Ps
 1vhHIdgnsZ184R6cnBUxkpGwxneviaBd0Cobqjln0JkYdvfsC57FcoNEsxg/zKZ9Fulx
 ppxZ61eCsKc4jUIWZJE/Z2AuHtN3hMxtV4Knq61JwhIScnmSi0RlxLdQAmi9Zh80JELj
 dVbh7c7l5wcAhU+hgGf0xD9a6U6AaJmTyBmCmNYiOL8hhVEtJ8evWaCJe6PTRWndZ2zC
 OijA==
X-Gm-Message-State: ACrzQf189YA4AejNRfGzL8yAeIkAXVkGtIlWBdCmOAX/IXkU5O4oQvZU
 u26nVwNYGfu77+WHrhtxtFRRheKwn9SZ3y03HJrrYRPrcCvbgHaqTkbPDFXhL1eDgav+SQhkneo
 gazfF/eNehnfqXOyqdnmX2TcFitb5aVs=
X-Received: by 2002:a05:6402:4302:b0:45d:c9b4:c007 with SMTP id
 m2-20020a056402430200b0045dc9b4c007mr10416738edc.328.1666240569428; 
 Wed, 19 Oct 2022 21:36:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ikNkjcCPUXmT2G+iIO257u7doWRX3gPJebdYuoK+BIH3D8sX1xE9+O5PNK6annuLw3T3x2ifyC9IBbTbfgyw=
X-Received: by 2002:a05:6402:4302:b0:45d:c9b4:c007 with SMTP id
 m2-20020a056402430200b0045dc9b4c007mr10416724edc.328.1666240569276; Wed, 19
 Oct 2022 21:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-8-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:35:54 +0800
Message-ID: <CACGkMEvQ0ZocZE61_-bWRQrd0zkOF2bLyBcTpgcOu1L7X+uzXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 7/8] vhost_net: return VIRTIO_NET_S_ANNOUNCE is
 device model has it set
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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

On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Temporal, as this affects other vhost backends and we must check status
> feature first.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 5660606c1d..300f370e2a 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -118,6 +118,7 @@ int vhost_net_get_config(struct vhost_net *net,  uint=
8_t *config,
>                           uint32_t config_len)
>  {
>      VirtIODevice *vdev;
> +    VirtIONet *n;
>      int r =3D vhost_dev_get_config(&net->dev, config, config_len, NULL);
>
>      if (unlikely(r !=3D 0)) {
> @@ -142,6 +143,13 @@ int vhost_net_get_config(struct vhost_net *net,  uin=
t8_t *config,
>          ((struct virtio_net_config *)config)->status |=3D VIRTIO_NET_S_L=
INK_UP;
>      }
>
> +    if (!(net->dev.acked_features & BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE)=
)) {
> +        return 0;
> +    }
> +
> +    n =3D VIRTIO_NET(vdev);
> +    ((struct virtio_net_config *)config)->status |=3D
> +                                           (n->status & VIRTIO_NET_S_ANN=
OUNCE);

Similar to the previous patch, it would be better to move this to virtio-ne=
t.c.

Thanks

>      return 0;
>  }
>  int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
> --
> 2.31.1
>


