Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277A6B6AD2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 20:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbRpj-0005nK-KS; Sun, 12 Mar 2023 15:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pbRph-0005my-DX
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 15:58:17 -0400
Received: from sonic310-21.consmr.mail.gq1.yahoo.com ([98.137.69.147])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pbRpf-0004oC-8L
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 15:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1678651089; bh=98OQJT5u947XHE27ecd8oSH8UFV4uecMHdFqfAe3roY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=h7gdPbPHVoHnnNOigiR1Y2sn6OzEowT3wKb646lIHw8tvBRr8BHP3rR8mtbkAk9TVGIrsEBQ/p9OaXp7cu0wHG9lCcGfcIg2qbCw0oX3BH5UwoSUPljt+kcOxlpGWF95M+biuEyDgIGH51Gxi99vHH1ftaI1g+3xPHASzphBzU4AY2Yz4q5t0GjGEL1mZT0Ttc3mjzc/6Bi3emJh5HFzPAWrSPkRehTv7J1UzW/kpnIGs0vCWaHWVQ799pCfGWHbylIdDjdEB/zpIbX+W3g/qRaFv26m8Hii0Wv2UkDZ15nCTIaNpQaIRzVGfJlZxh0Nx0zt0f3DKSZPvv9moVTIAQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1678651089; bh=U4AQftjy7idaeKYlGfRek9TriLd53muQahf8xbFBRZF=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=VcvG23pxosogsdwqgZ4jBr/52QaLspuUSkWQJla5gJ8iPL/FKlGNQdXNxQv7hrTQXuOXtBknn4dF/Z4uPSNb2TwlvRN6wyDbo3u0uvbPCLS9Z8kt+fPl6C4DHeOIFDUhfzXLCMXOQmey9U/ixsq35QTFg5VlYV0fxEZvGB+r0nvG86G6yYQyXD7yYCenjgGabkuBDRWWKhl4dfmThY/jvmDFAiuxIYMV41eJsW4afomF5H6+JFXZhOZKC55yFq3WGUEsnu21eFsbuUcNSnOrDjFPqzEzocpwIAlcn0//VOK7Prw/1K1rfechTlT5+eOuSOc+kF20TZzRoYwOzVd9hA==
X-YMail-OSG: uhnIR6UVM1m77DtGHU_KegQUttcLUN767qbSIbs_nTHME8VyM73TW5EO30tKN1r
 LJ_hlbuwQ4_B9WFLwhINzVyMoaUM.hGq7vwlTah53GwZvIltOlti0wFko_UylyTAlAE8NSUuzuxz
 wqfE_I0vy6R_v1o2t0n8ckSGPXAElKqWr4VlspB2i7hcjcKSE_8kHo6uCyu0Bvzdy3cO0gN.7kz5
 ZC2ZCAZKHXDXuVyEmCj8uGGQhNIA7bG44axfgR.KhSi0I2llfqTyAoQbOBHAwmMXy35N..JsnQVY
 HaD8owM3aeozEZLExX_Q2X17aVHdJDK1uOVivz2vsNeENr8A.o5GtckADx5f86fxOe5pfMmHFJ4P
 6fs0n7j0JBmh_6ah6WDyVIjk6UH7IHMy4Is6QjKiIZyDHDrH0SmEv8DWRYCuPIskgaYSHQqZ_fze
 D5ZyuhKsQKGRqQIGNUBzAVzdnYXYJ6h7KsDWw8GM6xXLcqJwO11tpan10lP9aiRjXdjeHEiUekBV
 AyGgMfQHUSMfcjodh_i5odfj4kaiDOyp4rfytM3B7qO0C.SSJb1m_xKAnMGrI55nzKcryii381WX
 1742s9FEvXcDteymBFcQQo7ESWn1NmuAayyxL67T3AJJ4d4WFAArlD3J_nuDJjA2pqnEnKwloL3z
 oOIVPjBSOl4apYrsDKZZWqvAVz5Q2PZRDL9kb.R2lYPaLEFG1x17zQZpyt.eL5AthObA2ioyPNdF
 RuV0ZDkIYwTUKxwj6pwY4gNJSXpFU.Snjgip_1btrOy3mvFeFmjPOUmMosoit42C1RvSlDe3ler9
 O.hr_Q_LnadlYtG1YFEn5mgA7vea_EmQaIuUQ._1vB31_XpIEDBcNhM_yv_a7fBcw4ZZ3_vqiLVs
 WyoMQ.v7DVKSoG51tszmKatgyMHCJY4hd1WgOaePrYHKLrqyGsXZh3JY3X2qNqz8vESFa9H2RcUT
 ra3shnvBcsZk3fB_uuNu2niBtmZS4Dw41NK1eAv1frz4noNojJJKKX9L.HxFufQN1IBmeSzzI7CS
 U8yr9N7S2XSixw.TYeO3CnkQzjSUl4.wp5K.bTlnizo4qbGG8m4gsfHsyz272D5VNxDOUZoW4FRn
 1xOK0AlVoe9QWi6_j.LaBe6QMYjKmkgIVLnRcccn3RNp.L0TuJUJqFvV6hw_cn80dehl10SAFaV.
 5AVawne3y06wmnGdd.Jpb3M_p8UocclD0BZYPOl3Bvnj1l8Cba.8nIEbkhPxRUUDsBVFSoANVFbO
 2dGrQb3gsV65Q8ZjX1eOkvqzXpaZm8.FoPjQYj98ckBvjvHpVjIpjOt7089Ne1mYlgisuXk158sD
 hKo4MqlUYTbPkJ0l41u2PnDc9LtiLB7k3UkhZFgbbWOhihORre0858aoHQBxoIrH2Iu5Ti3osXqW
 WMAsRKwH3Ecoy3EpnGRKkBPV3iGPl46D6dqaoEbLpsN81wA9xJE..ra6npG0.0QNZ6aW88ppXDFr
 LS0Vxg1VHjngiOPL7tOM7jCMls2ZbQA8NYbNo1ivGVykRyvzRbq.KT4dGiJypzlJ0x6PJYiXi8g0
 8QFjltalAdvA3BSTtPqY4.5snvo31U9W8eqMOB8GC.kMLHi58UOeC46FYvAsxo0SZwxb7rCe2G5p
 14ztfRL3QxNS4pYLvwrA.wJHUMP6yEoT.Y8d4FTvMmmQZJkAxPWkjf8.dZfkoDxuEyi1KSu2hSBv
 KqrOAFdoUxeBFt5LkYv.aBAU0NfviMFGRIujSuAxDcQw_hL88rlj27MBDReaiHG4yi_5lzAnJ8lz
 0gCIuYZQKCNoSDiD7UjJXhS1IWrLSBrIx8A0623N5ZQAaibmGZrey4u60DQqB.tnT4CVlF5kmx7a
 SOvpXv0MFTZMBo3x0lriERdvHdbSv3LXPi4ND1pv0iNH.Trf8gKul7oUDt14qKBBufOJYA.GuZEZ
 72tZZ1SUA5OAHzoqrhwl6yYQKa9vH.59YvKKtul.Y5iNwZQ5cwFJ5e2vLy3hn53LwQ1XskPCawlk
 0OmiMyBWDjN824OcPLSGKJBMuBTwaajmXOeQ1BGgVLKfWLN2YMXklEeEmBVEx8y0zVnC68x6rrgH
 zmxWjCsHQZh2AM904Tqhu9dWlDk4eJSNuaSNYzpvRhQbgvLMTwOvE3hg0ovFds4HqEcA3HK4pBri
 KdYtMb8CdpxGSUsYuJBlblKlYNVjmLNHqcF7qm_n1U.eCkmOUzRBOSGv4wd.KuTxVDO7lVxB6dWk
 YLo1Gu.uDJN1lHRWhbcLoMiFT9A--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Sun, 12 Mar 2023 19:58:09 +0000
