Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A86649B61
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4fIU-0000yu-7y; Mon, 12 Dec 2022 04:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4fIB-0000yZ-9p
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:40:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4fI5-00073p-T4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:40:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so11423030wrh.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ZFe0mAjkEr7c5fF+DPqUNeB5pvwSAEiE/xZMEkAoqI=;
 b=q7lRFGeoiURYEtg5PrEEMqSsnA4GARNA5+3bD2TgBlr90qi8GY5BwRuyMquhatEiXa
 RZLLSHgFz790JgaaJqE7YFRngLHPwMdRR+7OGRia6M16h5CE17CP8BlGp/VtRt37HHF8
 XJb+hfANd8cTDNXsFOdijY+OYUlU6NuwIPBTCbu2QvQ8X29e2qdwALQIpItTPMLeg8Sg
 Joz+pETF3yX+8jUeDWXr6QwwaN9kFeZUVrHmoYh6v0P4we86os/pkjPwlIA0NJm7noZv
 x23YJi7yDyt01MIeEMueSMctqUgjU/oGJAms+BG6DP7Id+waxeblbfaM1JTLyjiOc3C7
 TSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZFe0mAjkEr7c5fF+DPqUNeB5pvwSAEiE/xZMEkAoqI=;
 b=PmwaMIdMGVwzcPKQf5ATG4cmgaE2k2CkntjOKCVdwz+RuhymXWn8KYR1umdF1Tmdyy
 bMUfEvv8qyRFLyR4AmauWVSXvL8/llYN1fqSb0+b5puFSUsEio5ZIoYgRLherJBa3MMt
 D/IkZe6pT1enD7oy5cxCuLM85Pu8oguyMehfiGpky42Np0aKc3Tyj3kUcQW4gFhq9BuU
 nsRd+r8YgqkoO0W0XXeMMyDnHJIEk79AeMX6EU1qe1OHhfJ3B9cNqlVQP+sqhK5Lltsu
 sgCxOP/YV5XfkQ3+xs+RKAyhKQpLucPvWef/EvK9g7xFNAJ093PTVL7cjkBEwsHkKSb/
 ts1Q==
X-Gm-Message-State: ANoB5pk+FX3eutw8RJIg0cZjhVdlneixZExqk1SMsCM29xv4n5SGBJ2E
 wOdFensXaE8YsqbXLi1vQt6xNg==
X-Google-Smtp-Source: AA0mqf5bPYESP7dNSA9hBwfVU9rDdyRDmAgFjT9UtLNzCFsRsGB2yuxqD23D+Y57xpjB8afnvwe0Wg==
X-Received: by 2002:adf:b64f:0:b0:242:6a47:1ad5 with SMTP id
 i15-20020adfb64f000000b002426a471ad5mr9866835wre.58.1670838004204; 
 Mon, 12 Dec 2022 01:40:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b0024278304ef6sm8333344wri.13.2022.12.12.01.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:40:03 -0800 (PST)
Message-ID: <cc1fd59b-10ad-2d43-1055-a4aa67adafc6@linaro.org>
Date: Mon, 12 Dec 2022 10:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v1 03/24] vfio-user: add container IO ops vector
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <d357c8c243ef839cc8e41fc1ae5c8db2d98fc2cc.1667542066.git.john.g.johnson@oracle.com>
 <f3cda64b-ed4b-5e4d-5a0d-82c3b3861d41@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f3cda64b-ed4b-5e4d-5a0d-82c3b3861d41@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/12/22 17:10, Cédric Le Goater wrote:
> Hello John,
> 
> On 11/9/22 00:13, John Johnson wrote:
>> Used for communication with VFIO driver
>> (prep work for vfio-user, which will communicate over a socket)
>>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> ---
>>   hw/vfio/common.c              | 126 
>> ++++++++++++++++++++++++++++--------------
>>   include/hw/vfio/vfio-common.h |  33 +++++++++++
>>   2 files changed, 117 insertions(+), 42 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ace9562..83d69b9 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -432,12 +432,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer 
>> *container,
>>           goto unmap_exit;
>>       }
>> -    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>> +    ret = CONT_DMA_UNMAP(container, unmap, bitmap);
> 
> I am not sure these macros are very useful, compared to :
> 
>      container->ops->dma_unmap(container, unmap, bitmap);

I was going to report the same.


>> +/*
>> + * The next 2 ops vectors are how Devices and Containers
>> + * communicate with the server.  The default option is
>> + * through ioctl() to the kernel VFIO driver, but vfio-user
>> + * can use a socket to a remote process.
>> + */
>> +
>> +struct VFIOContIO {
> 
> VFIOContainerOps seems more adequate with the current VFIO terminology
> in QEMU.

Yes please, abbreviated "Cont" is not helpful.


