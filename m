Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC10B6236A3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:35:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostev-0003Cg-6X; Wed, 09 Nov 2022 17:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osteo-0003Az-4I
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:34:54 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostel-0007uB-Bd
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:34:53 -0500
Received: by mail-wm1-x336.google.com with SMTP id t1so63803wmi.4
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y8Uo0uhrWutPix3iuBlbIfqekLrNPbu+FKvXiVRHEwE=;
 b=zg9bxLCtkpokaGL0azD8edzgKsJQHRpsIQPYJu1hKrcTOTVm7cTN5YZv2FYiDyi5j5
 Do2ZqIHckkpAxCm90g27W6Zu1D6d6rlAzRocr09y6Yup42nlC+LnuVgzkT9Hw3CdmK95
 0lC89CJL+hlp3HDyJ/xYHOutRjhzdaS0Z0RUhe2JdF+5oyr21S5VGYUq2LviueBbnLJG
 tUtQa6dltKEDkCIL3tFrseNuWgNrwILJsHbMmKxqq8NRGAdjag8rRRT74kkko9SE68Ik
 n4NSobBhZ99MrCRuzA655vm+0MaHShyqBTbZlOewL1l23a4ywdtuXXdL9oRkLbI0s1/7
 MTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8Uo0uhrWutPix3iuBlbIfqekLrNPbu+FKvXiVRHEwE=;
 b=RSuadaf+SJWef9WNhJif9Ndh0ZhCEoddlpH07Bx/m1Ijnjjwm+u+tQyR4RFHEnhk05
 lp5n6D1OqrEQEFcyrIP3gtfxztxAeUxztKSV3W8xj/EEiOZIyEfQ6Mz9mXSG3aRk46Z2
 hAPY7xzvTbLV6PbCdFFvwo70yRXbv+51qExyPQiS9FtDW1DUbyPs2d9woEWgqUaMyUla
 tSKnk5Yk2MVdhTktllGqNV1x7VvPbYCWWV5NorycwUhlAmG9GB74GO7FDBmeRx6ZIFeN
 FX0jVPEB4vRwPUZbdWSEZCYdwJ7/APEwugV0Gt+MK2TRIAfGVoEWvloxljXY7KimxLWa
 G0yQ==
X-Gm-Message-State: ACrzQf01NBABvgVt+piNa2JDCRoqkI2JWbk+kriB39v2290Rxr6rlNU8
 qQY6g850wweH/GcBMOdfz1vYgA==
X-Google-Smtp-Source: AMsMyM4c18qltRW+fS3aMz0bs+FsrGHITOE0Igc6dRoSZwD4B+4AwSZ2RQhCMwVZO40DVYD+Y38kig==
X-Received: by 2002:a05:600c:2242:b0:3cf:4ccc:7418 with SMTP id
 a2-20020a05600c224200b003cf4ccc7418mr51279354wmm.191.1668033289557; 
 Wed, 09 Nov 2022 14:34:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c1c8700b003cf7055c014sm3447336wms.1.2022.11.09.14.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:34:49 -0800 (PST)
Message-ID: <ccb0c88f-ae91-f21e-a9a4-ff9d33f39010@linaro.org>
Date: Wed, 9 Nov 2022 23:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 1/2] hw/input/ps2: Convert TYPE_PS2_DEVICE to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
 <20221109170009.3498451-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109170009.3498451-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/11/22 18:00, Peter Maydell wrote:
> Convert the parent class TYPE_PS2_DEVICE to 3-phase reset.  Note that
> we need an 'exit' phase function as well as the usual 'hold' phase
> function, because changing outbound IRQ line state is only permitted
> in 'exit'.  (Strictly speaking it's not supposed to be done in a
> legacy reset handler either, but you can often get away with it.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/input/ps2.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


