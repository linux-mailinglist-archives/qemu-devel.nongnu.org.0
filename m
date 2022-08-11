Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D1590568
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:11:10 +0200 (CEST)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBi9-0003II-Rr
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBZI-0007o3-GV
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:02:03 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBZG-0007H9-6d
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:01:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id t22so18238970pjy.1
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=KNYubXLlUp3JSG0xR6rce6fOtBsj2gWVJouAGy+hW2k=;
 b=MlyiYv7EYoYtWV4vIW6b99Cq3oaGhA3lAM3fwjGBolS8hnHkURmP6wOqlkER4F/+Bp
 NGQIEZc4OyvRZTjRMSqatfhMZcWW65SDmll7e7vnKWorwh5YRc5Pvg1BlxyuJhHhkBX6
 bFZfq2I7e0qomQIx9r150mALDP4zrk+a2PZVdOdGioMNxqV3KshgbwIH21piFf7Ph4EZ
 ch0quYsCHjyK5npvrGHu5Q9/FP3p869dLVWMSiMuC4CGBgYLMlCXMf+H4gH3WkRrUqLU
 m97ATFIMfHQciHLsySgZ/jkOze1EEwx/PgjxkCi3T40NCgPPXGkhpGW8rErMJAjimmc4
 sJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KNYubXLlUp3JSG0xR6rce6fOtBsj2gWVJouAGy+hW2k=;
 b=Gyf1FnG/NN+V7/ofzGFQu4OVzEj8Nce5qlqvq4wV9CCHsAKqNE28bInvUBAg0GBFT5
 d+vlUCQAdkinBRMBNLS2ciR6258w8lF4d/GZnItgjdYnwVwWiw41B14IfOnsr6YO53Vt
 Jn6dz6hr/dosaNDZb1sQplVkNFqDVAx4eF/6JJSmT6Z6+k/ep+uNoONDXwgdLc7sYwMh
 SS155IlKSTTbfSvP995huN/4XS1ddMUXmPDATGlOH8YGdq3Q8X4a0BD2/PE4JGnkx3kW
 jBA352KbSE4Av/d5HbO2yAKUBNAIiWTakTySsgSk1oxhttWXZooERZ/LOHIzHwFiCEa8
 szFw==
X-Gm-Message-State: ACgBeo1ozVXgL2PTfRrg+nzjq9BcGgLhjeX20S0coYueyvu6FkHcePIc
 BXc7jw1wx6n2YWZi3nvtEsKFDw==
X-Google-Smtp-Source: AA6agR4tJCanXoPPjywG/pntmGFrIyrCjIxYTghBQYtIjARoUoESliETFnKv5SDb84WOYX9eD8ZcGA==
X-Received: by 2002:a17:902:ef46:b0:168:bac3:2fd4 with SMTP id
 e6-20020a170902ef4600b00168bac32fd4mr131085plx.132.1660237315416; 
 Thu, 11 Aug 2022 10:01:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902be1300b0016bdf2220desm15015411pls.263.2022.08.11.10.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:01:54 -0700 (PDT)
Message-ID: <08433cdd-465b-eb40-0177-6de47475d29c@linaro.org>
Date: Thu, 11 Aug 2022 10:01:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] target/arm: Don't report Statistical Profiling
 Extension in ID registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Zenghui Yu <yuzenghui@huawei.com>
References: <20220811131127.947334-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811131127.947334-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/11/22 06:11, Peter Maydell wrote:
> The newly added neoverse-n1 CPU has ID register values which indicate
> the presence of the Statistical Profiling Extension, because the real
> hardware has this feature.  QEMU's TCG emulation does not yet
> implement SPE, though (not even as a minimal stub implementation), so
> guests will crash if they try to use it because the SPE system
> registers don't exist.
> 
> Force ID_AA64DFR0_EL1.PMSVer to 0 in CPU realize for TCG, so that
> we don't advertise to the guest a feature that doesn't exist.
> 
> (We could alternatively do this by editing the value that
> aarch64_neoverse_n1_initfn() sets for this ID register, but
> suppressing the field in realize means we won't re-introduce this bug
> when we add other CPUs that have SPE in hardware, such as the
> Neoverse-V1.)
> 
> An example of a non-booting guest is current mainline Linux (5.19),
> when booting in EL2 on the virt board (ie with -machine
> virtualization=on).
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think we missed this earlier because it happens not to be hit if
> you boot the kernel into EL1, only EL2.
> ---
>   target/arm/cpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

