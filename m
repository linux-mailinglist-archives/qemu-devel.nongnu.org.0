Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEA63D302
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0K8V-0008NM-8f; Wed, 30 Nov 2022 05:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K8T-0008LH-PA
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:16:13 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K8R-0000Th-Tt
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:16:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id o5so17282009wrm.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h/8wnEbqdCtS69VTQTVatwt2S9qqAJXPkkg2X/43sdw=;
 b=TuVPDwfBuOWe7J4cHHxuOHLaeAWrpe6T+YZ4jH4UabisEn+QR7Ib7Dl0pUzkvyuMSb
 OYTfXJw4xpX9idgZ0tEbTJ/gxVre1cuBPr65Lu5AJXEgqgPeqgwsg4FE5iTtGUp7jxTS
 vkPZMaZVLJw6VleFLJT3p5Ja5SaeyPkNw0R/h32gD485oZwtiop6vIxP94Hbqg9aGUc9
 tqjggTga9+nwWrSSgOsOPWY6zwkid/2+YDgMg4Vc5UA/jnPy6vF62HukwlBaGW2XhvHn
 KZmlu9xYFOhjs1IxU3wimHIpJSHkAVFJ/NazqUh7WEOBh3V8Ld6aWe54iZfiSx3NsjOA
 G+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/8wnEbqdCtS69VTQTVatwt2S9qqAJXPkkg2X/43sdw=;
 b=Pa8ZIQrBS6od6YQJfGvdqYHseSGLKlNZc4WI1o2/RKJGEaFq6ssUko3hAvEBUX4M2e
 j6hcA28Bl2++Zr0Ddj6Z+zsqsZyb6uCWApzzHPwwTJTy0aRSatsdvAYqgC5mIu7HYJCn
 8qc3Sojgq+MKgUuDuI/9BvmbooNTiA//UqhDbzb+CBkVvSbGL6GLe3Y6Tdff7DSj/4Nc
 X/k5F3xlNch0fPrxHvqAhFTVC9c4LOJbtJl4fauOge9rwnWQwWQBnL6psxidK+YFlCbP
 ZzZzNS5YJMVA8MtkRgo86jC2SjRCmc+oOpn9euB7X5KfLj+OTxUCycokrXcf/wgdr0YL
 E3wg==
X-Gm-Message-State: ANoB5pkVfczkrpHJVv5Z2PDI+3kAPoNKNH3D4VY2u18cxKj+XlsJJfQP
 yUUp0+w23YyCT866p6GaB8dVng==
X-Google-Smtp-Source: AA0mqf7SEIusgK/aLtsjKyv+Tc0VxjhFC2prloqmDHaBXg4dunMVZ/209TkcH7x+IN9LhFwKGBTA1Q==
X-Received: by 2002:a05:6000:78d:b0:22e:3d63:80bc with SMTP id
 bu13-20020a056000078d00b0022e3d6380bcmr38985446wrb.30.1669803370553; 
 Wed, 30 Nov 2022 02:16:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c154b00b003c6f3e5ba42sm5711623wmg.46.2022.11.30.02.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:16:10 -0800 (PST)
Message-ID: <1924e59f-045e-6015-f3cb-41417f0964b5@linaro.org>
Date: Wed, 30 Nov 2022 11:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 2/2] hw/misc: Convert TYPE_MOS6522 subclasses to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
 <20221110143459.3833425-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110143459.3833425-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 10/11/22 15:34, Peter Maydell wrote:
> Convert the various subclasses of TYPE_MOS6522 to 3-phase reset.
> This removes some uses of device_class_set_parent_reset(), which we
> would eventually like to be able to get rid of.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/misc/mos6522.h |  2 +-
>   hw/misc/mac_via.c         | 26 ++++++++++++++++----------
>   hw/misc/macio/cuda.c      | 14 ++++++++------
>   hw/misc/macio/pmu.c       | 14 ++++++++------
>   4 files changed, 33 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


