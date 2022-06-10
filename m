Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3A546935
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:13:34 +0200 (CEST)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgKL-0003rx-W0
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgIO-0002MF-Je
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:11:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgIM-0007CC-9S
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:11:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so2574927pjo.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=OT1uSg8YE9kk/aKeX/mPhEPwuf5+XvjNwli3wu9jPXE=;
 b=MXmpXyb/wo8MwvswHFWQppBdGZmEcpGyrbwso3g6heKXxMSOmcL2NSCrhw0Y9sL7hi
 zb96RUIy//o2ADkTVCS5q0OKUfYJALA+fhawvnkgTsA04tRzRb+JaPTkQt2xRoePQBgT
 1g/WfmS29rCAW3V0B/GA1rJ2lqgjadWCiI+Fusyw31V1GS/RvYIqyvszDsuAVWcL/Lmz
 gkxLzPqlNGgHsY2YUilJa9nH15fqhncLGUC5XRBn0uuFOFq6bZ/44BN0QkONt83gfIl4
 6X80Yd7KX/WdCzFurA9gAq+X3o+ztd5Z9almrW9OUsqevHhiniRrqJ3D4jeywvqO3cf1
 zQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=OT1uSg8YE9kk/aKeX/mPhEPwuf5+XvjNwli3wu9jPXE=;
 b=WiIzH3BNcvU+7xdm0sD2XlmextcDkQsZ+quJ8C2VFQhbECZc29aogKpxyzqPrmuewW
 xf8gYCRf96yDriSZBKbYFQKe5z1GDzXUr9AU/IeTbwND+qGUgkXkwUUd19OKaF/CeNnr
 058YT9Yis37yMA93loAAnsB1w5pGIL7UDOQSUI8yLpe+Zah74SuxU7VlkPxhD9kKm4N/
 ijssYkcF16Uq6/6+fiXf/rZ4LYsPup4o/r7Nt3Ru2ryjLlEQ+JxWqoL5KqTc0rZqfOjx
 62brZ+ibRCK1dAjIQHbv5XgepWHHZqoRNmGPuIoSvyBkGPigkKEoZHmmWbzBbHsH0Se7
 kbwA==
X-Gm-Message-State: AOAM532yzFOkdRDhQz7EkgzY/uzoN3GNChw9PVHhDKa+WEU/JW9MGqqI
 lvJS26m5FV1s0gAjmnIXMepdOikARrM=
X-Google-Smtp-Source: ABdhPJyhJg0Kifx2RB1QsXzcLPpVQoHvcHZfz1VZYcSA1PDeRN9qPp60LMSfSmrLTu0cYqH2gingQA==
X-Received: by 2002:a17:902:e751:b0:163:d8d9:8440 with SMTP id
 p17-20020a170902e75100b00163d8d98440mr45153601plf.12.1654873888737; 
 Fri, 10 Jun 2022 08:11:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a056a00212100b0051bb1785286sm6033382pfj.167.2022.06.10.08.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:11:27 -0700 (PDT)
Message-ID: <2a1795ca-5bc7-fd7a-ec8f-6ebdfa183014@amsat.org>
Date: Fri, 10 Jun 2022 17:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 09/11] semihosting: Remove qemu_semihosting_log_out
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-10-richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
In-Reply-To: <20220608051945.802339-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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
> The function is no longer used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/semihosting/console.h | 13 -------------
>   semihosting/console.c         |  9 ---------
>   2 files changed, 22 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 61b0cb3a94..bd78e5f03f 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -40,19 +40,6 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
>    */
>   int qemu_semihosting_console_write(void *buf, int len);
>   
> -/**
> - * qemu_semihosting_log_out:
> - * @s: pointer to string
> - * @len: length of string
> - *
> - * Send a string to the debug output. Unlike console_out these strings
> - * can't be sent to a remote gdb instance as they don't exist in guest
> - * memory.
> - *
> - * Returns: number of bytes written
> - */
> -int qemu_semihosting_log_out(const char *s, int len);
> -
>   /*
>    * qemu_semihosting_console_block_until_ready:
>    * @cs: CPUState
> diff --git a/semihosting/console.c b/semihosting/console.c
> index cda7cf1905..5b1ec0a1c3 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -38,15 +38,6 @@ typedef struct SemihostingConsole {
>   
>   static SemihostingConsole console;
>   
> -int qemu_semihosting_log_out(const char *s, int len)
> -{
> -    if (console.chr) {
> -        return qemu_chr_write_all(console.chr, (uint8_t *) s, len);
> -    } else {
> -        return write(STDERR_FILENO, s, len);
> -    }
> -}
> -
>   #define FIFO_SIZE   1024
>   
>   static int console_can_read(void *opaque)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

