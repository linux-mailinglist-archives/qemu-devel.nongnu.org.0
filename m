Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C95697FB5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJtF-0000Ny-Gn; Wed, 15 Feb 2023 10:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJtC-0000MO-9D
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:40:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJt9-0003MS-Gz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:40:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id r18so13622473wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vjoBX4qV2xD6CRgZdzUC4zmWFo4z43cV2W3yUgOrrzs=;
 b=BQS8rRbRvflwbndY60CwKOq/H2G7I1r9tijg+SMgjwbY6FpX2KMvWg+uEu3SFCTW5M
 LWBkntmt7ROLz8eKVqvOnxhMjuzUAYJyPSMUI+nC3ANO0ZNkJHBUN7qO2JIqoiipcwS9
 4c3y8vVCSHL3Nw9TELXrLTTGtBDM4cYl+d58LI+4FvqJ2+44kEn2/Nl2D3qQfVTeGAao
 qf8qM8u+TIgobezzYwubI1zHR+wvvSK+MwtWH07k1ZzoMYMtuOD5uPWg+lKYasrcpv2d
 +sGaMdS2HqDppB0M6dMr18NLMWARbVbUoPhW7D6K2HCjMkzw5LQcMdMAfGgKfdZ9ldGi
 QWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vjoBX4qV2xD6CRgZdzUC4zmWFo4z43cV2W3yUgOrrzs=;
 b=Mb63mKLxU8+tlTc7eoSjaxZEUyxpTUCpqCFIqU5urrwXHfG39cG1m4HD+BQgaAVSxN
 o555yJrEq6s9tEnCjEKa0Pd3vrSrmzvIFaVGEVpfW7WuVtst+nIZN1YCcbKVyJLTTowT
 Y0geMNCfd4GhnBONFV3Om4l62GwQ3jTOoFkNsRNvqoMKkimFlDwylH2v1w5Z1izf8CqF
 ItibPz5MbKrgjrO0tSyeAr4HVFOGbCg9FMwcOjooEwVMjwP+iWwr9tauw38eVnsudHUH
 ZE37j0mxtyVvGp7Mu1QVIyE8CXM9ULRSxqaqSW6uW6hUoN0vszh3fWzXZL1LlAgOVtpv
 HiFw==
X-Gm-Message-State: AO0yUKVLg097gC6hgCm392KLIFFEH2wTtxsahXDjYSF4WuyzRke6RCef
 xqI9KryDmoveJHPrHlaKnUp/6cOoiH/2xY0a
X-Google-Smtp-Source: AK7set9HftbrxKwOu7wkJA7sYcZ/SksI61PPqClCbWqZ47mtYWWje1N9O0fP/MBZvTuRxIA+CxfQBQ==
X-Received: by 2002:a05:600c:1714:b0:3df:f71b:3f68 with SMTP id
 c20-20020a05600c171400b003dff71b3f68mr2229412wmn.39.1676475605726; 
 Wed, 15 Feb 2023 07:40:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b003dc4baaedd3sm2753872wmo.37.2023.02.15.07.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 07:40:05 -0800 (PST)
Message-ID: <51f06855-6adc-65f1-2f38-4587e2eca99c@linaro.org>
Date: Wed, 15 Feb 2023 16:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 14/20] hw/ide: Rename ide_init2() ->
 ide_bus_init_output_irq()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-15-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215112712.23110-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 12:27, Philippe Mathieu-Daudé wrote:
> ide_init2() initializes a IDEBus, and set its output IRQ.

s/set/sets/

> To emphasize this, rename it as ide_bus_init_output_irq().
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/ide_init2/ide_bus_init_output_irq/g' \
>          $(git grep -l ide_init2)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/ahci.c             | 2 +-
>   hw/ide/cmd646.c           | 2 +-
>   hw/ide/core.c             | 4 ++--
>   hw/ide/isa.c              | 2 +-
>   hw/ide/macio.c            | 2 +-
>   hw/ide/microdrive.c       | 2 +-
>   hw/ide/mmio.c             | 2 +-
>   hw/ide/piix.c             | 3 ++-
>   hw/ide/sii3112.c          | 2 +-
>   hw/ide/via.c              | 2 +-
>   include/hw/ide/internal.h | 4 ++--
>   11 files changed, 14 insertions(+), 13 deletions(-)


