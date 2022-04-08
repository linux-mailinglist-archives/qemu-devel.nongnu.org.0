Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D404F98BD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:57:34 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncq3J-00039T-Mj
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncply-0004XX-GL
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:39:38 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncplv-0005uV-VG
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:39:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b15so8552122pfm.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KIHYl+u+LfGWyZGEk99e9JUGTwKgKbglkhwzR/y/wfo=;
 b=odfoIYjX5dN1biJx8L9s1EApHzE0uBqRsn0Y/thphdkOaCe4dEYnGxhCfc/qEVSdG6
 SoPJzc91EI2P141F8/fNS+ugTGXjkEBF7nTAktiG7MJvIxi1G9xnwb2JntGDzDqFlpHD
 CWx7uX/AbhHM3YVNcd/KmAjo21khNNbg8h0jrsI7mi0hbUCiizzXl4NRfLVcjWs1eT8F
 VmbGPt+4k1CDrIAdnZD3Itu5nBUupFvXtaZfaIvpsE8BSRENupItcXJvmWKVqNVQWsLZ
 xNSwySJt2pfjT5DhML1Ikrak4sqeqWFHV4qprYmkebYPVadEeid64I/89o/ogKwOf+BB
 3IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KIHYl+u+LfGWyZGEk99e9JUGTwKgKbglkhwzR/y/wfo=;
 b=YJzToGiIR33Wq8Aowo6WhTOQnNBoFjHaX6CbOCNwbxFmU+wmgftnmPifXod4ic36OU
 Fwox1FoJAHJRxNGlYDXtMHmVciZTKr6pfRiWehcu2BCbuAj9avdP6B7DF0LBTe7Smj6u
 qkzgcd/ORWFVLOfzxZFnvp9xbZFa1MklPrbwdB5fBW8QDGxAyWmCIZg5V25Wz/qwAKdk
 ntw8PjbfYvSNOOQGy1JOzS9moHfOyO1cF14GyPLR8OCt8hJ3MEUbevEO4MD7nO3gK+Tx
 w1LgasrZwV4pGxtDVkTaqRoFCDiE8FmoT0BKEUXmbkECnR6VwZrBqjYtGYfoZo47P+e8
 TaUA==
X-Gm-Message-State: AOAM5333tY1lyxdDQz5RN8kgx5+yn3wZhL1miWGwlU07DIjAZCdUuyKy
 mGvK5Pq8Q9qH1alsR0gjcVqh9Q==
X-Google-Smtp-Source: ABdhPJzk+rzGVOI4jt3bzNUDu4ebVToJrCzKtP4prVDe6ANpjr/OLrJN0uGtL31tDBjflRjzKcIrhg==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr20016211pfu.6.1649428773831; 
 Fri, 08 Apr 2022 07:39:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z2-20020aa79902000000b004fb05c04b53sm28112830pff.103.2022.04.08.07.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 07:39:33 -0700 (PDT)
Message-ID: <9b91bf33-56db-6718-4f7c-158d8873a71f@linaro.org>
Date: Fri, 8 Apr 2022 07:39:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
 <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
 <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
 <4c409502-55e3-3c62-eb43-854996c47805@linaro.org>
 <20220407152734.miad3m2aqtbsfin3@black.fi.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220407152734.miad3m2aqtbsfin3@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 4/7/22 08:27, Kirill A. Shutemov wrote:
>> The fast path does not clear the bits, so you enter the slow path before you
>> get to clearing the bits.  You've lost most of the advantage of the tlb
>> already.
> 
> Sorry for my ignorance, but what do you mean by fast path here?
> 
> My understanding is that it is the case when tlb_hit() is true and you
> don't need to get into tlb_fill(). Are we talking about the same scheme?

We are not.  Paulo already mentioned the JIT.  One example is tcg_out_tlb_load in 
tcg/i386/tcg-target.c.inc.  Obviously, there's an implementation of that for each host 
architecture in the other tcg/arch/ subdirectories.

>> I've just now had a browse through the Intel docs, and I see that you're not
>> performing the required modified canonicality check.
> 
> Modified is effectively done by clearing (and sign-extending) the address
> before the check.
> 
>> While a proper tagged address will have the tag removed in CR2 during a
>> page fault, an improper tagged address (with bit 63 != {47,56}) should
>> have the original address reported to CR2.
> 
> Hm. I don't see it in spec. It rather points to other direction:
> 
> 	Page faults report the faulting linear address in CR2. Because LAM
> 	masking (by sign-extension) applies before paging, the faulting
> 	linear address recorded in CR2 does not contain the masked
> 	metadata.
> 

# Regardless of the paging mode, the processor performs a modified
# canonicality check that enforces that bit 47 of the pointer matches
# bit 63. As illustrated in Figure 14-1, bits 62:48 are not checked
# and are thus available for software metadata. After this modified
# canonicality check is performed, bits 62:48 are masked by
# sign-extending the value of bit 47

Note especially that the sign-extension happens after canonicality check.

> But what other options do you see. Clering the bits before TLB look up
> matches the architectural spec and makes INVLPG match described behaviour
> without special handling.

We have special handling for INVLPG: tlb_flush_page_bits_by_mmuidx.  That's how we handle 
TBI for ARM.  You'd supply 48 or 57 here.


r~


