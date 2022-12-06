Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F06644181
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:46:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2VSH-00018z-WF; Tue, 06 Dec 2022 05:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VSC-00018n-8G
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:45:36 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VS7-00064i-AR
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:45:36 -0500
Received: by mail-wr1-x431.google.com with SMTP id w15so22848340wrl.9
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 02:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FH4sQ4Xat1bWFrlkpM7SE6u725DsxNWh5VFfTlOcGaY=;
 b=i2kW/Sm/Zfbd5zXJ25B9LKp8ixhF658obC8KsozsyTTdobRzOaAbJI8U3lhNkyb0mU
 +5Dym4cRFhzq73i4iLW9BcKY2Ffg7t4oruPZhNT8cnm7IIm0sQ02ZEvSII2RxfdtinF5
 yMbDsuigxL3pdBYLkPW03zo1b5IPkGS+VbKb26Q4wQ1yRd+Jb5sl6Nil5dTfTQvTIcbK
 BCUEfJI65Cuz1mzmA4ms6Ewu+Jb7ZYoAhS+kfX5PPbQbCa4+djhzqhaJI+jVRDXnC/wM
 l/a8STEur0m+yBNIHYDertLM8oEylDvXxD2OYGCUgXmzzGTWcbfvEAD3F8kUfOMtuy6E
 oadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FH4sQ4Xat1bWFrlkpM7SE6u725DsxNWh5VFfTlOcGaY=;
 b=pCvWAnz7UFzZ8BD2KAJfG/Ttc3dNB77EagGFttkaN0I8pI0KNAKg9Z59QUFFEXRFe2
 SavI9PY42j7JhPTrxPNA9w2uM9ZGZV9DysjkvGAG+//kEfP+LrlozqKYdhTXgHVENnQ0
 5HaclTFDqZOrj1BEs8Nd5y7rF2NT4uJXFugf++UbygKedLEQV1iJxmfwsS2BBWNMFf+A
 LlouU6Bb6L6/UmkddpnRKuuvW0I/RHyJJwfUcErc+jSvhf24XLKdNzS64RkX3xFDPsLD
 6dpqhw86o+Z5xUniub97pjO1SqhjyaEhzB8DcRKSoCOdi2imrszmRzXWa8YV4O8xISPH
 WI+A==
X-Gm-Message-State: ANoB5pmv1rc8Awla0lHRUAmSgFi+op5dGNFXO/pEjOPX/7iakOT8M/XL
 jYYylOJmWWZ3bODMi99Z+JT4DA==
X-Google-Smtp-Source: AA0mqf4VoH/CCikfjwimNiPPlSBxJkQlHIsINrnn40gxYuUrYEggApUuY4+5u9TE05BdZwngaSZVXg==
X-Received: by 2002:adf:e2c9:0:b0:241:db86:176d with SMTP id
 d9-20020adfe2c9000000b00241db86176dmr42467092wrj.40.1670323527051; 
 Tue, 06 Dec 2022 02:45:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c00c100b003d1e34bcbb2sm3775395wmm.13.2022.12.06.02.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 02:45:26 -0800 (PST)
Message-ID: <f43a3c8e-e82d-4992-fe5b-9833688277cc@linaro.org>
Date: Tue, 6 Dec 2022 11:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] vhost: configure all host notifiers in a single MR
 transaction
Content-Language: en-US
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>, stefanha@redhat.com, mst@redhat.com,
 jasowang@redhat.com, sgarzare@redhat.com
