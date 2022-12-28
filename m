Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F36576D8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:13:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWEv-0000L1-AK; Wed, 28 Dec 2022 08:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAWEt-0000Ko-B3
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:12:59 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAWEr-0006mL-KI
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:12:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o15so11203801wmr.4
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIK0mFwHfNKfd8W04jR3CpdCTX2dAmZkqgyJ9QSv5LU=;
 b=mefTQoe07/B1Pzjn96vqr7x3j71t4yyKmHxGW/cqga9GnAkwaGjhUBpTcX+Jwqk0a2
 8uZNPhNaauZxBZWqSGcfNsI1uLB4fGwOM7uuCYILrumRtKXifg2vO7ODKayFxjIagR1r
 9k0dazoeZAlGr3pZ/LGSl+w2uixCYCmzGaZn3o8xxNjDMkuSpLtoAlj/acugv0y7pOFj
 /JEvQC3enlgMcnCrshzLIsXG3wnACZdVl+K3HodRAmt+yGaoIXcJ11nVn7WgU3B9xyeH
 fAnegcxBv9F5N89WnzmUhDZkcDEMEOCkluRDfDQhYIJOSiViV8Vx0Kk9cRLy0XGd8cEk
 RY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIK0mFwHfNKfd8W04jR3CpdCTX2dAmZkqgyJ9QSv5LU=;
 b=0qrMlvL9/VfzayeQLVLtfEfLTydOk+KoFDMh27oukTsXGrMB09ETc68IdiiMyVc+1+
 kApOKUi0FjS8QF4JbtuKdtwNNQp4jCq8qzzImQ+wAj/RwpmkowJbgsSUPxzRh5ZBNcKD
 1nxcCqk5PDzcbDeYaSCKNaADht5V25f9qGnXIeEREVq1vbA9hhBRA49UqZ4evkIF5oYe
 NnwMKx4DULyovLXT1Tutw8GK7tysuZey2p3oZj2U1PDtFxhrYLWzIZCX3JHgTh8qiT95
 NVJFEHy82SlimvBrCvA4KpLTfx8dRmcR6l4dqp0VaTppn9mkpVOO+9zvSvPMu2mZXH8k
 DmYQ==
X-Gm-Message-State: AFqh2kqQwy36TVNzTNnyOpUgTa6ctnmpAHqWY5JXRFu0/2SUsTn5WNzv
 h80gee5BOkUQMCGxSrF586gh+Q==
X-Google-Smtp-Source: AMrXdXtc66DzbqmCTwy0crWzRPr8rzNe3jLYQ4UOhGL/A/QI133Qr7WAUUB8Ste9zuxZpZByqbJBaQ==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr20560629wmq.32.1672233176118; 
 Wed, 28 Dec 2022 05:12:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b003c65c9a36dfsm20493137wmb.48.2022.12.28.05.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:12:55 -0800 (PST)
Message-ID: <114ff13b-86fd-7ca4-df93-0c05f54866b8@linaro.org>
Date: Wed, 28 Dec 2022 14:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/3] vhost: configure all host notifiers in a single MR
 transaction
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 pbonzini@redhat.com, arei.gonglei@huawei.com, yechuan@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-3-longpeng2@huawei.com>
 <8054d186-0196-ccb0-091d-0ee9caadb576@linaro.org>
 <20221227125331-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221227125331-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 27/12/22 18:54, Michael S. Tsirkin wrote:
> On Tue, Dec 27, 2022 at 05:43:57PM +0100, Philippe Mathieu-Daudé wrote:
>> On 27/12/22 08:20, Longpeng(Mike) wrote:
>>> From: Longpeng <longpeng2@huawei.com>
>>>
>>> This allows the vhost device to batch the setup of all its host notifiers.
>>> This significantly reduces the device starting time, e.g. the time spend
>>> on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
>>> and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device)
>>>
>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>> ---
>>>    hw/virtio/vhost.c | 24 ++++++++++++++++++++++++
>>>    1 file changed, 24 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>> index 5994559da8..064d4abe5c 100644
>>> --- a/hw/virtio/vhost.c
>>> +++ b/hw/virtio/vhost.c
>>> @@ -1562,16 +1562,25 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>>>            return r;
>>>        }
>>> +    /*
>>> +     * Batch all the host notifiers in a single transaction to avoid
>>> +     * quadratic time complexity in address_space_update_ioeventfds().
>>> +     */
>>> +    memory_region_transaction_begin();
>>> +
>>>        for (i = 0; i < hdev->nvqs; ++i) {
>>>            r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>>>                                             true);
>>>            if (r < 0) {
>>>                error_report("vhost VQ %d notifier binding failed: %d", i, -r);
>>> +            memory_region_transaction_commit();
>>>                vhost_dev_disable_notifiers(hdev, vdev);
>>
>> Could we 'break' here, ...
>>
>>>                return r;
>>>            }
>>>        }
>>> +    memory_region_transaction_commit();
>>> +
>>>        return 0;
>>
>> ... and return 'r' here?
> 
> 
> won't this commit twice? seems ugly ...

Twice? I meant keep the begin/commit() around the for() to have
only *one* commit() call instead of 2:

-- >8 --
+    memory_region_transaction_begin();
+
      for (i = 0; i < hdev->nvqs; ++i) {
          r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
hdev->vq_index + i,
                                           true);
          if (r < 0) {
              error_report("vhost VQ %d notifier binding failed: %d", i, 
-r);
              vhost_dev_disable_notifiers(hdev, vdev);
-            return r;
+            break;
          }
      }

+    memory_region_transaction_commit();
+
-    return 0;
+    return r;
  }
---

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

