Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034559F605
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:14:36 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmT5-0007JO-Ab
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmJg-0007J7-JW
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmJe-0004JL-4l
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9egpvCvlPo+6fmcvXRh8QUA5DntlrXRLz6LoUh/wnM=;
 b=MIdrgmtRW9+i44YZXH6R11p6DAjEi5FXZpAqFuJotVK/YLALJUwRxN1k+dL6CzELagGEiO
 Ux0mve3hv3aCZsM4wIa35ro1qFZt5jDZLniLYW91DF7AoNng+AfeOUJXRw/43+8+W6CDMP
 9zqjvmYdi3K1ImckpfC9tir9xG67iek=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-r_hP-eBLN0Cq_xLVuKfElw-1; Wed, 24 Aug 2022 05:04:46 -0400
X-MC-Unique: r_hP-eBLN0Cq_xLVuKfElw-1
Received: by mail-pj1-f69.google.com with SMTP id
 k1-20020a17090a658100b001fb35f86ccdso629897pjj.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=g9egpvCvlPo+6fmcvXRh8QUA5DntlrXRLz6LoUh/wnM=;
 b=TwK/MttQ+PF57Kg221Lj27ziBbda0Aa4DPSRAAEON0frRGaH3cN1XzI17qi1LgZ+Oj
 10uk4Jmhc+xWWwHzJlyyWfv9sQ3NeSUeYj9LbhxNn5vWd0ShAjdXLiblCLnjIXX1bj3t
 JoVJsjAs1Z2fDgzOJGrUth5lrvCCbFU9z2w/JB+yoo2DKy+nDmHrhUfE4Y3G02n49U/1
 eQll2+bZeu9jvz5+6dY5pQEvYPNtBgMhmQn/yKbiT7fV4jJwjr88hRSMXTt9xdwMtwMK
 PpHSAdyJ+L5+6ej/Vnye8fh+RehGZ0uHsWcWMcLagY5nz17M/O48ogb/jpQmStZgq5oy
 wfew==
X-Gm-Message-State: ACgBeo3TFAcB7hh4W9MsiJnFZvkVsY9B8+hsXpGQxtmKc7z7SJqoIMhT
 HeiYApXXpfxuVTQqhiAiRqq7+JGvCrNeqcSCUtbxIclaWtlUJ6Li5FZ4ZzBO185gVjdyDaeGNiv
 SvGdwsx7JxQEjhmo=
X-Received: by 2002:a17:902:f644:b0:172:b074:d1f5 with SMTP id
 m4-20020a170902f64400b00172b074d1f5mr27739997plg.29.1661331885159; 
 Wed, 24 Aug 2022 02:04:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4fRqpiipdrUL21oPO5PtHoz7Py0QdioxAVGkU6S0jE9ItKJbqiu6l3p5+23J2J+p9pTivCVg==
X-Received: by 2002:a17:902:f644:b0:172:b074:d1f5 with SMTP id
 m4-20020a170902f64400b00172b074d1f5mr27739982plg.29.1661331884877; 
 Wed, 24 Aug 2022 02:04:44 -0700 (PDT)
Received: from [10.72.13.130] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170903028300b00172e97382cdsm6279557plr.285.2022.08.24.02.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 02:04:44 -0700 (PDT)
Message-ID: <f3293e23-feec-3388-18e5-6db6b78bdd51@redhat.com>
Date: Wed, 24 Aug 2022 17:04:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 18/24] vhost-net: vhost-user: update
 vhost_net_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <303811ffeac48647ac4c81eeec542292e8f67a0e.1660611460.git.kangjie.xu@linux.alibaba.com>
 <3b60bcab-f69b-7ec9-caa8-c5947a14b659@redhat.com>
 <ecce701d-3bec-b98e-6d46-5ca85542ef87@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <ecce701d-3bec-b98e-6d46-5ca85542ef87@linux.alibaba.com>
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


在 2022/8/24 12:57, Kangjie Xu 写道:
>
> 在 2022/8/24 12:05, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> Update vhost_net_virtqueue_stop() for vhost-user scenario.
>>
>>
>> Let's explain why it is needed now or why it doesn't cause any issue 
>> or it's a bug fix or not.
>>
>> Thanks
>>
> This patch is to suppport vq reset for vhost-user.
>
> We need this simply because the behavior of vhost_ops->get_vq_index() 
> is different in vhost-user and vhost-kernel.
>
> vhost_user_get_vq_index(dev, idx) simply returns "idx".
>
> vhost_kernel_get_vq_index(dev, idx) returns "idx - dev->vq_index".
>
> Thanks


Let's add them in the change-log in the next version.

But the question still, is this a bug fix (requires a Fixes tag)? If not 
why do we need this now?

Thanks


>
>>
>>>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> ---
>>>   hw/net/vhost_net.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>> index 2ab67e875e..c0d408f3b4 100644
>>> --- a/hw/net/vhost_net.c
>>> +++ b/hw/net/vhost_net.c
>>> @@ -533,6 +533,10 @@ void vhost_net_virtqueue_stop(VirtIODevice 
>>> *vdev, NetClientState *nc,
>>>           assert(r >= 0);
>>>       }
>>>   +    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
>>> +        idx = idx - net->dev.vq_index;
>>> +    }
>>> +
>>>       vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>>>   }
>


