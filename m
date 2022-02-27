Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359D4C5E5C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 20:05:21 +0100 (CET)
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOr8-0006Yi-7u
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 14:05:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOOp3-0005DO-IS
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 14:03:12 -0500
Received: from [2a00:1450:4864:20::335] (port=43743
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOOp1-0000TG-VF
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 14:03:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 n25-20020a05600c3b9900b00380f41e51e6so4791201wms.2
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 11:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=euShGLtU+7qWFs0dKyalClSbAvPs4f8uI1NnW2/YRPU=;
 b=HR79SFhKJy3DFfucLe5Hpy/LybTksYi1gX4pUOl+UbldXNu7NcohFSSP/JUWzgrhml
 RTwPueHMSD7a0UZ7goYycjEQvr4g7q0MZF0v/7D/RKFCyb/W9Dpht8kb51OCRN7yYkuy
 1ECTBezWXHpqTAjRH74zl6MlRn4Ucz+TkA1yuJklgTjHDUAeX4guwQtyv2dgVJyu8Jij
 IHubQt2zuteI5FPoHkJck4cRTlI2OIamSUeLDoRC6s8tUcJTgUw59Yn6M1M+13mKzzxH
 QwWTB0R27iP6aOMKQRJLBYQXvb0BInRS/fA2rNNa8/xI2aM270DaYVK8M4Gtkm7/mwDE
 Pvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=euShGLtU+7qWFs0dKyalClSbAvPs4f8uI1NnW2/YRPU=;
 b=bnllmHQkHTnkGuCPYTbfvlU1VR3iN0Zs61AQ5J65ALqSLUGEFtcXbVaSBrznbV9qE6
 sDTa0P3is3LExFavh8Uc9QlV/uyLoSceOpNHKpPdkO1dKGeWcHttCLXOqXTTClLH1qSS
 9jIngGlBFVnTpzwuMS568xvXUScVTku5uDEfo1eTFiz3qT7B72UtMWFUrT/bPOCIu6aN
 FlbSPEskxdl2ImfaMCK6F+OrXY9nYQ1AqnTMpVaWeGMgrilJhD55fY/4n35R0XV6sZ/M
 /SO2NXus3/N9ZW4AY4j2E+T4HZ/JoTIUuVR9RKY/bUO5yJuEn//iIcDCitzM2hrurIHH
 iemQ==
X-Gm-Message-State: AOAM53225q5AgCE+1eovVNi8NjV2LeikMpLvn6Jj0t2zA/2uFMqqkGXG
 92UA+63vqDDk86OIldCcRqk=
X-Google-Smtp-Source: ABdhPJyHM0XGbZOEdtDq9AOSJmOqm/1n+VCtcOgpEAeDYRrls09wstFlcaZY0pfiP8wrhiGOMcihLg==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr10721493wmc.146.1645988586043; 
 Sun, 27 Feb 2022 11:03:06 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c4fd600b0038133076dcesm9598290wmq.16.2022.02.27.11.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:03:05 -0800 (PST)
Message-ID: <76ebfc46-444e-d145-7f6f-020e04dace9c@gmail.com>
Date: Sun, 27 Feb 2022 21:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/4] hw/isa: add function to check for existence of
 device by its type
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-2-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2202271254280.1249418@anisinha-lenovo>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2202271254280.1249418@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/27/22 09:27, Ani Sinha wrote:
>
> On Sat, 26 Feb 2022, Liav Albani wrote:
>
>> This function enumerates all attached ISA devices in the machine, and
>> tries to compare a given device type name to the enumerated devices.
>> For example, this can help other code to determine if a i8042 controller
>> exists in the machine.
>>
>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>> ---
>>   hw/isa/isa-bus.c     | 23 +++++++++++++++++++++++
>>   include/hw/isa/isa.h |  1 +
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
>> index 6c31398dda..663aa36d29 100644
>> --- a/hw/isa/isa-bus.c
>> +++ b/hw/isa/isa-bus.c
>> @@ -222,6 +222,29 @@ void isa_build_aml(ISABus *bus, Aml *scope)
>>       }
>>   }
>>
>> +bool isa_check_device_existence(const char *typename)
>> +{
>> +    /*
>> +     * If there's no ISA bus, we know for sure that the checked ISA device type
>> +     * doesn't exist in the machine.
>> +     */
>> +    if (isabus == NULL) {
> nit: I would do if (!isabus) instead to keep uniformity with other parts
> of the code.
Hmm, OK, I'll change it because it seems really fine to do that this way 
too :)
>
>> +        return false;
>> +    }
>> +
>> +    BusChild *kid;
>> +    ISADevice *dev;
>> +
>> +    QTAILQ_FOREACH(kid, &isabus->parent_obj.children, sibling) {
>> +        dev = ISA_DEVICE(kid->child);
>> +        const char *object_type = object_get_typename(OBJECT(dev));
>> +        if (object_type && strcmp(object_type, typename) == 0) {
> nit: I would do !strcmp() instead.
>
Hmm, OK, I'll change it because it seems really fine to do that this way 
too :)
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>>   static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
>>   {
>>       ISADevice *d = ISA_DEVICE(dev);
>> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
>> index d4417b34b6..65f0c7e28c 100644
>> --- a/include/hw/isa/isa.h
>> +++ b/include/hw/isa/isa.h
>> @@ -99,6 +99,7 @@ IsaDma *isa_get_dma(ISABus *bus, int nchan);
>>   MemoryRegion *isa_address_space(ISADevice *dev);
>>   MemoryRegion *isa_address_space_io(ISADevice *dev);
>>   ISADevice *isa_new(const char *name);
>> +bool isa_check_device_existence(const char *typename);
> Please provide documentation for this function in line with other
> functions like isa_register_ioport() and isa_register_portio_list()  in
> the same header.

Ah, I see what you mean - I'll write short descriptive documentation 
like what there's for other functions :)

Thanks for the suggestions!

Best regards,
Liav


