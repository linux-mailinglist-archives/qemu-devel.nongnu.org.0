Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA36AC847
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:38:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDqS-0003kJ-Ry; Mon, 06 Mar 2023 11:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pZDqR-0003jz-2r
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:37:51 -0500
Received: from sonic317-20.consmr.mail.gq1.yahoo.com ([98.137.66.146])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pZDqO-0005Uf-M2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1678120664; bh=jscJplb5dAhrzJhAaIKFFO4fvTL9s8rydBlhGSemTY0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=mUEPmGDxEnqrwX/fK5W6NNFU/Ah4P+rtEv3+X0GrwZ1DTc8t8saSZ+n7m7ZMkSRgsJrSfe2K7Xd2Mr9f4GKbdhLhzvNrqcmfue8Zo9Vy5PIOx1xVrUldytl6La+jHxfkfk5CZRuIdI3UH9HkagEC4J2iCCyRMFsFvEj9kxZPCCSG44laFdrkERZmlOakCZFDOGXelpq+dI5uaxDhCr63Zt6SQlglVTFMfz8J3PjUTZ1V3Io2bGsKeqLIxNYuRKUsAjdhhwVQfKsWHwNDjMAONzre5K2Xr6nXjl8HwZAnNaNBiwakGw1QaFXHflMVSOTnHnGg05jJ1zrC963YAItiSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1678120664; bh=zwIxqlkJDx9p8YNPckXqkqUId+E4KMbk96ouM022yP2=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=kFtP4M4531XZFg74NlyyrW8cRnTaQr6UhTOC7ac/E45RYES6Byuh5I1YCFhVVyrcUrRkUtIMgmZQychr3IYWSPh/e2UWlx/d04qQEYQczPIkOC74EzPe4j1e2C1kP4UYQ9p8iA8pLKjU+Ojl3pAfGHXZkVsRPCP5SWwTxlqLMDQA2/iz+GvszwYtpbZpKYiEnNyW0sqbkslOubAD6UFSvQHkJ7QPJfFUJ2otXiHeLlYaI+eu5J5n+U2hrBspG/yy/bR6nCsB4BX6EMkk/V8B43sjr+3UH4m4srmaoRhh8yBiRARRV3UFJXVXu+j/sfdYwh37ij9mL6bRt+ydX3Udgg==
X-YMail-OSG: cSTstxUVM1kfJbNLEz.TLH3HcHZz5lit5wKjbUqGPqcZYzP.EdWT_zbQA_jamxh
 Cc77GgbAgHe4et.yAfJxrfD6neaZGnah8PLfg98X3fAtCBrqou7UKqtlPyX0zXkwUz.aySitt6U7
 TTXbOCD9BClIDZsDuSzISuKdk8_QlDvsmV6ZpkCJj8zIdF5NtylMuYyxOFGYI8Q6O_f.DDrMM4t2
 1WAMElN1F_hrn0RG.Tzz3kYITwOyICeplkIZRiuAkLPpinefC0G4d8MC4nb43qJXmacZ2oxnMY82
 w6KZnnBtP1Kwsgcz4zO5Ff7OGlJGuBZMBVncM904LNB3ZJiXCDoU1FpWYQaYFciuTTc2BL_N3l.T
 2BT4OJ69NwcwjsVLR89TRH6lfOpXPg2zdlMVkQkjiUYTdkF0QD4zG1WcUoSLN_5M.xsmpc0eZyox
 E_xpxKYDqk4Dn6EqQf17AnSY5pVAkGpnI6USxdnPZerBjaKIi3cHc91Y9CBKvMToJpAbW3hJSPEd
 z_31th13C0tx5UJHm1pokrW1v6r_2eO2hB5.85Kf328DGJv6SUibbcJ8fqe0hU.n0mWAixbunDd9
 PzXV7W8S_cjlslSwl1jb2rNiMGlIIoijBNeqGXG3wvSMKMbns1pH1KD7dvn5Nvq8asirHLGRX4nL
 Jk1.d0P6fvcEVLO7Skt.1Cr_Pq9fESeILXQNvzMtqx77xeWnP1l_n98xM9ZseNOCAEiMHG14XLaS
 VJGBBysGWs7YAR6VbfIMlYyZqIpBJc9bCPrEIQlFy4A5y.xSUe0xNFffV_yOcVX5Nzrg6iOIc7ZH
 D0Ofe_upD8646woGAoiOoecQTfvq9XEr8INOtOzCVe1RisaG_lmQ8K5ZH.CKrtZi4Hhc8lWHBqsw
 7HDO6aP0fzxAXOWwEoWd2yOeSpirHopT8zjbOyGx5HEh4r4b87zcKsQTAzk6u51sw3Y.zdTzoY4E
 hYVmxvvEV4OEpWbhOId7Mirhrj3FmHLBXpotbbl4jiv_Wmu6YrOWIztpYDX8cvJrnlLy5NtRcdui
 0_jNxpESqJIJJfFJPFM1aGJOCTFpZeFIzfrM7CShjBNku4iljs_.1lJSD0VMyZrF35AKub34n8rT
 w2cHiYDvZAW9BcUGB5SH2AtgWhL6LlAxg3SwIcUQrsSe9tH0Z67DIykUG_r1Irs.Fi.ui1cc5Xr7
 2XvxLhS2cIbupbA5pWS2tN_n8xtHCg6lm_hdQIxwIAS7IdjRRUHnXkAhq1FuSmHKufIzhpSne_XQ
 58Q0rrNUnO4rm3kymSa1eGOgJgyzlPMPZKFtDSLW.Sq_ghRP2BD4DUbuXCEKiBxuotY2tc_LHQV6
 utxGZq8ffHJ64ZUXFY3jLOj.jdDtM.pbRVJhGtIRefPCtbu6gXpSsUjMEs1ddc7tIjXRnAFFDG7_
 FUtaCohOrjBhF0AH7H8MJTcfs12KEKNrTpyN9JrvHK8cI1KCAUxWBr.uN8d5RcTppfAJRu6FpDrX
 GI0rHz_TrZxaHOnmE0IFNN8XC3vaOJL5R9kzT0U6osDG4p41acM_D7dec8m.ZFuWDkiBU_TzADQW
 pFUXf_TU5LNwmPGt9fvxxSDpN.iTo_4K5NQTeuupzTOIK5vF1ii5nWG91ozVKoUQIVdyrrecI1F9
 5E0cAnfvU10225vu0JbT0utpdISpLpiRBWvYBb4ZIPzbao4OqTHPU2kxijYmzCiPI4mpLIPfh1vj
 nbvUfyeVpZ2g7QYrEEqVhz2tRw9OWtfYYoajJIO3Eb1p7Qvd_4_ScXkFAA.GJytDcPSkNc5LU_Su
 68NDIV.whstcQkneCzTzP3PDvqxwKz97TOoUDbBQjCd0XTrTCNoRDPzu9r7v_Dz0RgmfB3kmiH4x
 N5nLmE_bGV1Ia85I3_Mbxge3p75umrRulNs3nNfWEnQE4H02nPa56fb_O8xKXkvge1pL0S4smsd1
 YhZ7t308qjb04ETDWxbd8IgtZXJMC77mZ6.yVhf2wm.Bx0YsVZ80N8MuvG1iDqYcXsNdntb4wNrl
 jAEva0_U5XHkcj..DJW6m8GWdBcibWs_X3Tbg993FU0.m...t6uIqAT9OujoOZVin90W312HaLDH
 DHASxAnsSTwO8NePy2PWKU97idzLc7EUd_V2gRHfNhluUe8XTkjwmsH_dUKZCtuAA.haXwafm7VQ
 UVWCvkDGQvF8ZcX.0kOlSKyKyUz900nhiml2CflfLh1Kk.ymdeCtu8mggoO.hEv4XS.J5Rj0HFq9
 8WL4NvWvnbur.
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Mon, 6 Mar 2023 16:37:44 +0000
Received: by hermes--production-ne1-7688d778d7-xvwfp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ef7ee6cdd60e6a19118f47858e6169a0; 
 Mon, 06 Mar 2023 16:37:43 +0000 (UTC)
