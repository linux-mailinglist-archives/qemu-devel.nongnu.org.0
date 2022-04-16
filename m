Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DFD503290
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 05:39:32 +0200 (CEST)
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfZHX-0006QP-F5
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 23:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfZGS-0005kN-SA
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 23:38:24 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfZGR-0000zf-As
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 23:38:24 -0400
Received: by mail-pj1-x1029.google.com with SMTP id md4so8900282pjb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 20:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BYVaLe1XsHTz1GZa6gfuxIIZVlB7yXTcU7+WGDczVJU=;
 b=mBa3XLayYrM8EZL0PrN/LsJoGvH59Pfve9ULYJVRnrr7thMoeidzCOKth6ey0zzgy/
 SzbpIMh/r6E2vC8me0Q4cuOu7cPJ9ts4H4Ta9zvnDo4GIP258l9QDyDGOKmHgF+CGlHN
 KoG4HSZs0A9UJKtVxnPdmQsr+WSOjA52MdrujQxE2VOtd2PF6PmZHio931JMwr4/rT+I
 Kdmm1N6/c00W0XqOLy5l8krSRi6mhYxEcmWPhADP0UuhMRifDduWeeJEwgmfkwyU5OFh
 gZL0f+1O4I2qF8Gl3Hx/n6sP0QmBdNK4mWqzVrl56u6AC1VIiYqJXuyFkzSnHm1Czcjk
 YReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BYVaLe1XsHTz1GZa6gfuxIIZVlB7yXTcU7+WGDczVJU=;
 b=evRjBdw3lzPHzXmS7ggsozXFv5NN/aSddJYMrCMuFw6clnEHTUqChGAjSeJkGhD6hQ
 E8OgtG26yzrjYWTqlP9ternk/6eZyx+2BaoF5vHQZ8UXWCrwWcAM9XY79giOYHxeqkNj
 xIM1MsaOCZAgfgg4+zynfX06Zc9zU4LqCUKluri9X+TwvIEW+aVz0C3K7b635Co3Bdkf
 hby0dVjwbudGbMZHxCA3H4S0rb0GNwRy8qpHj4VTDjoJ6DzSN+847W6zGEogR7wmi9+y
 oDJClOd7fQErmzM/cTMrweav1Cihhnc0jzj4tmC5eXKLO8GIN7G7Kv1llQs4+sKAICzm
 C5cg==
X-Gm-Message-State: AOAM533hgaNza5sgxPkACpcyqu/9y1cxaE50inMBG4ty3jz53xfiX7gt
 RecCLGEJLFe4tHIorabY+D1Yyw==
X-Google-Smtp-Source: ABdhPJw5RL4/8TfAxVt6R4Ckao4nOr4MJZx+UYABdNHkrvrR9lM4CyjbQjsTcNnbytL1J8uvCrl8Ow==
X-Received: by 2002:a17:90a:1688:b0:1cb:9793:6824 with SMTP id
 o8-20020a17090a168800b001cb97936824mr7308044pja.217.1650080301952; 
 Fri, 15 Apr 2022 20:38:21 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a637e10000000b00382b21c6b0bsm5767759pgc.51.2022.04.15.20.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 20:38:21 -0700 (PDT)
Message-ID: <1f913db5-8cb1-4f44-760a-5c7fd7c24eba@linaro.org>
Date: Fri, 15 Apr 2022 20:38:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 27/43] target/loongarch: Add TLB instruction support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-28-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-28-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> This includes:
> - TLBSRCH
> - TLBRD
> - TLBWR
> - TLBFILL
> - TLBCLR
> - TLBFLUSH
> - INVTLB
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                      |  18 +
>   target/loongarch/helper.h                     |  13 +
>   .../insn_trans/trans_privileged.c.inc         | 101 +++++
>   target/loongarch/insns.decode                 |  11 +
>   target/loongarch/tlb_helper.c                 | 358 ++++++++++++++++++
>   5 files changed, 501 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static void loongarch_invalidate_tlb_entry(CPULoongArchState *env,
> +                                           int index)
> +static void loongarch_invalidate_tlb(CPULoongArchState *env, int index)
> +static void loongarch_fill_tlb_entry(CPULoongArchState *env, int index)
> +static uint32_t cpu_loongarch_get_random_loongarch_tlb(uint32_t low,
> +                                                       uint32_t high)

But as a comment, these static function names could be shortened by dropping the "cpu_" 
and "loongarch_" prefixes and infixes.  Particularly that last one, with two loongarch.


r~

