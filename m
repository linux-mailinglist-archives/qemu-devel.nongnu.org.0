Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364594B383F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 22:46:21 +0100 (CET)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ0Di-0003uG-Sp
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 16:46:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfb1998@web.de>) id 1nJ0CX-00037r-GY
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 16:45:05 -0500
Received: from mout.web.de ([212.227.15.4]:42439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfb1998@web.de>) id 1nJ0CV-0002Sv-24
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 16:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644702279;
 bh=O7CiXCxErqeZ2rgUdctRY8pSmbArLOqJjQrcJy7TA+U=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
 b=qtRimZUJA6zPiyLp5NdUc4+GEJk9D0+zcgjB4d20mMSMH5vXXH0v1bKRONhennNci
 jaSMkvcHHoQN6TJuVFlVPBcJywObhXvPAoGfYoZbyDKP1IsehH56/Z5At0eMgpVGpe
 z6Sfc1oV4IZoTE2R2CHCRrNnbo8SoqFauupnRm1c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [127.0.0.1] ([87.123.193.69]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cLR-1oOZG733rh-015EUa; Sat, 12
 Feb 2022 22:44:38 +0100
Date: Sat, 12 Feb 2022 22:44:35 +0100
From: BB <dfb1998@web.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/5=5D_isa/piix4=3A_Fix_PCI?=
 =?US-ASCII?Q?_IRQ_levels_to_be_preserved_in_VMState?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEAcA_N6cuszzr+Afn2ed47t5tWTaayYqu3Nx2wuR8jVciP_Q@mail.gmail.com>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-5-shentey@gmail.com>
 <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
 <CAFEAcA9BBFHH7eqzB_zW-VDZWuXDEkYUb=P1ocPn_UyaZZFZ3w@mail.gmail.com>
 <c389b3a-bde6-9dae-557b-b8db541d1a@eik.bme.hu>
 <CAFEAcA_N6cuszzr+Afn2ed47t5tWTaayYqu3Nx2wuR8jVciP_Q@mail.gmail.com>
Message-ID: <468417CA-6CD4-40D2-A96B-BACCFF455021@web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dlCDjJWHxgPP+SS7O7IzM0xjqDyFsuJ8wdJbeiVyEFUJaM5izhb
 U6Y/RvSFS6QvFRfXbdbMk52+SIEgPzJTMBKWKTs9r4wGfd13yljZweLYkqB5MDsaxfAGWVR
 2ISYFynuRebpdf1gj7h3yj1FErowO4yao1cHccSEzychk4L1tydHcNlFxMs1oAoM0rOA3GM
 xNJTaPgU3R8Wspru5dfgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F2LBuJBb/DM=:nYpEUOjKT1rkv78j8iN92s
 VicsNq6ZuYZBAZp0vF/AtNbh0gfaAtr0fLjn5Sg5Xe9/HGhxWBQIuSnwJEFBrCPBal9ICWOGs
 sWlcfclIwbC7Xufmej/fFZih9VItYOmkbrwXXj1ZJ7QjePYacQb6uDLx10EOlCTQxmpvviD3j
 EIXGZZR0PSIqBvQ+YFsao0xnomoX0amXryZMc+0lexwTc+PZAhnFqWjoL6V7GXYWq3jpQ5T2V
 En5WTOUAgh2ar3WYqdQZruDd0+TONcgvzGlaUclM2TPKzb5ScJ9frJpM+VubSPZ7HmX1WuQ0B
 VbeZ+J2ZuQ+NtDnVLF8lN275rTVUHHMq+zJoDzUDd5B6aelEAyURhJNtnvGOaUyggvQoB0lku
 625Cy4xnU8Vuq3xbpTXqd+3BWGe1TMvwkuW2G5wy2vP+QclHyQd09suQLKmUFNKiHIoR1NUyv
 7Dib0/jaXyXDgPUpKHt9JicwdSv9gZMqFnLDmrO81AAgX+3Hm3Yfd0ve0D1FrOf2DidmzwAzU
 0h/efiN4BGSdJH1Z126RdclyF10PDJS2QA4FDL286QaL9oULq/UDUn3Wn6LlBBMUFa+StqrZ1
 FBTXLpfVGG0sLG6SeYg35BQHl3Ltj1iBHlUKi3PFQewfkVIzWkFSnAALqXp0NuOaSLDmFfy90
 +65t6GlOd50YH+92DgQRmPksSwNfjjn5cmq6znoLVQGBFWqcmI3VFE+JYzwk4YxJX4y4RODRo
 bGg9qKk3lYB6zfYAtLnsaXM6baRtjiRUKVnIIOn7iIBAWFaQvFZiMQ5ifVw3cS41i+qP3fHVt
 Jsw04dQA+cATOU8mGZbIGojXUwwTCkCYupEddWTd7Be6ivC1dkenG6RuqS3HIeeqPvfklCcAB
 VRmOU6XVFSHbVExexAC6VWPbvyBktCRMvDRH1ShUbxd1ySthuRJONeJEDsk7Ig7+vbw9l+4xO
 bxI54tlU8sGpWSMqKQo33g2oSAja9eoGM9a70+OZlbjX3B8z1wEkNvJjiBfbc3vB65Pth39ci
 q3rpJPQqeJSrNPzyrtJ4c4tYBLDW5CROkNjtPyfTWxlErhOD8z8VQAbne0J5SD7c9baU5c6tn
 L/knLj+y+QhJoM=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=dfb1998@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 12=2E Februar 2022 19:30:43 MEZ schrieb Peter Maydell <peter=2Emaydell@=
linaro=2Eorg>:
>On Sat, 12 Feb 2022 at 17:02, BALATON Zoltan <balaton@eik=2Ebme=2Ehu> wro=
te:
>>
>> On Sat, 12 Feb 2022, Peter Maydell wrote:
>> > On Sat, 12 Feb 2022 at 13:42, BALATON Zoltan <balaton@eik=2Ebme=2Ehu>=
 wrote:
>> >> By the way the corresponding member in struct PIIXState in
>> >> include/hw/southbridge/piix=2Eh has a comment saying:
>> >>
>> >>      /* This member isn't used=2E Just for save/load compatibility *=
/
>> >>      int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>> >>
>> >> and only seems to be filled in piix3_pre_save() but never used=2E So=
 what's
>> >> the point of this then? Maybe piix3 also uses a bitmap to store thes=
e
>> >> levels instead? There's a uint64_t pic_levels member above the unuse=
d
>> >> array but I haven't checked the implementation=2E
>> >
>> > I think what has happened here is that originally piix3 used
>> > the same implementation piix4 currently does -- where it stores
>> > locally the value of the (incoming) PCI IRQ levels, and then when it =
wants
>> > to know the value of the (outgoing) PIC IRQ levels it loops round
>> > to effectively OR together all the PCI IRQ levels for those PCI
>> > IRQs which are configured to that particular PIC interrupt=2E
>> >
>> > Then in commit e735b55a8c11 (in 2011) piix3 was changed to call
>> > pci_bus_get_irq_level() to get the value of a PCI IRQ rather than
>> > looking at its local cache of that information in the pci_irq_levels[=
]
>> > array=2E This is the source of the "save/load compatibility" thing --
>> > before doing a vmsave piix3_pre_save() fills in that field so that
>> > it appears in the outbound data stream and thus a migration from
>> > a new QEMU to an old pre-e735b55a8c11 QEMU will still work=2E (This
>> > was important at the time, but could probably be cleaned up now=2E)
>> >
>> > The next commit after that one is ab431c283e7055bcd, which
>> > is an optimization that fixes the equivalent of the "XXX: optimize"
>> > marker in the gt64120_pci_set_irq()/piix4 code -- this does
>> > something slightly more complicated involving the pic_levels
>> > field, in order to avoid having to do the "loop over all the
>> > PCI IRQ levels" whenever it needs to set/reset a PIC interrupt=2E
>> >
>> > We could pick up one or both (or none!) of these two changes
>> > for the piix4 code=2E (If we're breaking migration compat anyway
>> > we wouldn't need to include the save-load compat part of
>> > the first change=2E)
>>
>> I'm not sure I fully get this=2E Currently (before this series) PIIX4St=
ate
>> does not seem to have any fields to store irq state (in hw/isa/piix4=2E=
c):
>>
>> struct PIIX4State {
>>      PCIDevice dev;
>>      qemu_irq cpu_intr;
>>      qemu_irq *isa;
>>
>>      RTCState rtc;
>>      /* Reset Control Register */
>>      MemoryRegion rcr_mem;
>>      uint8_t rcr;
>> };
>>
>> Patch 1 in this series introduces that by moving it from MaltaState=2E =
Then
>> we could have a patch 2 to clean it up and change to the way piix3 does=
 it