Message-ID: <4e31b40a-4db5-5cda-7e8c-4ef562fe107e@aol.com>
Date: Mon, 6 Mar 2023 11:37:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Chuck Zmudzinski <brchuckz@aol.com>
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
Content-Language: en-US
In-Reply-To: <2febd48f-c0e4-b5ee-4984-fac257417cef@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21221
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.66.146; envelope-from=brchuckz@aim.com;
 helo=sonic317-20.consmr.mail.gq1.yahoo.com
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

On 1/28/2023 4:58 PM, Mark Cave-Ayland wrote:
> On 28/01/2023 03:39, Chuck Zmudzinski wrote:
>
> > On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
> >> On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> >>> The current reserved slot check in do_pci_register_device(), added with
> >>> commit 8b8849844fd6
> >>
> >> add ("subject here") please
> >>
> >>> ,is done even if the pci device being added is
> >>> configured manually for a particular slot. The new property, when set
> >>> to false, disables the check when the device is configured to request a
> >>> particular slot. This allows an administrator or management tool to
> >>> override slot_reserved_mask for a pci device by requesting a particular
> >>> slot for the device. The new property is initialized to true which
> >>> preserves the existing behavior of slot_reserved_mask by default.
> >>>
> >>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >>
> >> Thanks!
> >> I'm trying to think of the best default for this.

