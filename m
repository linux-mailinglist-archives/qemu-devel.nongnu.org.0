Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9D59F16F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:41:48 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgKx-0005m2-T2
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgJZ-0004DJ-Fn
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgJW-0005ef-3q
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661308816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfe2lyxCGdbqa3sV8GnJ6XZ1P4yWrCnB6Bp2fCZ0+zE=;
 b=Ye9cuU0+bnCs187ntz8FjtM+nyzYFt43URh9fkkWJpdMu3vFYPRGjs00npVJfom4GahzEs
 85dJmTvaKsVwuepb8gXmz5ho/vIwGp5dvq19WC26Fdq4u3IiDKM1CvL5fU+MUwFZTHVSSj
 BvhaYyNJmlZYwAyMyHWnFRiEts2ay4A=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-rZ1LTGUJNQy-31Iy3ukGHQ-1; Tue, 23 Aug 2022 22:40:14 -0400
X-MC-Unique: rZ1LTGUJNQy-31Iy3ukGHQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 c142-20020a621c94000000b005324991c5b8so6835687pfc.15
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vfe2lyxCGdbqa3sV8GnJ6XZ1P4yWrCnB6Bp2fCZ0+zE=;
 b=Hf30mr98PtmkZJhQWU0HYYw7pANdsZIDOkVKTxe/qHgPQMlN7L27P/u5BWYXtS4lRH
 m2L6SoiZ7B/K7GdCY5jfg3Umu9ahAXp1rXCdHVnLzBjPv6imTv8tePho88oIm3aywBli
 VaBJZwIfayz3GsY7bmIA78PspoT1AyXsHublkJ3KSEpNihk+DDn0I54RpVNFMmDv/w8n
 oMfU4n+SdMQuy8B6kTUcPLOJ2H8NlI0FSKBMcSDRdtzXW16N50b1uTl0DFvF1gNnbWGd
 APdnTfMADG5QsNTDh3LOntwfCCs0QysRJgfXE0YveiBGBII5EnKymMebyt15UmgC1sWG
 BMEQ==
X-Gm-Message-State: ACgBeo1pqaS5Ta2TizedBJ/nn3TQwgYhKqooi1FncP+3S8/rwhhuDkwg
 QtEOCYEA3znF0ZWUnHX4dSbRipNCKEr2T9P7hCaitmQyl1tw0y/YoYLa5k7hG9I9u8Z2hnQsfEt
 i3p/sXP2S8V9GZvY=
X-Received: by 2002:a17:902:db12:b0:172:9e51:64 with SMTP id
 m18-20020a170902db1200b001729e510064mr26640062plx.140.1661308813761; 
 Tue, 23 Aug 2022 19:40:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7z8nPZxFWEPG4r11Z/aD41ARMrcyM8kXJNK8ruVkSeZVgN9ZvNXnMBjfNexhqqgidjeotWrA==
X-Received: by 2002:a17:902:db12:b0:172:9e51:64 with SMTP id
 m18-20020a170902db1200b001729e510064mr26640043plx.140.1661308813450; 
 Tue, 23 Aug 2022 19:40:13 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090264d700b0016dafeda062sm11218667pli.232.2022.08.23.19.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:40:12 -0700 (PDT)
Message-ID: <11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com>
Date: Wed, 24 Aug 2022 10:40:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 11/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <9f5f233aaef3096fa1715095f3c436bb3c855fe5.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <9f5f233aaef3096fa1715095f3c436bb3c855fe5.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Introduce vhost_virtqueue_stop(), which can reset the virtqueue
> in the device. Then it will unmap vrings and the desc of the
> virtqueue.
>
> This patch only considers the case for vhost-kernel, when
> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c      | 21 +++++++++++++++++++++
>   include/net/vhost_net.h |  2 ++
>   2 files changed, 23 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..aa60dd901c 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -514,3 +514,24 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>   
>       return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>   }
> +
> +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
> +                              int vq_index)
> +{
> +    VHostNetState *net = get_vhost_net(nc->peer);
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +    struct vhost_vring_file file = { .fd = -1 };
> +    int idx;
> +
> +    assert(vhost_ops);
> +
> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> +
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
> +        file.index = idx;
> +        int r = vhost_net_set_backend(&net->dev, &file);
> +        assert(r >= 0);
> +    }


Let's have a vhost_ops here instead of open code it.

Thanks


> +
> +    vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
> +}
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913e4e..9b3aaf3814 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   
>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   
> +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
> +                              int vq_index);
>   #endif


