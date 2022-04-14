Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC63B5004DC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:54:19 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqYk-0008Lh-QM
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqWI-0004Nm-7S
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqWG-0005Ge-Ji
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkMmaOgC6dg1oxH8dcQMnnNtyXz42hucAwsC7WmLs5o=;
 b=SuYSIhKdMPbzh9JlpizaiAzEQqZQ4miETqj684pO+Bl4hUU9a5kdnOuGt8VZdUvKwMlsD0
 fC+nX8XyOUB3NMljafMqeXbBwVwUNXsQ/UpiJzLoXajITq76Dq0RWu5vehGtWFRFtxWQou
 xDRBqsJuj3gdFAuQiOUMv4P/qdNWpqc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-L6VIeLO6NsSciu_0Gqyqyg-1; Wed, 13 Apr 2022 23:51:40 -0400
X-MC-Unique: L6VIeLO6NsSciu_0Gqyqyg-1
Received: by mail-pj1-f72.google.com with SMTP id
 d11-20020a17090a628b00b001ca8fc92b9eso2194656pjj.9
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkMmaOgC6dg1oxH8dcQMnnNtyXz42hucAwsC7WmLs5o=;
 b=iPkFkZYsI8mVvBJC4nGRPcUCaiQj66XTM3QBNQCHIi8V9ForzCb/r2MS9f5j1MUuGI
 jPeqVKYYJFrxXcsQnt5Q7kjKE2uC0wnkeZMSxtQzJK8OExWqX742r+ryy8L/L9NcN+zA
 Ha9GYRaGE5rCNIldY6sp8eCN5EIvN5siEfGK10ztkW+8zE6c7UPmepOcGP+/rNoYNttk
 hp08y4+x+pxGHrfCKKy7WDUozt3FW7/cSrXP9vLZYEGHQ66/HkvxvUlwG4xF96oJuWnT
 sWdPhNVRRnnfHcwomujaotHfawwxMrLaPe2fKzt92XL29n/ws0ZMobCb/EYCYTEej44Y
 Z/+Q==
X-Gm-Message-State: AOAM530cZNlJg3Tc8ny+/WP4xWvrCkC3fyipeqbXQmvg81yf2H0WrSuY
 U4qeft0LBnlTe1zNrBvyXzKJpd3GI7YhsJpeUKbNT3cH199qyRMcigUQeSCTIwTfLTEkflRuEII
 EG2q1uerc041zeBQ=
X-Received: by 2002:a17:902:6b01:b0:158:be18:5be7 with SMTP id
 o1-20020a1709026b0100b00158be185be7mr329003plk.112.1649908298964; 
 Wed, 13 Apr 2022 20:51:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzQDnY4AN1bMKN1QzxgS87UFmdwp+W1Ut88WsqiWJZm7PoXDawAR+zx3/eO7qid9LU7IiNBA==
X-Received: by 2002:a17:902:6b01:b0:158:be18:5be7 with SMTP id
 o1-20020a1709026b0100b00158be185be7mr328984plk.112.1649908298657; 
 Wed, 13 Apr 2022 20:51:38 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 8-20020a056a00070800b004e14ae3e8d7sm518634pfl.164.2022.04.13.20.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:51:38 -0700 (PDT)
Message-ID: <76ebe2f6-222d-590e-d4cd-441fd89ea7b1@redhat.com>
Date: Thu, 14 Apr 2022 11:51:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 05/25] hw/virtio: Replace g_memdup() by g_memdup2()
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-6-eperezma@redhat.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>
>    The old API took the size of the memory to duplicate as a guint,
>    whereas most memory functions take memory sizes as a gsize. This
>    made it easy to accidentally pass a gsize to g_memdup(). For large
>    values, that would lead to a silent truncation of the size from 64
>    to 32 bits, and result in a heap area being returned which is
>    significantly smaller than what the caller expects. This can likely
>    be exploited in various modules to cause a heap buffer overflow.
>
> Replace g_memdup() by the safer g_memdup2() wrapper.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/net/virtio-net.c       | 3 ++-
>   hw/virtio/virtio-crypto.c | 6 +++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72b39..e4748a7e6c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>           }
>   
>           iov_cnt = elem->out_num;
> -        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
> +        iov2 = iov = g_memdup2(elem->out_sg,
> +                               sizeof(struct iovec) * elem->out_num);
>           s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
>           iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
>           if (s != sizeof(ctrl)) {
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index dcd80b904d..0e31e3cc04 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>           }
>   
>           out_num = elem->out_num;
> -        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
> +        out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
>           out_iov = out_iov_copy;
>   
>           in_num = elem->in_num;
> @@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
>       }
>   
>       out_num = elem->out_num;
> -    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
> +    out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
>       out_iov = out_iov_copy;
>   
>       in_num = elem->in_num;
> -    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
> +    in_iov_copy = g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
>       in_iov = in_iov_copy;
>   
>       if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))


