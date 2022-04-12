Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1614FE404
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 16:41:28 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neHhv-0007m6-Bn
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHcc-0002xO-A3
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:36:01 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHca-0004NF-Kd
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:35:58 -0400
Received: by mail-pf1-x429.google.com with SMTP id p8so17668982pfh.8
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4K+aQqtMF+WybeDSMkMYF+0Esfoqx+hjBSSFIrKERbg=;
 b=B5G/iACAeQWf/xtkyj1KH4gBj869CB/ZH7+493AWpuSwyjS066W0NwucgvSjELE2FV
 yTp6irUM/3W7X5dMQaJj9cxIpehQ0ahx+qOnwmTYbzphzQNMg3GcqTb+061WxXmdRRKa
 x607TJlj9og04lkWHlIChQRKO6UAhudZV8gDxefgVtcLZwyCOt04lM+ly/mGkhXv3/dI
 d3qJnkfkcPanfjI4dMaWI81c3g3CeL6xVMYXPZzjD1XloWXmXw2KV/B/gaMHyEjFM8V1
 uhxQLSfXduu3AyEinY5/KJF48nMepwUIuUD6ycV5FR3IWXWm0RMv5i/0mjBkEC62Ic+c
 p0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4K+aQqtMF+WybeDSMkMYF+0Esfoqx+hjBSSFIrKERbg=;
 b=qLxPLLqttGnmx7ltIzOOHKdO4V4PVhoJWqBGIAP8Mc+CTkqmv5aMCs7gkuZ1MYNRb3
 nBhaEZK8FPdoqW49peOfbfHOkczEexv33aE6hrsIFTF9jcUX+EHVVsoeoTFp1iMoAGWi
 OUdI8N/W30sD64TwV9WcTu81Nbb4qGk0J7bdxuUpB/tQ274b9/6E19IGU4NYbc/uDez7
 MFvFjcFRvH62XNLG+MIMw69ARXkbLwZj84wdGBHkDOaEj1XhUlu1kRJjnkbatfZAmcXp
 kWBsigCzmX84xKmpWKypFKUDaep2TJJViIyeJqathf56lby3n3tLxi9leTjmw2w6I9oQ
 3NNA==
X-Gm-Message-State: AOAM530M9PdMwJufB4ndX+z/jq95P0DodlbQ9BA+2aVxikcV0HMWwFs5
 snxthRb23mfhQxJTvDutFgISRQ==
X-Google-Smtp-Source: ABdhPJy3qDty5injO2mPbmdYDZmGu2cYWk6lXTn8sNXfS/uGc8xnXcbSt+ImFgsmLh2NcdjU3dIoYQ==
X-Received: by 2002:a63:981a:0:b0:398:49ba:a65e with SMTP id
 q26-20020a63981a000000b0039849baa65emr30847498pgd.231.1649774153735; 
 Tue, 12 Apr 2022 07:35:53 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa79562000000b005060571a5bbsm1822902pfq.157.2022.04.12.07.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 07:35:53 -0700 (PDT)
Message-ID: <62294b8c-ba67-7dce-ea57-5f552dd86043@linaro.org>
Date: Tue, 12 Apr 2022 07:35:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] target/i386: fix byte swap issue with XMM register
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220412085426.148191-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220412085426.148191-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 01:54, Alex Bennée wrote:
> During the conversion to the gdb_get_reg128 helpers the high and low
> parts of the XMM register where inadvertently swapped. This causes
> reads of the register to report the incorrect value to gdb.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/971
> Fixes: b7b8756a9c (target/i386: use gdb_get_reg helpers)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   target/i386/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 098a2ad15a..c3a2cf6f28 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -129,8 +129,8 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>           n -= IDX_XMM_REGS;
>           if (n < CPU_NB_REGS32 || TARGET_LONG_BITS == 64) {
>               return gdb_get_reg128(mem_buf,
> -                                  env->xmm_regs[n].ZMM_Q(0),
> -                                  env->xmm_regs[n].ZMM_Q(1));
> +                                  env->xmm_regs[n].ZMM_Q(1),
> +                                  env->xmm_regs[n].ZMM_Q(0));
>           }
>       } else {
>           switch (n) {


