Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710CD53D701
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 15:23:34 +0200 (CEST)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxTkb-0003cx-1D
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 09:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxTip-0002s7-7p
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 09:21:43 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxTin-0003Jc-RE
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 09:21:42 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so13853301fac.12
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cNqrNJk93Oju4X8LBxiokrZp9DD1lor/HMEq/9nEafQ=;
 b=SWTv3KoK0A/QhGtGh3F8yO6XOFXOLgU2FEFDIG6aAgrqaBQm6WWtevYJgpc5//vs1N
 1LyeaCe23Qwa/3c7WnHBKz667cZR6ybp2XxiepBSTmZBaPfYrAi9iPXf5NDj+Pe0uz2h
 KgcEVXIeCSM/6k+qqOzu6is/riRgzG0M1CTfTOX3qODb23jtddmaD0Cdh270Kzy4rLqF
 bTPFhm3zrDCehdZAXA7Y+jODMQD3qUtFc7jlZ8uRUomtiXg8JAUSSfuNZxHLrUrR9Ya3
 LoeczccD6paXRKIHg4NrYkm/XPLkh+N2RBcPyEzCDz/X79wRZZl+enoDfVM31mgVlze5
 jXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cNqrNJk93Oju4X8LBxiokrZp9DD1lor/HMEq/9nEafQ=;
 b=YTcnGLFglNmotEPvv9MtyLXVRysmqnw3axCyMUEIa4s6P1P5ImWpAbf30XlocMb8n7
 1/FTnpmLepjYXqcBY6FTz4+JPiMQHJl7VZek0sLg7UFWRWybVmrwYwiDZA+iD+c2klRE
 y8MlGn2mZrpvSnl8jSBNu+UgPPRTcbdjFLD8fwgbaT/OOSY13jWF74QqI4a2m5ZyN01v
 7OntHwIoWTNMtoLZf9kzLT5uqq9825vDA3QBxqo1ViMJ4SdBhkonYnl6tw3i2WIpjMhZ
 yAitmS37kVGJQ4Yvu9d052VC3WuaNPVd32LtRVBPTLIhTPk6EviPbre/abD7d9wimXLK
 O6RQ==
X-Gm-Message-State: AOAM530QHYNX8nlKlPt57wwVP1mD5C3mPSf9DmNYmfE769d4cFlMn7/c
 NShdMARkQ+XPk85oM8rnAJ9dc2FyDdo=
X-Google-Smtp-Source: ABdhPJz4xNl7dygrjlU474vi8b1P24BnhhC3z/EDXD3YP7FfulnzAniGxp+dd+hd2uIx3JjJp4Tk3g==
X-Received: by 2002:a17:90b:46c6:b0:1e3:524c:7f94 with SMTP id
 jx6-20020a17090b46c600b001e3524c7f94mr22648413pjb.177.1654348889455; 
 Sat, 04 Jun 2022 06:21:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a1709026f1000b00166496ba268sm4402902plk.285.2022.06.04.06.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 06:21:28 -0700 (PDT)
Message-ID: <32336d4b-b614-53ee-0f7c-0b7f010cb6aa@amsat.org>
Date: Sat, 4 Jun 2022 15:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220604032713.174976-1-richard.henderson@linaro.org>
In-Reply-To: <20220604032713.174976-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/6/22 05:27, Richard Henderson wrote:
> GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
> cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/arm/Makefile.softmmu-target | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


