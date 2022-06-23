Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BACB557C7F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:08:47 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MZh-0001D9-Rn
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MVN-0006pF-0g
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:04:17 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MVL-0000s2-9D
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:04:16 -0400
Received: by mail-yb1-xb33.google.com with SMTP id q132so2166049ybg.10
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4jIc+A/kGuP813BCO0RPZNNJFomqxggggBMlBexvLvc=;
 b=AleNK01Zig9PzDAP6x8L3+gzEgdNbJ2hOi6G1nnpDh3ujpcF5ITXFr8T62KZRXXZmf
 zo0yd1wzIV79HNYKuQ587KCHVC2HgNSvODr9fqymcMr4q0YjvSXSKLuYHKI/Nryl0Z7n
 KlkX/44f12dkIc4mcSnjra32uDYN67axNFH2YgXFekg7RugIOGCzbKe8E8BucjKqgj+9
 h95F8Q4a/zU2Celt0FMhY676d/MAWy0iDsC21LU4Z4NyD+d5vYExG9KSEad4kiENI7CJ
 U2SQjTkk0h52uwXp8oZgAzYU/WIb33lS82Vnc1iYVOeOzjDSHnoWj3+BNS1KxZvEnkF0
 v5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4jIc+A/kGuP813BCO0RPZNNJFomqxggggBMlBexvLvc=;
 b=a+3KvXg15LRglM2gqGq/MrSgBwZBVJHcjW4SQejyAb/MqTAR5x2dtbcycQiafy0GkF
 4XBIMpG0C9tKmYWoSF3baLv0l0pStfOePU04JNG4y9X2UlXbze4Zr6A9fRuIdqIK+3kX
 o9lI/THjYTrru5uERSI3PWvoaei/ZRTA0oH0bFY3jJYrpIAUVv5HQVQiqSTdhsNXZ3du
 NZdrdKSDYYfE2w2UHpNojeWysTBe4l7Pq7BvZ9ss/PG4SbmfhQ3F/XkFZBH2yNWx/YXE
 qID/c3SHwOH7Lx8aZ4HX3U2QPbDyM0KKu0Pbxw14z1VJfQV8I6s9ww1ogLi0Yx72HOWo
 5voA==
X-Gm-Message-State: AJIora+E3vLQ/kwuR73af74y5IEz5GUIjB/LeY38OkxI9YQCBNyu1QFp
 oNTTK8Ob6CYViOm+er/NqKtyZ84s7bv2jNGfcctLxQ==
X-Google-Smtp-Source: AGRyM1sQ34783R4bHXZvX6ut4c0W5jd+Lw0NR686Ci3t88mm6MlTLKvMDALhPyhFV+8I3zSPLzTBeNBHnG5c3OtlVII=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr9344200ybr.39.1655989453935; Thu, 23
 Jun 2022 06:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144857.34189-1-peterx@redhat.com>
 <20220617144857.34189-3-peterx@redhat.com>
In-Reply-To: <20220617144857.34189-3-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 14:04:03 +0100
Message-ID: <CAFEAcA8+zLF5o6ofy5z4tCKY0NyAoy=PmmGnjLEjZp0YoFB4ig@mail.gmail.com>
Subject: Re: [PATCH 2/5] cpus-common: Add run_on_cpu2()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, 
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 17 Jun 2022 at 15:57, Peter Xu <peterx@redhat.com> wrote:
>
> This version of run_on_cpu() allows to take an Error** to detect errors.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  cpus-common.c         | 27 +++++++++++++++++++++++++++
>  include/hw/core/cpu.h | 26 ++++++++++++++++++++++++++
>  softmmu/cpus.c        |  6 ++++++
>  3 files changed, 59 insertions(+)

> +/**
> + * run_on_cpu2:
> + * @cpu: The vCPU to run on.
> + * @func: The function to be executed.
> + * @data: Data to pass to the function.
> + * @errp: The Error** pointer to be passed into @func2.
> + *
> + * Schedules the function @func2 for execution on the vCPU @cpu, capture
> + * any error and put it into *@errp when provided.
> + */
> +void run_on_cpu2(CPUState *cpu, run_on_cpu_func2 func2, run_on_cpu_data data,
> +                 Error **errp);

Can you give this a more descriptive name, please, unless the plan
is to convert all the users of the existing run_on_cpu() and then
rename this function to that ?

thanks
-- PMM

