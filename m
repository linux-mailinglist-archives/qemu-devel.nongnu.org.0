Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447F4786FC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:22:25 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9RY-0005U3-B7
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:22:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my9Q8-0004bq-CU; Fri, 17 Dec 2021 04:20:56 -0500
Received: from [2a00:1450:4864:20::32e] (port=35450
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my9Px-00040l-Nw; Fri, 17 Dec 2021 04:20:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so3612127wmb.0; 
 Fri, 17 Dec 2021 01:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5HfZjIoZUfFgeSRI7dQ3PlPOnvGyuQGMl2VXD7j//6c=;
 b=HHvCVEW21I/s6S98hXB73ec9UCo1LLPe6Vhd8j4NVtqJk/0lqjwSp4z4zaMF74VLi2
 ytOtb47lVyWoXK4xVXRGKzWAU8GhcCbgGtHBIQhar9RfKH84vXdRbLYK5+HjAgNTv2Sh
 1eBIJep1mOHAMt3L8BkzSy/p4nc8AZAaaxpgJe1KlIy0u3Ldy6R1D2dU8JrVlkJoFWDP
 b0YzNxqNntMyntMsq/wZyIo/jctpoFOWppaTwxA5i/ds9Fw7r5xkJXOhc5vsKsNwqbtT
 OznmUeBaJeT1HYtmzXI5d72BEbuMEqRCm/YnkoghtjXnS/RG9jzwG6doTCt7e0WrhHxK
 JkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5HfZjIoZUfFgeSRI7dQ3PlPOnvGyuQGMl2VXD7j//6c=;
 b=hUdpCwWCs5sgBFQFh6c+gEhGCb8pbkxqmk8osMjq7A1/PxRE5IdfnMCwPG9PzHU0iU
 dwN+Uj3WGsH5LNRBAHr82wNU/wVCi9XdhbsAjZT0GavPUG2kBCKm7qczccEbLhSqrjSP
 zEBoSBJQa77ZgwrlXWRG3X4cPXqeK1o6rAwUlCdyaTqDzuAHijY7GsO3A4M7GskawaSc
 7ivAxFISMu9Oh/yKSm6IhlZsWBqFE5KpGh68dU1nU5Fq2CvEoOGjIJQ73KXDzn1BJjce
 2j0ROBv9eDHhr2jcABQzzygPXjY4kXQE0Poh7pR+ym9Xe3y03MYGpVjOB6unPFz4oKZb
 Rn+Q==
X-Gm-Message-State: AOAM533IuZJ1DLsDACY+ZOWhTVwg89aGPpPPuY/o2qgrT92soVUowUd7
 RcRdL70sp6VySTyKsdF3qtY=
X-Google-Smtp-Source: ABdhPJyg4rq5YuBwG7HDsXc9+Xj1CY2MXx0Xn4wEPefZloZ6zlMJxX9qEg4tEAtYQCRaxl5KJZvbZQ==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr8866063wmk.11.1639732843044; 
 Fri, 17 Dec 2021 01:20:43 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id s8sm7960585wra.9.2021.12.17.01.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 01:20:42 -0800 (PST)
Message-ID: <12dc17b7-7e79-39a8-2f96-a94d8a8b6f9d@redhat.com>
Date: Fri, 17 Dec 2021 10:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/scsi: Fix scsi_bus_init_named() docstring
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211122104744.1051554-1-f4bug@amsat.org>
 <c411d129-cbb8-42e1-08fc-c10b081aae03@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c411d129-cbb8-42e1-08fc-c10b081aae03@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 11:29, Philippe Mathieu-Daudé wrote:
> Hi Laurent,
> 
> This patch is reviewed, can it go via your trivial tree?

Queued, thanks.

Paolo

> On 11/22/21 11:47, Philippe Mathieu-Daudé wrote:
>> Commit 739e95f5741 ("scsi: Replace scsi_bus_new() with
>> scsi_bus_init(), scsi_bus_init_named()") forgot to rename
>> scsi_bus_init() in the function documentation string.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/hw/scsi/scsi.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
>> index a567a5ed86b..2ef80af6dca 100644
>> --- a/include/hw/scsi/scsi.h
>> +++ b/include/hw/scsi/scsi.h
>> @@ -158,7 +158,7 @@ struct SCSIBus {
>>    * provided by the caller. It is the caller's responsibility to make
>>    * sure that name does not clash with the name of any other bus in the
>>    * system. Unless you need the new bus to have a specific name, you
>> - * should use scsi_bus_new() instead.
>> + * should use scsi_bus_init() instead.
>>    */
>>   void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
>>                            const SCSIBusInfo *info, const char *bus_name);
>>
> 


