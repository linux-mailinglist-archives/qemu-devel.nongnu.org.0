Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4B3F28B8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 10:54:23 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0IA-0005b7-57
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 04:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0H0-0004eA-0M
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:53:10 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0Gx-0006uM-HH
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:53:09 -0400
Received: by mail-ej1-x634.google.com with SMTP id lo4so18659005ejb.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fOfjJl9UR+NsoS8tEvtVVkjolcJkT2AxrxuOF5cKDPE=;
 b=SFnvmTy+CuZvHry64qeYCe/E5/wvJ2OOlBhSQjx0dO6QsP9DWVmZMQMo+Peqsybo3b
 j902+Ilg3PM+qwp4f3LARUN3/6ufFtm3mM9CT7S/vTVpwna8bv9IzgIB0Bq3mDovVNzw
 ebH1WiEayENEE+iR5su03Aqx9sJ8w5U9N6bnDpugXzcAX3sLiA3i9LLLD6b9IEMl2JMI
 gUGZj6MOELGC8kjx17nMVavBszksu08AGFrkY17LHI6X2wNHAL3URBAnoXqYpdetk9RV
 l7IPY8a1bJ8jCrsDE/BgNsb81DS0LL/x+UWXGbAT9PI6VZQIJTT/d7+TkIoxf4TAzhE7
 7b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fOfjJl9UR+NsoS8tEvtVVkjolcJkT2AxrxuOF5cKDPE=;
 b=BA2UPPjCo/9Y9/MuzorZ7YxlUAsXaPiIxB27Q4aRsnIWwcSDVgZujO7iaCXD+h1Nyv
 3WoF1d9ZbxwSpaBKm4h7U/UhepoQ3/pTmhlHHpuUih8J95qdlaBt1npVeCtiCBQABxf6
 oXh8p1GioqV6jcvxlNPW04Au3Qw1wQ0oG3eoz9u4eWcuRFtHNCdIStAuuS4jAEjQiZ0o
 G9agFeyPf9Uf2XHeSvAMzKADjTlOH8SKXi8lB0kD002mijOZjX0nzxmWxglELCPlxKfc
 wOs2cGPp+LKLR8gDaBYKfk9W+mynzBMgD0fY3EYV9YXCuzYHlDHlIveLXFzSCQ7AOhsK
 EyIw==
X-Gm-Message-State: AOAM531iIeVz/hRMEHVAQx6u4pDNjRpnQpK3isWZSizDygY3p0VWN9ES
 FICiRHNddpS3H3XbTVLC1D5LBPrv5N4dLQj0sFyoiw==
X-Google-Smtp-Source: ABdhPJzQmbdxYNBY7qevbHgjelxIVx5A/G/jZSGLQ5DLk3xyzD5n8wPBzOtyon/C7DkUIUJ2goNDMDDAM++qfB8sOqk=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr20739015ejf.85.1629449585905; 
 Fri, 20 Aug 2021 01:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 09:52:19 +0100
Message-ID: <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 at 03:36, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
>
> The current SMMU V3 device model only support PCI/PCIe devices,
> so we update it to support non-PCI/PCIe devices.
>
>     hw/arm/smmuv3:
>         . Create IOMMU memory regions for non-PCI/PCIe devices based on their SID
>         . Add sid-map property to store non-PCI/PCIe devices SID
>         . Update implementation of CFGI commands based on device SID
>     hw/arm/smmu-common:
>         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting strategy
>     hw/arm/virt:
>         . Add PL330 DMA controller and connect with SMMUv3 for testing
>         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting

Please don't try to do all these things in one big patch --
put together a patchseries with several smaller patches,
each of which does one self-contained thing.


> Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
> ---
> This patch depends on PL330 memory region connection patch:
> https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com/

If you have a patch that depends on another, it's usually better to
send them as a patchseries. I was wondering what the reason for
that PL330 patch was...

thanks
-- PMM

