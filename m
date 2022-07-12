Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D45571778
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:40:30 +0200 (CEST)
Received: from localhost ([::1]:39822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDJd-0000KE-V0
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCx7-0000Dr-F4
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:17:16 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCx6-00010U-0Y
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:17:13 -0400
Received: by mail-pj1-x102e.google.com with SMTP id s21so7188758pjq.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2GOhGSIAgAI7R5VlJcbom+0iPWY/mzNGleRCz0vQu7k=;
 b=W3/wgyr+aWV/d0j50C+HGUjQGeqcSAqz0jwcqU22t2eRiQxlABdz15yJ2mGTtJm8e/
 wRCWwKVBLY77fw2YYMaV0xbLPpDTyNJZzvgyVpq2l8wlFpPaBzUnX0UbhqWqrVdg1Lqe
 zk8DQwumKNu9LVsfidTGIksfd2OIDT700Hbbi5VxY2LEmEboannlgCoaSMv2C+iw984g
 lOILddicHKUXHpHM+lvWD0yjFu5WiQB3NeRQNfBhUG+15cSW9pgql1ffCSd4Ut+lIGks
 wMpzl68xo3AuBfaFtvJRd2EQytTJuz2IRkNSi0KOU8PRXqNWYuwFL7RU+87UyL2ZVsUV
 QnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2GOhGSIAgAI7R5VlJcbom+0iPWY/mzNGleRCz0vQu7k=;
 b=OxPJjxX/NGr5mLqdO32eNsVrQJzlFAy3HbPTNGySOyW52kQKMH3SOVPvYdRUpGFMU7
 XrHb9wmWkvoK6EhZ9MBjzkIyktSuNLf23s3FJv8za2yohExPC11xqDEM393hZOYmYBqX
 VuicXBPscmIJYpifWnHXjrx6DUtT2z4p93fx3fNa+1pEeu4Gq4hDSU9iL2M+rPYUx8FM
 mCK0dpljv/F+A4Z2Etqh5YGoNNOAO3xO7PQoS99BTijBAV8AiieEZlmynlXzUYgKknF5
 X4lN48g/OsAkuhgeKX1UYmg7il387rF4oB4Lyb7Xtr8G2cqc8hwUFHMU+qMhcb1kaBPL
 oleA==
X-Gm-Message-State: AJIora9p1C/ESQnqdrIktxUfaFjwwexbof5/f46yM1HTW+tEdIIyP6FC
 SgSiwxaEZT22DZnGeU/Nb92Rmw==
X-Google-Smtp-Source: AGRyM1u3t/wZ1dpuLRNQaQjoXqQunoUYa1Jpaex3TubGDifazDCOB+2dl1lUlZ2xV18EUqTBzXxQrA==
X-Received: by 2002:a17:90b:1c8f:b0:1f0:4a09:5167 with SMTP id
 oo15-20020a17090b1c8f00b001f04a095167mr3520531pjb.47.1657621030597; 
 Tue, 12 Jul 2022 03:17:10 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 i189-20020a62c1c6000000b0051bdb735647sm6375060pfg.159.2022.07.12.03.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:17:10 -0700 (PDT)
Message-ID: <42b1857e-6a5f-cc40-86d5-713305545ee3@linaro.org>
Date: Tue, 12 Jul 2022 15:47:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] target/loongarch/tlb_helper: Fix coverity integer
 overflow error
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
 <20220712080133.4176971-5-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712080133.4176971-5-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 13:31, Xiaojuan Yang wrote:
> Replace '1' with '1UL' to fix unintentional integer overflow errors
> in tlb_helper file.
> 
> Fix coverity CID: 1489759 1489762
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/tlb_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
> index bab19c7e05..b300230588 100644
> --- a/target/loongarch/tlb_helper.c
> +++ b/target/loongarch/tlb_helper.c
> @@ -298,7 +298,7 @@ static void invalidate_tlb_entry(CPULoongArchState *env, int index)
>       } else {
>           tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
>       }
> -    pagesize = 1 << tlb_ps;
> +    pagesize = 1UL << tlb_ps;
>       mask = MAKE_64BIT_MASK(0, tlb_ps + 1);

This is incorrect, because 1ul is still 32 bits on some hosts, including windows64.
More generally, 'ul' is *always* incorrect for qemu.

Much better here to use

     pagesize = MAKE_64BIT_MASK(tlb_ps, 1);

> -            tmp0 += (1 << ps);
> +            tmp0 += (1UL << ps);

Likewise.


r~

