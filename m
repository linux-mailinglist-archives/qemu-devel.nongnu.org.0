Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E6160691D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:49:44 +0200 (CEST)
Received: from localhost ([::1]:55102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZHM-0002Fo-Lp
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYr9-0004Oc-N0
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olX4y-0008FM-MR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:03:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olX4w-0001e5-SU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:03:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f11so34997583wrm.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B/K55nieN4WFBmMMHND44CvXKRU4bEFYLUyKwLHFdNA=;
 b=x6sykljuUibD8RZDr8X8K/KTouTP3LtbJ30RyvFucUvdxRgZug8OawEbFuDi+jOB/G
 vFRD15zql0cOyTemZHf/+O9oTrZulNErUc6CEMMhGGBIDOivdEgnF9Is3E40eu7ri+wH
 WBMmQpODdH6Fqlzi8eA3HWyKAVXLEjdJ94yw3y0jnrMmBaQWWFmfjpbMPFqIagbgiU9S
 4s3UTQeSYsAH5yMn7A97UniIs6BwUh+VnaisxuacuL1/3eeD4nb9U6ypnGkcI2TUtAPQ
 UxXjOcd40Tg5NIVZdzdWwBGN9RJoU5x12Q8ddrNjY3r+/p2nfxF4+Ag3vOZ62GlK0dqM
 Aq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B/K55nieN4WFBmMMHND44CvXKRU4bEFYLUyKwLHFdNA=;
 b=p1hesQfREB38D2hKIIYe8ofae4iIeA0HJ+62I9SBtrPJ1cAWVzAN9HtBf2c52c2TbW
 XsfJg7cvhm+up0uPBgFOghhnxlWuIUT2V3OQH3x3Cs6bOBhNgPK77m+TdDA4h/r36dGN
 r4GTzresSqbDwIFFMQhuLBM5ouphCdQRS5Jkj72miWHjz1RbuSAYw2oPGfacMMyVOmKU
 ED3SD1XRLVnUTkj+uIQmIRlR9kCfLfK/KclgNBspPfLjIPXTZgVC6Dq5PAbADBflYxYE
 HWUOIQRi7Qeu0SHUyskQgwzyFhg1cXElsNa0BpIQduIhCEJEZj2qJW8cCpANWmrs3D0D
 iWGg==
X-Gm-Message-State: ACrzQf1LO5KFr08KUQKcyDPlpeFPibPS0ZSX5LFScKBc4Y4JPuCa2TVA
 VV0wbDaeSEbk5ph0fC+nK+XrwAyyihO4QsDQ8R4=
X-Google-Smtp-Source: AMsMyM6S542BQ4IBwDcNpHnBE6aFbiWJX2X/4Uj1VckfTkImUnve21oiLf2jgwTuPQTywH/9YkOSPw==
X-Received: by 2002:a5d:5612:0:b0:22e:35b7:5654 with SMTP id
 l18-20020a5d5612000000b0022e35b75654mr9210169wrv.651.1666278204393; 
 Thu, 20 Oct 2022 08:03:24 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a7bc84e000000b003c6f3f6675bsm20717wml.26.2022.10.20.08.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:03:23 -0700 (PDT)
Message-ID: <34eab334-999e-57a4-f8d3-826ee266f5a1@linaro.org>
Date: Thu, 20 Oct 2022 17:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 12/31] tcg: Move TCG_TYPE_COUNT outside enum
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115242.2301066-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/22 13:52, Richard Henderson wrote:
> The count is not itself an enumerator.  Move it outside to
> prevent the compiler from considering it with -Wswitch-enum.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index afa18986b1..a631e0bc80 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -294,8 +294,6 @@ typedef enum TCGType {
>       TCG_TYPE_V128,
>       TCG_TYPE_V256,
>   
> -    TCG_TYPE_COUNT, /* number of different types */
> -
>       /* An alias for the size of the host register.  */
>   #if TCG_TARGET_REG_BITS == 32
>       TCG_TYPE_REG = TCG_TYPE_I32,
> @@ -318,6 +316,9 @@ typedef enum TCGType {
>   #endif
>   } TCGType;
>   
> +/* Number of different types */
> +#define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)

Eventually add the definition at the same place within the enum,
so we don't forget to update it when adding a new type?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +
>   /**
>    * get_alignment_bits
>    * @memop: MemOp value


