Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718986F5243
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:50:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pV-0000AY-81; Wed, 03 May 2023 03:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pu6p4-00077u-Hg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pu6p2-0007YT-O1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683098563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEwjYvFuqjAsLbc+yUER9zf84Qtz/UBPbdQjgsj77sk=;
 b=RojitHsA03yEybuWIvXishzStRbZ/BqfV2+t82b9A0rwq8ZXWs4o0HUR/y+XN8w+AGsuZj
 JiBWdLCEFL6DgufQfP36AzTCidBAGSx9u9v36Lq0BoaYmv75hE4prSojGFMNsZunJh26Qs
 bxZWsrrSFcFMiMELuLEQ2Agb7u/9UYo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-UaSFeG6HOVeyh-lSjOTeLg-1; Wed, 03 May 2023 03:22:42 -0400
X-MC-Unique: UaSFeG6HOVeyh-lSjOTeLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D39828314EB;
 Wed,  3 May 2023 07:22:41 +0000 (UTC)
Received: from [10.39.208.36] (unknown [10.39.208.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C285C1410F2A;
 Wed,  3 May 2023 07:22:40 +0000 (UTC)
Message-ID: <440bcd53-e527-4257-5fbb-d489bae18fac@redhat.com>
Date: Wed, 3 May 2023 09:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>
References: <20230501230409.274178-1-stefanha@redhat.com>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <20230501230409.274178-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/2/23 01:04, Stefan Hajnoczi wrote:
> Setting the VIRTIO Device Status Field to 0 resets the device. The
> device's state is lost, including the vring configuration.
> 
> vhost-user.c currently sends SET_STATUS 0 before GET_VRING_BASE. This
> risks confusion about the lifetime of the vhost-user state (e.g. vring
> last_avail_idx) across VIRTIO device reset.
> 
> Eugenio Pérez <eperezma@redhat.com> adjusted the order for vhost-vdpa.c
> in commit c3716f260bff ("vdpa: move vhost reset after get vring base")
> and in that commit description suggested doing the same for vhost-user
> in the future.
> 
> Go ahead and adjust vhost-user.c now. I ran various online code searches
> to identify vhost-user backends implementing SET_STATUS. It seems only
> DPDK implements SET_STATUS and Yajun Wu <yajunw@nvidia.com> has
> confirmed that it is safe to make this change.
> 
> Fixes: commit 923b8921d210763359e96246a58658ac0db6c645 ("vhost-user: Support vhost_dev_start")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Cc: Yajun Wu <yajunw@nvidia.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
> - Added VHOST_USER_PROTOCOL_F_STATUS check [Yajun Wu]
> - Added "Fixes:" tag [Michael]
> ---
>   hw/virtio/vhost-user.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e5285df4ba..40974afd06 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2677,7 +2677,20 @@ static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>                                             VIRTIO_CONFIG_S_DRIVER |
>                                             VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> -        return vhost_user_set_status(dev, 0);
> +        return 0;
> +    }
> +}
> +
> +static void vhost_user_reset_status(struct vhost_dev *dev)
> +{
> +    /* Set device status only for last queue pair */
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return;
> +    }
> +
> +    if (virtio_has_feature(dev->protocol_features,
> +                           VHOST_USER_PROTOCOL_F_STATUS)) {
> +        vhost_user_set_status(dev, 0);
>       }
>   }
>   
> @@ -2716,4 +2729,5 @@ const VhostOps user_ops = {
>           .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
>           .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
>           .vhost_dev_start = vhost_user_dev_start,
> +        .vhost_reset_status = vhost_user_reset_status,
>   };

I confirm it won't introduce regression on DPDK side:

Reviewed-by: Maxime Coquelin <maxime.coquelin@redhat.com>

Thanks,
Maxime


