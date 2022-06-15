Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51954CBBB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:51:54 +0200 (CEST)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UN7-0002Nb-4u
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1ULC-0000rW-K2
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:49:54 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1ULA-0000K5-V9
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:49:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id i15so10631408plr.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O+guIKI9lDU+3fL2TOBvxwD3DP6e0iwAQukcVZVaUSc=;
 b=iXHbYnBc1UgCQl4zUaflGfhfNX9NZHAtD8ogOZSMX5OUxXZEJFWVrJcC4uAzakpbhL
 POHF1GjRFdv0BRhaLghvtPN8UuYbv5n21DmJ+bDzk4X0Tsv6NaK4rZaQhDcTXX5M+yg0
 WW3ILFNYdoQKPthEeSsnOwsUCyP+xMgNIWNTut1UtQtgsVSMM8/mW+5aF/XcPg8xWnAC
 p6ojkaGNVnT4A7waiUX/8ULsPbaiwJD7O0H3X2DyD/6/2w+FXE2JvxDjY62C6pq2zs77
 E4r25J2H+OO9mNVuCqS6ZoR44sjsfxNuIKNGqKDpLntllQh7e1ftr5cnV231ebQ9sVNA
 rgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O+guIKI9lDU+3fL2TOBvxwD3DP6e0iwAQukcVZVaUSc=;
 b=qrxjsgZR00r1qfPPR2HpgxB9zxwSkNRGdWhcU679YcYVsBq/HIN751nXTRjruEcNPW
 m/NuWAFEwyETwjKlDSiL2KVoYsmadawpvsVHaTpWpGiT/nSgYY0t8VyoBVC8atCYQTTS
 kvJThhrP0UckRurL15Lse/qkkpHDQRSCMRvT6IfWoeTdvwqzuqRnfaDEiIZWCeJCwz1n
 Fl7/GfEFvcwTeGBg2kknPQUJNkS5e/ysK5dCjfP/5z7yLo1gezQZ2In2LwLRQjWszOBT
 06oALX9GFMsvNY9om4UZRsr3tT3nntvz6IE3zkmNIY84xaZCFriVVPGmZccIVJv/S36r
 /VWg==
X-Gm-Message-State: AJIora8PQvYSNP/SWeNUF/dHS06Cou6d+eEHHKD7uGfiv5c7G/8l2aBC
 u3Oq/SFTJoiZFJ/biwMK2m968w==
X-Google-Smtp-Source: AGRyM1vnuPf77q+tOXLfj2d3d9pY93C4nV+nGWTFN4KJiY382ckTx4YIw70koYUTP1JPBp5iuzTNhw==
X-Received: by 2002:a17:902:d584:b0:167:6ab9:b094 with SMTP id
 k4-20020a170902d58400b001676ab9b094mr102506plh.16.1655304591012; 
 Wed, 15 Jun 2022 07:49:51 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 d27-20020a63735b000000b003fd31d64e23sm10006444pgn.63.2022.06.15.07.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 07:49:50 -0700 (PDT)
Message-ID: <c54a7e95-a187-e7bf-0ff4-058f8d1d3bab@linaro.org>
Date: Wed, 15 Jun 2022 07:49:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 3/9] linux-user: Add LoongArch elf support
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-4-gaosong@loongson.cn>
 <099e6d5c-a48d-29eb-4a6b-0d1bec37b707@linaro.org>
 <d4ce72e1-6084-4c59-393c-62d2bbcbbb26@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d4ce72e1-6084-4c59-393c-62d2bbcbbb26@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/15/22 02:44, gaosong wrote:
> Hi Richard.
> 
> On 2022/6/15 上午12:21, Richard Henderson wrote:
>> On 6/14/22 02:05, Song Gao wrote:
>>> +#define ELF_HWCAP get_elf_hwcap()
>>> +
>>> +static uint32_t get_elf_hwcap(void)
>>> +{
>>> +    return 0;
>>> +}
>>
>> This should not be zero.  See cpu_probe_common in the kernel.  At minimum 
>> HWCAP_LOONGARCH_CRC32 and HWCAP_LOONGARCH_FPU are missing.  I don't know how many of the 
>> other features are implemented in target/loongarch/.
>>
> HWCAP_LOONGARCH_LAM  and  HWCAP_LOONGARCH_UAL  are need.

Ok, good.  For clarity, you should determine these bits just like the kernel does from the 
config registers set at cpu reset, via cpu->env.cpucfg[*].


r~

