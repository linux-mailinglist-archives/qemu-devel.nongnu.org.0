Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91341695184
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:14:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfC1-00076p-Ol; Mon, 13 Feb 2023 15:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRfBy-00076X-Lv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:12:50 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRfBx-0007fX-2L
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:12:50 -0500
Received: by mail-pl1-x635.google.com with SMTP id h4so6898896pll.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 12:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fiFLm3cwYYddw5C1t5xluJ1T/Tp5VlvKx013eSOE/3M=;
 b=LQAyMTxaYEnAzQCrBT57b1fvLcz4ZobBfasExkNK87vujD3AlkXCTRBXgLZ6mD6kyM
 2YmFoD/+vWMNYHcGWd6zrUK+zTrh6mmkKzjYfSW6Wo6ivGFO8X/r1fhdrpQZ1zVPXnuR
 G+uOiNBbjbU8cIBBKOrPqgJzWoTYm5H7g8T7gmBSXVyu75bdJJUzPDVHAIE0hF18s0XA
 UsWT9Uv6syHYiYulcvGEOcui5fCsABYUDHwkIVzr3lZK31+FnheCzPa4FOw16tB6XQot
 sGanc2zXtQKqbSrGY+ofNGoW3mjUgsq3rF2gVuMVax0irlbWJs1atcRTsCykD7vmJekc
 F9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fiFLm3cwYYddw5C1t5xluJ1T/Tp5VlvKx013eSOE/3M=;
 b=nZuepOwkf89NGudBTb3Lw4Nz1+emszKeKp0yYDMBYw/EU/yZ0pCraCdzOA9rpDMmA3
 jSzWDocw5srH0liqLdOyVJfbxNfFTECwNZQTDIeDH+0lMl1mlZyprjObOvwIzKO/LcUb
 xmPat0GjTPKzk68iqsZHTA4j56y8mY0OBnj0a5TGWOBhsRLmyaSUl7DrNwjGWKKCKq25
 uFcTRz+Jv8CFH8GO3uDqJy4jIEZfqwm2UIPvANVV+8FZioCvmSnUdSlK1Xz2V2Gchbea
 mhkOqB9CYGZhMd/pUnoO1noKQl5nTE+I/Ork8XGS64olQURNVscYoAO5tsptabYvTH/d
 1cPg==
X-Gm-Message-State: AO0yUKUIkMw07yf+lmoeSozwtSMmEftxyO2Y5SPZQSvcRWvxV7ezG/ke
 WHb5HfLZQBUTAEbbmCAI91EHPg==
X-Google-Smtp-Source: AK7set8TZbfmuoQuKTot7V7yTztHRUYyBBcVHR3idEiNCeWlw8CWvr3KOeFKF3DRM2xeJzU+LNbXMQ==
X-Received: by 2002:a17:903:32c6:b0:19a:aab3:c97c with SMTP id
 i6-20020a17090332c600b0019aaab3c97cmr248058plr.0.1676319167311; 
 Mon, 13 Feb 2023 12:12:47 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 h16-20020a633850000000b004e25f1bb85csm7602647pgn.54.2023.02.13.12.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 12:12:46 -0800 (PST)
Message-ID: <cc54f8b9-a8c6-9606-415d-fe8a26bf09bf@linaro.org>
Date: Mon, 13 Feb 2023 10:12:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/4] cpus: Make {start,end}_exclusive() recursive
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20230213125238.331881-1-iii@linux.ibm.com>
 <20230213125238.331881-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230213125238.331881-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/13/23 02:52, Ilya Leoshkevich wrote:
> Currently dying to one of the core_dump_signal()s deadlocks, because
> dump_core_and_abort() calls start_exclusive() two times: first via
> stop_all_tasks(), and then via preexit_cleanup() ->
> qemu_plugin_user_exit().
> 
> There are a number of ways to solve this: resume after dumping core;
> check cpu_in_exclusive_context() in qemu_plugin_user_exit(); or make
> {start,end}_exclusive() recursive. Pick the last option, since it's
> the most straightforward one.
> 
> Fixes: da91c1920242 ("linux-user: Clean up when exiting due to a signal")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   cpus-common.c         | 12 ++++++++++--
>   include/hw/core/cpu.h |  4 ++--
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index 793364dc0ed..a0c52cd187f 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -192,6 +192,11 @@ void start_exclusive(void)
>       CPUState *other_cpu;
>       int running_cpus;
>   
> +    if (current_cpu->exclusive_context_count) {
> +        current_cpu->exclusive_context_count++;
> +        return;
> +    }
> +
>       qemu_mutex_lock(&qemu_cpu_list_lock);
>       exclusive_idle();
>   
> @@ -219,13 +224,16 @@ void start_exclusive(void)
>        */
>       qemu_mutex_unlock(&qemu_cpu_list_lock);
>   
> -    current_cpu->in_exclusive_context = true;
> +    current_cpu->exclusive_context_count++;

I think this line would be clearer as "= 1".

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

