Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286924EEDF2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:17:31 +0200 (CEST)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naH9e-0006zc-4D
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naH6R-0004aW-Bp
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:14:13 -0400
Received: from [2001:4860:4864:20::33] (port=42679
 helo=mail-oa1-x33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naH6P-0005Wp-4o
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:14:10 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso2610477fac.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eMMMwwFnh73ag+BU3AfwOZ1cp/llvV0x52GkFu1BZP8=;
 b=BByUsv5sfLdjZczxMHAySwW2prjxM2GVT3aAFrbaVaPG7UYygktCwokMeuHvpwNsBq
 aY/g+Hk66cDS7LQr0ETNeREG572L/qLSwCu5PboD8mvoyqwddtTulGEKDoYlD4DGwhWr
 OrNdKpMEc2IANp2y/RKfaylbxv92DSmC86F54qnNI+u11JWRg2evMDXKCQx7JfKMkxpJ
 sSU0V1Z3Z7/+omthjIPbVgVpIAASeJtxGOA0cku/MKWX5R9UqwLgAJ9Dd/j+Zf0m4mTJ
 ifhE9Y2i/5qGOODy3M67Z93MI7ScR1Ka5rAYF604JECbqHtjaao7EbsLzkALaDrdqPdT
 7tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eMMMwwFnh73ag+BU3AfwOZ1cp/llvV0x52GkFu1BZP8=;
 b=XxWlkIQcxtDt5OR6Rlzoj1/xm87zRW5SpBsZOvKNeOjdA09bU6Al1kaFSy/DYeCEah
 0hx/tc9qzKxMJsM5h76Lk5uUEixnbzHPLqa08KEZG+vGNzFhR1tmsPMUJAPkZO7POjIS
 gNzlVJrcHBQbgRUXlb/G6jzURjfdsZu5ZDbKfvFgORaMcoQyTdS92y1PldKGC88zF8JZ
 1XFP0kgzi2NQxoNAklZp7W5/FQUaDkU4e6FmNb0izTTuAc73ZitT/q9wwWTn0l2WYlL8
 Dk/6fxwCnvCWTreOAmlCx5fOiv4JHnY5eNG6jjJO34xHz3kFoIZjR08UvGA3UyclOvWV
 M0fg==
X-Gm-Message-State: AOAM532lv3vvnijvnV0EfYXqWmhuXaETUOlhxPbR+JSpRwzeH2cwR4OQ
 2GDTsIQbCvULmL2vCQG41Yitjg==
X-Google-Smtp-Source: ABdhPJyH58hp7wRoQIwhsBiaRAN4r9Q1S8vOlDfW9Q2diDIuDzRTNyJ4mTP+/0F/m/0NPIcsSwh44w==
X-Received: by 2002:a05:6870:9a04:b0:db:d28:7982 with SMTP id
 fo4-20020a0568709a0400b000db0d287982mr4827365oab.106.1648818847889; 
 Fri, 01 Apr 2022 06:14:07 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 e22-20020a9d5616000000b005ceb68be2f6sm924973oti.63.2022.04.01.06.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:14:06 -0700 (PDT)
Message-ID: <81e8c2e7-931d-c469-4b22-4f68957e2377@linaro.org>
Date: Fri, 1 Apr 2022 07:14:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/riscv: Fix incorrect PTE merge in walk_pte
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::33
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Konrad Schwarz <konrad.schwarz@siemens.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 06:22, Ralf Ramsauer wrote:
> Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
> case, walk_pte will erroneously merge them.
> 
> Enforce the split up, by tracking the virtual base address.
> 
> Let's say we have the mapping:
> 0x81200000 -> 0x89623000 (4K)
> 0x8120f000 -> 0x89624000 (4K)
> 
> Before, walk_pte would have shown:
> 
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
> 
> as it only checks for subsequent paddrs. With this patch, it becomes:
> 
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
> 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
> 
> Signed-off-by: Ralf Ramsauer<ralf.ramsauer@oth-regensburg.de>
> ---
>   target/riscv/monitor.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

