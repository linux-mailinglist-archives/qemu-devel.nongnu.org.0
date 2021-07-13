Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4E3C6F34
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:12:58 +0200 (CEST)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3GLR-0006j5-63
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3GKW-0005uD-Mf
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:12:00 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3GIa-0004o6-7n
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:12:00 -0400
Received: by mail-ed1-x533.google.com with SMTP id l1so10866847edr.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R1s5Fz15rKQpFXsjDHzAH4DjKdiXlDjKHUPOfy+ujTQ=;
 b=pnUSbIwe/cidvVijNaQ0YfruscKJUaza+Fg8KQfOtUb/WRAKgQm7w1kMmPxbYyN97M
 NN8OUQCh0NMCWfzzO7p3nUe4ELjegRECMmE+YBNnHoNx6rLYhx5NdHn3WtvOg6r6jBXF
 jeZhGcb53fBNtRG84TRwL+Bp+PBd9LHA2mU2OgFxuXRVi3c5VBjNnz5RCq5gIuc3oTyP
 PUvT0NZFqRka4RphAStWVum0Ctld2Hj7pB3DjzC73QaSoVdd+oV2PK1b+FdCiZ7Othtc
 9SsLGnpTbFxx70ysrEQwfwM75B8lyvYyP7rVlHdgPgRluDhKjR3D9zebzK5wnGQv/5WF
 JQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R1s5Fz15rKQpFXsjDHzAH4DjKdiXlDjKHUPOfy+ujTQ=;
 b=A1YZ7Uly+c+XREr1+wF6Uiin3rLqU1EvTbpNaR6qFrDyfsHyTkDNW4hso5t3o6hyua
 kg7vo/1oEWVuqRb88YC6JO8xnudi6I+1VVS+7jJ0zmMcOy9wGXFme1OJfv4E5rBZQulH
 PZHox+Rk1QAu5o/s3IIzx9OUnACLeTSDYTlhNeMAAeTYURh6O1zffRJ6vwT5MMuRxvSP
 kB4z7uHdO6LhbsrREtwsBivBreI9hma0dOhW/F5wCrjNIsPkcB/B4q+2A7dbayHTeJbA
 xrYDsigfMJATLGZ2GyJTdzB3p5a5WDek4zUkzAnI9Ghhe7gFFLDtkNLC16/PbHfWJAgd
 fJ6w==
X-Gm-Message-State: AOAM531M01oBbk4xMbRpc18yLNpcxFXWMkcxMfpjG5QxzAz6GMzgx11f
 WtiNlmJ+7r2U4QGuexKLiptGAYYZW/mo8RoTzLR+2A==
X-Google-Smtp-Source: ABdhPJz75QCEkrhGtLrbtUClBTwHZ+x9fFx3Jp2XnSj4NrJD1p1N5UcGZOQFAe3asJBPDrwPkU4erLSGRIx6glG2sGc=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr4944684edp.251.1626174598023; 
 Tue, 13 Jul 2021 04:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
 <20210709051728.170203-23-david@gibson.dropbear.id.au>
In-Reply-To: <20210709051728.170203-23-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 12:09:18 +0100
Message-ID: <CAFEAcA9G8jcNH_W_yQRppvwymFPrRtCNnHyVeN0Wu7dgQr=W-Q@mail.gmail.com>
Subject: Re: [PULL 22/33] spapr: Implement Open Firmware client interface
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 06:17, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> The PAPR platform describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.

Another Coverity issue unrelated to the others: CID 1458132:

> +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
> +                    target_ulong args_real)
> +{
> +    struct prom_args args_be;
> +    uint32_t args[ARRAY_SIZE(args_be.args)];
> +    uint32_t rets[ARRAY_SIZE(args_be.args)] = { 0 }, ret;
> +    char service[64];
> +    unsigned nargs, nret, i;
> +
> +    if (VOF_MEM_READ(args_real, &args_be, sizeof(args_be)) != MEMTX_OK) {
> +        return -EINVAL;
> +    }
> +    nargs = be32_to_cpu(args_be.nargs);
> +    if (nargs >= ARRAY_SIZE(args_be.args)) {

Our only bounds check against overflowing the args arrays is here,
on 'nargs'...

> +        return -EINVAL;
> +    }
> +
> +    if (VOF_MEM_READ(be32_to_cpu(args_be.service), service, sizeof(service)) !=
> +        MEMTX_OK) {
> +        return -EINVAL;
> +    }
> +    if (strnlen(service, sizeof(service)) == sizeof(service)) {
> +        /* Too long service name */
> +        return -EINVAL;
> +    }
> +
> +    for (i = 0; i < nargs; ++i) {
> +        args[i] = be32_to_cpu(args_be.args[i]);
> +    }
> +
> +    nret = be32_to_cpu(args_be.nret);
> +    ret = vof_client_handle(ms, fdt, vof, service, args, nargs, rets, nret);
> +    if (!nret) {
> +        return 0;
> +    }
> +
> +    args_be.args[nargs] = cpu_to_be32(ret);
> +    for (i = 1; i < nret; ++i) {
> +        args_be.args[nargs + i] = cpu_to_be32(rets[i - 1]);
> +    }

...but in the code we fill the args_be array with "nargs + 1 + nret - 1"
values.

Side note: is the code really intentionally copying only nret-1 values
from rets[], or is the loop condition supposed to be "<= nret" ?

> +
> +    if (VOF_MEM_WRITE(args_real + offsetof(struct prom_args, args[nargs]),
> +                      args_be.args + nargs, sizeof(args_be.args[0]) * nret) !=
> +        MEMTX_OK) {
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}

thanks
-- PMM

