Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E581F6A9B67
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:12:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY80h-0006zM-Uc; Fri, 03 Mar 2023 11:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY80g-0006x8-0Y
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:11:54 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY80d-0007FI-61
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:11:53 -0500
Received: by mail-pf1-x42e.google.com with SMTP id ay18so1893519pfb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677859909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HMDvKOzUvhD+gnJmWPSHF6kgZbOBXLJVP7lXCp14qwU=;
 b=Il2WGuqZOvKej54xkarCiPLQ2EELr6aRPp00wr6KdN50chC84f795TR814t/voFvCe
 q1jeLDt8yANN28GLd3/oyFco67yrHv+0KpP9WqZ6qIuP9hHfwJUfzZOTxFAPJpFf1Ycf
 fZgMk9a7qAfLuvJ4WKly91QcuYMrlHYNSHqbMa94a4zTv+y9lSemMOptQOrF0JA69p8s
 x1incH/MSVEjftAQKa51MblWVGvYjKcZnC2Up4inZwtN6SXlE/vXRuR2Zb+x1bBKd0Al
 OS+N9ZBUBautK6RcMMyhjO/9ZSjkisVrlTo49OTJer3IQH7PY4rE0rk1mFBZs++oCKph
 pMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677859909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HMDvKOzUvhD+gnJmWPSHF6kgZbOBXLJVP7lXCp14qwU=;
 b=AdzF8/RWioe9IqbCfQecoSp8g5h8Uz/X/MjzKxFXZIlyMHiema4r1CzOTmKMrYLENE
 W/vT+rTExohN4u58a/akzrymRM6arhqxycqkSrSlWdPPW7d3urMZTq5/4AVyLtf2/GMz
 rmStH5uaBAdDOmiyOYZux1Sm3jE4CjRZD09LIjjUsL/6vmE9o8Gjl4tcINGEe6dLYQ3m
 U8CXi5swvuGqj/xc20kb+QWrVrq2Po7lCnmDvkgN6l58xIPFFKe3bdsXv8TfJf1FB3Wm
 4MPac1Hk3nzaiwT2ZOcVh96IkV2Hx01K5q3n68FlFaLzXk5rJBRWEGgAc+LK6nTLmLep
 xmcA==
X-Gm-Message-State: AO0yUKWADpcxzXD3OMCIdILgEEn4tiFX/9dru4hKI3CyYpNzTAL5mnGv
 r9PAzZ0uSb4JKiIcJ9O45w8C98hLR6+RGpaAShJQog==
X-Google-Smtp-Source: AK7set9qcSI9yW/sVjhnxw9EPtc5quH/RzknW0I8OjqjyUcZliJzkG7QEvJ4CBxAiaAvNpjENTeDGabUzjZ9qj0ybHo=
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr736959pgb.9.1677859909483; Fri, 03 Mar
 2023 08:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
In-Reply-To: <20230228150216.77912-2-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:11:38 +0000
Message-ID: <CAFEAcA8FD75dXcPEyZOfF7cxbgynWTdDOJV7K7fYfAbRsPDdmg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 28 Feb 2023 at 15:02, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Introduce a new cpu feature flag to control MTE support. To preserve
> backwards compatibility for tcg, MTE will continue to be enabled as
> long as tag memory has been provided.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  21 ++++++
>  hw/arm/virt.c                    |   2 +-
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 110 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm.c                 |  29 ++++++++
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  19 ++++++
>  target/arm/monitor.c             |   1 +
>  10 files changed, 194 insertions(+), 13 deletions(-)



> +static inline bool arm_machine_has_tag_memory(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
> +
> +    /* so far, only the virt machine has support for tag memory */
> +    if (obj) {
> +        VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +        return vms->mte;
> +    }

Code inside target/arm shouldn't be fishing around inside
the details of the board model like this. For TCG I think that
at this point (i.e. at realize) you should be able to tell if
the board has set up tag memory, because it will have set
cpu->tag_memory to non-NULL.

thanks
-- PMM

