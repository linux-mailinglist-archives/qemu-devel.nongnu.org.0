Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E434F81FD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 16:41:27 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncTKA-0003qn-E2
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 10:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncT88-0001CI-M2
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 10:29:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncT86-0001hl-QJ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 10:29:00 -0400
Received: by mail-pg1-x535.google.com with SMTP id c2so5073481pga.10
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fHRpqAF1SJ4VQybsh4Ou6ym+SGrXlRLf31cVIaccJQw=;
 b=QeSZiow5X5hrkXHDXVxSk5Mt7Fo3rFyn+9AWnoNhqhXtXzmcbxXO8LpDBKcs0i6m4A
 5gNZFcFh/Ts2FAYZsllqjo//vYr3ytcFGI57ydh7/SdtADO16lmYgO33jCL4K/gR/TKg
 Aaa/6NhLtgGWAWQuQG2LtAstxKWs4FD2VkTP2oRpaYKHy36PP8hzAymeMeLmCvMBSkxx
 oiCQ4Jty1Ci0Y9p+3YCsgL9lF5cEEZXNYr/dKuH+pZK9cJ88AXH1GQg9fxjoHUdtK6tw
 xe4g41g48qLeSCSpz/pEBF5mVMDHH/nKADWn2XuuqQr87Q+vlA8CFchoWrn982/WZ4iJ
 1Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fHRpqAF1SJ4VQybsh4Ou6ym+SGrXlRLf31cVIaccJQw=;
 b=7fwzwoaJwkTYh4+TUqpTkjB0CBgA3naKtG+Ga1Hlqs7Vb4Erct9XRnff6AcURZR89i
 9aMJ4VNpQI4wiKBVp6QwMdTMGjUsQadZHcb0s+EC6SP+i9MVBtig/CRdBwBcX4nyry9+
 evZVn8eKgJYn2YsvjJRpzGmTk3x3hqgZxj16k2cCRASShOwc5XQWZksf0kfzWX9p/Ar/
 X3UYqbFnMc8g6Ny6kA94bRm8DpUDu/LdakQ3r+YXmNeYSNrEvoyRmIxJ1N96UmT7d0yY
 o1ToSXa+5uq/H3FtSXVpX5VmS9OxTpJnA0zJNEA39xwcwMZt7zFhBBY5lI28QF5vQy9S
 DObA==
X-Gm-Message-State: AOAM530x810C144MVTNBLz/e9rfqZgFX25H1WqqzB9k0NvlcL5fW2dsk
 2HAvO6AMEvHMTbBgO6bH1jZaYw==
X-Google-Smtp-Source: ABdhPJyDJ1VqT9EkgzWg9WWCmKtEJjMAPpj7+99s2tFBpQqMdrvZnwn0gej05pTprnAt54QOFyzbjA==
X-Received: by 2002:a05:6a00:138a:b0:4fd:a7ec:6131 with SMTP id
 t10-20020a056a00138a00b004fda7ec6131mr14479264pfg.10.1649341736573; 
 Thu, 07 Apr 2022 07:28:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056a00168b00b004f7e1555538sm22770435pfc.190.2022.04.07.07.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 07:28:56 -0700 (PDT)
Message-ID: <4c409502-55e3-3c62-eb43-854996c47805@linaro.org>
Date: Thu, 7 Apr 2022 07:28:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
 <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
 <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/22 06:18, Kirill A. Shutemov wrote:
>> The new hook is incorrect, in that it doesn't apply to addresses along
>> the tlb fast path.
> 
> I'm not sure what you mean by that. tlb_hit() mechanics works. We strip
> the tag bits before tlb lookup.
> 
> Could you elaborate?

The fast path does not clear the bits, so you enter the slow path before you get to 
clearing the bits.  You've lost most of the advantage of the tlb already.

> To be honest I don't fully understand how TBI emulation works.

In get_phys_addr_lpae:

         addrsize = 64 - 8 * param.tbi;
...
         target_ulong top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
             fault_type = ARMFault_Translation;
             goto do_fault;
         }

which does not include TBI bits in the validation of the sign-extended address.

> Consider store_helper(). I failed to find where tag bits get stripped
> before getting there for !CONFIG_USER_ONLY. clean_data_tbi() only covers
> user-only case.
> 
> And if we get there with tags, I don't see how we will ever get to fast
> path: tlb_hit() should never return true there if any bit in top byte is
> set as cached tlb_addr has them stripped.
> 
> tlb_fill() will get it handled correctly, but it is wasteful to go through
> pagewalk on every tagged pointer dereference.

We won't do a pagewalk for every tagged pointer dereference.  It'll be pointer 
dereferences with differing tags past the limit of the victim cache (CPU_VTLB_SIZE).  And 
one tag will get to use the fast path, e.g. on the store following a load.

I've just now had a browse through the Intel docs, and I see that you're not performing 
the required modified canonicality check.  While a proper tagged address will have the tag 
removed in CR2 during a page fault, an improper tagged address (with bit 63 != {47,56}) 
should have the original address reported to CR2.

I could imagine a hook that could aid the victim cache in ignoring the tag, so that we 
need go through tlb_fill fewer times.  But I wouldn't want to include that in the base 
version of this feature, and I'd want take more than a moment in the design so that it 
could be used by ARM and RISC-V as well.


r~

