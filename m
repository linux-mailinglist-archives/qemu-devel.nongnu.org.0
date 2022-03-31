Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE044EDFCE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:39:41 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZylm-0000t8-HL
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:39:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyj6-0007vA-1q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:36:52 -0400
Received: from [2607:f8b0:4864:20::236] (port=41605
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyj4-0000xx-Cb
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:36:51 -0400
Received: by mail-oi1-x236.google.com with SMTP id e189so239626oia.8
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h9QbrLSOoLiyhiiH0SnMx0TKFk4HaIuchrBeCadhLTU=;
 b=I+ju8tWaQiYl+Yvc4uDYjkg8rCOI8E7j3N15FyuVowNMBkv8IaoNh0iLV8wCVYcrI4
 yHd/x/sSog875ou30p6qw06IDsHy14N+jgPZJm1Uk+SzMLFiHYgRYb0vkPaGH+2+z7fc
 G1bzHMylSILs/JTJnFqkKTq68VuMFMArI4xF4ACp2jNXw1b+1vj3VaJ7H0Ny+LTZMNVb
 kPgoAyGuy3bztzqGQSU6JkXaydhygR4RyKy8wMqzqK0o+AhOdsahK6LIoFvPrOcbjXed
 bJuwgRYkA+HnZ9XDcsFfw9Bz4x9fElS/XsIDnhibzBReeHhJ2QnjMgWq200hEBpFZ4NA
 Mwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h9QbrLSOoLiyhiiH0SnMx0TKFk4HaIuchrBeCadhLTU=;
 b=RgMxNm+m2kzjQKQxlhNNnaGXggVPcJNo4BZ8EJ9APIFGzKbXJzHOUdNdpxjHbnizvq
 4Tp+sGJlhn7YlxWGm9M4EAmhrelMqq2X8ycnTFqJgUSdnS2jSIKzaBdla+Nh/VKvee+z
 AUjnPL2lTyRm+0HoUbx1JpoxRwghF+7eGTPgRCgXpny+Hi1KVnkAznrdb7sdngfn3eUR
 HysK34RY4X02VaMDzU41IIUZgLdRk3ATxWgygRNAkCRVLYn8ydyJFlbTJ08NcC8UQgj5
 36kGqE+wnhwHFByyiHzhaTqRUvr/zskSmvwfEYQCd2MibH3kL6J1koFOnSmgdxKT945d
 nwMQ==
X-Gm-Message-State: AOAM531u+N3shRZ4VjUi6sKy+9vQcPlAoyg+e146MobumwUzbHrvu0qz
 lpGgV7py/u4QgZXIlKkgDM7bsw==
X-Google-Smtp-Source: ABdhPJxPhi6Xf6Xey2ZYqp1LkNvd+xiA9D/j1zrBXKttfUWNvAfmMPTxvNBDNGcm8rgc+jOp7rJqFg==
X-Received: by 2002:a05:6808:1a05:b0:2da:ecd:56a2 with SMTP id
 bk5-20020a0568081a0500b002da0ecd56a2mr2965923oib.221.1648748209133; 
 Thu, 31 Mar 2022 10:36:49 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r129-20020acac187000000b002ef358c6e0esm12103522oif.49.2022.03.31.10.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 10:36:48 -0700 (PDT)
Message-ID: <5e48daaf-d881-2588-c323-30a9bc95a75f@linaro.org>
Date: Thu, 31 Mar 2022 11:36:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com> <YkUDCdUsjjmzFgJr@yekko>
 <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 11:17, Daniel Henrique Barboza wrote:
>> Hmm... this is seeming a bit like whack-a-mole.  Could we instead use
>> one of the valgrind hinting mechanisms to inform it that
>> kvm_get_one_reg() writes the variable at *target?
> 
> I didn't find a way of doing that looking in the memcheck helpers
> (https://valgrind.org/docs/manual/mc-manual.html section 4.7). That would be a
> good way of solving this warning because we would put stuff inside a specific
> function X and all callers of X would be covered by it.
> 
> What I did find instead is a memcheck macro called VALGRIND_MAKE_MEM_DEFINED that
> tells Valgrind that the var was initialized.
> 
> This patch would then be something as follows:
> 
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..b0e22fa283 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -56,6 +56,10 @@
>   #define DEBUG_RETURN_GUEST 0
>   #define DEBUG_RETURN_GDB   1
> 
> +#ifdef CONFIG_VALGRIND_H
> +#include <valgrind/memcheck.h>
> +#endif
> +
>   const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>       KVM_CAP_LAST_INFO
>   };
> @@ -2539,6 +2543,10 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>       CPUState *cs = CPU(cpu);
>       uint64_t lpcr;
> 
> +#ifdef CONFIG_VALGRIND_H
> +    VALGRIND_MAKE_MEM_DEFINED(lpcr, sizeof(uint64_t));
> +#endif
> +
>       kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>       /* Do we need to modify the LPCR? */
> 
> 
> CONFIG_VALGRIND_H needs 'valgrind-devel´ installed.
> 
> I agree that this "Valgrind is complaining about variable initialization" is a whack-a-mole
> situation that will keep happening in the future if we keep adding this same code pattern
> (passing as reference an uninitialized var). For now, given that we have only 4 instances
> to fix it in ppc code (as far as I'm aware of), and we don't have a better way of telling
> Valgrind that we know what we're doing, I think we're better of initializing these vars.

I would instead put this annotation inside kvm_get_one_reg, so that it covers all kvm 
hosts.  But it's too late to do this for 7.0.


r~

