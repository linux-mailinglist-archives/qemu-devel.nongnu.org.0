Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA344654F56
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fdH-0000y5-Jq; Fri, 23 Dec 2022 05:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8fd8-0000xh-20
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:50:25 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8fd6-0002eY-FE
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:50:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id bs20so2128916wrb.3
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 02:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/Czr5WFKP2m5dCNHp3/aMx6026I97rdUJQllzIWhv8=;
 b=ppmptRtf6WWalA+EHd72pSztioJ9oH8pxheJa4lS5EMRDNygMO/JgL0qPUqFS+xT2r
 02qzYairzeY4TzV/EvDjX4zxe4LYhH5k3Ly6vwJyC+OQINxsEFYqks2D8mOrd0UNSwPR
 de5h6NaevC9idM2RO/mA/w9pFaoRy4w3sMO7fPtxdBM/2uISt6zxHVtrnmv/J5wmJWdY
 m4LpDC9OqIMM0vGIUoFzXbAPK4kJl1qczfPHKfouAJYa0AEKTklxZQyRTOKIVzaKieNM
 /7FSs9PgsYudPlHDyFajNHWnDPuC+1IQKmNuzhx/emRYXdcC0KuPpz7DkC+AECuR76iE
 IkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/Czr5WFKP2m5dCNHp3/aMx6026I97rdUJQllzIWhv8=;
 b=WOE0aq4m0ADLIilFJcWTvz7sYi4WKgDX3cuMAf7FXCmIJYxtMMrU+NNToVuY8nzBB/
 LC8YXyp7eUXINJtm6m30Y9rKLAbOkJQ4kmKdgVjQoQn4w9qaPc7c081XjD/IDplDS4Bb
 p7ounduf9w11wHjvZkuNAviigTxyPIgpmvJfTXOi6BowM6xhXWYOYwn+ngEDyGRag+ep
 SH78EL/M+ZENbDuZBNyKz4BjjzuBeqbrMJ5Lk3qrhPRIG/gG35boBjRGjyKFnGlms2y+
 ZwC1PzomL66bk4QPPutDkJZOasbWjDbZvIdVLgh0VTfvRhvn53+2HkrbI9BKpMUTyfm4
 ZIpw==
X-Gm-Message-State: AFqh2koCh8QfB4HFzrHTZPrczr+0nBAxTySKkGRlSbL0yDkHtC4u7YCz
 KVouBb0PYSpjInnC/TX12rxwfuOh5R6Hcx1ROC0=
X-Google-Smtp-Source: AMrXdXtoOY47jG2tVsPhSI8vHQS4Mh32r0UhKQU8rBlDTDroAxoNdnPUsApZpwR3hOCSE4n6FpGu3A==
X-Received: by 2002:adf:e98e:0:b0:242:15b4:35d9 with SMTP id
 h14-20020adfe98e000000b0024215b435d9mr5972278wrm.42.1671792618889; 
 Fri, 23 Dec 2022 02:50:18 -0800 (PST)
Received: from [192.168.27.175] (160.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.160]) by smtp.gmail.com with ESMTPSA id
 h29-20020adfaa9d000000b002368f6b56desm3578133wrc.18.2022.12.23.02.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:50:18 -0800 (PST)
Message-ID: <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
Date: Fri, 23 Dec 2022 11:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221223100107.17303-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/12/22 11:01, Helge Deller wrote:
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index f9254725a1..909298099e 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1043,7 +1043,7 @@
>   { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_personality
> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
> +{ TARGET_NR_personality, "personality" , "%s(%p)", NULL, print_syscall_ret_addr },

Shouldn't this be:

    { TARGET_NR_personality, "personality" , "%s(%u)", NULL, NULL },

?

>   #endif
>   #ifdef TARGET_NR_pipe
>   { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
> @@ -1502,7 +1502,7 @@
>   { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sysinfo
> -{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
> +{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sys_kexec_load
>   { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL },
> --
> 2.38.1
> 
> 


