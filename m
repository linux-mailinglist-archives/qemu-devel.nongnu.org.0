Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C45B28BD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 23:49:53 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWPPE-0005zX-2L
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 17:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWPK4-000203-5d
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:44:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWPJu-0002PL-S0
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:44:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b17so15116779wrq.3
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 14:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Wzx53Jnmf5itdWgYaceCdnQQlbtIeFArXKgDqnUQmR0=;
 b=HYzvP7bJEcOvo/BC1TkjDM3lWDuVDWieLXuvM3z+SCxxuTDB76aBDlanA3ZG3jCZVu
 GNEuzn24IlpYhsCz9zNnU3y3irUxZH4nGHnV1aG9O+oNfj8jU0CTqnwLpDBxIYQhHBFu
 xDw7ZMb0is2t0BJDxr0XaUM8AgMd7THJqS6r/+UKRXRTbZVcsREACbdZal4O0xXHfWSp
 1TsqzUutWYwhbG/9ytRhtdimaZMAIMNfrd0aYlQOVNLfuDmwJQ4FUDcK11k/ToKcsH7V
 v+bR2gvc4TAlZyAvkgY0fMvH5Cjftwm7oH/UbJ08uWXe3rlpPgJ4AnrreCQ8+uMhtocr
 yPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Wzx53Jnmf5itdWgYaceCdnQQlbtIeFArXKgDqnUQmR0=;
 b=XowlVHKu3XbK4dsqXb1UZZpuKAH/HCXrIOufRA5Bt+BIdUD7lIaL6Y4HegCYQlq4On
 r5w6BlYUl2n+Fs/cL5jYzsiakPoTi5r798TgI3MKLqz+ZT2BCQv/xTkAYM8aaWTmvSyj
 QH6c5gdQ94N8aQsXf/cHMJXAIPS7bFzQ7B2GqjCU00HvherJzFLwEoKOHasG/P2zBNX0
 q939LAMy8LoDHfoeVVTK2KWtNzCVW7sIX+SezRZCEsslrVc/XvOlxXDJz6CWyJQVQYem
 hdce12gUT0595JldlLNGsea8yryhLmwQU5kq0iu3F/e+Nt3fUPPoSxWzrVp8LaWFFI31
 458g==
X-Gm-Message-State: ACgBeo0xHgTznmDTOGSQ8N83R60u8UaIzKvhjg8QTUSgCZgPi/CToRk+
 cFk8QY1wmfnz2fA8z7wQbCHblg==
X-Google-Smtp-Source: AA6agR5lLuDsseOfPAAdYnrpA4NmHRt+Kn9Vo4I+BCeDFR//nu7XP1syAFb9T8gZU9aspxz5zpwe6A==
X-Received: by 2002:a05:6000:81e:b0:228:a17f:92f0 with SMTP id
 bt30-20020a056000081e00b00228a17f92f0mr6453443wrb.31.1662673461153; 
 Thu, 08 Sep 2022 14:44:21 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a05600c355200b003a62400724bsm134260wmq.0.2022.09.08.14.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 14:44:20 -0700 (PDT)
Message-ID: <70efa596-eeaf-7470-0b02-ccdbec7c2a24@linaro.org>
Date: Thu, 8 Sep 2022 22:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tcg/ppc: Optimize 26-bit jumps
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: npiggin@gmail.com
References: <20220908211829.181447-1-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220908211829.181447-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/22 22:18, Leandro Lupori wrote:
> PowerPC64 processors handle direct branches better than indirect
> ones, resulting in less stalled cycles and branch misses.
> 
> However, PPC's tb_target_set_jmp_target() was only using direct
> branches for 16-bit jumps, while PowerPC64's unconditional branch
> instructions are able to handle displacements of up to 26 bits.
> To take advantage of this, now jumps whose displacements fit in
> between 17 and 26 bits are also converted to direct branches.

This doesn't work because you have to be able to unset the jump as well, and your two step 
sequence doesn't handle that.  (You wind up with the two insn address load reset, but the 
jump continuing to the previous target -- boom.)

For v2.07+, you could use stq to update 4 insns atomically.

For v3.1+, you can eliminate TCG_REG_TB, using prefixed pc-relative addressing instead. 
Which brings you back to only needing to update 8 bytes atomically (select either paddi to 
compute address to feed to following mtctr+bcctr, or direct branch + nop leaving the 
mtctr+bcctr alone and unreachable).

(Actually, there are lots of updates one could make to tcg/ppc for v3.1...)


r~

