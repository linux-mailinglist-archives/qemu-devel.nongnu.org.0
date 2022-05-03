Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F451887D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:26:14 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluPk-0000jo-PF
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluO2-0008M2-J7
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:24:26 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluO0-0003DN-G8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:24:26 -0400
Received: by mail-pg1-x535.google.com with SMTP id i62so14279661pgd.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ecrSbEUzaN9aPqp6arQnOUNREXKqEhJcUF4s+4+3mBI=;
 b=bSDtVoyIRNMcwnoB9K6sKTRpOhdmiAKD8IXWh1OcvboBQ4bUooxAsAppCeDrQFLnud
 ymmk0rFP5l0x+1yIhqtZyDfQZFEvFJVhXUsnL/TkukFx4AVEFhb1TOXnJLvVLQLfJ7vq
 y9gLxWGWcPoj8aJyLd9uJyd4ZKD/+ah2abydg84/T/+hd8RssWwjUKPhG1a0Ike4pwyb
 SzxBqvDKLm96AjCkoknjguaKdd9Me3ZrLFH+l474dhOBUawbgdOObr8byBcMPuvYvSXN
 8unWO6iLVRdttOfYkimJKLnOKCSLkpzpTXBM6IxyMwhIaNNlteZ17sYaAbAfXfIgDYNJ
 nY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ecrSbEUzaN9aPqp6arQnOUNREXKqEhJcUF4s+4+3mBI=;
 b=dtY80YvLYZdUiYLF0Pz9ICqNmBpmcwLcq9oIu19dlUVSB+HuhPOWNzwxdBJ6n00IcZ
 uHk+qXipwgEoE9yc8iR1cFbGXDdrr+awbC4lN0WzkWeGEAfDwsCz67KjwVt3jNMRjCba
 OxQxjPU/bLwCgwZnH2x2kIvXyMUGALJR8ECX1W4SsIsIHbrMFub8UYoKXL0b3OKGWgPH
 uS8WJleEF0CTUD6gnPKt2z058XorKZdssSjqndoTkrI8sc27DsZjeRzAMo/GS3Wm23bx
 nCuJ6PyGiDfkutPKhz0foayaCvMAF0OXC1Ky4PMBPsG46V9CkfCn9XPLYIiN7HrGlwzC
 ILHw==
X-Gm-Message-State: AOAM531u3jTiuVBXAvGNCNY5hTlFAd//AQZzP/LCbb7CrJSJGrrmVlm/
 IzSAYHMI1RUWQzegg0xGzfy4pA==
X-Google-Smtp-Source: ABdhPJxBHPlWt7uIywB611fOmXHb3grIJgXQjaMDQ/Xvt3KIhDZUK6oSxrba4fdqUnE+1j8hzM+D3w==
X-Received: by 2002:a05:6a00:1ac9:b0:50e:15b5:e936 with SMTP id
 f9-20020a056a001ac900b0050e15b5e936mr2035372pfv.30.1651591462720; 
 Tue, 03 May 2022 08:24:22 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y21-20020aa78555000000b0050dc762819bsm6410541pfn.117.2022.05.03.08.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:24:22 -0700 (PDT)
Message-ID: <8b32cbb4-325c-b99a-87e3-72af84e19e3c@linaro.org>
Date: Tue, 3 May 2022 08:24:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/mips: Fix FTRUNC_S and FTRUNC_U trans helper
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220503144241.289239-1-shuizhuyuanluo@126.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503144241.289239-1-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 5/3/22 07:42, nihui wrote:
> Fix the FTRUNC_S and FTRUNC_U trans helper problem.
> 
> Signed-off-by: nihui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 0b3dd0957c..1bcdbb1121 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -752,8 +752,8 @@ static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
>   }
>   
>   TRANS(FCLASS,   trans_msa_2rf, gen_helper_msa_fclass_df);
> -TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_fclass_df);
> -TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
> +TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
> +TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_u_df);
>   TRANS(FSQRT,    trans_msa_2rf, gen_helper_msa_fsqrt_df);
>   TRANS(FRSQRT,   trans_msa_2rf, gen_helper_msa_frsqrt_df);
>   TRANS(FRCP,     trans_msa_2rf, gen_helper_msa_frcp_df);

Cc: phil
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

