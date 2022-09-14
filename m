Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727455B7F3F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 05:18:32 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYIv1-0000GL-KI
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 23:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIsK-0005wV-9W
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIsH-0002kC-3C
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663125340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8m8pHCY5di2HvTxTuh1s3inzGVd47OLL+B8V2Meb6E=;
 b=A9N5EgvC/ihyeM0+gePzdFNeDLNr2YzxetO4zZLCinUDjQ0ZW0EvwC/jPqCW8OKu97Zw/z
 PymX3tzA6DzdX5dJvAqYeYOn+Ory/qGgsVWCp774gowuX+9eNx3Mp9vIDEn+RvuZsIEO3b
 30SfvX+skSxAM6LXsBTjag23D83Bfws=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-utb7iKliMCC_I2Ob6aIZ5g-1; Tue, 13 Sep 2022 23:15:39 -0400
X-MC-Unique: utb7iKliMCC_I2Ob6aIZ5g-1
Received: by mail-pf1-f200.google.com with SMTP id
 cg5-20020a056a00290500b0053511889856so8343256pfb.18
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 20:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=s8m8pHCY5di2HvTxTuh1s3inzGVd47OLL+B8V2Meb6E=;
 b=WjwZyhFvzDneZSsefEEBDK75dUa15bbP2AJxarDeGEmth/6D5VZAEUDzZdPm+wEpR3
 vsToVJxDzU/2TcH/MNsQZBuYzByxFqMvbWlApFj/RfFfSrLjuDOUJDoMjirRltrjtTBc
 Z20YI1QtqueLEMzRAOvdRzN1kT2mJI6UKhKvsWcwe5IuTIBMirWQSHRnxsiY7U7ZLKdv
 TeiArxjLZqSthw3PbcZ00oiRNCCTRzYNjrB5fm1yI96GICXaEOh7BZ28AKBPhWoLJsyd
 CP50q5X6UN7Ha8K58Zekob7plAQYUtvb01+70hbnUFKjx+a/9goMlS6d4T5Krxu3uLwR
 DoNw==
X-Gm-Message-State: ACgBeo0OaDugj9BXKQkGbQkCljjriuKhTrDPiJl4hV8LrRR4f3mtKl1l
 YQ8GSqTdYbNXD8WbGuLVsaShC1xibU+/k0nydbSlyEP1yURpXn41GuXRNgEBci1iXz36cDrqNFu
 Pt+8ksREdvlN7F70=
X-Received: by 2002:a17:902:f541:b0:176:e8f1:cd57 with SMTP id
 h1-20020a170902f54100b00176e8f1cd57mr33227721plf.8.1663125337759; 
 Tue, 13 Sep 2022 20:15:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6OWxXSvgnVPtfb3mr4Pae6FoPpbPLLktoGUCIhFRMCcmrJtqfcVOgHzIVsHKDRGSRuGe50fA==
X-Received: by 2002:a17:902:f541:b0:176:e8f1:cd57 with SMTP id
 h1-20020a170902f54100b00176e8f1cd57mr33227702plf.8.1663125337540; 
 Tue, 13 Sep 2022 20:15:37 -0700 (PDT)
Received: from [10.72.13.65] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902d2ca00b00174c235e1fdsm9379120plc.199.2022.09.13.20.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 20:15:37 -0700 (PDT)
Message-ID: <51b4e2fb-e904-5552-b356-3a6ddd9c8928@redhat.com>
Date: Wed, 14 Sep 2022 11:15:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 6/6] vhost: vhost-user: enable vq reset feature
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <6349759c3ec0fae409f730dfce70240eb255b608.1662949366.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <6349759c3ec0fae409f730dfce70240eb255b608.1662949366.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.628, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/9/12 11:10, Kangjie Xu 写道:
> Add virtqueue reset feature for vhost-user.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/vhost_net.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 8b80942e7c..ad319faee8 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -74,6 +74,7 @@ static const int user_feature_bits[] = {
>       VIRTIO_NET_F_MTU,
>       VIRTIO_F_IOMMU_PLATFORM,
>       VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_RING_RESET,
>       VIRTIO_NET_F_RSS,
>       VIRTIO_NET_F_HASH_REPORT,
>   


