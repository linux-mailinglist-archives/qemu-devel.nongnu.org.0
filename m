Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D824429F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:57:13 +0100 (CET)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpbU-0007g9-IR
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpZk-0006tu-1C; Tue, 02 Nov 2021 04:55:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpZh-0000iR-WB; Tue, 02 Nov 2021 04:55:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so1243031wme.0; 
 Tue, 02 Nov 2021 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NNtxCu0YeuDYMi1ir0yoC4RnVGoCGVSH0UdRhJQg3eE=;
 b=T0iN9Iet70LjgtvkI85YK+B+ZZNbfI5oT8nzi+p4vTv+dvPNDceVJzQsFVeVSklmyQ
 SQxJZNrq68nzt3KbUsHLpBp+2JSSrJbhvjbWb24ratJZv9euHqCI7fPOXA5m2FR4ExnO
 ugnEuCcV6ugaTlMUdj3GiYdRTy+WRbnXzy8Hbd9ZF9hzMtUC9oZAGEh5nMeFCtFVmPH/
 r6w/EK63hS3fpCQggWZeBJpybKXJ2jwkVO74iOI5rb7BoCasZihPAG8mL1gVnUWQyHLM
 uCc990bQkUm6qLiChbHa698oeG46uBBI0ef7Adu5tSAsYvk+7qIwn8QVtInjPZqgiElH
 rhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NNtxCu0YeuDYMi1ir0yoC4RnVGoCGVSH0UdRhJQg3eE=;
 b=S4LkbSnX5ha8SkN8QP0y91AMSsCQ6pcQIVEdYtTmGUNpb7g8fdnO2n3X8sVW9ks5+Y
 ItXeaKGn3+f0JZCKLnYU5bVQL2rraqJrPX2zRtqWmIKyhbsL8DVZX3PtHaOuWU4H14ZR
 plsllmv1koH/I0mmPxrvG+12o7CMsJ46Fgcuqn+VXeFvYtpfN0V4uJHTdWfwFa80H8NE
 nsdxxcMo46pFgeq4UQA21ABXy0P2iFEO8Cs0PwuAFEZ7YxmDCI+mlmAneoNYQ1F3QMJ6
 rESk6n5WuJ46jcfgRzRU8enXM5DCFE13mc31bwfcnO4rKWbHS7xGsrNPiq6o/Y5k6h06
 V4Iw==
X-Gm-Message-State: AOAM5325gpfDNVABhZ9oulFYrimTIamuizTI6rsbwchl60C3Rws1BASG
 xdFwAKon5Q60fBaBxntl9mY=
X-Google-Smtp-Source: ABdhPJzs/aW7Lap4o5mNgyIaHHivLSnWl5YjbMVqwhcDOFey+GkaCesTXR9Qa9HqgI9ECodqnLCS4w==
X-Received: by 2002:a7b:c30c:: with SMTP id k12mr5532144wmj.38.1635843319867; 
 Tue, 02 Nov 2021 01:55:19 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm15999481wrv.22.2021.11.02.01.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:55:19 -0700 (PDT)
Message-ID: <e2afad0e-8116-a1b0-f473-7c44ba32112f@amsat.org>
Date: Tue, 2 Nov 2021 09:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-8-wuhaotsh@google.com>
 <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus/Eduardo

On 11/1/21 18:33, Peter Maydell wrote:
> On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>>
>> The ID can be used to indicate SMBus modules when adding
>> dynamic devices to them.
>>
>> Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> ---
>>  hw/arm/npcm7xx.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
>> index 2ab0080e0b..72953d65ef 100644
>> --- a/hw/arm/npcm7xx.c
>> +++ b/hw/arm/npcm7xx.c
>> @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
>>      for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
>>          object_initialize_child(obj, "smbus[*]", &s->smbus[i],
>>                                  TYPE_NPCM7XX_SMBUS);
>> +        DEVICE(&s->smbus[i])->id = g_strdup_printf("smbus[%d]", i);
>>      }
> 
> This one looks weird to me -- I'm pretty sure we shouldn't be messing
> about with the DeviceState id string like that. It's supposed to be
> internal to the QOM/qdev code.

I agree with you, however:

$ git grep -F -- '->id = g_strdup' hw
hw/arm/virt.c:1512:    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
hw/block/xen-block.c:761:    drive->id = g_strdup(id);
hw/block/xen-block.c:853:    iothread->id = g_strdup(id);
hw/core/machine-qmp-cmds.c:169:        m->id =
g_strdup(object_get_canonical_path_component(obj));
hw/mem/pc-dimm.c:244:        di->id = g_strdup(dev->id);
hw/pci-bridge/pci_expander_bridge.c:248:        bds->id =
g_strdup(dev_name);
hw/ppc/e500.c:1009:        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
hw/s390x/s390-pci-bus.c:1003:            dev->id =
g_strdup_printf("auto_%02x:%02x.%01x",
hw/sh4/sh7750.c:819:    dev->id = g_strdup("sci");
hw/sh4/sh7750.c:836:    dev->id = g_strdup("scif");
hw/virtio/virtio-mem-pci.c:69:        vi->id = g_strdup(dev->id);
hw/virtio/virtio-pmem-pci.c:74:        vi->id = g_strdup(dev->id);

