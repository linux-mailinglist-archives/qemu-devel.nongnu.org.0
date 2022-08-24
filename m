Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D807559F5E7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:08:44 +0200 (CEST)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmNP-0000xq-NL
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmFr-0003Gp-Rk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:00:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmFp-0003yc-NZ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zoa4FDhe/E2JFTulpQ2/I12myUy68JTxJDn4Tk6ABw=;
 b=FX92aGQ5DAH9I/EUf05HUzXP/eIBfAsuelsqOoDoNuxju3og1mrjixwgbPpVnYw2SucBRT
 1Ly7OhtAqmW0DtG5j9kgOhhWtUb0uz03c/C8KCwIuIMk6SYn/nopAn4lZBWd6VAOUGjx/a
 dipzWavSwY0qlnitFew+KiqhV/uGoRQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-HL6j4r-XNzaRgMmX30VQnw-1; Wed, 24 Aug 2022 05:00:51 -0400
X-MC-Unique: HL6j4r-XNzaRgMmX30VQnw-1
Received: by mail-pj1-f70.google.com with SMTP id
 x8-20020a17090a1f8800b001faa9857ef2so562235pja.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1zoa4FDhe/E2JFTulpQ2/I12myUy68JTxJDn4Tk6ABw=;
 b=F0TRiqpDV0MWoRoG9D1Fbc4EwNiZOBBe4Ie/YIk4MsMFPl6xSOwx9zYcyBCF/8r55z
 hKemJX3enwvyZltZ/PUgQXOcIkdApSLaBlN4IHZ9NfTSqU3IMbh+8G9fh1AqMERHeyJv
 61moSiyZHXEsIOiZ8hKECHbZ6iD4FuIe3cS+MCTi9tSX675OApgIBBGHrfwGT2Y1gSsY
 0L7QcOF7yuXdE2USG0CZ4aI7cH3HgGOyMK0qhgsqarBX82UWlC03CYO3eWDB9pUVWapj
 f0aQitKCJeT8tI/Sg12CUvBNcBA6a1xwUd1y89Wf/rSSHoRytsv3VdQsmzr7KOQUkXso
 z2Pw==
X-Gm-Message-State: ACgBeo2YX5fbN7WAdSwVS/heRsX6ntZpHZHe/eTQ8du+MtxLRB7epc2D
 y8+h6UtVALh8mQyh8q224ZrxYMmcKiyK5AjPZfHbWOoMSkzIcZ1MIenvmoQcpFxd+rhzgbdiQvy
 p3+gRlnEiJoXT84k=
X-Received: by 2002:a17:902:b10d:b0:172:a530:dd12 with SMTP id
 q13-20020a170902b10d00b00172a530dd12mr28463542plr.98.1661331650714; 
 Wed, 24 Aug 2022 02:00:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5gMpAgJ+ZEtP+f5cO1wHBl/AgsQQ11hqLPChgVwdJtJxrs3Bzy+CEnN21+kGxt510wLZXKOQ==
X-Received: by 2002:a17:902:b10d:b0:172:a530:dd12 with SMTP id
 q13-20020a170902b10d00b00172a530dd12mr28463520plr.98.1661331650428; 
 Wed, 24 Aug 2022 02:00:50 -0700 (PDT)
Received: from [10.72.13.130] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 lt2-20020a17090b354200b001fabaeb1245sm841587pjb.24.2022.08.24.02.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 02:00:49 -0700 (PDT)
Message-ID: <b727d5d4-eb4c-9e48-4663-8292d9d8a495@redhat.com>
Date: Wed, 24 Aug 2022 17:00:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 11/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <9f5f233aaef3096fa1715095f3c436bb3c855fe5.1660611460.git.kangjie.xu@linux.alibaba.com>
 <11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com>
 <37936da7-0b76-5ec1-2f7e-93e200e29eb2@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <37936da7-0b76-5ec1-2f7e-93e200e29eb2@linux.alibaba.com>
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


在 2022/8/24 11:33, Kangjie Xu 写道:
>
> 在 2022/8/24 10:40, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> Introduce vhost_virtqueue_stop(), which can reset the virtqueue
>>> in the device. Then it will unmap vrings and the desc of the
>>> virtqueue.
>>>
>>> This patch only considers the case for vhost-kernel, when
>>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> ---
>>>   hw/net/vhost_net.c      | 21 +++++++++++++++++++++
>>>   include/net/vhost_net.h |  2 ++
>>>   2 files changed, 23 insertions(+)
>>>
>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>> index ccac5b7a64..aa60dd901c 100644
>>> --- a/hw/net/vhost_net.c
>>> +++ b/hw/net/vhost_net.c
>>> @@ -514,3 +514,24 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>>> uint16_t mtu)
>>>         return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>>>   }
>>> +
>>> +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>>> +                              int vq_index)
>>> +{
>>> +    VHostNetState *net = get_vhost_net(nc->peer);
>>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>>> +    struct vhost_vring_file file = { .fd = -1 };
>>> +    int idx;
>>> +
>>> +    assert(vhost_ops);
>>> +
>>> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>>> +
>>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>>> +        file.index = idx;
>>> +        int r = vhost_net_set_backend(&net->dev, &file);
>>> +        assert(r >= 0);
>>> +    }
>>
>>
>> Let's have a vhost_ops here instead of open code it.
>>
>> Thanks
>>
> I double-checked it, vhost_net_set_backend is already a wrapper of 
> vhost_ops->vhost_net_set_backend().
>
> It seems that, to further simplify it, we can only add idx and fd to 
> the parameter list of vhost_net_set_backend().


Ok, so we can leave it as is. (Probably need a vhost_net_ops in the future).

Thanks


>
> Thanks
>
>>
>>> +
>>> +    vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>>> +}
>>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>>> index 387e913e4e..9b3aaf3814 100644
>>> --- a/include/net/vhost_net.h
>>> +++ b/include/net/vhost_net.h
>>> @@ -48,4 +48,6 @@ uint64_t 
>>> vhost_net_get_acked_features(VHostNetState *net);
>>>     int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>>>   +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState 
>>> *nc,
>>> +                              int vq_index);
>>>   #endif
>


