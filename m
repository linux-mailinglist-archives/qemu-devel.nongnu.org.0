Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935F4772DB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:15:00 +0100 (CET)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqb4-0001QA-D8
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mxqJz-0004Pk-Hv
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:57:19 -0500
Received: from [2a00:1450:4864:20::429] (port=34398
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mxqJx-00024U-GJ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:57:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id s1so9922760wrg.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vUOhw4MzPwlig/N3h9CCxcN2gmPc08bdlgxkafnqUgo=;
 b=E4S4E3RwqueMqpSdyCAQ+HbnEZkibMjOu0KdB9wbyVrLpxZWYVBbdIkKhKGg8y8ife
 e+EYttbbFNR2g0l0BCzpFSfkYo1DeQ4saojltJ4QDzWXmmTysH2TheWnxSfWFqVkz27q
 k6+aycqTrQKuSFRfDx0MlacWIe9xUJslIiz+2hopc3EDadFtcWPvobI7On+fVMthmpiw
 HjLOPe93gex7hLQqIzyiKocuAtMeuOSXgXCMhQh6dwjxCeq9rspcN824V0ZMn8rsKyT0
 rCQSYLwc/Pa9lwT8pJ15nJPuq77SZ+N2DKjXmgGhT40L/CgPs4IHVihcZEhGmy4/m88k
 rrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vUOhw4MzPwlig/N3h9CCxcN2gmPc08bdlgxkafnqUgo=;
 b=32i4MvbwE8y7BppKAGOikGV56Zbl54fblT1VYPj5ME64bOp33DkvFzMNV5HtPGLeYS
 FNvGIH4wZFqocHiUu+MHZt5b63fA6wXWgpZBH83xJ9zblG1qLgZpyc/qMK6gEp8gr1Qj
 3Dc0g+JhXL4x+lbOw+U0CvFTHyFBVASykTvN0y3hrfDjZxi+UMoeDMle53bxjxxtjqS2
 DxcgybLdUrs5o1BJiM9ydBQycgiS0Ypp9DXmWtkUUH5GG14wPk2O5RfkGljQfZFcVIDv
 350rcJfdOarFESaeYfy/IoDH26Gl+awjnnnAOU/R1R5+Q1QwVM4IQzqWcjNIVQMnNTNo
 N2lw==
X-Gm-Message-State: AOAM531aUcnj/NVphJJh6GOfdbirSJG7D6MkJrmRR/XRIf48ClaLYvVW
 elhs+qpd0yOeyXCoDyhJ0pkJuHoVQXWqtg==
X-Google-Smtp-Source: ABdhPJz84xaJz5LkOvWXjXLI6KzZkMV6FYoseogY5khkKU42nVV0li8kxoKbIeVS6Wij+FBiNGSQNg==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr8720680wre.469.1639659436184; 
 Thu, 16 Dec 2021 04:57:16 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id w25sm4993533wmk.20.2021.12.16.04.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:57:15 -0800 (PST)
Date: Thu, 16 Dec 2021 12:56:53 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 31/33] tests/acpi: add test case for VIOT
Message-ID: <Ybs3lb7rZ0lP1I/N@myrica>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
 <20211215104049.2030475-32-peter.maydell@linaro.org>
 <54ed293c-9f7a-f82d-7a6d-35d51eb45b77@linaro.org>
 <YbsNoEUfJRsqtKmF@myrica>
 <CAFEAcA_T-_bouEcfxydBmXUts4-rhUW4cb3KU=x-7WRgJM4smA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_T-_bouEcfxydBmXUts4-rhUW4cb3KU=x-7WRgJM4smA@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 11:28:04AM +0000, Peter Maydell wrote:
> On Thu, 16 Dec 2021 at 09:58, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > On Wed, Dec 15, 2021 at 04:59:10PM -0800, Richard Henderson wrote:
> > > On 12/15/21 2:40 AM, Peter Maydell wrote:
> > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > >
> > > > Add two test cases for VIOT, one on the q35 machine and the other on
> > > > virt. To test complex topologies the q35 test has two PCIe buses that
> > > > bypass the IOMMU (and are therefore not described by VIOT), and two
> > > > buses that are translated by virtio-iommu.
> > > >
> > > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > Message-id: 20211210170415.583179-7-jean-philippe@linaro.org
> > > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > > ---
> > > >   tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 38 insertions(+)
> > >
> > > I should have been more careful while applying.  The aarch64 host failure
> > > for this is not transient as I first assumed:
> > >
> > > PASS 5 qtest-aarch64/bios-tables-test /aarch64/acpi/virt/oem-fields
> > > qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> > > Broken pipe
> > > ERROR qtest-aarch64/bios-tables-test - too few tests run (expected 6, got 5)
> > > make: *** [Makefile.mtest:312: run-test-37] Error 1
> >
> > I'm guessing adding "tcg_only = true", like all other virt machine tests
> > in this file, should work around this, but I don't really understand the
> > problem because I can't reproduce it on my aarch64 host (I'm running
> > "configure --target-list=aarch64-softmmu" followed by "make -j10
> > check-qtest V=1" in a loop)
> 
> What host are you testing on? The test case explicitly asks
> for "-cpu cortex-a57", so it is only going to work with KVM
> on hosts with a Cortex-A57.

Ah yes that is it, I'm running AMD Seattle which has 8 Cortex-A57. Sorry
about this

Thanks,
Jean

> 
> Richard: given I'm off work for Christmas now, if Jean-Philippe's
> suggested fix fixes this are you OK with just applying it directly
> to un-break the CI ?
> 
> thanks
> -- PMM

