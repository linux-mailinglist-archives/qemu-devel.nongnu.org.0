Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9444D744
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:33:30 +0100 (CET)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlACn-0008RY-J3
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlA8f-0003tK-Ov
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:29:13 -0500
Received: from [2a00:1450:4864:20::334] (port=34370
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlA8d-0007k8-Qv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:29:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso5494459wmc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q1ugXooJsnYEqPpdG6QE0vPVdMribxBKN6NIvQctjSs=;
 b=EDa6r/YMtiurTuqAfSR8bDoiwp5KpMHxl9qSLhDqJwAWeVI5MyZRbvTFFySHQbYV3+
 NO2JYjfknxY4CxyVg+y0BQfEDOZsljfWfxm7HQl7VFiTXKKSrhCxS9GlW6igLwqFJmpl
 CmhOmMiu3ExJi6XVhFB44EC9oyJL8cdXS3JNJcOcswp6llqae+eRjDdG5F7TQagzWzaa
 rykp5uO/jSo2VjvSZYIT2dHjaU2Zd8o3QRKqWVeiSuOERbIsy+/WvrDlyAPUL2mCM7+N
 bdlYwNUXZ36raJhHyrxLpuPHlewIms3Knj4Hj6nspJ4qzfT1LNyPMln3JtFrQRFy9yvF
 6YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q1ugXooJsnYEqPpdG6QE0vPVdMribxBKN6NIvQctjSs=;
 b=lYu2ckzeAXtQQqXf1/+H73pKt5OKVKT75sxjVnXTmOmRPRHGpMDtRiyo9uQH4ccg6a
 va2v6o973hBlR12bmWLZiUHYMTHZGTC9Y6fto4l+jxnyeuZhhH/5yr5uywLAI7+X0kgv
 bYsSMEUzUPsTQsmFI/UBlvsY+5ddxfrOBjuhlG8x/7E0brgfiVSpOw61QuWkK2h2hcpx
 TwqkV5Acwqd+yytVahf/C1cx5g2BYAYwRGh9CLuRbuPLeP02Q9QhnUgbQ6EGGS9Mk/VK
 KX7kY7ICtDLfRUoRJM1TkzBef6rHs0oZ1hRND8BmD0oBkWkwQGkfOJL8iiSouNfdrRtL
 6mzA==
X-Gm-Message-State: AOAM5306K4C4KhTJH9dFbK0P1jQRkcFO/xANCxCR6Qxkdv/pBA64LLoZ
 OmAQO1RPCcbCe/FA9056M5aIDY47BDW8gCh5u/o=
X-Google-Smtp-Source: ABdhPJxkJoFDTjgkd/XcLCy7G1ywGy+N9NElrHJQNcAoLRNZtJE+80ldqf3n76LlojtzRwTLahvJHQ==
X-Received: by 2002:a1c:1dd8:: with SMTP id d207mr25885193wmd.46.1636637349912; 
 Thu, 11 Nov 2021 05:29:09 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id z6sm3783766wmp.1.2021.11.11.05.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 05:29:09 -0800 (PST)
Subject: Re: [RFC PATCH v2 02/30] target/loongarch: Add CSR registers
 definition
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-3-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7bb438bb-e4ae-8f28-8f9e-7baecbccc1ac@linaro.org>
Date: Thu, 11 Nov 2021 14:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-3-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> +#define LOONGARCH_CSR_MISC           0x3 /* Misc config */
> +

Missing bitfield definitions for misc.

> +#define  EXCODE_IP                   64

What's this?

> +#define  EXCCODE_INT                 0
> +#define  EXCCODE_PIL                 1
> +#define  EXCCODE_PIS                 2
> +#define  EXCCODE_PIF                 3
> +#define  EXCCODE_PME                 4
> +#define  EXCCODE_PNR                 5
> +#define  EXCCODE_PNX                 6
> +#define  EXCCODE_PPI                 7
> +#define  EXCCODE_ADE                 8

ADEF vs ADEM?

> +#define  EXCCODE_ALE                 9
> +#define  EXCCODE_BCE                 10
> +#define  EXCCODE_SYS                 11
> +#define  EXCCODE_BRK                 12
> +#define  EXCCODE_INE                 13
> +#define  EXCCODE_IPE                 14
> +#define  EXCCODE_FPD                 15
> +#define  EXCCODE_SXD                 16
> +#define  EXCCODE_ASXD                17
> +#define  EXCCODE_FPE                 18 /* Have different expsubcode */
> +#define  EXCCODE_VFPE                18
> +#define  EXCCODE_WPEF                19 /* Have different expsubcode */
> +#define  EXCCODE_WPEM                19
> +#define  EXCCODE_BTD                 20
> +#define  EXCCODE_BTE                 21

Missing BSPR, HVC, GCSC, GCHC.

> +#define LOONGARCH_CSR_ERA            0x6 /* ERA */

Not really helpful to name the acronym with the acronym.
"Exception return address".

> +#define LOONGARCH_CSR_TLBELO0        0x12 /* TLB EntryLo0 */
> +FIELD(CSR_TLBELO0, V, 0, 1)
> +FIELD(CSR_TLBELO0, D, 1, 1)
> +FIELD(CSR_TLBELO0, PLV, 2, 2)
> +FIELD(CSR_TLBELO0, MAT, 4, 2)
> +FIELD(CSR_TLBELO0, G, 6, 1)
> +FIELD(CSR_TLBELO0, PPN, 12, 36)
> +FIELD(CSR_TLBELO0, NR, 61, 1)
> +FIELD(CSR_TLBELO0, NX, 62, 1)
> +FIELD(CSR_TLBELO0, RPLV, 63, 1)
> +
> +#define LOONGARCH_CSR_TLBELO1        0x13 /* 64 TLB EntryLo1 */
> +FIELD(CSR_TLBELO1, V, 0, 1)
> +FIELD(CSR_TLBELO1, D, 1, 1)
> +FIELD(CSR_TLBELO1, PLV, 2, 2)
> +FIELD(CSR_TLBELO1, MAT, 4, 2)
> +FIELD(CSR_TLBELO1, G, 6, 1)
> +FIELD(CSR_TLBELO1, PPN, 12, 36)
> +FIELD(CSR_TLBELO1, NR, 61, 1)
> +FIELD(CSR_TLBELO1, NX, 62, 1)
> +FIELD(CSR_TLBELO1, RPLV, 63, 1)

Better to define the fields once, dropping the 0/1 from the name.

> +#define LOONGARCH_CSR_PWCL           0x1c /* PWCl */

"Page walk controller, low addr"

> +#define LOONGARCH_CSR_PWCH           0x1d /* PWCh */

"Page walk controller, high addr"

> +#define LOONGARCH_CSR_STLBPS     0x1e /* 64 */

64?  "STLB Page size".

> +#define LOONGARCH_CSR_RVACFG         0x1f

"Reduced virtual address config"

> +/* Save registers */
> +#define LOONGARCH_CSR_SAVE0            0x30
> +#define LOONGARCH_CSR_SAVE1            0x31
> +#define LOONGARCH_CSR_SAVE2            0x32
> +#define LOONGARCH_CSR_SAVE3            0x33
> +#define LOONGARCH_CSR_SAVE4            0x34
> +#define LOONGARCH_CSR_SAVE5            0x35
> +#define LOONGARCH_CSR_SAVE6            0x36
> +#define LOONGARCH_CSR_SAVE7            0x37

Might as well must define SAVE0, and comment that the count is in PRCFG1.SAVE_NUM.

> +#define  CSR_DMW_BASE_SH             48

What's this?  It looks like you should be using TARGET_VIRT_ADDR_SPACE_BITS anyway.

> +#define dmwin_va2pa(va) \
> +    (va & (((unsigned long)1 << CSR_DMW_BASE_SH) - 1))

Using unsigned long is wrong, breaking 32-bit hosts.
You want

     ((va) & MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS))

