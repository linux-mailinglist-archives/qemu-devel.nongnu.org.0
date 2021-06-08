Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD193A07FA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:44:55 +0200 (CEST)
Received: from localhost ([::1]:45300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlOw-0001SF-2b
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlNO-0000Yl-R4
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:43:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlNM-0006lX-8Y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:43:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso329866pjb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qna+oKte/QGASPxuMLgzEJEQ2ImlDPSh97npSpCKF7w=;
 b=DeyOXQi5YPnr9dJoZByTJnRmweqd8Q+OJOGz6/yQaOsp3lY7Zcw3mKmqXtyD//OLpa
 hNoQ0LzR7WdtWp6W1pZXo3OVHlS5pyvjdGnoUMIS4y+ChCkR/aGf3ahZyvS0D8dN2+Ij
 Qilf/9WUFQ5M7iPZ+XC9m1qqYH5f6qnmpAwz0G8eTeOF3ahTrmC57YT1QjloD1N8/FLr
 xH3NUhLRm4BLnYb/k4iueqvzFLQuQasAwR5Fm2KTm0RUNLQko6uYCN8x5vss2STi+9mV
 /42PWBl+Pa1KkugZGzqmOKMgpCvQZFcrkcz4/b51SM0d+OhRtGLgSZj1XaniJUazhtrv
 T3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qna+oKte/QGASPxuMLgzEJEQ2ImlDPSh97npSpCKF7w=;
 b=WPHRVmcPdFJCQZ1fFo/PC1MSGXeqhmQzx5s8i4a5/To41dqsWEgwBeGow8yKgkfiX0
 kkWOiUVpRdm1zoUo3kvmofnLUZmzFnaC6KihayXbqOQI7LZsCdgrBt7B5xoFrQUdjnCB
 B+duQggvegzi+zPBHHDkaKIE0HHyWxlj/i9GCWSd+c28jTcM/KUYaUKxzseA5Tp+64kD
 dwk3Tht/u6gUc6HR0PK7hu/rdn4UjQ6HbZ4IzO9eXfg7lS6t5nq/KZx70/XtHKINaM1D
 oZbDW6rFLSM63SWZe42qCH1EczuZiGn2kX5CZYhP5sI5YWX4YkRb4pr0RslLnbg4qDrX
 cpsg==
X-Gm-Message-State: AOAM533FfGUaP6gPRxep/KGc9/fOc/AsDnrM+9RYIuG4g0tsrEZiMZIA
 l0vJ4L9nRbMHrNsxhxh9FO2lRHroCEW0rQ==
X-Google-Smtp-Source: ABdhPJyZ7uLwNb+h1uouUq1nbOjwG39b4f8SRtp6VlWYPfxObB812z9RLc0rktzTJ1qBvN2elfZ3wQ==
X-Received: by 2002:a17:902:e5cd:b029:112:7879:4e6d with SMTP id
 u13-20020a170902e5cdb029011278794e6dmr2222419plf.58.1623195794859; 
 Tue, 08 Jun 2021 16:43:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h12sm12057967pfq.72.2021.06.08.16.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:43:14 -0700 (PDT)
Subject: Re: [PATCH 27/55] target/arm: Implement MVE VHADD, VHSUB
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c67dd65-75e0-c088-fded-3e2c23b9b05d@linaro.org>
Date: Tue, 8 Jun 2021 16:43:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement MVE VHADD and VHSUB insns, which perform an addition
> or subtraction and then halve the result.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 14 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 48 insertions(+)
> 
> diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
> index bfe2057592f..7b22990c3ba 100644
> --- a/target/arm/helper-mve.h
> +++ b/target/arm/helper-mve.h
> @@ -118,3 +118,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>   DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>   DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>   DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +
> +DEF_HELPER_FLAGS_4(mve_vhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +
> +DEF_HELPER_FLAGS_4(mve_vhsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> diff --git a/target/arm/mve.decode b/target/arm/mve.decode
> index 087d3db2a31..241d1c44c19 100644
> --- a/target/arm/mve.decode
> +++ b/target/arm/mve.decode
> @@ -96,6 +96,11 @@ VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
>   VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
>   VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
>   
> +VHADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
> +VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
> +VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
> +VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
> +
>   # Vector miscellaneous
>   
>   VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
> diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
> index f026a9969d6..5982f6bf5eb 100644
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -415,3 +415,28 @@ DO_2OP_U(vminu, DO_MIN)
>   
>   DO_2OP_S(vabds, DO_ABD)
>   DO_2OP_U(vabdu, DO_ABD)
> +
> +static inline uint32_t do_vhadd_u(uint32_t n, uint32_t m)
> +{
> +    return ((uint64_t)n + m) >> 1;
> +}
> +
> +static inline int32_t do_vhadd_s(int32_t n, int32_t m)
> +{
> +    return ((int64_t)n + m) >> 1;
> +}
> +
> +static inline uint32_t do_vhsub_u(uint32_t n, uint32_t m)
> +{
> +    return ((uint64_t)n - m) >> 1;
> +}
> +
> +static inline int32_t do_vhsub_s(int32_t n, int32_t m)
> +{
> +    return ((int64_t)n - m) >> 1;
> +}

Use 64-bit inputs and you don't need to replicate these for signed/unsigned. 
But either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

