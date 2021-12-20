Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F7B47B5E9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:32:44 +0100 (CET)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzRD1-0006gy-0X
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 17:32:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRBq-0005ef-E1
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:31:30 -0500
Received: from [2a00:1450:4864:20::52b] (port=45729
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRBn-00035E-J0
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:31:28 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j6so23519373edw.12
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CN3Yct0/l4poS8vUFSxOrzcWSAJc0P8gDUbiOyJ/hQg=;
 b=L8jRP5wtIcSo28habdUIfl/IWCiNCh+UNt4zzwnDoaeCmAJBFnLH/F1hXmPsYtZ9Qc
 KJruGm0DPzc+J9DL5n8r0pGZkahSINHM9MlkzAK93w5p/mm3A/ziQjiMCzDlCpp7DKi9
 CDM1Z2Cq5wG/VOL64P3x7G84wJFZSkmH4BBNETWB1eFcFrub5qUI9VGpsl+c3HPVTzXA
 EUy7hznK0VBOFkdX2dSr8OK5dOHzVOEgimOoNC3E2Q09yDLHY3LzSqqSXT6qoQO7nQXj
 Jw4srHPUT5hvJIQbh9TNDBHmicYe5sIpAj1M8SwOR48E059cls9TO5t3OJOcbTB6iCMD
 pnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CN3Yct0/l4poS8vUFSxOrzcWSAJc0P8gDUbiOyJ/hQg=;
 b=k35lxZ/KVKjkvLH4DY7GeKDo1/N1fbN2SeYQf1aWSU/C3dNIPP6YsnS4qguGgiCq6Z
 tj7IcFYoHqAjbq1djqp3YRz5IYVXF4om4PKJ7da/X4b6x5mAqYKwt4e349lden+QjkvV
 cGnucbHQhaXcTbZ3Xft8WUfOjtFqUah4tRJvxWrkfUwXRBTjRlJi6TWI8oq0uo7k15Bj
 mCVSUsgMIUOIFzJhAwLtbtmpJEMOQnYiwHnyYEcMFVXFN42oP7GxyJa6DfL+otX1+g8B
 K6trhylUk1MHPdDccfosHv3Jh2oso9iua61v2KFmnW5hxSNfsKDlK46M5z5g1DeW/hix
 b9Pw==
X-Gm-Message-State: AOAM530C0jQULX4TT6bTazj3ky06fb7bTX4zYeYooHsw+0zYyGPKjjb7
 7y1URAdnkTnivwsEu579cmc=
X-Google-Smtp-Source: ABdhPJyliw2U/Vzzu7GmTFK3w8cj3S7vQcW2oz5cot0u7wQ+7dyO1BHCI1EkzCALiwDMkOaHuhO6Rg==
X-Received: by 2002:a05:6402:16cd:: with SMTP id
 r13mr247469edx.264.1640039486081; 
 Mon, 20 Dec 2021 14:31:26 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id mc3sm5680103ejb.24.2021.12.20.14.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:31:25 -0800 (PST)
Message-ID: <8e28ad1d-33be-e938-01c8-17b48458cc97@amsat.org>
Date: Mon, 20 Dec 2021 23:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] linux-user: Add code for PR_GET/SET_UNALIGN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220214135.189157-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 22:41, Richard Henderson wrote:
> This requires extra work for each target, but adds the
> common syscall code, and the necessary flag in CPUState.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h                     |  3 +++
>  linux-user/generic/target_prctl_unalign.h | 27 +++++++++++++++++++++++
>  cpu.c                                     | 20 ++++++++++++-----
>  linux-user/syscall.c                      | 13 +++++++++--
>  4 files changed, 56 insertions(+), 7 deletions(-)
>  create mode 100644 linux-user/generic/target_prctl_unalign.h
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e948e81f1a..76ab3b851c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -413,6 +413,9 @@ struct CPUState {
>  
>      bool ignore_memory_transaction_failures;
>  
> +    /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
> +    bool prctl_unalign_sigbus;

Could we forward-declare a UserEmuCPUState structure in this file,
use it here:

       struct UserEmuCPUState *user_cpu;

and declare it in include/hw/core/useremu-cpu.h (or better name)
restricted to user emulation?

I'd rather not mix sys/user emu specific fields in CPUState.

Can be done later of course, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

