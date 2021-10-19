Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F3433DFF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 20:03:21 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mctSK-00062R-TT
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 14:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mctPf-0003uG-Gj
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:00:40 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mctPa-0005UV-Ra
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:00:34 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q5so20089609pgr.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Joj/MMQCJaT/OBBlinwxbo5ywrUF7wxfIn46ek4vt2Q=;
 b=BKqb5gINffgDiX6Rddo0aNbkZlKRxcf5FK4IOsym7t1BtMHvdeb9jsD2p319FX4hHs
 2satEDpOSzQ8CvGBHOMUhiBYExKUL6se6EmDhAmHqO+As689E8dqFNj6gsjDVdrhvoF9
 fmg4fiPubTivUoN104ohS6MMw+Sn5KJpyWHNe2emF5kLHI7gUxn8GtqqC8C8j45aCFTK
 D+BJlQtIyOpjY1i+8gvaLUAxfxPPhy8r+++oQ3q8j4YmQBV5Bt9yyf+yS6JQcjGgwp0I
 pldP6hz75D+7EE/JOYGAEGBbWuGeF4Phe5YPCSEiO8D4dFOEi0iSNSMFpe6fF0PRbn4L
 CI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Joj/MMQCJaT/OBBlinwxbo5ywrUF7wxfIn46ek4vt2Q=;
 b=gYJjnXkVyLI8smK+liqY7BWcaUCghOiorxc153fc3dUT38q8+DbwVJ3k0lztzltBGC
 n+92Fl3vxDrbOUPKt5TXIccF3Mi/87TplcVUhntZheV/+V3QQrQfOKw4qmcYO71Wvqak
 EDaS6vgC3w64+hZsRqW+ectb/S8e9LnFceeL3x/0z5Az8c1bZgjCq8vEIN73RohOGsjN
 BX3eSemGDt4YVW/xqEhwWeZbap0MIXWzqVZ4HSmq2VPhgzvzHp26RnwkyASNzS0Q3U5a
 CH6AtpJjdh29+juRUR0w1zYCNmfKESTBRA3Pt4wBHxFE23zLEyg41CbjK7yqrEaLL5FG
 26tg==
X-Gm-Message-State: AOAM532K8PLrfqwYRdpu4fXnWPI0OIRfgva0lF2R0/JwjUhtqH2iE6D7
 1u+y41R1SpHEN0v1uT8J22ZN1Q==
X-Google-Smtp-Source: ABdhPJwsp6+fRdmg35p9d4Vz4wff+ldkQwCdxL92j128pk3L2rx5r0EfiUuBn3vM/716Sb5A0gwh5A==
X-Received: by 2002:a63:7402:: with SMTP id p2mr29860041pgc.472.1634666428389; 
 Tue, 19 Oct 2021 11:00:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm5749860pfu.101.2021.10.19.11.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 11:00:28 -0700 (PDT)
Subject: Re: [PATCH v3 02/21] memory: add a few defines for octo (128-bit)
 values
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b735c47-c845-d831-12f3-a8a3a17c0eaa@linaro.org>
Date: Tue, 19 Oct 2021 11:00:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> Introducing unsigned quad, signed quad, and octo accesses types
> to handle load and store by 128-bit processors.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   include/exec/memop.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index c554bb0ee8..476ea6cdae 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -85,10 +85,13 @@ typedef enum MemOp {
>       MO_UB    = MO_8,
>       MO_UW    = MO_16,
>       MO_UL    = MO_32,
> +    MO_UQ    = MO_64,
>       MO_SB    = MO_SIGN | MO_8,
>       MO_SW    = MO_SIGN | MO_16,
>       MO_SL    = MO_SIGN | MO_32,
> -    MO_UQ     = MO_64,
> +    MO_SQ    = MO_SIGN | MO_64,
> +    MO_Q     = MO_64,
> +    MO_O     = MO_128,

There's no point in removing MO_Q in one patch and adding it back in the next.  And I 
guess we might as well name MO_O to MO_UO now.

> @@ -105,9 +108,12 @@ typedef enum MemOp {
>   #ifdef NEED_CPU_H
>       MO_TEUW  = MO_TE | MO_UW,
>       MO_TEUL  = MO_TE | MO_UL,
> +    MO_TEUQ  = MO_TE | MO_UQ,
>       MO_TESW  = MO_TE | MO_SW,
>       MO_TESL  = MO_TE | MO_SL,
>       MO_TEQ   = MO_TE | MO_UQ,
> +    MO_TESQ  = MO_TE | MO_SQ,

These should have been renamed at the same time as MO_Q.  Though it seems you are missing 
a rename of these throughout target/?  Surely this patch does not build as-is.


r~

