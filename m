Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0466D9063
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 09:26:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJyq-00066v-PJ; Thu, 06 Apr 2023 03:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkJyk-00066c-H5
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 03:24:18 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkJyg-0007VY-AI
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 03:24:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r11so38493919wrr.12
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680765852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5md0Hic8N7yJjUaBjpyttLhL1BGAgobEwoST2yM+4Y=;
 b=oMxublAr9TkwWSwPt0ZsU5ZV4GPYM4ADCKwIAYz6EmetU1bC5RGh7YRI+AfRY4ECPC
 i1ddL79PcGARYv+FhWQWoDN64oov1xPIZqjSp0f+w7eYM1CH4HHfy5dTP8SLbs+TJHoo
 H3H6HVoQ+c3Nq27yG8NNLGA0ppU3hRcOHDn3l53aDqO7Ry/O1GrZRrl14KW1KU0insYM
 hYIuyMXlLjZEvlNez7DFtcrpMvsbruZsXgp1bKGMRkK8XaO8qQnXTVMtv7FAJJZXy7T0
 uXQuKrfHZa+DNolWye5Bi8ArwedUc40Csk0o4zeNuC0kFCI02zlThXckYK8qM9z0ULto
 Jpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680765852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5md0Hic8N7yJjUaBjpyttLhL1BGAgobEwoST2yM+4Y=;
 b=NrwwlL9PQtQvol/RTxbUcyDUeP2daGbui4ycxQ45f8CuBW55XTbkbTi5STv1NNFwlq
 wxrFRbyUYWtiIH+djCyQnZ9THnROxBXFsxNmwjFHRhc5TLOeinWCHTj/gVg9YpjJHu9u
 g7i8Kp4IM/A/gpqVacwfSYDazUWsttUCvDfRAHnj5Osg7WhQ95U0PeTImJNdubUBlEdd
 eeq9etztzEYQ9CY/6bxULjzkukOBUwc5FS0cCp/hdqT13p+anHdvn0kIBa8ehr4iumeU
 46drN1NWzagphE52nI6zgCU1GueSW0jW6iwD27ngN+odzPoymjDFFVUbojPw62RC4FWh
 DlEA==
X-Gm-Message-State: AAQBX9fR1YCdQ/vv1NuDGHYJFYXq8yblSiyTk6Tc8k0i0TLC5x48W3bb
 t0hKVQ1D0Ef3sg5qOWShotuF2A==
X-Google-Smtp-Source: AKy350b1DwFUiZTDtePfv5vC+3jpNK8Av1BBgzvEWkny/iZWnjd8DhD6UZlD1HjIeQHYCplfkJoEdQ==
X-Received: by 2002:adf:e2c4:0:b0:2c7:dad:5630 with SMTP id
 d4-20020adfe2c4000000b002c70dad5630mr6137639wrj.27.1680765852080; 
 Thu, 06 Apr 2023 00:24:12 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x16-20020a5d6510000000b002e71156b0fcsm952881wru.6.2023.04.06.00.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 00:24:11 -0700 (PDT)
Message-ID: <c1980337-ff85-b7fe-b607-a2044743d5c0@linaro.org>
Date: Thu, 6 Apr 2023 09:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] Hexagon (tests/tcg/hexagon) Move HVX test infra to header
 file
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, 
 quic_mathbern@quicinc.com
References: <20230405193945.169854-1-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405193945.169854-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 21:39, Taylor Simpson wrote:
> This will facilitate adding additional tests in separate .c files
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/hvx_misc.h      | 178 ++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/hvx_misc.c      | 160 +--------------------------
>   tests/tcg/hexagon/Makefile.target |   1 +
>   3 files changed, 181 insertions(+), 158 deletions(-)
>   create mode 100644 tests/tcg/hexagon/hvx_misc.h
> 
> diff --git a/tests/tcg/hexagon/hvx_misc.h b/tests/tcg/hexagon/hvx_misc.h
> new file mode 100644
> index 0000000000..ebcdb9f033
> --- /dev/null
> +++ b/tests/tcg/hexagon/hvx_misc.h


> +static void init_buffers(void)

inline?

> +{
> +    int counter0 = 0;
> +    int counter1 = 17;
> +    for (int i = 0; i < BUFSIZE; i++) {
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES; j++) {
> +            buffer0[i].b[j] = counter0++;
> +            buffer1[i].b[j] = counter1++;
> +        }
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 4; j++) {
> +            mask[i].w[j] = (i + j % MASKMOD == 0) ? 0 : 1;
> +        }
> +    }
> +}


