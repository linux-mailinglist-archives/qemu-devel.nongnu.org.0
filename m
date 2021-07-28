Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2033D86D2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 06:38:35 +0200 (CEST)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8bKz-0006oW-LD
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 00:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m8bK5-00067Y-No
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:37:37 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m8bK4-0004gV-80
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:37:37 -0400
Received: by mail-io1-xd2e.google.com with SMTP id f11so1451765ioj.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 21:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLf+/JiAKwk4VkPym0AT1HgA/bfxU1EKlmGkYknP4t8=;
 b=pTPjfDqjk1XNhkT8DDP55Ux2LLpvwezkvl1S83nBlXrKuqonPrdYCVwDVLoC5L0O6K
 5+5drWzWyo+KyyoI5qDThwWay1ErYyuGAx5wJQN81OgBJIV7xCgIXv4UYQ3/VnscSOYq
 Zd8OrueFOuyIwF3331woy9YOHvsb+HzR6v/9OngulxzRS7+flR3H6OG8dC+N0iIez607
 d0nybbUK4ABiecdHvCe06FSGJa3smnE+vomXvAa5FNPn5lRMLssev0zimVEN+iXESHC5
 Y+6WZGWjMGPDwm5xly16YnHBvCEb6OBurtG3amY+pJDRkOlfxX/eNEOtRjBt4n7JjsDr
 0qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLf+/JiAKwk4VkPym0AT1HgA/bfxU1EKlmGkYknP4t8=;
 b=n4HuK7z5PGLVbufcWKTtV+YU/Jr1gLi+BYKLc/E/ztkyzihA0EPIkHvue0nDsklGCT
 pe2Na+a8OuEOChilbHOg3EakWmNn8ioH1Y54ghnj6nuzHWDFBnLCu+Yuig/Vq8NdcGTl
 Rm+epwwHLKMdagJOX06aB8Cosp6yn826/PqKh+mIbFTwxu6gXd9u7m7mZ91Ze8+lqVL6
 ryc4FWmHMetdkh+R/Hcb+DPru4thPd/4AdPEWstfDFGfIWdV66XbKNyR1kU2HTRkx3tV
 a2vSawY1wybMChV0R90KD9hzyYRg7QpUD+9MMP45+l6IWO0K9XU3mN+gcud4pR6T24KE
 CRbg==
X-Gm-Message-State: AOAM530VHX+qt8u2n2uQwq55IhanWaNwzwhF5mW9EW6E2TL9NwduxYMO
 yDG8Li2JTEGkK7oSKaYkaDr7o2XzdBAyLtNGSIc=
X-Google-Smtp-Source: ABdhPJytXSv2BO1/R1DkiKheN10WRjjlq0awnWng27CqcR36nLzILZ87P2vR4ZyL/QTWGb9vvYdGiqTte/a1nGTfVyA=
X-Received: by 2002:a5d:91d8:: with SMTP id k24mr22178909ior.84.1627447054622; 
 Tue, 27 Jul 2021 21:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-8-wangyanan55@huawei.com>
In-Reply-To: <20210728034848.75228-8-wangyanan55@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 28 Jul 2021 06:37:23 +0200
Message-ID: <CAM9Jb+iEbhm91cH=aWnicX1eQOE+5Yvskkfq_+5FtFh3mB29ug@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v3 07/11] machine: Use ms instead of global
 current_machine in sanity-check
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> In the sanity-check of smp_cpus and max_cpus against mc in function
> machine_set_smp(), we are now using ms->smp.max_cpus for the check
> but using current_machine->smp.max_cpus in the error message.
> Tweak this by uniformly using the local ms.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a8173a0f45..e13a8f2f34 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -878,7 +878,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>      } else if (ms->smp.max_cpus > mc->max_cpus) {
>          error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
>                     "supported by machine '%s' is %d",
> -                   current_machine->smp.max_cpus,
> +                   ms->smp.max_cpus,
>                     mc->name, mc->max_cpus);
>      }
>

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

