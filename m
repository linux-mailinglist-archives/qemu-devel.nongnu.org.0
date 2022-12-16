Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F764EFD5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:55:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DyY-00021A-2e; Fri, 16 Dec 2022 11:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6DyM-0001xv-EF; Fri, 16 Dec 2022 11:54:11 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6DyK-0008VD-Lg; Fri, 16 Dec 2022 11:54:10 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso3920875fac.12; 
 Fri, 16 Dec 2022 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ALASrqaA+0vtW+7Qu7yYlsMXewk1xO5ZXCiyRkfNZg=;
 b=h0RvfnCdg1ZLKMk3kvG1rAJ/mRcHePC1Y7PcG7/p955zonBq43U/9oRnqIOr8DtQKx
 6v+NcSy2m3RzByrkKz8LGpDlda7zcSzwrum8Kcn9jNvuRb6f1FkVyuuJoZQ2xLuoWdH7
 h3cbUBeXZTr/XTJinB7C24bRKzMFHFI3DGwyG4pTaRdsQfMGkirrZbW/yAWFyabSAfuC
 r2zpAjOGhpDL32jzf1OgLko9qSdZhenGAe0fdi/E34Lftw+gpH3eIKP6AvwWuT3XkB9o
 efxNWFRTGn+TibQOEF+L3fz9wDFoOf+19ex/kjFtT2sNLIGtEush1HHJ7tXUamU0UnHq
 pQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ALASrqaA+0vtW+7Qu7yYlsMXewk1xO5ZXCiyRkfNZg=;
 b=VQOPeEEV/sSi6LFkTcnnQnKQezIotz+BPR3+V10fvpIq0ExMwS2DDcuWzcFVf7mblQ
 sptTw1nArHMiLzg+Im2rYar4uFit+MnIuNg3rrXLn8flr2mKPA/h7+dr4kREnd6ziQzs
 aNSfxAsUJHdI7PAMV3rMlvggYN2e4pc4NmnElR/2edf2FVy6HHSBFdKvGX2dEme1B367
 ZYICkjbnwHMWgOMT5hpepiTgD63o3XfZGdiLUjdogGxFDcRyjU+Dp1dRAJQQARNsm7Te
 knnHOTwNzd6v/j7MK68udttSc0lLsvLbHsyWvcOtgJ7F+zGAsMFYAYnjPQTc9oqbZ30K
 ri+A==
X-Gm-Message-State: ANoB5plVYukjoFCo7Wso4Pdfu87KupDkjAW4KYeB6ql+qbSsMDEVwaA2
 eMhDcQfY+OPIEeztixFl9No=
X-Google-Smtp-Source: AA0mqf7jxwaPGik7b4x79+qvSE+o/I8eXGU53qiyH9ijDZatVEvRTxjQJF4F4owVo/7tk957YIEx5w==
X-Received: by 2002:a05:6870:e8a:b0:144:87fc:f4b2 with SMTP id
 mm10-20020a0568700e8a00b0014487fcf4b2mr17785900oab.24.1671209646794; 
 Fri, 16 Dec 2022 08:54:06 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 m29-20020a056870059d00b001438fb3b0a0sm1104761oap.44.2022.12.16.08.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:54:06 -0800 (PST)
Message-ID: <b5e03afa-0ab0-8b8c-e803-76848dce9034@gmail.com>
Date: Fri, 16 Dec 2022 13:54:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 0/4] ppc: Clean up few headers to make them target
 agnostic
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221213123550.39302-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
> Few changes in hw/ & target/ to reduce the target specificity
> of some sPAPR headers.
> 
> Philippe Mathieu-Daudé (4):
>    target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
>    hw/ppc/vof: Do not include the full "cpu.h"
>    hw/ppc/spapr: Reduce "vof.h" inclusion
>    hw/ppc/spapr_ovec: Avoid target_ulong spapr_ovec_parse_vector()

Patches 1-3 queued in https://gitlab.com/danielhb/qemu/tree/ppc-next. Patch
4 can use a few more comments.


Thanks,


Daniel

> 
>   hw/ppc/spapr.c              | 1 +
>   hw/ppc/spapr_ovec.c         | 3 ++-
>   include/hw/ppc/spapr.h      | 3 ++-
>   include/hw/ppc/spapr_ovec.h | 4 ++--
>   include/hw/ppc/vof.h        | 2 +-
>   target/ppc/kvm_ppc.h        | 3 +++
>   6 files changed, 11 insertions(+), 5 deletions(-)
> 

