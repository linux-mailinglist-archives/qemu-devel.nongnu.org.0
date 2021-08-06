Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EAD3E22BA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 06:58:32 +0200 (CEST)
Received: from localhost ([::1]:33384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBrwF-0000GO-Cy
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 00:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBrvR-0007YT-8l
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:57:41 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBrvP-0000TQ-Gy
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:57:41 -0400
Received: by mail-il1-x131.google.com with SMTP id l10so1663913ilf.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHIugKnU5Jjrn3e7ya+FJtdYVRi3XKs4Aku2cJClzwY=;
 b=akfGiROBtjxXJO+5OioOOd9kyVaiBPxv8HRtFXIhSXO0tJRVyUstGXLliSFYVkXdqU
 yaduFIgIE2ePq9c+jD8tiZGlor9PFq4puKmkfCDuBtjAPg6ksCiV8dkn+K3w6Z8e2tSb
 bfnPXWw68viJdDx9NcHFgnsBQmPUzcoyHehb+kviZ3Oid6hlSvzD/a9ZxHFCXDza06KY
 8zbIvE71du1odiDSqGRVr2gQhVIehgpN9+YkYpX9TBH9NkF7e4K9Ei0fB7+jq6ms81IN
 60KowShicj44Kt64lkjOeCE7UfIqb2+w/tov7ob+/g3jxhXHQgNlcj/T6JFX53eLUYVV
 OMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHIugKnU5Jjrn3e7ya+FJtdYVRi3XKs4Aku2cJClzwY=;
 b=ntri2NjUWQGGUZbLZ3Ugk6oLKQ1KQEtDryM6aBzdEFFMoD8L1iC9iEKFpml5FgnLuO
 Ui6EY8+wFzhn9gN0+R7JOhqEBgQ/H9jCIw2FvbPyjVf0RF6o1vcx8lwdLTSwu5san/T9
 d5akShgiJFy6Gnt586OL5UKEE2S1wy60Y0Fr6V1ob1ALqny4f6LwckfVzNqkFo033Lnu
 Sn1vAQqAXxR2/WvP2ijxfvQklutI1vsgFSmoFgpSoaFKyvBn5cypHxwQ54W21OgiUm5t
 ekAgHU/EELh53QBvdbV/H76G2nG6aK+T2NRXZ/SwQnJIqo/CgkxQlAylvx6+SW6J7r5s
 rLTw==
X-Gm-Message-State: AOAM530wyrh3d1nQ6kbG8pZoPahs07O2bdb+4VF0wU2Y2i/TXzL6y8gk
 NiECDI/47VV//DcXTELQnNlXe/7CKe+dcPtX/dw=
X-Google-Smtp-Source: ABdhPJyLUcxm+8A9R6LPckXG7Ck+0OVRr+/QbL8praecLLfhxZab7ZjyafKD9lRBeKBQAwwAJEJ0A2XTvkeRoCSNzGY=
X-Received: by 2002:a92:5205:: with SMTP id g5mr245113ilb.22.1628225858095;
 Thu, 05 Aug 2021 21:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-3-wangyanan55@huawei.com>
In-Reply-To: <20210803080527.156556-3-wangyanan55@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 6 Aug 2021 06:57:27 +0200
Message-ID: <CAM9Jb+inuDYY1vmmCJH93+n1aQbfJHDZS9fy2DcdPKDWj4WW7g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v4 02/14] machine: Uniformly use maxcpus to
 calculate the omitted parameters
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x131.google.com
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

> We are currently using maxcpus to calculate the omitted sockets
> but using cpus to calculate the omitted cores/threads. This makes
> cmdlines like:
>   -smp cpus=8,maxcpus=16
>   -smp cpus=8,cores=4,maxcpus=16
>   -smp cpus=8,threads=2,maxcpus=16
> work fine but the ones like:
>   -smp cpus=8,sockets=2,maxcpus=16
>   -smp cpus=8,sockets=2,cores=4,maxcpus=16
>   -smp cpus=8,sockets=2,threads=2,maxcpus=16
> break the sanity check.
>
> Since we require for a valid config that the product of "sockets * cores
> * threads" should equal to the maxcpus, we should uniformly use maxcpus
> to calculate their omitted values.
>
> Also the if-branch of "cpus == 0 || sockets == 0" was split into two
> branches of "cpus == 0" and "sockets == 0" so that we can clearly read
> that we are parsing the configuration with a preference on cpus over
> sockets over cores over threads.
>
> Note: change in this patch won't affect any existing working cmdlines
> but improves consistency and allows more incomplete configs to be valid.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 30 +++++++++++++++---------------
>  hw/i386/pc.c      | 30 +++++++++++++++---------------
>  2 files changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 696d9e8e47..69979c93dd 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -755,24 +755,26 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      }
>
>      /* compute missing values, prefer sockets over cores over threads */
> -    if (cpus == 0 || sockets == 0) {
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +
> +    if (cpus == 0) {
> +        sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (cores * threads);
> -        }
> +        cpus = sockets * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (cores * threads);
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * threads);
> -        cores = cores > 0 ? cores : 1;
> +        cores = maxcpus / (sockets * threads);
>      } else if (threads == 0) {
> -        threads = cpus / (cores * sockets);
> -        threads = threads > 0 ? threads : 1;
> -    } else if (sockets * cores * threads < cpus) {
> +        threads = maxcpus / (sockets * cores);
> +    }
> +
> +    if (sockets * cores * threads < cpus) {
>          error_setg(errp, "cpu topology: "
>                     "sockets (%u) * cores (%u) * threads (%u) < "
>                     "smp_cpus (%u)",
> @@ -780,8 +782,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>      if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index acd31af452..a9ff9ef52c 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -725,24 +725,26 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      dies = dies > 0 ? dies : 1;
>
>      /* compute missing values, prefer sockets over cores over threads */
> -    if (cpus == 0 || sockets == 0) {
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +
> +    if (cpus == 0) {
> +        sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * dies * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (dies * cores * threads);
> -        }
> +        cpus = sockets * dies * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (dies * cores * threads);
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * dies * threads);
> -        cores = cores > 0 ? cores : 1;
> +        cores = maxcpus / (sockets * dies * threads);
>      } else if (threads == 0) {
> -        threads = cpus / (cores * dies * sockets);
> -        threads = threads > 0 ? threads : 1;
> -    } else if (sockets * dies * cores * threads < cpus) {
> +        threads = maxcpus / (sockets * dies * cores);
> +    }
> +
> +    if (sockets * dies * cores * threads < cpus) {
>          error_setg(errp, "cpu topology: "
>                     "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
>                     "smp_cpus (%u)",
> @@ -750,8 +752,6 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>          return;
>      }
>
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>      if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

