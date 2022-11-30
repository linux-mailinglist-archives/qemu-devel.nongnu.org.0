Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6963D044
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 09:19:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0IIl-0006sJ-Qu; Wed, 30 Nov 2022 03:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0IIV-0006pw-2a
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:18:34 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0IIS-0005lH-Lm
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:18:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2281B81A66
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78125C433C1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669796300;
 bh=foPDkm3vy3CbVI9fiJHvy0jPfEJymGunau1Uos13ImU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fXUKpazvyWW/+03eRejucSwgZ78hXJbvolj4QHnYFZJsixCP+U2dlNaIYQPac5fCX
 4deS0/Ynjs2lBrh1TvrrqtXEAYcg/GdYpkEwmj7FdqtyrJ8dDdaqOJo45pfhF4Zr6a
 tcSjwh7jPsf0E0+osoA5EutsyCNMO4eX84/0PMp9MJ3RhQUFvpmDm6dmmmiBrvw32g
 zrTnyCeNfSvryVlGGgCKcXS4s7eU+OhWVZQxkElAwgvbiAD5UFY1B66+dNDDouacVU
 KKGVd1ZVsZ5NGeWe3tXVu8d/Qw39pDHxsI6oWg+WWPztzYIvP8zARcnBIu3qHEMCIm
 enmZxUi8ts7iQ==
Received: by mail-lf1-f44.google.com with SMTP id p8so25748316lfu.11
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 00:18:20 -0800 (PST)
X-Gm-Message-State: ANoB5pnsH457nv+VDakCKNEn16BM9xbj4ZeW5J6vuNEugmPwk3tp804t
 A3kHwWsOxthg3jSVJitvSvaU2aG7sLeCFiAT2Cc=
X-Google-Smtp-Source: AA0mqf6mf71YjcrkD0T515UEITJKrwHf0OcE5kkd9NOKk5UuXvJwZuJ0D4Ms3QFHam+6ACC7SR1lCVXjpuJeX5HIk3s=
X-Received: by 2002:a05:6512:3c89:b0:4a2:bfd2:b218 with SMTP id
 h9-20020a0565123c8900b004a2bfd2b218mr20172400lfv.228.1669796298433; Wed, 30
 Nov 2022 00:18:18 -0800 (PST)
MIME-Version: 1.0
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
In-Reply-To: <87r0xkubcp.wl-maz@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Nov 2022 09:18:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
Message-ID: <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
Subject: Re: regression: insmod module failed in VM with nvdimm on
To: Marc Zyngier <maz@kernel.org>
Cc: "chenxiang (M)" <chenxiang66@hisilicon.com>, will@kernel.org,
 mark.rutland@arm.com, 
 linux-arm-kernel@lists.infradead.org, chenxiang via <qemu-devel@nongnu.org>, 
 "linuxarm@huawei.com" <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ardb@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Wed, 30 Nov 2022 at 08:53, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 30 Nov 2022 02:52:35 +0000,
> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
> >
> > Hi,
> >
> > We boot the VM using following commands (with nvdimm on)  (qemu
> > version 6.1.50, kernel 6.0-r4):
>
> How relevant is the presence of the nvdimm? Do you observe the failure
> without this?
>
> >
> > qemu-system-aarch64 -machine
> > virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
> > /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
> > /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
> > 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
> > ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
> > -object memory-backend-ram,id=ram1,size=10G -device
> > nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
> > -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
> >
> > Then in VM we insmod a module, vmalloc error occurs as follows (kernel
> > 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
> >
> > estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
> > [    8.186563] vmap allocation for size 20480 failed: use
> > vmalloc=<size> to increase size
>
> Have you tried increasing the vmalloc size to check that this is
> indeed the problem?
>
> [...]
>
> > We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
> > defer initialization to initcall where permitted").
>
> I guess you mean commit fc5a89f75d2a instead, right?
>
> > Do you have any idea about the issue?
>
> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
> portion of the vmalloc space, but you give very little information
> that could help here...
>

Ouch. I suspect what's going on here: that patch defers the
randomization of the module region, so that we can decouple it from
the very early init code.

Obviously, it is happening too late now, and the randomized module
region is overlapping with a vmalloc region that is in use by the time
the randomization occurs.

Does the below fix the issue?

diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 37a9deed2aec..71fb18b2f304 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -90,4 +90,4 @@ static int __init kaslr_init(void)

        return 0;
 }
-subsys_initcall(kaslr_init)
+arch_initcall(kaslr_init)

