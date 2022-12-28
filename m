Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86A6576D9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWGF-00011z-8a; Wed, 28 Dec 2022 08:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAWGD-00011a-4V
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:14:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAWGB-0006zL-Ft
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:14:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8047989wms.5
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhDpdE81KefS0SfBEa06G7jCVo5Es9/aTeB29D77cr0=;
 b=HdnT1ahWgIQ4alcsdKSkhN1rbyYbaBET2h51JMnJ/1yo5ii49Xff7pUdC9vzMz9Wf/
 zND/Z5lZliXuj1eUp9tv14eKiPzMB9aE/PJfFmpvDSfZM+ZjqqSRJh04N4ZRPibfUtEb
 lDHCdLug83Qkz5l/Okn7ttEvovRifz8i+IAuAG93mmbnEewiCm4SHlBwQjfyVt8YxHNO
 MnMheyhFTi1fY4t+98jWFCQmO5dg5GoIgxsPxVjl4OhF90H602eifQM/3BCmlqP8h8Fq
 UA1ZwXbpfTdF4xyM2V4x6ntPgaoOP3P6vqnbMsFYs/tWTfb697xjQUfqHcWCtpMWEXF/
 gVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhDpdE81KefS0SfBEa06G7jCVo5Es9/aTeB29D77cr0=;
 b=yaCbwbiQqwgq9RKdpfElnMekCz3i3l9nxIni4743J4/hxEqSkrtxAygaf8zvvgBj/S
 df78ZWh21OaeUO3kPOExxLvDjQ2e9fP/rm8gvsk49uK6oYXBYVF3nbVkReC7PsuNeS/o
 wiveiyzXVdV8JMOretjgCn4zMuvOy2s52tmMU/i0c+He36SsHVfU75gLvIMy5TF+TEpp
 h8RnY7HFtvhd2nO3ZlDVkvBQ96IodSeH/Co5i2ktPOiIdPenFIjMPBJtpbfKH6Ufyksm
 Tm1n1zY7N8bEw9cif9JJ4iMOWG6xgicxzoCMCUWuZGHfn71M0RPqrXFL7jKd8ZrG/h5x
 dyww==
X-Gm-Message-State: AFqh2krIpcwtxarOGPVrvktqlavOSsUjlPpqcR6/7RpvDes+dwjtg/5/
 IXGuNb+7NO+cgQYbjs76ZTqAvw==
X-Google-Smtp-Source: AMrXdXugli4PKlg4UPIqy6XMvMDl/FYzc+MCcxVZdo91lGKhmC9RUp0hkKf56fvBFp9xHtrjWBsB0Q==
X-Received: by 2002:a05:600c:4e51:b0:3d1:e1f4:21d1 with SMTP id
 e17-20020a05600c4e5100b003d1e1f421d1mr22873382wmq.26.1672233258017; 
 Wed, 28 Dec 2022 05:14:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003cf5ec79bf9sm18304423wmo.40.2022.12.28.05.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:14:17 -0800 (PST)
Message-ID: <619d5b9e-ff46-fbde-6a25-39e8bf1bc106@linaro.org>
Date: Wed, 28 Dec 2022 14:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] vdpa: commit all host notifier MRs in a single MR
 transaction
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 jasowang@redhat.com, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, cohuck@redhat.com,
 sgarzare@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-4-longpeng2@huawei.com>
 <3cdfb4fc-70a9-db51-ac49-4ba984a3045a@linaro.org>
 <20221227125521-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221227125521-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 27/12/22 18:56, Michael S. Tsirkin wrote:
> On Tue, Dec 27, 2022 at 05:51:47PM +0100, Philippe Mathieu-Daudé wrote:
>> On 27/12/22 08:20, Longpeng(Mike) wrote:
>>> From: Longpeng <longpeng2@huawei.com>
>>>
>>> This allows the vhost-vdpa device to batch the setup of all its MRs of
>>> host notifiers.
>>>
>>> This significantly reduces the device starting time, e.g. the time spend
>>> on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
>>> 64 vCPUs and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device).
>>>
>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++------
>>>    1 file changed, 19 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index fd0c33b0e1..870265188a 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -512,9 +512,18 @@ static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
>>>    {
>>>        int i;
>>> +    /*
>>> +     * Pack all the changes to the memory regions in a single
>>> +     * transaction to avoid a few updating of the address space
>>> +     * topology.
>>> +     */
>>> +    memory_region_transaction_begin();
>>> +
>>>        for (i = dev->vq_index; i < dev->vq_index + n; i++) {
>>>            vhost_vdpa_host_notifier_uninit(dev, i);
>>>        }
>>> +
>>> +    memory_region_transaction_commit();
>>>    }
>>
>> Instead of optimizing one frontend, I wonder if we shouldn't expose
>> a 'bool memory_region_transaction_in_progress()' helper in memory.c,
>> and in virtio_queue_set_host_notifier_mr() backend, assert we are
>> within a transaction. That way we'd optimize all virtio frontends.
> 
> 
> If we are doing something like this, I'd rather pass around
> a "transaction" structure so this can be checked statically.

Ah, clever.

> Looks like something that can be done on top though.

Sure.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



