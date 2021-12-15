Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB47475A7E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:18:45 +0100 (CET)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxV7D-0004Zq-LX
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome@forissier.org>)
 id 1mxUC4-0005gD-T9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:19:41 -0500
Received: from [2a00:1450:4864:20::432] (port=38400
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome@forissier.org>)
 id 1mxUC2-0005S6-BH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:19:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id e5so4743446wrc.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WEmRbe1D6TKty7I9+SikbziNO0GrFzYRrGm7K0d5PE0=;
 b=2y5s3tgXjs89a3Kxnf2M0butb/566qOMnOtKoaBG4ELWWMnNWoUgNE+jEi3DllO+pL
 AvhDOErC3Eome5eNBpJEPJsJbfKDbiDFqo4fdVsKHrFJ1i3b4xqO9252/OMPZennvrCr
 fP2jh7WMOcQ4fdvw4YHLSKkWgaOoJitve0fUQLD2tKUvCUAxIdM0VMzxkUuXdY4G50+h
 3DNb1hiwaATmcFIA3AV6h5vcbu1W96fcINP83Y7iBlIilPOjV3Ig6l6ohuE8HcOnFT6+
 L13NzMd/zo/OzxIUZsSdL/BRzT4ON8y5HDXYW00D1Dsrmb1rqSioD6abreonp9CcqW0+
 SiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WEmRbe1D6TKty7I9+SikbziNO0GrFzYRrGm7K0d5PE0=;
 b=stANcFekGLyUhA9uC1qANhcQUPUxFjcNNd7WYCk9sgddANBDPMGbCu5clO9LNhNYLZ
 2vLu77xi/cJ7BkYSnu48qU3fAzOh4zXsQyTLtCpebdqpv6WPM360c7DNyfHxljehSUTY
 +aNnBFRM1tHdNw14CO260pYlk6tnUOAG9tvtkJo34veG3V9/dxdW4oW4aglDOEYgfuyU
 PHoMW4KULhWC010CzmJth4o8VXLjEl3Tx9uVZsXEXFOtPGKjoxW9M3NiJtIUOzBlzXoJ
 /veWLCFlBUSAVUUp+EVKA1I+huRAHS/V98QveT2nnZveCt0V88fkojjHWWFCQOsWLFu3
 h/+w==
X-Gm-Message-State: AOAM531a0YEyX09dSVpOCJVtvcDyZcYKW+ZygxBK1o5yEqQub5qq+iYg
 MSLjUcZwnrXBehhw1o4CnCwxfQ==
X-Google-Smtp-Source: ABdhPJzBgiR6rjOIoQErYafXkaNOD0Mxq8ayRE7yMwNIar+YgoF9sIKD7KKpTMEtKqkk+fnyg6cQNQ==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr4423195wro.175.1639574375773; 
 Wed, 15 Dec 2021 05:19:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:269:e210:e917:f27a:8c45:5487?
 ([2a01:e0a:269:e210:e917:f27a:8c45:5487])
 by smtp.gmail.com with ESMTPSA id m20sm5568256wmq.11.2021.12.15.05.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 05:19:35 -0800 (PST)
Message-ID: <aa48cfca-3db1-2bfc-100f-ae1c1e83f0ef@forissier.org>
Date: Wed, 15 Dec 2021 14:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Content-Language: en-US
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
 <CAC_iWjL6x+qPmWSeeV1QWg=8X5XmXVaCJb99==_1uoyQsOps_w@mail.gmail.com>
From: Jerome Forissier <jerome@forissier.org>
In-Reply-To: <CAC_iWjL6x+qPmWSeeV1QWg=8X5XmXVaCJb99==_1uoyQsOps_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::432;
 envelope-from=jerome@forissier.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/15/21 14:15, Ilias Apalodimas wrote:
