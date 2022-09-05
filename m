Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894355ADADB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:22:51 +0200 (CEST)
Received: from localhost ([::1]:53858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJYQ-0006yx-1i
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJWM-00037W-FW; Mon, 05 Sep 2022 17:20:44 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJWK-0004Oa-Nn; Mon, 05 Sep 2022 17:20:42 -0400
Received: by mail-pg1-x536.google.com with SMTP id v4so8893001pgi.10;
 Mon, 05 Sep 2022 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ClkKAYPzt/60FXcQF7Tf2ZvUGuVDImS1rJg+PZKYzZo=;
 b=IPNxgmcmPKQ2O3fQYegOz3SKsPnVWkinWyuOaXgRCDvhl3uMsW8OuR/fOpoBHBSipU
 SdkT2vqXTEhXhLpDobm5rMxCK/xk5d2Z2kWLnk/cpnMjNMcnezu6VxLVxdLOucpKthqw
 8JUalfT3L/muUM6GI4DqcivcapondTX7S08TWMY4rCcC4nXvne5SLHHAjXCj/5yp3Raa
 pK2/89E+vBPUCRjUekd3mgegD1CWnL9aMkng2Nx8hpRIqSQGaB/bpqhYej2npInRLKBT
 da8xjAP0KhiJ8BUu+4AppOe+hrxRQXsk0nmrWtON10Xv2RP5MumkQVjys9QrbaTHvyy3
 nXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ClkKAYPzt/60FXcQF7Tf2ZvUGuVDImS1rJg+PZKYzZo=;
 b=z+B7hv6Ai6dI3wrPfGh1R6oYjflcKFjCF0JH209cJOssLon66WOXA+LGuhjxj+NxOL
 XGwN5ZtP02SYoUKINOQRUmMkbZsoMMn3ds7mwT6ROAhEJG+LCpWPgvZ0A9l50x+MP90r
 NFApqSn1b656RRk+3quXgf7BT+Fica38wO42jeL03EWan198O5RuQWTKZuYOfxkjB6pg
 AV4dpDS+vc2muYnvckYwIv68P4WPfAH6XGE2xivmUDNpCVhcw9hDAuxzV2fUOzKaqLI4
 1p9+E+BkFhzpIhg3ljlRYLm5DHSa89WM7dvBUAI+PH8WG5afF9OjFztOoKnbc/tx2JOi
 5sRA==
X-Gm-Message-State: ACgBeo3w4QKL1KIgbAMjW/6wk7idWsHlcfD/Fk1tVyDte4ePvcOH8p7X
 sVxjL0uU2g/P1WEmWCEBGig=
X-Google-Smtp-Source: AA6agR60euZTD6jrfSKkgWVClfLsaigzythVWq02Jp8XWzz4B4OUQNbhEePrhO2ONhJKuwRArDLiRQ==
X-Received: by 2002:a63:6a01:0:b0:430:93ec:1cf0 with SMTP id
 f1-20020a636a01000000b0043093ec1cf0mr18416739pgc.114.1662412838856; 
 Mon, 05 Sep 2022 14:20:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a170902b18900b00174f62a14e5sm8050751plr.153.2022.09.05.14.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:20:38 -0700 (PDT)
Message-ID: <12d8deb8-3c2e-8234-0e15-ecd52f2dd3e1@amsat.org>
Date: Mon, 5 Sep 2022 23:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 5/6] accel/tcg: Introduce tlb_set_page_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-6-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 22:22, Richard Henderson wrote:
> Now that we have collected all of the page data into
> CPUTLBEntryFull, provide an interface to record that
> all in one go, instead of using 4 arguments.  This interface
> allows CPUTLBEntryFull to be extended without having to
> change the number of arguments.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h | 14 ++++++++++
>   include/exec/exec-all.h | 22 +++++++++++++++
>   accel/tcg/cputlb.c      | 62 ++++++++++++++++++++++++++++-------------
>   3 files changed, 78 insertions(+), 20 deletions(-)

> @@ -1117,35 +1117,36 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>       CPUTLBEntry *te, tn;
>       hwaddr iotlb, xlat, sz, paddr_page;
>       target_ulong vaddr_page;
> -    int asidx = cpu_asidx_from_attrs(cpu, attrs);
> -    int wp_flags;
> +    int asidx, wp_flags, prot;
>       bool is_ram, is_romd;
>   
>       assert_cpu_is_self(cpu);
>   
> -    if (size <= TARGET_PAGE_SIZE) {
> +    if (full->lg_page_size <= TARGET_PAGE_BITS) {
>           sz = TARGET_PAGE_SIZE;
>       } else {
> -        tlb_add_large_page(env, mmu_idx, vaddr, size);
> -        sz = size;
> +        sz = (hwaddr)1 << full->lg_page_size;

Could use BIT_ULL() here.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

