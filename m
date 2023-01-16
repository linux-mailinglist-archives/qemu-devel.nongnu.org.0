Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C266B7A0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 07:49:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJIF-0003n0-Ga; Mon, 16 Jan 2023 01:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJIE-0003mo-7V
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJIC-0007o8-8p
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673851707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5TWiK+o6co/BBCboWsOfP3a6Ckym/jkfxjRcGYDYUM=;
 b=cNRiB4Ov/wp1UhimZPX2GW6b7O7vT6x/G4UozdA3pJrBbuSjccF29MnxH1rO+9GeenUIc/
 JYeUlkpkjDFRYu+9aPA8sUXXKmD+WW0kQTmFjesC4tRCbIWRiuWTPG1R7D3MF2cJ/JWmE9
 9GbKJtmVYvIZ12j/+atf+cbSatdt0cI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-1HxdllgcPKOzDVWtlZuQFQ-1; Mon, 16 Jan 2023 01:48:26 -0500
X-MC-Unique: 1HxdllgcPKOzDVWtlZuQFQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 k5-20020a170902c40500b001947b539123so4200193plk.19
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 22:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z5TWiK+o6co/BBCboWsOfP3a6Ckym/jkfxjRcGYDYUM=;
 b=WzKTERvpGkYFM0+x9BYsgHNVv6Ik6xRz7UHVIio7/JlUm/sNAjJC/wkeLN6x1aZQ8C
 a8eKAsU2VenVxfubrrDGSiFxPyB25dNjQ0mdoSjxcL5MSt4svGr8p75OT90Od8CEyEho
 gbjEA20ZtD0X3jhwJ3np9OyI/3eETY6RAfxZpFcKtxbp12I9NeKG3VqC6gSP0LkJQNSH
 OO29S3IYYsFylLUxk9CVs3bNN2lOIgiHP4d93Mt7Ibsq2OzgREDXvXgDv+kHm0OWyBNw
 tPNUyAOTp4dmB3NEW4SA6bMUSKNSDCIPQNkSOOYOnPYropxCjQ+dvWMnPSfTsHLFMgS0
 665w==
X-Gm-Message-State: AFqh2krH0Hn+KEdyHSBHLcM4JBck8eP2d5JkTDpMyna8zY+o8DJKgTTf
 f/sW7DkiZg6N/b6jH9FLcTow+dlZ10/T2tGDAuO/dkX/QyYjf+D4hEx57QSGbcTLMtnx8tRJ+5k
 u8bSb4aRSe/Q4hWA=
X-Received: by 2002:a62:1a0d:0:b0:582:7664:e912 with SMTP id
 a13-20020a621a0d000000b005827664e912mr47303151pfa.12.1673851705252; 
 Sun, 15 Jan 2023 22:48:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvGEKy2MMlzTq8u2/FbueCzvHBKD6omHWoGtB5G75n7thWrJE45kfBjf5DT2MvGgl401vqYw==
X-Received: by 2002:a62:1a0d:0:b0:582:7664:e912 with SMTP id
 a13-20020a621a0d000000b005827664e912mr47303124pfa.12.1673851704892; 
 Sun, 15 Jan 2023 22:48:24 -0800 (PST)
Received: from [10.72.13.212] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 5-20020a621505000000b005772d55df03sm17396538pfv.35.2023.01.15.22.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 22:48:24 -0800 (PST)
Message-ID: <d94e8807-f828-cfa9-a63b-85365c3b1e25@redhat.com>
Date: Mon, 16 Jan 2023 14:48:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 08/13] vdpa: Negotiate _F_SUSPEND feature
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-9-eperezma@redhat.com>
 <CACGkMEuAbJq=uTgeZAPhiJVwbR5UuF9k+5pbFU9OwtiD+Om33w@mail.gmail.com>
 <CAJaqyWe7+4GtXjjdvYF1BWKXXR5A1HWueH9k2unOpmTuv7xSiQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWe7+4GtXjjdvYF1BWKXXR5A1HWueH9k2unOpmTuv7xSiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/1/13 16:45, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 5:39 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 1:25 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> This is needed for qemu to know it can suspend the device to retrieve
>>> its status and enable SVQ with it, so all the process is transparent to
>>> the guest.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>>
>> We probably need to add the resume in the future to have a quick
>> recovery from migration failures.
>>
> The capability of a resume can be useful here but only in a small
> window. During the most time of the migration SVQ is enabled, so in
> the event of a migration failure we may need to reset the whole device
> to enable passthrough again.


Yes.


>
> But maybe is it worth giving a quick review and adding some TODOs
> where it can be useful in this series?


We can start by having a TODO in this series, and leave resume in for 
the future.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>> ---
>>>   hw/virtio/vhost-vdpa.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 4296427a69..a61a6b2a74 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -659,7 +659,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>>>       uint64_t features;
>>>       uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
>>>           0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
>>> -        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
>>> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
>>> +        0x1ULL << VHOST_BACKEND_F_SUSPEND;
>>>       int r;
>>>
>>>       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
>>> --
>>> 2.31.1
>>>


