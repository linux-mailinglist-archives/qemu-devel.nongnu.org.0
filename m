Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E914F44C7BC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 19:53:46 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mksjB-0002GW-Qw
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 13:53:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mksiL-0001aV-Vz
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 13:52:54 -0500
Received: from [2a00:1450:4864:20::42c] (port=36746
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mksiK-00010s-0g
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 13:52:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s13so5729266wrb.3;
 Wed, 10 Nov 2021 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZH97QHqd1F6+lJUVsGN5/vtEngkOr58Lnft0nyjVhxY=;
 b=pPma38jTQPugWzj+AoVPnH2AFp9NpdaP78dbS5WI+K9S1yx3zyJc0XIEDk5PpSmV+L
 DTJDYCEBuIA+DcJPMO8JY8J0D9yV1xv4kljC0RaNCG/8QR/GqfQqDu89OkWn5c7d+Pp0
 E2vUF6UQ/vnO3XzKNBf7bHvKi2Ut4303t7iOCg5bYaxBomWYNDMYlyE+Gis9VtpwzMzv
 WSps8NmEqciMP9BfAxQFLrYGZVHlcUzZRzxRQDfCL8Q1BAo16eMD57m3gJS4wb1IpEBq
 WJWDZiRSyFqedjg0GDDn3KQZKvqBdyGh4UUOayO871gSKe1gK9RMdURPD5D+ybnYKk3r
 l02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZH97QHqd1F6+lJUVsGN5/vtEngkOr58Lnft0nyjVhxY=;
 b=6hpdBvoMwHcnxTTsNlGIl20fD5BjU0ZeEfddHlgbDG8Sm9BtMqqSBC2AB5X0Jpnon0
 w0Ipe2SlXDt3T2cpi0z3WXUsZM9w2xCdzqXoK+RTP5VYi1f2FuGItG+7Ci9zNcghPbt2
 lChdOKZ605RjWSLZ6xwafibsK0SWTMqNMeDT0gCaB0iYn4+s1bPOwpzyiLg3ZaQbHiIU
 st6Zpm1XtehjIDZQQ/8DZkFpxvSXTHGCMGlmkmvLYggxp8cqBnr1dC3mv5olqbxpFXey
 EDefTM8mzIX6Ll4KOG9tKZLW8rkG07CCCKhytHdG8Vo7eOZsXckYDffryZcXRl9rfXGK
 lPYQ==
X-Gm-Message-State: AOAM532MtYlVkfeEIXkoOMfMcFoFsIxeen4GI/JiVT1mnh2g+R/ZlIRe
 V9DufEVWo2fiyZ+lktOgGBc=
X-Google-Smtp-Source: ABdhPJxTRnh3bM2A+UpiP5CbwKJXXxFZDn9SKmcuDbuVtt3PqHjRtzYQGhTyzJVSzg0AHAafygd0AA==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr1489805wrt.131.1636570370070; 
 Wed, 10 Nov 2021 10:52:50 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g13sm487265wmk.37.2021.11.10.10.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 10:52:49 -0800 (PST)
Message-ID: <00d2bc57-5e12-7db6-7ddc-44bd198b53d0@amsat.org>
Date: Wed, 10 Nov 2021 19:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211110184545.1981500-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211110184545.1981500-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.678,
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
Cc: Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alexander

On 11/10/21 19:45, Daniel Henrique Barboza wrote:
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
> booke206_invalidate_ea_tlb() 'ea' argument to target_ulong.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/52
> [2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf
> 
> Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/mmu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 2cb98c5169..21cdae4c6d 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1216,7 +1216,7 @@ void helper_booke206_tlbsx(CPUPPCState *env, target_ulong address)
>  }
>  
>  static inline void booke206_invalidate_ea_tlb(CPUPPCState *env, int tlbn,
> -                                              uint32_t ea)
> +                                              target_ulong ea)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But I wonder if vaddr is not more appropriated here,
see "hw/core/cpu.h":

/**
 * vaddr:
 * Type wide enough to contain any #target_ulong virtual address.
 */

