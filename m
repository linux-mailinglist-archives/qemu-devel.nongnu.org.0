Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F38695A69
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:15:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpWL-0000O8-LQ; Tue, 14 Feb 2023 02:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRpWF-0000LN-7H
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:14:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRpWD-0001CC-IA
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:14:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso4521970wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ierT4wdtGHXa/Nb4n4hLk8Jv0WVfs33dwzfqJGOAGGA=;
 b=TsDpyX8PLS3EcxhOGM8eZVY00HHwMKtR6OzXF+YUvepSOJyb/bmwBc6hMcEE4WF17W
 OMBQmfLO/0fafiTAOVliHElN6YvQnIVf6Ffp93nZZstEX27jNaeyqVzIBSUk++sOIHN+
 Nmyrxn81hX5Bd7T6SM6kIcxeWRH8i8NuxeWKRBJ1yLzKZO4OjZQRJISedRKQxWuIhPDh
 lg65sDirIamr7xGe91Zx0tAirDU5ybtJ7dbk05bqEXEDZifLs5BXqZ89gjF/IAFGovuj
 3cW0oFD+yp64saWOf2GncOeKUNMf8R5aJSOkaAtHS/95XbMBTO+zRgmgXSfpEGMkxAWd
 00Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ierT4wdtGHXa/Nb4n4hLk8Jv0WVfs33dwzfqJGOAGGA=;
 b=F8Pd9Tn/yUinDilZIFX0s3k7cjVarDeHJW5tZ9tVpyzcwwNxQ4W3MygNMB1aZzb1gP
 NkrYCAplqBttNH/csHXa3Pqi85J78NgxuooHOveAXY8ElknNmic191cLhrLAr9IBOjsK
 yGGbc8uITxfAD8l9msslkeoUda9eqBT2pqI1Om1HBOecFU8GpU+ZAQbqHOmCVhfEeN+8
 cIR0rFy7Qzp+oeLTZUZz63W3Noz5LLrMPoErCdvwOWL/2LbNvEcIx6pHh+eVChgyRUyn
 ADjPdikFVWvE8i85l+RqbxkAXDyP1YnekSP1rP5GMHvBjxB1WKhh1D/E00obs8kPK6vk
 /pmw==
X-Gm-Message-State: AO0yUKUz6UF78kcXLwZwXzn/SUF/iROtrY2mqEUzeqNDlgXwaQoe56To
 qgkZ7rDeRqwX2EIecat44Dkxig==
X-Google-Smtp-Source: AK7set9UB0DKGnXiKStY1wDPuHK8XP4kuubiclsRC4yTcUutwrT1+YC65fECJe7BU+aiOXu4QiP/bA==
X-Received: by 2002:a05:600c:448a:b0:3dc:5a13:c7d1 with SMTP id
 e10-20020a05600c448a00b003dc5a13c7d1mr1084062wmo.16.1676358863889; 
 Mon, 13 Feb 2023 23:14:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dc4480df80sm21568607wms.34.2023.02.13.23.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 23:14:22 -0800 (PST)
Message-ID: <f2184bc0-6f02-4719-3f43-221d641c7ec6@linaro.org>
Date: Tue, 14 Feb 2023 08:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-5-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213161352.17199-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 17:13, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert definition.
> 
> Setting the rnd variable to zero does not hurt anyway.
> 
> ../target/ppc/dfp_helper.c:141:13: error: variable 'rnd' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]                                                                              assert(0); /* cannot get here */                                                                                                                                                                                    ^~~~~~~~~
> ../include/qemu/osdep.h:229:20: note: expanded from macro 'assert'                                                                                                                                        #define assert(x)  g_assert(x)                                                                                                                                                                                                         ^~~~~~~~~~~
> /clangarm64/bin/../include/glib-2.0/glib/gtestutils.h:235:49: note: expanded from macro 'g_assert'                                                                                                                               if G_LIKELY (expr) ; else \
>                                                  ^~~~~~~~~~~~~~~
> /clangarm64/bin/../include/glib-2.0/glib/gmacros.h:1186:25: note: expanded from macro 'G_LIKELY'
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/ppc/dfp_helper.c:144:42: note: uninitialized use occurs here
>      decContextSetRounding(&dfp->context, rnd);
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/ppc/dfp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index cc024316d5..0b4b280683 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -69,7 +69,7 @@ struct PPC_DFP {
>   
>   static void dfp_prepare_rounding_mode(decContext *context, uint64_t fpscr)
>   {
> -    enum rounding rnd;
> +    enum rounding rnd = 0;
>   
>       switch ((fpscr & FP_DRN) >> FPSCR_DRN0) {
>       case 0:
> @@ -106,7 +106,7 @@ static void dfp_prepare_rounding_mode(decContext *context, uint64_t fpscr)
>   static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
>                                                     struct PPC_DFP *dfp)
>   {
> -    enum rounding rnd;
> +    enum rounding rnd = 0;

Could DEC_ROUND_DEFAULT be clearer?


