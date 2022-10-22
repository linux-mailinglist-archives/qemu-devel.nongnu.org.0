Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D7609A55
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:14:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhwX-0004Uk-H9
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1omGFi-0008Um-VQ; Sat, 22 Oct 2022 11:18:03 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1omGFf-0005vs-G5; Sat, 22 Oct 2022 11:17:33 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 v40-20020a056830092800b00661e37421c2so3530973ott.3; 
 Sat, 22 Oct 2022 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lOnN/VxvAA1O8hGvG5cNJHQFrGiXDE+XfOIWFH1byMI=;
 b=I8qcTgnEtOT9bL4NiT3Bpumk6zK4CBDH+ka0MmNNq0thOlgnnXkaQvF4Y8MlJxPDdo
 VZftBXoBnQNO0S+cPRqZM+f9YJFEPWe6HUQaeF0tJHCOI2K+2f+BHxLvCgBHKe7wzgY+
 JcrxrUgSY+VI7MiuixPU9xogzUwLsSoNyBLEav2aCZMC/Sr2+F2JTxX5RD2+dcFhZGa6
 RkGhzL/2awmEAzKNHpsQ/Y04sVI6xw03UdjoknLlH21AJMrdRvzKQ8onFveGiW1eir8I
 SiSSv8GV1lnrjWidK72tnYyrNvx3DvVaH9rwCvia4OumnWqH6QgdJ9BbCBkhbP7e7Oiu
 E0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOnN/VxvAA1O8hGvG5cNJHQFrGiXDE+XfOIWFH1byMI=;
 b=0LfHfUIUOOdi+qkzkv1l03+9kiJq4pOrzLBlId8ICjujt1v8G71mZ0dcpD+30ynboq
 q0JfAXLh60n6uUWdQeHmjxHS/VkZCuIGQPVNBxtIZWA8GuApWDY7g4FonxOMyRWJN5BG
 C/MPU/mrTx4SjCa4Btv0AYxiksTANYiX7I3r2OAO8YfLBH98khUfrysLm6EFVMi1WlMF
 SWeigUlrB5SimXxyXyLMeT8VAQ5pz0SRgnmMmcQ/xbuQ8upRLpEmdygJsAfn3/1VhJe6
 EIfLs6UQ871Y79KAslL9B0AMIHAj+5ZrAxVubf7tLc3SuIzaAk3M2xv+D4AzVAdCnOAG
 /T5Q==
X-Gm-Message-State: ACrzQf0Pi2S5XaOyOT2ybtqnJ4SNX30a2umfVrCRsn4+zbP412pTXPmZ
 Z834Xx6lLyxhI2Y8RswqKDU=
X-Google-Smtp-Source: AMsMyM42i3TtZkfX9KkKrRoFqXdE1Xz67Jxh7pKgSyN6mggO88ThHq8wEcnPiLkA4uyrA+he/b5kHA==
X-Received: by 2002:a9d:5911:0:b0:657:a6bd:372c with SMTP id
 t17-20020a9d5911000000b00657a6bd372cmr12907232oth.6.1666451849081; 
 Sat, 22 Oct 2022 08:17:29 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b00342e8bd2299sm2266096oif.6.2022.10.22.08.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 08:17:28 -0700 (PDT)
Message-ID: <4d7ee658-7d59-d4d3-9cc3-c257cc1a0d02@gmail.com>
Date: Sat, 22 Oct 2022 12:17:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 1/8] ppc440_uc.c: Move DDR2 SDRAM controller model to
 ppc4xx_sdram.c
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
 <2f2900f93e997480e54b7bf9c32bb482a0fb1022.1666194485.git.balaton@eik.bme.hu>
 <9cf98147-3ddb-c456-78e1-afcbc3e61881@gmail.com>
 <8f8b5db8-8c69-7bac-617d-933ee040a0f6@eik.bme.hu>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8f8b5db8-8c69-7bac-617d-933ee040a0f6@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/21/22 21:09, BALATON Zoltan wrote:
> On Fri, 21 Oct 2022, Daniel Henrique Barboza wrote:
>>> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
>>> new file mode 100644
>>> index 0000000000..b49a7ed60a
>>> --- /dev/null
>>> +++ b/hw/ppc/ppc4xx_sdram.c
>>> @@ -0,0 +1,348 @@
>>> +/*
>>> + * DDR2 SDRAM controller:
>>> + * Copyright (c) 2012 François Revol
>>> + * Copyright (c) 2016-2019 BALATON Zoltan
>>
>>
>> Shouldn't your Copyright be 2016-2022 for this new file?
>>
>>
>> The rest LGTM
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Thanks for the review. I'm not sure about the date. I did not intend to increment this every year or with every little change. It mainly records the time it was originally wrritten or when major changes were made. I can't decide if these changes in this series are big enough to need a new copyright date but I don't mind either way so I let you decide. I'm OK with it as it is or also if you update it on merge.

Let's leave it that way then.


Thanks,

Daniel

> 
> Regards,
> BALATON Zoltan

