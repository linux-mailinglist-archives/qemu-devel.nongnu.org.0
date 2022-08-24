Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE259F25C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:08:42 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhh2-00058Q-SO
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhcF-0008WE-EI
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhcC-0000QY-9O
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661313816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uu29sLnCobkjSyFTAqE+Rg6qGQ6TFHDe9kfCfeOkDl4=;
 b=NGl7uqCkqveSzAIKuTciwvi9IwSkntfDChP7eH+q80lPja3dD6O8kf3lCqZiFoJ5MNWuQI
 KX66UPA3hPPMN2f5Osi9oSQu6TuY9l3wkjHuSMmYjGxGZcYPqOjOo13J485SgiNAEZEPaR
 lZ5rpKDqDj2bvgntmyKr7iZbAPj9EMk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-MNNP4f3BND-2vM7t1buVvw-1; Wed, 24 Aug 2022 00:03:35 -0400
X-MC-Unique: MNNP4f3BND-2vM7t1buVvw-1
Received: by mail-pg1-f200.google.com with SMTP id
 q7-20020a63e947000000b004297f1e1f86so7016781pgj.12
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Uu29sLnCobkjSyFTAqE+Rg6qGQ6TFHDe9kfCfeOkDl4=;
 b=hE6b1RCRekNnhh94iB15HgmGOEEAYrkuhnVTZbPtvanjvU7vBMymDwsBHiwgIsourn
 c7x267XbC7Dizs+ZNssp+53S5RY4x3UsTEqfxlCHjmtgnvXYDbZte+BKtbm5Hepyem0Y
 QZ22BwD0lnA2XWfkY1pXsaUXINhjinzXWYT040YPFhpcUdm5/E8nEA92FB5kewou6obV
 CXzOwkjwDsn0vmbzRduoe6t1atbzgDjTSgDBCB5KRnfTLV07lyrSGmsZakN3lBIZ+y1G
 o+emXLjKeOUkomEPgt8Uf/19GOtTC4FqM8EeqhcKLjw6Ha9JMByFYPRF1+HQF+l5T1YM
 RcYw==
X-Gm-Message-State: ACgBeo2cBxov4iglLvmiUq7n1YS6jFY7LDsb6CCT6p45ZuuN+scQzEtu
 ZtOd5f1p6ILwsEQli+3Sa/whqbKN8z/Jk/MswlWuqr5Hbv8EfhUajlb/UajqdB9hO0hjnVh2QS3
 tbaC3D03rxh2OzBo=
X-Received: by 2002:aa7:9e0c:0:b0:536:3967:5d01 with SMTP id
 y12-20020aa79e0c000000b0053639675d01mr20744328pfq.7.1661313814365; 
 Tue, 23 Aug 2022 21:03:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mQhYBzF5JBH5Wu6ETHrl6lbxoJAe1Y6zU52HMK+0ZXLqSONlYtYncscxdVLijJQXLEKL7JQ==
X-Received: by 2002:aa7:9e0c:0:b0:536:3967:5d01 with SMTP id
 y12-20020aa79e0c000000b0053639675d01mr20744310pfq.7.1661313814073; 
 Tue, 23 Aug 2022 21:03:34 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 ev7-20020a17090aeac700b001fb47692333sm195955pjb.23.2022.08.23.21.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:03:33 -0700 (PDT)
Message-ID: <58558a13-b4c7-ff00-2135-a11816b5bebc@redhat.com>
Date: Wed, 24 Aug 2022 12:03:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 17/24] vhost: vhost-user: update
 vhost_dev_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <8d278f0247085457582a367deb13431c943b8372.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <8d278f0247085457582a367deb13431c943b8372.1660611460.git.kangjie.xu@linux.alibaba.com>
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
> Update vhost_dev_virtqueue_restart() for vhost-user scenario.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a0d6824353..bd90cfe13a 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1937,11 +1937,29 @@ int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
>                                   int idx)
>   {
>       const VhostOps *vhost_ops = hdev->vhost_ops;
> +    int r;
>   
>       assert(vhost_ops);
>   
> -    return vhost_virtqueue_start(hdev,
> -                                 vdev,
> -                                 hdev->vqs + idx,
> -                                 hdev->vq_index + idx);
> +    r = vhost_virtqueue_start(hdev,
> +                              vdev,
> +                              hdev->vqs + idx,
> +                              hdev->vq_index + idx);
> +    if (r < 0) {
> +        goto err_start;
> +    }
> +
> +    if (vhost_ops->vhost_set_single_vring_enable) {
> +        r = vhost_ops->vhost_set_single_vring_enable(hdev,
> +                                                     hdev->vq_index + idx,
> +                                                     1);


Rethink about the name, I think the current names is kind of confusing:

         .vhost_set_single_vring_enable = 
vhost_user_set_single_vring_enable,
         .vhost_set_vring_enable = vhost_user_set_vring_enable,

I wonder if it's better:

1) rename vhost_set_vring_enable to vhost_set_dev_enable()

then we can

2) use vhost_set_vring_enable() for per vq enabling?

Thanks


> +        if (r < 0) {
> +            goto err_start;
> +        }
> +    }
> +
> +    return 0;
> +
> +err_start:
> +    return r;
>   }


