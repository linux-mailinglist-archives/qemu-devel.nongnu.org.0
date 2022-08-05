Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF9358AAEC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 14:37:23 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJwZt-0002lH-VD
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 08:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJwU2-0007Jo-LR
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 08:31:18 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJwU1-00088S-1X
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 08:31:18 -0400
Received: by mail-vs1-xe33.google.com with SMTP id v128so2282825vsb.10
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=JhXuZqTBayizvhWDtL3dWOQSDAMk0xkptaqPSV8nXjE=;
 b=YnlEbPaFbk01aQwZSoFUD8kI529do1zualsBV3qS6Oqj/bsQu58wv44jbzoN3edfwY
 19SvcWg23pWF0z0Vxq2kqzDIXX6xzV3vNCh5noLq9kNihjGeZTA9zwRUreM1O/2aTFcv
 tlTyWZAkolOZD6at5QArtFaRuqgi3Gy3PeqRLHXiJnOPSTk63PyrnOYBK4YbwCyPMs2q
 pCvjWMqWbv6lA28P1HN+ta1dSRxQOfMfU+q5w9iGjGba3kFzU+vNGpmT77hUJVLStlhN
 9jxPvLX9GXa0c53UUtvZUvJIK6fx44zbgSYhCrApneRx0PfrLv2Vl9OKiAFqpQe6C/BM
 5iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JhXuZqTBayizvhWDtL3dWOQSDAMk0xkptaqPSV8nXjE=;
 b=VPazdKzf4F3t+gs9EG0/LQ0Ir5hgTkI3fyn5sQqrWRF0oBajHfHuIncMSBcbNsQOcz
 F05/+UtMJj5eJAduoE0RpbU/r/j/vE9plhKO630yaGFZMemX3j1WJpLv19o0SIZzL1aW
 TEhBYrXpaOXQdaJILs8cOwXEYroCGlLeG5XIhRP5TdcVbhxr0pZ9Fldj22/21tS64F7Y
 2pVGKBuTkzALnVoaTD8ZmJ1xUvERszrj9OltEXy+x2SyC7/JDd0NClkPY8inihp+QJm6
 IOe+LvJz8Xzfpzg7jdSg41icG5yISMiiWKvdfGyD6MOZe8VfHYIptETfJ9bqj+MQdgzE
 HC4Q==
X-Gm-Message-State: ACgBeo06JOlN6LhOUsy/aXM+5lBFTaX/pEzeedBXzV178YH73yiVZwz6
 W8TsMUmjzvZZvWj38tKTFbc=
X-Google-Smtp-Source: AA6agR7OuQNSMxXkcQrbFCabPU706zSmWL3/6zGX5TObQNsbdqwhMrejq7dZqxEBnVh+OavE5u/X4A==
X-Received: by 2002:a67:e1c5:0:b0:371:73d9:7316 with SMTP id
 p5-20020a67e1c5000000b0037173d97316mr2738648vsl.38.1659702675010; 
 Fri, 05 Aug 2022 05:31:15 -0700 (PDT)
Received: from [192.168.10.102] ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 q3-20020ab02b83000000b0038342b58f6csm3187982uar.17.2022.08.05.05.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 05:31:14 -0700 (PDT)
Message-ID: <20bcdfba-bd98-90b9-e384-8a40d833ebfe@gmail.com>
Date: Fri, 5 Aug 2022 09:31:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 v2 09/20] hw/ppc: set machine->fdt in pnv_reset()
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-10-danielhb413@gmail.com>
 <ef56a98c-6261-2342-84e4-46796b69cdbb@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ef56a98c-6261-2342-84e4-46796b69cdbb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/5/22 08:03, Frederic Barrat wrote:
> 
> 
> On 05/08/2022 11:39, Daniel Henrique Barboza wrote:
>> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
>> all powernv machines.
>>
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/pnv.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index d3f77c8367..f5162f8b7b 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -608,7 +608,11 @@ static void pnv_reset(MachineState *machine)
>>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>>       cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>> -    g_free(fdt);
>> +    /*
>> +     * Update the machine->fdt pointer to enable support for
>> +     * 'dumpdtb' and 'info fdt' commands.
>> +     */
>> +    machine->fdt = fdt;
> 
> 
> Can pnv_reset() be called several times in the same instance of the qemu process, in which case we leak memory?

hmmm I think it's possible if we issue a 'system_reset' via the monitor.

I'll put a g_free(machine->fdt) before the assignment.


Daniel


> 
>    Fred
> 
> 
>>   }
>>   static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)

