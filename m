Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950E5B7F38
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 05:14:51 +0200 (CEST)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYIrS-0005aL-Bq
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 23:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIqI-0004E2-M2
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIqG-0002Bz-Tt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663125216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynRa+ACsY/FDpV5cjj0vXDa0FAq8XmAqVQ7y6FhtfH8=;
 b=e+lmPdxSUd71119JjvY3PE6ax8PCSUuzAKOy75VNF6InfVUwvSvkbpXbZToUNeWoHfmMi7
 DG/Jw3q21XAZ2GgGOpOp9SvXoPVWuSPK/l4EMb3nQBmJwLUcw3hAvEDvblEyQKNZecjFJv
 5K25IpVD26e15G/gQ0Uv13W7VEZv9+Y=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-cf1rjt5XMduyzPixphNQNA-1; Tue, 13 Sep 2022 23:13:35 -0400
X-MC-Unique: cf1rjt5XMduyzPixphNQNA-1
Received: by mail-pj1-f71.google.com with SMTP id
 a24-20020a17090a8c1800b0020266349974so11041577pjo.8
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 20:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ynRa+ACsY/FDpV5cjj0vXDa0FAq8XmAqVQ7y6FhtfH8=;
 b=euCahbSGyRssDnRWhfRQ8lFo9EztxduYEccVqi4Mv6sRLojQ6J/Yj1XQBUSKwuGXin
 RssrWRuFhrBIxKcWJoS5MZRBtZpgooJUJr0te72oTh9pggt6wm2UbADCljDGuBqvPgf3
 k1iV/Vj0IWdV3DMXAaTt486Yij95pa0JtdAiumzoAjB2WHuNS8YCNe8p5gigObre+KdJ
 kbOKmp7AIqCyE5A3xWa7McUbXjjZ4Wx/fJBhRaKA0zXeJE3i4KVyQtevSzEAfow/RprE
 Zq2akqNMMWSEBCt9HFGf7zWmxGjNHKz3F5kpd5KWer+L9Dfppkhpby9xOQRtMaiEdRuq
 bedg==
X-Gm-Message-State: ACgBeo19WCSacOx7jTARb3I9b1CudsC2xHdkbN5gN82QpQIO32SXvIkv
 yKOzSR2awUhCHnjzx+xW9HLVlA24WONKE9so78rEMJiWP8nlzc5tEM/9qpjCpiMJj0oCXnEQlXv
 ri83DZOkAFWaq9kA=
X-Received: by 2002:a17:902:c189:b0:176:b871:8a1 with SMTP id
 d9-20020a170902c18900b00176b87108a1mr34510591pld.30.1663125214109; 
 Tue, 13 Sep 2022 20:13:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56JIALfiNq8ftFik1iR+pItcWZ3OqXu1fID/UXgDhTSHnqBGworye1aEVewJznVilSHpY1ag==
X-Received: by 2002:a17:902:c189:b0:176:b871:8a1 with SMTP id
 d9-20020a170902c18900b00176b87108a1mr34510569pld.30.1663125213855; 
 Tue, 13 Sep 2022 20:13:33 -0700 (PDT)
Received: from [10.72.13.65] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a17090301c200b001754e086eb3sm9307761plh.302.2022.09.13.20.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 20:13:33 -0700 (PDT)
Message-ID: <ac7dacaf-ea85-b608-4047-27254aefd97a@redhat.com>
Date: Wed, 14 Sep 2022 11:13:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/6] vhost-net: vhost-user: update
 vhost_net_virtqueue_reset()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <a14f5ebdefb82d7679841c1d5ddab54ec9406ea1.1662949366.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a14f5ebdefb82d7679841c1d5ddab54ec9406ea1.1662949366.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> Update vhost_net_virtqueue_reset() for vhost-user scenario.
>
> In order to reuse some functions, we process the idx for
> vhost-user scenario because vhost_get_vq_index behave
> differently for vhost-user.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ea896ea75b..25e5665489 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -545,6 +545,9 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>       assert(vhost_ops);
>   
>       idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        idx -= net->dev.vq_index;
> +    }


This looks tricky. Any reason we can't simply use vq_index for both 
vhost-user and vhost-net?

Thanks


>   
>       if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>           file.index = idx;


