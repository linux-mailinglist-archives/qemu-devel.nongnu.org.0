Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC6622432
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 07:56:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osezT-00027D-2H; Wed, 09 Nov 2022 01:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osezR-00026h-44
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osezP-0005xF-CC
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667976910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pguo/pWe8d1vdj8egXOws2mdw/2t/CoWrxXqRFsAJc4=;
 b=XT8h/KbzRmaDC6boGEWg44f8gmhvwc2U1vSKA3KKQTqBYsLyV0tXVA+OJ7vZkrPzMANMET
 FHoAqMkIJxuWBd1V8FNbl+SpoaywAuC/AK9qf7ZNDPCCNDICISW4RjAw1FAN0maIKX3Nyr
 8X+NfNWJP913js/vcLwWJtdyuRyexAw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-AqOmOuK6M22U-2QzB7BZXw-1; Wed, 09 Nov 2022 01:55:08 -0500
X-MC-Unique: AqOmOuK6M22U-2QzB7BZXw-1
Received: by mail-pj1-f70.google.com with SMTP id
 pa16-20020a17090b265000b0020a71040b4cso7319863pjb.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 22:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pguo/pWe8d1vdj8egXOws2mdw/2t/CoWrxXqRFsAJc4=;
 b=d7yft60Nmt8rFsgNO7ym7YMjMzvFyEAXb5rwEaE0PDeeKeujo4GYvZPexHdbmInf2o
 1VoehCiAOy1e99mDtoSchWYlsnLVU4OYvYgpdeRTV03lznA7qF5WEzV953tbkyFzZ128
 x7mFSJsm3BKKrtZmnVyv7HFZtV48UPQjfd/GSyEavJ83mv0HUL6P2va+ZbjcY5WDJf+v
 Pkup95LotErKpTZqlcTJEQGkgVRVNjUiRQE8KawLNd2zfuI8x7WQxXf45CSeLVrCg4zT
 bRbEV6a4cXroXy+mJUPNC4VorGbJBRueYmSpGZBsVzW8abZgT0JnrQjs6t5MZqFssfJn
 3cvw==
X-Gm-Message-State: ANoB5pmjbDpoc+WNw0rCXHvs6Hc4wPXNVxjiTj+l26EiNOP4NEfr8Tns
 3x2e5OKhrvjGb+bR8RgGq9aQ1rZTTnJvlFUzo5MBC45mhlpbISyduSRapxKdCZA9SLBwNQ2AqkX
 x3bF3+/frXQq0wMc=
X-Received: by 2002:a63:f403:0:b0:470:6ed3:5454 with SMTP id
 g3-20020a63f403000000b004706ed35454mr14127604pgi.191.1667976907951; 
 Tue, 08 Nov 2022 22:55:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7w2vAc8oguzZ1rHEzlSWXNIoHgujCoKhZSegGhYKScloCNbRsi2feRTPQ+mwf7KS0yQsJm7A==
X-Received: by 2002:a63:f403:0:b0:470:6ed3:5454 with SMTP id
 g3-20020a63f403000000b004706ed35454mr14127592pgi.191.1667976907660; 
 Tue, 08 Nov 2022 22:55:07 -0800 (PST)
Received: from [10.72.13.49] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 r7-20020aa79887000000b005360da6b26bsm7499973pfl.159.2022.11.08.22.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 22:55:07 -0800 (PST)
Message-ID: <1e9962cb-6f2d-8e04-522e-4d241c458961@redhat.com>
Date: Wed, 9 Nov 2022 14:55:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
 <20221109014751-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221109014751-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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


在 2022/11/9 14:51, Michael S. Tsirkin 写道:
> On Wed, Nov 09, 2022 at 11:31:23AM +0800, Jason Wang wrote:
>> On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>> On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>>
>>>> Introduce the interface queue_enable() in VirtioDeviceClass and the
>>>> fucntion virtio_queue_enable() in virtio, it can be called when
>>>> VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
>>>> started. It only supports the devices of virtio 1 or later. The
>>>> not-supported devices can only start the virtqueue when DRIVER_OK.
>>>>
>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>> Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>   include/hw/virtio/virtio.h |  2 ++
>>>>   hw/virtio/virtio.c         | 14 ++++++++++++++
>>>>   2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>>>> index 74d76c1dbc..b00b3fcf31 100644
>>>> --- a/include/hw/virtio/virtio.h
>>>> +++ b/include/hw/virtio/virtio.h
>>>> @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
>>>>       void (*reset)(VirtIODevice *vdev);
>>>>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
>>>>       void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
>>>> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
>>>>       /* For transitional devices, this is a bitmap of features
>>>>        * that are only exposed on the legacy interface but not
>>>>        * the modern one.
>>>> @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>>>>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>>>>   void virtio_reset(void *opaque);
>>>>   void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
>>>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
>>>>   void virtio_update_irq(VirtIODevice *vdev);
>>>>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>>>>
>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>> index cf5f9ca387..9683b2e158 100644
>>>> --- a/hw/virtio/virtio.c
>>>> +++ b/hw/virtio/virtio.c
>>>> @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>>>>       __virtio_queue_reset(vdev, queue_index);
>>>>   }
>>>>
>>>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>>>> +{
>>>> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>>>> +
>>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>>>> +        error_report("queue_enable is only suppported in devices of virtio "
>>>> +                     "1.0 or later.");
>>> Why is this triggering here? Maybe virtio_queue_enable() is called too
>>> early. I have verified that the Linux guest driver sets VERSION_1. I
>>> didn't check what SeaBIOS does.
>> Looks like a bug, we should check device features here at least and it
>> should be guest errors instead of error_report() here.
>>
>> Thanks
> But it's weird, queue enable is written before guest features?
> How come?


Or queue_enable is written when the driver doesn't negotiate VERSION_1?

Thanks


>
>>> $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
>>> file,node-name=drive0,filename=test.img -device
>>> virtio-blk-pci,drive=drive0
>>> qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
>>>
>>> Stefan
>>>


