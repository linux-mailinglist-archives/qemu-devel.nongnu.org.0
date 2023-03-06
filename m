Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BE6AC1FB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:56:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBKC-0004GG-Tj; Mon, 06 Mar 2023 08:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBK4-0004EJ-J8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:56:16 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBJy-0005D8-2I
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:56:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id k37so5738648wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110968;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZdSv0lHgeVE279Hfv8aoeA94wePvHl7hQEr8dbqNj6w=;
 b=qVf2cA/7dwNlvexoLtPhcjWZaF4RMwIqVaNvXlVtOG0tlrb92sQ6D3GeTJiDezp5ep
 uY5s/e5ky4SHblZeS6SE14y36RagsJUOgBNQiA5+X3EGqdK9IR6i9gfNru038rS4BYm1
 gTk029fnHCtIgIxb5qwardKaF5pnFTX4MfgY8bOI+VGA0n6+WW5atmwBIrmLEwrrnBsP
 V+w3+DX0kg/fcxBPq1o3GrzNnLL3qpqj7m1xoIVQnDyrbsQISrpnjxdFIbImyA1lFD6o
 i+V2inYA2OX3dXvQz8dm9quPKmbVacyyvvUIidxzyLUDJuPlMApoiJctHHhlGEf4B3q4
 QKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110968;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdSv0lHgeVE279Hfv8aoeA94wePvHl7hQEr8dbqNj6w=;
 b=Jp9Nqw3f4uNE5ZPKajyGZHC3n+r0kxjfYQk+rdMKmFpHLSY3/5B/5SQ82H8D1huQ1G
 3M4s68hz2OHDV3BoM4NHipdby46Qf6KpVi7N2zwhj6vUog2WxR7mTb/935gf/6kDO7Lw
 l6FE0QdU6qzZ1eXkWIKRpdZr5w0ifHB+GkFwxfCVxDJGrZGRTUTjcoMh/d9zJ/fDntOW
 +/58OeQ417WusiHi/xwa6QyXwq74E1+0DPT0kSMEuHDL7lA06A57lE3sAK5B31+RHnyH
 xYnEJlYHo3KlcQ9nxqBYVscKkPOHcYYWSDeKEAKYA5nbE0EXxloMDGGWoRO7alM0YVh5
 5Z5A==
X-Gm-Message-State: AO0yUKUzYIaGr0B98jaV2dzMYbLnmpPmXgH943LeGq+ozHvCOcqWY9En
 yY7RkzAffr0uiiDoVD3xftQTow==
X-Google-Smtp-Source: AK7set99rmt/+VNB4VHGVBSfHH+utNvgda+KSHy+qvaS+lbJiAC9QOAzdnY9HBXnujtB0wlL9TxBaQ==
X-Received: by 2002:a05:600c:1c05:b0:3ea:f132:63d8 with SMTP id
 j5-20020a05600c1c0500b003eaf13263d8mr8983744wms.5.1678110968453; 
 Mon, 06 Mar 2023 05:56:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b002c705058773sm10394906wrp.74.2023.03.06.05.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:56:08 -0800 (PST)
Message-ID: <9d2f1933-ad39-89b4-2ce8-785dca4052cf@linaro.org>
Date: Mon, 6 Mar 2023 14:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/70] target/arm: Use rmode >= 0 for need_rmode
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-2-richard.henderson@linaro.org>
 <5935d68b-2b42-80f3-4c88-48c27727b24b@linaro.org>
In-Reply-To: <5935d68b-2b42-80f3-4c88-48c27727b24b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/3/23 14:54, Philippe Mathieu-Daudé wrote:
> On 27/2/23 06:41, Richard Henderson wrote:
>> Initialize rmode to -1 instead of keeping two variables.
>> This is already used elsewhere in translate-a64.c.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate-a64.c | 34 ++++++----------------------------
>>   1 file changed, 6 insertions(+), 28 deletions(-)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index b1fa210d64..1c575de3e0 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -12133,7 +12133,6 @@ static void 
>> disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>>       int rn = extract32(insn, 5, 5);
>>       int rd = extract32(insn, 0, 5);
>>       bool need_fpstatus = false;
>> -    bool need_rmode = false;
>>       int rmode = -1;
> 
> Unrelated, but rmode could be an enum arm_fprounding.

Arf I just noticed ARMFPRounding in the next patches :)

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