Cc: cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
References: <20221206081841.2458-1-longpeng2@huawei.com>
 <20221206081841.2458-2-longpeng2@huawei.com>
 <ee85dd7e-7ec0-03f2-ba17-c8e2987f200c@linaro.org>
 <1fc867d6-2c2b-36ca-1154-90ff6fc1b074@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1fc867d6-2c2b-36ca-1154-90ff6fc1b074@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/12/22 11:28, Longpeng (Mike, Cloud Infrastructure Service Product 
Dept.) wrote:
> 
> 
> 在 2022/12/6 17:07, Philippe Mathieu-Daudé 写道:
>> On 6/12/22 09:18, Longpeng(Mike) via wrote:
>>> From: Longpeng <longpeng2@huawei.com>
>>>
>>> This allows the vhost device to batch the setup of all its host 
>>> notifiers.
>>> This significantly reduces the device starting time, e.g. the time spend
>>> on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
>>> and 3 vhost-vDPA generic devices[1] (64vq per device)
>>>
>>> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
>>>
>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>> ---
>>>   hw/virtio/vhost.c | 40 ++++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>> index 7fb008bc9e..16f8391d86 100644
>>> --- a/hw/virtio/vhost.c
>>> +++ b/hw/virtio/vhost.c
>>> @@ -1507,7 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
>>>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice 
>>> *vdev)
>>>   {
>>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>>> -    int i, r, e;
>>> +    int i, n, r, e;
>>>       /* We will pass the notifiers to the kernel, make sure that QEMU
>>>        * doesn't interfere.
>>> @@ -1518,6 +1518,12 @@ int vhost_dev_enable_notifiers(struct 
>>> vhost_dev *hdev, VirtIODevice *vdev)
>>>           goto fail;
>>>       }
>>> +    /*
>>> +     * Batch all the host notifiers in a single transaction to avoid
>>> +     * quadratic time complexity in address_space_update_ioeventfds().
>>> +     */
>>> +    memory_region_transaction_begin();
>>> +
>>>       for (i = 0; i < hdev->nvqs; ++i) {
>>>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
>>> hdev->vq_index + i,
>>>                                            true);
>>> @@ -1527,8 +1533,12 @@ int vhost_dev_enable_notifiers(struct 
>>> vhost_dev *hdev, VirtIODevice *vdev)
>>>           }
>>>       }
>>> +    memory_region_transaction_commit();
>>> +
>>>       return 0;
>>>   fail_vq:
>>> +    /* save i for a second iteration after transaction is committed. */
>>> +    n = i;
>>>       while (--i >= 0) {
>>>           e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
>>> hdev->vq_index + i,
>>>                                            false);
>>> @@ -1536,8 +1546,18 @@ fail_vq:
>>>               error_report("vhost VQ %d notifier cleanup error: %d", 
>>> i, -r);
>>>           }
>>>           assert (e >= 0);
>>> -        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), 
>>> hdev->vq_index + i);
>>>       }
>>> +
>>> +    /*
>>> +     * The transaction expects the ioeventfds to be open when it
>>> +     * commits. Do it now, before the cleanup loop.
>>> +     */
>>> +    memory_region_transaction_commit();
>>> +
>>> +    while (--n >= 0) {
>>> +        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), 
>>> hdev->vq_index + n);
>>> +    }
>>> +
>>>       virtio_device_release_ioeventfd(vdev);
>>>   fail:
>>>       return r;
>>
>> Similarly to patch #2, removing both goto statement in this function 
>> (as a preliminary patch) will 1/ simplify the code 2/ simplify 
>> reviewing your changes, resulting in something like:
>>
>> int vhost_dev_enable_notifiers(struct vhost_dev *hdev,
>>                                 VirtIODevice *vdev)
>> {
>>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>>      int i, r, e;
>>
>>      /* We will pass the notifiers to the kernel, make sure that QEMU
>>       * doesn't interfere.
>>       */
>>      r = virtio_device_grab_ioeventfd(vdev);
>>      if (r < 0) {
>>          error_report("binding does not support host notifiers");
>>          return r;
>>      }
>>
>>      memory_region_transaction_begin();
>>
>>      for (i = 0; i < hdev->nvqs; ++i) {
>>          r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus),
>>                                           hdev->vq_index + i,
>>                                           true);
>>          if (r < 0) {
>>              error_report("vhost VQ %d notifier binding failed: %d",
>>                           i, -r);
>>              while (--i >= 0) {
>>                  e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus),
>>                                                   hdev->vq_index + i,
>>                                                   false);
>>                  if (e < 0) {
>>                      error_report(
>>                                 "vhost VQ %d notifier cleanup error: %d",
>>                                   i, -r);
>>                  }
>>                  assert (e >= 0);
>>                  virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus),
>>                                                   hdev->vq_index + i);
>>              }
>>              virtio_device_release_ioeventfd(vdev);
>>              break;
>>          }
>>      }
>>
>>      memory_region_transaction_commit();
>>
>>      return r;
>> }
>>
>> What do you think?
>>
> Maybe we can use vhost_dev_disable_notifiers to further simplify the 
> error path ?

Good idea, but having the BusState resolved on each call seems a waste.
Eventually factor it out and pass as argument ...

> And we must commit before invoking virtio_bus_cleanup_host_notifier.

... but with that info on top, finally your original patch is simpler.