> +/* Performance Counter registers */
> +#define LOONGARCH_CSR_PERFCTRL0      0x200 /* 32 perf event 0 config */
> +#define LOONGARCH_CSR_PERFCNTR0      0x201 /* 64 perf event 0 count value */
> +#define LOONGARCH_CSR_PERFCTRL1      0x202 /* 32 perf event 1 config */
> +#define LOONGARCH_CSR_PERFCNTR1      0x203 /* 64 perf event 1 count value */
> +#define LOONGARCH_CSR_PERFCTRL2      0x204 /* 32 perf event 2 config */
> +#define LOONGARCH_CSR_PERFCNTR2      0x205 /* 64 perf event 2 count value */
> +#define LOONGARCH_CSR_PERFCTRL3      0x206 /* 32 perf event 3 config */
> +#define LOONGARCH_CSR_PERFCNTR3      0x207 /* 64 perf event 3 count value */

Perhaps better to define

#define LOONGARCH_CSR_PERFCTRL(N)  (0x200 + 2 * N)

etc.

> +#define LOONGARCH_CSR_DB0ADDR        0x310 /* data breakpoint 0 address */
> +#define LOONGARCH_CSR_DB0MASK        0x311 /* data breakpoint 0 mask */
> +#define LOONGARCH_CSR_DB0CTL         0x312 /* data breakpoint 0 control */
> +#define LOONGARCH_CSR_DB0ASID        0x313 /* data breakpoint 0 asid */

