Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231126EDE07
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:30:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prE2l-0004sD-Np; Tue, 25 Apr 2023 04:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prE2k-0004rk-DI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:28:58 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prE2i-0005Bd-Mv
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:28:58 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-508418b6d59so9999087a12.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682411335; x=1685003335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pmpb8bcvYoVEfQM+oqkeHjuPIx1HN09PMZtINojiia4=;
 b=ecHAvbDsCmdZ0cODPgiXpJcR4FjlLEbEmXk/C2dGkOcZ14vBpBQnD9ablhFPSAeqCl
 jN5CoGK6TUXMEy2PtRySDKsCmReznBy8e4HhohZyVOV5b6zfTXLLGCb8HPTZew9NidTn
 3Pcnozqmtc4R44R1roFC42v0ndWV3V0N7hUCYkIbbjyhfhmZOKK4WLCURR53T9ZCuDAU
 PEK6UKc5HsFSjsgWDZU+qGKXvX7sdl//qcCHW+PLxtKxp3vd4lzSp0svP5m4Q0mig0Gm
 i4NNWXFsCeTr5wFv2FtprfC9Z7ygb/quF8oJN6DBznKJmsD+IIFyjo5e7zBk154otmyz
 WQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682411335; x=1685003335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmpb8bcvYoVEfQM+oqkeHjuPIx1HN09PMZtINojiia4=;
 b=l+icT8kM59JSL2jVCiuL/Yt2GG9riZKgqxn7IM5xjPryhjG93aR+KOrBEzBrUzfcnF
 InEyNnjVpocMyaAHcpaChDI/Fpyo3IjpRh5OeuMeuWVPKR2c5VJJLEcDSxv7frCSPDU/
 2vohkxGPXliXnr9U+ezajAGkXoJHxnT75BYkoN7R4l+1bLk0kktmiG2nfx8ZLZVy6074
 9FdTqU1dNTLdJbBGXUMFBiL29W3X3w9BAvrkygAuIAaWLeyvqqstR4sGoQmZtpZWD1Rt
 j28JEep7Ec802cYHB5507nfKR334wAo+QCLbRZjtxi8OWZwQfvHJiLRsrxJ6Fu3gi0Q4
 SObg==
X-Gm-Message-State: AAQBX9dwf+A6L+f/9aKvrfN/HpWT+9FAY/4po6XpuTO2bFnMGcrnslB4
 Ji3UpmNtsvhpcf6Rb0RjjMLrQDy1w0SEQW+9hYGMtQ==
X-Google-Smtp-Source: AKy350aZlYEULE8SBNn0+XZ1vZ2regyFzepMUr4jTWDuB3dTMZU2dDRGRPZw5ygp7Pdk/YToIwi/5JgznBk8W2z2bUE=
X-Received: by 2002:aa7:df01:0:b0:505:8bf:e663 with SMTP id
 c1-20020aa7df01000000b0050508bfe663mr14111320edy.41.1682411335051; Tue, 25
 Apr 2023 01:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
 <20230424164058.00000a3d@Huawei.com>
 <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
 <20230424225626.00001219@huawei.com>
In-Reply-To: <20230424225626.00001219@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2023 09:28:44 +0100
Message-ID: <CAFEAcA8QXcpkxdXMWP8X9tLem6K8qC3CwZ2-t-fqEpGR-nJBTg@mail.gmail.com>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI eXpander
 Bridges
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Apr 2023 at 22:56, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 24 Apr 2023 16:45:48 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > On the other hand, having QEMU enumerate PCI devices is *also* a
> > very different model from today, where we assume that the guest
> > code is the one that is going to deal with enumerating PCI devices.
> > To my mind one of the major advantages of PCI is exactly that it
> > is entirely probeable and discoverable, so that there is no need
> > for the dtb to include a lot of information that the kernel can
> > find out for itself by directly asking the hardware...
>
> I absolutely agree that QEMU enumerating PCI seem silly level of complexity
> to introduce. So easy route is to just use the bus numbers to partition
> resources. We have those available without any complexity. It's not the
> same as how it's done with ACPI, but then the alternatives are either
> (though maybe they are closer).  Note current proposed algorithm may be
> too simplistic (perhaps some alignment forcing should adjust the division
> of the resources to start on round number addresses)

I think we definitely need to talk about this later this week,
but my initial view is that if:
 (1) the guest kernel can get the information it needs to do this
     by probing the hardware
 (2) doing it in QEMU gives you "this isn't a great allocation"
     "we don't really have the info we need to do it optimally"
     "this is more of a policy decision" effects
     (which is what it's sounding like to me)

this is a really strong argument for "guest software should be
doing this". DTB-booting kernels has always meant the kernel
doing a lot of work that under ACPI/UEFI/x86-PC is typically
done by firmware, and this seems similar to me.

thanks
-- PMM

