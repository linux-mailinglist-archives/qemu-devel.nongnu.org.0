Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B1576257
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 14:57:09 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCKsV-0002Nw-C3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 08:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oCKqS-0000m3-6u; Fri, 15 Jul 2022 08:55:00 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oCKqQ-0005VM-PI; Fri, 15 Jul 2022 08:54:59 -0400
Received: by mail-oi1-x232.google.com with SMTP id s204so5957909oif.5;
 Fri, 15 Jul 2022 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FtaYsut0/sFvpfQgrx8dGBHprmV65HoH0zbHeW7PJrM=;
 b=RDUiLeQoc6mUwFf/UPu9XZZUiCJswY6rRlsGHwm2f8bQwzAHb1Pa5T1OiH2oWYfL3M
 1Fn+Zntz4kowd4ZLviuZvFEIwVOMRrN4ljEtdmB/BeELSMxkp0VReLb9lhiicuCHVLbA
 4lLWOXIULtBLCwRgg43dVFtVadzBIOODDm65voYqgD2qaRZNUBnA1UjYtRL7l1s3rR6/
 TpWqB33cljGYeJawDEpP134fK09zW+eXuIiVXpo7JVJFXhKdVM0qrovblAjiSW8UbJjE
 hH93kJl2a7Tfhu7jGACT4+FHf23Qhv1PxB7K5mswHEZpuC6U58ANNx6ohi7houT9taRj
 /WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FtaYsut0/sFvpfQgrx8dGBHprmV65HoH0zbHeW7PJrM=;
 b=bymNcSs/xZp7Fv0bhnE7+3MQqrit4mHi3eMhZ6nuZdUU1MWJihToRNMiFWwpF8JdpQ
 Ue6hBNxgMZRJhzJi1S7HHt9GiOe3H9fIamdYxiCrcgrFfRGpnAkm1Gyly3Eyb8qn9hrO
 ooMVSzZ0luMh4FqDVmxEetMrPY2QGhBPif7HDRn0euzbb+ZAjUPSxHypvhD/zRuEVFFo
 SZp3dGApiQCgYqXi03FJTfXUyl+bIonomk/LaSuY2hFRm6SCYVl//mWq8OZM7MxFq5QM
 A7j3s32ynifLpQVKJM/V5K5qFY5Net0NNcTgkOS6UIxXqqBuahkxVqCaJgqrZt+omZsg
 U5rQ==
X-Gm-Message-State: AJIora9RmGEoEDbAxrOswiM0+cPwxtsKIFnCMtYpNiNylzP9Vxu8ORfb
 rXcUAe6wHvSL0/Ld/Nu4H80=
X-Google-Smtp-Source: AGRyM1usoCud9Gzmy/IptP/H/ugGn7tkfok70MwR2yJ0ERA479maETu4o0eJ79Bf5IPKss+06V+GGw==
X-Received: by 2002:aca:dfd6:0:b0:339:c2ac:5755 with SMTP id
 w205-20020acadfd6000000b00339c2ac5755mr7025154oig.20.1657889697296; 
 Fri, 15 Jul 2022 05:54:57 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 2-20020a9d0002000000b0061c24cd628bsm1838268ota.7.2022.07.15.05.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 05:54:56 -0700 (PDT)
Message-ID: <023abd28-3922-862f-09b4-e60f37a6e6d2@gmail.com>
Date: Fri, 15 Jul 2022 09:54:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
 <20220628133959.15131-4-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220628133959.15131-4-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 6/28/22 10:39, Leandro Lupori wrote:
> According to PowerISA 3.1B, Book III 6.7.6 programming note, the
> page directory base addresses are expected to be aligned to their
> size. Real hardware seems to rely on that and will access the
> wrong address if they are misaligned. This results in a
> translation failure even if the page tables seem to be properly
> populated.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/mmu-radix64.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 705bff76be..00f2e9fa2e 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -265,7 +265,7 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>                                     uint64_t *pte_addr, uint64_t *nls,
>                                     int *psize, uint64_t *pte, int *fault_cause)
>   {
> -    uint64_t index, pde;
> +    uint64_t index, mask, nlb, pde;
>   
>       /* Read page <directory/table> entry from guest address space */
>       pde = ldq_phys(as, *pte_addr);
> @@ -280,7 +280,17 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>           *nls = pde & R_PDE_NLS;
>           index = eaddr >> (*psize - *nls);       /* Shift */
>           index &= ((1UL << *nls) - 1);           /* Mask */
> -        *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
> +        nlb = pde & R_PDE_NLB;
> +        mask = MAKE_64BIT_MASK(0, *nls + 3);
> +
> +        if (nlb & mask) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: misaligned page dir/table base: 0x"TARGET_FMT_lx
> +                " page dir size: 0x"TARGET_FMT_lx"\n",
> +                __func__, nlb, mask + 1);
> +            nlb &= ~mask;
> +        }
> +        *pte_addr = nlb + index * sizeof(pde);
>       }
>       return 0;
>   }
> @@ -294,8 +304,18 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>       int level = 0;
>   
>       index = eaddr >> (*psize - nls);    /* Shift */
> -    index &= ((1UL << nls) - 1);       /* Mask */
> -    *pte_addr = base_addr + (index * sizeof(pde));
> +    index &= ((1UL << nls) - 1);        /* Mask */
> +    mask = MAKE_64BIT_MASK(0, nls + 3);
> +
> +    if (base_addr & mask) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: misaligned page dir base: 0x"TARGET_FMT_lx
> +            " page dir size: 0x"TARGET_FMT_lx"\n",
> +            __func__, base_addr, mask + 1);
> +        base_addr &= ~mask;
> +    }
> +    *pte_addr = base_addr + index * sizeof(pde);
> +
>       do {
>           int ret;
>   

