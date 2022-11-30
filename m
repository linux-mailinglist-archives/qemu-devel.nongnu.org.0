Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610B63D354
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:30:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KLd-0000ww-Iz; Wed, 30 Nov 2022 05:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KLS-0000vB-KQ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:29:38 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KLQ-0002TH-0P
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:29:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o5so17337330wrm.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yujB5tnKoYtUChUwU2Maf/O7hOsAZ/kbrK9xzrgnC70=;
 b=YBWAC0EWLsThkKSXxQpyfxRJaNI7xLZZJwgLBlvyMFuVrDxJ1lN/8vdJCk7FAUTAY6
 fKgfylP3y14+C5d3J1GMFnxWoQth4tFtUO8UrcCkYCGeldJYfq98Znx/TRDY6MKBvfgg
 MkkDCls+A0Dnh/tPePluOjMZboEH7u5ZqwQPOu1LL30rmEKGwzvDBDzzsiLHr9oLrCFZ
 gM9fjLca+X60k//0D/i1Wzz5zU2Ix5haFRAeN81Rzy6odmbnYp+kGx62bj7ERJwHYifj
 LkvRq6LL+Cra3mtGeZohcUaz/QnLDCQIrDu78aEx0SP79f2GJ9AmY0g01sdneUa+VzDv
 6vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yujB5tnKoYtUChUwU2Maf/O7hOsAZ/kbrK9xzrgnC70=;
 b=U9z2D1AO0wAy5Rv+0vWeDwj57Nwgx8yf0hXJizJc3BY3AQAIkgfB+4j6eKpm+9A34h
 orB1Lphab2B9oTFseUkMgZ0I1DC9ePbEkrWekcyX9uxfNnHyZnelksxkf3h8ChwieyyQ
 7LrnUaC74inyibEkgQo+18ew/8tMbEButxsY83910pAWopveIZ/7SnqlY0vgNFxLpIMc
 F2t9aGlMQQy2yAADTXs66JRO2JPbDQ8c/quLiKBizwVeWwUXbi2CJvO4VaQEZGFvCumS
 MQcvSwCyfp0NUaJz0ftS2sSQlpKJj6Qd9rrXA46PNtd8VdagAxOqyyPxJpiGWO+gyhCA
 tM2A==
X-Gm-Message-State: ANoB5pkbQSDEHnGlZJVHfjLyzAGS+J4oKwlO9muYIR6fHpYnItWLCWPL
 DGr4ggHMl4s7bkQyUdz4jIlBMQ==
X-Google-Smtp-Source: AA0mqf51jokd66F9CdgP5XxyEfLICpN+2QJCwaa54t7Ot7i7KSd2qhSRPm/ibIec/rNWU6wZxKg0NQ==
X-Received: by 2002:adf:ffd2:0:b0:236:59ab:cf33 with SMTP id
 x18-20020adfffd2000000b0023659abcf33mr36893351wrs.568.1669804174609; 
 Wed, 30 Nov 2022 02:29:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003cf894dbc4fsm1482986wma.25.2022.11.30.02.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:29:34 -0800 (PST)
Message-ID: <555fbaf6-d750-66ba-cdd7-46f8612b4bd2@linaro.org>
Date: Wed, 30 Nov 2022 11:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 4/9] hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/11/22 17:14, Peter Maydell wrote:
> Now we have converted TYPE_ARM_GIC_COMMON, we can convert the
> TYPE_ARM_GIC_KVM subclass to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


