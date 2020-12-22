Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432A2E0BF1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:44:25 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kritk-000154-A7
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krisN-0000f3-KB
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 09:42:59 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krisL-0004U0-Vq
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 09:42:59 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i24so13135909edj.8
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 06:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4D6ClPpWuZ3at/37vYebPZf16teiA65qRQwmVtXmycs=;
 b=Xft7wdKg1/g420i3fy19+uDPKmqpwp60dxPRNHmriCDk5EZz9EHdBeYBXWUzZ/OTTi
 Yjfs7u4CJGDJWQmpKruscRxpO0OyfGqQ9hIMuuQ5a6PuTCmOmc5HcKOybdPv6AlIkR9R
 hXM6vrDgD89y0Yk08LSPFiU7vyfoVyJU570OZB6NROU6GUrYJAvEabHNeETWdv1hBjM1
 fUoNi1P5s1BWDDMXyfR8Lg6WF8dXOnPLsrig33/JZAhE5aYY6gRCt6XyFV2wOCSixTcg
 2dtfdKNqpWy3XaYG6Yv9eivmBT0Xs7l6ZIf3t9FpW8LslzF7v+Lm705tEuHdDQUZAj8N
 6GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4D6ClPpWuZ3at/37vYebPZf16teiA65qRQwmVtXmycs=;
 b=hO9ewvEmt7mcfor0beCKCPl14Vu/6lZixGKY5UqkYSBWInlcdfw7bVrdgNO7gz7q5z
 1GrcqKX9Plu70lP5VHZMp1H0eNCAB0/PF+/l5BFJ8eNXXoARaTMh9LFXCPwf7tvf56+S
 H4kfAvqai2sehw205F13Dvlu9xtHkMnNWDFhdyrp3SOiTQrzPFZw4bPhw4vB20pv3+H1
 Vyv2wKTTucqVtRrPLyeUV9DLA9QokIxrKxUCQE8Unl1RnluWEyaS/zDOVigRv3b5uase
 FPOrJeUDutZKtIu/00R+tFdxGx5f5B+7EYZtodtHja6qBpK1PXYiOiLKu97kmq2QrnRX
 s0SA==
X-Gm-Message-State: AOAM532QDWdNXyrQDaaOezQqJ9z75LT7jfEpiQmqCaJEX2DoOfr1B63O
 zsvrQUV5zIDUhjZvh0j1K30=
X-Google-Smtp-Source: ABdhPJw+yCtnacEanQ8D3aJ06JU9Oyon8N4AWaAkE4aj9P4/De2WZQtE5UeyvQ45brLsJCaMIHQ8tw==
X-Received: by 2002:aa7:c2d8:: with SMTP id m24mr20428142edp.300.1608648176514; 
 Tue, 22 Dec 2020 06:42:56 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id k21sm10360046ejv.80.2020.12.22.06.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 06:42:55 -0800 (PST)
Subject: Re: [PATCH v2 5/8] hw/mips/fuloong2e: Remove unused env entry
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072139.39347-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c3a21b9d-cd7a-63c3-6c40-e80509da5aa4@amsat.org>
Date: Tue, 22 Dec 2020 15:42:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219072139.39347-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:21 AM, Jiaxun Yang wrote:
> modetty and busclock is not handled by kernel and the parameter
> here seems unreasonable.

'busclock' is used by old kernels:
https://elixir.bootlin.com/linux/v3.1/source/arch/mips/loongson/common/env.c#L51

'modetty' is likely here because this code was started using
the YAMON load_kernel() code from malta.c as template.

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index d846ef7b00..c4843dd15e 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -159,10 +159,8 @@ static uint64_t load_kernel(CPUMIPSState *env)
>      }
>  
>      /* Setup minimum environment variables */
> -    prom_set(prom_buf, index++, "busclock=33000000");
>      prom_set(prom_buf, index++, "cpuclock=100000000");
>      prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
> -    prom_set(prom_buf, index++, "modetty0=38400n8r");
>      prom_set(prom_buf, index++, NULL);
>  
>      rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
> 

