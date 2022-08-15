Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C290259314A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 17:08:04 +0200 (CEST)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNbhD-0008Ae-1h
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 11:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNbcI-0006Nx-KE
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 11:03:00 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNbcG-0002AB-9c
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 11:02:57 -0400
Received: by mail-qk1-x731.google.com with SMTP id j6so5674321qkl.10
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4XhTm4tdaUg4zgB/gl4AMNmTQvil5IAMB3or1VBufAU=;
 b=JgW10TmVQLIsA/6ij0R47f38ssm339fX6yHPdShltvPKzBB3pxZ5R3e49XF3SsZzeb
 +AHvr2wv9Zqz77hVf0ynkhldD3WuzyAv+BnQuUeD+mOgXtsRnPuaxDbYQdE7WOqLb4Yn
 Sl72LbI1wRJDiRMvi9Y8uD85cIpMRlx+lEq8igMMTtksHWWccgOk3sL7Y2tELXX5T7jf
 yz7+T1x+S0IK1u5J0wPEuxfbGjUFDisid2ZnE9HLCSSUNNVpCpls4g1MgdoY764vpdFj
 cG1INlW8BktSDYtRY2EQtRGGz9XU+OHtql39JWwav17VRXPyp4K0yUi7F+w/mGnBXmJ/
 Mv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4XhTm4tdaUg4zgB/gl4AMNmTQvil5IAMB3or1VBufAU=;
 b=bH1eCg2jlmrZ2TP7AaSypd5H8r0+2CuRLdcaQfa1bg6un750IJfjB8xTyWflwHc5xf
 BCId4kWOHLV0YnDl0wJEIJtJSIOjNe/xkUgGPBXHhrVOaBJEKs1yEb+wbIl0GNFudc1q
 tRQS34V3i61MdEmVnYyrgKR05DsNzoGeGpnaHP57VY88ernBlXac+xzvKFmaYtsyne0W
 YhYxO/yC+gc3E3U85MCmLsrUfpdIF+nwrHNSPviiO2Q40O7xf7GIydm7rZ3wjzE2n6c9
 mZY1rv0KFgubVSUXxkXyl7Dpf+dLubQQggyC2LBheibLsddKXbv8RhDyC5vb707qVLs1
 5rdQ==
X-Gm-Message-State: ACgBeo1lNJ8hZEud7jPe+z/vljT1dSItvTVI+oq7gKZKTzNzlbfedZ4W
 sAk/Qbwa1xVfiV1o0UAc1+vCcg==
X-Google-Smtp-Source: AA6agR6feQQkAmSRS93WNQZ0f/A0ulX7pRlczrNtMf+G1KbUA04L5bPR+PJ1eCuYyKFnewzGXMMhYw==
X-Received: by 2002:a05:620a:4551:b0:6b6:1d51:99a0 with SMTP id
 u17-20020a05620a455100b006b61d5199a0mr11536436qkp.187.1660575775118; 
 Mon, 15 Aug 2022 08:02:55 -0700 (PDT)
Received: from [192.168.138.233] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a255000b006b5f06186aesm9154294qko.65.2022.08.15.08.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 08:02:54 -0700 (PDT)
Message-ID: <f2b2233d-f88d-86b8-e8d0-e4d7f426ec3c@linaro.org>
Date: Mon, 15 Aug 2022 10:02:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/20] disas/nanomips: Delete NMD class fields
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-4-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220815072629.12865-4-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/15/22 02:26, Milica Lazarevic wrote:
> Class fields have been replaced with the public static variables.
> Therefore, there is no more need for a constructor. The main goal is to
> remove NMD class completely.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 6 +++++-
>   disas/nanomips.h   | 9 ---------
>   2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 00e489fd59..2cbaa122ae 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -40,6 +40,8 @@
>   
>   #define IMGASSERTONCE(test)
>   
> +static img_address           m_pc;
> +static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;

This is not a viable solution, as it is not thread-safe.  You need to keep a struct and 
add it as an explicit argument where required.


r~

