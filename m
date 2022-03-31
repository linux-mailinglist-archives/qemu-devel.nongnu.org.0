Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104534EE01B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:05:01 +0200 (CEST)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzAJ-0003FK-ML
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:04:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZz87-0001Ld-La
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:02:43 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=43606
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZz84-0006xJ-W3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:02:42 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id v35so773010ybi.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1+wigbbU/aaKHKy4Am1NXLwqY5EhVLEB0k7gwHlwZGQ=;
 b=af39Pcu4KwhHDdaRH9sKr6LzCRAgfqaVxTC4nUgkKwjsWfyjGDsqSrS+sO0ds1vef9
 bDuZxMPMKjIyMWqhT54VHZvV7r10iYUhXAElYzSbA436ARm2jovFILsaNFRH9MemtZyw
 1dl9KOHtc06E4WVp0WsrKtrxHE99T98bIWLza+v9USpvzpHkfRbpiZQuZ8Pgx4MknAwB
 m1yUFMFY8QeWjsfJz4VGIVqqm21QYb38fAwgmRoI0+1wrgATgoUb+HrjRmpOY9nGKwfR
 U6qOGoQnStUXua3oKYBKa5ae5PxXqIik2X/jbMaHkefupHm3LoVBIOYLh5GZwNXdSybf
 u5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1+wigbbU/aaKHKy4Am1NXLwqY5EhVLEB0k7gwHlwZGQ=;
 b=VMv6tTSb56DNlKqv97SwyrpA3wD0UgmDF/Mu5ONsZ/e3NxQGWXv981uNCJ2nzDAHKw
 LQ1mEZAKRQBU89yhnKED53yFOVHQndjKY4rBZlFEBcbWoMPLQdlQouVDG/D1TxLJNJei
 mAFAEDqP+qZwIc/Q6tz6JvFkxOx4Z30HRaeJMybXfdZnmK6M5bBKXVWPT4Dq5y/0DHhu
 5+eemXkxxmij+uviVgGSVVZZehbs+V+X7qKzOyQVfvdtuBEV2bjzoeCDzO6ZrnK9Bict
 n1sjvJMvNFQl61BQrvD+PJF9OtOvcIITRxjGluQZcqeJ98Zo3U6bL1kijCkhirYUGmkU
 9oCg==
X-Gm-Message-State: AOAM531Dezwg4YqmLByuJ6Asa3pFGMilVTPDmZOze90WGZANlM3J8xGn
 i3YlyUNUhiIXJnDcAtIevoKW8r3NzTvzvdSN7zR6PA==
X-Google-Smtp-Source: ABdhPJwRgX03tG3VDbzfg8QON5xlnAcFuHW82EGph94G+Y0AX4HFAlvBKO/1vGlu4vlMrm7PfDi9Xy8AH3YJ6Xq0hoM=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr5137998ybf.288.1648749759814; Thu, 31
 Mar 2022 11:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
 <20210709051728.170203-23-david@gibson.dropbear.id.au>
In-Reply-To: <20210709051728.170203-23-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 19:02:28 +0100
Message-ID: <CAFEAcA9FYeF_QMAs+FkC0hfEKF-N1o+KBNHP10m0uBN+bXuC6g@mail.gmail.com>
Subject: Re: [PULL 22/33] spapr: Implement Open Firmware client interface
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 06:17, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> The PAPR platform describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.

Hi; the latest version of Coverity has pointed out another bug
in this commit (CID 1487241):

> +static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
> +                            uint32_t nodeph, uint32_t pname,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];

We don't initialize this array...

> +    uint32_t ret = -1;
> +    int offset;
> +    char trval[64] = "";
> +    char nodepath[VOF_MAX_PATH] = "";
> +    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
> +    g_autofree char *val = NULL;
> +
> +    if (vallen > VOF_MAX_SETPROPLEN) {
> +        goto trace_exit;

...and this error-exit check happens before the readstr() that
fills in the propname[] array...

> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        goto trace_exit;

...and if the readstr() fails then propname[] isn't set either...

> +    }

> +trace_exit:
> +    trace_vof_setprop(nodeph, propname, trval, vallen, ret);

...but on the 'trace_exit' error path we still try to trace
propname, which will use the %s format string on it, printing
a potentially arbitrary amount of garbage.

We should either initialize the propname array or else
not trace it for these error paths.

thanks
-- PMM

