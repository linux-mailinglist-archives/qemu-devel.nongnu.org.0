Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA84611B7B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 22:22:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVqD-0006Zb-83; Fri, 28 Oct 2022 16:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooVqA-0006Z1-Uj; Fri, 28 Oct 2022 16:20:31 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooVq9-0004ZU-8s; Fri, 28 Oct 2022 16:20:30 -0400
Received: by mail-oi1-x236.google.com with SMTP id n83so7269381oif.11;
 Fri, 28 Oct 2022 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pjyiwk0TkfGX50LvrbuYDEKVtyD3TK2Ob2roEbK93cc=;
 b=ZYnA/g/KqL8cpcx3EwSa4W94TOa6wo6Z1s5Vu4AY4LBTf1cMrqgf5xP91QpJLG/4Yj
 CNpdg7as3O8PK2CMxL/DZ1KqwhmidyuGBwzQX/sLDdg0psKJ0BWgwrJRV/89v+ey3lIk
 K3YdlfzI09G07pxHRFFS4neuls0aUllUA9ApDpB9f/RDLUh0rcex35CHfUUKQCFdqCKr
 wiSbE90kjB9P0GfT2NgWh+p4BJtwCcvTWy/oo73Z3dLT+A64TJgXOy03p0E5DnOQhTdG
 nN2I38iLlTSX5EPFI7VdeNjtaJdm0rUk0RKaFZ/ddz0firBK4I+YCd033hlXFGn4/Wzz
 Q2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pjyiwk0TkfGX50LvrbuYDEKVtyD3TK2Ob2roEbK93cc=;
 b=c8Tq/Yh16lAV1bNQqubNbprRf95g7Fawk/PuA4seeqYONf/JEHIIDVgeIn1bFgHJeb
 u6iigaioHb6Sm8VkEeLKvuU8ti5OIrJC406U8fqpkcw3+KotyGrsXP60By8TIJbXbzHJ
 MVbKSV1pqbjoKLz6PtFyBVVn8fW8Y4jHegvzyZ30CQ0lS9foBr640yS9mMLpKMpwgGU/
 oFukkYukuP3IRCAhr49xmkm/gnRWbscwyILzZNlpcIyXKgmmqqjJSjYU4GD/prV/yTdc
 Ph80dsNsXIy2J2NJzkRgtuxkD0xe0L2S7dtluiuINMC39W/2IM4q4GwZW3jADkNYK4NK
 7IAA==
X-Gm-Message-State: ACrzQf0LoSNrQmwjqAYcm0laGGtjFK495gpPtqxlda1P8sAJicJ3L/na
 39p5VLQno+GcrxPen0InKro=
X-Google-Smtp-Source: AMsMyM6GxZgFJ3icwILdyMcRIdJHwIcncbzm+SQQ9dDtpCPlomfIhUvZ5ri77iqAamARVEMbIC47xA==
X-Received: by 2002:a05:6808:10d6:b0:355:526b:fc0d with SMTP id
 s22-20020a05680810d600b00355526bfc0dmr654990ois.258.1666988427590; 
 Fri, 28 Oct 2022 13:20:27 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 y62-20020a4a4541000000b0047634c1c419sm1897411ooa.12.2022.10.28.13.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 13:20:26 -0700 (PDT)
Message-ID: <22dcc32d-bf42-00a6-e7c6-08c98ea0b3f4@gmail.com>
Date: Fri, 28 Oct 2022 17:20:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] target/ppc: Fix regression in Radix MMU
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 Victor Colombo <victor.colombo@eldorado.org.br>
References: <20221028183617.121786-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221028183617.121786-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/28/22 15:36, Leandro Lupori wrote:
> Commit 47e83d9107 ended up unintentionally changing the control flow
> of ppc_radix64_process_scoped_xlate(). When guest_visible is false,
> it must not raise an exception, even if the radix configuration is
> not valid.
> 
> This regression prevented Linux boot in a nested environment with
> L1 using TCG and emulating KVM (cap-nested-hv=on) and L2 using
> KVM. L2 would hang on Linux's futex_init(), when it tested how a
> futex_atomic_cmpxchg_inatomic() handled a fault, because L1 would
> start a loop of trying to perform partition scoped translations
> and raising exceptions.
> 
> Fixes: 47e83d9107 ("target/ppc: Improve Radix xlate level validation")
> Reported-by: Victor Colombo <victor.colombo@eldorado.org.br>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/mmu-radix64.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

I'll queue this up in the pending pull request.


Thanks,

Daniel

> 
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 00f2e9fa2e..171379db69 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -238,6 +238,8 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
>   
>   static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
>   {
> +    bool ret;
> +
>       /*
>        * Check if this is a valid level, according to POWER9 and POWER10
>        * Processor User's Manuals, sections 4.10.4.1 and 5.10.6.1, respectively:
> @@ -249,16 +251,24 @@ static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
>        */
>       switch (level) {
>       case 0:     /* Root Page Dir */
> -        return psize == 52 && nls == 13;
> +        ret = psize == 52 && nls == 13;
> +        break;
>       case 1:
>       case 2:
> -        return nls == 9;
> +        ret = nls == 9;
> +        break;
>       case 3:
> -        return nls == 9 || nls == 5;
> +        ret = nls == 9 || nls == 5;
> +        break;
>       default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix level: %d\n", level);
> -        return false;
> +        ret = false;
> +    }
> +
> +    if (unlikely(!ret)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix configuration: "
> +                      "level %d size %d nls %ld\n", level, psize, nls);
>       }
> +    return ret;
>   }
>   
>   static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
> @@ -519,11 +529,13 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>   
>               if (!ppc_radix64_is_valid_level(level++, *g_page_size, nls)) {
>                   fault_cause |= DSISR_R_BADCONFIG;
> -                return 1;
> +                ret = 1;
> +            } else {
> +                ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK,
> +                                             &h_raddr, &nls, g_page_size,
> +                                             &pte, &fault_cause);
>               }
>   
> -            ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK, &h_raddr,
> -                                         &nls, g_page_size, &pte, &fault_cause);
>               if (ret) {
>                   /* No valid pte */
>                   if (guest_visible) {

