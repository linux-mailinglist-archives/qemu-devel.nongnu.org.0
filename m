Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD249BD89
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 21:59:36 +0100 (CET)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCSud-00022k-FU
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 15:59:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCSsN-00012q-Tg; Tue, 25 Jan 2022 15:57:15 -0500
Received: from [2607:f8b0:4864:20::c33] (port=38575
 helo=mail-oo1-xc33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCSsL-0007ko-7p; Tue, 25 Jan 2022 15:57:15 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so7126802ooj.5; 
 Tue, 25 Jan 2022 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FiRbYCBD2VkwenSzE4ORfD0E6NqkI9tRHRGzSGi8CgM=;
 b=AaSZshesGPFIoQohTEMQ2UBi/iZkNqmt9Ht5UxQkfF/hmnvMmnkPgXe4dGjgeWHE8H
 7KwO1X2b9dob230J9DxsGuuIZNEIym9eFoNwwFMGZFNwt6QslsFZB2yO1+7JKvcFo801
 coajtBUPnIeNZA6+x5VOFA6IuyuEfpadGbJ5TCGYX1jppYWsUHlOFDxdxeIqS6XKRnEM
 UvoDrSekEaZYNYeGOKcVGe3s9VWFM8VNsgXf6+LQPjoMbbeoFMFfPM3WWsnVPBMEOcGW
 iDetHvxEBNaGs6jMHhZJl+hLFNzhVOTfHxxCst/3UHHM0KJ1ajtoH65lSXMwfwNQEAcj
 UXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FiRbYCBD2VkwenSzE4ORfD0E6NqkI9tRHRGzSGi8CgM=;
 b=bV/nAnreU4gdxH61ZnWHQLD6bdvtbID57YCJKUz7gdUOcrbrMZPkQ18dfnHJXihPKZ
 +c66fwMz5dOahCurvtT2jGXIKwltWj8lb3OSlZX4iI5Rp02Gi5N9C8j3vvikZ5PjpAY7
 FWEYUH7iBgsaQ4Cq3KQ8NGvfSb+p+OXs1K92id5SJvil+Wgrcf4/BCaCGP6qfIlRCyzL
 1v2W6c2D8JwmWYmTs2/UsAz4AyLO18P744RcXv/FCilYWbJ7dmZI+xMO7tXps2fGC0B1
 E/c/YAccPNFMC/AkPQEFiD5uq8Q6/d3pQenWO6/3ZaAUJMzZwGfrcmqD/d463lc1kFk+
 35oQ==
X-Gm-Message-State: AOAM531xL4IBeyQThKiCgzkJ5nH/Vd7ds4+uA9qJzdualOERG6oZedER
 cMBCg1TVasKXeatnK9DRHOk=
X-Google-Smtp-Source: ABdhPJyky1nVOSrbRaRO2ZzBLEVIlAV72M+y3c+2roFrhBTucYO6RMG8sAq28oLZCDTK/wa3q7beaA==
X-Received: by 2002:a05:6820:151b:: with SMTP id
 ay27mr14394770oob.47.1643144231342; 
 Tue, 25 Jan 2022 12:57:11 -0800 (PST)
Received: from [192.168.10.222] ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id h18sm7323932otj.31.2022.01.25.12.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:57:10 -0800 (PST)
Message-ID: <e92dcd88-60f7-428f-4752-c4fc641880fc@gmail.com>
Date: Tue, 25 Jan 2022 17:57:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/ppc: Put do_rfi under a TCG-only block
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220124191547.1008391-1-farosas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220124191547.1008391-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/24/22 16:15, Fabiano Rosas wrote:
> The --disable-tcg build broke when do_rfi stopped being inlined.
> 
> Fixes: 62e79ef914 ("target/ppc: Remove static inline")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/excp_helper.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index bc646c67a0..afdb6a8912 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1155,7 +1155,6 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>           (env->spr[SPR_PSSCR] & PSSCR_EC);
>   }
>   #endif /* defined(TARGET_PPC64) */
> -#endif /* CONFIG_TCG */
>   
>   static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>   {
> @@ -1188,7 +1187,6 @@ static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>       check_tlb_flush(env, false);
>   }
>   
> -#ifdef CONFIG_TCG
>   void helper_rfi(CPUPPCState *env)
>   {
>       do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);

