Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F42CBAD6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:45:08 +0100 (CET)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPdD-0003UG-O5
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkOFs-00049G-3o
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:16:56 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkOFp-0000fV-VU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:16:55 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so5128719wml.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b0FuHWJGms83Rg1dMKMF60Ljln/6z/ALzb/u0yjVSVQ=;
 b=gWMvnq5QsHlrzM1GZmuDQc3TJNkL/vKCGpgTBaEk5q5ZMlortTaP2RBph/1gqDufk2
 Xi9Tt0DYTZ67BdkYS7TYd9cHjj4Hb4R1gRp9vBzMvfTKVSzrDW8sKpRRGQvyyN7q1jSe
 bjow32l+AQN619a9WGm1bSEgaE4HJrAfReIytvfT3rCHOcrxQRjIS4r8AQng0rVY7NFH
 j5YhigbNDheqRD/T71NN4XgneMvSf/lqgG0sFavthu8zJRFRKzGQVBxpTZwFEa84bFKT
 eVQ/CZ+pJFRaUy/oPc83BnqKXdiMgVy/1ud23btThEH+7JkNVc0q6GCNaog/24S1P2KG
 Llcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b0FuHWJGms83Rg1dMKMF60Ljln/6z/ALzb/u0yjVSVQ=;
 b=lUGvjU3jLXP1rRJrpUrM6m59PnzwwpM9vhbVZ9hVyLA1gvA02UhZy2QEYuqouqVCQY
 oVKGPCA+rMc1NweJVO88HBo+yPsEyx8TIWNWb8Hig5vD2JKrgS9knXmajW2jDAz5FBoS
 U98rcZ6/zzwPc4xBdY8t8oUggAACIbswjYVtgTZqxPhFPx7auPVVwmebDSG4BYCRb3l6
 0XYeOvPV6h+L3D2cnyNwId1rgXvCPxScTabyULZdhTnjgDARYHETL3gLv3IYEElrPRK7
 iP7+wsJQv3CYBh3OCK9ZudHbDuSB+qWFMlbN8BW1shjf3ePrwyg3te95qcetYsiPU3QE
 1qsw==
X-Gm-Message-State: AOAM531Ku4eX2pHOg/WfTn7ENcz4jB4ZUd2XQhhFoQGw77u9t84DAAwi
 5/z1OeYIOWYxoeKVw5ToOcg=
X-Google-Smtp-Source: ABdhPJx4ukEMbv9l8erXPwbD8rrSQciietN/iuIwVX92wlju6qUKm1tAYv72StF/I0eFtlbIIu1fag==
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr2047944wmg.55.1606900611689; 
 Wed, 02 Dec 2020 01:16:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g192sm1226871wme.48.2020.12.02.01.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:16:50 -0800 (PST)
Subject: Re: [PATCH v3 6/6] linux-user: Add support for MIPS Loongson 2F/3E
To: chen huacai <zltjiangshi@gmail.com>
References: <20201201192807.1094919-1-f4bug@amsat.org>
 <20201201192807.1094919-7-f4bug@amsat.org>
 <CABDp7VqonBqH_PZGQ1e60K5-APJwNHf_UM+x8w6E28yhHeVsfg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7862974b-84e3-5390-9799-ab39250f0af4@amsat.org>
Date: Wed, 2 Dec 2020 10:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CABDp7VqonBqH_PZGQ1e60K5-APJwNHf_UM+x8w6E28yhHeVsfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhc@lemote.com>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 2:01 AM, chen huacai wrote:
> Hi, Philippe,
> 
> On Wed, Dec 2, 2020 at 3:31 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Userland ELF binaries using Longsoon SIMD instructions have the
>> HWCAP_LOONGSON_MMI bit set [1].
>> Binaries compiled for Longsoon 3E [2] have the HWCAP_LOONGSON_EXT
>> bit set for the LQ / SQ instructions.
> What is Loongson-3E? I think you want to say Loongson-3A?

Yes =) I have been confused because I looked at the INSN_LOONGSON2E
and INSN_LOONGSON2F definitions earlier.

Are you OK with this patch if I change
- 3E -> 3A in subject and body
- Longsoon -> Loongson in body?

As you maybe noticed, since Loongson is currently the single MIPS
area with contributions, I am trying to strengthen it and ease its
maintenance by adding (and running) more tests.

> 
> Huacai
>>
>> [1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
>> [2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/elfload.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 2ba42d8e4bd..5a39a7dc021 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -1023,6 +1023,8 @@ static uint32_t get_elf_hwcap(void)
>>
>>      GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
>>      GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
>> +    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
>> +    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
>>
>>      return hwcaps;
>>  }
>> --
>> 2.26.2
> 

