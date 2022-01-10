Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945C489BB3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:59:56 +0100 (CET)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w9L-0004wj-3G
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6w0w-0002y7-E4; Mon, 10 Jan 2022 09:51:14 -0500
Received: from [2607:f8b0:4864:20::929] (port=44997
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6w0u-0002Iy-F2; Mon, 10 Jan 2022 09:51:14 -0500
Received: by mail-ua1-x929.google.com with SMTP id l15so12399227uai.11;
 Mon, 10 Jan 2022 06:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EN3rw218GGZbR1u7tbP11xVUxrENziiogdUvEjWnTEg=;
 b=niSofha3UcDvJU9xTH91/buBBT9jnPitA/LaZcxxhAD4vGDfSn70jBn/G+MOCPUA1/
 y/o/ywKmAL2/vmOS9kPgmFhllG+qd0bZyhP3hJR9GXH2Fsvc5AUhqjnmSTt2vb1htgRR
 SCJU+Q8s8BVFpglbg9ZzwlZR9sE9aao5lhqgu75rl9iG3oUGbfZzU4q88o3UtAwjSn98
 4Kp7V8rZOtLnjfZHAQkFfPaYckCzjPcw06ZmrGvfNOdnWkRDYJByMdrgHGDABUKOPdAD
 w76DOSoRcSCFH0Y/IztNnJDdssqtc8vWr+G/uGyoX89LQVNjvaljmVaVtk3vAwTD61pI
 +jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EN3rw218GGZbR1u7tbP11xVUxrENziiogdUvEjWnTEg=;
 b=Cv6DJZcQvMd7dDl4PuWbFPteJrPVxVZGeUXE0yUFLGSYckovjcQfBlf+AUh8kntaKn
 aE+5XKlB3Np+ldNn5YwFEJb8eX0Z60GeJ0sJsA+cN4XhRB3lgh8Qi5//g4rEwf6Nd7L4
 0K+UUYIJbQmfCn3dO75vG5PZ80rc1Nl122RKsMjahBAOKtqMj1FYRm8UVQL77Bx7qj7N
 jq/vmWL9WUqVW2ho1ly9c/iOPds3QbQIg3gayyOD/QxXm4jouFSuWcmqGpwJiOS55S9r
 ohm1/lmEoMN8v6MvAWWzHX3qaoeluh/PU4b+qXHemgydnJA0wur1FEGJsX0dT6LVI/qc
 /78g==
X-Gm-Message-State: AOAM530lJLdBF9jXxMPTWyyBZC8dhUcMJODOJ3eDhTlgIcPH572VitIQ
 jMAMAG9vwSEcRwGWtpKLUDA=
X-Google-Smtp-Source: ABdhPJxuFTwXFaQYz1rCRQE5x0mPQFap2UgEHC1X5dk0vS0wRMPrbad7FzBsIaFVeF2NLDEVqtW0fg==
X-Received: by 2002:a67:b143:: with SMTP id z3mr25833158vsl.66.1641826270316; 
 Mon, 10 Jan 2022 06:51:10 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x19sm4240745vsh.6.2022.01.10.06.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 06:51:10 -0800 (PST)
Message-ID: <10d814d5-9679-fcd0-c29c-193a59df24d9@gmail.com>
Date: Mon, 10 Jan 2022 11:51:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/37] target/ppc: PowerISA Vector/VSX instruction batch
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, richard.henderson@linaro.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/7/22 15:56, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> This patch series implements 5 missing instructions from PowerISA v3.0
> and 40 new instructions from PowerISA v3.1, moving 62 other instructions
> to decodetree along the way.
> 
> Lucas Coutinho (2):
>    target/ppc: Move vexts[bhw]2[wd] to decodetree
>    target/ppc: Implement vextsd2q
> 
> Lucas Mateus Castro (alqotel) (3):
>    target/ppc: moved vector even and odd multiplication to decodetree
>    target/ppc: Moved vector multiply high and low to decodetree
>    target/ppc: vmulh* instructions use gvec
> 
> Luis Pires (1):
>    target/ppc: Introduce TRANS*FLAGS macros
> 
> Matheus Ferst (20):
>    target/ppc: Move Vector Compare Equal/Not Equal/Greater Than to
>      decodetree
>    target/ppc: Move Vector Compare Not Equal or Zero to decodetree
>    target/ppc: Implement Vector Compare Equal Quadword
>    target/ppc: Implement Vector Compare Greater Than Quadword
>    target/ppc: Implement Vector Compare Quadword
>    target/ppc: implement vstri[bh][lr]
>    target/ppc: implement vclrlb
>    target/ppc: implement vclrrb
>    target/ppc: implement vcntmb[bhwd]
>    target/ppc: implement vgnb
>    target/ppc: Move vsel and vperm/vpermr to decodetree
>    target/ppc: Move xxsel to decodetree
>    target/ppc: move xxperm/xxpermr to decodetree
>    target/ppc: Move xxpermdi to decodetree
>    target/ppc: Implement xxpermx instruction
>    tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
>    target/ppc: Implement xxeval
>    target/ppc: Implement xxgenpcv[bhwd]m instruction
>    target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree
>    target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[o]
> 
> Victor Colombo (6):
>    target/ppc: Implement xvtlsbb instruction
>    target/ppc: Refactor VSX_SCALAR_CMP_DP
>    target/ppc: Implement xscmp{eq,ge,gt}qp
>    target/ppc: Move xscmp{eq,ge,gt,ne}dp to decodetree
>    target/ppc: Refactor VSX_MAX_MINC helper
>    target/ppc: Implement xs{max,min}cqp
> 
> Víctor Colombo (5):
>    target/ppc: Implement vmsumcud instruction
>    target/ppc: Implement vmsumudm instruction
>    target/ppc: Implement do_helper_XX3 and move xxperm* to use it
>    target/ppc: Move xs{max,min}[cj]dp to use do_helper_XX3
>    target/ppc: Implement xvcvbf16spn and xvcvspbf16 instructions

I believe Victor would want to standardize whether he would like his name
using acute or not (Víctor vs Victor). Both are fine, but sticking with
a single one will make git happier because, as we can see here, git thinks
that Víctor and Victor are 2 different people.

For reference, Victor has 2 patches upstream without using acute.



Thanks,


Daniel



> 
>   include/tcg/tcg-op-gvec.h           |  22 +
>   target/ppc/fpu_helper.c             | 172 ++++--
>   target/ppc/helper.h                 | 144 ++---
>   target/ppc/insn32.decode            | 189 +++++-
>   target/ppc/insn64.decode            |  40 +-
>   target/ppc/int_helper.c             | 354 ++++++-----
>   target/ppc/translate.c              |  19 +
>   target/ppc/translate/vmx-impl.c.inc | 894 +++++++++++++++++++++++++---
>   target/ppc/translate/vmx-ops.c.inc  |  41 +-
>   target/ppc/translate/vsx-impl.c.inc | 516 ++++++++++++----
>   target/ppc/translate/vsx-ops.c.inc  |  67 ---
>   tcg/ppc/tcg-target.c.inc            |   6 +
>   tcg/tcg-op-gvec.c                   | 146 +++++
>   13 files changed, 2037 insertions(+), 573 deletions(-)
> 

