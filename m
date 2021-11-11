Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0244D617
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:51:13 +0100 (CET)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8bo-0006P5-8H
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8ai-0005Vn-UE
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:50:04 -0500
Received: from [2a00:1450:4864:20::431] (port=35538
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8ag-0008Pm-Um
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:50:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id i5so9385241wrb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=deNzq7wXYcMv9629IR4CK51YQcoU79po0UXUEkKWHJk=;
 b=u91cJ3Fem0gG7ApzHmOFgT73Ab5IjyQXvp+QlKr5cS8NC1t55gkcOL1+n6VT0IshMW
 H276EXB9vjQO0gGss4I2g1+kfEouiWRgwXPBZwpnlGiReI3YAJQgREWsjbnJYXRMfyvo
 OjVXjp2Wi8Nv5V9vqA6ncB66lXmSbbebDGEScIE87Elyl7mNGxK3oyIa1Uy8ipnXI/mm
 xWQMdQry6yqPY1Tth/1IAEYfuhKK52ZsDyCroHGhgPTYh7yzAHc3xmG0IO5Ks+d0V15W
 IxLLVtx1dvWRJnEC5ABMeErUsyhTG8F08AjZFJxwVWHolJLFkqLRm3LuUzJSR2BrUwfy
 8uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=deNzq7wXYcMv9629IR4CK51YQcoU79po0UXUEkKWHJk=;
 b=slzIjdBcTh8WKHttecWItMfSywwwloJc4ES/vbYib1pNRBdDTStItD5p/EzhYyXSuF
 gNdkuls2PqxmBqa3A6EP80ECCOqLR8B/o78MUpnQtmVtc60tnGX/mRc+ysxifHi98FuA
 CPaUhbASG7Ea3SCIs4Xcpce7ElqZy+5p5vE6dNcd60tKrISAAjEztCbIp3BSoM5LjDrL
 HiRSSeE2g0WERw6JxCSczKhjSS9EqSSRARJKJZjHc9dJSKJzbGVPdwlqJ/tZCY0Qfu/e
 6nyVLHZ34MiiJASHISFpDWyfvyjFX6ppEWNVuN45D9Nd1+uWf/aCgElWcbN25GhfQ5li
 jXzw==
X-Gm-Message-State: AOAM530erYlXDWSg5ZiSstEAFsaDnZ+BZajU+0qfjRiA7R0+aXhaCqEi
 l4rhNCkVuzuOr/DMPb+QiFv94w==
X-Google-Smtp-Source: ABdhPJzly9fRL3lgJf2r92W8/BXFsyVQxLo7v8n5KuvwKC2dSSbv8phSHk0RjSmusbnxddYV1lFwxw==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr8548569wrs.237.1636631401463; 
 Thu, 11 Nov 2021 03:50:01 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id o12sm3687610wrc.85.2021.11.11.03.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:50:01 -0800 (PST)
Subject: Re: [PATCH v3 20/20] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-21-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <663dcab0-3370-7716-2abb-187893de6103@linaro.org>
Date: Thu, 11 Nov 2021 12:49:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-21-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 6:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/csr.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8f8f170768..43eaa6c710 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -553,15 +553,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>            * RV32: MPV and GVA are not in mstatus. The current plan is to
>            * add them to mstatush. For now, we just don't support it.
>            */
> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
>       }
>   
>       mstatus = (mstatus & ~mask) | (val & mask);
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        /* SXL and UXL fields are for now read only */
> +        /* SXL fields are for now read only */
>           mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> -        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>       }
>       env->mstatus = mstatus;

Still missing the update for write_sstatus, which I think is simply an update to 
sstatus_v1_10_mask.


r~


