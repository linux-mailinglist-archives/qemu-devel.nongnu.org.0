Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB85A078B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 05:09:13 +0200 (CEST)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR3F2-0002wC-Od
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 23:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3Df-0001bv-Il
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3Dd-0004IH-Gi
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661396864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwT9RJMwLCqgKAxdluhDV5JeqLuTWZ2xfCy/vrYHYoI=;
 b=SkFi7cVzmugNRUHcqPu2O1c5k/XUVtWTAztWLVllC+SuzcaDvjK03gaydUbzHj6zQMvBch
 gaChwKCB3kkS25PffX13Pm1OsRdvewE/17CNEvd7zdcm8gZABWT7eTPu6AHwOgHNODn+Bo
 CCbUncnXiexgFxAP1BNOjYrNdc+3b1I=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-oRMacxe8OnKMmY1JhwTwHw-1; Wed, 24 Aug 2022 23:07:43 -0400
X-MC-Unique: oRMacxe8OnKMmY1JhwTwHw-1
Received: by mail-lf1-f70.google.com with SMTP id
 w18-20020ac25d52000000b0048af13b6ef6so5750082lfd.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 20:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=FwT9RJMwLCqgKAxdluhDV5JeqLuTWZ2xfCy/vrYHYoI=;
 b=cnUq7rqQ8LBk5BUcZij420zJYlliYLxEzhO4jKi/qWWox6Ntx2SrPf9W/q9TQXay5W
 dDNXPL8CGT/ZgAtbWBj+evIASe2opI3V87ORTu4Dy4xNPhK5xeXyiS/hgFeQmfZ77lbH
 uoO83fd6WiOxy4W1YW3dlrRpTQlqNtCU/GyErQl01847qtUf4/IDh3AapxDLHT9CnBic
 sqAqS9+0dySiqTw3FMtxBmmi3tpDojZxoxz0dP4E3PpdJ+ZkFJW/ZHgwngWe8nxgdhnQ
 5uEREYzp+H4JCDf/sP3i2Xj7X79O6d/HXqn65Jses73xNky6fghKXOq+cOJ+aqIaJmea
 FBrQ==
X-Gm-Message-State: ACgBeo0Jk8y6rcxO7eRFIno9HBTZsXZUIUQvWcUyxpkTJg+CFepu6fVo
 jIsZaOn2cshoUo5TbvFUt2xf3BNfkYPUzoGHBMdbsAHl9KizgVb7b5k4fn4qy0NEZXG1yRCS8qI
 karsLDkCklYmZbzmz5VuEtIztim53LCA=
X-Received: by 2002:a2e:b5a8:0:b0:261:e61a:cff2 with SMTP id
 f8-20020a2eb5a8000000b00261e61acff2mr488247ljn.487.1661396861978; 
 Wed, 24 Aug 2022 20:07:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dCV53e02bF8ADnj+pS8JlClWkxX16lOcLJVBac/RLZKNQUiw0zIFhiWX0yP6H1n0u3HtF10lVETrFcuTC95g=
X-Received: by 2002:a2e:b5a8:0:b0:261:e61a:cff2 with SMTP id
 f8-20020a2eb5a8000000b00261e61acff2mr488229ljn.487.1661396861749; Wed, 24 Aug
 2022 20:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220824183551.197052-1-eperezma@redhat.com>
 <20220824183551.197052-2-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 11:07:30 +0800
Message-ID: <CACGkMEtfR0E3juCm0dS1PYq5Ms4t_q2rV+U73M3M_UXsbAWy8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] vdpa: Make VhostVDPAState cvq_cmd_out_buffer
 control ack type
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, Aug 25, 2022 at 2:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This allows to simplify the code.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6ce68fcd3f..468e460ac2 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -35,7 +35,9 @@ typedef struct VhostVDPAState {
>      VHostNetState *vhost_net;
>
>      /* Control commands shadow buffers */
> -    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
> +    void *cvq_cmd_out_buffer;
> +    virtio_net_ctrl_ack *cvq_cmd_in_buffer;

Nit, let's simply rename this to 'status'.

Thanks

> +
>      bool started;
>  } VhostVDPAState;
>
> @@ -396,7 +398,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>              return dev_written;
>          }
>
> -        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D VIRTI=
O_NET_OK;
> +        return *s->cvq_cmd_in_buffer !=3D VIRTIO_NET_OK;
>      }
>
>      return 0;
> @@ -491,8 +493,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShad=
owVirtqueue *svq,
>          goto out;
>      }
>
> -    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
> -    if (status !=3D VIRTIO_NET_OK) {
> +    if (*s->cvq_cmd_in_buffer !=3D VIRTIO_NET_OK) {
>          return VIRTIO_NET_ERR;
>      }
>
> --
> 2.31.1
>


