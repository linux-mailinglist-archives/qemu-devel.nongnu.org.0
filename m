Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159D623F17
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4GP-0003zZ-BL; Thu, 10 Nov 2022 04:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4GK-0003yX-So
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:54:21 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4GJ-0005K7-Ay
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:54:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 r203-20020a1c44d4000000b003cfa97c05cdso1270974wma.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=REgkQxRARMi48PfmAasEjKYo7kp4BFH2kurz6rFvCyc=;
 b=kBOGFkoWqkNWwobuRqxBEdwXWcNXASzsYQM50EJsMNiDBCMqnTti+2iqUDo5Ss/NSr
 7u5+vxC5gIgIGqdpn3zL8Z5tgeJqAwjsxc/w0lD7Igyl85Wl7ylIh3HSeYjd4tBa0M1i
 DEMKuI8i6BA6P+74EYDrFw5djsg+DFqAMnfGF9XRZ2JUKPi63zkrV4vxBlOKqIhrSiBe
 fjX8BLsBXAw25baEiBKlfIcv8uBwHR2dOh/sjz/JhVWoVjh4tm8gHLv1gb84/GRfaH7s
 pn6o57SLPZaMPc9irjEJzbF7rifVqBEuL7MxymqV2mwfTSiHu3uR0tmNz+8/vRPQAw9v
 v+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=REgkQxRARMi48PfmAasEjKYo7kp4BFH2kurz6rFvCyc=;
 b=pBEsdeGFV3Yb3vAQ21wRkXep0Nra7ZA68cLvqMdPdH0EpyKumYsAj/JvFxJw54ZvPK
 MoNp69c15wopn2udsPryOjxj8/s5DNCeWVLWFr7+IUaT1aulEZeO6589DXvOPj49iD1o
 ni3VdXxQuiK3pwK+s0QpqHIxEwDJyLXIaxsekpwGvQ/aomFElcxvvzk2T/k93sTqGjQ7
 ZceWGUKMwWGXcW7mPCM/s0VrH9PQa9a+7F0mk539XHICQMV2PQXLiywyQHxjHULhJLBI
 KB7IQKLiSKki/C+BInRkKdPAdMynvuarvY5W9trhxxBxIaCoBDM4dpmB5cSzVJe87Ag0
 P1XQ==
X-Gm-Message-State: ACrzQf2yBu4vjYhM+Ua2maiu4q43IXv6/9RU9ZQc4atXDTz6uEK6G9GI
 qipVomBaj3s/bMy2r+XvKQ+FHg==
X-Google-Smtp-Source: AMsMyM7RkfdZ8wFjF4jJLRQd33XxaBT6MQSHnznsuaoS959IlczaymDON4EGf8cdvSTv7V2uaGMmlQ==
X-Received: by 2002:a7b:cbc1:0:b0:3c6:c013:9345 with SMTP id
 n1-20020a7bcbc1000000b003c6c0139345mr1009276wmi.172.1668074056740; 
 Thu, 10 Nov 2022 01:54:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003b95ed78275sm4984593wms.20.2022.11.10.01.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:54:16 -0800 (PST)
Message-ID: <a769c3cf-2b7a-acaa-db5b-4808eb64c351@linaro.org>
Date: Thu, 10 Nov 2022 10:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-7.2 v2 2/6] hw/nvme: fix cancellation of format
 operations
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
References: <20221110070523.36290-1-its@irrelevant.dk>
 <20221110070523.36290-3-its@irrelevant.dk>
 <b408f286-2262-480e-01d7-230240bc743c@linaro.org>
In-Reply-To: <b408f286-2262-480e-01d7-230240bc743c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 10/11/22 10:53, Philippe Mathieu-Daudé wrote:
> On 10/11/22 08:05, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Cancelling a format operation neglects to set iocb->ret as well as
>> clearing the iocb->aiocb after cancelling the underlying aiocb.
>>
>> Fix this.
>>
>> Fixes: 3bcf26d3d619 ("hw/nvme: reimplement format nvm to allow 
>> cancellation")
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>   hw/nvme/ctrl.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 918af03d32be..819c02067191 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -5762,8 +5762,11 @@ static void nvme_format_cancel(BlockAIOCB *aiocb)
>>   {
>>       NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, 
>> common);
>> +    iocb->ret = -ECANCELED;
>> +
>>       if (iocb->aiocb) {
>>           blk_aio_cancel_async(iocb->aiocb);
>> +        iocb->aiocb = NULL;
>>       }
>>   }
> 
> What about nvme_flush_cancel()?

Ah, this is what the next patch fixes...

