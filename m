Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5B418120
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:54:24 +0200 (CEST)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5K2-0005aG-6E
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5G9-0001Ye-03
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:50:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5G6-0006rn-EP
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:50:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t8so35322848wri.1
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0M4fUwjCQuKlxoeRC5DZzAHsIYn6IXxHEgEATcqLX/4=;
 b=hH5lMLnWLuPqL2tCszalABylInGC6qWMzUZeHVRhk8Kc1dOlBuHa74r+LTkKz4diPg
 33snNXT4pDaNWRzwSSXYo1imlWdR7bg9053L2zDY+ZzdNeIGjrFpYUG6kDCZ/Z2A6Uf/
 KC11VcOYEWj6l9DOai7bvqV1jBuNV5EKYaIlS5mveirVQrZLO56xGtP+5Xz6V7Csk9id
 NYEKU3vD9X4vVf+Ae4hjmgMgU0kAMLhiip1gtiDze4X+s511UOoJO0zip7+MSOlbxnTg
 w7Q6dxUgrZjABCamnVFfWsYkpp8iKjeJnCYbkB9TtEYd+YqRfdmJVva7wKoJ8NYWqdgD
 0UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0M4fUwjCQuKlxoeRC5DZzAHsIYn6IXxHEgEATcqLX/4=;
 b=riLKLZHj+18Rxki6pYGQJRCyxe93gt4ux51o0i7olJJHcF6DqFjnkb+2BG4ju0HJh4
 x1PxOM4cWsMWddjvuthjlIrxTigKOjvFpCzIgnlIrEHCmzPTEZ8wmmydqk3N7mQyxAA3
 Ih95bAQ1o0MHIcmVDiCaJWWKl3NTRgDjqo5ar7sk8JJ3JRNxMewOsSipwd6qclcNVsxR
 cP/xGQNUkLFoe9FOIUyJsT4thnd2MkHchgdIg0zNF+EHiec8uLJ/3t/raVZRDUg7hxdQ
 wLEsiw8AAbPTQXeKwvdfgJxMUp0ITruxzkYc4wrXlih7yyrPpK8X6W8vV2DJ6SafPpDw
 QRuQ==
X-Gm-Message-State: AOAM530roNEmrT5x+4UGog9O6pNN71niX104rweohOmhUuxsiUQow4lY
 5h+XdC/DOND7L/nDWM8bUBM=
X-Google-Smtp-Source: ABdhPJywA0iUendDnYxaCCfaDnrNrrVutM5fLYHGkOt3mPurp8GKz0sLJn+z4vUM8rUE84mdpb4E/A==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr16558837wru.210.1632567017076; 
 Sat, 25 Sep 2021 03:50:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l13sm732116wme.38.2021.09.25.03.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:50:16 -0700 (PDT)
Message-ID: <dde592d4-35fc-8f33-009b-cc6a0e4460ad@amsat.org>
Date: Sat, 25 Sep 2021 12:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-15-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> Create dummy signal queueing function so we can start to integrate other
> architectures (at the cost of signals remaining broken) to tame the
> dependency graph a bit and to bring in signals in a more controlled
> fashion.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   | 1 +
>   bsd-user/signal.c | 8 ++++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 5a2fd87e44..85d1f8fd2a 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env);
>   void signal_init(void);
>   long do_sigreturn(CPUArchState *env);
>   long do_rt_sigreturn(CPUArchState *env);
> +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>   abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>   
>   /* mmap.c */
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ad6d935569..4e7f618944 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -19,6 +19,14 @@
>   #include "qemu/osdep.h"
>   
>   #include "qemu.h"
> +/*
> + * Queue a signal so that it will be send to the virtual CPU as soon as
> + * possible.
> + */
> +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
> +{
> +    return 1;

Shouldn't we abort() here or at least call qemu_log_mask(LOG_UNIMP)?

> +}
>   
>   void signal_init(void)
>   {
> 

