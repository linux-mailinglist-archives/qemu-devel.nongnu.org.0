Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBAD4F6020
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:48:43 +0200 (CEST)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc61a-0000vE-6g
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc60J-0007n9-RB
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:47:23 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:42847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc60I-0002b5-8C
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:47:23 -0400
Received: by mail-qt1-x82c.google.com with SMTP id t2so4256484qtw.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cWOjChsKc+caA4Aog3n5qoCEdt3BhXmG/WMTNFBIIVE=;
 b=TiZhejnZ5GLuRUUZZ9KrQ88oQuzBNbjtzlebtWDC5Vper8qe8FUEKVqbKIx7vsWeEx
 ZtHJLEPUgnUoRZfGV2QliFJEGZvKlx918UlmyQeNK1KAYlzcEY+ZCTPEFSgMnsLpxVVG
 jn6rapo6nPQn5iRfpCDxhAFckWJ5+4DMcEh+PJjITOPpGknkmqv8RF2b6zxo9FgILmSh
 MkY5e3YCnepQTzVFCEZwISxfz93BMn6IcXrTdJexgp0BOH6yivmFHSSwvjJ9nvPEorwi
 o7F93Fes6zmuLy0vA2OM9wueo1A3KqtUh/58eoE1D+J2PjHhnRhBklUc9oHJA4s3/S3s
 lcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cWOjChsKc+caA4Aog3n5qoCEdt3BhXmG/WMTNFBIIVE=;
 b=ZWIElhpkk6NfBX+Tre5rPrZzWeT0z949A+OXP54WxhrCNShfG6P7LRdoC87ulRdR9d
 ZUfLxftxgh8REjqXlogyFeWzg3/Ywmik5MtQ+2B8Gj/hV3mse/G+g+xUI+opABVn9GSN
 8jDSIf94VDYkvkyO3TurKhXZLoNh+2XvddaoeESroeaQ+RN53kWPmMl5VArTb86KEkEi
 ODVspT2aNFnXP/sZRewtS5OrsApQdlu25pKoMv1eY5YGvffz2Lvm0fND+Mz1n5EY8rHK
 jy0OwoHCDEf4egq0IjFWBcXx325nPRwH+Hm43b8H+RxGUXSn4vcB9FTjmXYr8L/UAHOX
 bliA==
X-Gm-Message-State: AOAM5332StE6TM412/Ze1j5Vv9pBw+Zf2kh6tprqa1yEOuGrM4JTYgcW
 TBGuk3R/7PnImWA9SRFYeIraog==
X-Google-Smtp-Source: ABdhPJzXkW5VchW7dJ3i2SFPlkClK3LPBLIatHBRz2UfWoZMTnrbkBAjQ2/Dsof4KV2gsfrc5DNqeA==
X-Received: by 2002:a37:644f:0:b0:67d:1717:6338 with SMTP id
 y76-20020a37644f000000b0067d17176338mr5617623qkb.389.1649252841132; 
 Wed, 06 Apr 2022 06:47:21 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05622a14cb00b002e1fd9dce3dsm13459453qtx.60.2022.04.06.06.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:47:20 -0700 (PDT)
Message-ID: <574f442e-4dc3-d035-f928-de42d4eeff18@linaro.org>
Date: Wed, 6 Apr 2022 08:47:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 06/18] hw/arm/exynos4210: Fix code style nit in
 combiner_grp_to_gic_id[]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> Fix a missing set of spaces around '-' in the definition of
> combiner_grp_to_gic_id[]. We're about to move this code, so
> fix the style issue first to keep checkpatch happy with the
> code-motion patch.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/exynos4210_gic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

