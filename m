Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E33C7485
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:30:02 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LIH-0003ja-Fm
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LGR-00080W-8O
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:28:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LGP-0004R3-C3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:28:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso2755053wmj.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tOXLfBRxl9jR8v0SSW+tlnn4Nah1FsfFTxsOyv2drsI=;
 b=hrPNOowmqMUSF20IQpGqlqSQ8XIONwuTZwuCEcC36S1npvg0QhbdJE8S66UuxLZ0F5
 Wu3hcK62RfJB55iSuaUVj0qVShLqvb280UK8wqLbxnN9TwFtgGDzVtdlKW6hLuY4grYL
 D6RXgCtTq1bRpIvz6HAhUHr43Pd1o+R7sygvgvir8W4T+aIJb5mwgy6mfvGOhGh4UE0Z
 W36KVu+OYNqPldUhLC6g1jCrxD/O2j1+I8+VfVk3zuVXaWWw/9lHVKefThVds5MOT7em
 /sXgmhBqXChKk2nnV3D11jUS+0x1d/j2r5vOsJ5M7uurTF7+8ZREMk0RPMVYNLTzc02s
 lImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tOXLfBRxl9jR8v0SSW+tlnn4Nah1FsfFTxsOyv2drsI=;
 b=Qy/EPObvIm8eaD/VZ27ZkYTnLlqWjqPUiXnNfqtQLKbbAftGtiAHIF0YxZbQjyrzLq
 ipKsbN0ugMsD6zilou2geRPqH9YuvHPERDSbZpyFhXeb5wG1yPOeRXmWRawqh45EEWh+
 65UyX4rJ6bmf3MhKEtnRgE7bIq8aALpPq/IMD8lfUus59hJfXSCthfjgptNx3lv6Su1a
 NoNc2IeFbdnvxO6Sgkp8R6IQs73+8BWs1LVGevGJnvAFY0/SxmO7N31VfYv1iVJ3glte
 4gn33lC99d9hwyKRnSuGaRdiJx8dgiuUm4D7k3wasiZ8pDcsuVVnLJ53e/IbOUCtLK73
 86eg==
X-Gm-Message-State: AOAM530ihApHh0bnadS8PNDW8O44tHzUolB//n8IM2KlfQNFa7rdoi/7
 NM5rlkkDYbHWMU3FXohonEpNBh/eZxSE5w==
X-Google-Smtp-Source: ABdhPJwPtgUaKgfMcLf5CtNbqEX9Zj3sbfz14SLuyprzKhxlMFUx/O3I9jETjKR07mc6n+qjgJC7Dg==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr230621wmq.182.1626193683720; 
 Tue, 13 Jul 2021 09:28:03 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id o3sm17328115wrm.5.2021.07.13.09.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:28:02 -0700 (PDT)
Subject: Re: [PATCH 02/11] accel/tcg: Remove unused variable in cpu_exec
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <801f2380-393a-b5df-5396-d1ccd9d24f86@amsat.org>
Date: Tue, 13 Jul 2021 18:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712215535.1471256-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 11:55 PM, Richard Henderson wrote:
> From clang-13:
> accel/tcg/cpu-exec.c:783:15: error: variable 'cc' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index e22bcb99f7..a8d8cea586 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -780,7 +780,6 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>  
>  int cpu_exec(CPUState *cpu)
>  {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
>      int ret;
>      SyncClocks sc = { 0 };
>  
> @@ -819,14 +818,12 @@ int cpu_exec(CPUState *cpu)
>           * so we only perform the workaround for clang.
>           */
>          cpu = current_cpu;
> -        cc = CPU_GET_CLASS(cpu);
>  #else
>          /*
>           * Non-buggy compilers preserve these locals; assert that
>           * they have the correct value.

Maybe update comment to singular, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           */
>          g_assert(cpu == current_cpu);
> -        g_assert(cc == CPU_GET_CLASS(cpu));
>  #endif
>  
>  #ifndef CONFIG_SOFTMMU
> 


