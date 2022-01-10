Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0C4896C4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:52:47 +0100 (CET)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6sIA-0002St-Fh
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6sGO-0001YM-A8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:50:56 -0500
Received: from [2a00:1450:4864:20::42c] (port=40485
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6sGD-0000Jb-P5
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:50:55 -0500
Received: by mail-wr1-x42c.google.com with SMTP id x4so742628wru.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wW9hVxsvVDXX4B56LPK2cwvJhGiFnWtKGSFCLZZubDM=;
 b=ichGp+mFN9shaZHz4pnodUX5IsYwzzj3Xr10P1jS1RRCf7scsfy/L+W6TYEOk64QHu
 4OMr8mxYTJ8bxqLukjNUfn9Ic3j8SAuQgoDsIm6FEdgiHs2KLZ4tDQzOXHJ+XQu/TtAQ
 GN4mOYnfup+beaW3wbBrn9XyZ3WSKhDS+c18QmRLxQ2IrxrLDANuQxO5S/QIJx8LnK4D
 bcxYzfue4oJK1aF5v+hIELNQacvjfE62kMAx0pWc+OUo0IXeUS60UkCpQZZgdSYFJJiz
 IHt2Fec5W6eHhAFZURXynusSPztLpJ6Sc9u+iw+wWcY0eHOqUbwDMrjN+28YNtYKW7/3
 +WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wW9hVxsvVDXX4B56LPK2cwvJhGiFnWtKGSFCLZZubDM=;
 b=bAOIRLbtNVyUZhXEZKKkQ9LYL7b3+T+y9VIrMG8BspXKHEG0BNSMmz7wmUKveynXYS
 WYXW3wDL8+4XKV5Ma6Er6vJFejLM/n/GVErpMAiVM/L6Zg53bfg4S4ET4hsv+t4DIi32
 UH1lZiT0rCA9GmdgEk/EEyCIhhL1GjB5VroaQjsfvDJo/JM06xih01qhWHB3LJCiZv1R
 VbZ2k/916z8MFrrAR1iuzfGSFzOdMyymnzaw+d1NuS4aKovl6pW4BJA6MevuQYnI5Wlf
 2vw4ocwVxLPmnwW0sIBJNtBQZlHhX6biCuKC/9vIcvsvR4Awoya52f9R5Vn3MMluFFaj
 txwA==
X-Gm-Message-State: AOAM533em7hDxe1WcD7xm8ljtFdW5x3EdhIxDeuYCxjHZtoIK54I9fMl
 pU9beIcFTRKiPQ0ZdupSIU4qISTemtAUIVHajlB9QQ==
X-Google-Smtp-Source: ABdhPJzXj0SyUQXy9X17sL+a7U+sVcQhPdT3na3oVH38EcJxYLB4Z+IWzd+/CO/ZvVo6W22wJ0Dd3XN48cEwWIeWTmg=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr62968673wri.295.1641811843868; 
 Mon, 10 Jan 2022 02:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20211203233404.37313-1-gshan@redhat.com>
 <20211203233404.37313-3-gshan@redhat.com>
 <CAFEAcA8hd000vwp8A602uw4yueea4uU0xttELcC8sn34X+N5-A@mail.gmail.com>
 <3528fa8b-bfa6-2127-dfe6-4135b3b0989f@redhat.com>
In-Reply-To: <3528fa8b-bfa6-2127-dfe6-4135b3b0989f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 10:50:33 +0000
Message-ID: <CAFEAcA_qW9d9ACZFEi+K+yKJMPAESMQyU+O5JLOL934gdXk-Vg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 07:22, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter,
>
> On 1/8/22 12:40 AM, Peter Maydell wrote:
> > On Fri, 3 Dec 2021 at 23:34, Gavin Shan <gshan@redhat.com> wrote:
> >> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> >> index b20595a496..21e4d572ab 100644
> >> --- a/hw/virtio/virtio-mem.c
> >> +++ b/hw/virtio/virtio-mem.c
> >> @@ -125,7 +125,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
> >>    * The memory block size corresponds mostly to the section size.
> >>    *
> >>    * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
> >> - * a section size of 1GB on arm64 (as long as the start address is properly
> >> + * a section size of 512MB on arm64 (as long as the start address is properly
> >>    * aligned, similar to ordinary DIMMs).
> >>    *
> >>    * We can change this at any time and maybe even make it configurable if
> >> @@ -134,6 +134,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
> >>    */
> >>   #if defined(TARGET_X86_64) || defined(TARGET_I386)
> >>   #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
> >> +#elif defined(TARGET_ARM)
> >> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
> >>   #else
> >>   #error VIRTIO_MEM_USABLE_EXTENT not defined
> >>   #endif
> >
> > Could this comment explain where the 128MB and 512MB come from
> > and why the value is different for different architectures ?
> >
>
> Yes, the comment already explained it by "section size", which is the
> minimal hotpluggable unit. It's defined by the linux guest kernel as
> below. On ARM64, we pick the larger section size without considering
> the base page size. Besides, the virtio-mem is/will-be enabled on
> x86_64 and ARM64 guest kernel only.

Oh, so "section" is a Linux kernel concept? It wasn't clear to me
that that was a fixed value rather than something we were arbitrarily
defining in QEMU.

-- PMM

