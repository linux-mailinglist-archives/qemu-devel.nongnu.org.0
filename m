Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630BB58A0B0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:45:00 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfq7-0002mI-DF
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJfVU-0006jB-RK
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:23:40 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJfVT-0002KV-92
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:23:40 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 13so592366pgc.8
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F0AvyKb3Tlstt3LOVFCotAcEWiDEYetc7BR6MAwZ5E4=;
 b=R2QTm4D3KBJVhAx+nbExAHUokrSeteMnorCH6t0izods/+EN9n91BqvVs5CMpegBgg
 8mTxOgIwYcSkh2BpM1WV9DEp9WMXPtEqj/+yfTFb9ixDw7BKZD3Nlru0/22KBuS40Eln
 V2yi7g1uFT9zCAbfrJokvE0mKCcPgAJTMAjVUxpPI9xJDwajb7+hHD/HnBeyBy2reeRB
 EYy11bRy3oQndilO1+vor86J+ehkCpH3DIKuTrM7JepU5FAiyEzUqRmRzeTtEoYWuJ3P
 eYyqQ/oTDYeDHE9s3bv70drG4u/hCK7qd58KrRPPS5Boe17ShBykl4UoB9I7Kt+YVeXl
 Pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F0AvyKb3Tlstt3LOVFCotAcEWiDEYetc7BR6MAwZ5E4=;
 b=tkN8ZHUZhiVMaEV9xHJyZrzXh9tPLugq38E6r7agamrcRWEp5lv7rEsic6I4VOUjGo
 DLhV7EKSKlQPASKuQD2Cz5Ic45eTb9qTvarCiobcz0aGBf7G8Sl3KgbYo6j6NL1uOTuN
 4w1aMa6SLhxUoe7rGHgx0iZMi7xJwOz6NytU0YrZ61YrYodp8bmoiSVARVCS3lUBtaM8
 DB7o/ItsjG7iDOnFP5fF+M1Klj1+YaCctdo2kjJI81crXDEYiuKjOCvgnwSsngyJRxtV
 zaOtKhmAkGc2p0iFBZStlYyg29oH5nCc7AGNmEVFbiTAbiAdblmuzMthUAZ0iYRPCBMm
 DHOg==
X-Gm-Message-State: ACgBeo01T8ZuFuGHJTAmn24cXmke2t6OLXHyBB6208YUS34OmGgJSI85
 0xNnHXDusREsGGa/32ePg/QNwA==
X-Google-Smtp-Source: AA6agR5cqOWQ/WgIkTZZFYJG+sIsUQmODAh7qRgkom8fH9h9woyq/X3PLQKjd8OauLgcMjqhmnNEYQ==
X-Received: by 2002:a63:6a89:0:b0:419:d863:321a with SMTP id
 f131-20020a636a89000000b00419d863321amr2616283pgc.9.1659637415703; 
 Thu, 04 Aug 2022 11:23:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 lk2-20020a17090b33c200b001ec92575e83sm1604501pjb.4.2022.08.04.11.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 11:23:34 -0700 (PDT)
Message-ID: <18b3de0c-593e-57c5-4277-c15ba9c2cc2f@linaro.org>
Date: Thu, 4 Aug 2022 11:23:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] disas: Add LoongArch support
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org
References: <20220804172939.325306-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804172939.325306-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/4/22 10:29, Qi Hu wrote:
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   disas.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/disas.c b/disas.c
> index e31438f349..d44feeee46 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -176,6 +176,8 @@ static void initialize_debug_host(CPUDebug *s)
>   #else
>   #error unsupported RISC-V ABI
>   #endif
> +#elif defined(__loongarch__)
> +    s->info.print_insn = print_insn_loongarch;

This is very much insufficient.  Try --target-list=i386-softmmu and watch it fail to link.
You need to modify the build rules to make certain that the loongarch disassembler is 
built for loongarch host.


r~


