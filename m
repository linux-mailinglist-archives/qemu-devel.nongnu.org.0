Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB552A96D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:38:39 +0200 (CEST)
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr19Q-00071t-HO
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr18B-0005s5-LK
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:37:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr18A-0005ZE-5s
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:37:11 -0400
Received: by mail-pl1-x633.google.com with SMTP id q4so17947237plr.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bVf5Awo+6tfGjEYieCQIbGhmpT3CegysTN3ZVtEQM1k=;
 b=htgYQfD00dBjUQhc+mnGp8nxRSpGxyxjt2ISGUHhej7nB72X9hFErrgBuJg7Qbxe6y
 2Fo7+pjN4tZRlUoRvOlDmQs6aIcWGxGibV1A7dh8QGS7llsLrdIUQU9bFxDcVxmJESEz
 MvuLu/TCgPILWzF/bcLtDuw/neJTXXx8/pBrnECMYOQYuZsy9P6pFOxFdrOMxfj9e1vg
 tACaRwMVfCFfV9M2IA9zjYicjoLGjKHTIOoETVWAkaPnT5yT8JZAqfgXxNWJruLbZbM0
 dIieW9csTgKVvLIPlQwUC5dP2Ij9xysA+j5ILJkq9YeNcjCRrHMGsfnxOHEL/utAEDCF
 jjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bVf5Awo+6tfGjEYieCQIbGhmpT3CegysTN3ZVtEQM1k=;
 b=0t4FWW45FHXAnCRwjxg5Vq55qNn+5M7U0xYWr82XPcoAMHT/Rg0BjC3cEUFqT0zv6t
 2FFQb2ojCGi0T8HME6icNjWYO3ZWxssaXgJ1gBj1bbO7giQL0Sxq971EOZHQ/wpM8EhQ
 oy2THUQl+6nBWaiyEjrumNzDAUlgR/R2RDxt4fLWx0JcEntls/vvcqs8NnFfR0XyX0NQ
 6VvdXWybk7jocQrlVilgh+3hH8e2drRbet10uEM3kGkwCMiRWa8cOQF497vPwJfW6JXg
 YwHPWSa9GOSKivO6bi6XsEmR5BNRoOcVnD1nTlJGxP7ze9unogMt00MC0UnoFMgZiHqI
 3jdw==
X-Gm-Message-State: AOAM531sfnRnQGoX3E8FIVpS6fUgoSiLPtV1KHvJn1blnLj1i+itVugA
 u1uB3ODwBJCD5bO2UaszOFHiQQ==
X-Google-Smtp-Source: ABdhPJywaXmh9IuecqGlV0TKsg0lA2qpkM0M+Wi70Cz/tRdvhBIH8vUl9IlO4dLng/GFUqjF5M/S3A==
X-Received: by 2002:a17:902:7483:b0:161:80be:cd37 with SMTP id
 h3-20020a170902748300b0016180becd37mr9761059pll.138.1652809028683; 
 Tue, 17 May 2022 10:37:08 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a63f803000000b003c62fa02f08sm8904986pgh.43.2022.05.17.10.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:37:08 -0700 (PDT)
Message-ID: <8c1ebd2c-aeeb-80af-f26e-47d26a7b25da@linaro.org>
Date: Tue, 17 May 2022 10:37:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 11/12] target/ppc: declare vmsumuhm helper with call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-12-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-12-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Move vmsumuhm and vmsumuhs to decodetree, declare vmsumuhm helper with
> TCG_CALL_NO_RWG, and drop the unused env argument.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 ++--
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/int_helper.c             |  5 ++---
>   target/ppc/translate/vmx-impl.c.inc | 24 ++++++++++++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  1 -
>   5 files changed, 28 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

