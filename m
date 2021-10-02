Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FC41FC85
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:28:51 +0200 (CEST)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWg0Q-0001ej-Oi
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfyI-00064w-RI
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:26:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfyF-0003GB-ID
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:26:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so3156855wmj.2
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QCgWaBQelMZTV1E9g+ShFWVFqo/CMXhu17bL2murnj0=;
 b=gDmjw47HV4GTtxODVe0KGBFAvo3tJXLxTQR7rmXumwGsaBv/QxeGu3sIKVTH//UJEA
 acn/yKnyBn4zf0yAQWrA5RjlBGY23Ep5ME8I2FgjSL6l5Xg5SOE1vVWQ2erDcZajWHpO
 ymGp27RdB5Mpgg1lG8yd1k/xFHqF+0Q+O937JF9BxY/nztbJ4knAY2AfrywtLG9qrO2I
 Nt6tTWUeB2d6DRAEC85y10upTruueM2yrX6ObhhF5vKwg9Gow309/k+gPQC6jnWm+++B
 pCSb9wRKyiRbcu9R6RmvN/XDzDTkWkDHpY0wBE+CVFbxDGwVVZsysG4M/ejmcXiRjlDc
 3rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QCgWaBQelMZTV1E9g+ShFWVFqo/CMXhu17bL2murnj0=;
 b=Cp7Vf2d2zCpsBeun3un7jBWHnlmaBZWFDJf5zn1AnZqyvHcSnWsHNxhgfyseH1+dWn
 ATHQ1j+1/VmVIKKXgAbhM83/4yUbL9NtYrr+ECvpNYAvBV328hk9e3XSMNXYong1FH7m
 HNDW2/a/i3wAwqfTiqDrvx99nAOIcKo3LIHLn8xVHPYcIC4gwGREDB8ZnKb1f8loTapb
 uAiydfCPXgIQiPlqxyJMhrtQX2gnijDYCtFj3MDRllL6iBtT2GPpdRqfbhQPWZA+/S1h
 S9+XmO2/BG6vuYPLyy4z7nrkoMYK6iesOCEzMQHIifjHRqx+nOTLo4ldcC8bRyAh1MWb
 EVfg==
X-Gm-Message-State: AOAM532/2J+QqBh7nnRbz7agePjcYcA32Bu5746ti2KRfcPfL+xed7bJ
 z//iAt55xl/uDLCD+FRWpOc=
X-Google-Smtp-Source: ABdhPJx7vAKsydyTcOksVPxORFMKyZDiE7DDKbeB7uqKUcsBuJx8SFHeztAw8pwkB8CmIHd37tpGZg==
X-Received: by 2002:a05:600c:4f83:: with SMTP id
 n3mr9650444wmq.114.1633184793782; 
 Sat, 02 Oct 2021 07:26:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l21sm1882764wmg.18.2021.10.02.07.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:26:33 -0700 (PDT)
Message-ID: <2319bd3a-5579-8d2b-d526-1432eb106cb9@amsat.org>
Date: Sat, 2 Oct 2021 16:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 33/41] target/openrisc: Make openrisc_cpu_tlb_fill
 sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for openrisc.
> This makes all of the code in mmu.c sysemu only, so remove
> the ifdefs and move the file to openrisc_softmmu_ss.
> Remove the code from cpu_loop that handled EXCP_DPF.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/cpu.h          | 7 ++++---
>  linux-user/openrisc/cpu_loop.c | 8 --------
>  target/openrisc/cpu.c          | 2 +-
>  target/openrisc/mmu.c          | 8 --------
>  target/openrisc/meson.build    | 2 +-
>  5 files changed, 6 insertions(+), 21 deletions(-)

>  static void raise_mmu_exception(OpenRISCCPU *cpu, target_ulong address,
>                                  int exception)
> @@ -113,7 +109,6 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>      OpenRISCCPU *cpu = OPENRISC_CPU(cs);
>      int excp = EXCP_DPF;
>  

^ Can we remove this extra line? Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -#ifndef CONFIG_USER_ONLY
>      int prot;
>      hwaddr phys_addr;
>  
> @@ -138,13 +133,11 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>      if (probe) {
>          return false;
>      }
> -#endif