Hi Michael and Mark,

The Xen maintainers pulled up the commit that reserves slot 2
for the Intel IGD with the xenfv machine so we need to discuss
how slot_reserved_mask should work with this change. The original
version of the patch keeps the current default of always enforcing
slot_reserved_mask, even if the administrator tries to configure the
slots manually. So if we keep that behavior, we will need to patch
the xenfv machine again to implement the desired behavior that
slot_reserved_mask will only apply with automatic slot assignment
for the xenfv machine. That would be a fairly trivial one-line patch
to add on top of the patch the Xen maintainers just pulled up.

Another option is to change the default value of
enforce_slot_reserved_mask_manual to false so slot_reserved_mask
only affects automatic slot address assignment by default and then
preserve the current behavior for the sun4u machine by patching the
sun4u machine so the value of enforce_slot_reserved_mask_manual
is true for the sun4u machine.

> > 
> > I think it would be better for the default value of
> > enforce_slot_reserved_mask_manual to be false, so that a
> > user-specified slot will by default override slot_reserved_mask.
> > But doing that would change the current behavior of
> > slot_reserved_mask.
> > 
> > Currently, this is the only place where slot_reserved_mask is used in all
> > of the Qemu source (code from hw/sparc64/sun4u.c):
> > 
> > ------ snip -------
> >      /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
> >         reserved (leaving no slots free after on-board devices) however slots
> >         0-3 are free on busB */
> >      pci_bus->slot_reserved_mask = 0xfffffffc;
> >      pci_busA->slot_reserved_mask = 0xfffffff1;
> >      pci_busB->slot_reserved_mask = 0xfffffff0;
> > ------ snip -------
> > 
> > I think we could safely change the default value of
> > enforce_slot_reserved_mask_manual to false but set
> > it to true for the sparc64 sun4u board here to preserve
> > the current behavior of the only existing board in Qemu
> > that uses slot_reserved_mask.
> > 
> > What do you think?
> > 
> >> Users is trying to configure a specific device on a reserved
> >> slot. Should we
> >> CC a bunch more people for visibility. Input, anyone?
>
> For a bit of background, slot_reserved_mask was added by me to solve a problem with 
> the sun4u machine: on a real Ultra-5, the pci "A" bus has 2 free slots and the pci 
> "B" bus has 4 free slots. Whilst it is possible to plug a PCI device into any slot in 
> QEMU, the PCI bridges only have IRQ mapping registers for those 6 slots, so you can 
> easily end up with an auto-allocated slot where it is impossible for the OS to map 
> the IRQ.
>
> Hence slot_reserved_mask was originally intended to mark slots as being unavailable 
> for both manual and automatic allocation to ensure that devices plugged into both PCI 
> buses would always work.

Here is a third option:

Mark, would it be acceptable to replace the error in the case of manual
allocation with a warning, so manual device assignment to a reserved slot
in the sun4u machine would succeed (automatic assignment would still
prevent the slot from being used) but there would be a warning message
to provide the administrator/user with a clue that the current manual
configuration of the device is not correct and could cause problems?

That would be a less aggressive change that could be implemented without
needing to add the enforce_slot_reserved_mask_manual property to PCIBus.

Also, Michael, I notice that the current usage of slot_reserved_mask violates
the comment at the beginning of pci_bus.h that asks that the properties of
PCIBus such as slot_reserved_mask be accessed via accessor functions in pci.h
instead of directly accessing them. Should I also write v2 of the patch to add
accessor functions for slot_reserved_mask so the accessor functions can be used
instead of accessing slot_reserved_mask directly?

I will wait a little while for some feedback before posting v2 of this patch.

> If there is a need to change/refactor the logic then I can test the sun4u machine to 
> ensure the original test case still works.

Sounds good... Best regards,

Chuck

> ATB,
>
> Mark.


