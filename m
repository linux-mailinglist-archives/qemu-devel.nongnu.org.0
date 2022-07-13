Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66D573B15
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:23:15 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBf8r-0000Rc-Sz
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBesG-0004vB-GL
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:06:05 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBesD-0005Ns-Mv
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:06:04 -0400
Received: by mail-pf1-x42a.google.com with SMTP id o12so10622813pfp.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VTAY+6l1xrgnVTgy6CFWnek8r2tKMrvj0FscexAU7EE=;
 b=Lpu/BzeNhNGAR68J32zZzF6Zv7GX+rWQDCGzKEK0u2bSFmnrHqwAU8ycyI2vOtGEru
 ZLgCanD0j3gZ5qwP/g1yHluwcQYqHswSyT5O9k+X0UfhuqPFtDa1cPx+8R4NjT1iJJ1r
 91+FzsNV78WKPnlkAz2HtlGe8s83Srg+uH74VtozBW+TegZIYUN+0W2PqHsW9H3ezfuJ
 J0VzfkEdFPaZWZ4RKmH+n3uIfJwWD8Y9mb6rKyJeidFm6kGmZG98N0OlM4aRokFDF9vh
 t9VpuNF+2t2ogzK0glVmfc5WRLubrOzwKO2HyZzhWPRkLG3f7EGRnkVr3+FHK+FdFpJ3
 iQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VTAY+6l1xrgnVTgy6CFWnek8r2tKMrvj0FscexAU7EE=;
 b=JZGwQml60MzlY/qqxwBiUn5BfxbwQ9HfkAI/7whaTWUxg0ukR2tuYkrgAoo5XBoRBE
 QSyJSMy+OOD1f5Q8ubVosipc5ppk45x3ltcIPyuGEYITFv6KwoDqZRRo5gsSCiACx606
 fI+Yofvfs1ERxKPu23KKOi0FH3W4mMESbz7+1H4Cp+fboRAWkWz/sXdOjWaqX37yJ7gV
 dGBH4OcZkxjgKnv1QddefO5vFU/7BPOP7yaYaRXzCdzQSXDqGMZO/4OliMsvmxXkCd2D
 f52QmX0xw17tVocDCwtlC+zqYNol3TYo0zA+/lIGaEnybrJojUB9ksW+mIsxDcUDDHSK
 NF3Q==
X-Gm-Message-State: AJIora85erAL+o0t5A55LXFwQmwShR1QclIYWL7J6OP0qY3wUhoFlcIu
 +YRL4QYVtveAEiNV7qA1tbFo9g==
X-Google-Smtp-Source: AGRyM1u1oV5FKrGB2sFFduESVCAOJq25kKOpSoETbQjo3snkVULSd+4FT/buqZfuaZp+ra2V3JoeYw==
X-Received: by 2002:a05:6a00:1aca:b0:528:1f7d:4ffe with SMTP id
 f10-20020a056a001aca00b005281f7d4ffemr4071812pfv.16.1657728359152; 
 Wed, 13 Jul 2022 09:05:59 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a17090a429000b001ef7d8dc26bsm1816292pjg.12.2022.07.13.09.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 09:05:58 -0700 (PDT)
Message-ID: <075ac6ad-54ed-3ba0-d353-b789b0e9926c@linaro.org>
Date: Wed, 13 Jul 2022 21:35:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/loongarch/op_helper: Fix coverity cond_at_most
 error
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
 <20220713095036.705102-6-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713095036.705102-6-yangxiaojuan@loongson.cn>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/22 15:20, Xiaojuan Yang wrote:
> The boundary size of cpucfg array should be 0 to 20. So,
> using index bigger than 20 to access cpucfg[] must be forbidden.

You must update the comment to match the code,
which no longer mentions "20" at all.  With that change,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> Fix coverity CID: 1489760
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index 4b429b6699..568c071601 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -81,7 +81,7 @@ target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
>   
>   target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
>   {
> -    return rj > 21 ? 0 : env->cpucfg[rj];
> +    return rj >= ARRAY_SIZE(env->cpucfg) ? 0 : env->cpucfg[rj];
>   }
>   
>   uint64_t helper_rdtime_d(CPULoongArchState *env)


