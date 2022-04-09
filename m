Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5804FAA17
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:08:12 +0200 (CEST)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFVK-0004FE-Rp
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFU3-0003Iq-Sn
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:06:51 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFU2-0007Nt-CA
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:06:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id 2so11474268pjw.2
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3qL844qTtxNLuWMQYo5SDrmCk+nBXcSPp7dyz62u8sM=;
 b=HKTYL8WVcpyqlevAGVZIOl3mDa7Qov3JuTUkHHChhrQDwmMfyOZZiBa2fsNFviaeZD
 gnUeV/4pXwZ/TRjw1pFjlaP0myAE2Za/JKtFKTEWAlj7NA/QTvpYY09grkCz3L9eEXhX
 9TFaE4ReW7OYZRinqx38YN4WAX9uPnMpm1jJLisWPJU/Cd8g611B+74MqrrLaVTHP78b
 Ogra2VwEC8AkSNxzhy/abwO73W4kGwly1rGnG+psL16IKnL5jJtvewNj+gnPvozYR4Sq
 0ZN/DOwt/29++Fkb5BYYTxGlbhp0vBuHPjOLoyOpD0wXOek5PldsQfE1b5Fh2b8coGJd
 J9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3qL844qTtxNLuWMQYo5SDrmCk+nBXcSPp7dyz62u8sM=;
 b=x/MlWejOgTTRvdkWBOCtBMpWFZz6oTrUsLJe1TPBRJYKlAvlkwY/T6RCddW5LxyrKa
 HtSzzU5abHxfw16/udwkQFxeQX5amw1WIGUJ7iMkL7q/hlH1Xfr9r7f58alWtbnuCA06
 LdQ8y6RDkRGYqArUvKYvBsgWKZE2sTAQ23wHXfTEtwnxGignDzOWFgq6TUOux8PNh7Hw
 htgBZmsdwELfZHd/IkPMshQY9/KzehGyqEypwdv0n26BXup/WnuXAKRsfStU33BkTTMr
 wy+/7hb7vuFq+r2RC7iU7iC/rrbqoRa12mF3FynG9gQHJ8dUgZN8f0HLHDNxduNsR9Ly
 H1Ow==
X-Gm-Message-State: AOAM532HV04fEYGsmLIUayMeVakqAvNU6De+JGdZwg/DmEpfmyn/n2ak
 Lc8xGJ4rKQK6QE5eZLxp0YIYgQ==
X-Google-Smtp-Source: ABdhPJzJ2AckuojE0cgjzEmpONJpnS3rr8agpldsw7bWyxNHiATCwzh9OU2udwznE8R+5seOKGHNwQ==
X-Received: by 2002:a17:90a:15d0:b0:1cb:8135:99bb with SMTP id
 w16-20020a17090a15d000b001cb813599bbmr25929pjd.227.1649527608885; 
 Sat, 09 Apr 2022 11:06:48 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a056a00168300b004f7e60da26csm30398820pfc.182.2022.04.09.11.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:06:48 -0700 (PDT)
Message-ID: <e216c25f-b342-b89b-45e9-a7dbb914d871@linaro.org>
Date: Sat, 9 Apr 2022 11:06:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 15/41] hw/intc/arm_gicv3: Keep pointers to every connected
 ITS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The GICv4 ITS VMOVP command's semantics require it to perform the
> operation on every ITS connected to the same GIC that the ITS that
> received the command is attached to.  This means that the GIC object
> needs to keep a pointer to every ITS that is connected to it
> (previously it was sufficient for the ITS to have a pointer to its
> GIC).
> 
> Add a glib ptrarray to the GICv3 object which holds pointers to every
> connected ITS, and make the ITS add itself to the array for the GIC
> it is connected to when it is realized.
> 
> Note that currently all QEMU machine types with an ITS have exactly
> one ITS in the system, so typically the length of this ptrarray will
> be 1.  Multiple ITSes are typically used to improve performance on
> real hardware, so we wouldn't need to have more than one unless we
> were modelling a real machine type that had multile ITSes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h           | 9 +++++++++
>   include/hw/intc/arm_gicv3_common.h | 2 ++
>   hw/intc/arm_gicv3_common.c         | 2 ++
>   hw/intc/arm_gicv3_its.c            | 2 ++
>   hw/intc/arm_gicv3_its_kvm.c        | 2 ++
>   5 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

