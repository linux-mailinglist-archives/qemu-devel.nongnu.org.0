Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553E608CA9
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 13:29:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omCR4-00080p-Sh; Sat, 22 Oct 2022 07:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omCR1-000802-BJ
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:12:59 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omCQw-0002xb-UZ
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:12:58 -0400
Received: by mail-oi1-x234.google.com with SMTP id g130so5973462oia.13
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k4j+75BwWeuozCGw87YPTXEDb8lUwCFguWR6uf1W91k=;
 b=uxsBxcWAcfVNuncys5KhZJ502zygmITZijms3NfD5MBj/U3zKCYskMbqo6HViGZw76
 r1q0zyLbj127LBFuXdcsAm343JJzQrVbxfvjQCDIIyE2chGhvOhtZTVSCHUhRU1yKE4h
 uBxDn5vsL6rsHiDcozidP84scD4wV68hGDj929Mx+rOaUidFnulQmWmZ/II8ycaoMi0A
 EBc323f7MljJEjz2O0nbaZK/Sd3nb0UfbYRkDJDwRfNTr3sf7sKM2jw4V68tdG3ahPIn
 0riAFdSb1/7P3eAWjmcLVvD8VJ3On0TTiuzZ7WtYP6+OgYYmQrtM/UUmAIYmI9Gg0ysB
 NorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k4j+75BwWeuozCGw87YPTXEDb8lUwCFguWR6uf1W91k=;
 b=2m5+M01/EaK13PputPYqJ3DsCaOOxNGPdyOah9xMAZVib0Gua5xjlHpJ5IJGzsKqLT
 r20Qoy9XW7/UiNzFF0YC8Z4ZNZBMW2MMzucC4K6e72RNbb1nWqZZHgnnrhIDVhVtsKrN
 WRFIUEHxlrTLNTdXSkBHEbYHaGt0lQlwVKRVKV85Rxb0ZTgUcdCAl3hDHRA2XmJIaRX6
 mZmEl7MRSpCw0RZdltFL7Sa0pVuMN99s9PYck3dZYLQMsWYNVNxZFejQtHWkY7lrGJsg
 ufRGgVpP+iC5VvlG4anQE8zunrAc8DPVmV0zdEkrw7zlQY3i6S3RQyoRIneYEfC88ox7
 SCEg==
X-Gm-Message-State: ACrzQf2dNosyNGZpnHf0dYosAo5HZ6dntCDorfJ3GEJdYAzxlN+tZEfw
 /LNfme7ZLtGwZey/JM48jHGHn7cgywnYRo+M
X-Google-Smtp-Source: AMsMyM63WHOorYT6lAcNA6euORewYoQd22tqCBVOEyioGZ3/7QbV1uocpRlIZr8oL+AsmNTf+gvaag==
X-Received: by 2002:a17:90b:4a11:b0:20d:382d:3994 with SMTP id
 kk17-20020a17090b4a1100b0020d382d3994mr26911209pjb.173.1666437163520; 
 Sat, 22 Oct 2022 04:12:43 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 g16-20020aa79f10000000b005672daedc8fsm1806821pfr.81.2022.10.22.04.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 04:12:43 -0700 (PDT)
Message-ID: <10ca01b0-493f-d6f5-4d77-da1518011a76@linaro.org>
Date: Sat, 22 Oct 2022 21:12:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] accel/tcg: Add a quicker check for breakpoints
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: pbonzini@redhat.com, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
 <20221021170112.151393-2-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021170112.151393-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 03:01, Leandro Lupori wrote:
> Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
> considerable amount of time was being spent in
> check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
> amd64), even though it was just checking that its queue was empty
> and returning, when no breakpoints were set. It turns out this
> function is not inlined by the compiler and it's always called by
> helper_lookup_tb_ptr(), one of the most called functions.
> 
> By moving the check for empty queue to the have_breakpoints()
> macro and calling check_for_breakpoints() only when it returns
> true, it's possible to avoid the call overhead. An improvement of
> about 3% in total time was measured on POWER9.

Wow, 3%?

> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   accel/tcg/cpu-exec.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index f9e5cc9ba0..9eec01ad9a 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -304,16 +304,15 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
>       }
>   }
>   
> +#define have_breakpoints(cpu)   (likely(QTAILQ_EMPTY(&(cpu)->breakpoints)) ? \
> +                                 false : true)

First, always avoid useless ?:.

Second, I think renaming the existing check_for_breakpoints to check_for_breakpoints_slow 
and make this test be an inline function instead.  E.g.

static bool check_for_breakpoints(...)
{
     if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
         return check_for_breakpoints_slow(...);
     }
     return false;
}


r~

