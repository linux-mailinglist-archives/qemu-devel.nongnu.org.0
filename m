Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830C546936
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:14:00 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgKl-0004sE-B1
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgHl-0001VE-86
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:10:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgHj-00075k-Rk
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:10:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 15so24116155pfy.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pH8LFNfmbNxww+Fe98hVyppg7UxzmnOvkbInPts79sQ=;
 b=TdSPoCK7m7czQyg+aV/QveAopmgH+SPI3qJanxPP+/PeDOAG9VjSzfZVQeBHWcrN7c
 +G8jRSW19bSWZX6ST9ghf9pYSUh/zjCaK1vwPxF1BuLFAFFMu1EKgk9/4VuG6RDOOlX0
 b+rVIJZ4BSQVYxo5OcKfn0D1uSAPxjczeZzwlo3+dqg6cmm3gxHlSyxwEm4UCB8pdjy+
 jTkx/JW3KxII/qMukeM9eJVS7tRbUBqjDYxR18qeC/wY09tbhycUj0Wm7j2POmm0btXz
 MfrX9IFcDpOdPgLu5qI9sUmGn7eEvXqVVN1Ap6aVFZ1qoqtuzhiKvXD25TelslRjN29u
 +Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pH8LFNfmbNxww+Fe98hVyppg7UxzmnOvkbInPts79sQ=;
 b=QQ9Du5u1D8XoG4X4INI9G2/H0FNDXri+zeFac2laaNIjNvnDayE4UZonOPc0fv7IeK
 z2jhbQX0nCm9g+vdRqv9W1QAqiamXVgAZMZCN84ZgLeNGHW/LCSs/LmQfOG/D/1thI89
 CdXvIt31wRjypldrd0gvblrHSxmKoyiglOQact1nUUZhw01uxonOWc5PJLS5ZN+CixG/
 kizoHc6uZ2HlO5dMAFXozdgxF1K9ZKb8arfvLg8ZYME8pOZdkHqrEvSdC0IjKxCjWmvP
 KcqOys2Mh4cRVCxoTimBot7zjwwlJqVKZ6QogIv9hz2OcR/Ixq69WHdl8i+ULdinpa+d
 b5pQ==
X-Gm-Message-State: AOAM530FAhluxfz/PBolpt9u+kNVcYqFpiDDiAlnKZEAmd2mBvm8wx4Z
 66kXLLoQZnQm2+z3YRfy69jR+cjCVsc=
X-Google-Smtp-Source: ABdhPJzKnVYA1EMswFU70IcHumgtEnPpcOz5/547sLMaAzqn6Crog/omBudgsdjI3P0G2btaPkMSsQ==
X-Received: by 2002:a62:cd08:0:b0:51b:c569:cbb8 with SMTP id
 o8-20020a62cd08000000b0051bc569cbb8mr45196442pfg.71.1654873850609; 
 Fri, 10 Jun 2022 08:10:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902c21500b00163bfaf0b17sm16959575pll.233.2022.06.10.08.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:10:49 -0700 (PDT)
Message-ID: <203e89b8-4fab-fb5d-0bc5-e5652f4f776a@amsat.org>
Date: Fri, 10 Jun 2022 17:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 08/11] target/mips: Use error_report for UHI_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-9-richard.henderson@linaro.org>
In-Reply-To: <20220608051945.802339-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/6/22 07:19, Richard Henderson wrote:
> Always log the assert locally.  Do not report_fault, but
> instead include the fact of the fault in the assertion.
> Don't bother freeing allocated strings before the abort().
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 39 ++++++++++++++----------------
>   1 file changed, 18 insertions(+), 21 deletions(-)

>       case UHI_assert:
> -        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
> -        printf("assertion '");
> -        printf("\"%s\"", p);
> -        printf("': file \"%s\", line %d\n", p2, (int)gpr[6]);
> -        FREE_TARGET_STRING(p2, gpr[5]);
> -        FREE_TARGET_STRING(p, gpr[4]);
> -        abort();
> -        break;
> +        {
> +            const char *msg, *file;
> +
> +            msg = lock_user_string(gpr[4]);
> +            if (!msg) {
> +                msg = "<EFAULT>";
> +            }
> +            file = lock_user_string(gpr[5]);
> +            if (!file) {
> +                file = "<EFAULT>";
> +            }
> +
> +            error_report("UHI assertion \"%s\": file \"%s\", line %d",
> +                         msg, file, (int)gpr[6]);
> +            abort();
> +        }
> +
>       default:
>           error_report("Unknown UHI operation %d", op);
>           abort();

Pre-existing, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But since this is a guest error, I'd prefer we exit(1) instead.

