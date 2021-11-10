Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAB44CAA4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:28:59 +0100 (CET)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuDK-0000h3-UX
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkuCQ-00085C-Oq; Wed, 10 Nov 2021 15:28:02 -0500
Received: from [2607:f8b0:4864:20::933] (port=43624
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkuCP-0005EU-6P; Wed, 10 Nov 2021 15:28:02 -0500
Received: by mail-ua1-x933.google.com with SMTP id v3so7352838uam.10;
 Wed, 10 Nov 2021 12:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yro3fo9Q42lVu38ur3PDxSV4aMAgnutwkSjWyCyIAjQ=;
 b=gacqVOSb+5be7wJhNCDedT8vjM8gnJKi4Kjob4zueSJrrfAjaUBPdhOu81fkfY69CC
 2hgmX4jP3AWiQW0IU2Y956VzhHXCOwt6TDuFj8MVEHb6zbkGd7S3sW8kt4HUQ6aUUOP4
 OGOyju5McAafpEbqkA5Ar33XPH2uqku5k2dKZ8GIre3cuu6UvVyGfKSkSrt8QHsotOYF
 PTIzNOiiAHcVZnt19uu7P2UoMPOaxpqoYq8c21EM5LdRun8weUC1xWRmzoQO1oEEf3vR
 Yh1fNFVoQLBoT1Y0m35u8NQql3Ea7sbsERz/pEaMEtgKd+FUXQxRXR+afYYV9F8VCWkT
 yrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yro3fo9Q42lVu38ur3PDxSV4aMAgnutwkSjWyCyIAjQ=;
 b=NA0v7i1Klg/SgKLPru9nC2ibszqKC0a0l2W8ArVgllluNsIRAMl9hw7DhzdfdZtTFh
 ePfN6dxo9ZBYkaVqBTT2qVkpoiGMxW/bHWPXnJeizY+pWI9zdx3ueobim5mCCMCclOKv
 Ahh796QlvomzSHUUdFrrwhWmq+TyHQJotBN7KG6OguMk0mw5xvSpUvM4Pn5UWsohzM/w
 zOKdSTF9z31iffUsz4D3VBsCzbsEB6zZhKlOSd5dP31sFCS0W58K7L3hBqV6o7IedC85
 T0k7T9zoShpIDl57WH/zzZnOmVG+zB5+f/FLsSg4bOooGB3oXPqqXqyoNNam/QqgvUSO
 bVBA==
X-Gm-Message-State: AOAM5319bX/dUC6hAuK0BY8bNHQ+ohMY+I4I7HGpzW5yYogNkO2h5zUO
 mMUhiSZEoZfe2yXBNiJFCsWd9ClJhAM=
X-Google-Smtp-Source: ABdhPJyxncBkCXWK5dS+qJQotdDQ8d9F0+/MmLmnYj/ujn9OUDv/WYEZd9il0kRdNBeXMj4Kno1cqA==
X-Received: by 2002:a05:6102:512b:: with SMTP id
 bm43mr2798017vsb.14.1636576079644; 
 Wed, 10 Nov 2021 12:27:59 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id q8sm646928uae.10.2021.11.10.12.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 12:27:59 -0800 (PST)
Message-ID: <41de6192-1b45-3bea-c9a1-f240c6712b50@gmail.com>
Date: Wed, 10 Nov 2021 17:27:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211110202516.1993815-1-danielhb413@gmail.com>
 <20211110202516.1993815-2-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211110202516.1993815-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.678,
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
Cc: f4bug@amsat.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Alexander Graf <agraf@csgraf.de>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I forgot to add Alexander in the CC. Sorry for the extra noise.



Daniel

On 11/10/21 17:25, Daniel Henrique Barboza wrote:
> 'tlbivax' is implemented by gen_tlbivax_booke206() via
> gen_helper_booke206_tlbivax(). In case the TLB needs to be flushed,
> booke206_invalidate_ea_tlb() is called. All these functions, but
> booke206_invalidate_ea_tlb(), uses a 64-bit effective address 'ea'.
> 
> booke206_invalidate_ea_tlb() uses an uint32_t 'ea' argument that
> truncates the original 'ea' value for apparently no particular reason.
> This function retrieves the tlb pointer by calling booke206_get_tlbm(),
> which also uses a target_ulong address as parameter - in this case, a
> truncated 'ea' address. All the surrounding logic considers the
> effective TLB address as a 64 bit value, aside from the signature of
> booke206_invalidate_ea_tlb().
> 
> Last but not the least, PowerISA 2.07B section 6.11.4.9 [2] makes it
> clear that the effective address "EA" is a 64 bit value.
> 
> Commit 01662f3e5133 introduced this code and no changes were made ever
> since. An user detected a problem with tlbivax [1] stating that this
> address truncation was the cause. This same behavior might be the source
> of several subtle bugs that were never caught.
> 
> For all these reasons, this patch assumes that this address truncation
> is the result of a mistake/oversight of the original commit, and changes
> booke206_invalidate_ea_tlb() 'ea' argument to 'vaddr'.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/52
> [2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf
> 
> Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/mmu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 2cb98c5169..e0c4950dda 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1216,7 +1216,7 @@ void helper_booke206_tlbsx(CPUPPCState *env, target_ulong address)
>   }
>   
>   static inline void booke206_invalidate_ea_tlb(CPUPPCState *env, int tlbn,
> -                                              uint32_t ea)
> +                                              vaddr ea)
>   {
>       int i;
>       int ways = booke206_tlb_ways(env, tlbn);
> 