> Hi Alex,
> 
> On Wed, 15 Dec 2021 at 14:09, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Generally a guest needs an external source of randomness to properly
>> enable things like address space randomisation. However in a trusted
>> boot environment where the firmware will cryptographically verify
>> components having random data in the DTB will cause verification to
>> fail. Add a control knob so we can prevent this being added to the
>> system DTB.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>> Cc: Jerome Forissier <jerome@forissier.org>
>> ---
>>  docs/system/arm/virt.rst |  7 +++++++
>>  include/hw/arm/virt.h    |  1 +
>>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>>  3 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index 850787495b..c86a4808df 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -121,6 +121,13 @@ ras
>>    Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>>    using ACPI and guest external abort exceptions. The default is off.
>>
>> +kaslr-dtb-seed
>> +  Set ``on``/``off`` to pass a random seed via the guest dtb to use for features
>> +  like address space randomisation. The default is ``on``. You will want
>> +  to disable it if your trusted boot chain will verify the DTB it is
>> +  passed. It would be the responsibility of the firmware to come up
>> +  with a seed and pass it on if it wants to.
>> +
>>  Linux guest kernel configuration
>>  """"""""""""""""""""""""""""""""
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index dc6b66ffc8..acd0665fe7 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -148,6 +148,7 @@ struct VirtMachineState {
>>      bool virt;
>>      bool ras;
>>      bool mte;
>> +    bool kaslr_dtb_seed;
>>      OnOffAuto acpi;
>>      VirtGICType gic_version;
>>      VirtIOMMUType iommu;
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 30da05dfe0..4496612e89 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -248,11 +248,15 @@ static void create_fdt(VirtMachineState *vms)
>>
>>      /* /chosen must exist for load_dtb to fill in necessary properties later */
>>      qemu_fdt_add_subnode(fdt, "/chosen");
>> -    create_kaslr_seed(ms, "/chosen");
>> +    if (vms->kaslr_dtb_seed) {
>> +        create_kaslr_seed(ms, "/chosen");
>> +    }
>>
>>      if (vms->secure) {
>>          qemu_fdt_add_subnode(fdt, "/secure-chosen");
>> -        create_kaslr_seed(ms, "/secure-chosen");
>> +        if (vms->kaslr_dtb_seed) {
>> +            create_kaslr_seed(ms, "/secure-chosen");
>> +        }
>>      }
>>
>>      /* Clock node, for the benefit of the UART. The kernel device tree
>> @@ -2236,6 +2240,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>>      vms->its = value;
>>  }
>>
>> +static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->kaslr_dtb_seed;
>> +}
>> +
>> +static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->kaslr_dtb_seed = value;
>> +}
>> +
>>  static char *virt_get_oem_id(Object *obj, Error **errp)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>> @@ -2765,6 +2783,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                            "Set on/off to enable/disable "
>>                                            "ITS instantiation");
>>
>> +    object_class_property_add_bool(oc, "kaslr-dtb-seed",
>> +                                   virt_get_kaslr_dtb_seed,
>> +                                   virt_set_kaslr_dtb_seed);
>> +    object_class_property_set_description(oc, "kaslr-dtb-seed",
>> +                                          "Set off to disable passing of kaslr "
>> +                                          "dtb node to guest");
>> +
>>      object_class_property_add_str(oc, "x-oem-id",
>>                                    virt_get_oem_id,
>>                                    virt_set_oem_id);
>> @@ -2829,6 +2854,9 @@ static void virt_instance_init(Object *obj)
>>      /* MTE is disabled by default.  */
>>      vms->mte = false;
>>
>> +    /* Supply a kaslr-seed by default */
>> +    vms->kaslr_dtb_seed = true;
>> +
>>      vms->irqmap = a15irqmap;
>>
>>      virt_flash_create(vms);
>> --
>> 2.30.2
>>
> 
> This is particularly useful if the bootloader uses a TPM to measures
> the DTB and end up with a measured boot flow.
> 
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> 

Fine with me too. FWIW:

Acked-by: Jerome Forissier <jerome@forissier.org>

