Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE54C6F05
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:10:56 +0100 (CET)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgjn-0003eW-GC
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:10:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOgRZ-0005qm-0J; Mon, 28 Feb 2022 08:52:05 -0500
Received: from [2607:f8b0:4864:20::329] (port=39488
 helo=mail-ot1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOgRV-0001Cb-9c; Mon, 28 Feb 2022 08:52:03 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 j3-20020a9d7683000000b005aeed94f4e9so9526116otl.6; 
 Mon, 28 Feb 2022 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oUOMwf4ZkmrYer06X9lM4UKb1+ySXemiSNxsK4HILro=;
 b=YTrmrkUlwUemeZ7eepEvDGXCOhYKPVX85OiOpz7hyxLGf7UkR1OBF1AzmTRBA+k4KT
 GSUygu3waQVtnAJjSqD/0bvqMVaihsB1jArdhCrsssQOdUTARvjvq4qxhaXXKZHDSHSw
 zjNGN+MGpXDpTHXcYj9b+AAi/vb+5ubeIKMxyErzvM7uDWwWFn+gul/vHGty4Ay9gXSa
 2G0dvT6EQFvAFSscn0cbhELgedfRHYZq7qIpa5vHA7/JOiC398WdrqCgH0R6R8R2SFVL
 8u1styaSo1rFsbk6uUgyzxDssWrIqZXJngVTuORA/ykWZ7qmGDhrGN6GEIo6JuYwq5vL
 gxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oUOMwf4ZkmrYer06X9lM4UKb1+ySXemiSNxsK4HILro=;
 b=EVDljXRfHeIICQGtp5kG3ZRKwwDj9NHn6GOcc+1c+8ei03SkX77LCswX3A20L6W6eS
 KeDTdW8nd5KIUHorHKELx1fPxIEwE0ow3m8HlxUMlJv6czH15DTcOzrpfDcLYrQHvZ0S
 rvukaPLEyYR3A6pEmSmlny7vwvgC31J80Qz8D3++3q83HTrvBWdFPDxwc/HI3i5Ldb18
 MNWYJznF6eaZ8Y4zCofOv07xOukVkZcRMamhRaDtqo1AIuVRWOR+1+Q6Vd66lfwM3HQD
 FUvUAWjAJ+pVKlyQChn+NyqyGvR2YHUQb1BUa7KjK05L5eOA+Xlj6yQ7KDILx150x5vF
 bAmw==
X-Gm-Message-State: AOAM533I7u2VFAmUHqrnjCNRuM1Z5sHv+5w5mSVFXiHnESF+G5riWYka
 n8bwFYSG8lCLbF57orhwO11tZ+ifhSQ=
X-Google-Smtp-Source: ABdhPJzcJQ0QCMXiGIqpQqsKcebi7DQHR9EyNVC6Hhio04814ous+yvfr3BM4zbH4VMnO75b/b2e6Q==
X-Received: by 2002:a05:6830:1cc2:b0:5af:f66a:55bb with SMTP id
 p2-20020a0568301cc200b005aff66a55bbmr4637538otg.224.1646056318043; 
 Mon, 28 Feb 2022 05:51:58 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a4a2a4a000000b0031bf0818df1sm4753648oox.4.2022.02.28.05.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:51:57 -0800 (PST)
Message-ID: <9f33be37-40a9-e308-a5d7-fefff1b0de3c@gmail.com>
Date: Mon, 28 Feb 2022 10:51:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/pnv: fix default PHB4 QOM hierarchy
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220218202804.413157-1-danielhb413@gmail.com>
 <d8042dac-2a16-1b69-e334-58bae188d88e@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d8042dac-2a16-1b69-e334-58bae188d88e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::329
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/26/22 10:49, Cédric Le Goater wrote:
> On 2/18/22 21:28, Daniel Henrique Barboza wrote:
>> Commit 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
>> changed phb4_pec code to create the default PHB4 objects in
>> pnv_pec_default_phb_realize(). In this process the stacks[] PEC array was
>> removed and each PHB4 object is tied together with its PEC via the
>> phb->pec pointer.
>>
>> This change also broke the previous QOM hierarchy - the PHB4 objects are
>> being created and not being parented to their respective chips. This can
>> be verified by 'info pic' in a powernv9 domain with default settings.
>> pnv_chip_power9_pic_print_info() will fail to find the PHBs because
>> object_child_foreach_recursive() won't find any.
>>
>> The solution is to set the parent chip and the parent bus, in the same
>> way done for user created PHB4 devices, for all PHB4 devices.
>>
>> Fixes: 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> What about the pnv-phb3/4-root-port devices ? Should we attached
> them also to the QOM hierarchy ?


I guess it wouldn't hurt. I'll see what I can do.



Thanks,


Daniel

> 
> Thanks,
> 
> C.
> 
>> ---
>>   hw/pci-host/pnv_phb4.c | 36 ++++++++++++++++--------------------
>>   1 file changed, 16 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index e91249ef64..846e7d0c3e 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1568,40 +1568,36 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPHB4 *phb = PNV_PHB4(dev);
>> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>>       XiveSource *xsrc = &phb->xsrc;
>> +    BusState *s;
>>       Error *local_err = NULL;
>>       int nr_irqs;
>>       char name[32];
>> -    /* User created PHB */
>> -    if (!phb->pec) {
>> -        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>> -        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>> -        BusState *s;
>> -
>> -        if (!chip) {
>> -            error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> -            return;
>> -        }
>> +    if (!chip) {
>> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> +        return;
>> +    }
>> +    /* User created PHBs need to be assigned to a PEC */
>> +    if (!phb->pec) {
>>           phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
>>           if (local_err) {
>>               error_propagate(errp, local_err);
>>               return;
>>           }
>> +    }
>> -        /*
>> -         * Reparent user created devices to the chip to build
>> -         * correctly the device tree.
>> -         */
>> -        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
>> +    /* Reparent the PHB to the chip to build the device tree */
>> +    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
>> -        s = qdev_get_parent_bus(DEVICE(chip));
>> -        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
>> -            error_propagate(errp, local_err);
>> -            return;
>> -        }
>> +    s = qdev_get_parent_bus(DEVICE(chip));
>> +    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
>> +        error_propagate(errp, local_err);
>> +        return;
>>       }
>>       /* Set the "big_phb" flag */
> 

