Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1A5AEA6D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:52:09 +0200 (CEST)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYzo-0008KA-HK
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVY5O-0005yS-2U; Tue, 06 Sep 2022 08:53:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVY5M-0001Xb-Fz; Tue, 06 Sep 2022 08:53:49 -0400
Received: by mail-pf1-x432.google.com with SMTP id o126so2278396pfb.6;
 Tue, 06 Sep 2022 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=b6X1QwJQRPHERLpQBxv4F9BZdmbdVKn+EpJeCbmb0vU=;
 b=eUFQ/PdDyVyLstVdYRJR5Agx+OLV6QTgUT/MsPuomLrP6TIpPswpHTjfU40waheBsz
 R4/hGDvOMgQv2ZoqR+uirfVcaSMc1p69l2RnztAMUOajTvQGLr4xwoh4ed72QsYs66kR
 9iMy/wotSTKoyEw3OBu6mPXI6H+CFpuIu8gdi9zyLd83aIu8ietc1BxOLJVUDugW3b5M
 d4VdjmRabrfaWJXM1uHk5e/YobVYPqmM99lWLHrxE6/STY6Jj70PWyu6ocj2ieXk0AHr
 lRDD/BrBnQ9/zHb7b3w65U7t2qtGHGqAQsGBhvdLmCJthpZ9NQfXaF5dPSIxgyjgdqrQ
 Ppow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=b6X1QwJQRPHERLpQBxv4F9BZdmbdVKn+EpJeCbmb0vU=;
 b=3ORvwQF7w9P3xikkRJ0qDLvu06NSJSPhgg1m/auINbkrFQOGqUM5s1JMxHh7UdglNH
 plfaNkb4mRj+LYnKm0nbSRf/MOTWm5wMJ+EqgYLdKTKNjOVwloxrUthg0pXgfZ2i9Ncq
 f/9YpnQyKpscEVQpU+6Sw/liE+CALhQ4ux0PdaSOpvFbgwG3+J/xCeeTZ7rNihHWiyDT
 MS7a8Qm9G2tgC80wBQ2J+5OFOBQL3DBYk72K4qH9FX3dT6okbhy21k9SbtvvC/Pf7YoS
 2BbsnsN/Zgb3e92CBOUhVcKYRcV1CyxxIV+F0sdyNtmtNUSkAdxS8VWaGEREx75SQSHt
 DMEw==
X-Gm-Message-State: ACgBeo2Ngs2oS1c87ZiSmejUpB4pjfhNLgW9vOcJ5CUk1ps/8LCme83p
 47Y3/M4LpIDaU6DQzG0cmjE=
X-Google-Smtp-Source: AA6agR6LdoX8IOtH4WJrIpeCSLbLpAuk6KBYmjH9ru6EJGuuW/7dGGug/vgig07teKEFXW48XkE7/A==
X-Received: by 2002:a65:538e:0:b0:434:aa53:2244 with SMTP id
 x14-20020a65538e000000b00434aa532244mr2472106pgq.343.1662468826087; 
 Tue, 06 Sep 2022 05:53:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170903024600b0016c78f9f024sm9886313plh.104.2022.09.06.05.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 05:53:45 -0700 (PDT)
Message-ID: <e877708d-9370-4b77-bddd-f929ee34bddd@amsat.org>
Date: Tue, 6 Sep 2022 14:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 5/9] target/arm: Change gen_exception_internal to work
 on displacements
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-6-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:05, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c |  6 +++---
>   target/arm/translate.c     | 10 +++++-----
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

