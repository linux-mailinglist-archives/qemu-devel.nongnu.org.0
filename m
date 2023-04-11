Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706A6DE314
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:49:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmI5k-0002MT-IB; Tue, 11 Apr 2023 13:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmI5h-0002M0-JV
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:47:37 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmI5f-0005nT-OL
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:47:37 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94a35b0d130so213193866b.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681235254; x=1683827254;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=89D/U2/ABD8Hnu1Y3Qqw4jqD4G1xSecynmnwgvqJh1E=;
 b=YnBxk/BjOwvAHI0NJ7QNqauiFlUOEHqqJtYcO4wshZ5d4biGRT67xd+gtKmL2yTAG1
 /spFeX1cHhQgfRHw3qLE5gFE7DRVJIMjMwU0DKeOPP0up7qHE+6ksN0ALNPK6hDQfnEC
 1sV/LtYwA/6V9r7/ZEqPfrGe5yyGQXOSKvcaxXB4v6K6z1xRdLMUuK2JPIv3XQ3tgxtX
 p3Ltf49Z5yLqWpbA8sgb666/3Gc2TXDl8ibXyTw+niQhw+3KVsqdSceIVC0Vi+7rN3c8
 cmNFc/doZli6PfAphk5aF7x2UCDJ1v0sdXqMpgHst/1sSiaUnbaNpir21qrErLs7O43a
 94+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681235254; x=1683827254;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=89D/U2/ABD8Hnu1Y3Qqw4jqD4G1xSecynmnwgvqJh1E=;
 b=NxfWDTdE9hsOkNF13KwlrNERm9B+0uVGMh3JyL6ohs0Z4I455JmMTRQcbgAghhhbm4
 m0vJx3rypAJQLI1D/qAu5OeM25pzIeXi6D/FRl8igm0BhT19aktHijB5ip3jQkXSxSFg
 E2ileaamc/xqi5V4YzXZWdpp5B2rqY/Flh6qzaTfmkctd7QC40Euo9BQt270nHqcfu12
 pMNlxxBmnXlUc8Ke9p86xAs0NdT5yIdNdAc4lYkKxBLC/ASQ3EDdPH4B1crHVTGAAbVW
 r7KJwkVK9nib7k8DoKT/vUkOrqakCkDeYFA+Sd219fn38WNjJAZ45S/GTX63tSjNfBJg
 Sp8Q==
X-Gm-Message-State: AAQBX9d8Rn2UEO8MrvD58KDNsBwPoSYBE6TRaMz43wdZHYxvgsWIMYQV
 uEmt9Z6KRKhRtky+IgPHsCuxM1M3AgxBJldpOpZjyg==
X-Google-Smtp-Source: AKy350ahP395VbSvIx11nYGRgeo6TcVvzT9+ov1e9nkBImUEMlhVDS3j04fcNMoH4CH/1w9Xg8+N3piLIX+Q3hmx3y4=
X-Received: by 2002:a50:baea:0:b0:4fc:fc86:5f76 with SMTP id
 x97-20020a50baea000000b004fcfc865f76mr5594114ede.6.1681235254106; Tue, 11 Apr
 2023 10:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-23-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-23-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 18:47:23 +0100
Message-ID: <CAFEAcA-uebHqs=53w62BiKQGhXZedA5ijAoOefd2pcOFPF_Rpw@mail.gmail.com>
Subject: Re: [PULL 22/27] hw/xen: Add emulated implementation of XenStore
 operations
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Now that we have an internal implementation of XenStore, we can populate
> the xenstore_backend_ops to allow PV backends to talk to it.
>
> Watches can't be processed with immediate callbacks because that would
> call back into XenBus code recursively. Defer them to a QEMUBH to be run
> as appropriate from the main loop. We use a QEMUBH per XS handle, and it
> walks all the watches (there shouldn't be many per handle) to fire any
> which have pending events. We *could* have done it differently but this
> allows us to use the same struct watch_event as we have for the guest
> side, and keeps things relatively simple.


> +static struct qemu_xs_handle *xs_be_open(void)
> +{
> +    XenXenstoreState *s = xen_xenstore_singleton;
> +    struct qemu_xs_handle *h;
> +
> +    if (!s && !s->impl) {

Coverity points out that this will dereference a NULL pointer
if you hand it one, and will happily let through a XenXenstoreState
where s->impl is NULL.
Should be "!s || !s->impl" I guess ?
CID 1508131.

> +        errno = -ENOSYS;
> +        return NULL;
> +    }
> +
> +    h = g_new0(struct qemu_xs_handle, 1);
> +    h->impl = s->impl;
> +
> +    h->watch_bh = aio_bh_new(qemu_get_aio_context(), be_watch_bh, h);
> +
> +    return h;
> +}

thanks
-- PMM