>> and skip introducing the saving of this array into the migration state=
=2E It
>> may still break migration but not sure if MaltaState was saved already =
so
>> this may be already missing from migration anyway and if we do the same=
 as
>> piix3 then maybe we don't need to change the piix4 state either (as thi=
s
>> is saved as part of the PCIHost state?) but I don't know much about thi=
s
>> so maybe I'm wrong=2E
>
>Yeah, that would work -- we weren't saving the old gt64xxx_pci=2Ec
>pci_irq_levels[] global, so we don't break anything that wasn't
>already broken by not putting the newly-introduced PIIX4State
>array into migration state=2E Then when we do the equivalent of
>e735b55a8c11 the array can just be deleted again=2E (We can't
>conveniently switch to using pci_bus_get_irq_level() before doing
>patch 1 of this series, because we need the pointer to the
>piix4 device object and gt64120_pci_set_irq() is only passed
>a pointer directly to a qemu_irq array=2E)
>
>> In any case PIIX3 and PIIX4 state seem to be different so there's no
>> reason to worry aobut compatibility between them=2E
>
>Yep, that's right=2E The only reasons to copy changes from piix3
>are (a) because they're worth having in themselves and (b)
>because having the two devices be the same is maybe less
>confusing=2E (b)'s a pretty weak reason, and (a) depends on
>the individual change=2E In this case I think making the equivalent
>of e735b55a8c11 is worthwhile because it saves us having an
>extra array field and migrating it, and the change is pretty
>small=2E For ab431c283e7055bcd you could argue either way -- it's
>clearly a better way to structure the irq handling, but it's only
>an optimisation, not a bug fix=2E

e735b55a8c11 seems like a very elegant way for fixing migration of the IRQ=
 levels=2E I'll have a look=2E

Regards,
Bernhard
>
>-- PMM

