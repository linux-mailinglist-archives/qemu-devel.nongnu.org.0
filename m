Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3814E273B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:08:45 +0100 (CET)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHm7-0001bH-S8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:08:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWHk4-0000fy-Bb; Mon, 21 Mar 2022 09:06:36 -0400
Received: from [2607:f8b0:4864:20::62f] (port=46934
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWHk2-0004GA-M8; Mon, 21 Mar 2022 09:06:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w4so12643853ply.13;
 Mon, 21 Mar 2022 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3/kxjof2ZOML7YmnPPwMhJ3t5ucm8eiE4KiHRF0dBdg=;
 b=QvysWhx4Tcrr8Ad0yu2MEXe5ons+18BemJWlLfXubZdqHrH80y8w1z8LJVWOMErJRA
 4ICVqG/tivho2aZt1rcQbpHaDv2nfyJlfdmXpw1VrUa3qtdURGHYmqh+MqHJO3yfDuGh
 aEmkquQHqSovDBt/OAD7Hjq5c6Aa0qK5U+XpMOgZp77jdX/6iu9HyhtqvoGXbALA/sT7
 Pp1VmSDHWU8yoWdjEErT++StlhpNMWbIDCZxyPuVLCmz0hXDy8s8xBAs+g3GXCOorDmO
 0HNjqMdPu2JItBX/IHl/b5yFHsm/PZ2cVor4PQyyUl+bGkKkU8x4YyCd5oPOimvoxjy2
 7s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3/kxjof2ZOML7YmnPPwMhJ3t5ucm8eiE4KiHRF0dBdg=;
 b=KV6RiAhVEoT5xxmj8dckjTM5yBX5MHhjr75JqTDCG3lw4VencuHUcdKuY6wR3L9EB+
 TLSh8oYwo2lNoET5Mk9oUgN1hTdZgWKzmIt3wKn6B8xGmTM//C6XpRyo15AXNfLZExQT
 0ENMFDNCccmzTx6Su+EsrSpeQZBJg2bHX2qFw0fLGoqPdAdfyehhxXsK910Kt9oOf36b
 K+75EX066//iYh+ys33xBIvvBHPJ1YsMcDP5I4hlrmRHsULRH2CqcUFA3XITouw0jYpv
 K5KPXcw0DB5BNs89wFU9oXOtCYYomifRJU97v7H+1A+F1IoW0ineygr61C0XUdgL5s3n
 PieA==
X-Gm-Message-State: AOAM5338xRwsjkvbdiBvsuU1Ks+F1U78n/ppJYlWo+3DaVBLG5l2SG2Z
 MCt8Wdl+pWY8n9GAxdQVCGehAhw06zUxng==
X-Google-Smtp-Source: ABdhPJxg19RR6RSkKWnlR3Y4IlkI/qy01V2Kw+778vmh++VE5MSr2ChrtixKIhZ4rbx9wp53ioNThA==
X-Received: by 2002:a17:902:f54d:b0:154:6794:ab38 with SMTP id
 h13-20020a170902f54d00b001546794ab38mr2757479plf.114.1647867993094; 
 Mon, 21 Mar 2022 06:06:33 -0700 (PDT)
Received: from [192.168.64.175] (138.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.138]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm19536089pfu.62.2022.03.21.06.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 06:06:32 -0700 (PDT)
Message-ID: <a35794be-1e41-82a0-f6b0-c9541d2373c5@gmail.com>
Date: Mon, 21 Mar 2022 14:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND 1/2] hw/vfio/pci-quirks: Resolve redundant property
 getters
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220301225220.239065-1-shentey@gmail.com>
 <20220301225220.239065-2-shentey@gmail.com>
 <5F510D6C-37E7-46A1-AEB8-E7D060B4ED0B@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <5F510D6C-37E7-46A1-AEB8-E7D060B4ED0B@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 11:57, Bernhard Beschow wrote:
> Am 1. März 2022 22:52:19 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> The QOM API already provides getters for uint64 and uint32 values, so reuse
>> them.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
>> 1 file changed, 9 insertions(+), 25 deletions(-)
>>
>> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
>> index 0cf69a8c6d..f0147a050a 100644
>> --- a/hw/vfio/pci-quirks.c
>> +++ b/hw/vfio/pci-quirks.c
>> @@ -1565,22 +1565,6 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
>>      return 0;
>> }
>>
>> -static void vfio_pci_nvlink2_get_tgt(Object *obj, Visitor *v,
>> -                                     const char *name,
>> -                                     void *opaque, Error **errp)
>> -{
>> -    uint64_t tgt = (uintptr_t) opaque;
>> -    visit_type_uint64(v, name, &tgt, errp);
>> -}
>> -
>> -static void vfio_pci_nvlink2_get_link_speed(Object *obj, Visitor *v,
>> -                                                 const char *name,
>> -                                                 void *opaque, Error **errp)
>> -{
>> -    uint32_t link_speed = (uint32_t)(uintptr_t) opaque;
>> -    visit_type_uint32(v, name, &link_speed, errp);
>> -}
>> -
>> int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
>> {
>>      int ret;
>> @@ -1618,9 +1602,9 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
>>                                 nv2reg->size, p);
>>      QLIST_INSERT_HEAD(&vdev->bars[0].quirks, quirk, next);
>>
>> -    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
>> -                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
>> -                        (void *) (uintptr_t) cap->tgt);
>> +    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
>> +                                   (uint64_t *) &cap->tgt,
>> +                                   OBJ_PROP_FLAG_READ);
>>      trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
>>                                            nv2reg->size);
>> free_exit:
>> @@ -1679,15 +1663,15 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
>>          QLIST_INSERT_HEAD(&vdev->bars[0].quirks, quirk, next);
>>      }
>>
>> -    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
>> -                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
>> -                        (void *) (uintptr_t) captgt->tgt);
>> +    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
>> +                                   (uint64_t *) &captgt->tgt,
>> +                                   OBJ_PROP_FLAG_READ);
>>      trace_vfio_pci_nvlink2_setup_quirk_ssatgt(vdev->vbasedev.name, captgt->tgt,
>>                                                atsdreg->size);
>>
>> -    object_property_add(OBJECT(vdev), "nvlink2-link-speed", "uint32",
>> -                        vfio_pci_nvlink2_get_link_speed, NULL, NULL,
>> -                        (void *) (uintptr_t) capspeed->link_speed);
>> +    object_property_add_uint32_ptr(OBJECT(vdev), "nvlink2-link-speed",
>> +                                   &capspeed->link_speed,
>> +                                   OBJ_PROP_FLAG_READ);
>>      trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
>>                                                capspeed->link_speed);
>> free_exit:
> 
> Ping
> 
> @Alistair: When resending, I accidently added a Reviewed-by with your name here which I asked to be ignored *after* you re-acked patch 2/2. In case you intended to ack this patch as well your voice would be needed again.

FWIW I expect these patches to get merged via the qemu-trivial@ tree
once the 7.1 development window opens.

