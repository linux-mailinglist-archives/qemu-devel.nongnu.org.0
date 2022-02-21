Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B14BD4B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 05:22:33 +0100 (CET)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM0DX-0006m3-KV
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 23:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM0Bd-0005aM-FI
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 23:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM0BZ-0001ez-PA
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 23:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645417227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhqEIEz2XIvk8vwMBcmNZb4Othdipas2rOp1o6ZvGJ0=;
 b=JPWgc7cyBY7FP2oVla27O0RFemNrNbDEaKgENEF3BNbBtnL4C3stO7Czzrmio6hVviacJo
 jyWK69k3AWxOm112VX1jzIBVWvxG4rzf6q5sXXVPGWWbVnA0Bvbi2X6aY0fpfd+Lys3Lfp
 feDqUSHwcNgw72RZznLwLjN6JETR/sw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-9iD6cwIXPDWKfGd72Zwk_A-1; Sun, 20 Feb 2022 23:20:26 -0500
X-MC-Unique: 9iD6cwIXPDWKfGd72Zwk_A-1
Received: by mail-pf1-f197.google.com with SMTP id
 h3-20020a628303000000b004e12f44a262so4254199pfe.21
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 20:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhqEIEz2XIvk8vwMBcmNZb4Othdipas2rOp1o6ZvGJ0=;
 b=buo7Jl/uCDEARgq3cu+PYa5zqgPq1E9Q/psUUSeiQdc5eS3SkMqN05PMy5Kb/QVhVb
 Q3uKzXzUHv7cEpd0ga1648k+qI3UdJTTqoxOCFyI607mWIygS1/5NOy4DM4gfmTIlc6/
 F9Z6cDofJ7ACK8ds3vnGAAwJeVe+FrnJd23cGeoymZ3wOCty4hxG/BqWDmyxzaHOm8A7
 9pNM5VBUpBrUTTZ5LK68qJkc3TsN7IIj2lTTkJEcK5bvGDBq85xv3DvMb7N897F4zCZc
 9n99pbFreDers/vcQrXwQarbu4WHBhYnOC5sfstjsz6j36DZHXXKMQBDdhkkgr1hF/b2
 WYyA==
X-Gm-Message-State: AOAM530fO/u+rsIr9r3p2CLtF+Ixz6gM6du4uHPNtbAacBb7W7NwuQRI
 uNAMhGWgWToi6RWBHeCWFmPQOQiPEdXAiLDMJnjMFQq+ldF9iQQ7imRZnJeNmngACFJaPlEriqe
 zlWlLY0UPjKYcbGE=
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr14817197pgu.62.1645417225420; 
 Sun, 20 Feb 2022 20:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrOG8/ClncQ89zMydNtI6HICTjj2h12ZqbvznAqhL9lnoQU9ynfj4O2ne8n6z17oPZAdqCrg==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr14817183pgu.62.1645417225081; 
 Sun, 20 Feb 2022 20:20:25 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t1sm10856568pfj.115.2022.02.20.20.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 20:20:24 -0800 (PST)
Message-ID: <14062596-e655-1fe3-be46-304d88388ed3@redhat.com>
Date: Mon, 21 Feb 2022 12:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] virtio-net: Unlimit tx queue size if peer is vdpa
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220217175029.2517071-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220217175029.2517071-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/18 上午1:50, Eugenio Pérez 写道:
> The code used to limit the maximum size of tx queue for others backends
> than vhost_user since the introduction of configurable tx queue size in
> 9b02e1618cf2 ("virtio-net: enable configurable tx queue size").
>
> As vhost_user, vhost_vdpa devices should deal with memory region
> crosses already, so let's use the full tx size.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 49cd13314a..b1769bfee0 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -629,17 +629,20 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
>       NetClientState *peer = n->nic_conf.peers.ncs[0];
>   
>       /*
> -     * Backends other than vhost-user don't support max queue size.
> +     * Backends other than vhost-user or vhost-vdpa don't support max queue
> +     * size.
>        */
>       if (!peer) {
>           return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
>       }
>   
> -    if (peer->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
> +    switch(peer->info->type) {
> +    case NET_CLIENT_DRIVER_VHOST_USER:
> +    case NET_CLIENT_DRIVER_VHOST_VDPA:
> +        return VIRTQUEUE_MAX_SIZE;
> +    default:
>           return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> -    }
> -
> -    return VIRTQUEUE_MAX_SIZE;
> +    };
>   }
>   
>   static int peer_attach(VirtIONet *n, int index)


