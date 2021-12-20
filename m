Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C747B5F2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:46:03 +0100 (CET)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzRPu-0001o9-6b
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 17:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzROI-00009C-PZ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:44:22 -0500
Received: from [2a00:1450:4864:20::52e] (port=40775
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzROH-0004qs-6e
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:44:22 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z29so44289231edl.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tZJvUtxd69qV94nvW4UFGJyn42CIURVpn7d/mCj/HUg=;
 b=plewMrrLHUsEL0fei9WhP7EjIWi0bmLScIkuVTdmudNAw/TgUgcimpRQmsxtKmHU1S
 7w90UVBMx6Ne8EgSIRKG+GwSx/hdr1zfhKIx0mBrfg/gVE0BbZYt9BgMXS/rEC4AflEG
 5JiWxyJ00oxyN80jBAv3aqGmW7M9iFuWzE/f8M1JSaUfS44yI0IRlrIABQTcQQGds5OQ
 mbK0FeEvlqhnYRIdrl6DXWwiiIXZEikLUdrpvuVtXcjgSqmdJ+6UXb+3529GmTAs+pMK
 BHA+FD0YPmdW0QD8RxQZ8GrMvISh4YKigt2SmRINGjuSrCiVJjphNzKKJI2o2oxORUbF
 /F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tZJvUtxd69qV94nvW4UFGJyn42CIURVpn7d/mCj/HUg=;
 b=IqiaD9dxrXyjqhOP3uw0NLGfTt1Lb+N/p7aGMqdsyr3pXdaJz5eK6aBMoF3Tl23INo
 qZV+uuLPnScCz0a4lb+R7iygOKY66Ia8P5vKGtMHcUl13V5bJHghWHh7Opt0xdGtBIjK
 2SF6QRHzDebb9fDVBlkp/vIlDCbLfVBvbmMUXw8AWv1Y8IuCB3OtGBA0+t0mndvu5fCG
 2n3o6Sp75pGcCo1C68YIpRekJmgC0QjjZ0tao0Q8iXBMaBIDgs2pPDN4zotE14fEU4nl
 0HJCRrdDfdbF8BZaeJR3NVSSb7vKnLrWE5z/LH2Z5vYUJs/6lgvMLW+Jo+tRrpSlPAgD
 ylXg==
X-Gm-Message-State: AOAM531eaDjhOdX9Z5tbo9GYeCQ3BbGIG+7rFOuch7sNpgb/Aul9MWC1
 uvPEoY9pRUI91R3xulW6geLL/ACl/9o=
X-Google-Smtp-Source: ABdhPJwGSKvlAW2UD+e6OFDSQ4YWut1xw8dsDCJP4bUw+ifbSXpde7PJxcXgWzFTIR7KA/bTAHeegA==
X-Received: by 2002:a17:907:2d0e:: with SMTP id
 gs14mr266418ejc.472.1640040260001; 
 Mon, 20 Dec 2021 14:44:20 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id mq7sm3912032ejc.172.2021.12.20.14.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:44:19 -0800 (PST)
Message-ID: <0e57d7a6-0647-66fa-c13f-bb65884d85e0@amsat.org>
Date: Mon, 20 Dec 2021 23:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 08/24] linux-user/hppa: Set FPE_CONDTRAP for COND
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220210529.150423-1-richard.henderson@linaro.org>
 <20211220210529.150423-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220210529.150423-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Helge Deller <deller@gmx.de>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 22:05, Richard Henderson wrote:
> This si_code was changed in 75abf64287cab, for linux 4.17.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h  | 1 +
>  linux-user/hppa/cpu_loop.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a738bdcecf..f9240702eb 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -688,6 +688,7 @@ typedef struct target_siginfo {
>  #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
>  #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
>  #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
> +#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
>  
>  /*
>   * SIGSEGV si_codes
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 8e13f84a64..c33a59fef5 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -156,6 +156,8 @@ void cpu_loop(CPUHPPAState *env)
>              force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
>              break;
>          case EXCP_COND:
> +            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
> +            break;
>          case EXCP_ASSIST:
>              force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
>              break;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

