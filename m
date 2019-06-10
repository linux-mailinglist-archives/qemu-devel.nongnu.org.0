Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE753BD54
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 22:10:09 +0200 (CEST)
Received: from localhost ([::1]:49444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haQcK-0001d2-BA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 16:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1haQbg-0001DI-Jz
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 16:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1haQbf-0007wC-OS
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 16:09:28 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35745)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1haQbf-0007vc-DC
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 16:09:27 -0400
Received: by mail-pl1-x641.google.com with SMTP id p1so4087234plo.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 13:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bPn1S4iNvMfWX8YAvlbnC/CV1rIJFFMUVUp7USfN5Y8=;
 b=SwvWMMOvsNqV3C1UZDOnFRfgzPk7NoCvLCto0LLfCe345lYvYj468hU9wMTuKrVSrH
 oXjshUXjktDSr3/qKu/aOVLn5E5d7d3pSZEMDQ/5JBk2/rAfV/DDybwAfkxd5n/z53nY
 m0MEyjZv7QdBRS/30QfIZ2Sf2O9tttko/vyN53pAxqbgXqiC6w1BHIa9YhrDZ3Zq6Puc
 jX+oqaPnAPehMjTUBzN2o/FI5T+x/ZOEdFHJ6boAzbm22Z229/q4FcWA9uKyNsbmxglr
 Zk5jlOLLJU0ztUK2fmTNXMkHZWXtmr3Hw7kc+pJbfFG87r5s8OmRHVx/hFJn0nMAA6hT
 8RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bPn1S4iNvMfWX8YAvlbnC/CV1rIJFFMUVUp7USfN5Y8=;
 b=cLn/APxbgJE1LB/+p2pdDTcNz9wsV+IaRW0NPKaCj6Sc8FB1Rn33TlCnFkByhpXJIu
 hw9uX+HVnH7imoTwkmsCNocz+6Qb0iDVIdBXOzhb3Nc9yoVvZ/tXQLVOHCWB+JKSLSZ0
 81WLej7yGeXk9OrZgpUFhM7WK74Av32XRYKm/zS4RwNycRWgUJEzgg9v/GWfhS5va7dZ
 QOb/gH8ql0H8Wx52c3e9ZjKJvjyzK+1yRZon0VNh8pqgECf+P47waKnVtVWrDFUfBBdk
 CbEJKxkzVK1n8KF9DHPzAq7VnrZQBvzaCf+u6+qKyY9uva0weKHcmDNSpIUJncSo+T+f
 O8Fw==
X-Gm-Message-State: APjAAAUnSlEEcXUNU250EHyFnZg/1maBoZTKcekI/uveM1wgJPJ8ldkv
 LLewIMebV0JOy9M4xtTkUhlRbw==
X-Google-Smtp-Source: APXvYqzzHo57nuAimr2e2UFlYSmIDyivsYxcsIpBT4w2S2pL3NdIvSH8GtH0dmjNQUXlNWUPOFMTkg==
X-Received: by 2002:a17:902:20ec:: with SMTP id
 v41mr68262734plg.142.1560197366139; 
 Mon, 10 Jun 2019 13:09:26 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id
 o20sm9831971pgj.70.2019.06.10.13.09.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 13:09:25 -0700 (PDT)
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20190606193012.37715-1-mrolnik@gmail.com>
 <20190606193012.37715-5-mrolnik@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c868749e-61ea-8f8a-51c1-e6b9b9d445c6@linaro.org>
Date: Mon, 10 Jun 2019 13:09:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606193012.37715-5-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH v21 4/7] target/avr: Add instruction
 translation
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:30 PM, Michael Rolnik wrote:
> +    target_long cpc;
> +    target_long npc;

CPC gets copied back and forth to NPC, but is now otherwise unused.
You can drop that.

> +static void translate(DisasContext *ctx)
> +{
> +    uint32_t opcode;
> +    int res;
> +    /* PC points to words.  */
> +    opcode = cpu_ldl_code(ctx->env, ctx->cpc * 2) & 0x0000ffff;
> +
> +    ctx->npc = ctx->cpc + 1;

Which allows this to become

    uint32_t opcode = next_word(ctx);


r~

