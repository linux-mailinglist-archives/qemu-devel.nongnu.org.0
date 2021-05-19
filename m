Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366063894DD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:58:23 +0200 (CEST)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQSc-0003QU-9W
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQQl-0001bC-Qg; Wed, 19 May 2021 13:56:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQQk-0003yQ-7K; Wed, 19 May 2021 13:56:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id a4so14978366wrr.2;
 Wed, 19 May 2021 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t4Kwb+iEZFHI2wd/Q7LeYEnxIg2Cj9YnjFHdai+EliQ=;
 b=UJNL8v9PJS1ovSKZjM9H9pGIbl3nM9iFp8i2Rj5CKZdPEuIkcdMMxjAWEOL0GalgV4
 IOXd3z66BUf9DBPN19gGNNPeup+jHNVFZ67/YHz7mQd/s07Ze3rvU4QMY7pCmj6oIFjM
 4OEAi4yatPPfqzerzgvoLi2WcG53Nlqk9GauyaLqtUMjGVecj0Rh/k+mHO96o8PXPoTA
 /RZEDkBka1pTOlU1ztXzwD6Yjstk3dcYDbTqvXZeeAcCeoAKQ+3y9KvXeRriRmTOnZPt
 uqsBLal+N+USpinVw1cst1OQTm8H7C9s4wIUBkz0LII1X9I9dbtt92tBP1EiXJarWamV
 0fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4Kwb+iEZFHI2wd/Q7LeYEnxIg2Cj9YnjFHdai+EliQ=;
 b=RHtwOa+Ny739oGoExZ7ZkFv2SMyJ9UMYBjkxWjic0m4B/xOWVJPnHwz/t2ATfiq9wT
 sHEV2eeCsZfpUt8WYutw8IwcTuTWj3CFjKViW8mw+9dmzHbzv1lMgw4JfGnGLYEKc1Ok
 LJprXPZ2G224EqX8NpA7VBrS5nR6StYB0J0Y/e8AUHiVyP/881pbXobV2O2wPUDVjoBQ
 zLCcVqXPpI9Gth6K/Qi42TapHC4R5sRrfVvL6qsc4/Fs2apvxxP4jrKbG4pRqkbR+sPI
 SMBuzzfP8r7oLHPmsaKRF5P3h2FcuM+RJ0A8rFQ0VkP1zNz8kf4aeN5hu35p2bO1qOxa
 nW/g==
X-Gm-Message-State: AOAM532nWupqSxbp3inRcjuQlcwoPt8Q7sOUXdw50Zea8VfBvZbaOYo0
 0LnDwdK3LU/w4KHqBtv70Q8=
X-Google-Smtp-Source: ABdhPJwovpb5zvlOCbeCZsbqFPXH/xal8mkfqK03QlMVSsuPA89Jckb7NEEbk/1zvfPBazu10pu43Q==
X-Received: by 2002:adf:fc44:: with SMTP id e4mr140638wrs.23.1621446984370;
 Wed, 19 May 2021 10:56:24 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r5sm57126wrw.96.2021.05.19.10.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 10:56:23 -0700 (PDT)
Subject: Re: [PATCH 2/3] adc: Move the max111x driver to the adc directory
To: minyard@acm.org, qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>
References: <20210519000331.3690536-1-minyard@acm.org>
 <20210519000331.3690536-3-minyard@acm.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f50724bc-abd6-e50d-d447-6086da2a1fa2@amsat.org>
Date: Wed, 19 May 2021 19:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519000331.3690536-3-minyard@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 2:03 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> It's an adc, put it where it belongs.
> 
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  MAINTAINERS                        | 4 ++--
>  hw/adc/Kconfig                     | 3 +++
>  hw/{misc => adc}/max111x.c         | 2 +-
>  hw/adc/meson.build                 | 3 ++-
>  hw/arm/spitz.c                     | 2 +-
>  hw/misc/Kconfig                    | 3 ---
>  hw/misc/meson.build                | 1 -
>  include/hw/{misc => adc}/max111x.h | 0
>  8 files changed, 9 insertions(+), 9 deletions(-)
>  rename hw/{misc => adc}/max111x.c (99%)
>  rename include/hw/{misc => adc}/max111x.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

