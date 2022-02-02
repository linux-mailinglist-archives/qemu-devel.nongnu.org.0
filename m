Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E44A7A0E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:13:46 +0100 (CET)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMwi-0008G3-UJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFMsn-0005oj-4W
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:09:41 -0500
Received: from [2607:f8b0:4864:20::436] (port=44791
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFMsl-00018I-BZ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:09:40 -0500
Received: by mail-pf1-x436.google.com with SMTP id n32so363695pfv.11
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K5QUGTnFRnr1FYzfLIv85FR8GFW9imDBUoUo+I4Z5I0=;
 b=RgG5+Zva08Vzy+N43uf6bAqhLcnGbsBY8UIUu44/m2gp2/UtsLy777xHvIHbt/vqlG
 7kYWwq1s2DW9uknTdMlObtEwMXeM1RTm7n8Zft1uHUmm53HYJKL4WRNjFVhLztfE0JQA
 9feexWjlR/y32doeMD66i3ZFfYqUE/Ir9iodg40qHaYZ/1Z/+duY7UMOooFTSiLMy7nw
 RARC4A9+hjZY2VRu5bLAPoRHSMRDzveqRuoHxbDqQRvTuLiRSdMbwQuLeBMy23NLTsly
 ONstB5tBd5CKPe0FWvIv+mTepXNUxfahjhAGHQx/Bxddc2HVhfxGbxLlq96Js3CFScHV
 EomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K5QUGTnFRnr1FYzfLIv85FR8GFW9imDBUoUo+I4Z5I0=;
 b=Je24Jd4Ss42ZyQ87sfEqXrxvSA3cqaxHYU8e8R0GUdHDrG4bA7oZV/kPUxg8fPU6fI
 GRWqWbkeViav29FvUiSf/SJZc46WZgRxjchvnbxShaYoPaKtQg7oFsNsakSoqDVAh+oC
 tNRdsO5XXAWKrtyBRA5sDebAgM3z3kYb+X4YSWlJiSnNpKGFX1O1aYR0fq3Oq9H1qnw1
 U3ONB3T2neyo1lKPDOwNNk0bxrEqz4J6zoOiCGLSTCFSUEL1g7Ykm54fXTn5bYiHdk9r
 tIEqPotc/kBJ9Zf4U1PUEyIevVl0Zd8QUmB5lddW9AeBLJG6mnMKdLslr04WGiFcMpn9
 HLeg==
X-Gm-Message-State: AOAM531VHp8m9ucmjrOM7hATmVD8r2K0AoPoLeKDURkmYGkKn9HELnIp
 7ijZMkxLGzZ72eyuRe08j3pjGQ==
X-Google-Smtp-Source: ABdhPJyozcRdl1QlG2V7P6DDRq137LDTyyIu/6O8X0s21j+J24Rm7as1muvm/aYuNho3HqWEVSJCmw==
X-Received: by 2002:a62:7c42:: with SMTP id x63mr31407200pfc.31.1643836178004; 
 Wed, 02 Feb 2022 13:09:38 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd?
 ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
 by smtp.gmail.com with ESMTPSA id s15sm27285589pfg.145.2022.02.02.13.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 13:09:37 -0800 (PST)
Message-ID: <5e12ebf8-46dd-021d-69b6-cc8bc68f7504@linaro.org>
Date: Thu, 3 Feb 2022 08:09:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 2/4] tests/tcg: build sha1-vector for SVE and compare
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 06:12, Alex Bennée wrote:
> The aim of this is to test code generation for vectorised operations.
> Unfortunately gcc struggles to do much with the messy sha1 code (try
> -fopt-info-vec-missed to see why). However it's better than nothing.
> 
> We assume the non-vectorised output is gold and baring compiler bugs
> the outputs should match.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 1d967901bd..a03844ce48 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -50,6 +50,18 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
>   AARCH64_TESTS += sve-ioctls
>   sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
>   
> +# Vector SHA1
> +
> +sha1-vector: CFLAGS=-march=armv8.1-a+sve -O3

For testing host vector operations, sve is not ideal -- you'll wind up with too many 
predicated operations that can't be vectorized by tcg.  (I wish sve had used a dedicated 
"true" predicate, which could be detected at translation.  Alas...)


r~

