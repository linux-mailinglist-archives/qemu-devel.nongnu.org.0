Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC6414C82
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:56:18 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3fV-0007MD-Q2
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3dt-0006cr-4u
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:54:37 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3dr-0002vF-DR
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:54:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pf3-20020a17090b1d8300b0019e081aa87bso2545790pjb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ejz5D1UjtZMTt22WJ8vjLyCBWd7J+qZ3z5ZzOggECbw=;
 b=EEYmizkj8SPQLTbIo0xnlhQxf/s2agVjeEOoTf71URD8aUP6GDinmrgCdchIeua2P0
 QE3njGR8JRreGIBMmN3Odhd1cVjuaF4j7Tu0DbYCqBJdTc5JMUTUlyLCuytYcVSbYLVz
 9FlmWgloid2Uev8ZJNDwBtm0U5Wq24sWSRlw7X3vwxS90iSYSC9oJMg7d88sVMAj6lp8
 nXBDS8R61pVmaj7qYEfBdzpDoduS6QVds1cIFnjo1vdXz8Slrd1o8ZU+Yg+P23QSLeIc
 xbUHJ6QJlY5PY29l6YFBhIthhUzeCRgx1UXza3TB547dmQTwOUPJu++CKZ7iZjKTnEIx
 vSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ejz5D1UjtZMTt22WJ8vjLyCBWd7J+qZ3z5ZzOggECbw=;
 b=cVNONKXiXKR98KZJDl7pL0Qc7NAKi2ggKBz2c1sSIOV5tzoi59nsPVyulMb4JoqfbW
 ygraQcgj0sdcD1w/6poTcC7sbViQjiaECR3G7I8MYky8uQdWckwkLj01k6D22pbwKHg2
 w6i/JWx25q+I4AypjMY69vPv33F6Ai0sXa9Hq1gM3gNZkdy5UDbe4TRzYgRPth0SNs6Q
 6wqM9m5SqrQWInTBSjt/XHT8b/8QOqquvVUqhEMSJIZJzNGVFj9e34MVdqEf4USATXiV
 eQzz/Gc3wPUj6jZDMVxhdCZZM4KpcGYaLNqii4cYYHJ1G88oN0R9fq3j5uEfigynLhqC
 UivQ==
X-Gm-Message-State: AOAM533mIk9EI7gimR76iZ+WxC2mMGHbNraj9c4b/twN4tGD28lvA0Nb
 CO9zxjss+lrVtf1mGYd43+mWo6ZIJPwbiA==
X-Google-Smtp-Source: ABdhPJz5RVvfcsdIFNLYacrJIxTS98GURXwd0isY04iLLJDzDggyhzGNzILhrsFfggbufR+z4RnHRw==
X-Received: by 2002:a17:902:9009:b0:13b:9cae:5dd7 with SMTP id
 a9-20020a170902900900b0013b9cae5dd7mr32611900plp.53.1632322473032; 
 Wed, 22 Sep 2021 07:54:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a11sm3076517pgj.75.2021.09.22.07.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:54:32 -0700 (PDT)
Subject: Re: [PATCH v2 14/30] tcg/loongarch64: Implement
 bswap32_i32/bswap32_i64/bswap64_i64
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-15-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c009208-6afe-5efe-a067-dcc44421cd7b@linaro.org>
Date: Wed, 22 Sep 2021 07:54:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-15-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> +    case INDEX_op_bswap32_i32:
> +        /* All 32-bit values are computed sign-extended in the register.  */
> +        a2 = TCG_BSWAP_OS;
> +        /* fallthrough */
> +    case INDEX_op_bswap32_i64:
> +        tcg_out_opc_revb_2w(s, a0, a1);
> +        if (a2 & TCG_BSWAP_OS) {
> +            tcg_out_ext32s(s, a0, a0);
> +        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
> +            tcg_out_ext32u(s, a0, a0);
> +        }
> +        break;

Looks good so far, so:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

We'll also want INDEX_op_bswap16_{i32,i64}.  This should look just like bswap32_i64, 
except with revb_2h and ext16{s,u}.


r~

