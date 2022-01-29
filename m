Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3D4A2D60
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 10:30:13 +0100 (CET)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDk3g-000772-Bs
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 04:30:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDk21-0006M8-Vv
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 04:28:30 -0500
Received: from [2607:f8b0:4864:20::531] (port=33613
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDk20-0007mL-CD
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 04:28:29 -0500
Received: by mail-pg1-x531.google.com with SMTP id 133so7474554pgb.0
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 01:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=l3/PaqC0qwEbSZ5n99jsm/KG5Hsu4ODtwM5ZCEMZtow=;
 b=VB7Id5m3neysFKVCPe4TyN4BtdkV90fKL8TrTYQZ01BzuwdLfBQKlJzJZdzZViTK02
 UW7khtPUvSlqUg19l6I6+lijgK+o6eE2dswyBFXf67bb+cMFjYDnGKpG6a1mWQoyPz7/
 drzwdWYDD/QYWkMQdh81D/hmaOXT4P0BirVhJKPj7SNoG0mEfhnFYtUV92UJO7vPbPEP
 YTLpqGfwneaG324oLuNo9JDqNdJFwwWk0bW4GOgwyn0MpyX6fdYzXePDCoy/yOsibWLa
 ChZgy3Cls+rVpV/TdMB44jggwgl4kiy8LEJJUOEsO6SLpitlMdsWnM/8Hs65jx3IsuSh
 QtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=l3/PaqC0qwEbSZ5n99jsm/KG5Hsu4ODtwM5ZCEMZtow=;
 b=wGx63LvreIbi4E4ZHryWYV51uthSHinwgZgvQ7MVCp8pXzNJ6213qgdcCRPRaNo7Vh
 M5+svQhLkSrNht/EhzK1jy07nAoC/EETBkDoRMbIMiVg2gQ+CgrGklQFbRSBvNOVia1t
 +DVuneqdWcWCFrD4xXoqR+pTkWbwYUm+4aTnmgX0rePgmUqjpEIZJJpASx1mzTVuPapt
 nQEA714uMeR6dOSUDUUbF+W/BVDjoPaJ0kAsSjLqG2Bi6E1M49k8FTnjhEJUrK+8fmz3
 LEn5lWlBh2xvN4oeYc/iEHrZFcWM6H2Xlnc6nRRUQoa98KwH9cWhlmSu5kjNgiwh0hbJ
 +aag==
X-Gm-Message-State: AOAM533hDq2ms5gI+Fu4BR03yk4N049tDMCc3RGEjKzYNa/CXKOJqL+n
 vOU/GDcId6cWJCQ/mL36o9CrcKWJ25Ut/o56
X-Google-Smtp-Source: ABdhPJw80F70+twbEtMQujc8VS5LaW1bndr4cpw0Yj2tQKyu4ZSQ6oC4MNoZ2yGjQ5qiUrxAZHvOSQ==
X-Received: by 2002:a62:5fc3:: with SMTP id t186mr12030224pfb.0.1643448506463; 
 Sat, 29 Jan 2022 01:28:26 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id rj1sm5208365pjb.49.2022.01.29.01.28.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 01:28:25 -0800 (PST)
Message-ID: <6c518961-07fc-94d3-1acb-fc4aa99e0d04@linaro.org>
Date: Sat, 29 Jan 2022 20:28:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/20] tcg: vector improvements
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211218194250.247633-1-richard.henderson@linaro.org>
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

Patch 1 is now upstream, but only patches 2-4 have reviews.
It applies cleanly to master...


r~

On 12/19/21 06:42, Richard Henderson wrote:
> Add some opcodes for compound logic operations that were so
> far marked as TODO.  Implement those for PPC and S390X.
> 
> We do not want to implement 512-bit width operations, because
> those trigger a cluster clock slowdown on the current set of
> Intel cpus.  But there are new operations in avx512 that apply
> to 128 and 256-bit vectors, which do not trigger the slowdown,
> and those are very interesting.
> 
> 
> r~
> 
> 
> Richard Henderson (20):
>    tcg/optimize: Fix folding of vector ops
>    tcg: Add opcodes for vector nand, nor, eqv
>    tcg/ppc: Implement vector NAND, NOR, EQV
>    tcg/s390x: Implement vector NAND, NOR, EQV
>    tcg/i386: Detect AVX512
>    tcg/i386: Add tcg_out_evex_opc
>    tcg/i386: Use tcg_can_emit_vec_op in expand_vec_cmp_noinv
>    tcg/i386: Implement avx512 variable shifts
>    tcg/i386: Implement avx512 scalar shift
>    tcg/i386: Implement avx512 immediate sari shift
>    tcg/i386: Implement avx512 immediate rotate
>    tcg/i386: Implement avx512 variable rotate
>    tcg/i386: Support avx512vbmi2 vector shift-double instructions
>    tcg/i386: Expand vector word rotate as avx512vbmi2 shift-double
>    tcg/i386: Remove rotls_vec from tcg_target_op_def
>    tcg/i386: Expand scalar rotate with avx512 insns
>    tcg/i386: Implement avx512 min/max/abs
>    tcg/i386: Implement avx512 multiply
>    tcg/i386: Implement more logical operations for avx512
>    tcg/i386: Implement bitsel for avx512
> 
>   include/qemu/cpuid.h          |  20 +-
>   include/tcg/tcg-opc.h         |   3 +
>   include/tcg/tcg.h             |   3 +
>   tcg/aarch64/tcg-target.h      |   3 +
>   tcg/arm/tcg-target.h          |   3 +
>   tcg/i386/tcg-target-con-set.h |   1 +
>   tcg/i386/tcg-target.h         |  17 +-
>   tcg/i386/tcg-target.opc.h     |   3 +
>   tcg/ppc/tcg-target.h          |   3 +
>   tcg/s390x/tcg-target.h        |   3 +
>   tcg/optimize.c                |  61 ++++--
>   tcg/tcg-op-vec.c              |  27 ++-
>   tcg/tcg.c                     |   6 +
>   tcg/i386/tcg-target.c.inc     | 386 ++++++++++++++++++++++++++++------
>   tcg/ppc/tcg-target.c.inc      |  15 ++
>   tcg/s390x/tcg-target.c.inc    |  17 ++
>   16 files changed, 472 insertions(+), 99 deletions(-)
> 


