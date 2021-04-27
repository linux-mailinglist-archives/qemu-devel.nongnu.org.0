Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DD36C9B8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:47:52 +0200 (CEST)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQsJ-00058J-7M
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQpD-0003i7-Gk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:44:41 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQp8-0005HV-5b
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:44:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id t22so7508437pgu.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=asLu7fGHYQAMsfGz9f3W0xblmFDk+m21TLKg5phBU38=;
 b=cOFAU6Xo1u48rwBYYRvQvgTJejdVVX/8zEhbvgrM7DiWQEdztr+sjQ6aDdRxpfTORh
 Yxii8CrZNYGTdHUWY5FXRDQ2/U6QOgVe91K1ZEj7ZDIB4jz6dV3evHiat2HXiSTyyMts
 tGn/TIBVvNKPCU5luKqX8YHrQj8LtpLaHSRetLN+9QNcfw4r2llKI2BYVtoVZU1UkSeb
 6R+Ox5tsRQAyHYnE4Hf1DzJ2eGWIayMWbQOUqbVhXRNoy9YYBjqDb/JCuZzoxozp9dPD
 uH/3pZV2XTNLxQY3VtF5w70QVln/vWGTjji6qxzz4VMxSzIAPAnRYR6KbAY/7Grz/X4J
 iHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=asLu7fGHYQAMsfGz9f3W0xblmFDk+m21TLKg5phBU38=;
 b=Aq5cUzUV9x8ZEfHS7uC58BWDmHur6akWSrwgHREyYnmIBEf/yRVLsGikG3YsmI4Mm3
 bAG+drx1m0J7rhFYWcqjLLf7S6gY39l/NTdRr/Uf3QHdmARFjIkWTGWjBladnOL3D5t6
 1dz9cFbydNqGLQSgeBj5s/l/ATeP1ScZqgS34F/wogZ9WoaI6JyYrPbFiOD8BkudpX0j
 ZEltKNkSFcmheYbF2EoVxA7JSajdmFqQgKVmiUs5xYDVrMpi+BZrje0KtvqxhJRSTCTW
 Ttr5HnF7uI6Axkg5f208qNptIJJKfgRhXjxb0YRvsgfUGKAbauSBC9hHsWgE2A6HofK5
 mP4w==
X-Gm-Message-State: AOAM533pIlDK2mwzdW1bSEpuLle2QFu4gSubm30icAxTgkvqhGsJ71bb
 5A2hxgvozWdK+5hFHfNO/ppNtU0kBOaHNw==
X-Google-Smtp-Source: ABdhPJzlsPuOaFSKcYeiMT0/JS01tt18GuJ1Ydy/+MWibzdz+kSHm58fJew5TnzyLIbP8VPiJNn3kg==
X-Received: by 2002:a63:1c22:: with SMTP id c34mr22446880pgc.408.1619541871337; 
 Tue, 27 Apr 2021 09:44:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n203sm2089216pfd.31.2021.04.27.09.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:44:31 -0700 (PDT)
Subject: Re: [PATCH 05/13] target/arm: Move gen_aa32 functions to
 translate-a32.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3413dad6-67ee-1715-6e19-06adac14bc11@linaro.org>
Date: Tue, 27 Apr 2021 09:44:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Move the various gen_aa32* functions and macros out of translate.c
> and into translate-a32.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h | 44 ++++++++++++++++++++++++++++++++++
>   target/arm/translate.c     | 49 +++++++-------------------------------
>   2 files changed, 52 insertions(+), 41 deletions(-)

These functions go away with my alignment patch set, fwiw.


r~

