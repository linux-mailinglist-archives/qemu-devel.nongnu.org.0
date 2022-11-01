Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA2614926
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppVo-00045p-HR; Tue, 01 Nov 2022 07:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oppVn-00045h-7s
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:32:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oppVl-0007rF-HA
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:32:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id w14so19678021wru.8
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0oKSWeSXamUvwlu05TAnrXE3PovCrkARmMjD0qbTuT0=;
 b=jQZZrx1fa221LrEeX/1kFSV5ynCamLfkEdNSZxHTgaYkbO/vC3o9UliSrwHcEXkbJC
 S0KuokaZxzSO5EIWJvQ/yRDBk4o4zdIyyUepJXV28ZVskGLp0P30A5U5Jreum38QMe2T
 K7c0uhC7IQdcdLw58EExAewwy0014138MkygG1tYs25BqktS4pOnY00yz0p87N4dZ5wz
 foUJfWzAthk4ZXPUeMqmA3SAYfscgO4qb7z+k4LBmoAb0nrO/njyyQ0BPcaKRzJ1zybr
 zGbgyuqkMzq05BdgrjOdQx9eZwtgig4dIi45mR8JbzO3QxbnNc63uyT+6LUdfEQNQ4Tz
 jbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0oKSWeSXamUvwlu05TAnrXE3PovCrkARmMjD0qbTuT0=;
 b=3/+/iAYbpqSJ8bzHPsP5MazxDQreDZO6HcQw4v2FTreMqQAZQLANoHJGxyNyOdCUtP
 wqCDf57lO4gNsUO2kr+YTC1V1RmNWcE1rntb/xqeL3z8Kx5PxTsGy1LXBchNwLHzdo4A
 4IJVXkAip7oNcFW6mPlMGtqpRF3lDk9EB+VNMhztdVxEtL+DKDXDZRerRHlQJv9MSZjL
 1bcRbpIGYkii8JwwQjL+NsYLrj1XqQiq7ftABsbOYqr3rSg3o8v70W6iS3V+/ci9UwnY
 xEjLgfuuReJnNUXMXaGlVbKLH3Nlnfkt9NyL2pWxXg9zPTQ2r9muzTtvkxCo4zjxm41k
 MVsw==
X-Gm-Message-State: ACrzQf2HZl51HuY6p3nygREFBQQJ6zOTXJ/9HJoqovamLiG1X35UUc/M
 y1IGv19lzymP9LKhO0sZdrbtUQ==
X-Google-Smtp-Source: AMsMyM7FZ3kuVRIyRddCpLZdozXEfLSObGviih0Lz1onLurtZyQUANH6mjebiLsb7shkDA0+nRA/Qw==
X-Received: by 2002:adf:e30f:0:b0:236:d8ef:9ede with SMTP id
 b15-20020adfe30f000000b00236d8ef9edemr4812754wrj.170.1667302370911; 
 Tue, 01 Nov 2022 04:32:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0023677081f3asm9798733wrw.42.2022.11.01.04.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 04:32:50 -0700 (PDT)
Message-ID: <943fd239-2487-8426-f3b9-f1007c4059d8@linaro.org>
Date: Tue, 1 Nov 2022 12:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 16/24] disas/nanomips: Remove IMMEDIATE functions
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-17-milica.lazarevic@syrmia.com>
 <78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de>
 <3584ab7a-7a0f-753b-ea5a-c6e9bc546d0c@linaro.org>
 <4015d586-f0ff-40a3-7d66-49b05be8f00a@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4015d586-f0ff-40a3-7d66-49b05be8f00a@weilnetz.de>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 12:28, Stefan Weil wrote:
> Am 01.11.22 um 10:27 schrieb Philippe Mathieu-Daudé:
> 
>> On 1/11/22 09:28, Stefan Weil via wrote:
>>> Am 12.09.22 um 14:26 schrieb Milica Lazarevic:
>>>> Both versions of IMMEDIATE functions have been removed.
>>>>
>>>> Before this patch, we'd been calling img_format twice, the first time
>>>> through the IMMEDIATE to get an appropriate string and the second time
>>>> to print that string. There's no more need for that. Therefore, 
>>>> calls to
>>>> IMMEDIATE are removed, and now we're directly printing the integer
>>>> values instead.
>>>>
>>>> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
>>>> ---
>>>>   disas/nanomips.cpp | 756 
>>>> ++++++++++++++++-----------------------------
>>>>   1 file changed, 265 insertions(+), 491 deletions(-)
>>>>
>>>> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
>>>> index 816155527d..441204bb84 100644
>>>> --- a/disas/nanomips.cpp
>>>> +++ b/disas/nanomips.cpp
>>> [...]
>>>> @@ -3305,11 +3271,9 @@ static char *CACHE(uint64 instruction, 
>>>> Dis_info *info)
>>>>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>>>>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>>>> -    char *op = IMMEDIATE(op_value);
>>>> -    char *s = IMMEDIATE(s_value);
>>>>       const char *rs = GPR(rs_value);
>>>> -    return img_format("CACHE %s, %s(%s)", op, s, rs);
>>>> +    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, 
>>>> s_value, rs);
>>>>   }
>>>> @@ -3329,11 +3293,9 @@ static char *CACHEE(uint64 instruction, 
>>>> Dis_info *info)
>>>>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>>>>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>>>> -    char *op = IMMEDIATE(op_value);
>>>> -    char *s = IMMEDIATE(s_value);
>>>>       const char *rs = GPR(rs_value);
>>>> -    return img_format("CACHEE %s, %s(%s)", op, s, rs);
>>>> +    return img_format("CACHEE 0x%" PRIx64 ", %s(%s)", op_value, 
>>>> s_value, rs);
>>>>   }
>>>
>>> Do we really want to format "int64 s_value" as a string? The code now 
>>> has lots of wrong format strings. Add the patch below to get the 
>>> compiler report.
>>>
>>> We once had a discussion about using G_GNUC_PRINTF for local 
>>> functions or not. I think that this example clearly shows that it 
>>> should be mandatory.
>>
>> Yes. The problem here is nobody wants to maintain this code, but we
>> inherited it. IIUC this series doesn't make it worst, it just remove
>> the C++ dependency on UNIX-based hosts.
>>
> 
> I expect that "%s" with an int64 s_value will cause a crash while the 
> old code worked, so things are worse now and should be fixed for the 
> release. If nobody maintains that code, I can try to prepare a patch.

Well since I merged I already prepared some patches to fix this.

