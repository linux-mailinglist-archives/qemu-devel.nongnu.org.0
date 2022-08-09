Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38BB58DF35
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 20:39:02 +0200 (CEST)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLU85-00019l-DL
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 14:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLU0J-0003lV-Up
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 14:31:03 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLU0H-0007MD-NT
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 14:30:59 -0400
Received: by mail-pg1-x533.google.com with SMTP id q16so12123201pgq.6
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BbO1RK5CtD8dZylKcH/jGrI+GTV6qYLyYO76c9TBLBg=;
 b=JFK/Ec2ig/wzczjZIlUGoOciHuE/sV1ARr5043edgfooxKMJKL/VcBeii8xeYoI0uR
 fu0PBlucZYgEDrJWceaTSEPv8C8O93gRTWomgrGPKTmDMkLzMREcfsud22abG3hHsthV
 0N2uECiGGufTtpPa8MMvJqOywrwrwAqASTEryb1w2EVlIDGCRbt7O6NZC4jq/0Wz1AIR
 6OkywqGrBWasCoj/1OlsDHCydY540NEgyXfpZnLYd5nCDV0gxg7XlF/wGnTxMJlznn2p
 XPA6Ncl0/zD2IkO2shX4jcwec8Guy7MgtigWMC33Q4DgOeVY+WT11qJ/kFDVtGH4JTYY
 f3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BbO1RK5CtD8dZylKcH/jGrI+GTV6qYLyYO76c9TBLBg=;
 b=kxP9GPUJ8pclDuecwTTxHAZMwREerpO3H0380nimtBGCMqcvizmUDlR8wZWQelF7Fo
 hHt91EVi8cWKnukHsLLMpfsiB7OW8Haa7T4l0+q0nFJnwiQMrkKeUOS2VwW8HC458LSf
 ItE9MEEXb3QMUGusekK8nkTxvwk5f+/ZmJn3uJZDL1B6mY3lX+xUZY8IJlxN6GSwb+Ul
 IOldXQLgp/YYfrNPclIlLLU1cmueSE+ypgDQkpr5E4t/Rm3tacA5jwkXJt6zsH9xdBsR
 BzsoTJZk2yDqGLkWzzXgIfJwIyz1XsPeSf8TDto5LgxEVGgLKF42GfHqUX3U8W6FZfav
 FL3g==
X-Gm-Message-State: ACgBeo0gKj5IpjeMtqcRScgZYYzoR4WXXoYM+hrVRE6CMcXRDvIuVvq9
 4KtWFK8CIE1QNP6OhKrm5sTyvw==
X-Google-Smtp-Source: AA6agR6zTb39UB/xw3ccwkdfvakGrtWkSwPvok6cfMvXzB9GVBp1slnXBBRXlRLjIT02Npdf0LeATg==
X-Received: by 2002:a65:5789:0:b0:41a:4a7c:635d with SMTP id
 b9-20020a655789000000b0041a4a7c635dmr19710438pgr.60.1660069856181; 
 Tue, 09 Aug 2022 11:30:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:409:90e8:ee9:8fec?
 ([2602:ae:154e:e201:409:90e8:ee9:8fec])
 by smtp.gmail.com with ESMTPSA id
 127-20020a621785000000b0052d200c8040sm192133pfx.211.2022.08.09.11.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 11:30:55 -0700 (PDT)
Message-ID: <b836d401-3d5a-b630-00d7-75dcfe35d2b8@linaro.org>
Date: Tue, 9 Aug 2022 11:30:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] Test code for AVX512 support for
 xbzrle_encode_buffer
Content-Language: en-US
To: ling xu <ling1.xu@intel.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, Zhou Zhao
 <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-3-ling1.xu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808074837.1484760-3-ling1.xu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 8/8/22 00:48, ling xu wrote:
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>   tests/unit/test-xbzrle.c | 307 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 290 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/unit/test-xbzrle.c b/tests/unit/test-xbzrle.c
> index ef951b6e54..653016826f 100644
> --- a/tests/unit/test-xbzrle.c
> +++ b/tests/unit/test-xbzrle.c
> @@ -38,111 +38,280 @@ static void test_uleb(void)
>       g_assert(val == 0);
>   }
>   
> -static void test_encode_decode_zero(void)
> +static float *test_encode_decode_zero(void)
>   {
>       uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
>       uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
> +    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
> +    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
>       int i = 0;
> -    int dlen = 0;
> +    int dlen = 0, dlen512 = 0;
>       int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
>   
>       for (i = diff_len; i > 0; i--) {
>           buffer[1000 + i] = i;
> +        buffer512[1000 + i] = i;
>       }
>   
>       buffer[1000 + diff_len + 3] = 103;
>       buffer[1000 + diff_len + 5] = 105;
>   
> +    buffer512[1000 + diff_len + 3] = 103;
> +    buffer512[1000 + diff_len + 5] = 105;
> +
>       /* encode zero page */
> +    time_t t_start, t_end, t_start512, t_end512;
> +    t_start = clock();
>       dlen = xbzrle_encode_buffer(buffer, buffer, XBZRLE_PAGE_SIZE, compressed,
>                          XBZRLE_PAGE_SIZE);
> +    t_end = clock();
> +    float time_val = difftime(t_end, t_start);
>       g_assert(dlen == 0);
>   
> +    t_start512 = clock();
> +    dlen512 = xbzrle_encode_buffer_512(buffer512, buffer512, XBZRLE_PAGE_SIZE,
> +                                       compressed512, XBZRLE_PAGE_SIZE);
> +    t_end512 = clock();
> +    float time_val512 = difftime(t_end512, t_start512);
> +    g_assert(dlen512 == 0);
> +
> +    static float result_zero[2];
> +    result_zero[0] = time_val;
> +    result_zero[1] = time_val512;
> +
>       g_free(buffer);
>       g_free(compressed);
> +    g_free(buffer512);
> +    g_free(compressed512);
> +
> +    return result_zero;
> +}

Why are you returning a pointer to static storage?
I'll note that this isn't so much "testing" as "benchmarking".

Does the speedup from using 512-bit vectors make up for the clock slowdown that is 
enforced on the cpu cluster?  As far as I know, it is still quite rare for avx512 to 
actually pay off.

I suggest you model testing on test_buffer_is_zero_next_accel().



r~

