Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D376666275B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:41:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErwx-0004id-FR; Mon, 09 Jan 2023 08:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pErwv-0004hw-3R
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:12:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pErwt-00019C-Bz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:12:24 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d17so8112330wrs.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRanBxiLot6biwzHRoa0Ze8QDICM6Wwu4CAC5u03yGk=;
 b=SY9LysCiVjzZhDQlXVdorxhWJ8yXKTOp1qTIxUxIj1sGfMweBXrMyJQ3kvnA+CUeRn
 1M3mlFcBRml0p2xDiE5+kVrnOyxbTx2tleKO5MTUKpzAiqoAzOJ6eKKWlc8pXyt+Zdqk
 dYmIxAi4UB++gAsymkuJ142Zw3QPRQQq0GSyghfx0cVNBANmkNPJNWo3JjZX2qt2IOFO
 FTw8Ul2OkMfy3On3mFREfaVuZEfwNXE26/pR6Gw0fYZnWmV3dcWXI9do3jLzVztP70aH
 lvMZ1oD41fW0yrpqmWXBNyuFvUBQavnLOoV0RFwQP1ku55Ux0FE4mRTfn1jmBZ5Bga6s
 d/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRanBxiLot6biwzHRoa0Ze8QDICM6Wwu4CAC5u03yGk=;
 b=TA3lNRDTihPf2aT4Us14G7fgE2eMS7YWLlZRTQ/DAj/xk4VgqSfckPfHH05nxaSzUD
 biBdE4bruB/yTTXnb+LxtSeT1Bvry6m8DwmLMjrWB3i5ctWBcow/YkbjboezOK+e5x+h
 lZDvgbjcmDm77TThBTr5TpYayyOs6CgdrGgxnxTCdhy+iks/rzR/TGlFeFrqltNmiPCg
 LU4cB4BD3i1O/nzVvU2lygrMJJKTy7sebNvLZab5q/yhdsyo1YwUa44ksSNGtZfk+5l6
 xhkn2D2Md62a7M99qyyAkGsrQhGiX/h2LVjLsRZs/pAZVCesCN1HGG5ceAOhkTQgpYHR
 8v0g==
X-Gm-Message-State: AFqh2kqnU/Po+Ra6xlNmSBTkc0Lqg6SEMV+MsRneIleKBnxP8Yo+0cfj
 uJ02w3ASDpBp8rXmT8dses0Q4Q==
X-Google-Smtp-Source: AMrXdXs2Ge9kjiWZf9vxifLDJmC51aeaKsYC1LJ5endpLMa6lm4GvCGTrp2UNHuCYBPmONSAj0Ugyg==
X-Received: by 2002:a05:6000:4002:b0:298:4baf:ac8a with SMTP id
 cy2-20020a056000400200b002984bafac8amr18729349wrb.44.1673269941807; 
 Mon, 09 Jan 2023 05:12:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t14-20020adfeb8e000000b002baa780f0fasm8444607wrn.111.2023.01.09.05.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:12:21 -0800 (PST)
Message-ID: <0bd1f61c-757c-1468-e8ff-7730c94d3beb@linaro.org>
Date: Mon, 9 Jan 2023 14:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] hw/sh4/r2d: Use the IEC binary prefix definitions
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org
References: <20230109120154.2868-1-philmd@linaro.org>
 <20230109120154.2868-5-philmd@linaro.org>
 <31e6a45c-3fec-f6ae-875f-b1a8ac8749e0@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <31e6a45c-3fec-f6ae-875f-b1a8ac8749e0@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 9/1/23 13:46, BALATON Zoltan wrote:
> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>> IEC binary prefixes ease code review: the unit is explicit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/sh4/r2d.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
>> index 39fc4f19d9..b3667e9b12 100644
>> --- a/hw/sh4/r2d.c
>> +++ b/hw/sh4/r2d.c
>> @@ -47,10 +47,10 @@
>> #define FLASH_BASE 0x00000000
>> #define FLASH_SIZE (16 * MiB)
>>
>> -#define SDRAM_BASE 0x0c000000 /* Physical location of SDRAM: Area 3 */
>> -#define SDRAM_SIZE 0x04000000
>> +#define SDRAM_BASE          (192 * MiB) /* Physical location of 
>> SDRAM: Area 3 */
>> +#define SDRAM_SIZE          (64 * MiB)
> 
> I don't think changing these help as the docs probably have memory map 
> with the hex numbers rather than sizes so it's easier to match as it is 
> now.
> 
>> -#define SM501_VRAM_SIZE 0x800000
>> +#define SM501_VRAM_SIZE     (8 * MiB)
> 
> This one is OK but since it's only used once in
> 
> qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
> 
> you might as well just inline it there and remove the define which is 
> then pretty clear and easier to see without needing to look up the 
> define far away from its usage.

I did this change after Peter's feedbacks on:
https://lore.kernel.org/qemu-devel/CAFEAcA8MSO4YMEq2FqvpJKUVYE_1CqaB2KLD1YN-YebOhJVgEg@mail.gmail.com/

But maybe I misunderstood him. Peter, looking at it again, maybe you
asked for a definition because when using pflash_cfi01_register() it
isn't explicit what means each argument? So in this case, since the
properties gives a hint on what is the value ("vram-size") it would
be OK to inline?

Thanks,

Phil.

