Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEEF6C1D02
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIqC-00067S-HS; Mon, 20 Mar 2023 12:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1peIqA-00066C-1U
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:58:34 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1peIq8-0002RX-DN
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:58:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 337A56144D;
 Mon, 20 Mar 2023 16:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEF2C433D2;
 Mon, 20 Mar 2023 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679331503;
 bh=Q+cQfUughZYgiPet79BPx+rn0a/x/HVLQFtxjfoEteA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YADUlksBNE/O9sN0zMM4i/YAEomFbg0o8NeOPvfGWeBftpOdj2QW34KLG7ziaTY2y
 NFi1WTB5gz8x7twSQzHOOtMCf28LbyVlR8Cc75O97oDdR8Hye6VpyCa/cnBJFvG0gs
 eaUz9C4lhWnwWL+qHR3h9YGIEpO+bjo+QOvt+Ns8VtDi8Vzq7rFXYS4LTawpz5nsrj
 Vqf6jDbRy7qXL2dnxXhSS9nJ6LsnRbp0Xk2H6nKrq3k39dcBCwsIbgy2fDO/YtfFF8
 KRH6JfRjyLNRJLdwTdTZ82VypUK5qhBFnmYukD8K6+dsqYvdH1wwCr6x5KO+e7oRqi
 X6kwr06NCrUZA==
Date: Mon, 20 Mar 2023 09:58:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Rob Landley <rob@landley.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Message-ID: <20230320165821.GA4064187@dev-arch.thelio-3990X>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=nathan@kernel.org;
 helo=dfw.source.kernel.org
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

On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/2/23 17:19, Jiaxun Yang wrote:
> > 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
> > MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
> > accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
> > 
> > However CFGADDR as a ISD internal register is not controled by MByteSwap
> > bit, it follows endian of all other ISD register, which means it ties to
> > little endian.
> > 
> > Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
> > endian-swapping.
> > 
> > This should fix some recent reports about poweroff hang.
> > 
> > Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >   hw/pci-host/gt64120.c | 18 ++++++------------
> >   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> So this works on little-endian hosts, but fails on
> big-endian ones :(
> 
> I.e. on Linux we have early_console_write() -> prom_putchar()
> looping:
> 
> IN: prom_putchar
> 0x8010fab8:  lbu	v0,0(v1)
> 0x8010fabc:  andi	v0,v0,0x20
> 0x8010fac0:  beqz	v0,0x8010fab8
> 0x8010fac4:  andi	v0,a0,0xff
> 
> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
> ...
> 

Is there going to be a new version of this patch or a different solution
to the poweroff hang then? I am still seeing that with tip of tree QEMU
and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
a release version.

Cheers,
Nathan

