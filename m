Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95284A69C9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:02:24 +0100 (CET)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4yV-00078Q-IR
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF2KB-00022l-H0
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:12:35 -0500
Received: from [2607:f8b0:4864:20::1034] (port=43900
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF2K9-00024L-Et
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:12:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 qe6-20020a17090b4f8600b001b7aaad65b9so4171765pjb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9qtW6DXywRUbIthNHIlYjqyvbxFmbcoLyNS2jxNOu+o=;
 b=UkQP0/fbeLZGK8zB+dtOr7jAlEJv5CDyG9XuU7CuHUT7Oym4nYsV0RsqbvSzeFDBmI
 OEDSqkw1zDv0Hm+TSC+tiqmF8JJY1tw1jvEqIg12fSti3CxpnNyK2PAMFZMLZN4/pttw
 4xxGEs7jkBPLpaELRlYQDHhp5l5WprAWPYNrs92AczBemSpYeJFt2quucnB14t6PH4W/
 oTfnG8yOG9QwxchVaWMkL35md+/w13e180xbKxrbi5+I2A2YGK2gzp2TOmTnzX7FFogt
 6jizTfoXSHY/tDfeJYq/A41bFuR829yHfyEU7+TMj4ukwrVIifBEOuy7YQmMGAwX/7QT
 DbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9qtW6DXywRUbIthNHIlYjqyvbxFmbcoLyNS2jxNOu+o=;
 b=3rnyTSHi0l8QobMXUYsDUqfSY0cJPTeaTZQxHvbwA8QbgzupCYPrDrCpYbjdcazx8e
 S8wxTNqsonHA4QG4vj8VNkkRp0fAfhzDTWnhGFXosaz4UI0egjm/Sev9b/05mjvRO9xY
 i0lm2y39CTGByU9+gsszCtuMWolOiNlRDlBbYStdSocklVuLQ+mfOcw5uXUuKNhx+Clj
 5g4qvScEzFUAlXxwquCxoMYJKOmIHbLAZLaooqtGHRb/7o1QQhpsRw/BGw7bmhO0vjHh
 nGdtU7YSrEYEWJsfn7UwIDBrNW12CWMAVtlzO/hteL9jdxCPX00v5vrCUiZJuziVu+fC
 r37g==
X-Gm-Message-State: AOAM533mb5npElDg3FNVs60gMsdMNXOWldNAbB2ZRIdHNcBF24zRHfbm
 RZBn52t8tg+oMhPkaiWny1ChFQ==
X-Google-Smtp-Source: ABdhPJxJYMGlfUlwVQ6AHg5JtUqeXC+PIG9T0HvsbGe0nzhIbtzQaEXiE1EtkaBWlnyB8W4bK4az0Q==
X-Received: by 2002:a17:902:db0a:: with SMTP id
 m10mr27678289plx.92.1643757147924; 
 Tue, 01 Feb 2022 15:12:27 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c?
 ([2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c])
 by smtp.gmail.com with ESMTPSA id z1sm20287174pfh.137.2022.02.01.15.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 15:12:27 -0800 (PST)
Message-ID: <e67123f2-8c8a-6481-f7e9-a07c63665b98@linaro.org>
Date: Wed, 2 Feb 2022 10:12:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] replay: use CF_NOIRQ for special exception-replaying TB
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <164362834054.1754532.7678416881159817273.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <164362834054.1754532.7678416881159817273.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 22:25, Pavel Dovgalyuk wrote:
> Commit aff0e204cb1f1c036a496c94c15f5dfafcd9b4b4 introduced CF_NOIRQ usage,
> but one case was forgotten. Record/replay uses one special TB which is not
> really executed, but used to cause a correct exception in replay mode.
> This patch adds CF_NOIRQ flag for such block.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   accel/tcg/cpu-exec.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 6dcff3618c..5962f158dc 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -648,7 +648,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
>           if (replay_has_exception()
>               && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0) {
>               /* Execute just one insn to trigger exception pending in the log */
> -            cpu->cflags_next_tb = (curr_cflags(cpu) & ~CF_USE_ICOUNT) | 1;
> +            cpu->cflags_next_tb = (curr_cflags(cpu) & ~CF_USE_ICOUNT)
> +                | CF_NOIRQ | 1;

Queued to tcg-next.


r~

