Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E46321B2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:16:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5i0-0003UQ-SX; Mon, 21 Nov 2022 07:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox5hz-0003UF-6g
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:15:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox5hx-0005u3-I8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:15:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id z4so4976457wrr.3
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DbLkE+pblZyD7zevhZq52aLDovUduBV72ZR2GDf4YeM=;
 b=B835J0aJm3qZpuy7d5g0A7xFXFe88NwJae/ot+iMcU5GNvxQ+ujM1yk7fOu6duwjvC
 Fy2bKjMb/g9yqSvuvkRIfO9mrEOAuMfh90je8x6Mx6P9PiIGdIfgcAeI3T9RDECjDRE/
 HDwU3SjG3bzjnKFjfhlNm4QYgLNI310RNy8UtxNZ+rIlKiEtqeD8kirllV0pynxADQEd
 ok3sj+eQXZ8Hy5bqS73bc1Z4J5hC58JCAHoKWrlT+Iy7V5biTiVWw751/b9xr6LkAWJP
 MZnqlnWZUftm2aiJ+itNaFExm79oIOvyteXUkKSB6J9MgKVrApll9GROKnQb3lghidvP
 Fg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DbLkE+pblZyD7zevhZq52aLDovUduBV72ZR2GDf4YeM=;
 b=C5elGJ95GkCxYiRfSBGt2SpdYQLlMXXeCHulcmjLq0osEzRDY/e0NXXXWqZALPOPnT
 lIZ3iBsbo1GYkMr1DKqRjkMJ5mNDvBt8qHr2Bo6xj6R3Pb12XbB0SG7YMszrRxsZrJOS
 Ro1BVpKTIeA2rJ8Kd2+N7t/B/FNMrSaa1yj92CfMMjwTYn4WI4L137F71jf9ttbSnzU3
 WU7t+gIU9CYpo8GAlOHyytf+mybNnTn9nLXcki5Or8bhnNgiKjcordrXlYa34ETUaF9i
 3p3wIqMtUV8fukN/tz5b1IWFtC2a41HCAzKE/Mg0Ay+Nu+n/U83kj9RZUyQDIqYVm8VR
 nnhg==
X-Gm-Message-State: ANoB5plw5VX6k06+m5S/Joism8hIbyFChV+OwfvETFjEYq6p6x3dQS4q
 PrAdjvqAoW1ZGvd54siizuC05w==
X-Google-Smtp-Source: AA0mqf5k3HFCtzMHZ1qi2/8G82X+4U6XVvgxYMZg82lxtokQsHSvuVCR9Q85EqVipSglNSFRLj2jfw==
X-Received: by 2002:a05:6000:90f:b0:241:cfbc:95a4 with SMTP id
 bz15-20020a056000090f00b00241cfbc95a4mr746308wrb.453.1669032926767; 
 Mon, 21 Nov 2022 04:15:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003b497138093sm15051489wmb.47.2022.11.21.04.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:15:26 -0800 (PST)
Message-ID: <2393a11e-ea0a-164a-fe4c-0c6460f0ec97@linaro.org>
Date: Mon, 21 Nov 2022 13:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 01/29] include/qemu/cpuid: Introduce xgetbv_low
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Replace the two uses of asm to expand xgetbv with an inline function.
> Since one of the two has been using the mnemonic, assume that the
> comment about "older versions of the assember" is obsolete, as even
> that is 4 years old.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/cpuid.h      |  7 +++++++
>   util/bufferiszero.c       |  3 +--
>   tcg/i386/tcg-target.c.inc | 11 ++++-------
>   3 files changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


