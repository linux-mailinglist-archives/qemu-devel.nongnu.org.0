Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FDB52AB72
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:05:21 +0200 (CEST)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2VO-0002Gs-8Q
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nr2Sg-0007Ih-Ul; Tue, 17 May 2022 15:02:26 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nr2Sf-0001T2-A7; Tue, 17 May 2022 15:02:26 -0400
Received: by mail-oi1-x231.google.com with SMTP id v66so23456884oib.3;
 Tue, 17 May 2022 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ztaSmjPlR4KB93SN2/uosboCuDXyq26YPKfR9C7DxDI=;
 b=iqgODrDe1k6p+B4vaD8u9PeTTaHAScYpRW8QtbvIcORb7LkiKmIm8Dl2kgAaQkOgNe
 3JXZxz99wTq8uwXEWVXU+mE3/Kv2BWJd+diqBb5KrkEw4g1I7+jvYvRLWBvDHjuxCB1Q
 4BvSsXuUWcwHMb5lpK31sgRH6NhOsiNcXJbcsXXNwX7hUjUrnckzOa5qKVtYww3wE/XE
 S0KhKc67o+Cq6hxze9vS3QMI3RJg1gnkBUBBbOZ3j+lyzttwO2sMAv1kSoJHtq1zBO8C
 uEjd3hQDRbdVSuzz4NmhGj/v8aep8ZZzg0lOSf0T3DQCgnUjs0hfl2PJf3tcj9eFyA3z
 hb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ztaSmjPlR4KB93SN2/uosboCuDXyq26YPKfR9C7DxDI=;
 b=a9cCJVHNrmst1lu7ByW+ri6SrdPS9UsXMTkauQflzFAs6R9VmgeYYT8pSlULfuhOeV
 eh2pSXI+HGiYbTqj7nA5AWxGyD26OcIvkHhX0QRX8psjDh2mOh5BrX75MCTsni+h+ARW
 PlSnCgz+b559QJcIsjDnuk4WHpc91Yz8afDeAC4APHh2MOZkl3Jn1EsrILCD8x5jPQgp
 yVBQRSv2m9F4LT7wcwh1pxXGXOdTc7MKdgZ9eoGKVMQtTXksfafNANfcj+UQuBg3DM7c
 sUHm9So2/b/BP69o+0ESKOXa8hWJex+CAkv62P0lupF/pIt283v0bVL+QDCabkEnVBr2
 U1Dg==
X-Gm-Message-State: AOAM5325xybYORWvLlcMsgvdZ6Yb//o5H5JVzHBJWV+EfKTRC85SMjTi
 nkyjuuq8H4Y9LYxOPL2G9oo=
X-Google-Smtp-Source: ABdhPJyAmsUbwfZWeS6ATW3b5d/zLrIxS2HLV76mZIa0y9OfemvKovGqN4Twn94D3qt9k7ECYD0W8g==
X-Received: by 2002:aca:abcd:0:b0:326:ad9c:d88e with SMTP id
 u196-20020acaabcd000000b00326ad9cd88emr10960995oie.223.1652814143809; 
 Tue, 17 May 2022 12:02:23 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a9d7f99000000b00606765d8db2sm44618otp.77.2022.05.17.12.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:02:23 -0700 (PDT)
Message-ID: <6b19ef14-cc09-50ed-26fd-58e5b144cd0b@gmail.com>
Date: Tue, 17 May 2022 16:02:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/ppc: Fix tlbie
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/3/22 13:39, Leandro Lupori wrote:
> Commit 74c4912f097bab98 changed check_tlb_flush() to use
> tlb_flush_all_cpus_synced() instead of calling tlb_flush() on each
> CPU. However, as side effect of this, a CPU executing a ptesync
> after a tlbie will have its TLB flushed only after exiting its
> current Translation Block (TB).
> 
> This causes memory accesses to invalid pages to succeed, if they
> happen to be on the same TB as the ptesync.
> 
> To fix this, use tlb_flush_all_cpus() instead, that immediately
> flushes the TLB of the CPU executing the ptesync instruction.
> 
> Fixes: 74c4912f097bab98 ("target/ppc: Fix synchronization of mttcg with broadcast TLB flushes")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/helper_regs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..1fa032e4d0 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -293,7 +293,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
>       if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
>           env->tlb_need_flush &= ~TLB_NEED_GLOBAL_FLUSH;
>           env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
> -        tlb_flush_all_cpus_synced(cs);
> +        tlb_flush_all_cpus(cs);
>           return;
>       }
>   

