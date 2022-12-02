Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA7640840
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 15:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p16r1-0002cj-Tm; Fri, 02 Dec 2022 09:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p16qz-0002cI-4u
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:17:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p16qw-0006d4-Q5
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:17:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id d1so7966070wrs.12
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4dExi3M4RoDQjYVwQDAaf81jweSqQSbtv6oYlWoAW20=;
 b=dMxRbq9Bzeq7wXBQvh7LUFWFglLIygA5lCy23JTjzE0CeMqfPSTGkkVtBUm1J7K93s
 mltK7aDkTs+F9NSpYBD+swngnB0xHypyqlXAKbUAWXAwWDO9f6HXE1lqDLVSMwuR8CmZ
 KlcfWyyZwo/g3Mi8BvQZY/JR740fyAMchc+wz1lg6dg8JchNgrOtSPuBNyAKV4daKA9b
 jOoPFw7HIdW1dPiGaKrJXOcYBEuUB47DLaMBwQaqqdKJqd9MCV6Awrmzw1XmQnRKBaKq
 m1Z9fQk61E2bIExKIbeliAYIJLt+81Kg8Mj3APjIMhaqirLm19mumnaFaJEWLLnRlmou
 hf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dExi3M4RoDQjYVwQDAaf81jweSqQSbtv6oYlWoAW20=;
 b=qHY544KoVLq5RX06dDEsK8yYShbRvU3lPksifLLU9oP4BtxKU1BUxH/kTdSNzyWpXh
 Un3IwhAvPS/5e0apE2Tn8MJhHMJszX2uuZXHbqIrXHlHrA03jB9gOmoXuNK0XNu6nVmi
 XEwpq2fICq18R+UEb/pHpNZhvybIttvfGFfabZwJhHLvuB4ZEHzYN4rGTTqnWYx+8cgO
 fAIBZxA14WLc4fLkOa9o4FdiJwKO6fsPh/kkux+2SFWxW3SGRIUnzNmXtuMIst3Prz44
 9LLbzgc7miBambA9xxbKtDzGHYUnj4RQwEJMygOMKb5ypv4U6301q/vRjcO81B+ufd0W
 vxRw==
X-Gm-Message-State: ANoB5plFFBzbSMYeL/H4cUm4UxYgptosCHc8eitQT/siW86Kj8XYQRhm
 u6wzEj+kzWid/2WI1lBB7aMNzw==
X-Google-Smtp-Source: AA0mqf6iNlqya1KaKj4b21frZau9hCu9Z/DdLUcX+5QfOPIrA8d8LAZl1X5TXqJxGOiNspLbFg5ASQ==
X-Received: by 2002:a5d:4d4e:0:b0:242:c59:b979 with SMTP id
 a14-20020a5d4d4e000000b002420c59b979mr19428139wru.707.1669990640618; 
 Fri, 02 Dec 2022 06:17:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i12-20020adffc0c000000b00241d21d4652sm7082194wrr.21.2022.12.02.06.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 06:17:19 -0800 (PST)
Message-ID: <6c917ccc-c458-3545-de73-6f9aee132b45@linaro.org>
Date: Fri, 2 Dec 2022 15:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v15 1/6] qmp: add QMP command x-query-virtio
Content-Language: en-US
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org,
 lvivier@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com, pbonzini@redhat.com
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
 <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
 <6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org>
 <31d76035-3b8c-c9a1-4fd3-d3cc6af5f69c@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <31d76035-3b8c-c9a1-4fd3-d3cc6af5f69c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 2/12/22 13:23, Jonah Palmer wrote:
