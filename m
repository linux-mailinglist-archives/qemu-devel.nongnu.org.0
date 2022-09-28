Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BECB5EE0B9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:41:26 +0200 (CEST)
Received: from localhost ([::1]:47332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZBc-0000hu-1k
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYUA-0006py-BE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 10:56:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYU6-0001fn-GQ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 10:56:29 -0400
Received: by mail-pf1-x436.google.com with SMTP id d10so11631192pfh.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CaR9fjjX2uzJJ1k7U7k6BvuYj2+1SK16n57ftUTSKSc=;
 b=xNBRzNtv6KEajKns4Jegal+1PGNhP9kLtbRIRQfgqLchYZZ8G5qEFQzT4oGrByPdA9
 8cz1duGEK+Q8TIzGLLau3haBiq1y/DrQntqRCVrLcCl45SPsqG/AhEPLa02d/ubnBICC
 AVnKYuDjHbls+VsGC7aNLCZPcmdtgKyDLVwCMnfz+LUvdfR/EOWXWDvBZggKIHVLw3CP
 6eozOVDjOVTFJErBUhcsd/EmgRLcGkM80Oss/a2QutLZNxjWmIAK0vRsTYysoIAs9eyE
 01mpXN2/MpMzuRcnPR2yK3QACUU4VYTInUSo4jElFXfhyadGAL57GO/3qt+B92Pa3+bF
 sVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CaR9fjjX2uzJJ1k7U7k6BvuYj2+1SK16n57ftUTSKSc=;
 b=QIltSt5chYstXYA9lZEcRMZvs1nh8ft1BgSWYlSV21LTKqqhtYiHAmB8tVYbY+iQX6
 Odx9YoHMNv9hnyhn1qlotrxmv56qxjkRzLLSCiw/waFVL+QardzNOHCWMkk/RRQ3ZT5V
 lCuGsGYhg8FXEeK9yG8o9s1iFqmBAD7TLldvEAzWFZBppACwpwmSzXOx/BXlVgeP/3On
 onDz2Agva9vbZ4NMIiPj9PX887gKw+bCFicApXF225AmyPCXEQF04VAWBAIVSafd69fz
 fd9Zy9tV5wrayYDu5y1myAPN5fPQZc5lfmdVakXAZVvdIEAGvEyXi8R9/ot92WAHmG0S
 Jg5w==
X-Gm-Message-State: ACrzQf3dajHz6RHY7AO8KgSuwckvP5fGf/+DnsbWtR5aIf5ThRmWzZS5
 ABpz4Fbre9jCYhVwDx4uUTepaA==
X-Google-Smtp-Source: AMsMyM7xVnSjOO1/L50ZDuKhsscxvAdEgRty1/598p83EDOwMC7Up9ARCKgX2ZYMGH00wF5QluJgrQ==
X-Received: by 2002:a63:4143:0:b0:43a:20d4:a438 with SMTP id
 o64-20020a634143000000b0043a20d4a438mr30029896pga.452.1664376984864; 
 Wed, 28 Sep 2022 07:56:24 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a170902ce0c00b00176e8f85147sm3823274plg.83.2022.09.28.07.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 07:56:24 -0700 (PDT)
Message-ID: <e2fa6d88-2457-983d-43da-dd341eeae693@linaro.org>
Date: Wed, 28 Sep 2022 07:56:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
Content-Language: en-US
To: Jerome Forissier <jerome.forissier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220927120058.670901-1-jerome.forissier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927120058.670901-1-jerome.forissier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/27/22 05:00, Jerome Forissier wrote:
> SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
> it with ARM_CP_EL3_NO_EL2_KEEP.
> 
> Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This certainly looks right, as how else would EL3 set up EL1 as desired. I suppose this 
error comes from a slight mis-read of R_RJFFP, in that SP_EL1 may be considered 
"associated" with EL1 and not EL[23].

r~

> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d7bc467a2a..328d252a84 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4971,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>         .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
>       { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
>         .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
> -      .access = PL2_RW, .type = ARM_CP_ALIAS,
> +      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
>         .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
>       { .name = "SPSel", .state = ARM_CP_STATE_AA64,
>         .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,


