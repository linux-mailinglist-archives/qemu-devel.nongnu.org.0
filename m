Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FFF68B704
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwR5-0001br-Do; Mon, 06 Feb 2023 03:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOwQr-0001ZR-BL
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:01:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOwQl-0002BQ-VL
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:00:56 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bh13-20020a05600c3d0d00b003dff6cd8b7eso2823353wmb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 00:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E8enFH9WefQFcp6XrVL0TAqMrbXSiJrkj0atpsmnPqc=;
 b=wdIjR55aR3eoCCIMSGts4Y3M/7hS+9M629WiS93+DKGvzsNxPba2UOl7ye+7IWSTaj
 9+dEcDixzA2vCcktUtDQ+qrcSMCaj6Z5FHQ2miBcwsrljETh+/9n+wHhJ6yu7GpTCr2g
 JI5eJ+MR+G9hRPVove9XQVh3DKRm2LkJfOXJ3mKrJ7iC7QHREZnCpDYEvOyEaqz9FBdf
 W0D+lNSujHHtZML6dID2Sq+4gem+lW1qIyh2sVUTCi3cn5nS350IPd1ArNeJI9L05v5F
 E6JSGPhjrxKZ2jqbxdv2v5ZLHIxCOSDIHNcg2XTt2wXrovjhvlrUQ3Mg+xVB+Gxjmt5m
 Cq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E8enFH9WefQFcp6XrVL0TAqMrbXSiJrkj0atpsmnPqc=;
 b=CFBnMbsO0ROdqaEFXIy+BxRCyvkleKMf+HndOvXZqEzHqHHoJoMV9WeSltX9/rzUlo
 4u0XjVlRyxJ37eQj0cV0VyVfiv6RrxMTn8Pmn0MX1YCq7t2sYqr7c2buZuZXWoJnp2uS
 OZN3Oi1eAf8g/D4djxu6ph2wwOPbhJWH5msiqA2sR6DvcXWTTZuwi9KLehGfTrC/gaeI
 muXap+806GcfAYWi7LyuvmrHIreZDgvsk2PGCfNktGtDlPlUhPnT0dKwcEQyGAkqsGPp
 p98p3u570xuixwXieEpwIIXPnorTcGyRLWwHMR2taGRRQju678K7ls4doLtn9qBeyc0g
 SZjQ==
X-Gm-Message-State: AO0yUKVYchsmHw+3ss2GtoCl0XNVj/QiAVZnpIrof12qYdWSj8PHcZwU
 SDzySiNceXu2wIp8x7YFW775Mw==
X-Google-Smtp-Source: AK7set+7HMoEfjvtVXWF5/LeO8MQelHI/QphqEptVKUsNDeyiwa5bQvQR3bi3z/Elg+1UZ4+k//KaQ==
X-Received: by 2002:a05:600c:444f:b0:3da:c07:c5fe with SMTP id
 v15-20020a05600c444f00b003da0c07c5femr18108850wmn.5.1675670438923; 
 Mon, 06 Feb 2023 00:00:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c358200b003dc4ecfc4d7sm10747218wmq.29.2023.02.06.00.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 00:00:38 -0800 (PST)
Message-ID: <78bc4dd9-f713-3824-1d87-74f3011b019d@linaro.org>
Date: Mon, 6 Feb 2023 09:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] hw/isa/vt82c686: Allow PM controller to switch to
 ACPI mode
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-3-shentey@gmail.com>
 <9611ad50-1c60-de0a-e8e0-85b487950888@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9611ad50-1c60-de0a-e8e0-85b487950888@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 31/1/23 15:54, BALATON Zoltan wrote:
> On Sun, 29 Jan 2023, Bernhard Beschow wrote:
>> Adds missing functionality the real hardware supports.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>> hw/isa/vt82c686.c | 18 +++++++++++++++++-
>> 1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 2189be6f20..b0765d4ed8 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -37,6 +37,9 @@
>> #include "qemu/timer.h"
>> #include "trace.h"

> Why does 
> acpi_pm1_cnt_update() take two arguments for a bool value? Can these be 
> both true or false at the same time?

No, this is a one-bit so boolean is enough...

Maybe unfinished refactor from commit eaba51c573 ("acpi, acpi_piix,
vt82c686: factor out PM1_CNT logic")?

