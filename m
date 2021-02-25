Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611632577C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:22:31 +0100 (CET)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFN9Z-0006be-OU
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFN88-000692-6w
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:21:00 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFN86-0002Se-Gj
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:20:59 -0500
Received: by mail-pf1-x42d.google.com with SMTP id m6so4391354pfk.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CIn1b48Wxd4LgKQ49JOrsN50ng1ehZm71zO+wcfXalk=;
 b=U90G7//xnuvffXBtZGe35ftcLJarOTTr8q5B6w/NAfBia3VeGGgVIpffS5xmmfAoE5
 I2gtTnrB+JKFt8JuKMyDbkrqXcTgzne258l8skGLEe3cowQklHy+oc+96W+Yv4wOcbBj
 yVPbCu5uID4XUDVyI+2cwHBXKDoWjKAiQbTGLSp2G6lXrxrF1N2FPhKc14mvhxf/j9g5
 GgGBFUe2ORKpGptAD+Jx3RGTF7w5WZNTi/AtcZ6Af+xJQmDkEVc7ZAr/w/f+RW3/hA/x
 UA8syLj8rmtfifFvZKsjmSycY+1pN7ztCJUeNJYUyKDYXJba3vlCYZK3SEk32fKl2eaG
 Nd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CIn1b48Wxd4LgKQ49JOrsN50ng1ehZm71zO+wcfXalk=;
 b=r4tWQWbwLRVfaDBMRE6rZtiVvhNlEt8ijj578tik63/dv6gPIM3cnJBy8BAOTNGj8/
 eX9Fkb88gB6x5V1KypWmNTwvRWIGpAp0IqRx4iyRCsYdGmJJg+1peXaJ7cNItf2Z3VVS
 3ynBLAY6v+OiYLKx9TF2DalPe5cZy70MWE+ambzeALTbg4GLWuA3ynCV+1Ya0HpKm7pT
 mqIDdU64QpeYCffWK2RqbDijBoC0ZGT96qEymjLWUnlSMk13/s0gG6aq1MfSf72Et3r4
 F6lWWe5FRMwsuIBfFbXGKABEbHLqLrVaIM9oo0iJKkUiKTMatR5A1WS+2BqhGxaHH/Gl
 VUHQ==
X-Gm-Message-State: AOAM531ompkzBRcxOffD8X3dsyusmSlmYg1Eg9FcwT46pHHKFfmyuwLy
 fDQS0Pbkz0SgCsyFCA9cLFUhQw==
X-Google-Smtp-Source: ABdhPJwaV06A2cCSyVytbfN/ugzajQtH0du4n3QMOf3LwTFTvBseG0kvV8iX/ZHXtYsJPO48G6yYUw==
X-Received: by 2002:a62:5344:0:b029:1df:c7d:3c3e with SMTP id
 h65-20020a6253440000b02901df0c7d3c3emr4847660pfb.11.1614284455993; 
 Thu, 25 Feb 2021 12:20:55 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id i8sm7180011pgn.94.2021.02.25.12.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:20:55 -0800 (PST)
Subject: Re: [PATCH v2 02/10] target/hexagon: import README for idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-3-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
Date: Thu, 25 Feb 2021 12:20:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-3-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> +Now let's have a quick look at the generated code, line by line.
> +
> +::
> +
> +   tcg_gen_movi_i32(RdV, 0);
> +
> +This code starts by initializing ``RdV``, since reading from that register
> +without initialization will cause a segmentation fault by QEMU.  This is emitted
> +because a declaration of the ``RdV`` register was parsed, but no reading of the
> +``RdV`` register was found.

This is odd, as is the description of why.  Yes, if RdV is read without
initialization, TCG middle-end will abort (at least with --enable-debug-tcg
enabling the assertions).  But you've just said that "no reading" was found.
So why did you perform this dummy initialization, which will be eliminated later?


> +Another example that highlight the limitation of the flex/bison parser can be
> +found even in the add operation we already saw:
> +
> +::
> +
> +   TCGv_i32 tmp_0 = tcg_temp_new_i32();
> +   tcg_gen_add_i32(tmp_0, RsV, RtV);
> +   tcg_gen_mov_i32(RdV, tmp_0);
> +
> +The fact that we cannot directly use ``RdV`` as the destination of the sum is a
> +consequence of the syntax-driven nature of the parser. In fact when we parse the
> +assignment, the ``rvalue`` token, representing the sum has already been reduced,
> +and thus its code emitted and unchangeable. We rely on the fact that QEMU will
> +optimize our code reducing the useless move operations and the relative
> +temporaries.

So, I take it from this that you're emitting tcg directly from within the
parser, and not generating any kind of abstract syntax tree?

A little disappointing, but not critical.  Even what you have is an improvement.

> +A more radical improvement will use the parser, not to generate directly the
> +tinycode generator code, but to generate an intermediate representation like the
> +LLVM IR, which in turn could be compiled using the clang TCG backend.

I sincerely doubt this is worth it.


r~

