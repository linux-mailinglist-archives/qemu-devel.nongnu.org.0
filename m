Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C73477047
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:31:17 +0100 (CET)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoyi-0003YY-1G
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:31:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxovr-0001Cg-JK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:28:19 -0500
Received: from [2a00:1450:4864:20::42e] (port=42814
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxovp-0004tm-U8
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:28:19 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c4so43572268wrd.9
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 03:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kj27WNCjr8c1O/pA0rw1f4KbvTOPcbXj/xyS+XrDqIs=;
 b=OsQ2zkJ2M7nYrpLtBUqFMiGwkuyOZVUIb3svBrraQjkb8dxRaPoXfjlNMGOLB7f8yC
 AWAdK0XM6WPIeNMZhcYpU8X2HqwxolUqx2TdY7joRnD0Su34b6WQ9NMsPq3MCRY4YrfQ
 WFBH1eQGs4ecPQhz0djJatSwlTGAHSLoy0v7UgGLozqZ5usMTGWy2huTwx1A2xfj58AZ
 D3eSm3U/cV3bLCwO2Jn6VZzIsRoGH6lFBEFQj6fbqBYIjNgkxLEdZPrVaZRGpVYAS7xU
 KYEsUtQ1NW6RdhesWE/DQLIBVz7n7+h17vuSuxPT4cL01amF7WSaTklplFVB7Tvp9J6R
 owDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kj27WNCjr8c1O/pA0rw1f4KbvTOPcbXj/xyS+XrDqIs=;
 b=MQLhhm7dOCz2gYDcxFGW79iq/j4Vgt7ShwZ9rRAXzd7nAVOoPF20iWSTS3QWkDWnZi
 MdSuJFVOGUgPiIcBWlnT5fTFI8nqP00py8Bk01N8dOZuUI2s89s0oIg6kDhD8dHwGJzE
 8+r46wFNkOxTvxYCDAhY/9y4t2lnVcoEaCtpbQHWXS8RvA9coB9FdgT3ttE9eVayoQ69
 maQhbnqzFkOVVo0c1vNrS5Lq4yHghwZAgJazZulQEirZ88i91P4N919PcnRIIUKn6cGw
 KxozdYuTAxtpIjVFV3PaXkNyGfoVvP53sZuTufOZpuG1rLt8+lL6Rms8xEQr7OVt5Clz
 RW9w==
X-Gm-Message-State: AOAM532zATCh6NrkCSjkQCMFq60MHlOOEF2cfktHngRebmCVvHOIQcVU
 gPbTPRWXQYL1trFKFzRPvrF6/csQLfRzUOU3zcR8wA==
X-Google-Smtp-Source: ABdhPJw0n48stApcTATid54zNsjNMmZWNL3zPDLyobuYf2NaLJYQL6tTy21qILo3VrAXrU0Y+wZ2cEnDG14gGcIOiGk=
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr8100823wrx.2.1639654095889; 
 Thu, 16 Dec 2021 03:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
 <20211215104049.2030475-32-peter.maydell@linaro.org>
 <54ed293c-9f7a-f82d-7a6d-35d51eb45b77@linaro.org>
 <YbsNoEUfJRsqtKmF@myrica>
In-Reply-To: <YbsNoEUfJRsqtKmF@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Dec 2021 11:28:04 +0000
Message-ID: <CAFEAcA_T-_bouEcfxydBmXUts4-rhUW4cb3KU=x-7WRgJM4smA@mail.gmail.com>
Subject: Re: [PULL 31/33] tests/acpi: add test case for VIOT
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

On Thu, 16 Dec 2021 at 09:58, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Wed, Dec 15, 2021 at 04:59:10PM -0800, Richard Henderson wrote:
> > On 12/15/21 2:40 AM, Peter Maydell wrote:
> > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > >
> > > Add two test cases for VIOT, one on the q35 machine and the other on
> > > virt. To test complex topologies the q35 test has two PCIe buses that
> > > bypass the IOMMU (and are therefore not described by VIOT), and two
> > > buses that are translated by virtio-iommu.
> > >
> > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > Message-id: 20211210170415.583179-7-jean-philippe@linaro.org
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >   tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
> > >   1 file changed, 38 insertions(+)
> >
> > I should have been more careful while applying.  The aarch64 host failure
> > for this is not transient as I first assumed:
> >
> > PASS 5 qtest-aarch64/bios-tables-test /aarch64/acpi/virt/oem-fields
> > qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> > Broken pipe
> > ERROR qtest-aarch64/bios-tables-test - too few tests run (expected 6, got 5)
> > make: *** [Makefile.mtest:312: run-test-37] Error 1
>
> I'm guessing adding "tcg_only = true", like all other virt machine tests
> in this file, should work around this, but I don't really understand the
> problem because I can't reproduce it on my aarch64 host (I'm running
> "configure --target-list=aarch64-softmmu" followed by "make -j10
> check-qtest V=1" in a loop)

What host are you testing on? The test case explicitly asks
for "-cpu cortex-a57", so it is only going to work with KVM
on hosts with a Cortex-A57.

Richard: given I'm off work for Christmas now, if Jean-Philippe's
suggested fix fixes this are you OK with just applying it directly
to un-break the CI ?

thanks
-- PMM

