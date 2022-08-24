Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD09459F27B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:23:18 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhvB-0007Ne-Dj
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhqx-0003cQ-NS
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhqw-0002aB-1S
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661314733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yQEKDYJ55xRf+IClX5/0vWWWC3ldBJDyKyZZkwcQkQ=;
 b=GwCNnb0pkgds5ZZB1szRGFa8SD+FyLkfETw5FuPXHuWyAu7mVbfikWaDmvFVJvIXDE5gZn
 79KEJcrBf5xxkM2SiEquhmQeTl8vzbpG2N2fytkyT+Ii3UjCPZZwLOQJabj1Ny6uviubem
 IDZY7p0vSIkqnXX3EizFBEaidlY4vSM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-98KGhWeFNw2a2RWSKXQFjA-1; Wed, 24 Aug 2022 00:18:51 -0400
X-MC-Unique: 98KGhWeFNw2a2RWSKXQFjA-1
Received: by mail-pl1-f199.google.com with SMTP id
 s8-20020a170902ea0800b00172e456031eso5324628plg.3
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2yQEKDYJ55xRf+IClX5/0vWWWC3ldBJDyKyZZkwcQkQ=;
 b=v3uuWMgcLBb7syFzWHoFMxiZbJadXOg1AcN0VjB+yolV+TtFNhkqou09vKGrfKX4gk
 keiYUU2p3HPifPX9/yFb0DtQmo5akA+/92z06vK2TmkimYvtch6Ph5ZBMiz6NGnnXy/L
 Y/ohTx0Zs06QW3FrKmpAKaSF7zvM8GPUAOjEhD0vQbBAuBYq4hdMfE0nu4Yp9Ykb1k6V
 Z5+UH4+8Ctq0ND0TZDQ1azbn7JQw5M7UHJEWqKVPsBV6m6igw1ZSxKqZJP5K4HNeNKhM
 ggt2TQ/MIFR3BWACBO1Z6CzOJGmty+aeHQI7OIfuYmzrfsFRI5Vs8k/w+ys2oSCA5B7H
 oREQ==
X-Gm-Message-State: ACgBeo1CDuJ0HbDdB/U58hDgxE+mSg3u8MBw/DwnhdPtBGtbpmi51lfx
 yPlLUjso8G6h0/fQTqfwhsZdarPnOpM68tMCCM2m1YfnIOVsEQ5v7Xfhj1tNkoKsaaUqOR0tb5r
 8K0O9fRrl8q7H8C4=
X-Received: by 2002:a05:6a00:b52:b0:537:232f:9061 with SMTP id
 p18-20020a056a000b5200b00537232f9061mr3000122pfo.22.1661314730671; 
 Tue, 23 Aug 2022 21:18:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6yxop+jkoP5MXcRDmmo8d75Nx4G5Sp3Z2C4rBNjCVZM05Nq1hvjSpXC3TEMUTKzzu9cqhQOQ==
X-Received: by 2002:a05:6a00:b52:b0:537:232f:9061 with SMTP id
 p18-20020a056a000b5200b00537232f9061mr3000094pfo.22.1661314730371; 
 Tue, 23 Aug 2022 21:18:50 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a62de03000000b0053639773ad8sm8446674pfg.119.2022.08.23.21.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:18:49 -0700 (PDT)
Message-ID: <1a839554-2352-b31d-7fb8-c7b1c01ca181@redhat.com>
Date: Wed, 24 Aug 2022 12:18:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 1/5] vdpa: extract vhost_vdpa_net_load_mac from
 vhost_vdpa_net_load
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819171329.3597027-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/20 01:13, Eugenio Pérez 写道:
> Since there may be many commands we need to issue to load the NIC
> state, let's split them in individual functions
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   net/vhost-vdpa.c | 39 +++++++++++++++++++++++++--------------
>   1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 97b658f412..1e0dbfcced 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -363,21 +363,10 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>       return vhost_svq_poll(svq);
>   }
>   
> -static int vhost_vdpa_net_load(NetClientState *nc)
> +static int vhost_vdpa_net_load_mac(VhostVDPAState *s,
> +                                  const VirtIONet *n)
>   {
> -    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> -    const struct vhost_vdpa *v = &s->vhost_vdpa;
> -    const VirtIONet *n;
> -    uint64_t features;
> -
> -    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> -
> -    if (!v->shadow_vqs_enabled) {
> -        return 0;
> -    }
> -
> -    n = VIRTIO_NET(v->dev->vdev);
> -    features = n->parent_obj.guest_features;
> +    uint64_t features = n->parent_obj.guest_features;
>       if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
>           const struct virtio_net_ctrl_hdr ctrl = {
>               .class = VIRTIO_NET_CTRL_MAC,
> @@ -402,6 +391,28 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>       return 0;
>   }
>   
> +static int vhost_vdpa_net_load(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +    const VirtIONet *n;
> +    int r;
> +
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (!v->shadow_vqs_enabled) {
> +        return 0;
> +    }
> +
> +    n = VIRTIO_NET(v->dev->vdev);
> +    r = vhost_vdpa_net_load_mac(s, n);
> +    if (unlikely(r < 0)) {
> +        return r;
> +    }
> +
> +    return 0;
> +}
> +
>   static NetClientInfo net_vhost_vdpa_cvq_info = {
>       .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>       .size = sizeof(VhostVDPAState),


