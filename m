Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DA4F6007
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:31:47 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc5lC-0007AD-Ep
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5jV-0006GP-Gp
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:30:01 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5jT-0006Ep-S4
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:30:01 -0400
Received: by mail-qt1-x82d.google.com with SMTP id v2so4232955qtc.5
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zv0ushkA/7g3yuYHk/iW1ShlkPAMhMTJG3eEWQ0Snjk=;
 b=JnO64vBi1NDXRGKLfpvv7Avp+c7gE+O6T1c3X/jahYgzBQ3PbLEnaPZCYwu5xS58Nt
 XwCXlaYIyNWwzSd0S7Bw8qR+J2jfeBm84dOosiRKZ+bnJEIhM+gFrjCo/acuWtC/Oc3U
 tECQ4BiN0Svz8Kciq8BwLYauHJOUMcGbqYixf0R1niZbCrGM7ezpb0tdGLid0uAMfzZ/
 qJYfbMaUAlAzbesvBod8eFOhTz9K/s18S7GxDEx8yhchpNFl4ojpXwsWbItnynCzJP9p
 czDMX/NlSIGBHx0kSwBBHvwy5y3q221Gj8aJ5L2cxJ6wDwL0uMIaIPmp2MVgDnPvg//C
 vMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zv0ushkA/7g3yuYHk/iW1ShlkPAMhMTJG3eEWQ0Snjk=;
 b=w1tQBMdpI2MgOEDCnj77exNdwgtYVGJwypzbse3oIUPRlZIdaM/PgJ9gjEd2dmZgyD
 o64BLaDCkBlbsm6Pm9MvJ1rvJfZHXZCq9S2uCqZR/xhdlaSCc377BgrukBkECn6i3v49
 roASzQD9BgqlSVdBilR13fNkSEvveXP2WFUe1qOKXiZz2IlLN9vTOh/RcD2QodcH8N/Z
 +8Y1kkPsq8xLI34xiQ69IK9Cj2jxV0WS7thTjKD2U3grrsLcnXwxZzbytcClc/pRy1Ky
 ZJmTduhE/3E1DywPe8eULQBdXvxYLCXlfqLFBCYi60bna5xT0hhC9Ebi6/mh5pRau60Z
 p9RQ==
X-Gm-Message-State: AOAM533evQp5o9bgg6FPQkjmk6dqQqPTKH64ndFkwAOhIf4yvHFA2O70
 8FN/HeDqpD+dFcIaB/6k6gXccQ==
X-Google-Smtp-Source: ABdhPJwZCHsUPLMaG33qjlgzXr2iGQpCbW2g3tzV1T8qji0tYOHyguHtD6CFzIqEjUK+Ma9j7V+mbQ==
X-Received: by 2002:a05:620a:bd5:b0:67d:15ed:2fcd with SMTP id
 s21-20020a05620a0bd500b0067d15ed2fcdmr5715497qki.81.1649251798272; 
 Wed, 06 Apr 2022 06:29:58 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 r64-20020a37a843000000b0067b0cf40b18sm9996318qke.69.2022.04.06.06.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:29:57 -0700 (PDT)
Message-ID: <9d47d819-bf36-b481-b5e9-45f69aca7d68@linaro.org>
Date: Wed, 6 Apr 2022 08:29:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/9] qemu/int128: add int128_urshift
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, clg@kaod.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 14:55, Lucas Mateus Castro(alqotel) wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement an unsigned right shift for Int128 values and add the same
> tests cases of int128_rshift in the unit test.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   include/qemu/int128.h    | 19 +++++++++++++++++++
>   tests/unit/test-int128.c | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

