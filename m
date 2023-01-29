Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487067FC8A
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 04:01:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxwQ-0003Bg-2m; Sat, 28 Jan 2023 22:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLxwK-0003BA-LI
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 22:01:12 -0500
Received: from sonic307-8.consmr.mail.gq1.yahoo.com ([98.137.64.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLxwD-0000Ip-H3
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 22:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1674961256; bh=/yWwGvrl9Smom3cVC8YJ4aJE0hU/NGozf/gk7l5AT54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=WQCrwXMDyTmfYE2TpPJMMW00HK5OnyQUHJVpg0fVYcZJa+xrDtmQiT49jt4LNubbeH8esGes4lDfWJ1PajkznU8H6iFCasRAopzO+4SvL3b5qHtZfLmhDUpm9r55hobJlgNxyylOnkSB5WJ4aju4cWXUfJgrU1dswmeoKH12gYX6i/m2tvIM1/n/y7yKn1pCnb04pmhuClcs6jqfNJPi867ORtog7QGnLEGjG84Q7zuUOSCLpghYR8RwWKpotpyth+yFvyvy5sg89ilLxliDSLmiu9L4VFoQA1fjs3tbmQJZxNZ2VwSucKjdw7bvAr2vDzFv9L9X+eapzXkeOrK+rA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1674961256; bh=BTUpfvUvrzVYAqpEf8/Pj7os6kLFTOew8DSaHL8rfyC=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=W1rtk5R3ntXPxXVWvbM6wLEBiiOrYaobO7LEElGaLSqRxXuBhjrAFlXYJQwK1rGoqCXJUDRA40rsY1VSROct5o92ctJwZlanpGNzkKBA4UxqI7sHRWhhtwBgksV9z4QQXg6wg/2w+C1ZP34IGjAQVbxxkJzN8Q4fnFdipapEmHceleIQ9bzMV4n1kivQhSCDX3zT9NFczvRcFJWY7WoyAfBYf9mWwEeursarZKU+j3CONxSO/y7hSkJoaI8dpue5UPytyAZTO+btv6TEDcIPdWvvR1pszISQpuWwttVOd99SHzlQwtRR+C5B+UFByC+MwL1MidzO+JYCfD1R99snmA==
X-YMail-OSG: Qvi9pZcVM1nS6pLeb8QfvjX0Psx2Cj1dhkqBaGj2tGFYFH6weXzQ462JykcknAL
 A9hwEoemdrlvUyHP7S.HGgIPJugl7PEObZwbNBbsg3q1wqfo21t9erlUR0wVode0N6jpUXT6.WIZ
 18eUpOnZMNTY_aQF7FZ8SM3WuJp__CKK4I5OOiOyf50pnFN55DfMs_M.Hq5Hut8dbmmwk_xvJRdc
 BWXSnb9T32T5_nhun25YF9EbjNUwPUh4DK51OfOTw7tBY_PLC3aS0lldGk47UqsB.1JCiFCJ0rCO
 WoEmr9VLJjzU_f69TBqarlazvU4MgRCUZFoNMQXdP6fJJkqok9wbgRHNRIz0atbmK_NxIzB1Obmk
 E.GSbKfTmgP4EeYFknCsTBc1kfKuXjU2iT30O1mIdURkqwCTmLlzEkVF1NSS9bSvuLBETNb9.RE.
 kh5ekksXXpJQvyY4Xid0ckGIuV2wO1qNux4i6CrOo2BNlGayGIbvdZG_iLRu6XO7QwnUhpa9zseZ
 Zym9F4wmgh98wJfAESDkPMbYP25gQJXvSN2IGI6IsUe.ibKdX.2PYdwmOARZGlhIJ6w5ArWwEZv7
 gz4vxcr1.6vFBQLPy_jE2q8HgNnF7V.pCeSmFKa0FtUqExtwVyw7gT_Dbkwpz5Va0BbqSPecpApQ
 xeHzxufLqPsl7O4Zm9Cbc_qi91a9Dj6FWU6FuOpvV0BfbSWKLuRfMmcgwTPVuor3JLdeDFGJqZah
 goX6t58ojkxwiLT_f6e04zjmaM4cfKM42fwj3Go619BE8l2bRUSUlIXvTgivVmhpEhH9YTafoci3
 iUgcKsVPomtjLGwALh0tTUXzse.sKLYZm9eZJyy_eTY66ZRYkjUfzrPtmldwKPS.V3MN1wzOMH28
 fOIdPtnuxj0kajjj58bnj.7DKFMfeJy9N5KM_ob4V_9w2NF.o1nIWgy0_uMc.Tj03HO_4sm8RWTD
 eeK9yfDqGA22I4dfQI4t37MpC4FEhiYPGi_krjv4.sCxDpJ8foQIpQqhH7zw5Zw3mWmwr5GwtCqr
 DQGhQKp7hOaoB2ZwzrieyCdj3UUVBj5CtJJsZe4.NoOh8iozHfwyO41VnlPxYBXvwY6IRV7xAB3V
 4lxIeL_2DGmxLyHW.7myXEhiVv3MjnEwBf6NiWl7y8q36YNqMn7oplMaXM43jf0cAsP25Bm2EUkb
 JS8XoTBHtlEzhioRp3Bql._dRVrGpeunweRtvPlNfc8o6.AIT.X3dMo_XN0JWFMYQuUIPpQ.MHXC
 3a_e.cYjDxdk7zTEDv7P8s8FvWXRgBHAtWIllh58FE37GVCFZa8Sg5ssZOvlMrTeJBDRzJ_NeoBp
 c75oQ9NJnXecrqn3CtztntSL3JJeb7viG0fNsw3WF6kavzKCffoD3ehDEQ53SJunFEZMaF0CRFzA
 ek4vFeYGGQcCUBonaa0nQsHO6Blb23TubmTnkCHVFGbYPhe96gpIR5p_HXvBxbYMXzXOA6Xakij_
 qiUghnGZgo5pVx9NtfG3n5Zk7kyjkGX8GVggqsPpLS9861iN5ftINtBu64G64aqfA1wKLHXmQoc2
 E5rqbDHqeluneTyNnLZ_m.jzNm5C.1LaKU4y7q4zXU9il6AZiIdM8hFHWyEGryZdYyhqedzhGu_R
 QsMw2Du_u9GY9GxRPnQlxRNdyHsGUuyupV.HkEo5FE8gpjTP78gy67YmgNUhqETRRBiyrlrYXa1O
 AVs7G6G.jchL9It2YxZ9kNXpXubtBrTseEGdIVnoJNpdmG2K1R1B5RKyBXnQVu0xuuT.5HlvxmDb
 Hwyxn0AdEbiXRP6ZCPfwDIP2z0T9mkpp5bj0Dx2a7xgQAgmBd2TOXD5pnNC1lVemkpvn9XrdR9NX
 8LRgcARCT8aefE9cbuX9fqjXzLrIAvh6Ztli2wvNbBYBouykfXnzD0TnRkOmwEQWO7DOYRcuFs9J
 df2qBXcbmbf6JLkvO8OQziE0aSWM6Y7wTCmH6wZYJVHH4k.AzPN2mnnPrmuC7aL.4dBtimQ8kEN6
 8BDwDq5T.A0zuAWkfgLqEHDpotOo3LCAOl.KTZxVRsbLFSV_bRzJM0vRWYzpcoRDatnc56I_snsO
 BqVaxj7hz1OMUOByNJDR9qcBPPc41ilPgtHJnDovZGExquJMs8JCQA_nkOwJuZcWM..d9uulUtou
 Yk0kthdRmWBsG0BxLWPr28leH9NGh40kUj.8BgJ6y.I7QgVQ3AAkRMTw11gwGzu9gDOkvIl3C9IU
 nnPZkKutUuzSQ5aYo8Ppz
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Sun, 29 Jan 2023 03:00:56 +0000
Received: by hermes--production-bf1-57c96c66f6-7l94f (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 96d1055007825caca33e5f335e9316a8; 
 Sun, 29 Jan 2023 03:00:51 +0000 (UTC)
Message-ID: <9dc4de19-62e0-26d7-c400-5f720bd9f6dd@aol.com>
Date: Sat, 28 Jan 2023 22:00:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <2febd48f-c0e4-b5ee-4984-fac257417cef@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.64.32; envelope-from=brchuckz@aim.com;
 helo=sonic307-8.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.15,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
>
> If there is a need to change/refactor the logic then I can test the sun4u machine to 
> ensure the original test case still works.
>
>
> ATB,
>
> Mark.

Thanks, I will let you know if there is a patch to test on the
sun4u machine. For now, we are waiting to see if the xen
maintainers will accept a patch that uses slot_reserved_mask
to prevent other devices from using the slot that is required
by the Intel igd in the xenfv machine. That patch does not change
the way slot_reserved_mask works, but if that patch is added
some users might want to add a capability for a user to override
slot_reserved_mask, and that is what this patch attempts to
implement.

Kind regards,

Chuck

