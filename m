Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734F44AA38
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:10:59 +0100 (CET)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkN9e-00059E-1c
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:10:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkN82-0004N1-MR
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:09:18 -0500
Received: from [2a00:1450:4864:20::430] (port=42993
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkN80-0002rQ-UT
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:09:18 -0500
Received: by mail-wr1-x430.google.com with SMTP id c4so31737042wrd.9
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 01:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=NG+PmAiV98mgfLLQ3HO0+ky/htQChjmZk9tS9qy1d/4=;
 b=lW8Ww1fCqKinwdIScPCyhER8lqG7gNTbh91oBmvTg8WdQRz72AsZh5mfmrQ584mw39
 YeUJtrQghWc+z+Vm43h0nfmjgEORTjQP68hsP/ReaUv8fHFMUfCgKogZuPkg9CrkE9EX
 xyO3vfCFCaaMplkrsuRWTybiAJrTJv42a6ae9VvhkfpPXTvk3QCwA7cSRBAMDP0AFVGh
 vL+Om76ZMJO8iuA2UAXhm4YSZ5IRu9uYfmGrptHpiL8TlUMO+nSk4dyvJUjw9PegBnz1
 IB3jaJDTJ+Gs+6uCcUL0xFNiJ7x8x3kxIFqY1t1+hOtZ/NDSKWZsIt4fF5ggS6wfdj7E
 8k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=NG+PmAiV98mgfLLQ3HO0+ky/htQChjmZk9tS9qy1d/4=;
 b=i7D6bhx5EXzbvTqm5bXmiIqpD2x7ux/iHmBnNJUuUIn0KEAvC5hB51ZTXarWaUtlep
 GeXYqqAC3qV9PQGExsWhyi2bF4dJQOP3ia8Dj8iUFYLxF2ECeBTSMmLcbO79vs0tjaop
 gMUjISamjN9i4qiXz/NIBKAGwv9zp85y6qFMA4q6qJbN8fdbx/hXoCA/SleX7qJ2cL4C
 IaXD3maeA54y7j59luT2Myzd7Cr0Xmzrk6Coq2B80rGOgYi6qjqqra9szcbmh7knIGVE
 pO1acW2HR24KrxKx2Tuhxn6H1P0sijPMZ6nQ/DvS27XgzJgiuEPZUDor3LDEFRBbqa6S
 MF0Q==
X-Gm-Message-State: AOAM531xA+v+JUKiyBTJonfzP9tjQ8obAVj7wes4vZwwsUhQKrCK+Knt
 H1vmqKlrkX/Sf9dUx5S2Apw=
X-Google-Smtp-Source: ABdhPJzV/NWJTAuaUymaHp/O78PKaLsk1icsmsgm90ekwLP45x8TR1uMoQGeqPt90TpcWA4bNxNkTw==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr7081930wrw.262.1636448954502; 
 Tue, 09 Nov 2021 01:09:14 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm2568532wmp.1.2021.11.09.01.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:09:13 -0800 (PST)
Message-ID: <5334140a-dfe6-4c26-28ff-7a06bf581b07@amsat.org>
Date: Tue, 9 Nov 2021 10:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20211108194230.1836262-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211108194230.1836262-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.364,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 20:42, Khem Raj wrote:
> uint64_t is available in all userspaces via compiler include stdint.h
> therefore use it instead of __u64 which is linux internal type, it fixes
> build on some platforms eg. aarch64 systems using musl C library
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  linux-user/host/aarch64/hostdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
> index a8d41a21ad..34d934f665 100644
> --- a/linux-user/host/aarch64/hostdep.h
> +++ b/linux-user/host/aarch64/hostdep.h
> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
>  static inline void rewind_if_in_safe_syscall(void *puc)
>  {
>      ucontext_t *uc = puc;
> -    __u64 *pcreg = &uc->uc_mcontext.pc;
> +    uint64_t *pcreg = &uc->uc_mcontext.pc;
>  
>      if (*pcreg > (uintptr_t)safe_syscall_start
>          && *pcreg < (uintptr_t)safe_syscall_end) {
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

