Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E353708E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 12:48:52 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvGTa-0004ZR-FI
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 06:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvGOo-0003W6-G0
 for qemu-devel@nongnu.org; Sun, 29 May 2022 06:43:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvGOl-0000qa-VR
 for qemu-devel@nongnu.org; Sun, 29 May 2022 06:43:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so6905049wme.5
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 03:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sr3O4CN9P5MOHigMtY02jKOkC1tD2V8TZPmo82Snte4=;
 b=L8OoRCQX35tOMg7zqKE/wGzYo8qRDPxT0FdfawPcKzEhnxDfKBj6wGhDKT0E0hSM5Q
 AMa6Q44cMpEdFL/n/IKrYR4QSHV62m8u+oCcCYugLPQKiM8Yn8vMqin/aCOAdJaDnhIf
 5i62xMZ8Jv1oe/fhARTH/GPyxnV3S+BkLRoEHeGgsLxFIYsT50iIto5k33fNYBrOgMKX
 U5m14ZQ5dDOgzPHUJlKhe2MLl6pkWdmqkFs81h3h9izqF/9OplGwQW2pjg+rmib4SWr9
 u9BHzJoCpoCwXEyjzdzqoa+A24knfLZ4s/Ev0Xs7t7DTgalpIAI5AONu+eOU8mn7f0jG
 gBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sr3O4CN9P5MOHigMtY02jKOkC1tD2V8TZPmo82Snte4=;
 b=u6h1cDFheC94FyqpdmQY6QPl/FSgjTE85EXEIuyBZVQoE04ogRZeFJiPxW1+SsNLeI
 BTI4VASFecgQP1LGYpMVNtAIIZVOIDYd9nLPPmNr9dHBQMTX6HwLXQ760Hkjodnfcb8w
 3ap2xbSxCsBh0+NOEhiWoKgdeSX0t1kVD9sQYyuEFu8BdP85X/+dL894XBe1XJfkPATc
 BHMwqrPtB2hHfN4A6T2xHNbVv9EkwaVn1Pav9sqL+NVe/kvBAmGm9jmo0NVooA858OrG
 eVcUy3VkYi005/ZZLpBJk4Iw91lKOH+YqOH+hI8esuqLVltPSPUwZfCPvx7LTwuEshhQ
 x0ng==
X-Gm-Message-State: AOAM533nNSTqVsQnNqfg0nPlckINgJYJBVxsFt5TMDAZ+N345Co+Ssk0
 SiFYh6c8ssNXaHxnLuPCWTI=
X-Google-Smtp-Source: ABdhPJwaitam4oAU1FmKpljCQNGWKOwZOkJ9UytNuuGagOBU5pLX8/Ad/JFnGcFU4KHj+zulAm6oog==
X-Received: by 2002:a05:600c:1c91:b0:397:4711:e2a8 with SMTP id
 k17-20020a05600c1c9100b003974711e2a8mr14820198wms.82.1653821030282; 
 Sun, 29 May 2022 03:43:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm6266137wrz.64.2022.05.29.03.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 03:43:49 -0700 (PDT)
Message-ID: <ed872ff5-8754-a887-b487-e08e4c63c8fd@amsat.org>
Date: Sun, 29 May 2022 12:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/tcg/i386: Use explicit suffix on fist insns
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220527171143.168276-1-richard.henderson@linaro.org>
In-Reply-To: <20220527171143.168276-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

On 27/5/22 19:11, Richard Henderson wrote:
> Fixes a number of assembler warnings of the form:
> 
> test-i386.c: Assembler messages:
> test-i386.c:869: Warning: no instruction mnemonic suffix given
>    and no register operands; using default for `fist'
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/i386/test-i386-fp-exceptions.c | 24 ++++++++++++------------
>   tests/tcg/i386/test-i386.c               |  2 +-
>   2 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

