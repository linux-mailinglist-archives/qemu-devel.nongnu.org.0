Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5877643DB5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:38:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SWr-0004QZ-W5; Tue, 06 Dec 2022 02:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SWp-0004PO-Kx
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:38:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SWo-0006Rk-31
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:38:11 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so7340829wms.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LHKH2b1o4r6fNmjtdyFRC/qCWmErY48fc6CByjC74QQ=;
 b=TMPrFQ8ViCEKcVyy3zdUDOSkeo5j8NHlhNZb9980xCjUFmUT+2IPsifC8p8fotttwL
 e/B0G/K/V8CkhEjK9C8kbUQgAhtwzVlB5TH4e33Th2JWA8PG1jrcvw/0YdUF7r9C+w4N
 aQ7tkx40QGfsRxIiVK84f/nPuiav0Qle2s9rr3vqo/DV6G+veFgdaOwf0qB1FL9LvvMt
 iHmbmy5Zou/mIo4zaWQXz7vCeGR4njwHfP9C/540RNedQyFFFjfbG8jO2DJtkMPflel9
 9dwf9NW36KKBWWaf7+b/bTh5X2pQVg7Jjva1xmKdZRI1pXNQgB+xyB9Q+dWLJVpsB3qB
 5N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LHKH2b1o4r6fNmjtdyFRC/qCWmErY48fc6CByjC74QQ=;
 b=kw/Svitz7J8b5wzUgicOKNKUxl39/1F1Bd08quZHiT3wGOjkH5Krc7bfQldQ5yuXmh
 yZykwpbOarNMjT+GJ92CzfeT3BGhFeznkC7saefN/VZVFIlZ7FxbDeG+2aWrdRHAMOud
 6kc0tAhbPa1MzYA927jH8tAfA7ChXZANS5egNIMouH5CcNkoDYJ07SA2MQx/nFW2beXA
 kbKHJclTHj/zdT3dfeYeZ+TQQc0OgiNOX1SJ5p4dfwnLdz7BNnEpINO660wD2EcjQtuH
 7GNrXDgvkQLoU9+cv70+5QZM1dyKik6H8jZedmpMCyooeUesMAzJphgN9J71p5V7t/ey
 iPEQ==
X-Gm-Message-State: ANoB5pkfciexJ7Yluz9BwoiqWANnXuPsvw2q8Z1I3lf0sjqN5joA7bCx
 J6HKLuuGhd64m8jQ9Uu72pNrUA==
X-Google-Smtp-Source: AA0mqf5BdXXiO1B8OM/6If9GXkKA2Hj+6mrhl1tyw8BHPjsYfz/05cIlyg140r4XmOHCq7WYtRQ+zA==
X-Received: by 2002:a05:600c:44c9:b0:3d0:8c4b:b76f with SMTP id
 f9-20020a05600c44c900b003d08c4bb76fmr10388954wmo.131.1670312284607; 
 Mon, 05 Dec 2022 23:38:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0024245e543absm10699596wrs.88.2022.12.05.23.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:38:04 -0800 (PST)
Message-ID: <ee6de15a-ebfe-a9b7-1e4f-1b8ded70ce5d@linaro.org>
Date: Tue, 6 Dec 2022 08:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 13/22] tcg: Move tb_target_set_jmp_target declaration to
 tcg.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 05:17, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h            | 3 +++
>   tcg/aarch64/tcg-target.h     | 4 ----
>   tcg/arm/tcg-target.h         | 5 -----
>   tcg/i386/tcg-target.h        | 3 ---
>   tcg/loongarch64/tcg-target.h | 3 ---
>   tcg/mips/tcg-target.h        | 5 -----
>   tcg/ppc/tcg-target.h         | 4 ----
>   tcg/riscv/tcg-target.h       | 4 ----
>   tcg/s390x/tcg-target.h       | 4 ----
>   tcg/sparc64/tcg-target.h     | 4 ----
>   tcg/tci/tcg-target.h         | 4 ----
>   11 files changed, 3 insertions(+), 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


