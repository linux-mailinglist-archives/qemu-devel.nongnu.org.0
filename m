Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6573525C0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 05:50:50 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSApd-0002f4-81
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 23:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSAoY-0002FK-TX
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 23:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSAoX-0002wa-Gf
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 23:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617335380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7i3+nR3FPlHCaQEdrVlTiWOMeMi6qLCoPjQtsbe5Bw=;
 b=Y+TYstLC3sSU+Kz777fnr35Q5/qDY+nAka8fN7dJ2BiN8XMZtS0B3S2twj6OpIAgpZqwTT
 Yqu/QhZ7uoBNBGaaS3FugK5paPz6xQVp2NQkq3PwOLShJqhllJd1LxM8AWzLWub3P+R/9m
 0UzuVkp6REP16n9wqgx8o8c252/rPfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-rZgPRifCN6W2y-gF5Tjc4A-1; Thu, 01 Apr 2021 23:49:38 -0400
X-MC-Unique: rZgPRifCN6W2y-gF5Tjc4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCE6A180FCA9;
 Fri,  2 Apr 2021 03:49:37 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-24.pek2.redhat.com
 [10.72.12.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C11D310013C1;
 Fri,  2 Apr 2021 03:49:33 +0000 (UTC)
Subject: Re: [PATCH] hw/virtio: remove redundant code
To: Wentao Fan <fanwentao.0130@bytedance.com>, qemu-devel@nongnu.org
References: <20210401125808.89241-1-fanwentao.0130@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e3e39646-780e-fdd4-bf6f-ea3d14a3b06a@redhat.com>
Date: Fri, 2 Apr 2021 11:49:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401125808.89241-1-fanwentao.0130@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/1 ÏÂÎç8:58, Wentao Fan Ð´µÀ:
> From: Fan Wentao <fanwentao.0130@bytedance.com>
>
> Signed-off-by: Wentao Fan <fanwentao.0130@bytedance.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 07f4e60b30..aa5c283102 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -173,8 +173,7 @@ static void virtio_init_region_cache(VirtIODevice *vdev, int n)
>       }
>       new = g_new0(VRingMemoryRegionCaches, 1);
>       size = virtio_queue_get_desc_size(vdev, n);
> -    packed = virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED) ?
> -                                   true : false;
> +    packed = virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED);
>       len = address_space_cache_init(&new->desc, vdev->dma_as,
>                                      addr, size, packed);
>       if (len < size) {


