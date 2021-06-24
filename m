Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A83B2F05
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:32:49 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOXI-0007kb-JS
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwOW0-0006hb-BT
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:31:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwOVy-0005QG-Bc
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:31:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id u11so6431688wrw.11
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CndAZhrTab0IRPX0KkrEB1Kc6WzDHNnSb+mtWg1WIR4=;
 b=jHkEMEA5nKRAcBz4ObZ/upugDNZkjsUWSPLwZhoTx40rP8hL+gyZzlPXOzTDpVKiTT
 dTF3WYG5zbJ6eNQs+1METn1Vuhp5QzgJPzMzlBf59rZqe/zs8M/0mBPRKDd8QV7iNTil
 DvxpKXNX+SX/yWjUBpMoYWLK/lk1DgxmV9VUYBwih/wBmPDZphiT/ZnlvdhkOU4d0sbd
 Fj3mvznzOyBYbvT4JRjewVLiByteUAgLc5fT0CBMZ7yucmSawDeK6btu+MM2yaufseBX
 O2rDqLA0F5IFdwWM8qQpqdG4HMVqJys3lV2p/87ucYKxPUz9ZMlzLkNwsBQ3SckrI5vG
 jNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CndAZhrTab0IRPX0KkrEB1Kc6WzDHNnSb+mtWg1WIR4=;
 b=hHd/bK84VFLlFVWw3G5zrv6BiV6+Gjw3Cz+sQv86prQdSR6zT8uM9XyG91Isv0JeB/
 susgAP+EQl31W0j07ezYh5VWtq+X6nxWNR351KPM0dDW/fiqXuRrrvh8VAE3wmEVw+p/
 4IvUjuqS8h3s2P5ttcTwqBC99SsTqqzNCWooHwDxHVXSRC43xvGeBk3hM2epPLCHhAOc
 pDDXIZ1VaUumGteYFByLgI//Li81YIrtK2lxpnhlg6woYAgmn1fTImRvCs+IF77cKtf+
 8zafXWpC/SVN3KEE0g/SENpwe+i39RguN1SgnlmNI9rliCNbFV+rVnzhL6XvqXV+7I4p
 iZVA==
X-Gm-Message-State: AOAM532cwryKYIm39htycDrlq3TdLMbfZUrGPYtd1PRdqy9Svy5Dqf+p
 +lHc0MGDicUduZlZbg1vl+DJ6g==
X-Google-Smtp-Source: ABdhPJzQ9npom8cH1/P0esXbRniCZLZNvxxM1h6GcjA0GuYU6flxmAxIXCzLWHIrIQsimMUi9qb34w==
X-Received: by 2002:adf:a319:: with SMTP id c25mr4341509wrb.68.1624537883922; 
 Thu, 24 Jun 2021 05:31:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm3158690wrx.28.2021.06.24.05.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:31:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B18B91FF7E;
 Thu, 24 Jun 2021 13:31:21 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-70-alex.bennee@linaro.org>
 <17f14974-a922-dcda-4eb4-8754bf1fd45c@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v16 69/99] target/arm: add tcg cpu accel class
Date: Thu, 24 Jun 2021 11:52:50 +0100
In-reply-to: <17f14974-a922-dcda-4eb4-8754bf1fd45c@linaro.org>
Message-ID: <8735t7saue.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:52 AM, Alex Benn=C3=A9e wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>> move init, realizefn and reset code into it.
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/arm/tcg/tcg-cpu.h        |  4 ++-
>>   target/arm/cpu.c                | 44 ++------------------------
>>   target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
>>   target/arm/tcg/tcg-cpu-models.c | 10 +++---
>>   target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
>>   5 files changed, 92 insertions(+), 48 deletions(-)
>> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
>> index d93c6a6749..dd08587949 100644
>> --- a/target/arm/tcg/tcg-cpu.h
>> +++ b/target/arm/tcg/tcg-cpu.h
>> @@ -22,15 +22,17 @@
>>     #include "cpu.h"
>>   #include "hw/core/tcg-cpu-ops.h"
>> +#include "hw/core/accel-cpu.h"
>
> Ideally we'd have a qemu/typedef.h entry so this include isn't
> needed...

Ok, moved the needed includes into the .c

>
>>     void arm_cpu_synchronize_from_tb(CPUState *cs,
>>                                    const TranslationBlock *tb);
>>   -extern struct TCGCPUOps arm_tcg_ops;
>> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
>
> ... simply for this declaration.
> Also, can we now remove the tcg-cpu-ops.h include?
>
>> @@ -1467,7 +1429,7 @@ static void arm_cpu_class_init(ObjectClass *oc, vo=
id *data)
>>       cc->disas_set_info =3D arm_disas_set_info;
>>     #ifdef CONFIG_TCG
>> -    cc->tcg_ops =3D &arm_tcg_ops;
>> +    cc->init_accel_cpu =3D tcg_arm_init_accel_cpu;
>>   #endif /* CONFIG_TCG */
>
> Is this already inside tcg_enabled()?  Because otherwise it looks as
> if this is overwriting a field also used by kvm.

Is it? I can only see the existing x86 TCG CPU and now in this case
allowing an override of arm_v7m_init_accel_cpu and it's resulting TCG
ops variant. This is because all the 32 bit CPUs now have parent =3D
TYPE_ARM_CPU as their parent class.

> Whereas the code that's being replaced set a field only used by tcg.
>
> KVM sets its hooks differently, via kvm_cpu_accel_register_types, so I
> don't understand this hook at all.  But it seems like there should not
> be two different ways to set acc->cpu_instance_init.

That isn't being reset - it's set once in the which ever
accel_class_init ends up being instantiated. Of course this is all QOM
so I could be wrong.

>
>
> r~


--=20
Alex Benn=C3=A9e

