Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE73E22B6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 06:46:28 +0200 (CEST)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBrkZ-00041B-L1
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 00:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBrjp-0003KP-TP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:45:41 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBrjn-00077c-SI
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:45:41 -0400
Received: by mail-io1-xd29.google.com with SMTP id i7so3446648iow.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=61yNQURZ6DgBqP61Tk4EnIbtr601tvbMObRUrDow9o0=;
 b=af0oiavUqshsXKslQzfWbRLRcGeosUWQIf5otK6Y/mbmRJyf6XIOM3IQlQ73pRwZ8O
 HAMbN1kPRF42ttmWGGDOIY9W84Wke8DItrhTzT0KmgnsCEYLUFMt9Vb1iTK1B6Y13dKc
 /ALeeOzXUsd2H2wVYqzwVjT5zhD+RuLl8yNG4909BY+Lo2r0MlcwzA44zhqVhUvSaCl3
 2AUpxlcNIbik6+zLd7vlu2FuPvK+t3aP/MfL42w/2RV9ojnxQsq3Pt/pTunnXWT3+PL+
 yIt7w18wQcmNMao24bJH9hrgQdsb0KBDLJlK9leWQBECeJEl5E6I+ugtJyXA9wJu8iKN
 3F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=61yNQURZ6DgBqP61Tk4EnIbtr601tvbMObRUrDow9o0=;
 b=Kk0F9WHZVNBI5gdGDXRqQaeZ3uGlG26vsunyGL58nSJAL3/f3evdBv5YDZvsOlISHg
 YdUnha9XwPBw/anuR8cVZNMG5oEUSAB+/+vVKZEZOpxm4lG4TY7Xu3DvcUhkXk3r/BEA
 HgZIRy0CmpcX3a7h2/ssPLA2R3leM4w15bCO2tHUzwYcfjGQqVc6KLz2trFZPdokljoA
 oidHIg164f4/sGeLMmEAVQZ1g7YW4Rj8NfUtlmo2ABHGhr99gZo5I+q5Hxxs0xe43rE7
 h2XOwUujgM/P20lCdAjfAn+KZoTJAQzfw+unF61OrKh++kzLXnaZakk1shVATVCl2Zwx
 CAug==
X-Gm-Message-State: AOAM533C6aUbVtZuqLKJsF/esuBFN+YcSOxcTYsj177jfxI8OLTSP3zr
 aF2biipmZV/SKY7bd+WHNQtynLVy99Jud7V2OmM=
X-Google-Smtp-Source: ABdhPJzX3pZtUTLBPMtomaehw6K/gTNrP8Vfg59htG0WT7PxdoPErMDyVKdWWqYz7g1Ew8veRTU3IQm1R7TjtzBFOkA=
X-Received: by 2002:a05:6602:14a:: with SMTP id
 v10mr161668iot.36.1628225138710; 
 Thu, 05 Aug 2021 21:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-13-wangyanan55@huawei.com>
In-Reply-To: <20210803080527.156556-13-wangyanan55@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 6 Aug 2021 06:45:27 +0200
Message-ID: <CAM9Jb+iUSVohmkBDUYb-wPqimWX74RP0MazHJs9pGmekrR=jpQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v4 12/14] machine: Put all sanity-check in the
 generic SMP parser
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd29.google.com
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
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Put both sanity-check of the input SMP configuration and sanity-check
> of the output SMP configuration uniformly in the generic parser. Then
> machine_set_smp() will become cleaner, also all the invalid scenarios
> can be tested only by calling the parser.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 443ae5aa1b..3dd6c6f81e 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -811,6 +811,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>
> +    /*
> +     * A specified topology parameter must be greater than zero,
> +     * explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "CPU topology parameters must be greater than zero");
> +        return;
> +    }
> +
>      /*
>       * If not supported by the machine, a topology parameter must be
>       * omitted or specified equal to 1.
> @@ -889,6 +903,22 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>                     topo_msg, maxcpus, cpus);
>          return;
>      }
> +
> +    if (ms->smp.cpus < mc->min_cpus) {
> +        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
> +                   "supported by machine '%s' is %d",
> +                   ms->smp.cpus,
> +                   mc->name, mc->min_cpus);
> +        return;
> +    }
> +
> +    if (ms->smp.max_cpus > mc->max_cpus) {
> +        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
> +                   "supported by machine '%s' is %d",
> +                   ms->smp.max_cpus,
> +                   mc->name, mc->max_cpus);
> +        return;
> +    }
>  }
>
>  static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> @@ -911,7 +941,6 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
>  static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>  {
> -    MachineClass *mc = MACHINE_GET_CLASS(obj);
>      MachineState *ms = MACHINE(obj);
>      SMPConfiguration *config;
>      ERRP_GUARD();
> @@ -920,40 +949,10 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>
> -    /*
> -     * The CPU topology parameters must be specified greater than zero or
> -     * just omitted, explicit configuration like "cpus=0" is not allowed.
> -     */
> -    if ((config->has_cpus && config->cpus == 0) ||
> -        (config->has_sockets && config->sockets == 0) ||
> -        (config->has_dies && config->dies == 0) ||
> -        (config->has_cores && config->cores == 0) ||
> -        (config->has_threads && config->threads == 0) ||
> -        (config->has_maxcpus && config->maxcpus == 0)) {
> -        error_setg(errp, "CPU topology parameters must be greater than zero");
> -        goto out_free;
> -    }
> -
>      smp_parse(ms, config, errp);
>      if (errp) {
> -        goto out_free;
> +        qapi_free_SMPConfiguration(config);
>      }
> -
> -    /* sanity-check smp_cpus and max_cpus against mc */
> -    if (ms->smp.cpus < mc->min_cpus) {
> -        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
> -                   "supported by machine '%s' is %d",
> -                   ms->smp.cpus,
> -                   mc->name, mc->min_cpus);
> -    } else if (ms->smp.max_cpus > mc->max_cpus) {
> -        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
> -                   "supported by machine '%s' is %d",
> -                   ms->smp.max_cpus,
> -                   mc->name, mc->max_cpus);
> -    }
> -
> -out_free:
> -    qapi_free_SMPConfiguration(config);
>  }
>
>  static void machine_class_init(ObjectClass *oc, void *data)

Looks good.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

