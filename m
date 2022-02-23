Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5F4C1C8A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 20:48:16 +0100 (CET)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMxcV-000772-Ip
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 14:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMxZp-0005tJ-41
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:45:29 -0500
Received: from [2607:f8b0:4864:20::633] (port=43773
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMxZn-0000Ex-Ll
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:45:28 -0500
Received: by mail-pl1-x633.google.com with SMTP id x11so19694962pll.10
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PapYiWhZMiTpqU95r7ClvP5PHgcp3ArSPztRz9A56Fw=;
 b=eZFN/v+SEXKzcolyDpS7BG1Q37HIMIlr5rWkHemaKNG7CPoA3bRDHIMyJBT0wMyvJE
 EP7069lYSXzWj/eR1CqvBHwRITRxl6kMKOBYwLafdDGQAHlH1Uxrw+oVkpp35zeHfPIV
 WOO0sRT6gP2+EkJExwwieD6r+/Ldjr3ahNaZz5OzPdPqWJvQCSgRrRowW6TdbxrjEEcT
 z7Hgm6A0b4PWq8RCePqDDr6yh7oxrW5WoTwWQ/VAWpomrzHXhvHcxhn3j22lvg4YGbNT
 cHmaOuH96Nc6nl7RH7smofHKI6ciz3M/zt6COyBVUEf0O5PNtDSzwJr0GG8PhGhEXL62
 Bj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PapYiWhZMiTpqU95r7ClvP5PHgcp3ArSPztRz9A56Fw=;
 b=y9HgxbLi/T0yhT5zPRJDs37ppngXT4Q1NBtMtm9+/SsM92t2nPb6QQqkibUiGERC6A
 vJOzDHBp/2wwf+NS7whAvsgS2RT95BS3vda5OWjtWA3+YzvfzkLPLZqMTxyepw/IN5Nr
 EhvINwKA3FXfhSlfASLAuev5AC4A7hxOAGO8XtOxHv+NSjIVwywMVrpTMySlHYFqQXJ7
 8N3W0G+1VXVVX6I6riR7c6CA+htyg+z5P2lNGyfPN/Y/jU6jHJL6MYeZaxck87/qqab9
 C2sN6SFeCYAQbgU2wM3t2LINzH3FNQJ+mhqLd0tQJyeqF/1sTqBVQGHn7eEKVrMjkopE
 pNmg==
X-Gm-Message-State: AOAM532tG1P3/K4Qp54ZmczB3vAriNSKUvX1gRDJE3OgqsGhEB87udWQ
 0B4pBL0PfaUz+GyVbfEFqY9ngg==
X-Google-Smtp-Source: ABdhPJzuHG/0dBm5v9WW+kN4RNz83qQyhHLNYKtXXQDKFQCTOCyNSRc6twSsmwUbR1jT3Yw5syyXVA==
X-Received: by 2002:a17:902:7c01:b0:14f:44f2:4fa with SMTP id
 x1-20020a1709027c0100b0014f44f204famr1196790pll.36.1645645526277; 
 Wed, 23 Feb 2022 11:45:26 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id g14sm371976pfj.80.2022.02.23.11.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 11:45:25 -0800 (PST)
Message-ID: <93ff22ad-ca20-e009-d8eb-12ca0ba63668@linaro.org>
Date: Wed, 23 Feb 2022 09:45:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-4-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220217231728.13932-4-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 13:17, David Miller wrote:
> +#define F_PRO    asm ( \
> +    "lg %%r2, %[a]\n"  \
> +    "lg %%r3, %[b]\n"  \
> +    "lg %%r0, %[c]\n"  \
> +    "ltgr %%r0, %%r0"  \
> +    : : [a] "m" (a),   \
> +        [b] "m" (b),   \
> +        [c] "m" (c)    \
> +    : "r0", "r2", "r3", "r4")
> +
> +
> +
> +#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> +{ uint64_t res = 0; F_PRO ; ASM ; return res; }
> +
> +
> +Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2\n" F_EPI))
> +Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2\n" F_EPI))
> +Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2\n" F_EPI))

You can't split these two asm, lest the ltgr and sel not be adjacent, and the flags not 
having the correct value when we arrive at the sel.

No test for popcnt, seeing as there's a bug in m3?


r~