Likewise.

> +    uint64_t CSR_SAVE0;
> +    uint64_t CSR_SAVE1;
> +    uint64_t CSR_SAVE2;
> +    uint64_t CSR_SAVE3;
> +    uint64_t CSR_SAVE4;
> +    uint64_t CSR_SAVE5;
> +    uint64_t CSR_SAVE6;
> +    uint64_t CSR_SAVE7;

Better as an array.

> +    uint64_t CSR_PERFCTRL0;
> +    uint64_t CSR_PERFCNTR0;
> +    uint64_t CSR_PERFCTRL1;
> +    uint64_t CSR_PERFCNTR1;
> +    uint64_t CSR_PERFCTRL2;
> +    uint64_t CSR_PERFCNTR2;
> +    uint64_t CSR_PERFCTRL3;
> +    uint64_t CSR_PERFCNTR3;

Likewise.

> +    uint64_t CSR_DB0ADDR;
> +    uint64_t CSR_DB0MASK;
> +    uint64_t CSR_DB0CTL;
> +    uint64_t CSR_DB0ASID;
> +    uint64_t CSR_DB1ADDR;
> +    uint64_t CSR_DB1MASK;
> +    uint64_t CSR_DB1CTL;
> +    uint64_t CSR_DB1ASID;
> +    uint64_t CSR_DB2ADDR;
> +    uint64_t CSR_DB2MASK;
> +    uint64_t CSR_DB2CTL;
> +    uint64_t CSR_DB2ASID;
> +    uint64_t CSR_DB3ADDR;
> +    uint64_t CSR_DB3MASK;
> +    uint64_t CSR_DB3CTL;
> +    uint64_t CSR_DB3ASID;

Likewise.

> +    uint64_t CSR_IB0ADDR;
> +    uint64_t CSR_IB0MASK;
> +    uint64_t CSR_IB0CTL;
> +    uint64_t CSR_IB0ASID;
> +    uint64_t CSR_IB1ADDR;
> +    uint64_t CSR_IB1MASK;
> +    uint64_t CSR_IB1CTL;
> +    uint64_t CSR_IB1ASID;
> +    uint64_t CSR_IB2ADDR;
> +    uint64_t CSR_IB2MASK;
> +    uint64_t CSR_IB2CTL;
> +    uint64_t CSR_IB2ASID;
> +    uint64_t CSR_IB3ADDR;
> +    uint64_t CSR_IB3MASK;
> +    uint64_t CSR_IB3CTL;
> +    uint64_t CSR_IB3ASID;
> +    uint64_t CSR_IB4ADDR;
> +    uint64_t CSR_IB4MASK;
> +    uint64_t CSR_IB4CTL;
> +    uint64_t CSR_IB4ASID;
> +    uint64_t CSR_IB5ADDR;
> +    uint64_t CSR_IB5MASK;
> +    uint64_t CSR_IB5CTL;
> +    uint64_t CSR_IB5ASID;
> +    uint64_t CSR_IB6ADDR;
> +    uint64_t CSR_IB6MASK;
> +    uint64_t CSR_IB6CTL;
> +    uint64_t CSR_IB6ASID;
> +    uint64_t CSR_IB7ADDR;
> +    uint64_t CSR_IB7MASK;
> +    uint64_t CSR_IB7CTL;
> +    uint64_t CSR_IB7ASID;

Likewise.


r~