Received: by hermes--production-bf1-777648578f-7gmg8 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 69268eca2a307d9f570b6a9d50917bfa; 
 Sun, 12 Mar 2023 19:58:06 +0000 (UTC)
Message-ID: <cb05ae38-bd59-4483-85c8-8d002d409bf5@aol.com>
Date: Sun, 12 Mar 2023 15:58:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
 <2febd48f-c0e4-b5ee-4984-fac257417cef@ilande.co.uk>
 <4e31b40a-4db5-5cda-7e8c-4ef562fe107e@aol.com>
 <069eeb2b-5198-0bf9-c82c-ebc9beba956e@ilande.co.uk>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <069eeb2b-5198-0bf9-c82c-ebc9beba956e@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21284
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.69.147; envelope-from=brchuckz@aim.com;
 helo=sonic310-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/12/2023 10:13 AM, Mark Cave-Ayland wrote:
> On 06/03/2023 16:37, Chuck Zmudzinski wrote:
>
> > On 1/28/2023 4:58 PM, Mark Cave-Ayland wrote:
> >> On 28/01/2023 03:39, Chuck Zmudzinski wrote:
> >>
> >>> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
> >>>> On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> >>>>> The current reserved slot check in do_pci_register_device(), added with
> >>>>> commit 8b8849844fd6
> >>>>
> >>>> add ("subject here") please
> >>>>
> >>>>> ,is done even if the pci device being added is
> >>>>> configured manually for a particular slot. The new property, when set
> >>>>> to false, disables the check when the device is configured to request a
> >>>>> particular slot. This allows an administrator or management tool to
> >>>>> override slot_reserved_mask for a pci device by requesting a particular
> >>>>> slot for the device. The new property is initialized to true which
> >>>>> preserves the existing behavior of slot_reserved_mask by default.
> >>>>>
> >>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >>>>
> >>>> Thanks!
> >>>> I'm trying to think of the best default for this.
> > 
> > Hi Michael and Mark,
> > 
> > The Xen maintainers pulled up the commit that reserves slot 2
> > for the Intel IGD with the xenfv machine so we need to discuss
> > how slot_reserved_mask should work with this change. The original
> > version of the patch keeps the current default of always enforcing
> > slot_reserved_mask, even if the administrator tries to configure the
> > slots manually. So if we keep that behavior, we will need to patch
> > the xenfv machine again to implement the desired behavior that
> > slot_reserved_mask will only apply with automatic slot assignment
> > for the xenfv machine. That would be a fairly trivial one-line patch
> > to add on top of the patch the Xen maintainers just pulled up.
> > 
> > Another option is to change the default value of
> > enforce_slot_reserved_mask_manual to false so slot_reserved_mask
> > only affects automatic slot address assignment by default and then
> > preserve the current behavior for the sun4u machine by patching the
> > sun4u machine so the value of enforce_slot_reserved_mask_manual
> > is true for the sun4u machine.
> > 
> >>>
> >>> I think it would be better for the default value of
> >>> enforce_slot_reserved_mask_manual to be false, so that a
> >>> user-specified slot will by default override slot_reserved_mask.
> >>> But doing that would change the current behavior of
> >>> slot_reserved_mask.
> >>>
> >>> Currently, this is the only place where slot_reserved_mask is used in all
> >>> of the Qemu source (code from hw/sparc64/sun4u.c):
> >>>
> >>> ------ snip -------
> >>>       /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
> >>>          reserved (leaving no slots free after on-board devices) however slots
> >>>          0-3 are free on busB */
> >>>       pci_bus->slot_reserved_mask = 0xfffffffc;
> >>>       pci_busA->slot_reserved_mask = 0xfffffff1;
> >>>       pci_busB->slot_reserved_mask = 0xfffffff0;
> >>> ------ snip -------
> >>>
> >>> I think we could safely change the default value of
> >>> enforce_slot_reserved_mask_manual to false but set
> >>> it to true for the sparc64 sun4u board here to preserve
> >>> the current behavior of the only existing board in Qemu
> >>> that uses slot_reserved_mask.
> >>>
> >>> What do you think?
> >>>
> >>>> Users is trying to configure a specific device on a reserved
> >>>> slot. Should we
> >>>> CC a bunch more people for visibility. Input, anyone?
> >>
> >> For a bit of background, slot_reserved_mask was added by me to solve a problem with
> >> the sun4u machine: on a real Ultra-5, the pci "A" bus has 2 free slots and the pci
> >> "B" bus has 4 free slots. Whilst it is possible to plug a PCI device into any slot in
> >> QEMU, the PCI bridges only have IRQ mapping registers for those 6 slots, so you can
> >> easily end up with an auto-allocated slot where it is impossible for the OS to map
> >> the IRQ.
> >>
> >> Hence slot_reserved_mask was originally intended to mark slots as being unavailable
> >> for both manual and automatic allocation to ensure that devices plugged into both PCI
> >> buses would always work.
> > 
> > Here is a third option:
> > 
> > Mark, would it be acceptable to replace the error in the case of manual
> > allocation with a warning, so manual device assignment to a reserved slot
> > in the sun4u machine would succeed (automatic assignment would still
> > prevent the slot from being used) but there would be a warning message
> > to provide the administrator/user with a clue that the current manual
> > configuration of the device is not correct and could cause problems?
> > 
> > That would be a less aggressive change that could be implemented without
> > needing to add the enforce_slot_reserved_mask_manual property to PCIBus.
>
> Unfortunately in the sun4u case that doesn't quite work, since the PCI host bridge 
> doesn't have IRQ routing registers for the reserved slots and so the card would still 
> fail with a manual allocation.
>
> In effect the reserved bit in its current implementation means "this slot is 
> unavailable" which is the intended result for the original implementation. Certainly 
> this logic would reduce the changes of creating an unusable setup from the command 
> line, but then some management tools which manually allocates slots would still allow 
> an unusable configuration.

OK, I will not change the current behavior for the sun4u machine.

>
> > Also, Michael, I notice that the current usage of slot_reserved_mask violates
> > the comment at the beginning of pci_bus.h that asks that the properties of
> > PCIBus such as slot_reserved_mask be accessed via accessor functions in pci.h
> > instead of directly accessing them. Should I also write v2 of the patch to add
> > accessor functions for slot_reserved_mask so the accessor functions can be used
> > instead of accessing slot_reserved_mask directly?
> > 
> > I will wait a little while for some feedback before posting v2 of this patch.
>
> Another possibility could be to move the slot validation logic in 
> do_pci_register_device() to a separate function, and add a new slot validation 
> callback to PCIBusClass to be used by do_pci_register_device() instead. By default 
> this would call the existing slot validation logic function.
>
> It would then be possible to override the default slot validation function in the Xen 
> case, perhaps even calling the existing logic first before adding your additional 
> logic requirement on top.
I agree we can keep the default to be the logic that the sun4u machine currently
uses and override it to achieve the desired behavior of the xenfv machine.

Kind regards,

Chuck

>
>
> ATB,
>
> Mark.



