Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89160C17C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:00:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9E3-0000KH-Ke; Mon, 24 Oct 2022 21:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on9E1-0000HC-Jn
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:59:29 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on9Dz-0000nU-Lc
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:59:29 -0400
Received: by mail-pg1-x536.google.com with SMTP id s196so10250127pgs.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 18:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V2m7yBsreqrp2v1AUGBxWUCch9mGH1vA0QD//LJkJnM=;
 b=mulFV8I3jrlps/+oFumtg+cQO6LwMJZq1HhUaB1637mrG7JNodnjghpNUqE6++2VFW
 GJix73XgtETtJk8tR5HNY2eaVPizYf0Gs2B6w14/WqWru4vIl500+wod1kSEim+AYfjY
 HK78WJjSjwURcSZxcI40ekr9OQjp1TWwyFSAWgdoHz7c2YNkkvPjsSbOT3MSdLzzrvtl
 QT3a4BnjI7TRKqYm+q8vrGbz0FG7KMK2iZ5i1GO5IsNd59/LFQUUqv+OS/W5FfZK+BVd
 XuEZIyf5gxO4EKkdn0lwEVgKeuD5fOrp2TQsTvqA1Z9U5jQ/cH4gOQ8sZKH1Al6VEzYh
 LWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V2m7yBsreqrp2v1AUGBxWUCch9mGH1vA0QD//LJkJnM=;
 b=oioTTv2itUtPfaf/O9Viud1+nK/0u38AwIqa5UYZjVYPltQF5lFgE13fJjJ3tuqiZA
 mzv+TMnWUBBmKP5QY94krsFUK6fSRIFQfFxqcvZAfCtDS7Xdrhe2XQ6oW4uaTa+Ummzf
 0eTv27Og6i24aioPb2AB31I4hOaajuKc8JFydT+UDaI5IgNlRWd6HBduhPu7VN1arjGi
 X54Dc3MiLJanq/WcqE1GvNocB2aXjD9hTF+gQjiG+r52xwXdwIumjsL8GanKW9iGJpId
 kGo7opMA5us41OFVO7PMa/9myrh08+f8Ho1DTY53A4mUXqkKl7QvKDufuRJkMZpsEjB/
 2ueA==
X-Gm-Message-State: ACrzQf1JvK6rtmmtyjI6/HjDxHGGONWhfufPfn9Uf6ue22p95iUmQ/Te
 EFc+aBpRSz4x6r8+GrI1QjZSHokLHLMfqA==
X-Google-Smtp-Source: AMsMyM4RWRf9x+AFl7gM6m00EfES/iVXsz4UNx2qPpO7+yj/QzAf3haOZXVKp817MSzaRRQdthftDQ==
X-Received: by 2002:a63:64d:0:b0:46b:158f:102e with SMTP id
 74-20020a63064d000000b0046b158f102emr31644958pgg.150.1666663165985; 
 Mon, 24 Oct 2022 18:59:25 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 r24-20020aa79638000000b0056bab544100sm407368pfg.197.2022.10.24.18.59.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 18:59:25 -0700 (PDT)
Message-ID: <4d00256a-8213-c56c-7d50-3d09370552d9@linaro.org>
Date: Tue, 25 Oct 2022 11:59:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/4] include/qemu/atomic128: Avoid
 __sync_val_compare_and_swap_16
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
 <20221024232435.3334600-5-richard.henderson@linaro.org>
In-Reply-To: <20221024232435.3334600-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 09:24, Richard Henderson wrote:
> Merge the CONFIG_ATOMIC128 and CONFIG_CMPXCHG128 cases
> with respect to atomic16_cmpxchg and use
> __atomic_compare_exchange_nomic (via qatomic_cmpxchg)
> instead of the "legacy" __sync_val_compare_and_swap_16.
> 
> Update the meson has_cmpxchg128 test to match.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/atomic128.h | 8 +-------
>   meson.build              | 3 ++-
>   2 files changed, 3 insertions(+), 8 deletions(-)

Ho hum.  Must drop this one since for reasons that I cannot fathom, x86_64 does not 
implement the __atomic version.


r~

