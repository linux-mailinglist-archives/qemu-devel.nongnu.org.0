Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F459F172
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:43:19 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgMQ-0007E2-9A
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgKN-0005E3-BT
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgKL-0005m4-8h
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661308868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxuPF7zzV+qvxvmdN0P7J2SpIa5S9uRmhv5fM8nW7H8=;
 b=TNvML7sq93101jNgwfj79RPVC4g9k9KwO3WuqZL7EeV6PDdZ65JumbsXK+7Vfelyw1cvup
 iguqpMjRooa5JKKB245GEI43tmIyvgzGGLpVJ0JabTu3z27z+1XqRHgAcaIbnp8XgCnlhL
 x2OOY2ijNcgEard4jOYGMuDjqSKzWoM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-SbIhyJ5zM-qx6vNZqDdG_w-1; Tue, 23 Aug 2022 22:41:07 -0400
X-MC-Unique: SbIhyJ5zM-qx6vNZqDdG_w-1
Received: by mail-pj1-f71.google.com with SMTP id
 bf3-20020a17090b0b0300b001fb29d80046so3039653pjb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=nxuPF7zzV+qvxvmdN0P7J2SpIa5S9uRmhv5fM8nW7H8=;
 b=0l2ofSl2JE6jQ4hnVwimkDEwxGHQkqVORrFh+9Ca9H/kHYa2VBY0MeP+RppyQPI5Im
 Q4YncpQCqxnkGBxszArPzT24Ui0lxlgfS4BDbIJvZiIvRF0tFbw3yvaupGnhCSHVEaHb
 xDZ5VRwRB8WKJqY7+Ymkmg/eX+d+SgzwAZ02qxMaGM+W/xRNmPHe9y8QyN6o1ZPyRY6o
 rpMt/9ycamR90vDtqgviO5BNaBeJhZ6V3523eBOJwYS+gFOBtw7lyfhZsrc1cwp5TljV
 eJiQzOIBmptvoawghmbaHZ+P9YSs9QBMFIbLTd8orz6W83iHH/uim+KzibwIJdITcIvx
 YLsA==
X-Gm-Message-State: ACgBeo2Ggh9U3Xm03Z0uHJMSf1Kq1bEXUs5AZstVr1UQ31LqU2z7S7ah
 Vo4K88a3SXOwHvef5AINxYtb9Pca4aIsCVvW53aJw5D+qyvznQiSqGO9ldv+CCl7w21FtGP7uO9
 rOw84w0o3lIit5qY=
X-Received: by 2002:a05:6a02:181:b0:42a:93ba:a4d4 with SMTP id
 bj1-20020a056a02018100b0042a93baa4d4mr12630018pgb.286.1661308866201; 
 Tue, 23 Aug 2022 19:41:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4b9c9SYG8Mt+BNbW8RJUwBErdjjT5yH+YaeuPgSXspn6UXiXQHFDdzFN2fQKJjOe3AZA5XKA==
X-Received: by 2002:a05:6a02:181:b0:42a:93ba:a4d4 with SMTP id
 bj1-20020a056a02018100b0042a93baa4d4mr12630003pgb.286.1661308865911; 
 Tue, 23 Aug 2022 19:41:05 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a17090a448f00b001faf7a88138sm80764pjg.42.2022.08.23.19.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:41:05 -0700 (PDT)
Message-ID: <1b1a41cd-b63a-c25c-aac6-999168b5b040@redhat.com>
Date: Wed, 24 Aug 2022 10:40:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 09/24] vhost: introduce vhost_dev_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d10274ce04b729e92402a040af7c4d9d23a4824d.1660611460.git.kangjie.xu@linux.alibaba.com>
 <3995c3ff-2806-b1aa-12e0-f4026253219d@redhat.com>
 <82e5afa4-f949-3291-90f4-3ee4ac440721@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <82e5afa4-f949-3291-90f4-3ee4ac440721@linux.alibaba.com>
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


在 2022/8/23 16:03, Kangjie Xu 写道:
>
> 在 2022/8/23 15:52, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> Introduce vhost_dev_virtqueue_stop(), which can ummap the
>>> vrings and the desc of it.
>>>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> ---
>>>   hw/virtio/vhost.c         | 9 +++++++++
>>>   include/hw/virtio/vhost.h | 3 +++
>>>   2 files changed, 12 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>> index e467dfc7bc..1bca9ff48d 100644
>>> --- a/hw/virtio/vhost.c
>>> +++ b/hw/virtio/vhost.c
>>> @@ -1904,3 +1904,12 @@ int vhost_net_set_backend(struct vhost_dev 
>>> *hdev,
>>>         return -ENOSYS;
>>>   }
>>> +
>>> +void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice 
>>> *vdev,
>>> +                              int idx)
>>> +{
>>> +    vhost_virtqueue_unmap(hdev,
>>> +                          vdev,
>>> +                          hdev->vqs + idx,
>>> +                          idx);
>>
>>
>> So I think the unmap is not sufficient, we need backend specific 
>> support. E.g for vhost kernel, need a SET_BACKEND here?
>>
>> Thanks
>>
> But SET_BACKEND of vhost-net needs a parameter fd in vhost_vring_file: 
> that is net->backend of VHostNetState.
>
> If we add the fd parameter or struct vhost_vring_file to 
> vhost_dev_virtqueue_stop/restart, it exposes some implementation 
> details in the parameter list.
>
> And that seems not good? So I put SET_BACKEND in the vhost-net module. 
> The workflow is similar to vhost_net_start_one().


That looks fine.

Thanks


>
> Thanks
>
>>
>>> +}
>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>> index a346f23d13..574888440c 100644
>>> --- a/include/hw/virtio/vhost.h
>>> +++ b/include/hw/virtio/vhost.h
>>> @@ -288,4 +288,7 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
>>>                              struct vhost_inflight *inflight);
>>>   int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t 
>>> queue_size,
>>>                              struct vhost_inflight *inflight);
>>> +
>>> +void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice 
>>> *vdev,
>>> +                              int idx);
>>>   #endif
>