> 
> On 11/30/22 11:16, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 11/8/22 14:24, Jonah Palmer wrote:
>>> From: Laurent Vivier <lvivier@redhat.com>
>>>
>>> This new command lists all the instances of VirtIODevices with
>>> their canonical QOM path and name.
>>>
>>> [Jonah: @virtio_list duplicates information that already exists in
>>>   the QOM composition tree. However, extracting necessary information
>>>   from this tree seems to be a bit convoluted.
>>>
>>>   Instead, we still create our own list of realized virtio devices
>>>   but use @qmp_qom_get with the device's canonical QOM path to confirm
>>>   that the device exists and is realized. If the device exists but
>>>   is actually not realized, then we remove it from our list (for
>>>   synchronicity to the QOM composition tree).
>>>
>>>   Also, the QMP command @x-query-virtio is redundant as @qom-list
>>>   and @qom-get are sufficient to search '/machine/' for realized
>>>   virtio devices. However, @x-query-virtio is much more convenient
>>>   in listing realized virtio devices.]
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>> ---
>>>   hw/virtio/meson.build      |  2 ++
>>>   hw/virtio/virtio-stub.c    | 14 ++++++++
>>>   hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
>>>   include/hw/virtio/virtio.h |  1 +
>>>   qapi/meson.build           |  1 +
>>>   qapi/qapi-schema.json      |  1 +
>>>   qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
>>>   tests/qtest/qmp-cmd-test.c |  1 +
>>>   8 files changed, 132 insertions(+)
>>>   create mode 100644 hw/virtio/virtio-stub.c
>>>   create mode 100644 qapi/virtio.json
>>
>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>> index 5d607aeaa0..bdfa82e9c0 100644
>>> --- a/hw/virtio/virtio.c
>>> +++ b/hw/virtio/virtio.c
>>> @@ -13,12 +13,18 @@
>>>     #include "qemu/osdep.h"
>>>   #include "qapi/error.h"
>>> +#include "qapi/qmp/qdict.h"
>>> +#include "qapi/qapi-commands-virtio.h"
>>> +#include "qapi/qapi-commands-qom.h"
>>> +#include "qapi/qapi-visit-virtio.h"
>>> +#include "qapi/qmp/qjson.h"
>>>   #include "cpu.h"
>>>   #include "trace.h"
>>>   #include "qemu/error-report.h"
>>>   #include "qemu/log.h"
>>>   #include "qemu/main-loop.h"
>>>   #include "qemu/module.h"
>>> +#include "qom/object_interfaces.h"
>>>   #include "hw/virtio/virtio.h"
>>>   #include "migration/qemu-file-types.h"
>>>   #include "qemu/atomic.h"
>>> @@ -29,6 +35,9 @@
>>>   #include "sysemu/runstate.h"
>>>   #include "standard-headers/linux/virtio_ids.h"
>>>   +/* QAPI list of realized VirtIODevices */
>>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>>> +
>>>   /*
>>>    * The alignment to use between consumer and producer parts of vring.
>>>    * x86 pagesize again. This is the default, used by transports like 
>>> PCI
>>> @@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState 
>>> *dev, Error **errp)
>>>       vdev->listener.commit = virtio_memory_listener_commit;
>>>       vdev->listener.name = "virtio";
>>>       memory_listener_register(&vdev->listener, vdev->dma_as);
>>> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>>   }
>>>     static void virtio_device_unrealize(DeviceState *dev)
>>> @@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState 
>>> *dev)
>>>           vdc->unrealize(dev);
>>>       }
>>>   +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>>>       g_free(vdev->bus_name);
>>>       vdev->bus_name = NULL;
>>>   }
>>> @@ -3885,6 +3896,8 @@ static void 
>>> virtio_device_class_init(ObjectClass *klass, void *data)
>>>       vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>>>         vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
>>> +
>>> +    QTAILQ_INIT(&virtio_list);
>>>   }
>>>     bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>> @@ -3895,6 +3908,37 @@ bool 
>>> virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>>       return virtio_bus_ioeventfd_enabled(vbus);
>>>   }
>>>   +VirtioInfoList *qmp_x_query_virtio(Error **errp)
>>> +{
>>> +    VirtioInfoList *list = NULL;
>>> +    VirtioInfoList *node;
>>> +    VirtIODevice *vdev;
>>> +
>>> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
>>> +        DeviceState *dev = DEVICE(vdev);
>>> +        Error *err = NULL;
>>> +        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", 
>>> &err);
>>> +
>>> +        if (err == NULL) {
>>> +            GString *is_realized = qobject_to_json_pretty(obj, true);
>>> +            /* virtio device is NOT realized, remove it from list */
>>
>> Why not check dev->realized instead of calling qmp_qom_get() & 
>> qobject_to_json_pretty()?
> 
> This check queries the QOM composition tree to check that the device actually exists and is
> realized. In other words, we just want to confirm with the QOM composition tree for the device.
> 
> This was done to have some kind of synchronicity between @virtio_list and the QOM composition
> tree, since the list duplicates information that already exists in the tree.
> 
> This check was recommended in v10 and added in v11 of this patch series.

Thanks, I found Markus comments:

v10:
https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/
v11:
https://lore.kernel.org/qemu-devel/87ee4abtdu.fsf@pond.sub.org/

Having the justification from v11 in the code rather than the commit
description could help.

>>
>>> +            if (!strncmp(is_realized->str, "false", 4)) {
>>> +                QTAILQ_REMOVE(&virtio_list, vdev, next);
>>> +            } else {
>>> +                node = g_new0(VirtioInfoList, 1);
>>> +                node->value = g_new(VirtioInfo, 1);
>>> +                node->value->path = g_strdup(dev->canonical_path);
>>> +                node->value->name = g_strdup(vdev->name);
>>> +                QAPI_LIST_PREPEND(list, node->value);
>>> +            }
>>> +           g_string_free(is_realized, true);
>>> +        }
>>> +        qobject_unref(obj);
>>> +    }
>>> +
>>> +    return list;
>>> +}


