Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6351B156
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:46:57 +0200 (CEST)
Received: from localhost ([::1]:57294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMpk-0008Jz-83
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmMoQ-0007NB-SP; Wed, 04 May 2022 17:45:34 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:38132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmMoP-0005Y4-2T; Wed, 04 May 2022 17:45:34 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e5e433d66dso2546496fac.5; 
 Wed, 04 May 2022 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Taf3ljLiP3GtleE2Lp27LxHFTlb9TH1USzN/xvKm9vY=;
 b=JhgNcZ+ZE6OpDLK9/v5Jf6yQP5kaVsd1m7iIxp80WZ+yOLv1Hfpn1661q0ypH5Xzej
 4/4s06XTtoqpof7074yGW/4C/5eJPtbTDepuKmz4xq2vVJLLbH7XfiQSMOYE2X9wyuTd
 RZRTO41zZBH4PnSM5vO3KVxmAB8gJaEblLuIVTDQ3FfGegVQfuM265L98nxYZGvla7Eq
 jVOtwrqUnCoYO6oOmjs67fr4Lx/e74K3RTkgGwGNZl9I6sGXuU663RK8HPDg/fwvg6jt
 5aZ3aZOXudhcIt3i2BOWBJMc+SKXFd866DGMaiP38I9HxgW/Xr5pLz/6lA61uqYvAvy7
 1DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Taf3ljLiP3GtleE2Lp27LxHFTlb9TH1USzN/xvKm9vY=;
 b=BI0YJ6EYskwFkpJnbCVp46InKjYdIGuWZWLjyqQKdMHl9YSA8TiYqBJzM6s6DPUU2I
 qCEVQQe9V37Ao5dsSu5qIRHNDohg3r2+4Nt7mDIfCWvLcj+Cycpmb6d6smz1sdWRi63s
 qxj/m6VzmiCX9xmHCtjVLwPvpOOGp+RfTZrJwD4CBvU4wg35ecx/EU81ynbdgeHlxS4t
 6WJTsEsC3jSZ7XY+SRqtTfgHcedkbHYFAMc3r0983WWf8N5F5Acj3MIEEqSoRnhN1fa2
 +IaCAILtwd5k4K2a6eQ+87gqXLtcqV2YSG99l8QK6CF7V0FZZfaX3beqjG/vojitEBFf
 3pkA==
X-Gm-Message-State: AOAM533Lr7Juzr60HRk7vUD4Dl5PMWbvmsa2VRk/bbaJEZ1cRg/8so0o
 13Xn1I4kp7UkIG49y0MGXUc=
X-Google-Smtp-Source: ABdhPJz2hyQPCkC5o4VtrZ2fXgv71F7U6+HPZH12qS44mJhR8l9fi73TvHgV0ZWD3QjA/YGL7U+rnA==
X-Received: by 2002:a05:6870:708a:b0:e9:9349:9410 with SMTP id
 v10-20020a056870708a00b000e993499410mr784672oae.265.1651700731217; 
 Wed, 04 May 2022 14:45:31 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 t4-20020a4adbc4000000b0035e9f149b90sm40811oou.3.2022.05.04.14.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 14:45:30 -0700 (PDT)
Message-ID: <0debc21d-fefa-bb7f-6fdc-3d542d463751@gmail.com>
Date: Wed, 4 May 2022 18:45:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] vhost-user: Use correct macro name TARGET_PPC64
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, mopsfelder@gmail.com,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>
References: <20220503180108.34506-1-muriloo@linux.ibm.com>
 <20220504165920-mutt-send-email-mst@kernel.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220504165920-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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



On 5/4/22 17:59, Michael S. Tsirkin wrote:
> On Tue, May 03, 2022 at 03:01:08PM -0300, Murilo Opsfelder Araujo wrote:
>> The correct name of the macro is TARGET_PPC64.
>>
>> Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
>> Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
>> Cc: Peter Turschmid <peter.turschm@nutanix.com>
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ok to merge through the ppc tree

Thanks for the r-b.  Queued in gitlab.com/danielhb/qemu/tree/ppc-next.



Daniel

> 
>> ---
>>   hw/virtio/vhost-user.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index 9c4f84f35f..e356c72c81 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -51,7 +51,7 @@
>>   #include "hw/acpi/acpi.h"
>>   #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
>>   
>> -#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
>> +#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
>>   #include "hw/ppc/spapr.h"
>>   #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
>>   
>> -- 
>> 2.35.1
> 
> 

