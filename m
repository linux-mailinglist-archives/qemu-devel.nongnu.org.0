Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AA4F601D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:48:23 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc61F-0000LI-V2
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5yn-000632-Kp
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:45:53 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5ym-0002Lm-37
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:45:49 -0400
Received: by mail-qv1-xf30.google.com with SMTP id e22so2223585qvf.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IRs2XlgbRjd3AVcx4Yl1FqSk5Lm9JglxOjDnhLWXYA0=;
 b=Qlx03AY1duIE6ZYxfc0be7MF0M0/75kL/UM799ZOY38vcDKEOAijHSliLxU+xs37l7
 GBlXZLReALUIHOBJioUWHYce/AsYVd1ptyiymHEjPsnNcSXCsPs/6x9nIsXpHIfM+88o
 lSMFuJ1CWrCsyzhnnR6zBPadg6cobTBQtUt7OoI+PMyi5W6PRWpua9XtRxLIISuBQOw3
 JW2ETwPTyBBCmmPhMr5hAWtnQy6m6CO0gR0YewElRwEQWwvovA7j8mOq72WF3I4DjPeo
 U2omTbbJd5Q69aMHiXnFJqZ35UfHGc5IsmPKtiMvZ+dMp2B1anQUOffawo3cjOuC107Y
 4iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IRs2XlgbRjd3AVcx4Yl1FqSk5Lm9JglxOjDnhLWXYA0=;
 b=DyrH9PUql5SX0CmtR9Y5xNSM2G2Aqw4yi0/QNYWOEJ+OjjzI/P1Q2jNFzK4U5Ra7oe
 Fn5yYGwcXVdINO62yaEkDni6UyFq3IMzXVZAow770v+J8JmxjYtX40HrXilxCEgX0OxF
 Can/PtRGOjGMealAhELegwlIVVzB+8SkNvsGfHG4w++psUz0NV68sA2yP6KWX20ZyWNa
 ecdzsPkSNhIJrIrWloY45CsjPJ8ZINdGalibG9tL3wpcsGXy2o72ypmsoZibMJuaIOiJ
 UclSeKsEhDGZJV9eZNbba1a+07r+eDcbiD2/5DS2cMJ+EBqkeK8s5puKgx7KmYISLv8Z
 JrHA==
X-Gm-Message-State: AOAM532FWjM57kZB98UYkouypKQ3OnzNGeEe6HZfA/DWt/PzW5PNMDJN
 TaIa0fSitkfAFZeKUs51Ep+UfQ==
X-Google-Smtp-Source: ABdhPJxZwN1MOrgOPhHcnR4ZFdeyGlhwwEjkWAexEVe8O6NX1qF/vPXBg03n5VSC3emHmG3Xx1iQuw==
X-Received: by 2002:a05:6214:c62:b0:441:3ec2:c99f with SMTP id
 t2-20020a0562140c6200b004413ec2c99fmr7527678qvj.121.1649252745368; 
 Wed, 06 Apr 2022 06:45:45 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 t19-20020ac85893000000b002e1afa26591sm14709210qta.52.2022.04.06.06.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:45:44 -0700 (PDT)
Message-ID: <7b50b211-10e5-fc21-e6da-b454bb299dae@linaro.org>
Date: Wed, 6 Apr 2022 08:45:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 05/18] hw/arm/exynos4210: Coalesce board_irqs and
 irq_table
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> The exynos4210 code currently has two very similar arrays of IRQs:
> 
>   * board_irqs is a field of the Exynos4210Irq struct which is filled
>     in by exynos4210_init_board_irqs() with the appropriate qemu_irqs
>     for each IRQ the board/SoC can assert
>   * irq_table is a set of qemu_irqs pointed to from the
>     Exynos4210State struct.  It's allocated in exynos4210_init_irq,
>     and the only behaviour these irqs have is that they pass on the
>     level to the equivalent board_irqs[] irq
> 
> The extra indirection through irq_table is unnecessary, so coalesce
> these into a single irq_table[] array as a direct field in
> Exynos4210State which exynos4210_init_board_irqs() fills in.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  8 ++------
>   hw/arm/exynos4210.c         |  6 +-----
>   hw/intc/exynos4210_gic.c    | 32 ++++++++------------------------
>   3 files changed, 11 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

