Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264913F2904
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:17:45 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0el-0000Ix-VV
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0dP-0007ql-NU
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:16:19 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0dM-0000eN-O4
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:16:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id q3so13029197edt.5
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUdAcmcpc+9M3VpWdDaT19cYEgvqN6Ya6/ceWZyGAlE=;
 b=KHx08BkLTNvWuZECdy0I61wkvfUf0QXPPusurYPFjfxjvRkak9NeyKWX8Pd1EA7kmL
 ljHb0/4HGsNI+7rK8mQmHrCyZTqYB9PPJ4M2pje47KXC4JkAkeFRc7/D2PJRWVC7H0Uf
 WQg8vJLsfqlCKJIPZb7WFH6wUF+4wmODfI2CFAZc0eerTIyUT34bRDJ8c3XV5hQJ4HnI
 fOc4PFU4357EXaWePD2hMrHgwQvq7eziUrL/TGtTCSinqgA/Jz91meGQM5jdBc6ewKdX
 xW9rx/a1Y8BCPQ8SvT2rfcVSRpn9M6OP/XIO4eysS/LksakLCrbO1eNG12MoXOBIYx+t
 x4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUdAcmcpc+9M3VpWdDaT19cYEgvqN6Ya6/ceWZyGAlE=;
 b=meBmncGT9hYAavA00hDS6W1OxOU1em7VL0Gh2IhDlOBiIiHLD96XmsHQJTGhZG1V1M
 mxZZ8e8oLq6vJ+2S7woxyTEhEda9O9d5QYF/ltzwkXsmaz+MItpYIVbxt+KY3P+oWdfi
 RQ3MqvxnS3gRkOcR38zZReOPtOhzSxsyvz51PdIa+hV0mbNlrr7IlQlcdNX5RyOsyZ/x
 helFOUp2g00xZUvs5xb+rDJn9UCGPS1maebQCuZfo5UGZcuUczNAW3P31XcHeCyEq/Le
 hblPx4C9c5j/ZSR+2KJwoAn+1MhgRriy+TyzCVUUUfqcHnm48t/T9MlvWhcTCN3yOM7/
 2xOA==
X-Gm-Message-State: AOAM531QFK2W9SuZHVIB94hsaxTROdhXi7HN2m0uLfZZlh7GIfQXz3vf
 jZWH27AKEiy5CeQ2Ge1sC0hS9EhLK0vqbdaBQXS0xQ==
X-Google-Smtp-Source: ABdhPJx/tGN/9gDUvNhMf4I133of4BMNKMEw9z82IvR+vnTfuK1aCgQwTdw2cgoZHayt1N1iPLkQw5d1tPGq+NS99t8=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr21164531edb.52.1629450975093; 
 Fri, 20 Aug 2021 02:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:15:28 +0100
Message-ID: <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Fri, 20 Aug 2021 at 10:04, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
>
> > On Fri, 20 Aug 2021 at 03:36, Li, Chunming
> > <Chunming.Li@verisilicon.com> wrote:
> > >
> > > The current SMMU V3 device model only support PCI/PCIe devices,
> > > so we update it to support non-PCI/PCIe devices.
> > >
> > >     hw/arm/smmuv3:
> > >         . Create IOMMU memory regions for non-PCI/PCIe devices based
> > on their SID
> > >         . Add sid-map property to store non-PCI/PCIe devices SID
> > >         . Update implementation of CFGI commands based on device SID
> > >     hw/arm/smmu-common:
> > >         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting
> > strategy
> > >     hw/arm/virt:
> > >         . Add PL330 DMA controller and connect with SMMUv3 for
> > testing
> > >         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting
> >
> > Please don't try to do all these things in one big patch --
> > put together a patchseries with several smaller patches,
> > each of which does one self-contained thing.
> >
>   Got it. Thanks for your comments.
>   Let me try to split them into several smaller patches.
>   But all these updates work for 1 thing. They are depend on each other.

Yes, that's why you send a single patch *series*, which has
a cover letter that explains the overall purpose. Then each
individual patch in the series has a commit message that
describes what that specific patch is doing. As emails, the
patches are all sent as follow-ups to the coverletter.
"git format-patch" and "git send-email" should handle this for you.

https://wiki.qemu.org/Contribute/SubmitAPatch#Split_up_long_patches
has a little more discussion of this.

> > If you have a patch that depends on another, it's usually better to
> > send them as a patchseries. I was wondering what the reason for
> > that PL330 patch was...

>   I need a non-PCI/PCIe device to do the verification. The old PL330 DMA controller
>   cannot configure its memory region manually. So we update it and provide path.
>   PL330 patch was reviewed and will be merged in target-arm.next for 6.2.
>   The virt.c compile will fail if there is no PL330 device patch.

Yeah, I accepted it because it is a sensible cleanup on its own;
but it would have been a bit easier for me to understand why you
were doing that if I'd had the wider context.

thanks
-- PMM

