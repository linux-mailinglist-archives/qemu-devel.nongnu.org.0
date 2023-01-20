Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CEB6757BF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:49:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsge-000672-4J; Fri, 20 Jan 2023 09:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIsg6-00063v-Ew
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:47:55 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIsg4-0002R3-9H
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:47:38 -0500
Received: by mail-pg1-x534.google.com with SMTP id b6so4266833pgi.7
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 06:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=blqFgSFGDDH/4GblYaOCG7SyACht4qNU8zYhwNL2wOg=;
 b=KZF8S3djiJVN1yywYnxR9Kacq2aVyVGRb5Umtx4V9IZKWcgLB8IOqORpq4b8RnbKvZ
 Vsz+X+cW6YiL0a9MFJG9t2riDxZXEaDr1QEyoN3gSKiC3smxaLjy7ZEW4msm9NS3M1Dk
 eIQr9SwSN8O8+o7GuprNoTa31qNMhCAnqwypcNxGHseVpU8rpssbd86c073z64BotjAY
 h5VMjCHgTfpnko8K0EDAyxWpdk/2J7FzjQI9+Hf9h+/HwMUkbU4hY9HUHD1+ISKPMr5i
 LbiyGh20NExox2NZ08EEIgBlgzUqbRoS9ogjpEdXYuEMmG1N27PXF+R0OX9BZpojA+/p
 lAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=blqFgSFGDDH/4GblYaOCG7SyACht4qNU8zYhwNL2wOg=;
 b=zzC65ZjM9ZEleWs5dPLC+0X190iPvLRnNy8UPqRbSB4iAjOoBj0DTkAz3+93qcTbIi
 8bGNgn8lyEUoAHCWKtx2U9WkPnJw2kZhFNIjPZz+6vPixryVy2jyDWWBOV9hjLD7BfiC
 rZoRloOj8LqOy4rOg/JbNRQNQiRRnLo82vIQtiqPwcf/LpqL7z0SheBRxCFjpiHPBieY
 WLdfGKHMac32gqpGr/SLV4g92l9brtGjpELJt1ZV/G/UUOhYNZhTmHFMaGteAeSKTkfu
 uN8tWPN8vuyKkGEQSUms72yUCIwtTmeDjqC8ZZr9Cuvr+4Rg/3uuk8HTpZx3NUTda8bT
 7ewg==
X-Gm-Message-State: AFqh2kqw12iD0zx78CwYvFpI7BOExVKgeHvZRgm9r+Oa8KK/pcT9E7vq
 N9P/69+e5cay2bOucZic79krIhD69rQnShQVNJFhEw==
X-Google-Smtp-Source: AMrXdXvF8d6H5FEqtrJpMt9XAb6Qh539v5274puL5+ejXoVyYIVQyHrFW4BQKTc6zKEfHfnBm4BomVZSqpk6amCraSM=
X-Received: by 2002:a63:eb42:0:b0:4c7:be1a:4e50 with SMTP id
 b2-20020a63eb42000000b004c7be1a4e50mr1258469pgk.59.1674226054059; Fri, 20 Jan
 2023 06:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20230119070004.321358-1-alxndr@bu.edu>
 <20230119070004.321358-2-alxndr@bu.edu> <m2cz791d68.fsf@oracle.com>
In-Reply-To: <m2cz791d68.fsf@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 14:47:22 +0000
Message-ID: <CAFEAcA-6jE8ouRjohCTr88kccWMUc0_xOZ6T2NQvfNaedgH+SA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] memory: prevent dma-reentracy issues
To: Darren Kenny <darren.kenny@oracle.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Fri, 20 Jan 2023 at 14:42, Darren Kenny <darren.kenny@oracle.com> wrote:
> Generally, this looks good, but I do have a comment below...
>
> On Thursday, 2023-01-19 at 02:00:02 -05, Alexander Bulekov wrote:
> > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > This flag is set/checked prior to calling a device's MemoryRegion
> > handlers, and set when device code initiates DMA.  The purpose of this
> > flag is to prevent two types of DMA-based reentrancy issues:

> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index e05332d07f..90ffaaa4f5 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >      uint64_t access_mask;
> >      unsigned access_size;
> >      unsigned i;
> > +    DeviceState *dev = NULL;
> >      MemTxResult r = MEMTX_OK;
> >
> >      if (!access_size_min) {
> > @@ -542,6 +543,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >          access_size_max = 4;
> >      }
> >
> > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> > +    if (mr->owner &&
> > +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
>
> I don't know how likely this is to happen, but according to:
>
> - https://qemu-project.gitlab.io/qemu/devel/qom.html#c.object_dynamic_cast
>
> it is possible for the object_dynamic_cast() function to return NULL,
> so it might make sense to wrap the subsequent calls in a test of dev !=
> NULL.

Yes. This came up in a previous version of this:
https://lore.kernel.org/qemu-devel/CAFEAcA8E4nDoAWcj-v-dED-0hDtXGjJNSp3A=kdGF8UOCw0DrQ@mail.gmail.com/

It's generally a bug to call object_dynamic_cast() and then not check
the return value.

thanks
-- PMM

