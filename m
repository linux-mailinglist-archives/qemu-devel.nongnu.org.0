Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA824180F1
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:07:53 +0200 (CEST)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4b2-0004nJ-3Z
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Z3-0003UO-Uz
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:05:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Z2-0003v9-BK
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:05:49 -0400
Received: by mail-wr1-x436.google.com with SMTP id w17so34877207wrv.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+oEc0mNMiEEwx1ZTH+lKLZBGjUQIFvY8CFEQZqNHus=;
 b=jycIdiJaJdb9dn9dzJ/paPvHd2Zn0idiHccpJs5Ql+bKD5bLQw2u1ojuFLX6PE6PdK
 xTF1i7Qu/KO0Cr0c3VscAdpQPfykf1rRE441zaassj2sfBidfj3wtSLXqgEzeCnPkIZy
 uuLd177up83Aj1x1AkuMvoTZdB7Xhmz2HOwlaUu5xEDF2nweBG/o2db9wNBt4fxdxyX0
 NlafKa9h5p2DR5el5XfyrJ7Usbf0iaQ7AMsUz0Q8m4VKWpF4yQ3OBamf/g9ETljzU+pm
 4jDsDKF0WQS8SNOm0yGgAHc20ZHSMhLlKF7PAlXhs7gTj5P0lRASHmhrkFN0F+YLPz+Y
 YRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+oEc0mNMiEEwx1ZTH+lKLZBGjUQIFvY8CFEQZqNHus=;
 b=17fUvx/K5Z5R2XusNmFkhTTe6W0TVVYeHFL+WFDUyN7diKJrO5Ftq74Q9PMVuS1ZKv
 kmNOG7O00mO0MkQKV2/tLFymwE5MkZzYM3YyEcHbhXMN7VdrYZJMpSGkg0vKmp17Yg8G
 t2/ZdMrpJDxpwnXty1hGfYH/GcuEcEEBoW5RMx+x500VEnbQIbrXiNQMjAYWiVVjmlt3
 zOKe2B8+BHqSMX0w8XQY8X6qq9/iybf4keMVE0zjCl+De4851VIQJonHtoF0UmTCxx2v
 uqdJP+ceMR4gL8mhJ5Pjr9fJPEl0TqRbnoIf6hj+QOKs79Pq+L/uBbMCnbXn/b6KJzaK
 M41Q==
X-Gm-Message-State: AOAM533EPuWzx2o2m71PFaRIc2J0onWG3pIOJYQsM6msmGhAFJ5vhwFj
 QCHOdMxXVztHYJEzPo+F3wE=
X-Google-Smtp-Source: ABdhPJx75aMIiqrMDOrCqrq6VdmFU6crfiMTyAn3srnDm4Ky+Krh306zEJswQI5bGP8P//f+0rBHrg==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr6254610wmj.176.1632564346913; 
 Sat, 25 Sep 2021 03:05:46 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k17sm16853894wmj.0.2021.09.25.03.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:05:46 -0700 (PDT)
Message-ID: <f9afab7f-5c45-121c-42cb-a032cc341d8c@amsat.org>
Date: Sat, 25 Sep 2021 12:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 16/30] tcg/loongarch64: Implement shl/shr/sar/rotl/rotr
 ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-17-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-17-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  1 +
>   tcg/loongarch64/tcg-target.c.inc     | 91 ++++++++++++++++++++++++++++
>   tcg/loongarch64/tcg-target.h         |  4 +-
>   3 files changed, 94 insertions(+), 2 deletions(-)

> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index 1ab690bab6..32676e83af 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -580,6 +580,85 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
>           break;
>   
> +    case INDEX_op_shl_i32:
> +        if (c2) {

Why can't we use:

                tcg_debug_assert(a2 <= 0x1f);
                tcg_out_opc_slli_w(s, a0, a1, a2);

?

> +            tcg_out_opc_slli_w(s, a0, a1, a2 & 0x1f);
> +        } else {
> +            tcg_out_opc_sll_w(s, a0, a1, a2);
> +        }
> +        break;

