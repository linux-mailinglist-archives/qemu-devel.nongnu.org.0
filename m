Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516530292D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 18:43:44 +0100 (CET)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l45tv-0001WB-C0
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 12:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l45sU-0000eV-Em
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:42:14 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l45sQ-0003ej-P6
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:42:13 -0500
Received: by mail-ed1-x52a.google.com with SMTP id j13so16487478edp.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZG5YujFsOi/UpubNefMmk0S779zAiuOfyNmYj3GEksw=;
 b=muCjzPkmeqt44aCSUdCiJyxxSRqBEKI/hIQi6RhDIe7VXAkJ2eg5hgzUh4vCkoRocU
 DJiuv5C1uPqIA3tjWjHTTA73WcOihrfBLr1Qm+xjUP1q9nR8zI3eYrWsAAIs8KZgoHcz
 FUQhup6pb/Sw6RU7UXvwBH2B1skZ2zLdIqnvsnElPcweVeDk4t4QRSVa80HR5eK1lo3p
 HocaifOuAZlr8ohU3p17wGxx7G0MW/IyaXpdnAlTcUfgXVfae2ewofyLd3i6ABVieh5u
 4GFAskPX5dDh1c38xNqTXcdmkXoK5Upq75BFZtdDZncO9861I7YpaWlPBBlXmEJdHyF2
 Zm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZG5YujFsOi/UpubNefMmk0S779zAiuOfyNmYj3GEksw=;
 b=lS5VtKV13jMKLBTVjE1opzLz5c5mOt8t27TAt3X6k+lM/cyUKgY795Cuq2SngUQnpv
 XRHVUsIIGoJxL14piRfhMEtUnr2NQNL6gr1FHmC720EVcU/vLTtqgPtXBRueddGaECP4
 NLg8y199s1QPfKMwqs2DcMtQzoY5bG80Ijj76ENj4lVc6Wb9qSNKz/o2LIw1aN0daPEX
 GL8FBeqe+yUusHBFRbUHGx7xF6Qz2NbBJ6d4tdvf3UGH4BNg66JzICjd1gOQPC23RNcr
 FRN4EbZVN/8LWnfLHPcQjVtXKAyrTvkcxksWoWROEW+N7ygDSj3xn9cqhvCFjO5oDkZU
 pcuQ==
X-Gm-Message-State: AOAM532aC0hhBX1V2BKLJSHMi6D/zzswrXO7GhAeio7jGT+tM4HYzSMy
 sExO0I+oXvlGdwfKstd3KnA=
X-Google-Smtp-Source: ABdhPJwDs2Q+5dQ2U8SLN9LBy+fpja46Cs2gQqW15wE9tGEGRnnPjkXDT4o2OMIhiw2BNTAN3qYFJg==
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr1454104edc.164.1611596529738; 
 Mon, 25 Jan 2021 09:42:09 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g2sm8613126ejk.108.2021.01.25.09.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:42:08 -0800 (PST)
Subject: Re: [PATCH] hw/mips: loongson3: Drop 'struct MemmapEntry'
To: Bin Meng <bmeng.cn@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210122122404.11970-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e788b7af-de04-f120-01d0-17542e9be212@amsat.org>
Date: Mon, 25 Jan 2021 18:42:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122122404.11970-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 1:24 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is already a MemMapEntry type defined in hwaddr.h. Let's drop
> the loongson3 defined `struct MemmapEntry` and use the existing one.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/mips/loongson3_bootp.h | 7 +------
>  hw/mips/loongson3_virt.c  | 6 +++---
>  2 files changed, 4 insertions(+), 9 deletions(-)

Thanks, applied to mips-next.

