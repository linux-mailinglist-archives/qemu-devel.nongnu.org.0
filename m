Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733454B42F0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:39:53 +0100 (CET)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJVxg-0005Oo-4f
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:39:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nJVrk-0003XL-Qb
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:33:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nJVrf-0007vG-Ke
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644824017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyysezMjWhwj6IpGTsGbzEPphoKnDCWoC96243wdP44=;
 b=HdH2845LL3vRz2EzkxEuAv4lp5EXuvOTxdM2h2frn/j0epyTaYr+0URlvGidbcVwLroi2y
 JIfg7NHFGY7IK6bwN41l7ZT02qfzYnMJ+AFxN0rEwHUbR0VSn/apxjh492GllTp1cMta+C
 Nuc6YNPz/jr5hCm6PMjl3VQD5E6cD7I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-21XUuG-2P2qDkiB4UKL_fQ-1; Mon, 14 Feb 2022 02:33:36 -0500
X-MC-Unique: 21XUuG-2P2qDkiB4UKL_fQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so6534022wra.16
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tyysezMjWhwj6IpGTsGbzEPphoKnDCWoC96243wdP44=;
 b=vNawQrbFmGLMLiPk3eeEiajNNOS5iq+k2NkGn6/FV1+izol+ZIf7VDOSOH4D3AeoR+
 W8SNI1PEaV+oMYoywfhtsFRcbGS+y2YCJXB2YhOTPAfm0wRTQu1oQdbXx9cajCWDQJaB
 WLTi05MxnlTp/cOJbk8qxG55fiaZTjlkaInekfk/d54yR4K8hoc7Li3HSLnHcuxJEGkO
 WwUzeRT70ikd+jmJrQLIO+GiOT8MOqfFJFh2FINDz8Tz3ERUpW1JQdUrAlP/nh/r/J4H
 e+oTL0IbIGzKyDO4qpf2oZFtKbMAe6yhCSIV6hOHCs5eq0CZldpF+bC3KA9SlKx3vHOW
 4p3w==
X-Gm-Message-State: AOAM530NuQNMer/wpzvRlFnZ4lEDILMeByly7MdJCZ2XBrHjC9J9HbNp
 CPyw/X+N63fDCb0IJwfHAVZ/AN2EK1CallIpTqy8PnNHWM/A5Gm9Xb2ZixPRbnJpFEd6GNiTqhT
 XbyHahhHc7tZOzrk=
X-Received: by 2002:a05:600c:4995:: with SMTP id
 h21mr824313wmp.71.1644824014973; 
 Sun, 13 Feb 2022 23:33:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcfDET0y0j7gWlLSoIWez1k38Seg2RxnHl2PvfrmXKKmZRqLpjcw2Ui2wqDOvxQzLBGHPJYg==
X-Received: by 2002:a05:600c:4995:: with SMTP id
 h21mr824298wmp.71.1644824014710; 
 Sun, 13 Feb 2022 23:33:34 -0800 (PST)
Received: from [192.168.100.42] ([82.142.13.146])
 by smtp.gmail.com with ESMTPSA id d12sm20104295wrx.47.2022.02.13.23.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 23:33:34 -0800 (PST)
Message-ID: <95a5bf33-27d8-0be4-7a47-d12a90875e48@redhat.com>
Date: Mon, 14 Feb 2022 08:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC] vhost-vdpa: make notifiers _init()/_uninit() symmetric
To: Jason Wang <jasowang@redhat.com>
References: <20220211161309.1385839-1-lvivier@redhat.com>
 <CACGkMEuzDjt5Moyt=NdUhx4hCDq4marCDa+6Ko5pnF10uipSzA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CACGkMEuzDjt5Moyt=NdUhx4hCDq4marCDa+6Ko5pnF10uipSzA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/02/2022 04:20, Jason Wang wrote:
> On Sat, Feb 12, 2022 at 12:13 AM Laurent Vivier <lvivier@redhat.com> wrote:
>>
>> vhost_vdpa_host_notifiers_init() initializes queue notifiers
>> for queues "dev->vq_index" to queue "dev->vq_index + dev->nvqs",
>> whereas vhost_vdpa_host_notifiers_uninit() uninitializes the
>> same notifiers for queue "0" to queue "dev->nvqs".
>>
>> This asymmetry seems buggy, fix that by using dev->vq_index
>> as the base for both.
>>
>> Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
>> Cc: jasowang@redhat.com
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   hw/virtio/vhost-vdpa.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 04ea43704f5d..9be3dc66580c 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -395,15 +395,6 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>>       }
>>   }
>>
>> -static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
>> -{
>> -    int i;
>> -
>> -    for (i = 0; i < n; i++) {
>> -        vhost_vdpa_host_notifier_uninit(dev, i);
>> -    }
>> -}
>> -
>>   static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
>>   {
>>       size_t page_size = qemu_real_host_page_size;
>> @@ -442,6 +433,15 @@ err:
>>       return -1;
>>   }
>>
>> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
>> +{
>> +    int i;
>> +
>> +    for (i = dev->vq_index; i < dev->vq_index + n; i++) {
>> +        vhost_vdpa_host_notifier_uninit(dev, i);
>> +    }
>> +}
> 
> Patch looks good but I wonder why we need to move this function?

I moved the _uninit function close to the _init one to be able to compare them easier.
I think it will help reviewers in the future if code is side-by-side.

But we can let it at its original place.

Thanks,
Laurent


